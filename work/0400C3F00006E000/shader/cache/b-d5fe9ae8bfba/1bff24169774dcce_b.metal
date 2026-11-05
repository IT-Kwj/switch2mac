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
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _504 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2442 = as_type<float>(_106);
        out.gl_Position.z = _2442;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2511 = as_type<float>(_144);
        out.gl_Position.z = _2511;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.x;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.y;
    float _162 = in.m_51.w;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _148;
    if (!_158)
    {
        float _180 = _148 * _148;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_158)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_158;
    float _194 = _190;
    float _196 = _146;
    float _198 = _160;
    if (!_192)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _148 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _148);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _228;
    }
    float _230 = _194;
    bool _232 = !_158;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _148 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _178 = _252;
    }
    float _254 = _178;
    out.m_53.x = _146;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_53.y = _160;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _164, _258);
    float _266 = fma(_254, _166, _260);
    float _268 = fma(_254, _168, _262);
    float _270 = fma(_264, _162, _170);
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _274 = fma(_266, _162, _172);
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _278 = fma(_268, _162, _174);
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _282 = _272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _284 = _276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _286 = _280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _288 = !_256;
    int _290 = as_type<int>(_286);
    float _292 = _284;
    float _310;
    if (!_288)
    {
        float _294 = in.m_55.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_90);
        float _316 = 1.0 / _314;
        float _318 = _124 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _324 = _320 + _322;
    bool _326 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _328 = isnan(_320);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _340 = _320 + _338;
    bool _342 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _344 = isnan(_320);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _362 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _364 = isnan(_320);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -_336;
    float _376 = _374 + 1.0;
    float _378 = 1.0 / _360;
    float _380 = _372 * _376;
    float _382 = -_372;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _386;
    float _390 = in.m_51.x;
    float _392 = in.m_51.y;
    float _394 = in.m_51.z;
    bool _396 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _398 = 1.0 / _356;
    float _400 = _352 * _384;
    float _402 = -_352;
    float _404 = _402 + 1.0;
    float _406 = _340 * _378;
    float _408 = _324 * _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _414;
    float _418 = fma(_388, _408, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _420 = fma(_412, _408, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _422 = fma(_416, _408, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _424 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = _418 * _400;
    float _428 = _420 * _400;
    float _430 = _422 * _400;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _444 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[123].x, _426);
    float _446 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[123].y, _428);
    float _448 = fma(_434, _406, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _450 = fma(_438, _406, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _452 = fma(_442, _406, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _454 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[123].z, _430);
    float _456 = fma(_448, _380, _444);
    float _458 = fma(_450, _380, _446);
    float _460 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = fma(_452, _380, _454);
    float _464 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[125].x, _456);
    float _466 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[125].y, _458);
    float _468 = _394 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _470 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[125].z, _462);
    float _472 = _464 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _474 = _466 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _476 = _470 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _478 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _480 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _484 = !_396;
    float _502;
    if (!_484)
    {
        float _486 = in.m_55.x;
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _490 = _486 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _494 = _492 * _488;
        float _496 = floor(_494);
        float _498 = -_496;
        float _500 = _494 + _498;
        _502 = _500;
        _504 = true;
    }
    else
    {
        float _506 = float(_90);
        float _508 = 1.0 / _506;
        float _510 = _124 * _508;
        _502 = _510;
    }
    _504 = false;
    float _512 = _502;
    float _514 = in.m_55.x;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _518 = _512 + _516;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _522 = _520 != 0;
    float _524 = in.m_55.y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _530 = in.m_55.z;
    float _532 = 1.0 / _528;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _544 = _542 != 0;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _560 = 1.0 / _550;
    float _562 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _566 = -_546;
    float _568 = fma(_562, 2.0, _566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _570;
    float _574 = 1.0 / _554;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _580 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _586 = _572 * _532;
    float _588 = (*spvDescriptorSet0.vp_c8)._m0[32].y * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _590 = 1.0 / _578;
    float _592 = _524 * 2.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _598 = 1.0 / _558;
    float _600 = _530 * 2.0;
    float _602 = _584 * _574;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _620 = floor(_600);
    float _622 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _624;
    float _628 = _610 * _560;
    float _630 = fma(_622, -2.0, _564);
    float _632 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _580);
    float _634 = 1.0 / _596;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _638 = _618 * _590;
    float _640 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _588);
    float _642 = _514 + _530;
    float _644 = _606 * _598;
    float _646 = floor(_592);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _652 = _514 * 2.0;
    bool _654 = _620 > 0.0;
    float _656 = _642 + (-1.0);
    bool _658 = _620 >= 0.0;
    bool _660 = isnan(_620);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    float _668 = _514 + _524;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _672 = 1.0 / _650;
    float _674 = _614 * _634;
    float _676 = fma((*spvDescriptorSet0.vp_c8)._m0[32].z, (*spvDescriptorSet0.vp_c8)._m0[32].z, _640);
    float _678 = fma(_644, _518, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _680 = floor(_652);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _686 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _632);
    float _688 = _524 + _530;
    float _690 = _626 * _672;
    float _692 = _666 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _696 = _688 + (-1.0);
    float _698 = _668 + (-1.0);
    float _700 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _702 = ~as_type<int>(_692);
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _710 = _706;
    float _712 = _692;
    int _714 = as_type<int>(_514);
    if (!_654)
    {
        int _716 = ~as_type<int>(_692);
        int _718 = _716 + 1;
        _710 = _718;
    }
    int _720 = _710;
    float _722 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_522)
    {
        _712 = _514;
    }
    float _724 = _712;
    float _726 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _728 = _724;
    if (!_522)
    {
        _728 = _530;
    }
    float _730 = _728;
    float _732 = rsqrt(_686);
    float _734 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _726);
    bool _736 = _680 >= 0.0;
    bool _738 = isnan(_680);
    bool _740 = _736 || _738;
    bool _742 = isnan(0.0);
    bool _744 = _740 || _742;
    float _746 = _730 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _748 = _646 > 0.0;
    float _750 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _752 = _680 > 0.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _756 = _512 + _754;
    int _758 = _744 ? 0 : 1;
    float _760 = -_636;
    float _762 = fma(_746, 2.0, _760);
    bool _764 = _646 >= 0.0;
    bool _766 = isnan(_646);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _776 = _512 + _774;
    float _778 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _780 = fma(_602, _756, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _782 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _734);
    float _784 = fma(_586, _776, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _786 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _778);
    float _788 = _778;
    float _790 = _786;
    if (!_522)
    {
        _788 = _524;
    }
    float _792 = _788;
    float _794 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _796 = _772 ? 0 : 1;
    float _798 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _786);
    float _800 = _792;
    if (_522)
    {
        _800 = _514;
    }
    float _802 = _800;
    float _804 = -_794;
    float _806 = _804 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _808 = ~_796;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _798 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _816 = _812;
    float _818 = _806;
    if (!_748)
    {
        int _820 = ~_796;
        int _822 = _820 + 1;
        _816 = _822;
    }
    int _824 = _816;
    float _826 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _828 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _830 = log2(_828);
    float _832 = _826;
    if (!_522)
    {
        _790 = _530;
    }
    float _834 = _790;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _814 + _836;
    float _840 = -_670;
    float _842 = fma(_826, 2.0, _840);
    float _844 = _834;
    float _846 = _838;
    if (_522)
    {
        _844 = _524;
    }
    float _848 = _844;
    float _850 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].z, _684);
    if (!_522)
    {
        _832 = _530;
    }
    float _852 = _832;
    float _854 = _732 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _856 = _852;
    if (_522)
    {
        _856 = _524;
    }
    float _858 = _856;
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[83].w, _682);
    float _862 = abs(_838);
    float _864 = abs(_806);
    float _866 = precise::max(_862, _864);
    float _868 = _854 * (-0.15915493667125701904296875);
    int _870 = ~_758;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    float _876 = _858 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _878 = _874;
    if (!_752)
    {
        int _880 = ~_758;
        int _882 = _880 + 1;
        _878 = _882;
    }
    int _884 = _878;
    float _886 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _850);
    bool _888 = _866 >= 16.0;
    float _890 = fma(_876, -2.0, _694);
    bool _892 = !_536;
    float _894 = _892 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _896 = _830 * _124;
    bool _898 = !_544;
    int _900 = _898 ? 0 : 1;
    int _902 = abs(as_type<int>(_894));
    float _904 = _894;
    if (_522)
    {
        _904 = _524;
    }
    float _906 = _904;
    float _908 = exp2(_896);
    float _910 = _906;
    if (!_522)
    {
        _910 = _514;
    }
    float _912 = _910;
    bool _914 = !_540;
    int _916 = _914 ? 0 : 1;
    if (_888)
    {
        float _918 = _838 * 0.0625;
        _846 = _918;
    }
    float _920 = _846;
    int _922 = abs(_900);
    float _924 = _912 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _926 = abs(_916);
    if (_888)
    {
        float _928 = _806 * 0.0625;
        _818 = _928;
    }
    float _930 = _818;
    float _932 = float(_922);
    float _934 = fma(_924, -2.0, _708);
    float _936 = float(_824);
    float _938 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _890);
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _942 = float(_902);
    float _944 = -_908;
    float _946 = _944 + 1.0;
    float _948 = float(_720);
    float _950 = _932 * _936;
    float _952 = float(_926);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _956 = 1.0 + _954;
    float _958 = float(_884);
    float _960 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[88].w, _940);
    bool _962 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _970 = _966 || _968;
    float _972 = _942 * _948;
    float _974 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _630);
    float _976 = _952 * _958;
    float _978 = _970 ? _946 : 0.0;
    float _980 = -_124;
    float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[86].x, _762);
    float _984 = 1.0 / _956;
    float _986 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _860);
    float _988 = _972 * (-2.0);
    float _990 = _950 * (-2.0);
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _996 = isnan(1.0);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1002 = _998 || _1000;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1006 = fma(_722, _988, _722);
    float _1008 = fma(_700, _990, _700);
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1012 = in.m_57.x;
    float _1014 = in.m_57.y;
    float _1016 = in.m_57.z;
    float _1018 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].w, _992);
    float _1020 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1004);
    float _1022 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1010);
    float _1024 = -_124;
    float _1026 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[76].x, _568);
    float _1028 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1018);
    float _1030 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1020);
    float _1032 = _514 + (-0.5);
    float _1034 = -_124;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[81].x, _842);
    bool _1038 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1040 = isnan(_512);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = _530 + (-0.5);
    float _1052 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1022);
    float _1054 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _960);
    float _1056 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _934);
    bool _1058 = _1002;
    if (_1002)
    {
        float _1060 = _978 * _984;
        _128 = _1060;
    }
    float _1062 = _128;
    float _1064 = _868 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _1070 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1072 = isnan(_512);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -_1048;
    float _1084 = _1082 + 1.0;
    float _1086 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1088 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1090 = isnan(_512);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1006, _1062, _1068);
    bool _1102 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1104 = isnan(_512);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = _868 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1080 * _1084;
    float _1120 = -_1080;
    float _1122 = _1120 + 1.0;
    float _1124 = fma(_1008, _1062, _1086);
    bool _1126 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1128 = isnan(_512);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -_1098;
    float _1140 = _1138 + 1.0;
    bool _1142 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1144 = isnan(_512);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1112;
    float _1156 = _1154 + 1.0;
    float _1158 = _1098 * _1122;
    float _1160 = _1136 * _1140;
    float _1162 = -_1136;
    float _1164 = _1162 + 1.0;
    float _1166 = _1014 + 0.100000001490116119384765625;
    float _1168 = _1152 * _1156;
    float _1170 = _1066 * _1016;
    bool _1172 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1174 = isnan(_512);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _1112 * _1164;
    float _1186 = -_1152;
    float _1188 = _1186 + 1.0;
    float _1190 = -_1170;
    float _1192 = fma(_1116, _1166, _1190);
    float _1194 = abs(_920);
    bool _1196 = _1194 != 0.0;
    bool _1198 = isnan(_1194);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    float _1206 = -_1182;
    float _1208 = _1206 + 1.0;
    float _1210 = _1182 * _1188;
    float _1212 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _514);
    float _1214 = _1192 + (-0.100000001490116119384765625);
    bool _1216 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1218 = isnan(_512);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1224 = _1220 || _1222;
    int _1226 = _1224 ? 1065353216 : 0;
    float _1228 = _1100 * 0.15915493667125701904296875;
    float _1230 = abs(_930);
    bool _1232 = _1230 == 0.0;
    bool _1234 = !_1204;
    bool _1236 = _1232 && _1234;
    float _1238 = _1214 + _1212;
    float _1240 = _976 * (-2.0);
    float _1242 = as_type<float>(_1226) * _1208;
    float _1244 = _1228 * 6.283185482025146484375;
    float _1246 = sin(_1244);
    float _1248 = _1238 * 8.0;
    float _1250 = _1124 * 0.15915493667125701904296875;
    float _1252 = abs(_930);
    bool _1254 = _1252 == 0.0;
    float _1256 = _784 * _1242;
    float _1258 = fma(_750, _1240, _750);
    float _1260 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _524);
    float _1262 = -as_type<float>(_1226);
    float _1264 = _1262 + 1.0;
    float _1266 = _1228 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    int _1270 = _1226;
    int _1272 = as_type<int>(_1258);
    if (_1236)
    {
        bool _1274 = as_type<int>(_930) >= 0;
        _1058 = _1274;
    }
    bool _1276 = _1058;
    float _1278 = _1214 + _1260;
    float _1280 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1256);
    int _1282 = _1276 ? (-1) : 0;
    bool _1284 = _1276;
    if (_1236)
    {
        int _1286 = _1276 ? 0 : 1078530011;
        _1270 = _1286;
    }
    int _1288 = _1270;
    float _1290 = _1278 * 10.0;
    float _1292 = _1250 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    float _1296 = _1248 * 0.15915493667125701904296875;
    float _1298 = _524 + (-0.5);
    float _1300 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1302 = _1296 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = fma(_1258, _1062, _1300);
    if (_1236)
    {
        int _1308 = int(0x80000000) & as_type<int>(_920);
        int _1310 = _1288 | _1308;
        _1272 = _1310;
    }
    int _1312 = _1272;
    bool _1314 = !_1204;
    bool _1316 = _1314 && _1254;
    int _1318 = _1312;
    float _1320 = as_type<float>(_1312);
    if (!_1316)
    {
        float _1322 = abs(_920);
        bool _1324 = _1322 != as_type<float>(0x7f800000u /* inf */);
        bool _1326 = isnan(_1322);
        bool _1328 = _1324 || _1326;
        bool _1330 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1332 = _1328 || _1330;
        float _1334 = abs(_930);
        bool _1336 = _1334 == as_type<float>(0x7f800000u /* inf */);
        float _1338 = abs(_930);
        bool _1340 = _1338 == as_type<float>(0x7f800000u /* inf */);
        bool _1342 = !_1332;
        bool _1344 = _1340 && _1342;
        if (_1344)
        {
            bool _1346 = as_type<int>(_930) >= 0;
            _1282 = _1346 ? (-1) : 0;
        }
        int _1348 = _1282;
        _1284 = _1348 != 0;
        if (_1344)
        {
            _1318 = 1075235812;
        }
        int _1350 = _1318;
        int _1352 = _1350;
        if (_1344)
        {
            int _1354 = ~_1348;
            int _1356 = (_1354 != 0) ? _1350 : 1061752795;
            _1352 = _1356;
        }
        int _1358 = _1352;
        float _1360 = as_type<float>(_1358);
        if (_1344)
        {
            int _1362 = int(0x80000000) & as_type<int>(_920);
            int _1364 = _1358 | _1362;
            _1360 = as_type<float>(_1364);
        }
        float _1366 = _1360;
        bool _1368 = !_1332;
        bool _1370 = _1368 && _1336;
        _1320 = _1366;
        if (!_1370)
        {
            float _1372 = abs(_920);
            float _1374 = abs(_930);
            float _1376 = precise::max(_1372, _1374);
            float _1378 = abs(_920);
            float _1380 = abs(_930);
            float _1382 = precise::min(_1378, _1380);
            float _1384 = 1.0 / _1376;
            float _1386 = abs(_920);
            float _1388 = abs(_930);
            bool _1390 = _1386 > _1388;
            bool _1392 = as_type<int>(_930) >= 0;
            float _1394 = _1382 * _1384;
            float _1396 = _1394 * _1394;
            float _1398 = _1396 + 11.33538818359375;
            float _1400 = fma(_1396, -0.82336294651031494140625, -5.674867153167724609375);
            float _1402 = fma(_1396, _1398, 28.84246826171875);
            float _1404 = fma(_1396, _1400, -6.565555095672607421875);
            float _1406 = fma(_1396, _1402, 19.6966705322265625);
            float _1408 = _1396 * _1404;
            float _1410 = abs(_920);
            float _1412 = abs(_930);
            float _1414 = _1410 + _1412;
            int _1416 = as_type<int>(_920) & int(0x80000000);
            float _1418 = _1394 * _1408;
            float _1420 = 1.0 / _1406;
            bool _1422 = _1414 > as_type<float>(0x7f800000u /* inf */);
            bool _1424 = isnan(_1414);
            bool _1426 = _1422 || _1424;
            bool _1428 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1430 = _1426 || _1428;
            float _1432 = fma(_1418, _1420, _1394);
            float _1434 = _1432;
            _1320 = _1414;
            _1284 = _1392;
            if (_1390)
            {
                float _1436 = -_1432;
                float _1438 = _1436 + 1.57079637050628662109375;
                _1434 = _1438;
            }
            float _1440 = _1434;
            int _1442 = as_type<int>(_1440);
            if (!_1392)
            {
                float _1444 = -_1440;
                float _1446 = _1444 + 3.1415927410125732421875;
                _1442 = as_type<int>(_1446);
            }
            int _1448 = _1442;
            if (!_1430)
            {
                int _1450 = _1416 | _1448;
                _1320 = as_type<float>(_1450);
            }
        }
    }
    float _1452 = _1320;
    bool _1454 = _1284;
    float _1456 = in.m_59.x;
    float _1458 = _1290 * 0.15915493667125701904296875;
    float _1460 = -_1452;
    float _1462 = _1306 + _1460;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1466 = _512 + _1464;
    float _1468 = fma(_780, _1210, _1280);
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1472 = _512 + _1470;
    float _1474 = _1462 * 0.15915493667125701904296875;
    float _1476 = fma(_628, _1466, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1478 = fma(_678, _1168, _1468);
    float _1480 = fma(_674, _1472, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1484 = _512 + _1482;
    float _1486 = fma(_1476, _1184, _1478);
    float _1488 = _1116 * _1016;
    float _1490 = _1474 * 6.283185482025146484375;
    float _1492 = sin(_1490);
    float _1494 = fma(_638, _1484, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1496 = fma(_1480, _1160, _1486);
    float _1498 = fma(_854, -0.100000001490116119384765625, 0.100000001490116119384765625);
    float _1500 = _854 * 0.0500000007450580596923828125;
    float _1502 = fma(_1066, _1166, _1488);
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1506 = _512 + _1504;
    float _1508 = _1474 * 6.283185482025146484375;
    float _1510 = cos(_1508);
    float _1512 = fma(_1494, _1158, _1496);
    float _1514 = _1498 * _1456;
    float _1516 = fma(_1500, _1456, _1214);
    float _1518 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1520 = fma(_690, _1506, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1522 = fma(_1304, _1514, _1012);
    float _1524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1516);
    float _1526 = _1250 * 6.283185482025146484375;
    float _1528 = sin(_1526);
    float _1530 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1522);
    float _1534 = _1524 * _1518;
    float _1536 = fma(_1520, _1118, _1512);
    float _1538 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1540 = _1532 * _1530;
    float _1542 = _1294 * _1534;
    float _1544 = _1458 * 6.283185482025146484375;
    float _1546 = sin(_1544);
    float _1548 = _1268 * _1492;
    float _1550 = _1246 * _1510;
    float _1552 = _1246 * _1542;
    float _1554 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1536);
    float _1556 = _1246 * _1492;
    float _1558 = _1510 * _1294;
    float _1560 = _1492 * _1294;
    float _1562 = rsqrt(_676);
    float _1564 = -_1548;
    float _1566 = fma(_1528, _1550, _1564);
    float _1568 = -_1534;
    float _1570 = _1528 * _1568;
    float _1572 = _1554 * 0.3499999940395355224609375;
    float _1574 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1576 = fma(_1566, _1540, _1552);
    float _1578 = _1268 * _1510;
    float _1580 = fma(_1558, _1540, _1570);
    float _1582 = fma(_1546, _1514, _1502);
    float _1584 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1574);
    float _1586 = fma(_1528, _1556, _1578);
    float _1588 = _1268 * _1542;
    float _1590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1582);
    float _1592 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1584);
    float _1594 = fma(_1528, _1578, _1556);
    float _1596 = -_1550;
    float _1598 = fma(_1528, _1548, _1596);
    float _1600 = _1590 * _1538;
    float _1602 = _1562 * _1572;
    float _1604 = _1592 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1606 = fma(_1594, _1540, _1588);
    float _1608 = fma(_1586, _1600, _1576);
    float _1610 = fma(_1560, _1600, _1580);
    float _1612 = _1456 * _1602;
    float _1614 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1616 = _794 + _1608;
    float _1618 = _814 + _1610;
    float _1620 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1622 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1614);
    float _1624 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1616);
    float _1626 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1618);
    float _1628 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1620);
    float _1630 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1622);
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1634 = _1624 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1626 + _1636;
    bool _1640 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1642 = isnan(0.5);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1648 = _1644 || _1646;
    float _1650 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1652 = _1634 * _1634;
    float _1654 = fma(_1598, _1600, _1606);
    float _1656 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1628);
    float _1658 = 1.0 / _1650;
    float _1660 = fma(_1638, _1638, _1652);
    float _1662 = _1604 + _1654;
    float _1664 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1666 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1662);
    float _1668 = _1664 + _1650;
    float _1670 = sqrt(_1660);
    float _1672 = _1662;
    float _1674 = _1600;
    float _1676 = _1548;
    float _1678 = _1598;
    float _1680 = _1660;
    float _1682 = 0.100000001490116119384765625;
    bool _1684 = _1454;
    float _1686 = 0.5;
    if (_1648)
    {
        _1672 = 1.0;
    }
    float _1688 = _1672;
    float _1690 = _1668 * _1658;
    float _1692 = _1690 * 0.5;
    bool _1694 = _1670 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = _1670;
    float _1698 = _1688;
    if (!_1694)
    {
        _1674 = _1626;
    }
    float _1700 = _1674;
    float _1702 = _1700;
    if (!_1694)
    {
        _1676 = _1624;
    }
    float _1704 = _1676;
    float _1706 = _1704;
    if (!_1694)
    {
        _1678 = _1666;
    }
    float _1708 = _1678;
    bool _1710 = !_1694;
    float _1712 = _1708;
    if (!_1710)
    {
        float _1714 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1718 = _1670 + _1716;
        float _1720 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = rsqrt(_1660);
        float _1724 = _1718 * _1714;
        float _1726 = _1724 * 0.15915493667125701904296875;
        float _1728 = _1726 * 6.283185482025146484375;
        float _1730 = cos(_1728);
        float _1732 = _1726 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = _1730 + (-1.0);
        float _1738 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1740 = fma(_1734, _1720, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1742 = fma(_1666, _1730, _1738);
        float _1744 = _1722 * _1740;
        float _1746 = fma(_1638, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1748 = fma(_1634, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1712 = _1742;
        _1702 = _1746;
        _1706 = _1748;
        _1696 = _1718;
        _1680 = _1722;
    }
    float _1750 = _1712;
    float _1752 = _1702;
    float _1754 = _1706;
    float _1756 = _1696;
    float _1758 = _1680;
    float _1760 = _1756;
    float _1762 = _1758;
    if (!_1648)
    {
        float _1764 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1766 = _1764 * 0.15915493667125701904296875;
        float _1768 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1772 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1770);
        float _1774 = _1766 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        float _1778 = _1768 * 0.15915493667125701904296875;
        float _1780 = _1766 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        float _1784 = 1.0 / _1776;
        float _1786 = _1778 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = _1782 * _1784;
        float _1792 = _1778 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1798 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1796;
        float _1800 = _1788 * _1790;
        float _1802 = 1.0 / _1772;
        float _1804 = 1.0 / _1800;
        float _1806 = 1.0 / _1798;
        float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1810 = _1802 * _1808;
        float _1812 = _1794 * _1804;
        float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1816 = fma(_1812, _1810, _1814);
        float _1818 = _1816 * _1806;
        float _1820 = precise::clamp(_1818, 0.0, 1.0);
        _1760 = _1804;
        _1762 = _1800;
        _1698 = _1820;
    }
    float _1822 = _1760;
    float _1824 = _1762;
    float _1826 = _1698;
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1830 = _1750 + _1828;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1834 = _1752 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1838 = _1754 + _1836;
    float _1840 = _1830 * _1830;
    float _1842 = fma(_1834, _1834, _1840);
    float _1844 = fma(_1838, _1838, _1842);
    float _1846 = rsqrt(_1844);
    float _1848 = sqrt(_1844);
    float _1850 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1852 = _1834 * _1850;
    float _1854 = _1838 * _1850;
    float _1856 = _1852 * _1852;
    float _1858 = _1854 * _1854;
    float _1860 = _1856 + _1858;
    float _1862 = sqrt(_1860);
    bool _1864 = _1862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1868 = _1862 + _1866;
    float _1870 = _1846;
    float _1872 = _1868;
    float _1874 = _1822;
    float _1876 = _1830;
    float _1878 = _1850;
    if (_1864)
    {
        float _1880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1880;
    }
    float _1882 = _1870;
    float _1884 = _1882;
    if (_1864)
    {
        float _1886 = _1868 * _1882;
        _1872 = _1886;
    }
    float _1888 = _1872;
    if (_1864)
    {
        float _1890 = rsqrt(_1860);
        _1884 = _1890;
    }
    float _1892 = _1884;
    float _1894 = _1892;
    if (_1864)
    {
        float _1896 = _1888 * 0.15915493667125701904296875;
        _1874 = _1896;
    }
    float _1898 = _1874;
    float _1900 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1902 = _1838;
    float _1904 = _1898;
    if (_1864)
    {
        float _1906 = _1898 * 6.283185482025146484375;
        float _1908 = sin(_1906);
        _1902 = _1908;
    }
    float _1910 = _1902;
    float _1912 = precise::max(0.0, _1900);
    float _1914 = _1824;
    float _1916 = _1912;
    if (_1864)
    {
        float _1918 = _1898 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = -_1850;
    float _1926 = -_1912;
    float _1928 = fma(_1830, _1924, _1926);
    if (_1864)
    {
        float _1930 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1930;
    }
    float _1932 = _1876;
    float _1934 = _1910;
    float _1936 = _1932;
    if (_1864)
    {
        float _1938 = fma(_1910, _1932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1934 = _1938;
    }
    float _1940 = _1934;
    float _1942 = _1940;
    if (!_1864)
    {
        _1936 = _1854;
    }
    float _1944 = _1936;
    float _1946 = _1944;
    if (!_1864)
    {
        _1904 = _1856;
    }
    float _1948 = _1904;
    float _1950 = _1948;
    if (_1864)
    {
        float _1952 = _1892 * _1940;
        _1682 = _1952;
    }
    float _1954 = _1682;
    if (!_1864)
    {
        _1894 = _1852;
    }
    float _1956 = _1894;
    float _1958 = _1956;
    if (_1864)
    {
        float _1960 = _1922 + (-1.0);
        _1916 = _1960;
    }
    float _1962 = _1916;
    float _1964 = _1962;
    if (_1864)
    {
        float _1966 = _1852 * _1954;
        _1958 = _1966;
    }
    float _1968 = _1958;
    if (!_1864)
    {
        _1942 = _1928;
    }
    float _1970 = _1942;
    float _1972 = _1970;
    if (_1864)
    {
        float _1974 = _1854 * _1954;
        _1946 = _1974;
    }
    float _1976 = _1946;
    if (_1864)
    {
        float _1978 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1978;
    }
    float _1980 = _1878;
    if (_1864)
    {
        float _1982 = _1968 * _1968;
        _1950 = _1982;
    }
    float _1984 = _1950;
    if (!_1864)
    {
        _1964 = _1858;
    }
    float _1986 = _1964;
    float _1988 = _1986;
    if (_1864)
    {
        float _1990 = _1976 * _1976;
        _1988 = _1990;
    }
    float _1992 = _1988;
    if (_1864)
    {
        float _1994 = fma(_1928, _1922, _1980);
        _1972 = _1994;
    }
    float _1996 = _1972;
    float _1998 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2000 = fma(_1996, _1996, _1984);
    float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2004 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2002);
    float _2006 = precise::clamp(_2004, 0.0, 1.0);
    float _2008 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1998);
    float _2010 = _2000 + _1992;
    float _2012 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2014 = -_2006;
    float _2016 = _2014 + 1.0;
    float _2018 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2020 = rsqrt(_2010);
    float _2022 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2008);
    float _2024 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2026 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2012);
    float _2028 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2030 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2032 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2024);
    float _2034 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2026);
    float _2036 = abs(_2016);
    float _2038 = log2(_2036);
    float _2040 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2028);
    float _2042 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2032);
    float _2044 = _2034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2046 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2048 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2040);
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2052 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2054 = _2020 * _1968;
    float _2056 = _2020 * _1996;
    float _2058 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2052);
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = _2020 * _1976;
    float _2066 = -_2046;
    float _2068 = fma(_2066, _2018, 1.0);
    float _2070 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2060);
    float _2072 = -_2062;
    float _2074 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2072);
    float _2076 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2078 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2070);
    float _2080 = -_2064;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2074);
    float _2084 = exp2(_2076);
    float _2086 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2088 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2090 = fma(_2082, -0.5, 0.5);
    float _2092 = _2056 + 1.0;
    float _2094 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2086);
    float _2096 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2088);
    float _2098 = log2(_2068);
    float _2100 = fma(_2082, 0.5, 0.5);
    float _2102 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2104 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2096);
    float _2106 = fma(_2100, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2108 = 1.0 / _2078;
    float _2110 = -_2056;
    float _2112 = fma(_2084, _2092, _2110);
    float _2114 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2102);
    float _2116 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2118 = fma(_2100, _2106, -0.212114393711090087890625);
    float _2120 = sqrt(_2090);
    float _2122 = _2098 * 0.693147182464599609375;
    float _2124 = fma(_2100, _2118, 1.570728778839111328125);
    float _2126 = fma(_2112, 0.5, 0.5);
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2130 = _2114 * _2108;
    float _2132 = _2116 * _2108;
    float _2134 = fma(_2130, 0.5, 0.5);
    float _2136 = fma(_2132, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float _2140 = -_2124;
    float _2142 = fma(_2138, _2140, 1.0);
    float3 _5655 = float3(_2134, _2136, _2128);
    float _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5655, float3(0.0), isnan(_5655)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5655, float3(0.0), isnan(_5655)), level(0.0)).x;
    float3 _5666 = float3(_2134, _2136, _2128);
    float4 _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5666, float3(0.0), isnan(_5666)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5666, float3(0.0), isnan(_5666)), level(0.0)).xyzw;
    float _2149 = _2147.x;
    float _2151 = _2147.y;
    float _2153 = _2147.z;
    float _2155 = _2147.w;
    float2 _5683 = float2(_2142, _2126);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5683, float2(0.0), isnan(_5683)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5683, float2(0.0), isnan(_5683)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = in.m_55.w;
    float _2169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2171 = _524 > 0.5;
    float _2173 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2177 = _2175 != 0;
    out.m_61.x = _282;
    out.m_61.y = _284;
    out.m_61.z = _286;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2181 = _2179 != 0;
    float _2183 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2185 = _530 > 0.5;
    float _2187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2191 = _2189 != 0;
    float _2193 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2197 = _2195 != 0;
    out.m_63.x = _478;
    out.m_63.y = _480;
    out.m_63.z = _482;
    float _2199 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2193);
    float _2201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_2177)
    {
        bool _2203 = _514 > 0.5;
        _1684 = _2203;
    }
    bool _2205 = _1684;
    if (_2177)
    {
        float _2207 = -_146;
        float _2209 = _2207 + 1.0;
        _714 = as_type<int>(_2209);
    }
    int _2211 = _714;
    if (!_2177)
    {
        _1686 = _146;
    }
    float _2213 = _1686;
    float _2215 = _2213;
    if (_2181)
    {
        float _2217 = -_146;
        float _2219 = _2217 + 1.0;
        _290 = as_type<int>(_2219);
    }
    int _2221 = _290;
    if (!_2181)
    {
        _292 = _146;
    }
    float _2223 = _292;
    float _2225 = _2223;
    if (_2177)
    {
        float _2227 = _2205 ? as_type<float>(_2211) : _146;
        _2215 = _2227;
    }
    float _2229 = _2215;
    float _2231 = -_160;
    float _2233 = _2231 + 1.0;
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2237 = _2235 != 0;
    float _2239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2243 = _2241 != 0;
    float _2245 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2247 = _2171 ? _2233 : _160;
    bool _2249 = _524 > 0.5;
    bool _2251 = _2249 && _2237;
    float _2253 = _2169 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2255 = _2247;
    if (_2181)
    {
        float _2257 = _2185 ? as_type<float>(_2221) : _146;
        _2225 = _2257;
    }
    float _2259 = _2225;
    float _2261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2263 = _2167 > 0.5;
    float _2265 = fma(_2253, _2229, -0.5);
    int _2267 = _2185 ? as_type<int>(_2233) : as_type<int>(_160);
    float _2269 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2271 = _2197 ? _2247 : _160;
    float _2273 = fma(_1052, _2265, _1026);
    float _2275 = _2191 ? as_type<float>(_2267) : _160;
    float _2277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_2237)
    {
        _2255 = _146;
    }
    float _2279 = _2255;
    float _2281 = _2279;
    if (_2251)
    {
        float _2283 = -_146;
        float _2285 = _2283 + 1.0;
        _196 = _2285;
    }
    float _2287 = _196;
    if (_2243)
    {
        float _2289 = _2263 ? _2233 : _160;
        _198 = _2289;
    }
    float _2291 = _198;
    float _2293 = fma(_2275, _2245, -0.5);
    float _2295 = _2239 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2297 = fma(_2269, _2271, -0.5);
    if (_2237)
    {
        _2281 = _2287;
    }
    float _2299 = _2281;
    float _2301 = exp2(_2173);
    float _2303 = _2261 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2305 = fma(_2295, _2259, -0.5);
    float _2307 = -_974;
    float _2309 = fma(_1028, _2297, _2307);
    float _2311 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2199);
    float _2313 = fma(_2303, _2291, -0.5);
    float _2315 = fma(_886, _2305, _1036);
    float _2317 = _2309 + 0.5;
    float _2319 = _2277 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2321 = -_938;
    float _2323 = fma(_986, _2313, _2321);
    float _2325 = _2315 + 0.5;
    bool _2327 = _1826 > 0.0;
    bool _2329 = isnan(_1826);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan(0.0);
    bool _2335 = _2331 || _2333;
    float _2337 = fma(_2319, _2299, -0.5);
    float _2339 = _2273 + 0.5;
    float _2341 = _2323 + 0.5;
    float _2343 = -_1056;
    float _2345 = fma(_1054, _2293, _2343);
    float _2347 = -_2301;
    float _2349 = _2347 + 1.0;
    float _2351 = fma(_1030, _2337, _982);
    float _2353 = _1826 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_65.x = _2339;
    out.m_65.y = _2317;
    out.m_65.z = _2325;
    out.m_65.w = _2341;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2357 = _2351 + 0.5;
    float _2359 = _2311 + _2078;
    float _2361 = _2345 + 0.5;
    float _2363 = -_2355;
    float _2365 = _2363 + 1.0;
    float _2367 = _2359 * 0.5;
    float _2369 = _2353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2357;
    out.m_67.y = _2361;
    out.gl_Position.x = _2114;
    out.gl_Position.y = _2116;
    out.gl_Position.z = _2311;
    out.gl_Position.w = _2078;
    out.m_69.z = _2367;
    out.m_69.w = _2078;
    out.m_45.x = _2369;
    float _2371 = _2355 * _2144;
    float _2373 = _2155 * _2365;
    float _2375 = _2155 * _2371;
    float _2377 = _2165 * _2371;
    float _2379 = fma(_2161, _2375, _2149);
    float _2381 = fma(_2163, _2375, _2151);
    float _2383 = fma(_2155, _2377, _2153);
    out.m_71.x = _2379;
    out.m_71.y = _2381;
    out.m_71.z = _2383;
    out.m_71.w = _2373;
    if (_2335)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2385 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2385;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _504 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2442 = as_type<float>(_106);
        out.gl_Position.z = _2442;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2511 = as_type<float>(_144);
        out.gl_Position.z = _2511;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_49.x;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.y;
    float _162 = in.m_51.w;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _148;
    if (!_158)
    {
        float _180 = _148 * _148;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_158)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_158;
    float _194 = _190;
    float _196 = _146;
    float _198 = _160;
    if (!_192)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _148 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _148);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _228;
    }
    float _230 = _194;
    bool _232 = !_158;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _148 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _178 = _252;
    }
    float _254 = _178;
    out.m_53.x = _146;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_53.y = _160;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _164, _258);
    float _266 = fma(_254, _166, _260);
    float _268 = fma(_254, _168, _262);
    float _270 = fma(_264, _162, _170);
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _274 = fma(_266, _162, _172);
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _278 = fma(_268, _162, _174);
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _282 = _272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _284 = _276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _286 = _280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _288 = !_256;
    int _290 = as_type<int>(_286);
    float _292 = _284;
    float _310;
    if (!_288)
    {
        float _294 = in.m_55.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_90);
        float _316 = 1.0 / _314;
        float _318 = _124 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _324 = _320 + _322;
    bool _326 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _328 = isnan(_320);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _340 = _320 + _338;
    bool _342 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _344 = isnan(_320);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _362 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _364 = isnan(_320);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -_336;
    float _376 = _374 + 1.0;
    float _378 = 1.0 / _360;
    float _380 = _372 * _376;
    float _382 = -_372;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _386;
    float _390 = in.m_51.x;
    float _392 = in.m_51.y;
    float _394 = in.m_51.z;
    bool _396 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _398 = 1.0 / _356;
    float _400 = _352 * _384;
    float _402 = -_352;
    float _404 = _402 + 1.0;
    float _406 = _340 * _378;
    float _408 = _324 * _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _414;
    float _418 = fma(_388, _408, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _420 = fma(_412, _408, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _422 = fma(_416, _408, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _424 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = _418 * _400;
    float _428 = _420 * _400;
    float _430 = _422 * _400;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _444 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[123].x, _426);
    float _446 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[123].y, _428);
    float _448 = fma(_434, _406, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _450 = fma(_438, _406, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _452 = fma(_442, _406, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _454 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[123].z, _430);
    float _456 = fma(_448, _380, _444);
    float _458 = fma(_450, _380, _446);
    float _460 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = fma(_452, _380, _454);
    float _464 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[125].x, _456);
    float _466 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[125].y, _458);
    float _468 = _394 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _470 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[125].z, _462);
    float _472 = _464 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _474 = _466 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _476 = _470 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _478 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _480 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _484 = !_396;
    float _502;
    if (!_484)
    {
        float _486 = in.m_55.x;
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _490 = _486 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _494 = _492 * _488;
        float _496 = floor(_494);
        float _498 = -_496;
        float _500 = _494 + _498;
        _502 = _500;
        _504 = true;
    }
    else
    {
        float _506 = float(_90);
        float _508 = 1.0 / _506;
        float _510 = _124 * _508;
        _502 = _510;
    }
    _504 = false;
    float _512 = _502;
    float _514 = in.m_55.x;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _518 = _512 + _516;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _522 = _520 != 0;
    float _524 = in.m_55.y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _530 = in.m_55.z;
    float _532 = 1.0 / _528;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _544 = _542 != 0;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _560 = 1.0 / _550;
    float _562 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _566 = -_546;
    float _568 = fma(_562, 2.0, _566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _570;
    float _574 = 1.0 / _554;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _580 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _586 = _572 * _532;
    float _588 = (*spvDescriptorSet0.vp_c8)._m0[32].y * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _590 = 1.0 / _578;
    float _592 = _524 * 2.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _598 = 1.0 / _558;
    float _600 = _530 * 2.0;
    float _602 = _584 * _574;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _620 = floor(_600);
    float _622 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _624;
    float _628 = _610 * _560;
    float _630 = fma(_622, -2.0, _564);
    float _632 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _580);
    float _634 = 1.0 / _596;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _638 = _618 * _590;
    float _640 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _588);
    float _642 = _514 + _530;
    float _644 = _606 * _598;
    float _646 = floor(_592);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _652 = _514 * 2.0;
    bool _654 = _620 > 0.0;
    float _656 = _642 + (-1.0);
    bool _658 = _620 >= 0.0;
    bool _660 = isnan(_620);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    float _668 = _514 + _524;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _672 = 1.0 / _650;
    float _674 = _614 * _634;
    float _676 = fma((*spvDescriptorSet0.vp_c8)._m0[32].z, (*spvDescriptorSet0.vp_c8)._m0[32].z, _640);
    float _678 = fma(_644, _518, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _680 = floor(_652);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _686 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _632);
    float _688 = _524 + _530;
    float _690 = _626 * _672;
    float _692 = _666 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _696 = _688 + (-1.0);
    float _698 = _668 + (-1.0);
    float _700 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _702 = ~as_type<int>(_692);
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _710 = _706;
    float _712 = _692;
    int _714 = as_type<int>(_514);
    if (!_654)
    {
        int _716 = ~as_type<int>(_692);
        int _718 = _716 + 1;
        _710 = _718;
    }
    int _720 = _710;
    float _722 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_522)
    {
        _712 = _514;
    }
    float _724 = _712;
    float _726 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _728 = _724;
    if (!_522)
    {
        _728 = _530;
    }
    float _730 = _728;
    float _732 = rsqrt(_686);
    float _734 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _726);
    bool _736 = _680 >= 0.0;
    bool _738 = isnan(_680);
    bool _740 = _736 || _738;
    bool _742 = isnan(0.0);
    bool _744 = _740 || _742;
    float _746 = _730 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _748 = _646 > 0.0;
    float _750 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _752 = _680 > 0.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _756 = _512 + _754;
    int _758 = _744 ? 0 : 1;
    float _760 = -_636;
    float _762 = fma(_746, 2.0, _760);
    bool _764 = _646 >= 0.0;
    bool _766 = isnan(_646);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _776 = _512 + _774;
    float _778 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _780 = fma(_602, _756, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _782 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _734);
    float _784 = fma(_586, _776, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _786 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _778);
    float _788 = _778;
    float _790 = _786;
    if (!_522)
    {
        _788 = _524;
    }
    float _792 = _788;
    float _794 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _796 = _772 ? 0 : 1;
    float _798 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _786);
    float _800 = _792;
    if (_522)
    {
        _800 = _514;
    }
    float _802 = _800;
    float _804 = -_794;
    float _806 = _804 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _808 = ~_796;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _798 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _816 = _812;
    float _818 = _806;
    if (!_748)
    {
        int _820 = ~_796;
        int _822 = _820 + 1;
        _816 = _822;
    }
    int _824 = _816;
    float _826 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _828 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _830 = log2(_828);
    float _832 = _826;
    if (!_522)
    {
        _790 = _530;
    }
    float _834 = _790;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _814 + _836;
    float _840 = -_670;
    float _842 = fma(_826, 2.0, _840);
    float _844 = _834;
    float _846 = _838;
    if (_522)
    {
        _844 = _524;
    }
    float _848 = _844;
    float _850 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].z, _684);
    if (!_522)
    {
        _832 = _530;
    }
    float _852 = _832;
    float _854 = _732 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _856 = _852;
    if (_522)
    {
        _856 = _524;
    }
    float _858 = _856;
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[83].w, _682);
    float _862 = abs(_838);
    float _864 = abs(_806);
    float _866 = precise::max(_862, _864);
    float _868 = _854 * (-0.15915493667125701904296875);
    int _870 = ~_758;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    float _876 = _858 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _878 = _874;
    if (!_752)
    {
        int _880 = ~_758;
        int _882 = _880 + 1;
        _878 = _882;
    }
    int _884 = _878;
    float _886 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _850);
    bool _888 = _866 >= 16.0;
    float _890 = fma(_876, -2.0, _694);
    bool _892 = !_536;
    float _894 = _892 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _896 = _830 * _124;
    bool _898 = !_544;
    int _900 = _898 ? 0 : 1;
    int _902 = abs(as_type<int>(_894));
    float _904 = _894;
    if (_522)
    {
        _904 = _524;
    }
    float _906 = _904;
    float _908 = exp2(_896);
    float _910 = _906;
    if (!_522)
    {
        _910 = _514;
    }
    float _912 = _910;
    bool _914 = !_540;
    int _916 = _914 ? 0 : 1;
    if (_888)
    {
        float _918 = _838 * 0.0625;
        _846 = _918;
    }
    float _920 = _846;
    int _922 = abs(_900);
    float _924 = _912 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _926 = abs(_916);
    if (_888)
    {
        float _928 = _806 * 0.0625;
        _818 = _928;
    }
    float _930 = _818;
    float _932 = float(_922);
    float _934 = fma(_924, -2.0, _708);
    float _936 = float(_824);
    float _938 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _890);
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _942 = float(_902);
    float _944 = -_908;
    float _946 = _944 + 1.0;
    float _948 = float(_720);
    float _950 = _932 * _936;
    float _952 = float(_926);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _956 = 1.0 + _954;
    float _958 = float(_884);
    float _960 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[88].w, _940);
    bool _962 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _970 = _966 || _968;
    float _972 = _942 * _948;
    float _974 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _630);
    float _976 = _952 * _958;
    float _978 = _970 ? _946 : 0.0;
    float _980 = -_124;
    float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[86].x, _762);
    float _984 = 1.0 / _956;
    float _986 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _860);
    float _988 = _972 * (-2.0);
    float _990 = _950 * (-2.0);
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _996 = isnan(1.0);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1002 = _998 || _1000;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1006 = fma(_722, _988, _722);
    float _1008 = fma(_700, _990, _700);
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1012 = in.m_57.x;
    float _1014 = in.m_57.y;
    float _1016 = in.m_57.z;
    float _1018 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].w, _992);
    float _1020 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1004);
    float _1022 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1010);
    float _1024 = -_124;
    float _1026 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[76].x, _568);
    float _1028 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1018);
    float _1030 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1020);
    float _1032 = _514 + (-0.5);
    float _1034 = -_124;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[81].x, _842);
    bool _1038 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1040 = isnan(_512);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = _530 + (-0.5);
    float _1052 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1022);
    float _1054 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _960);
    float _1056 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _934);
    bool _1058 = _1002;
    if (_1002)
    {
        float _1060 = _978 * _984;
        _128 = _1060;
    }
    float _1062 = _128;
    float _1064 = _868 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _1070 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1072 = isnan(_512);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -_1048;
    float _1084 = _1082 + 1.0;
    float _1086 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1088 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1090 = isnan(_512);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1006, _1062, _1068);
    bool _1102 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1104 = isnan(_512);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = _868 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1080 * _1084;
    float _1120 = -_1080;
    float _1122 = _1120 + 1.0;
    float _1124 = fma(_1008, _1062, _1086);
    bool _1126 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1128 = isnan(_512);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -_1098;
    float _1140 = _1138 + 1.0;
    bool _1142 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1144 = isnan(_512);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1112;
    float _1156 = _1154 + 1.0;
    float _1158 = _1098 * _1122;
    float _1160 = _1136 * _1140;
    float _1162 = -_1136;
    float _1164 = _1162 + 1.0;
    float _1166 = _1014 + 0.100000001490116119384765625;
    float _1168 = _1152 * _1156;
    float _1170 = _1066 * _1016;
    bool _1172 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1174 = isnan(_512);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _1112 * _1164;
    float _1186 = -_1152;
    float _1188 = _1186 + 1.0;
    float _1190 = -_1170;
    float _1192 = fma(_1116, _1166, _1190);
    float _1194 = abs(_920);
    bool _1196 = _1194 != 0.0;
    bool _1198 = isnan(_1194);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    float _1206 = -_1182;
    float _1208 = _1206 + 1.0;
    float _1210 = _1182 * _1188;
    float _1212 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _514);
    float _1214 = _1192 + (-0.100000001490116119384765625);
    bool _1216 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1218 = isnan(_512);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1224 = _1220 || _1222;
    int _1226 = _1224 ? 1065353216 : 0;
    float _1228 = _1100 * 0.15915493667125701904296875;
    float _1230 = abs(_930);
    bool _1232 = _1230 == 0.0;
    bool _1234 = !_1204;
    bool _1236 = _1232 && _1234;
    float _1238 = _1214 + _1212;
    float _1240 = _976 * (-2.0);
    float _1242 = as_type<float>(_1226) * _1208;
    float _1244 = _1228 * 6.283185482025146484375;
    float _1246 = sin(_1244);
    float _1248 = _1238 * 8.0;
    float _1250 = _1124 * 0.15915493667125701904296875;
    float _1252 = abs(_930);
    bool _1254 = _1252 == 0.0;
    float _1256 = _784 * _1242;
    float _1258 = fma(_750, _1240, _750);
    float _1260 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _524);
    float _1262 = -as_type<float>(_1226);
    float _1264 = _1262 + 1.0;
    float _1266 = _1228 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    int _1270 = _1226;
    int _1272 = as_type<int>(_1258);
    if (_1236)
    {
        bool _1274 = as_type<int>(_930) >= 0;
        _1058 = _1274;
    }
    bool _1276 = _1058;
    float _1278 = _1214 + _1260;
    float _1280 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1256);
    int _1282 = _1276 ? (-1) : 0;
    bool _1284 = _1276;
    if (_1236)
    {
        int _1286 = _1276 ? 0 : 1078530011;
        _1270 = _1286;
    }
    int _1288 = _1270;
    float _1290 = _1278 * 10.0;
    float _1292 = _1250 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    float _1296 = _1248 * 0.15915493667125701904296875;
    float _1298 = _524 + (-0.5);
    float _1300 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1302 = _1296 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = fma(_1258, _1062, _1300);
    if (_1236)
    {
        int _1308 = int(0x80000000) & as_type<int>(_920);
        int _1310 = _1288 | _1308;
        _1272 = _1310;
    }
    int _1312 = _1272;
    bool _1314 = !_1204;
    bool _1316 = _1314 && _1254;
    int _1318 = _1312;
    float _1320 = as_type<float>(_1312);
    if (!_1316)
    {
        float _1322 = abs(_920);
        bool _1324 = _1322 != as_type<float>(0x7f800000u /* inf */);
        bool _1326 = isnan(_1322);
        bool _1328 = _1324 || _1326;
        bool _1330 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1332 = _1328 || _1330;
        float _1334 = abs(_930);
        bool _1336 = _1334 == as_type<float>(0x7f800000u /* inf */);
        float _1338 = abs(_930);
        bool _1340 = _1338 == as_type<float>(0x7f800000u /* inf */);
        bool _1342 = !_1332;
        bool _1344 = _1340 && _1342;
        if (_1344)
        {
            bool _1346 = as_type<int>(_930) >= 0;
            _1282 = _1346 ? (-1) : 0;
        }
        int _1348 = _1282;
        _1284 = _1348 != 0;
        if (_1344)
        {
            _1318 = 1075235812;
        }
        int _1350 = _1318;
        int _1352 = _1350;
        if (_1344)
        {
            int _1354 = ~_1348;
            int _1356 = (_1354 != 0) ? _1350 : 1061752795;
            _1352 = _1356;
        }
        int _1358 = _1352;
        float _1360 = as_type<float>(_1358);
        if (_1344)
        {
            int _1362 = int(0x80000000) & as_type<int>(_920);
            int _1364 = _1358 | _1362;
            _1360 = as_type<float>(_1364);
        }
        float _1366 = _1360;
        bool _1368 = !_1332;
        bool _1370 = _1368 && _1336;
        _1320 = _1366;
        if (!_1370)
        {
            float _1372 = abs(_920);
            float _1374 = abs(_930);
            float _1376 = precise::max(_1372, _1374);
            float _1378 = abs(_920);
            float _1380 = abs(_930);
            float _1382 = precise::min(_1378, _1380);
            float _1384 = 1.0 / _1376;
            float _1386 = abs(_920);
            float _1388 = abs(_930);
            bool _1390 = _1386 > _1388;
            bool _1392 = as_type<int>(_930) >= 0;
            float _1394 = _1382 * _1384;
            float _1396 = _1394 * _1394;
            float _1398 = _1396 + 11.33538818359375;
            float _1400 = fma(_1396, -0.82336294651031494140625, -5.674867153167724609375);
            float _1402 = fma(_1396, _1398, 28.84246826171875);
            float _1404 = fma(_1396, _1400, -6.565555095672607421875);
            float _1406 = fma(_1396, _1402, 19.6966705322265625);
            float _1408 = _1396 * _1404;
            float _1410 = abs(_920);
            float _1412 = abs(_930);
            float _1414 = _1410 + _1412;
            int _1416 = as_type<int>(_920) & int(0x80000000);
            float _1418 = _1394 * _1408;
            float _1420 = 1.0 / _1406;
            bool _1422 = _1414 > as_type<float>(0x7f800000u /* inf */);
            bool _1424 = isnan(_1414);
            bool _1426 = _1422 || _1424;
            bool _1428 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1430 = _1426 || _1428;
            float _1432 = fma(_1418, _1420, _1394);
            float _1434 = _1432;
            _1320 = _1414;
            _1284 = _1392;
            if (_1390)
            {
                float _1436 = -_1432;
                float _1438 = _1436 + 1.57079637050628662109375;
                _1434 = _1438;
            }
            float _1440 = _1434;
            int _1442 = as_type<int>(_1440);
            if (!_1392)
            {
                float _1444 = -_1440;
                float _1446 = _1444 + 3.1415927410125732421875;
                _1442 = as_type<int>(_1446);
            }
            int _1448 = _1442;
            if (!_1430)
            {
                int _1450 = _1416 | _1448;
                _1320 = as_type<float>(_1450);
            }
        }
    }
    float _1452 = _1320;
    bool _1454 = _1284;
    float _1456 = in.m_59.x;
    float _1458 = _1290 * 0.15915493667125701904296875;
    float _1460 = -_1452;
    float _1462 = _1306 + _1460;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1466 = _512 + _1464;
    float _1468 = fma(_780, _1210, _1280);
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1472 = _512 + _1470;
    float _1474 = _1462 * 0.15915493667125701904296875;
    float _1476 = fma(_628, _1466, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1478 = fma(_678, _1168, _1468);
    float _1480 = fma(_674, _1472, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1484 = _512 + _1482;
    float _1486 = fma(_1476, _1184, _1478);
    float _1488 = _1116 * _1016;
    float _1490 = _1474 * 6.283185482025146484375;
    float _1492 = sin(_1490);
    float _1494 = fma(_638, _1484, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1496 = fma(_1480, _1160, _1486);
    float _1498 = fma(_854, -0.100000001490116119384765625, 0.100000001490116119384765625);
    float _1500 = _854 * 0.0500000007450580596923828125;
    float _1502 = fma(_1066, _1166, _1488);
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1506 = _512 + _1504;
    float _1508 = _1474 * 6.283185482025146484375;
    float _1510 = cos(_1508);
    float _1512 = fma(_1494, _1158, _1496);
    float _1514 = _1498 * _1456;
    float _1516 = fma(_1500, _1456, _1214);
    float _1518 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1520 = fma(_690, _1506, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1522 = fma(_1304, _1514, _1012);
    float _1524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1516);
    float _1526 = _1250 * 6.283185482025146484375;
    float _1528 = sin(_1526);
    float _1530 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1522);
    float _1534 = _1524 * _1518;
    float _1536 = fma(_1520, _1118, _1512);
    float _1538 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1540 = _1532 * _1530;
    float _1542 = _1294 * _1534;
    float _1544 = _1458 * 6.283185482025146484375;
    float _1546 = sin(_1544);
    float _1548 = _1268 * _1492;
    float _1550 = _1246 * _1510;
    float _1552 = _1246 * _1542;
    float _1554 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1536);
    float _1556 = _1246 * _1492;
    float _1558 = _1510 * _1294;
    float _1560 = _1492 * _1294;
    float _1562 = rsqrt(_676);
    float _1564 = -_1548;
    float _1566 = fma(_1528, _1550, _1564);
    float _1568 = -_1534;
    float _1570 = _1528 * _1568;
    float _1572 = _1554 * 0.3499999940395355224609375;
    float _1574 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1576 = fma(_1566, _1540, _1552);
    float _1578 = _1268 * _1510;
    float _1580 = fma(_1558, _1540, _1570);
    float _1582 = fma(_1546, _1514, _1502);
    float _1584 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1574);
    float _1586 = fma(_1528, _1556, _1578);
    float _1588 = _1268 * _1542;
    float _1590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1582);
    float _1592 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1584);
    float _1594 = fma(_1528, _1578, _1556);
    float _1596 = -_1550;
    float _1598 = fma(_1528, _1548, _1596);
    float _1600 = _1590 * _1538;
    float _1602 = _1562 * _1572;
    float _1604 = _1592 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1606 = fma(_1594, _1540, _1588);
    float _1608 = fma(_1586, _1600, _1576);
    float _1610 = fma(_1560, _1600, _1580);
    float _1612 = _1456 * _1602;
    float _1614 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1616 = _794 + _1608;
    float _1618 = _814 + _1610;
    float _1620 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1622 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1614);
    float _1624 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1616);
    float _1626 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1618);
    float _1628 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1620);
    float _1630 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1622);
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1634 = _1624 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1626 + _1636;
    bool _1640 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1642 = isnan(0.5);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1648 = _1644 || _1646;
    float _1650 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1652 = _1634 * _1634;
    float _1654 = fma(_1598, _1600, _1606);
    float _1656 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1628);
    float _1658 = 1.0 / _1650;
    float _1660 = fma(_1638, _1638, _1652);
    float _1662 = _1604 + _1654;
    float _1664 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1666 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1662);
    float _1668 = _1664 + _1650;
    float _1670 = sqrt(_1660);
    float _1672 = _1662;
    float _1674 = _1600;
    float _1676 = _1548;
    float _1678 = _1598;
    float _1680 = _1660;
    float _1682 = 0.100000001490116119384765625;
    bool _1684 = _1454;
    float _1686 = 0.5;
    if (_1648)
    {
        _1672 = 1.0;
    }
    float _1688 = _1672;
    float _1690 = _1668 * _1658;
    float _1692 = _1690 * 0.5;
    bool _1694 = _1670 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = _1670;
    float _1698 = _1688;
    if (!_1694)
    {
        _1674 = _1626;
    }
    float _1700 = _1674;
    float _1702 = _1700;
    if (!_1694)
    {
        _1676 = _1624;
    }
    float _1704 = _1676;
    float _1706 = _1704;
    if (!_1694)
    {
        _1678 = _1666;
    }
    float _1708 = _1678;
    bool _1710 = !_1694;
    float _1712 = _1708;
    if (!_1710)
    {
        float _1714 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1718 = _1670 + _1716;
        float _1720 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = rsqrt(_1660);
        float _1724 = _1718 * _1714;
        float _1726 = _1724 * 0.15915493667125701904296875;
        float _1728 = _1726 * 6.283185482025146484375;
        float _1730 = cos(_1728);
        float _1732 = _1726 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = _1730 + (-1.0);
        float _1738 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1740 = fma(_1734, _1720, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1742 = fma(_1666, _1730, _1738);
        float _1744 = _1722 * _1740;
        float _1746 = fma(_1638, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1748 = fma(_1634, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1712 = _1742;
        _1702 = _1746;
        _1706 = _1748;
        _1696 = _1718;
        _1680 = _1722;
    }
    float _1750 = _1712;
    float _1752 = _1702;
    float _1754 = _1706;
    float _1756 = _1696;
    float _1758 = _1680;
    float _1760 = _1756;
    float _1762 = _1758;
    if (!_1648)
    {
        float _1764 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1766 = _1764 * 0.15915493667125701904296875;
        float _1768 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1772 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1770);
        float _1774 = _1766 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        float _1778 = _1768 * 0.15915493667125701904296875;
        float _1780 = _1766 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        float _1784 = 1.0 / _1776;
        float _1786 = _1778 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = _1782 * _1784;
        float _1792 = _1778 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1798 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1796;
        float _1800 = _1788 * _1790;
        float _1802 = 1.0 / _1772;
        float _1804 = 1.0 / _1800;
        float _1806 = 1.0 / _1798;
        float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1810 = _1802 * _1808;
        float _1812 = _1794 * _1804;
        float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1816 = fma(_1812, _1810, _1814);
        float _1818 = _1816 * _1806;
        float _1820 = precise::clamp(_1818, 0.0, 1.0);
        _1760 = _1804;
        _1762 = _1800;
        _1698 = _1820;
    }
    float _1822 = _1760;
    float _1824 = _1762;
    float _1826 = _1698;
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1830 = _1750 + _1828;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1834 = _1752 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1838 = _1754 + _1836;
    float _1840 = _1830 * _1830;
    float _1842 = fma(_1834, _1834, _1840);
    float _1844 = fma(_1838, _1838, _1842);
    float _1846 = rsqrt(_1844);
    float _1848 = sqrt(_1844);
    float _1850 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1852 = _1834 * _1850;
    float _1854 = _1838 * _1850;
    float _1856 = _1852 * _1852;
    float _1858 = _1854 * _1854;
    float _1860 = _1856 + _1858;
    float _1862 = sqrt(_1860);
    bool _1864 = _1862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1868 = _1862 + _1866;
    float _1870 = _1846;
    float _1872 = _1868;
    float _1874 = _1822;
    float _1876 = _1830;
    float _1878 = _1850;
    if (_1864)
    {
        float _1880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1880;
    }
    float _1882 = _1870;
    float _1884 = _1882;
    if (_1864)
    {
        float _1886 = _1868 * _1882;
        _1872 = _1886;
    }
    float _1888 = _1872;
    if (_1864)
    {
        float _1890 = rsqrt(_1860);
        _1884 = _1890;
    }
    float _1892 = _1884;
    float _1894 = _1892;
    if (_1864)
    {
        float _1896 = _1888 * 0.15915493667125701904296875;
        _1874 = _1896;
    }
    float _1898 = _1874;
    float _1900 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1902 = _1838;
    float _1904 = _1898;
    if (_1864)
    {
        float _1906 = _1898 * 6.283185482025146484375;
        float _1908 = sin(_1906);
        _1902 = _1908;
    }
    float _1910 = _1902;
    float _1912 = precise::max(0.0, _1900);
    float _1914 = _1824;
    float _1916 = _1912;
    if (_1864)
    {
        float _1918 = _1898 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = -_1850;
    float _1926 = -_1912;
    float _1928 = fma(_1830, _1924, _1926);
    if (_1864)
    {
        float _1930 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1930;
    }
    float _1932 = _1876;
    float _1934 = _1910;
    float _1936 = _1932;
    if (_1864)
    {
        float _1938 = fma(_1910, _1932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1934 = _1938;
    }
    float _1940 = _1934;
    float _1942 = _1940;
    if (!_1864)
    {
        _1936 = _1854;
    }
    float _1944 = _1936;
    float _1946 = _1944;
    if (!_1864)
    {
        _1904 = _1856;
    }
    float _1948 = _1904;
    float _1950 = _1948;
    if (_1864)
    {
        float _1952 = _1892 * _1940;
        _1682 = _1952;
    }
    float _1954 = _1682;
    if (!_1864)
    {
        _1894 = _1852;
    }
    float _1956 = _1894;
    float _1958 = _1956;
    if (_1864)
    {
        float _1960 = _1922 + (-1.0);
        _1916 = _1960;
    }
    float _1962 = _1916;
    float _1964 = _1962;
    if (_1864)
    {
        float _1966 = _1852 * _1954;
        _1958 = _1966;
    }
    float _1968 = _1958;
    if (!_1864)
    {
        _1942 = _1928;
    }
    float _1970 = _1942;
    float _1972 = _1970;
    if (_1864)
    {
        float _1974 = _1854 * _1954;
        _1946 = _1974;
    }
    float _1976 = _1946;
    if (_1864)
    {
        float _1978 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1978;
    }
    float _1980 = _1878;
    if (_1864)
    {
        float _1982 = _1968 * _1968;
        _1950 = _1982;
    }
    float _1984 = _1950;
    if (!_1864)
    {
        _1964 = _1858;
    }
    float _1986 = _1964;
    float _1988 = _1986;
    if (_1864)
    {
        float _1990 = _1976 * _1976;
        _1988 = _1990;
    }
    float _1992 = _1988;
    if (_1864)
    {
        float _1994 = fma(_1928, _1922, _1980);
        _1972 = _1994;
    }
    float _1996 = _1972;
    float _1998 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2000 = fma(_1996, _1996, _1984);
    float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2004 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2002);
    float _2006 = precise::clamp(_2004, 0.0, 1.0);
    float _2008 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1998);
    float _2010 = _2000 + _1992;
    float _2012 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2014 = -_2006;
    float _2016 = _2014 + 1.0;
    float _2018 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2020 = rsqrt(_2010);
    float _2022 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2008);
    float _2024 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2026 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2012);
    float _2028 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2030 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2032 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2024);
    float _2034 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2026);
    float _2036 = abs(_2016);
    float _2038 = log2(_2036);
    float _2040 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2028);
    float _2042 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2032);
    float _2044 = _2034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2046 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2048 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2040);
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2052 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2054 = _2020 * _1968;
    float _2056 = _2020 * _1996;
    float _2058 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2052);
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = _2020 * _1976;
    float _2066 = -_2046;
    float _2068 = fma(_2066, _2018, 1.0);
    float _2070 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2060);
    float _2072 = -_2062;
    float _2074 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2072);
    float _2076 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2078 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2070);
    float _2080 = -_2064;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2074);
    float _2084 = exp2(_2076);
    float _2086 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2088 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2090 = fma(_2082, -0.5, 0.5);
    float _2092 = _2056 + 1.0;
    float _2094 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2086);
    float _2096 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2088);
    float _2098 = log2(_2068);
    float _2100 = fma(_2082, 0.5, 0.5);
    float _2102 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2104 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2096);
    float _2106 = fma(_2100, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2108 = 1.0 / _2078;
    float _2110 = -_2056;
    float _2112 = fma(_2084, _2092, _2110);
    float _2114 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2102);
    float _2116 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2118 = fma(_2100, _2106, -0.212114393711090087890625);
    float _2120 = sqrt(_2090);
    float _2122 = _2098 * 0.693147182464599609375;
    float _2124 = fma(_2100, _2118, 1.570728778839111328125);
    float _2126 = fma(_2112, 0.5, 0.5);
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2130 = _2114 * _2108;
    float _2132 = _2116 * _2108;
    float _2134 = fma(_2130, 0.5, 0.5);
    float _2136 = fma(_2132, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float _2140 = -_2124;
    float _2142 = fma(_2138, _2140, 1.0);
    float3 _5655 = float3(_2134, _2136, _2128);
    float _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5655, float3(0.0), isnan(_5655)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5655, float3(0.0), isnan(_5655)), level(0.0)).x;
    float3 _5666 = float3(_2134, _2136, _2128);
    float4 _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5666, float3(0.0), isnan(_5666)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5666, float3(0.0), isnan(_5666)), level(0.0)).xyzw;
    float _2149 = _2147.x;
    float _2151 = _2147.y;
    float _2153 = _2147.z;
    float _2155 = _2147.w;
    float2 _5683 = float2(_2142, _2126);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5683, float2(0.0), isnan(_5683)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5683, float2(0.0), isnan(_5683)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = in.m_55.w;
    float _2169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2171 = _524 > 0.5;
    float _2173 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2177 = _2175 != 0;
    out.m_61.x = _282;
    out.m_61.y = _284;
    out.m_61.z = _286;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2181 = _2179 != 0;
    float _2183 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2185 = _530 > 0.5;
    float _2187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2191 = _2189 != 0;
    float _2193 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2197 = _2195 != 0;
    out.m_63.x = _478;
    out.m_63.y = _480;
    out.m_63.z = _482;
    float _2199 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2193);
    float _2201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_2177)
    {
        bool _2203 = _514 > 0.5;
        _1684 = _2203;
    }
    bool _2205 = _1684;
    if (_2177)
    {
        float _2207 = -_146;
        float _2209 = _2207 + 1.0;
        _714 = as_type<int>(_2209);
    }
    int _2211 = _714;
    if (!_2177)
    {
        _1686 = _146;
    }
    float _2213 = _1686;
    float _2215 = _2213;
    if (_2181)
    {
        float _2217 = -_146;
        float _2219 = _2217 + 1.0;
        _290 = as_type<int>(_2219);
    }
    int _2221 = _290;
    if (!_2181)
    {
        _292 = _146;
    }
    float _2223 = _292;
    float _2225 = _2223;
    if (_2177)
    {
        float _2227 = _2205 ? as_type<float>(_2211) : _146;
        _2215 = _2227;
    }
    float _2229 = _2215;
    float _2231 = -_160;
    float _2233 = _2231 + 1.0;
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2237 = _2235 != 0;
    float _2239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2243 = _2241 != 0;
    float _2245 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2247 = _2171 ? _2233 : _160;
    bool _2249 = _524 > 0.5;
    bool _2251 = _2249 && _2237;
    float _2253 = _2169 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2255 = _2247;
    if (_2181)
    {
        float _2257 = _2185 ? as_type<float>(_2221) : _146;
        _2225 = _2257;
    }
    float _2259 = _2225;
    float _2261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2263 = _2167 > 0.5;
    float _2265 = fma(_2253, _2229, -0.5);
    int _2267 = _2185 ? as_type<int>(_2233) : as_type<int>(_160);
    float _2269 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2271 = _2197 ? _2247 : _160;
    float _2273 = fma(_1052, _2265, _1026);
    float _2275 = _2191 ? as_type<float>(_2267) : _160;
    float _2277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_2237)
    {
        _2255 = _146;
    }
    float _2279 = _2255;
    float _2281 = _2279;
    if (_2251)
    {
        float _2283 = -_146;
        float _2285 = _2283 + 1.0;
        _196 = _2285;
    }
    float _2287 = _196;
    if (_2243)
    {
        float _2289 = _2263 ? _2233 : _160;
        _198 = _2289;
    }
    float _2291 = _198;
    float _2293 = fma(_2275, _2245, -0.5);
    float _2295 = _2239 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2297 = fma(_2269, _2271, -0.5);
    if (_2237)
    {
        _2281 = _2287;
    }
    float _2299 = _2281;
    float _2301 = exp2(_2173);
    float _2303 = _2261 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2305 = fma(_2295, _2259, -0.5);
    float _2307 = -_974;
    float _2309 = fma(_1028, _2297, _2307);
    float _2311 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2199);
    float _2313 = fma(_2303, _2291, -0.5);
    float _2315 = fma(_886, _2305, _1036);
    float _2317 = _2309 + 0.5;
    float _2319 = _2277 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2321 = -_938;
    float _2323 = fma(_986, _2313, _2321);
    float _2325 = _2315 + 0.5;
    bool _2327 = _1826 > 0.0;
    bool _2329 = isnan(_1826);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan(0.0);
    bool _2335 = _2331 || _2333;
    float _2337 = fma(_2319, _2299, -0.5);
    float _2339 = _2273 + 0.5;
    float _2341 = _2323 + 0.5;
    float _2343 = -_1056;
    float _2345 = fma(_1054, _2293, _2343);
    float _2347 = -_2301;
    float _2349 = _2347 + 1.0;
    float _2351 = fma(_1030, _2337, _982);
    float _2353 = _1826 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_65.x = _2339;
    out.m_65.y = _2317;
    out.m_65.z = _2325;
    out.m_65.w = _2341;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2357 = _2351 + 0.5;
    float _2359 = _2311 + _2078;
    float _2361 = _2345 + 0.5;
    float _2363 = -_2355;
    float _2365 = _2363 + 1.0;
    float _2367 = _2359 * 0.5;
    float _2369 = _2353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2357;
    out.m_67.y = _2361;
    out.gl_Position.x = _2114;
    out.gl_Position.y = _2116;
    out.gl_Position.z = _2311;
    out.gl_Position.w = _2078;
    out.m_69.z = _2367;
    out.m_69.w = _2078;
    out.m_45.x = _2369;
    float _2371 = _2355 * _2144;
    float _2373 = _2155 * _2365;
    float _2375 = _2155 * _2371;
    float _2377 = _2165 * _2371;
    float _2379 = fma(_2161, _2375, _2149);
    float _2381 = fma(_2163, _2375, _2151);
    float _2383 = fma(_2155, _2377, _2153);
    out.m_71.x = _2379;
    out.m_71.y = _2381;
    out.m_71.z = _2383;
    out.m_71.w = _2373;
    if (_2335)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2385 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2385;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _504 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2442 = as_type<float>(_106);
        out.gl_Position.z = _2442;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2511 = as_type<float>(_144);
        out.gl_Position.z = _2511;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.x;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.y;
    float _162 = in.m_51.w;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _148;
    if (!_158)
    {
        float _180 = _148 * _148;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_158)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_158;
    float _194 = _190;
    float _196 = _146;
    float _198 = _160;
    if (!_192)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _148 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _148);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _228;
    }
    float _230 = _194;
    bool _232 = !_158;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _148 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _178 = _252;
    }
    float _254 = _178;
    out.m_53.x = _146;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_53.y = _160;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _164, _258);
    float _266 = fma(_254, _166, _260);
    float _268 = fma(_254, _168, _262);
    float _270 = fma(_264, _162, _170);
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _274 = fma(_266, _162, _172);
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _278 = fma(_268, _162, _174);
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _282 = _272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _284 = _276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _286 = _280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _288 = !_256;
    int _290 = as_type<int>(_286);
    float _292 = _284;
    float _310;
    if (!_288)
    {
        float _294 = in.m_55.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_90);
        float _316 = 1.0 / _314;
        float _318 = _124 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _324 = _320 + _322;
    bool _326 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _328 = isnan(_320);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _340 = _320 + _338;
    bool _342 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _344 = isnan(_320);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _362 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _364 = isnan(_320);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -_336;
    float _376 = _374 + 1.0;
    float _378 = 1.0 / _360;
    float _380 = _372 * _376;
    float _382 = -_372;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _386;
    float _390 = in.m_51.x;
    float _392 = in.m_51.y;
    float _394 = in.m_51.z;
    bool _396 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _398 = 1.0 / _356;
    float _400 = _352 * _384;
    float _402 = -_352;
    float _404 = _402 + 1.0;
    float _406 = _340 * _378;
    float _408 = _324 * _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _414;
    float _418 = fma(_388, _408, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _420 = fma(_412, _408, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _422 = fma(_416, _408, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _424 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = _418 * _400;
    float _428 = _420 * _400;
    float _430 = _422 * _400;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _444 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[123].x, _426);
    float _446 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[123].y, _428);
    float _448 = fma(_434, _406, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _450 = fma(_438, _406, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _452 = fma(_442, _406, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _454 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[123].z, _430);
    float _456 = fma(_448, _380, _444);
    float _458 = fma(_450, _380, _446);
    float _460 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = fma(_452, _380, _454);
    float _464 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[125].x, _456);
    float _466 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[125].y, _458);
    float _468 = _394 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _470 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[125].z, _462);
    float _472 = _464 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _474 = _466 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _476 = _470 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _478 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _480 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _484 = !_396;
    float _502;
    if (!_484)
    {
        float _486 = in.m_55.x;
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _490 = _486 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _494 = _492 * _488;
        float _496 = floor(_494);
        float _498 = -_496;
        float _500 = _494 + _498;
        _502 = _500;
        _504 = true;
    }
    else
    {
        float _506 = float(_90);
        float _508 = 1.0 / _506;
        float _510 = _124 * _508;
        _502 = _510;
    }
    _504 = false;
    float _512 = _502;
    float _514 = in.m_55.x;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _518 = _512 + _516;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _522 = _520 != 0;
    float _524 = in.m_55.y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _530 = in.m_55.z;
    float _532 = 1.0 / _528;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _544 = _542 != 0;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _560 = 1.0 / _550;
    float _562 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _566 = -_546;
    float _568 = fma(_562, 2.0, _566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _570;
    float _574 = 1.0 / _554;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _580 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _586 = _572 * _532;
    float _588 = (*spvDescriptorSet0.vp_c8)._m0[32].y * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _590 = 1.0 / _578;
    float _592 = _524 * 2.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _598 = 1.0 / _558;
    float _600 = _530 * 2.0;
    float _602 = _584 * _574;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _620 = floor(_600);
    float _622 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _624;
    float _628 = _610 * _560;
    float _630 = fma(_622, -2.0, _564);
    float _632 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _580);
    float _634 = 1.0 / _596;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _638 = _618 * _590;
    float _640 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _588);
    float _642 = _514 + _530;
    float _644 = _606 * _598;
    float _646 = floor(_592);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _652 = _514 * 2.0;
    bool _654 = _620 > 0.0;
    float _656 = _642 + (-1.0);
    bool _658 = _620 >= 0.0;
    bool _660 = isnan(_620);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    float _668 = _514 + _524;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _672 = 1.0 / _650;
    float _674 = _614 * _634;
    float _676 = fma((*spvDescriptorSet0.vp_c8)._m0[32].z, (*spvDescriptorSet0.vp_c8)._m0[32].z, _640);
    float _678 = fma(_644, _518, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _680 = floor(_652);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _686 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _632);
    float _688 = _524 + _530;
    float _690 = _626 * _672;
    float _692 = _666 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _696 = _688 + (-1.0);
    float _698 = _668 + (-1.0);
    float _700 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _702 = ~as_type<int>(_692);
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _710 = _706;
    float _712 = _692;
    int _714 = as_type<int>(_514);
    if (!_654)
    {
        int _716 = ~as_type<int>(_692);
        int _718 = _716 + 1;
        _710 = _718;
    }
    int _720 = _710;
    float _722 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_522)
    {
        _712 = _514;
    }
    float _724 = _712;
    float _726 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _728 = _724;
    if (!_522)
    {
        _728 = _530;
    }
    float _730 = _728;
    float _732 = rsqrt(_686);
    float _734 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _726);
    bool _736 = _680 >= 0.0;
    bool _738 = isnan(_680);
    bool _740 = _736 || _738;
    bool _742 = isnan(0.0);
    bool _744 = _740 || _742;
    float _746 = _730 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _748 = _646 > 0.0;
    float _750 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _752 = _680 > 0.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _756 = _512 + _754;
    int _758 = _744 ? 0 : 1;
    float _760 = -_636;
    float _762 = fma(_746, 2.0, _760);
    bool _764 = _646 >= 0.0;
    bool _766 = isnan(_646);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _776 = _512 + _774;
    float _778 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _780 = fma(_602, _756, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _782 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _734);
    float _784 = fma(_586, _776, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _786 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _778);
    float _788 = _778;
    float _790 = _786;
    if (!_522)
    {
        _788 = _524;
    }
    float _792 = _788;
    float _794 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _796 = _772 ? 0 : 1;
    float _798 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _786);
    float _800 = _792;
    if (_522)
    {
        _800 = _514;
    }
    float _802 = _800;
    float _804 = -_794;
    float _806 = _804 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _808 = ~_796;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _798 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _816 = _812;
    float _818 = _806;
    if (!_748)
    {
        int _820 = ~_796;
        int _822 = _820 + 1;
        _816 = _822;
    }
    int _824 = _816;
    float _826 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _828 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _830 = log2(_828);
    float _832 = _826;
    if (!_522)
    {
        _790 = _530;
    }
    float _834 = _790;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _814 + _836;
    float _840 = -_670;
    float _842 = fma(_826, 2.0, _840);
    float _844 = _834;
    float _846 = _838;
    if (_522)
    {
        _844 = _524;
    }
    float _848 = _844;
    float _850 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].z, _684);
    if (!_522)
    {
        _832 = _530;
    }
    float _852 = _832;
    float _854 = _732 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _856 = _852;
    if (_522)
    {
        _856 = _524;
    }
    float _858 = _856;
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[83].w, _682);
    float _862 = abs(_838);
    float _864 = abs(_806);
    float _866 = precise::max(_862, _864);
    float _868 = _854 * (-0.15915493667125701904296875);
    int _870 = ~_758;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    float _876 = _858 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _878 = _874;
    if (!_752)
    {
        int _880 = ~_758;
        int _882 = _880 + 1;
        _878 = _882;
    }
    int _884 = _878;
    float _886 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _850);
    bool _888 = _866 >= 16.0;
    float _890 = fma(_876, -2.0, _694);
    bool _892 = !_536;
    float _894 = _892 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _896 = _830 * _124;
    bool _898 = !_544;
    int _900 = _898 ? 0 : 1;
    int _902 = abs(as_type<int>(_894));
    float _904 = _894;
    if (_522)
    {
        _904 = _524;
    }
    float _906 = _904;
    float _908 = exp2(_896);
    float _910 = _906;
    if (!_522)
    {
        _910 = _514;
    }
    float _912 = _910;
    bool _914 = !_540;
    int _916 = _914 ? 0 : 1;
    if (_888)
    {
        float _918 = _838 * 0.0625;
        _846 = _918;
    }
    float _920 = _846;
    int _922 = abs(_900);
    float _924 = _912 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _926 = abs(_916);
    if (_888)
    {
        float _928 = _806 * 0.0625;
        _818 = _928;
    }
    float _930 = _818;
    float _932 = float(_922);
    float _934 = fma(_924, -2.0, _708);
    float _936 = float(_824);
    float _938 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _890);
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _942 = float(_902);
    float _944 = -_908;
    float _946 = _944 + 1.0;
    float _948 = float(_720);
    float _950 = _932 * _936;
    float _952 = float(_926);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _956 = 1.0 + _954;
    float _958 = float(_884);
    float _960 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[88].w, _940);
    bool _962 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _970 = _966 || _968;
    float _972 = _942 * _948;
    float _974 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _630);
    float _976 = _952 * _958;
    float _978 = _970 ? _946 : 0.0;
    float _980 = -_124;
    float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[86].x, _762);
    float _984 = 1.0 / _956;
    float _986 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _860);
    float _988 = _972 * (-2.0);
    float _990 = _950 * (-2.0);
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _996 = isnan(1.0);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1002 = _998 || _1000;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1006 = fma(_722, _988, _722);
    float _1008 = fma(_700, _990, _700);
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1012 = in.m_57.x;
    float _1014 = in.m_57.y;
    float _1016 = in.m_57.z;
    float _1018 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].w, _992);
    float _1020 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1004);
    float _1022 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1010);
    float _1024 = -_124;
    float _1026 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[76].x, _568);
    float _1028 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1018);
    float _1030 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1020);
    float _1032 = _514 + (-0.5);
    float _1034 = -_124;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[81].x, _842);
    bool _1038 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1040 = isnan(_512);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = _530 + (-0.5);
    float _1052 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1022);
    float _1054 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _960);
    float _1056 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _934);
    bool _1058 = _1002;
    if (_1002)
    {
        float _1060 = _978 * _984;
        _128 = _1060;
    }
    float _1062 = _128;
    float _1064 = _868 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _1070 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1072 = isnan(_512);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -_1048;
    float _1084 = _1082 + 1.0;
    float _1086 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1088 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1090 = isnan(_512);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1006, _1062, _1068);
    bool _1102 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1104 = isnan(_512);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = _868 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1080 * _1084;
    float _1120 = -_1080;
    float _1122 = _1120 + 1.0;
    float _1124 = fma(_1008, _1062, _1086);
    bool _1126 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1128 = isnan(_512);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -_1098;
    float _1140 = _1138 + 1.0;
    bool _1142 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1144 = isnan(_512);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1112;
    float _1156 = _1154 + 1.0;
    float _1158 = _1098 * _1122;
    float _1160 = _1136 * _1140;
    float _1162 = -_1136;
    float _1164 = _1162 + 1.0;
    float _1166 = _1014 + 0.100000001490116119384765625;
    float _1168 = _1152 * _1156;
    float _1170 = _1066 * _1016;
    bool _1172 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1174 = isnan(_512);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _1112 * _1164;
    float _1186 = -_1152;
    float _1188 = _1186 + 1.0;
    float _1190 = -_1170;
    float _1192 = fma(_1116, _1166, _1190);
    float _1194 = abs(_920);
    bool _1196 = _1194 != 0.0;
    bool _1198 = isnan(_1194);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    float _1206 = -_1182;
    float _1208 = _1206 + 1.0;
    float _1210 = _1182 * _1188;
    float _1212 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _514);
    float _1214 = _1192 + (-0.100000001490116119384765625);
    bool _1216 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1218 = isnan(_512);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1224 = _1220 || _1222;
    int _1226 = _1224 ? 1065353216 : 0;
    float _1228 = _1100 * 0.15915493667125701904296875;
    float _1230 = abs(_930);
    bool _1232 = _1230 == 0.0;
    bool _1234 = !_1204;
    bool _1236 = _1232 && _1234;
    float _1238 = _1214 + _1212;
    float _1240 = _976 * (-2.0);
    float _1242 = as_type<float>(_1226) * _1208;
    float _1244 = _1228 * 6.283185482025146484375;
    float _1246 = sin(_1244);
    float _1248 = _1238 * 8.0;
    float _1250 = _1124 * 0.15915493667125701904296875;
    float _1252 = abs(_930);
    bool _1254 = _1252 == 0.0;
    float _1256 = _784 * _1242;
    float _1258 = fma(_750, _1240, _750);
    float _1260 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _524);
    float _1262 = -as_type<float>(_1226);
    float _1264 = _1262 + 1.0;
    float _1266 = _1228 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    int _1270 = _1226;
    int _1272 = as_type<int>(_1258);
    if (_1236)
    {
        bool _1274 = as_type<int>(_930) >= 0;
        _1058 = _1274;
    }
    bool _1276 = _1058;
    float _1278 = _1214 + _1260;
    float _1280 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1256);
    int _1282 = _1276 ? (-1) : 0;
    bool _1284 = _1276;
    if (_1236)
    {
        int _1286 = _1276 ? 0 : 1078530011;
        _1270 = _1286;
    }
    int _1288 = _1270;
    float _1290 = _1278 * 10.0;
    float _1292 = _1250 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    float _1296 = _1248 * 0.15915493667125701904296875;
    float _1298 = _524 + (-0.5);
    float _1300 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1302 = _1296 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = fma(_1258, _1062, _1300);
    if (_1236)
    {
        int _1308 = int(0x80000000) & as_type<int>(_920);
        int _1310 = _1288 | _1308;
        _1272 = _1310;
    }
    int _1312 = _1272;
    bool _1314 = !_1204;
    bool _1316 = _1314 && _1254;
    int _1318 = _1312;
    float _1320 = as_type<float>(_1312);
    if (!_1316)
    {
        float _1322 = abs(_920);
        bool _1324 = _1322 != as_type<float>(0x7f800000u /* inf */);
        bool _1326 = isnan(_1322);
        bool _1328 = _1324 || _1326;
        bool _1330 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1332 = _1328 || _1330;
        float _1334 = abs(_930);
        bool _1336 = _1334 == as_type<float>(0x7f800000u /* inf */);
        float _1338 = abs(_930);
        bool _1340 = _1338 == as_type<float>(0x7f800000u /* inf */);
        bool _1342 = !_1332;
        bool _1344 = _1340 && _1342;
        if (_1344)
        {
            bool _1346 = as_type<int>(_930) >= 0;
            _1282 = _1346 ? (-1) : 0;
        }
        int _1348 = _1282;
        _1284 = _1348 != 0;
        if (_1344)
        {
            _1318 = 1075235812;
        }
        int _1350 = _1318;
        int _1352 = _1350;
        if (_1344)
        {
            int _1354 = ~_1348;
            int _1356 = (_1354 != 0) ? _1350 : 1061752795;
            _1352 = _1356;
        }
        int _1358 = _1352;
        float _1360 = as_type<float>(_1358);
        if (_1344)
        {
            int _1362 = int(0x80000000) & as_type<int>(_920);
            int _1364 = _1358 | _1362;
            _1360 = as_type<float>(_1364);
        }
        float _1366 = _1360;
        bool _1368 = !_1332;
        bool _1370 = _1368 && _1336;
        _1320 = _1366;
        if (!_1370)
        {
            float _1372 = abs(_920);
            float _1374 = abs(_930);
            float _1376 = precise::max(_1372, _1374);
            float _1378 = abs(_920);
            float _1380 = abs(_930);
            float _1382 = precise::min(_1378, _1380);
            float _1384 = 1.0 / _1376;
            float _1386 = abs(_920);
            float _1388 = abs(_930);
            bool _1390 = _1386 > _1388;
            bool _1392 = as_type<int>(_930) >= 0;
            float _1394 = _1382 * _1384;
            float _1396 = _1394 * _1394;
            float _1398 = _1396 + 11.33538818359375;
            float _1400 = fma(_1396, -0.82336294651031494140625, -5.674867153167724609375);
            float _1402 = fma(_1396, _1398, 28.84246826171875);
            float _1404 = fma(_1396, _1400, -6.565555095672607421875);
            float _1406 = fma(_1396, _1402, 19.6966705322265625);
            float _1408 = _1396 * _1404;
            float _1410 = abs(_920);
            float _1412 = abs(_930);
            float _1414 = _1410 + _1412;
            int _1416 = as_type<int>(_920) & int(0x80000000);
            float _1418 = _1394 * _1408;
            float _1420 = 1.0 / _1406;
            bool _1422 = _1414 > as_type<float>(0x7f800000u /* inf */);
            bool _1424 = isnan(_1414);
            bool _1426 = _1422 || _1424;
            bool _1428 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1430 = _1426 || _1428;
            float _1432 = fma(_1418, _1420, _1394);
            float _1434 = _1432;
            _1320 = _1414;
            _1284 = _1392;
            if (_1390)
            {
                float _1436 = -_1432;
                float _1438 = _1436 + 1.57079637050628662109375;
                _1434 = _1438;
            }
            float _1440 = _1434;
            int _1442 = as_type<int>(_1440);
            if (!_1392)
            {
                float _1444 = -_1440;
                float _1446 = _1444 + 3.1415927410125732421875;
                _1442 = as_type<int>(_1446);
            }
            int _1448 = _1442;
            if (!_1430)
            {
                int _1450 = _1416 | _1448;
                _1320 = as_type<float>(_1450);
            }
        }
    }
    float _1452 = _1320;
    bool _1454 = _1284;
    float _1456 = in.m_59.x;
    float _1458 = _1290 * 0.15915493667125701904296875;
    float _1460 = -_1452;
    float _1462 = _1306 + _1460;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1466 = _512 + _1464;
    float _1468 = fma(_780, _1210, _1280);
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1472 = _512 + _1470;
    float _1474 = _1462 * 0.15915493667125701904296875;
    float _1476 = fma(_628, _1466, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1478 = fma(_678, _1168, _1468);
    float _1480 = fma(_674, _1472, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1484 = _512 + _1482;
    float _1486 = fma(_1476, _1184, _1478);
    float _1488 = _1116 * _1016;
    float _1490 = _1474 * 6.283185482025146484375;
    float _1492 = sin(_1490);
    float _1494 = fma(_638, _1484, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1496 = fma(_1480, _1160, _1486);
    float _1498 = fma(_854, -0.100000001490116119384765625, 0.100000001490116119384765625);
    float _1500 = _854 * 0.0500000007450580596923828125;
    float _1502 = fma(_1066, _1166, _1488);
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1506 = _512 + _1504;
    float _1508 = _1474 * 6.283185482025146484375;
    float _1510 = cos(_1508);
    float _1512 = fma(_1494, _1158, _1496);
    float _1514 = _1498 * _1456;
    float _1516 = fma(_1500, _1456, _1214);
    float _1518 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1520 = fma(_690, _1506, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1522 = fma(_1304, _1514, _1012);
    float _1524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1516);
    float _1526 = _1250 * 6.283185482025146484375;
    float _1528 = sin(_1526);
    float _1530 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1522);
    float _1534 = _1524 * _1518;
    float _1536 = fma(_1520, _1118, _1512);
    float _1538 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1540 = _1532 * _1530;
    float _1542 = _1294 * _1534;
    float _1544 = _1458 * 6.283185482025146484375;
    float _1546 = sin(_1544);
    float _1548 = _1268 * _1492;
    float _1550 = _1246 * _1510;
    float _1552 = _1246 * _1542;
    float _1554 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1536);
    float _1556 = _1246 * _1492;
    float _1558 = _1510 * _1294;
    float _1560 = _1492 * _1294;
    float _1562 = rsqrt(_676);
    float _1564 = -_1548;
    float _1566 = fma(_1528, _1550, _1564);
    float _1568 = -_1534;
    float _1570 = _1528 * _1568;
    float _1572 = _1554 * 0.3499999940395355224609375;
    float _1574 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1576 = fma(_1566, _1540, _1552);
    float _1578 = _1268 * _1510;
    float _1580 = fma(_1558, _1540, _1570);
    float _1582 = fma(_1546, _1514, _1502);
    float _1584 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1574);
    float _1586 = fma(_1528, _1556, _1578);
    float _1588 = _1268 * _1542;
    float _1590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1582);
    float _1592 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1584);
    float _1594 = fma(_1528, _1578, _1556);
    float _1596 = -_1550;
    float _1598 = fma(_1528, _1548, _1596);
    float _1600 = _1590 * _1538;
    float _1602 = _1562 * _1572;
    float _1604 = _1592 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1606 = fma(_1594, _1540, _1588);
    float _1608 = fma(_1586, _1600, _1576);
    float _1610 = fma(_1560, _1600, _1580);
    float _1612 = _1456 * _1602;
    float _1614 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1616 = _794 + _1608;
    float _1618 = _814 + _1610;
    float _1620 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1622 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1614);
    float _1624 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1616);
    float _1626 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1618);
    float _1628 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1620);
    float _1630 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1622);
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1634 = _1624 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1626 + _1636;
    bool _1640 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1642 = isnan(0.5);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1648 = _1644 || _1646;
    float _1650 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1652 = _1634 * _1634;
    float _1654 = fma(_1598, _1600, _1606);
    float _1656 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1628);
    float _1658 = 1.0 / _1650;
    float _1660 = fma(_1638, _1638, _1652);
    float _1662 = _1604 + _1654;
    float _1664 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1666 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1662);
    float _1668 = _1664 + _1650;
    float _1670 = sqrt(_1660);
    float _1672 = _1662;
    float _1674 = _1600;
    float _1676 = _1548;
    float _1678 = _1598;
    float _1680 = _1660;
    float _1682 = 0.100000001490116119384765625;
    bool _1684 = _1454;
    float _1686 = 0.5;
    if (_1648)
    {
        _1672 = 1.0;
    }
    float _1688 = _1672;
    float _1690 = _1668 * _1658;
    float _1692 = _1690 * 0.5;
    bool _1694 = _1670 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = _1670;
    float _1698 = _1688;
    if (!_1694)
    {
        _1674 = _1626;
    }
    float _1700 = _1674;
    float _1702 = _1700;
    if (!_1694)
    {
        _1676 = _1624;
    }
    float _1704 = _1676;
    float _1706 = _1704;
    if (!_1694)
    {
        _1678 = _1666;
    }
    float _1708 = _1678;
    bool _1710 = !_1694;
    float _1712 = _1708;
    if (!_1710)
    {
        float _1714 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1718 = _1670 + _1716;
        float _1720 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = rsqrt(_1660);
        float _1724 = _1718 * _1714;
        float _1726 = _1724 * 0.15915493667125701904296875;
        float _1728 = _1726 * 6.283185482025146484375;
        float _1730 = cos(_1728);
        float _1732 = _1726 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = _1730 + (-1.0);
        float _1738 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1740 = fma(_1734, _1720, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1742 = fma(_1666, _1730, _1738);
        float _1744 = _1722 * _1740;
        float _1746 = fma(_1638, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1748 = fma(_1634, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1712 = _1742;
        _1702 = _1746;
        _1706 = _1748;
        _1696 = _1718;
        _1680 = _1722;
    }
    float _1750 = _1712;
    float _1752 = _1702;
    float _1754 = _1706;
    float _1756 = _1696;
    float _1758 = _1680;
    float _1760 = _1756;
    float _1762 = _1758;
    if (!_1648)
    {
        float _1764 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1766 = _1764 * 0.15915493667125701904296875;
        float _1768 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1772 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1770);
        float _1774 = _1766 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        float _1778 = _1768 * 0.15915493667125701904296875;
        float _1780 = _1766 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        float _1784 = 1.0 / _1776;
        float _1786 = _1778 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = _1782 * _1784;
        float _1792 = _1778 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1798 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1796;
        float _1800 = _1788 * _1790;
        float _1802 = 1.0 / _1772;
        float _1804 = 1.0 / _1800;
        float _1806 = 1.0 / _1798;
        float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1810 = _1802 * _1808;
        float _1812 = _1794 * _1804;
        float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1816 = fma(_1812, _1810, _1814);
        float _1818 = _1816 * _1806;
        float _1820 = precise::clamp(_1818, 0.0, 1.0);
        _1760 = _1804;
        _1762 = _1800;
        _1698 = _1820;
    }
    float _1822 = _1760;
    float _1824 = _1762;
    float _1826 = _1698;
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1830 = _1750 + _1828;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1834 = _1752 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1838 = _1754 + _1836;
    float _1840 = _1830 * _1830;
    float _1842 = fma(_1834, _1834, _1840);
    float _1844 = fma(_1838, _1838, _1842);
    float _1846 = rsqrt(_1844);
    float _1848 = sqrt(_1844);
    float _1850 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1852 = _1834 * _1850;
    float _1854 = _1838 * _1850;
    float _1856 = _1852 * _1852;
    float _1858 = _1854 * _1854;
    float _1860 = _1856 + _1858;
    float _1862 = sqrt(_1860);
    bool _1864 = _1862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1868 = _1862 + _1866;
    float _1870 = _1846;
    float _1872 = _1868;
    float _1874 = _1822;
    float _1876 = _1830;
    float _1878 = _1850;
    if (_1864)
    {
        float _1880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1880;
    }
    float _1882 = _1870;
    float _1884 = _1882;
    if (_1864)
    {
        float _1886 = _1868 * _1882;
        _1872 = _1886;
    }
    float _1888 = _1872;
    if (_1864)
    {
        float _1890 = rsqrt(_1860);
        _1884 = _1890;
    }
    float _1892 = _1884;
    float _1894 = _1892;
    if (_1864)
    {
        float _1896 = _1888 * 0.15915493667125701904296875;
        _1874 = _1896;
    }
    float _1898 = _1874;
    float _1900 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1902 = _1838;
    float _1904 = _1898;
    if (_1864)
    {
        float _1906 = _1898 * 6.283185482025146484375;
        float _1908 = sin(_1906);
        _1902 = _1908;
    }
    float _1910 = _1902;
    float _1912 = precise::max(0.0, _1900);
    float _1914 = _1824;
    float _1916 = _1912;
    if (_1864)
    {
        float _1918 = _1898 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = -_1850;
    float _1926 = -_1912;
    float _1928 = fma(_1830, _1924, _1926);
    if (_1864)
    {
        float _1930 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1930;
    }
    float _1932 = _1876;
    float _1934 = _1910;
    float _1936 = _1932;
    if (_1864)
    {
        float _1938 = fma(_1910, _1932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1934 = _1938;
    }
    float _1940 = _1934;
    float _1942 = _1940;
    if (!_1864)
    {
        _1936 = _1854;
    }
    float _1944 = _1936;
    float _1946 = _1944;
    if (!_1864)
    {
        _1904 = _1856;
    }
    float _1948 = _1904;
    float _1950 = _1948;
    if (_1864)
    {
        float _1952 = _1892 * _1940;
        _1682 = _1952;
    }
    float _1954 = _1682;
    if (!_1864)
    {
        _1894 = _1852;
    }
    float _1956 = _1894;
    float _1958 = _1956;
    if (_1864)
    {
        float _1960 = _1922 + (-1.0);
        _1916 = _1960;
    }
    float _1962 = _1916;
    float _1964 = _1962;
    if (_1864)
    {
        float _1966 = _1852 * _1954;
        _1958 = _1966;
    }
    float _1968 = _1958;
    if (!_1864)
    {
        _1942 = _1928;
    }
    float _1970 = _1942;
    float _1972 = _1970;
    if (_1864)
    {
        float _1974 = _1854 * _1954;
        _1946 = _1974;
    }
    float _1976 = _1946;
    if (_1864)
    {
        float _1978 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1978;
    }
    float _1980 = _1878;
    if (_1864)
    {
        float _1982 = _1968 * _1968;
        _1950 = _1982;
    }
    float _1984 = _1950;
    if (!_1864)
    {
        _1964 = _1858;
    }
    float _1986 = _1964;
    float _1988 = _1986;
    if (_1864)
    {
        float _1990 = _1976 * _1976;
        _1988 = _1990;
    }
    float _1992 = _1988;
    if (_1864)
    {
        float _1994 = fma(_1928, _1922, _1980);
        _1972 = _1994;
    }
    float _1996 = _1972;
    float _1998 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2000 = fma(_1996, _1996, _1984);
    float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2004 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2002);
    float _2006 = precise::clamp(_2004, 0.0, 1.0);
    float _2008 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1998);
    float _2010 = _2000 + _1992;
    float _2012 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2014 = -_2006;
    float _2016 = _2014 + 1.0;
    float _2018 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2020 = rsqrt(_2010);
    float _2022 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2008);
    float _2024 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2026 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2012);
    float _2028 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2030 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2032 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2024);
    float _2034 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2026);
    float _2036 = abs(_2016);
    float _2038 = log2(_2036);
    float _2040 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2028);
    float _2042 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2032);
    float _2044 = _2034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2046 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2048 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2040);
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2052 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2054 = _2020 * _1968;
    float _2056 = _2020 * _1996;
    float _2058 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2052);
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = _2020 * _1976;
    float _2066 = -_2046;
    float _2068 = fma(_2066, _2018, 1.0);
    float _2070 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2060);
    float _2072 = -_2062;
    float _2074 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2072);
    float _2076 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2078 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2070);
    float _2080 = -_2064;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2074);
    float _2084 = exp2(_2076);
    float _2086 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2088 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2090 = fma(_2082, -0.5, 0.5);
    float _2092 = _2056 + 1.0;
    float _2094 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2086);
    float _2096 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2088);
    float _2098 = log2(_2068);
    float _2100 = fma(_2082, 0.5, 0.5);
    float _2102 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2104 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2096);
    float _2106 = fma(_2100, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2108 = 1.0 / _2078;
    float _2110 = -_2056;
    float _2112 = fma(_2084, _2092, _2110);
    float _2114 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2102);
    float _2116 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2118 = fma(_2100, _2106, -0.212114393711090087890625);
    float _2120 = sqrt(_2090);
    float _2122 = _2098 * 0.693147182464599609375;
    float _2124 = fma(_2100, _2118, 1.570728778839111328125);
    float _2126 = fma(_2112, 0.5, 0.5);
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2130 = _2114 * _2108;
    float _2132 = _2116 * _2108;
    float _2134 = fma(_2130, 0.5, 0.5);
    float _2136 = fma(_2132, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float _2140 = -_2124;
    float _2142 = fma(_2138, _2140, 1.0);
    float3 _5655 = float3(_2134, _2136, _2128);
    float _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5655, float3(0.0), isnan(_5655)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5655, float3(0.0), isnan(_5655)), level(0.0)).x;
    float3 _5666 = float3(_2134, _2136, _2128);
    float4 _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5666, float3(0.0), isnan(_5666)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5666, float3(0.0), isnan(_5666)), level(0.0)).xyzw;
    float _2149 = _2147.x;
    float _2151 = _2147.y;
    float _2153 = _2147.z;
    float _2155 = _2147.w;
    float2 _5683 = float2(_2142, _2126);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5683, float2(0.0), isnan(_5683)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5683, float2(0.0), isnan(_5683)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = in.m_55.w;
    float _2169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2171 = _524 > 0.5;
    float _2173 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2177 = _2175 != 0;
    out.m_61.x = _282;
    out.m_61.y = _284;
    out.m_61.z = _286;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2181 = _2179 != 0;
    float _2183 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2185 = _530 > 0.5;
    float _2187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2191 = _2189 != 0;
    float _2193 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2197 = _2195 != 0;
    out.m_63.x = _478;
    out.m_63.y = _480;
    out.m_63.z = _482;
    float _2199 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2193);
    float _2201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_2177)
    {
        bool _2203 = _514 > 0.5;
        _1684 = _2203;
    }
    bool _2205 = _1684;
    if (_2177)
    {
        float _2207 = -_146;
        float _2209 = _2207 + 1.0;
        _714 = as_type<int>(_2209);
    }
    int _2211 = _714;
    if (!_2177)
    {
        _1686 = _146;
    }
    float _2213 = _1686;
    float _2215 = _2213;
    if (_2181)
    {
        float _2217 = -_146;
        float _2219 = _2217 + 1.0;
        _290 = as_type<int>(_2219);
    }
    int _2221 = _290;
    if (!_2181)
    {
        _292 = _146;
    }
    float _2223 = _292;
    float _2225 = _2223;
    if (_2177)
    {
        float _2227 = _2205 ? as_type<float>(_2211) : _146;
        _2215 = _2227;
    }
    float _2229 = _2215;
    float _2231 = -_160;
    float _2233 = _2231 + 1.0;
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2237 = _2235 != 0;
    float _2239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2243 = _2241 != 0;
    float _2245 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2247 = _2171 ? _2233 : _160;
    bool _2249 = _524 > 0.5;
    bool _2251 = _2249 && _2237;
    float _2253 = _2169 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2255 = _2247;
    if (_2181)
    {
        float _2257 = _2185 ? as_type<float>(_2221) : _146;
        _2225 = _2257;
    }
    float _2259 = _2225;
    float _2261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2263 = _2167 > 0.5;
    float _2265 = fma(_2253, _2229, -0.5);
    int _2267 = _2185 ? as_type<int>(_2233) : as_type<int>(_160);
    float _2269 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2271 = _2197 ? _2247 : _160;
    float _2273 = fma(_1052, _2265, _1026);
    float _2275 = _2191 ? as_type<float>(_2267) : _160;
    float _2277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_2237)
    {
        _2255 = _146;
    }
    float _2279 = _2255;
    float _2281 = _2279;
    if (_2251)
    {
        float _2283 = -_146;
        float _2285 = _2283 + 1.0;
        _196 = _2285;
    }
    float _2287 = _196;
    if (_2243)
    {
        float _2289 = _2263 ? _2233 : _160;
        _198 = _2289;
    }
    float _2291 = _198;
    float _2293 = fma(_2275, _2245, -0.5);
    float _2295 = _2239 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2297 = fma(_2269, _2271, -0.5);
    if (_2237)
    {
        _2281 = _2287;
    }
    float _2299 = _2281;
    float _2301 = exp2(_2173);
    float _2303 = _2261 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2305 = fma(_2295, _2259, -0.5);
    float _2307 = -_974;
    float _2309 = fma(_1028, _2297, _2307);
    float _2311 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2199);
    float _2313 = fma(_2303, _2291, -0.5);
    float _2315 = fma(_886, _2305, _1036);
    float _2317 = _2309 + 0.5;
    float _2319 = _2277 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2321 = -_938;
    float _2323 = fma(_986, _2313, _2321);
    float _2325 = _2315 + 0.5;
    bool _2327 = _1826 > 0.0;
    bool _2329 = isnan(_1826);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan(0.0);
    bool _2335 = _2331 || _2333;
    float _2337 = fma(_2319, _2299, -0.5);
    float _2339 = _2273 + 0.5;
    float _2341 = _2323 + 0.5;
    float _2343 = -_1056;
    float _2345 = fma(_1054, _2293, _2343);
    float _2347 = -_2301;
    float _2349 = _2347 + 1.0;
    float _2351 = fma(_1030, _2337, _982);
    float _2353 = _1826 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_65.x = _2339;
    out.m_65.y = _2317;
    out.m_65.z = _2325;
    out.m_65.w = _2341;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2357 = _2351 + 0.5;
    float _2359 = _2311 + _2078;
    float _2361 = _2345 + 0.5;
    float _2363 = -_2355;
    float _2365 = _2363 + 1.0;
    float _2367 = _2359 * 0.5;
    float _2369 = _2353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2357;
    out.m_67.y = _2361;
    out.gl_Position.x = _2114;
    out.gl_Position.y = _2116;
    out.gl_Position.z = _2311;
    out.gl_Position.w = _2078;
    out.m_69.z = _2367;
    out.m_69.w = _2078;
    out.m_45.x = _2369;
    float _2371 = _2355 * _2144;
    float _2373 = _2155 * _2365;
    float _2375 = _2155 * _2371;
    float _2377 = _2165 * _2371;
    float _2379 = fma(_2161, _2375, _2149);
    float _2381 = fma(_2163, _2375, _2151);
    float _2383 = fma(_2155, _2377, _2153);
    out.m_71.x = _2379;
    out.m_71.y = _2381;
    out.m_71.z = _2383;
    out.m_71.w = _2373;
    if (_2335)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2385 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2385;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

