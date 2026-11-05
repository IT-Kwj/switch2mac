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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2771 = false;
    bool _750 = false;
    bool _426 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3057 = as_type<float>(_124);
        out.gl_Position.z = _3057;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_49.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3121 = as_type<float>(_158);
        out.gl_Position.z = _3121;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = 1.0 / _130;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _134 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _188 + _194;
    bool _198 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _200 = isnan(_188);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = -_208;
    float _220 = _218 + 1.0;
    float _222 = 1.0 / _212;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _226 = 1.0 / _216;
    float _228 = _192 * _222;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _230;
    bool _234 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_188);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    bool _246 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_188);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = 1.0 / _232;
    float _260 = _244 * _220;
    float _262 = _196 * _226;
    bool _264 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _266 = isnan(_188);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = _188 + _276;
    float _280 = -_244;
    float _282 = _280 + 1.0;
    float _284 = -_256;
    float _286 = _284 + 1.0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = _256 * _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    float _302 = _274 * _286;
    float _304 = fma(_290, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = fma(_296, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _308 = fma(_300, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = -_274;
    float _312 = _310 + 1.0;
    float _314 = _278 * _258;
    float _316 = _306 * _302;
    float _318 = _308 * _302;
    float _320 = _304 * _302;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].x, _318);
    float _336 = fma(_324, _262, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_328, _262, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _340 = fma(_332, _262, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _342 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _344 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].z, _320);
    float _346 = fma(_336, _292, _334);
    float _348 = fma(_338, _292, _342);
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _358 = _350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _362 = _352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _366 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _368 = _356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _370 = _360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _372 = _364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _358;
    out.m_53.y = _362;
    out.m_53.z = _366;
    float _374 = fma(_340, _292, _344);
    out.m_55.x = _368;
    out.m_55.y = _370;
    out.m_55.z = _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_378, _314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _390 = fma(_382, _314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _392 = fma(_386, _314, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _394 = fma(_388, _260, _346);
    float _396 = fma(_390, _260, _348);
    float _398 = fma(_392, _260, _374);
    float _400 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[146].x, _394);
    float _402 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[146].y, _396);
    float _404 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[146].z, _398);
    bool _406 = !_224;
    float _424;
    if (!_406)
    {
        float _408 = in.m_51.x;
        float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _412 = _408 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _414 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _416 = _414 * _410;
        float _418 = floor(_416);
        float _420 = -_418;
        float _422 = _416 + _420;
        _424 = _422;
        _426 = true;
    }
    else
    {
        _424 = _164;
    }
    _426 = false;
    float _428 = _424;
    float _430 = in.m_57.x;
    float _432 = in.m_57.y;
    float _434 = in.m_57.z;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _444 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _446 = isnan(_428);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _460 = 1.0 / _438;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _470 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _472 = isnan(_428);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    bool _482 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _484 = isnan(_428);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = 1.0 / _442;
    float _496 = -_480;
    float _498 = _496 + 1.0;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _502 = _404 * _434;
    float _504 = _402 * _432;
    float _506 = 1.0 / _458;
    float _508 = _468 * _460;
    float _510 = _400 * _430;
    bool _512 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _514 = isnan(_428);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _528 = _464 * _494;
    float _530 = -_454;
    float _532 = _530 + 1.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _534;
    float _538 = -_522;
    float _540 = _538 + 1.0;
    float _542 = 1.0 / _526;
    float _544 = _480 * _532;
    bool _546 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _548 = isnan(_428);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _536 * _506;
    float _560 = _522 * _498;
    bool _562 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _564 = isnan(_428);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = _556 * _540;
    float _576 = -_556;
    float _578 = _576 + 1.0;
    bool _580 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _582 = isnan(_428);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _594 = _428 + _592;
    bool _596 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _598 = isnan(_428);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _572 * _578;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _614 = -_572;
    float _616 = _614 + 1.0;
    float _618 = -_590;
    float _620 = _618 + 1.0;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _626 = fma(_528, _594, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _628 = _606 * _620;
    float _630 = _590 * _616;
    float _632 = 1.0 / _624;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _638 = _612 * _542;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _642 = _428 + _640;
    float _644 = _626 * _628;
    float _646 = -_606;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _652 = _428 + _650;
    float _654 = fma(_508, _642, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _656 = 1.0 / _636;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _664 = _428 + _662;
    float _666 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[159].x, _644);
    float _668 = fma(_638, _652, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _670 = fma(_558, _664, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _672 = fma(_654, _630, _666);
    float _674 = 1.0 / _660;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _676;
    float _680 = fma(_670, _608, _672);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _686 = _678 * _632;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _690 = _428 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _692;
    float _696 = _684 * _656;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _700 = _428 + _698;
    float _702 = fma(_686, _690, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _704 = fma(_668, _574, _680);
    float _706 = -_492;
    float _708 = _706 + 1.0;
    float _710 = fma(_696, _700, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _714 = _428 + _712;
    float _716 = fma(_702, _560, _704);
    float _718 = _694 * _674;
    float _720 = _454 * _708;
    float _722 = fma(_710, _544, _716);
    float _724 = fma(_718, _714, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _726 = fma(_724, _720, _722);
    float _728 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[166].x, _726);
    bool _730 = !_500;
    float _748;
    if (!_730)
    {
        float _732 = in.m_51.x;
        float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _736 = _732 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[14].z, _134);
        float _740 = _738 * _734;
        float _742 = floor(_740);
        float _744 = -_742;
        float _746 = _740 + _744;
        _748 = _746;
        _750 = true;
    }
    else
    {
        _748 = _164;
    }
    _750 = false;
    float _752 = _748;
    float _754 = in.m_59.x;
    float _756 = in.m_59.y;
    float _758 = in.m_59.z;
    float _760 = -_164;
    float _762 = _760 + 0.800000011920928955078125;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    float _766 = in.m_51.x;
    float _768 = in.m_51.y;
    float _770 = in.m_51.z;
    float _772 = in.m_51.w;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _776 = _774 != 0;
    float _778 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _780 = log2(_778);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _784 = _782 != 0;
    float _786 = in.m_61.y;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _792 = in.m_44.x;
    float _794 = in.m_44.y;
    float _796 = in.m_44.z;
    float _798 = 1.0 / _790;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _810 = _808 != 0;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _816 = _434;
    if (_784)
    {
        float _818 = in.m_51.z;
        _816 = _818;
    }
    float _820 = _816;
    float _822 = 1.0 / _814;
    float _824 = _758 * 12.98980045318603515625;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _834 = fma(_770, 6.283185482025146484375, _134);
    float _836 = _768 + _770;
    float _838 = _766 + _770;
    float _840 = _770 + (-0.5);
    float _842 = _770 * 2.0;
    bool _844 = _772 > 0.5;
    float _846 = fma(_772, 6.283185482025146484375, _134);
    float _848 = _768 + _766;
    float _850 = _766 + (-0.5);
    float _852 = _766 * 2.0;
    float _854 = fma(_766, 78.233001708984375, _824);
    float _856 = -_786;
    float _858 = _856 + 1.0;
    float _860 = fma(_768, 6.283185482025146484375, _134);
    float _862 = _768 + (-0.5);
    float _864 = fma(_768, 78.233001708984375, _824);
    float _866 = _768 * 2.0;
    float _868 = fma(_764, -2.0, 3.0);
    float _870 = _764 * _764;
    float _872 = _786;
    if (_776)
    {
        float _874 = _844 ? _858 : _786;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = 1.0 / _828;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _884 = _868 * _870;
    float _886 = precise::clamp(_884, 0.0, 1.0);
    float _888 = _794 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _890 = _794 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _892;
    float _896 = 1.0 / _832;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _902 = _894 * _798;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _916 = _794 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = 1.0 / _882;
    float _920 = _910 * _822;
    float _922 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[5].x, _888);
    float _924 = in.m_61.x;
    float _926 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[6].x, _890);
    float _928 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _930 = _906 * _878;
    float _932 = 1.0 / _900;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _938;
    bool _942 = _820 > 0.5;
    bool _944 = _942 && _784;
    float _946 = _836 + (-1.0);
    float _948 = _838 + (-1.0);
    float _950 = _940 * _896;
    float _952 = _780 * _134;
    float _954 = floor(_842);
    float _956 = _936 * _918;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _962;
    float _966 = _848 + (-1.0);
    float _968 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[4].z, _928);
    float _970 = _854 * 0.15915493667125701904296875;
    float _972 = 1.0 / _914;
    float _974 = _964 * _932;
    float _976 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _978 = _864 * 0.15915493667125701904296875;
    float _980 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _982 = floor(_852);
    bool _984 = _954 > 0.0;
    float _986 = _834 * 1.74532926082611083984375;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[182].x;
    float _990 = _924;
    float _992 = _980;
    int _994 = as_type<int>(_976);
    if (_784)
    {
        _988 = _924;
    }
    float _996 = _988;
    float _998 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1000 = _954 >= 0.0;
    bool _1002 = isnan(_954);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(0.0);
    bool _1008 = _1004 || _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1012 = 1.0 + _1010;
    float _1014 = exp2(_952);
    float _1016 = _960 * _972;
    float _1018 = _996;
    if (_944)
    {
        float _1020 = -_996;
        float _1022 = _1020 + 1.0;
        _1018 = _1022;
    }
    float _1024 = _1018;
    int _1026 = _1008 ? 0 : 1;
    if (_784)
    {
        _990 = _1024;
    }
    float _1028 = _990;
    float _1030 = floor(_866);
    bool _1032 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1034 = isnan(1.0);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1040 = _1036 || _1038;
    int _1042 = ~_1026;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    bool _1048 = _982 >= 0.0;
    bool _1050 = isnan(_982);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    int _1058 = _1046;
    if (!_984)
    {
        int _1060 = ~_1026;
        int _1062 = _1060 + 1;
        _1058 = _1062;
    }
    int _1064 = _1058;
    float _1066 = _978 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = -_1014;
    float _1072 = _1070 + 1.0;
    bool _1074 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1076 = isnan(0.0);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1082 = _1078 || _1080;
    bool _1084 = _982 > 0.0;
    float _1086 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[5].z, _922);
    float _1088 = _1082 ? _1072 : 0.0;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1092 = _752 + _1090;
    float _1094 = 1.0 / _1012;
    int _1096 = _1056 ? 0 : 1;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1100 = _752 + _1098;
    bool _1102 = _1030 > 0.0;
    float _1104 = fma(_920, _1092, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1106 = _1030 >= 0.0;
    bool _1108 = isnan(_1030);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[6].z, _926);
    bool _1118 = !_806;
    int _1120 = _1118 ? 0 : 1;
    float _1122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1124 = _1068 * 43758.546875;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1128 = _752 + _1126;
    float _1130 = fma(_902, _1100, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    int _1132 = abs(_1120);
    float _1134 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1136 = fma(_930, _1128, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    int _1138 = ~_1096;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1146 = _1142;
    if (_1040)
    {
        float _1148 = _1088 * _1094;
        _152 = _1148;
    }
    float _1150 = _152;
    float _1152 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1154 = _1114 ? 0 : 1;
    float _1156 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_1084)
    {
        int _1158 = ~_1096;
        int _1160 = _1158 + 1;
        _1146 = _1160;
    }
    int _1162 = _1146;
    float _1164 = floor(_1124);
    float _1166 = _1152 * _1122;
    int _1168 = ~_1154;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    int _1174 = _1172;
    if (!_1102)
    {
        int _1176 = ~_1154;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    float _1182 = _846 * 1.74532926082611083984375;
    float _1184 = _1134 * _1144;
    float _1186 = _1182 * 0.15915493667125701904296875;
    float _1188 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1190 = float(_1132);
    float _1192 = _970 * 6.283185482025146484375;
    float _1194 = sin(_1192);
    float _1196 = float(_1162);
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1200 = _1188 + _1198;
    out.m_63.z = _1184;
    out.m_63.w = _1166;
    float _1202 = -_1164;
    float _1204 = _1124 + _1202;
    float _1206 = _860 * 1.74532926082611083984375;
    float _1208 = _968 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1210 = _1190 * _1196;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1214 = in.m_65.x;
    float _1216 = in.m_65.y;
    float _1218 = in.m_65.z;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1208 + _1220;
    float _1224 = fma(_1204, 4.0, -2.0);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1156 + _1226;
    bool _1230 = !_810;
    int _1232 = _1230 ? 0 : 1;
    float _1234 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1212);
    bool _1236 = !_802;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1210 * (-2.0);
    int _1242 = abs(_1232);
    float _1244 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1234);
    int _1246 = abs(_1238);
    float _1248 = _986 * 0.15915493667125701904296875;
    float _1250 = float(_1242);
    float _1252 = _1206 * 0.15915493667125701904296875;
    bool _1254 = _1244 >= 0.0;
    float _1256 = _1200 * _1200;
    float _1258 = float(_1180);
    float _1260 = _728 * _1224;
    float _1262 = float(_1246);
    float _1264 = fma(_1222, _1222, _1256);
    float _1266 = float(_1064);
    float _1268 = _1250 * _1258;
    float _1270 = _1194 * 43758.546875;
    float _1272 = fma(_1228, _1228, _1264);
    float _1274 = fma(_1240, _1216, _1216);
    float _1276 = _1262 * _1266;
    float _1278 = fma(_980, _1240, _980);
    float _1280 = _1268 * (-2.0);
    float _1282 = _1208;
    if (_1254)
    {
        _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1284 = _992;
    float _1286 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1274);
    float _1288 = rsqrt(_1272);
    float _1290 = fma(_976, _1280, _976);
    float _1292 = _1260 * 0.15915493667125701904296875;
    if (_1254)
    {
        float _1294 = _1284 * 5.0;
        _994 = as_type<int>(_1294);
    }
    int _1296 = _994;
    float _1298 = fma(_1278, _1150, _1286);
    float _1300 = fma(_1280, _1218, _1218);
    if (_1254)
    {
        out.m_47.x = 0.0;
    }
    float _1302 = _1186 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = in.m_67.x;
    float _1308 = in.m_67.y;
    float _1310 = in.m_67.z;
    if (_1254)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4922 = as_type<float>(_1296);
        out.gl_Position.z = _4922;
    }
    float _1312 = _1252 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1200 * _1288;
    float _1318 = _1222 * _1288;
    float _1320 = _1248 * 6.283185482025146484375;
    float _1322 = sin(_1320);
    float _1324 = floor(_1270);
    float _1326 = _1292 * 6.283185482025146484375;
    float _1328 = sin(_1326);
    float _1330 = _1328;
    if (_1254)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1332 = -_1316;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1188);
    float _1336 = _1228 * _1288;
    float _1338 = -_1318;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1208);
    float _1342 = _1276 * (-2.0);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1334 + _1344;
    float _1348 = -_1336;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1354 = _1340 + _1352;
    float _1356 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1300);
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1362 = _1350 + _1360;
    float _1364 = fma(_1342, _1214, _1214);
    float _1366 = fma(_1290, _1150, _1356);
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1358);
    float _1370 = -_1324;
    float _1372 = _1270 + _1370;
    float _1374 = fma(_998, _1342, _998);
    float _1376 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1364);
    float _1378 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1368);
    float _1380 = -_1316;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1384 = _1292 * 6.283185482025146484375;
    float _1386 = cos(_1384);
    float _1388 = _1366 * 0.15915493667125701904296875;
    float _1390 = _164 * _164;
    float _1392 = _1372 * 0.5;
    bool _1394 = _1378 >= 0.0;
    float _1396 = -_1318;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1400 = _1382 * _1382;
    float _1402 = fma(_1374, _1150, _1376);
    float _1404 = -_754;
    float _1406 = _1404 + _1306;
    float _1408 = -_756;
    float _1410 = _1408 + _1308;
    float _1412 = _728 * _1372;
    float _1414 = _1412 * 4.0;
    float _1416 = -_1392;
    float _1418 = fma(_1390, 1.5, _1416);
    float _1420 = precise::clamp(_1418, 0.0, 1.0);
    float _1422 = -_1310;
    float _1424 = _758 + _1422;
    float _1426 = fma(_1398, _1398, _1400);
    float _1428 = -_1336;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1432 = _1298 * 0.15915493667125701904296875;
    float _1434 = fma(_1420, _1424, _1310);
    float _1436 = _1402 * 0.15915493667125701904296875;
    float _1438 = fma(_1430, _1430, _1426);
    float _1440 = _1328 * _1410;
    float _1442 = _1398;
    float _1444 = _1334;
    if (_1394)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1446 = _1442;
    float _1448 = _1386 * _1410;
    float _1450 = _1432 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    int _1454 = as_type<int>(_1446);
    float _1456 = _1386;
    if (_1394)
    {
        out.m_47.x = 0.0;
    }
    if (_1394)
    {
        float _1458 = _1446 * 5.0;
        _1454 = as_type<int>(_1458);
    }
    int _1460 = _1454;
    float _1462 = -_1440;
    float _1464 = fma(_1386, _1406, _1462);
    float _1466 = fma(_1328, _1406, _1448);
    float _1468 = _1432 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    if (_1394)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5172 = as_type<float>(_1460);
        out.gl_Position.z = _5172;
    }
    float _1472 = _1388 * 6.283185482025146484375;
    float _1474 = sin(_1472);
    float _1476 = _1388 * 6.283185482025146484375;
    float _1478 = cos(_1476);
    float _1480 = _1436 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = sqrt(_1438);
    if (_1394)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1486 = -_1188;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = -_1208;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1494 = _886 * 0.119999997317790985107421875;
    float _1496 = _1466 + _756;
    float _1498 = _1488 * _1488;
    float _1500 = -_1156;
    float _1502 = _1500 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1504 = _1436 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = -_1466;
    float _1510 = fma(_1508, _1420, _1496);
    float _1512 = fma(_1492, _1492, _1498);
    float _1514 = _1464 + _754;
    float _1516 = fma(_1414, _758, _1434);
    float _1518 = fma(_1414, _756, _1510);
    float _1520 = fma(_1502, _1502, _1512);
    float _1522 = -_1464;
    float _1524 = fma(_1522, _1420, _1514);
    float _1526 = fma(_1304, _1494, _1516);
    float _1528 = _1470 * _1478;
    float _1530 = rsqrt(_1520);
    float _1532 = _1452 * _1474;
    float _1534 = fma(_1414, _754, _1524);
    float _1536 = fma(_1322, _1494, _1518);
    float _1538 = _1452 * _1478;
    float _1540 = fma(_1482, _1532, _1528);
    float _1542 = _1452 * _1506;
    float _1544 = fma(_1482, _1528, _1532);
    float _1546 = fma(_1314, _1494, _1534);
    float _1548 = _1288 * _1484;
    float _1550 = _1470 * _1474;
    float _1552 = _1470 * _1506;
    float _1554 = _1474 * _1506;
    float _1556 = _1478 * _1506;
    float _1558 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1560 = -_1538;
    float _1562 = fma(_1482, _1550, _1560);
    float _1564 = _1492 * _1530;
    float _1566 = _1488 * _1530;
    float _1568 = _1502 * _1530;
    float _1570 = _1548 * _1558;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1574 = _1564 * _1572;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1578 = _1566 * _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1582 = _1568 * _1580;
    float _1584 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1588 = -_1574;
    float _1590 = fma(_1568, _1586, _1588);
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = -_1578;
    float _1596 = fma(_1564, _1592, _1594);
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1600 = -_1582;
    float _1602 = fma(_1566, _1598, _1600);
    float _1604 = _1590 * _1590;
    float _1606 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1608 = -_1550;
    float _1610 = fma(_1482, _1538, _1608);
    float _1612 = _1548 * _1584;
    float _1614 = fma(_1602, _1602, _1604);
    float _1616 = _1548 * _1606;
    float _1618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1536);
    float _1620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1546);
    float _1622 = fma(_1596, _1596, _1614);
    bool _1624 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1626 = isnan(_752);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = _1618 * _1616;
    float _1638 = _1620 * _1612;
    float _1640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1526);
    bool _1642 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1644 = isnan(_752);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = rsqrt(_1622);
    float _1656 = _1610 * _1636;
    float _1658 = -_1634;
    float _1660 = _1658 + 1.0;
    float _1662 = _1640 * _1570;
    float _1664 = _1556 * _1636;
    float _1666 = fma(_1540, _1638, _1656);
    float _1668 = _1544 * _1636;
    bool _1670 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1672 = isnan(_752);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = -_1652;
    float _1684 = _1682 + 1.0;
    float _1686 = _1652 * _1660;
    float _1688 = fma(_1554, _1638, _1664);
    float _1690 = fma(_1562, _1638, _1668);
    float _1692 = fma(_1542, _1662, _1666);
    bool _1694 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1696 = isnan(_752);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    float _1706 = _1680 * _1684;
    float _1708 = -_1680;
    float _1710 = _1708 + 1.0;
    float _1712 = _1602 * _1654;
    float _1714 = -_1482;
    float _1716 = fma(_1714, _1662, _1688);
    float _1718 = _1590 * _1654;
    float _1720 = _1596 * _1654;
    bool _1722 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1724 = isnan(_752);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = _1704 * _1710;
    float _1736 = -_1704;
    float _1738 = _1736 + 1.0;
    float _1740 = _1566 * _1712;
    float _1742 = fma(_1552, _1662, _1690);
    bool _1744 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1746 = isnan(_752);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = _1568 * _1718;
    float _1758 = _758 + _754;
    float _1760 = -_1732;
    float _1762 = _1760 + 1.0;
    float _1764 = -_1740;
    float _1766 = fma(_1564, _1718, _1764);
    float _1768 = _1732 * _1738;
    float _1770 = -_1756;
    float _1772 = fma(_1566, _1720, _1770);
    float _1774 = _1758 * 78.233001708984375;
    bool _1776 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1778 = isnan(_752);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1754 * _1762;
    float _1790 = _1766 * _1716;
    float _1792 = -_1754;
    float _1794 = _1792 + 1.0;
    float _1796 = fma(_754, 12.98980045318603515625, _1774);
    float _1798 = _1772 * _1716;
    float _1800 = fma(_1720, _1692, _1790);
    float _1802 = _1786 * _1794;
    float _1804 = _1796 * 0.15915493667125701904296875;
    float _1806 = fma(_1712, _1692, _1798);
    float _1808 = fma(_1568, _1742, _1800);
    float _1810 = _1130 * _1802;
    float _1812 = -_1786;
    float _1814 = _1812 + 1.0;
    float _1816 = _1804 * 6.283185482025146484375;
    float _1818 = sin(_1816);
    float _1820 = fma(_1564, _1742, _1806);
    float _1822 = _1156 + _1808;
    float _1824 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1810);
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1828 = _752 + _1826;
    float _1830 = _1208 + _1820;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1834 = _1822 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1838 = _752 + _1836;
    float _1840 = fma(_956, _1828, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1844 = _1830 + _1842;
    float _1846 = _1834 * _1834;
    float _1848 = fma(_1136, _1788, _1824);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1852 = _752 + _1850;
    float _1854 = fma(_950, _1838, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1856 = fma(_1844, _1844, _1846);
    float _1858 = fma(_1104, _1768, _1848);
    float _1860 = _1818 * 43758.546875;
    float _1862 = fma(_1016, _1852, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1864 = sqrt(_1856);
    bool _1866 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1868 = isnan(_752);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = fma(_1840, _1734, _1858);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1882 = _752 + _1880;
    float _1884 = _1564 * _1720;
    float _1886 = fma(_1854, _1706, _1878);
    float _1888 = -_1876;
    float _1890 = _1888 + 1.0;
    float _1892 = floor(_1860);
    float _1894 = -_1884;
    float _1896 = fma(_1568, _1712, _1894);
    float _1898 = fma(_974, _1882, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1900 = _1634 * _1890;
    float _1902 = fma(_1862, _1686, _1886);
    float _1904 = _1896 * _1716;
    bool _1906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1908 = isnan(0.5);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1914 = _1910 || _1912;
    float _1916 = fma(_1898, _1900, _1902);
    float _1918 = fma(_1718, _1692, _1904);
    bool _1920 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1922 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1916);
    float _1924 = fma(_1566, _1742, _1918);
    float _1926 = -_1892;
    float _1928 = _1860 + _1926;
    float _1930 = _1188 + _1924;
    float _1932 = _1922 * _1928;
    float _1934 = _1922;
    float _1936 = _1742;
    float _1938 = _1830;
    if (!_1920)
    {
        _1934 = _1822;
    }
    float _1940 = _1934;
    float _1942 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1930);
    float _1944 = _1940;
    if (!_1920)
    {
        _1936 = _1942;
    }
    float _1946 = _1936;
    bool _1948 = !_1920;
    float _1950 = _1946;
    if (!_1948)
    {
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1956 = _1864 + _1954;
        float _1958 = rsqrt(_1856);
        float _1960 = _1956 * _1952;
        float _1962 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1964 = _1960 * 0.15915493667125701904296875;
        float _1966 = _1964 * 6.283185482025146484375;
        float _1968 = sin(_1966);
        float _1970 = _1964 * 6.283185482025146484375;
        float _1972 = cos(_1970);
        float _1974 = fma(_1968, _1962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1976 = _1958 * _1974;
        float _1978 = _1972 + (-1.0);
        float _1980 = fma(_1844, _1976, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1982 = fma(_1834, _1976, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1984 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1986 = fma(_1942, _1972, _1984);
        _1938 = _1980;
        _1950 = _1986;
        _1944 = _1982;
    }
    float _1988 = _1938;
    float _1990 = _1950;
    float _1992 = _1944;
    float _1994 = -_1318;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1988);
    float _1998 = -_1316;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1990);
    float _2002 = -_1336;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1992);
    float _2006 = _2000;
    float _2008 = _1996;
    float _2010 = _2004;
    if (!_1914)
    {
        float _2012 = _1346 * _1346;
        float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2016 = -_1156;
        float _2018 = _2016 + _1992;
        float _2020 = fma(_1354, _1354, _2012);
        float _2022 = fma(_1362, _1362, _2020);
        float _2024 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2026 = sqrt(_2022);
        float _2028 = 1.0 / _1548;
        float _2030 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2032 = precise::min(_2026, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2034 = _2032 * _2014;
        float _2036 = -_1188;
        float _2038 = _2036 + _1990;
        float _2040 = _2034 * _2028;
        float _2042 = -_1208;
        float _2044 = _2042 + _1988;
        float _2046 = _2030 * _2040;
        float _2048 = _2018 * _2040;
        float _2050 = fma(_2044, _2046, _1340);
        float _2052 = fma(_2038, _2046, _1334);
        float _2054 = fma(_2030, _2048, _1350);
        _2006 = _2052;
        _2008 = _2050;
        _2010 = _2054;
    }
    float _2056 = _2006;
    float _2058 = _2008;
    float _2060 = _2010;
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2064 = _2056 + _2062;
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2068 = _2058 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2072 = _2060 + _2070;
    float _2074 = _2064 * _2064;
    float _2076 = fma(_2068, _2068, _2074);
    float _2078 = fma(_2072, _2072, _2076);
    float _2080 = rsqrt(_2078);
    float _2082 = sqrt(_2078);
    float _2084 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2086 = _2068 * _2084;
    float _2088 = _2072 * _2084;
    float _2090 = _2086 * _2086;
    float _2092 = _2088 * _2088;
    float _2094 = _2090 + _2092;
    float _2096 = sqrt(_2094);
    bool _2098 = _2096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2102 = _2096 + _2100;
    float _2104 = _2072;
    float _2106 = _2102;
    float _2108 = _2084;
    if (_2098)
    {
        float _2110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2104 = _2110;
    }
    float _2112 = _2104;
    if (_2098)
    {
        float _2114 = rsqrt(_2094);
        _1282 = _2114;
    }
    float _2116 = _1282;
    float _2118 = _2116;
    if (_2098)
    {
        float _2120 = _2102 * _2112;
        _2106 = _2120;
    }
    float _2122 = _2106;
    float _2124 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_2098)
    {
        float _2126 = _2122 * 0.15915493667125701904296875;
        _1444 = _2126;
    }
    float _2128 = _1444;
    float _2130 = _2080;
    if (_2098)
    {
        float _2132 = _2128 * 6.283185482025146484375;
        float _2134 = sin(_2132);
        _2130 = _2134;
    }
    float _2136 = _2130;
    float _2138 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2140 = precise::max(0.0, _2138);
    float _2142 = _2074;
    float _2144 = _2140;
    float _2146 = _2138;
    if (_2098)
    {
        float _2148 = _2128 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        _2142 = _2150;
    }
    float _2152 = _2142;
    float _2154 = -_2084;
    float _2156 = -_2140;
    float _2158 = fma(_2064, _2154, _2156);
    float _2160 = _2158;
    if (_2098)
    {
        float _2162 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2162;
    }
    float _2164 = _2144;
    float _2166 = _2164;
    float _2168 = _2136;
    if (_2098)
    {
        float _2170 = fma(_2136, _2164, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2166 = _2170;
    }
    float _2172 = _2166;
    float _2174 = _2172;
    if (!_2098)
    {
        _2168 = _2086;
    }
    float _2176 = _2168;
    float _2178 = _2176;
    float _2180 = _2152;
    if (_2098)
    {
        float _2182 = _2152 + (-1.0);
        _2146 = _2182;
    }
    float _2184 = _2146;
    float _2186 = _2184;
    if (_2098)
    {
        float _2188 = _2116 * _2172;
        _2108 = _2188;
    }
    float _2190 = _2108;
    if (!_2098)
    {
        _2174 = _2090;
    }
    float _2192 = _2174;
    float _2194 = _2192;
    if (_2098)
    {
        float _2196 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2118 = _2196;
    }
    float _2198 = _2118;
    if (_2098)
    {
        float _2200 = _2086 * _2190;
        _2178 = _2200;
    }
    float _2202 = _2178;
    if (!_2098)
    {
        _2186 = _2088;
    }
    float _2204 = _2186;
    float _2206 = _2204;
    if (_2098)
    {
        float _2208 = _2088 * _2190;
        _2206 = _2208;
    }
    float _2210 = _2206;
    if (_2098)
    {
        float _2212 = fma(_2158, _2152, _2198);
        _2160 = _2212;
    }
    float _2214 = _2160;
    if (_2098)
    {
        float _2216 = _2202 * _2202;
        _2194 = _2216;
    }
    float _2218 = _2194;
    if (!_2098)
    {
        _2180 = _2092;
    }
    float _2220 = _2180;
    float _2222 = _2220;
    if (_2098)
    {
        float _2224 = _2210 * _2210;
        _2222 = _2224;
    }
    float _2226 = _2222;
    float _2228 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2230 = fma(_2214, _2214, _2218);
    float _2232 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2228);
    float _2234 = _2230 + _2226;
    float _2236 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2240 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2238);
    float _2242 = precise::clamp(_2240, 0.0, 1.0);
    float _2244 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2232);
    float _2246 = rsqrt(_2234);
    float _2248 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2250 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2236);
    float _2252 = -_2242;
    float _2254 = _2252 + 1.0;
    float _2256 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2258 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2248);
    float _2260 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2250);
    float _2262 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2264 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2256);
    float _2266 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2258);
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2270 = abs(_2254);
    float _2272 = log2(_2270);
    float _2274 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2264);
    float _2276 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2280 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2282 = _2246 * _2202;
    float _2284 = _2246 * _2214;
    float _2286 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2278);
    float _2288 = _2246 * _2210;
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2292 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2294 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2286);
    float _2296 = -_2280;
    float _2298 = fma(_2296, _2124, 1.0);
    float _2300 = -_2290;
    float _2302 = fma(_2284, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2300);
    float _2304 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2306 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2294);
    float _2308 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2310 = -_2288;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2302);
    float _2314 = log2(_2298);
    float _2316 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2318 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2304);
    float _2320 = fma(_2312, -0.5, 0.5);
    float _2322 = fma(_2312, 0.5, 0.5);
    float _2324 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2316);
    float _2326 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2318);
    float _2328 = _2284 + 1.0;
    float _2330 = 1.0 / _2306;
    float _2332 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2324);
    float _2334 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2332);
    float _2336 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2326);
    float _2338 = exp2(_2308);
    float _2340 = _2314 * 0.693147182464599609375;
    float _2342 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2344 = sqrt(_2320);
    float _2346 = fma(_2322, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2348 = _2334 * _2330;
    float _2350 = _2336 * _2330;
    float _2352 = fma(_2322, _2346, -0.212114393711090087890625);
    float _2354 = fma(_2348, 0.5, 0.5);
    float _2356 = fma(_2350, -0.5, 0.5);
    float _2358 = -_2284;
    float _2360 = fma(_2338, _2328, _2358);
    float _2362 = fma(_2322, _2352, 1.570728778839111328125);
    float _2364 = fma(_2360, 0.5, 0.5);
    float _2366 = _2344 * 0.636619746685028076171875;
    float3 _6584 = float3(_2354, _2356, _2342);
    float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6584, float3(0.0), isnan(_6584)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6584, float3(0.0), isnan(_6584)), level(0.0)).x;
    float _2370 = -_2362;
    float _2372 = fma(_2366, _2370, 1.0);
    float3 _6600 = float3(_2354, _2356, _2342);
    float4 _2375 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6600, float3(0.0), isnan(_6600)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6600, float3(0.0), isnan(_6600)), level(0.0)).xyzw;
    float _2377 = _2375.x;
    float _2379 = _2375.y;
    float _2381 = _2375.z;
    float _2383 = _2375.w;
    float2 _6617 = float2(_2372, _2364);
    float3 _2387 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6617, float2(0.0), isnan(_6617)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6617, float2(0.0), isnan(_6617)), level(0.0)).xyz;
    float _2389 = _2387.x;
    float _2391 = _2387.y;
    float _2393 = _2387.z;
    float _2395 = in.m_69.x;
    float _2397 = in.m_69.y;
    bool _2399 = _1536 != 0.0;
    bool _2401 = isnan(_1536);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(0.0);
    bool _2407 = _2403 || _2405;
    float _2409 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2411 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2413 = in.m_69.z;
    bool _2415 = _1546 == 0.0;
    bool _2417 = !_2407;
    bool _2419 = _2415 && _2417;
    float _2421 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2411);
    float _2423 = in.m_71.x;
    float _2425 = in.m_71.y;
    float _2427 = in.m_71.z;
    float _2429 = in.m_71.w;
    bool _2431 = _1526 == 0.0;
    bool _2433 = _2431 && _2419;
    float _2435 = exp2(_2409);
    float _2437 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2421);
    out.m_53.x = _358;
    out.m_53.y = _362;
    out.m_53.z = _366;
    out.m_55.x = _368;
    out.m_55.y = _370;
    out.m_55.z = _372;
    out.m_73.x = _2058;
    out.m_73.y = _2056;
    out.m_73.z = _2060;
    float _2439 = _1328 * _2397;
    float _2441 = _1386 * _2397;
    float _2443 = _1554 * _1772;
    float _2445 = -_2435;
    float _2447 = _2445 + 1.0;
    float _2449 = _2342;
    float _2451 = _2395;
    if (_2433)
    {
        _2449 = _2413;
    }
    float _2453 = _2449;
    float _2455 = -_2439;
    float _2457 = fma(_1386, _2395, _2455);
    float _2459 = fma(_1328, _2395, _2441);
    float _2461 = _1556 * _1772;
    float _2463 = _2453;
    if (_2433)
    {
        _1456 = _2453;
    }
    float _2465 = _1456;
    float _2467 = _2457 * _2427;
    float _2469 = _2465;
    if (!_2433)
    {
        _2463 = _2413;
    }
    float _2471 = _2463;
    float _2473 = _2459 * _2423;
    if (_2433)
    {
        _2451 = _2457;
    }
    float _2475 = _2451;
    float _2477 = _2475;
    if (!_2433)
    {
        float _2479 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2457);
        _2477 = _2479;
    }
    float _2481 = _2477;
    float _2483 = _1556 * _1766;
    float _2485 = _2425 * _2471;
    float _2487 = -_2473;
    float _2489 = fma(_2457, _2425, _2487);
    float _2491 = -_2467;
    float _2493 = fma(_2423, _2471, _2491);
    if (!_2433)
    {
        float _2495 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2471);
        _2469 = _2495;
    }
    float _2497 = _2469;
    float _2499 = -_2485;
    float _2501 = fma(_2459, _2427, _2499);
    float _2503 = _2489 * _2429;
    float _2505 = _2493 * _2429;
    float _2507 = _1556 * _1896;
    float _2509 = _2501 * _2429;
    float _2511 = _1554 * _1896;
    float _2513 = -_1772;
    float _2515 = _1482 * _2513;
    float _2517 = -_1896;
    float _2519 = _1482 * _2517;
    float _2521 = -_1766;
    float _2523 = _1482 * _2521;
    float _2525 = _1554 * _1766;
    float _2527 = fma(_1540, _1712, _2443);
    float _2529 = fma(_1610, _1712, _2461);
    float _2531 = fma(_1610, _1718, _2507);
    float _2533 = fma(_1540, _1718, _2511);
    float _2535 = fma(_1610, _1720, _2483);
    if (_2433)
    {
        _1330 = _2459;
    }
    float _2537 = _1330;
    float _2539 = fma(_1542, _1712, _2515);
    float _2541 = fma(_1542, _1718, _2519);
    float _2543 = _2537;
    if (!_2433)
    {
        float _2545 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2459);
        _2543 = _2545;
    }
    float _2547 = _2543;
    float _2549 = fma(_1542, _1720, _2523);
    float _2551 = fma(_1540, _1720, _2525);
    float _2553 = fma(_1562, _1564, _2527);
    float _2555 = fma(_1544, _1564, _2529);
    float _2557 = fma(_1544, _1566, _2531);
    float _2559 = fma(_1562, _1566, _2533);
    float _2561 = fma(_1544, _1568, _2535);
    float _2563 = fma(_1552, _1564, _2539);
    float _2565 = fma(_1552, _1566, _2541);
    float _2567 = fma(_1552, _1568, _2549);
    float _2569 = fma(_1562, _1568, _2551);
    float _2571 = _2555 * _2425;
    float _2573 = _2557 * _2425;
    float _2575 = _2555 * _2547;
    float _2577 = _2557 * _2547;
    float _2579 = _2561 * _2425;
    float _2581 = _2505 * _2555;
    float _2583 = _2505 * _2557;
    float _2585 = _2505 * _2561;
    float _2587 = fma(_2553, _2481, _2575);
    float _2589 = fma(_2559, _2481, _2577);
    float _2591 = fma(_2553, _2423, _2571);
    float _2593 = fma(_2509, _2553, _2581);
    float _2595 = fma(_2559, _2423, _2573);
    float _2597 = fma(_2569, _2423, _2579);
    float _2599 = fma(_2509, _2559, _2583);
    float _2601 = fma(_2509, _2569, _2585);
    float _2603 = _2561 * _2547;
    float _2605 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2607 = fma(_2503, _2563, _2593);
    float _2609 = fma(_2503, _2565, _2599);
    float _2611 = fma(_2503, _2567, _2601);
    float _2613 = fma(_2569, _2481, _2603);
    float _2615 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2437);
    float _2617 = fma(_2563, _2427, _2591);
    float _2619 = fma(_2563, _2497, _2587);
    float _2621 = fma(_2565, _2497, _2589);
    out.m_75.x = _2607;
    out.m_75.y = _2609;
    out.m_75.z = _2611;
    float _2623 = fma(_2567, _2497, _2613);
    float _2625 = _2615 + _2306;
    float _2627 = fma(_2565, _2427, _2595);
    float _2629 = fma(_2567, _2427, _2597);
    float _2631 = _2625 * 0.5;
    out.m_77.x = _2619;
    out.m_77.y = _2621;
    out.m_77.z = _2623;
    bool _2633 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2635 = isnan(_2082);
    bool _2637 = _2633 || _2635;
    bool _2639 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2641 = _2637 || _2639;
    out.m_79.x = _2617;
    out.m_79.y = _2627;
    out.m_79.z = _2629;
    float _2643 = -_2605;
    float _2645 = _2643 + 1.0;
    out.m_81.z = _2631;
    out.m_81.w = _2306;
    out.gl_Position.x = _2334;
    out.gl_Position.y = _2336;
    out.gl_Position.z = _2615;
    out.gl_Position.w = _2306;
    float _2647 = _2625;
    float _2649 = _2611;
    float _2651 = _2609;
    float _2653 = _2334;
    float _2655 = _2645;
    if (!_2641)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2657 = _2647;
    float _2659 = _2657;
    float _2661 = _2657;
    if (!_2641)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2663 = _2649;
    float _2665 = _2663;
    float _2667 = _2663;
    if (!_2641)
    {
        _2651 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2669 = _2651;
    float _2671 = _2669;
    float _2673 = _2669;
    if (!_2641)
    {
        _2653 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2675 = _2653;
    float _2677 = _2605 * _2368;
    float _2679 = _2383 * _2677;
    float _2681 = _2383 * _2645;
    float _2683 = _2679;
    float _2685 = _2675;
    float _2687 = _2675;
    if (!_2641)
    {
        _2655 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2689 = _2655;
    float _2691 = _2393 * _2677;
    float _2693 = fma(_2389, _2679, _2377);
    float _2695 = fma(_2391, _2679, _2379);
    float _2697 = _2689;
    float _2699 = _2689;
    if (!_2641)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2701 = _2683;
    float _2703 = fma(_2383, _2691, _2381);
    out.m_83.x = _2693;
    out.m_83.y = _2695;
    out.m_83.z = _2703;
    out.m_83.w = _2681;
    bool _2705 = !_2641;
    float _2707 = _2701;
    float _2709 = _2701;
    if (!_2705)
    {
        bool _2711 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2713 = isnan(_2082);
        bool _2715 = _2711 || _2713;
        bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2719 = _2715 || _2717;
        if (!_2719)
        {
            float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2723 = _2082 + _2721;
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2727 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2725;
            float _2729 = 1.0 / _2727;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2751 = _2723 * _2729;
            float _2753 = precise::clamp(_2751, 0.0, 1.0);
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2759 = fma(_2753, _2733, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2761 = fma(_2753, _2757, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2763 = fma(_2753, _2737, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2765 = fma(_2753, _2741, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2767 = fma(_2753, _2745, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2769 = fma(_2753, _2749, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2687 = _2761;
            _2673 = _2767;
            _2661 = _2759;
            _2667 = _2765;
            _2709 = _2763;
            _2699 = _2769;
            _2771 = true;
        }
        else
        {
            bool _2773 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2775 = isnan(_2082);
            bool _2777 = _2773 || _2775;
            bool _2779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2781 = _2777 || _2779;
            if (!_2781)
            {
                _2659 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2783 = _2659;
            _2661 = _2783;
            if (!_2781)
            {
                _2685 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2785 = _2685;
            _2687 = _2785;
            if (!_2781)
            {
                _2707 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2787 = _2707;
            _2709 = _2787;
            if (!_2781)
            {
                _2665 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2789 = _2665;
            _2667 = _2789;
            if (!_2781)
            {
                _2671 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2791 = _2671;
            _2673 = _2791;
            if (!_2781)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2793 = _2697;
            bool _2795 = !_2781;
            _2699 = _2793;
            if (!_2795)
            {
                bool _2797 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2799 = isnan(_2082);
                bool _2801 = _2797 || _2799;
                bool _2803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2805 = _2801 || _2803;
                if (!_2805)
                {
                    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2809 = _2082 + _2807;
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2813 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2811;
                    float _2815 = 1.0 / _2813;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2837 = _2809 * _2815;
                    float _2839 = precise::clamp(_2837, 0.0, 1.0);
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2845 = fma(_2839, _2819, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2847 = fma(_2839, _2843, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2849 = fma(_2839, _2823, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2851 = fma(_2839, _2827, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2853 = fma(_2839, _2831, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2855 = fma(_2839, _2835, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2687 = _2847;
                    _2673 = _2853;
                    _2661 = _2845;
                    _2667 = _2851;
                    _2709 = _2849;
                    _2699 = _2855;
                    _2771 = true;
                }
                else
                {
                    _2687 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2673 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2661 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2667 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2709 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2771 = false;
    float _2857 = _2687;
    float _2859 = _2673;
    float _2861 = _2661;
    float _2863 = _2667;
    float _2865 = _2709;
    float _2867 = _2699;
    float _2869 = fma(_2621, -0.5, 0.5);
    float _2871 = precise::clamp(_2869, 0.0, 1.0);
    float _2873 = -_2857;
    float _2875 = _2873 + _2859;
    float _2877 = -_2861;
    float _2879 = _2877 + _2863;
    float _2881 = -_2865;
    float _2883 = _2881 + _2867;
    bool _2885 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2887 = fma(_2871, _2875, _2857);
    float _2889 = fma(_2871, _2879, _2861);
    float _2891 = fma(_2871, _2883, _2865);
    float _2893 = _2887 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2895 = fma(_2889, 0.298911988735198974609375, _2893);
    float _2897 = fma(_2891, 0.114477999508380889892578125, _2895);
    out.m_85.x = 0.0;
    float _2899 = -_2897;
    float _2901 = _2889 + _2899;
    float _2903 = -_2897;
    float _2905 = _2887 + _2903;
    float _2907 = -_2897;
    float _2909 = _2891 + _2907;
    float _2911 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2913 = fma(_2901, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2915 = fma(_2905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2917 = fma(_2909, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    out.m_87.w = _2911;
    out.m_89.x = _2913;
    out.m_89.y = _2915;
    out.m_89.z = _2917;
    if (!_2885)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2919 = -_2056;
    float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2923 = -_2058;
    float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2927 = -_2060;
    float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2931 = _2921 * _2921;
    float _2933 = fma(_2925, _2925, _2931);
    float _2935 = fma(_2929, _2929, _2933);
    float _2937 = sqrt(_2935);
    float _2939 = rsqrt(_2935);
    float _2941 = -_2937;
    float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2945 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2947 = precise::clamp(_2945, 0.0, 1.0);
    float _2949 = _2925 * _2939;
    float _2951 = _2921 * _2939;
    float _2953 = abs(_2947);
    float _2955 = log2(_2953);
    float _2957 = _2929 * _2939;
    float _2959 = _2949 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2961 = _2621 * _2951;
    float _2963 = -_2951;
    float _2965 = -_2959;
    float _2967 = fma(_2963, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2965);
    float _2969 = fma(_2619, _2949, _2961);
    float _2971 = -_2957;
    float _2973 = fma(_2971, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2967);
    float _2975 = fma(_2623, _2957, _2969);
    float _2977 = precise::clamp(_2975, 0.0, 1.0);
    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2981 = _2973 + _2979;
    float _2983 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2985 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2987 = precise::clamp(_2985, 0.0, 1.0);
    float _2989 = exp2(_2983);
    float _2991 = _2989 * _2987;
    float _2993 = _2977 * _2991;
    float _2995 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2999 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2995;
    out.m_85.y = _2997;
    out.m_85.z = _2999;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2771 = false;
    bool _750 = false;
    bool _426 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3057 = as_type<float>(_124);
        out.gl_Position.z = _3057;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_49.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3121 = as_type<float>(_158);
        out.gl_Position.z = _3121;
    }
    if (_150)
    {
        return out;
    }
    float _160 = 1.0 / _130;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _134 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _188 + _194;
    bool _198 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _200 = isnan(_188);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = -_208;
    float _220 = _218 + 1.0;
    float _222 = 1.0 / _212;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _226 = 1.0 / _216;
    float _228 = _192 * _222;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _230;
    bool _234 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_188);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    bool _246 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_188);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = 1.0 / _232;
    float _260 = _244 * _220;
    float _262 = _196 * _226;
    bool _264 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _266 = isnan(_188);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = _188 + _276;
    float _280 = -_244;
    float _282 = _280 + 1.0;
    float _284 = -_256;
    float _286 = _284 + 1.0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = _256 * _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    float _302 = _274 * _286;
    float _304 = fma(_290, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = fma(_296, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _308 = fma(_300, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = -_274;
    float _312 = _310 + 1.0;
    float _314 = _278 * _258;
    float _316 = _306 * _302;
    float _318 = _308 * _302;
    float _320 = _304 * _302;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].x, _318);
    float _336 = fma(_324, _262, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_328, _262, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _340 = fma(_332, _262, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _342 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _344 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].z, _320);
    float _346 = fma(_336, _292, _334);
    float _348 = fma(_338, _292, _342);
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _358 = _350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _362 = _352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _366 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _368 = _356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _370 = _360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _372 = _364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _358;
    out.m_53.y = _362;
    out.m_53.z = _366;
    float _374 = fma(_340, _292, _344);
    out.m_55.x = _368;
    out.m_55.y = _370;
    out.m_55.z = _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_378, _314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _390 = fma(_382, _314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _392 = fma(_386, _314, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _394 = fma(_388, _260, _346);
    float _396 = fma(_390, _260, _348);
    float _398 = fma(_392, _260, _374);
    float _400 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[146].x, _394);
    float _402 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[146].y, _396);
    float _404 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[146].z, _398);
    bool _406 = !_224;
    float _424;
    if (!_406)
    {
        float _408 = in.m_51.x;
        float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _412 = _408 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _414 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _416 = _414 * _410;
        float _418 = floor(_416);
        float _420 = -_418;
        float _422 = _416 + _420;
        _424 = _422;
        _426 = true;
    }
    else
    {
        _424 = _164;
    }
    _426 = false;
    float _428 = _424;
    float _430 = in.m_57.x;
    float _432 = in.m_57.y;
    float _434 = in.m_57.z;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _444 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _446 = isnan(_428);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _460 = 1.0 / _438;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _470 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _472 = isnan(_428);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    bool _482 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _484 = isnan(_428);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = 1.0 / _442;
    float _496 = -_480;
    float _498 = _496 + 1.0;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _502 = _404 * _434;
    float _504 = _402 * _432;
    float _506 = 1.0 / _458;
    float _508 = _468 * _460;
    float _510 = _400 * _430;
    bool _512 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _514 = isnan(_428);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _528 = _464 * _494;
    float _530 = -_454;
    float _532 = _530 + 1.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _534;
    float _538 = -_522;
    float _540 = _538 + 1.0;
    float _542 = 1.0 / _526;
    float _544 = _480 * _532;
    bool _546 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _548 = isnan(_428);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _536 * _506;
    float _560 = _522 * _498;
    bool _562 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _564 = isnan(_428);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = _556 * _540;
    float _576 = -_556;
    float _578 = _576 + 1.0;
    bool _580 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _582 = isnan(_428);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _594 = _428 + _592;
    bool _596 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _598 = isnan(_428);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _572 * _578;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _614 = -_572;
    float _616 = _614 + 1.0;
    float _618 = -_590;
    float _620 = _618 + 1.0;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _626 = fma(_528, _594, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _628 = _606 * _620;
    float _630 = _590 * _616;
    float _632 = 1.0 / _624;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _638 = _612 * _542;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _642 = _428 + _640;
    float _644 = _626 * _628;
    float _646 = -_606;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _652 = _428 + _650;
    float _654 = fma(_508, _642, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _656 = 1.0 / _636;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _664 = _428 + _662;
    float _666 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[159].x, _644);
    float _668 = fma(_638, _652, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _670 = fma(_558, _664, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _672 = fma(_654, _630, _666);
    float _674 = 1.0 / _660;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _676;
    float _680 = fma(_670, _608, _672);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _686 = _678 * _632;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _690 = _428 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _692;
    float _696 = _684 * _656;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _700 = _428 + _698;
    float _702 = fma(_686, _690, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _704 = fma(_668, _574, _680);
    float _706 = -_492;
    float _708 = _706 + 1.0;
    float _710 = fma(_696, _700, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _714 = _428 + _712;
    float _716 = fma(_702, _560, _704);
    float _718 = _694 * _674;
    float _720 = _454 * _708;
    float _722 = fma(_710, _544, _716);
    float _724 = fma(_718, _714, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _726 = fma(_724, _720, _722);
    float _728 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[166].x, _726);
    bool _730 = !_500;
    float _748;
    if (!_730)
    {
        float _732 = in.m_51.x;
        float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _736 = _732 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[14].z, _134);
        float _740 = _738 * _734;
        float _742 = floor(_740);
        float _744 = -_742;
        float _746 = _740 + _744;
        _748 = _746;
        _750 = true;
    }
    else
    {
        _748 = _164;
    }
    _750 = false;
    float _752 = _748;
    float _754 = in.m_59.x;
    float _756 = in.m_59.y;
    float _758 = in.m_59.z;
    float _760 = -_164;
    float _762 = _760 + 0.800000011920928955078125;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    float _766 = in.m_51.x;
    float _768 = in.m_51.y;
    float _770 = in.m_51.z;
    float _772 = in.m_51.w;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _776 = _774 != 0;
    float _778 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _780 = log2(_778);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _784 = _782 != 0;
    float _786 = in.m_61.y;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _792 = in.m_44.x;
    float _794 = in.m_44.y;
    float _796 = in.m_44.z;
    float _798 = 1.0 / _790;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _810 = _808 != 0;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _816 = _434;
    if (_784)
    {
        float _818 = in.m_51.z;
        _816 = _818;
    }
    float _820 = _816;
    float _822 = 1.0 / _814;
    float _824 = _758 * 12.98980045318603515625;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _834 = fma(_770, 6.283185482025146484375, _134);
    float _836 = _768 + _770;
    float _838 = _766 + _770;
    float _840 = _770 + (-0.5);
    float _842 = _770 * 2.0;
    bool _844 = _772 > 0.5;
    float _846 = fma(_772, 6.283185482025146484375, _134);
    float _848 = _768 + _766;
    float _850 = _766 + (-0.5);
    float _852 = _766 * 2.0;
    float _854 = fma(_766, 78.233001708984375, _824);
    float _856 = -_786;
    float _858 = _856 + 1.0;
    float _860 = fma(_768, 6.283185482025146484375, _134);
    float _862 = _768 + (-0.5);
    float _864 = fma(_768, 78.233001708984375, _824);
    float _866 = _768 * 2.0;
    float _868 = fma(_764, -2.0, 3.0);
    float _870 = _764 * _764;
    float _872 = _786;
    if (_776)
    {
        float _874 = _844 ? _858 : _786;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = 1.0 / _828;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _884 = _868 * _870;
    float _886 = precise::clamp(_884, 0.0, 1.0);
    float _888 = _794 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _890 = _794 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _892;
    float _896 = 1.0 / _832;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _902 = _894 * _798;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _916 = _794 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = 1.0 / _882;
    float _920 = _910 * _822;
    float _922 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[5].x, _888);
    float _924 = in.m_61.x;
    float _926 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[6].x, _890);
    float _928 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _930 = _906 * _878;
    float _932 = 1.0 / _900;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _938;
    bool _942 = _820 > 0.5;
    bool _944 = _942 && _784;
    float _946 = _836 + (-1.0);
    float _948 = _838 + (-1.0);
    float _950 = _940 * _896;
    float _952 = _780 * _134;
    float _954 = floor(_842);
    float _956 = _936 * _918;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _962;
    float _966 = _848 + (-1.0);
    float _968 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[4].z, _928);
    float _970 = _854 * 0.15915493667125701904296875;
    float _972 = 1.0 / _914;
    float _974 = _964 * _932;
    float _976 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _978 = _864 * 0.15915493667125701904296875;
    float _980 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _982 = floor(_852);
    bool _984 = _954 > 0.0;
    float _986 = _834 * 1.74532926082611083984375;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[182].x;
    float _990 = _924;
    float _992 = _980;
    int _994 = as_type<int>(_976);
    if (_784)
    {
        _988 = _924;
    }
    float _996 = _988;
    float _998 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1000 = _954 >= 0.0;
    bool _1002 = isnan(_954);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(0.0);
    bool _1008 = _1004 || _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1012 = 1.0 + _1010;
    float _1014 = exp2(_952);
    float _1016 = _960 * _972;
    float _1018 = _996;
    if (_944)
    {
        float _1020 = -_996;
        float _1022 = _1020 + 1.0;
        _1018 = _1022;
    }
    float _1024 = _1018;
    int _1026 = _1008 ? 0 : 1;
    if (_784)
    {
        _990 = _1024;
    }
    float _1028 = _990;
    float _1030 = floor(_866);
    bool _1032 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1034 = isnan(1.0);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1040 = _1036 || _1038;
    int _1042 = ~_1026;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    bool _1048 = _982 >= 0.0;
    bool _1050 = isnan(_982);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    int _1058 = _1046;
    if (!_984)
    {
        int _1060 = ~_1026;
        int _1062 = _1060 + 1;
        _1058 = _1062;
    }
    int _1064 = _1058;
    float _1066 = _978 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = -_1014;
    float _1072 = _1070 + 1.0;
    bool _1074 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1076 = isnan(0.0);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1082 = _1078 || _1080;
    bool _1084 = _982 > 0.0;
    float _1086 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[5].z, _922);
    float _1088 = _1082 ? _1072 : 0.0;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1092 = _752 + _1090;
    float _1094 = 1.0 / _1012;
    int _1096 = _1056 ? 0 : 1;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1100 = _752 + _1098;
    bool _1102 = _1030 > 0.0;
    float _1104 = fma(_920, _1092, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1106 = _1030 >= 0.0;
    bool _1108 = isnan(_1030);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[6].z, _926);
    bool _1118 = !_806;
    int _1120 = _1118 ? 0 : 1;
    float _1122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1124 = _1068 * 43758.546875;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1128 = _752 + _1126;
    float _1130 = fma(_902, _1100, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    int _1132 = abs(_1120);
    float _1134 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1136 = fma(_930, _1128, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    int _1138 = ~_1096;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1146 = _1142;
    if (_1040)
    {
        float _1148 = _1088 * _1094;
        _152 = _1148;
    }
    float _1150 = _152;
    float _1152 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1154 = _1114 ? 0 : 1;
    float _1156 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_1084)
    {
        int _1158 = ~_1096;
        int _1160 = _1158 + 1;
        _1146 = _1160;
    }
    int _1162 = _1146;
    float _1164 = floor(_1124);
    float _1166 = _1152 * _1122;
    int _1168 = ~_1154;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    int _1174 = _1172;
    if (!_1102)
    {
        int _1176 = ~_1154;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    float _1182 = _846 * 1.74532926082611083984375;
    float _1184 = _1134 * _1144;
    float _1186 = _1182 * 0.15915493667125701904296875;
    float _1188 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1190 = float(_1132);
    float _1192 = _970 * 6.283185482025146484375;
    float _1194 = sin(_1192);
    float _1196 = float(_1162);
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1200 = _1188 + _1198;
    out.m_63.z = _1184;
    out.m_63.w = _1166;
    float _1202 = -_1164;
    float _1204 = _1124 + _1202;
    float _1206 = _860 * 1.74532926082611083984375;
    float _1208 = _968 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1210 = _1190 * _1196;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1214 = in.m_65.x;
    float _1216 = in.m_65.y;
    float _1218 = in.m_65.z;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1208 + _1220;
    float _1224 = fma(_1204, 4.0, -2.0);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1156 + _1226;
    bool _1230 = !_810;
    int _1232 = _1230 ? 0 : 1;
    float _1234 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1212);
    bool _1236 = !_802;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1210 * (-2.0);
    int _1242 = abs(_1232);
    float _1244 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1234);
    int _1246 = abs(_1238);
    float _1248 = _986 * 0.15915493667125701904296875;
    float _1250 = float(_1242);
    float _1252 = _1206 * 0.15915493667125701904296875;
    bool _1254 = _1244 >= 0.0;
    float _1256 = _1200 * _1200;
    float _1258 = float(_1180);
    float _1260 = _728 * _1224;
    float _1262 = float(_1246);
    float _1264 = fma(_1222, _1222, _1256);
    float _1266 = float(_1064);
    float _1268 = _1250 * _1258;
    float _1270 = _1194 * 43758.546875;
    float _1272 = fma(_1228, _1228, _1264);
    float _1274 = fma(_1240, _1216, _1216);
    float _1276 = _1262 * _1266;
    float _1278 = fma(_980, _1240, _980);
    float _1280 = _1268 * (-2.0);
    float _1282 = _1208;
    if (_1254)
    {
        _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1284 = _992;
    float _1286 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1274);
    float _1288 = rsqrt(_1272);
    float _1290 = fma(_976, _1280, _976);
    float _1292 = _1260 * 0.15915493667125701904296875;
    if (_1254)
    {
        float _1294 = _1284 * 5.0;
        _994 = as_type<int>(_1294);
    }
    int _1296 = _994;
    float _1298 = fma(_1278, _1150, _1286);
    float _1300 = fma(_1280, _1218, _1218);
    if (_1254)
    {
        out.m_47.x = 0.0;
    }
    float _1302 = _1186 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = in.m_67.x;
    float _1308 = in.m_67.y;
    float _1310 = in.m_67.z;
    if (_1254)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4922 = as_type<float>(_1296);
        out.gl_Position.z = _4922;
    }
    float _1312 = _1252 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1200 * _1288;
    float _1318 = _1222 * _1288;
    float _1320 = _1248 * 6.283185482025146484375;
    float _1322 = sin(_1320);
    float _1324 = floor(_1270);
    float _1326 = _1292 * 6.283185482025146484375;
    float _1328 = sin(_1326);
    float _1330 = _1328;
    if (_1254)
    {
        return out;
    }
    float _1332 = -_1316;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1188);
    float _1336 = _1228 * _1288;
    float _1338 = -_1318;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1208);
    float _1342 = _1276 * (-2.0);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1334 + _1344;
    float _1348 = -_1336;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1354 = _1340 + _1352;
    float _1356 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1300);
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1362 = _1350 + _1360;
    float _1364 = fma(_1342, _1214, _1214);
    float _1366 = fma(_1290, _1150, _1356);
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1358);
    float _1370 = -_1324;
    float _1372 = _1270 + _1370;
    float _1374 = fma(_998, _1342, _998);
    float _1376 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1364);
    float _1378 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1368);
    float _1380 = -_1316;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1384 = _1292 * 6.283185482025146484375;
    float _1386 = cos(_1384);
    float _1388 = _1366 * 0.15915493667125701904296875;
    float _1390 = _164 * _164;
    float _1392 = _1372 * 0.5;
    bool _1394 = _1378 >= 0.0;
    float _1396 = -_1318;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1400 = _1382 * _1382;
    float _1402 = fma(_1374, _1150, _1376);
    float _1404 = -_754;
    float _1406 = _1404 + _1306;
    float _1408 = -_756;
    float _1410 = _1408 + _1308;
    float _1412 = _728 * _1372;
    float _1414 = _1412 * 4.0;
    float _1416 = -_1392;
    float _1418 = fma(_1390, 1.5, _1416);
    float _1420 = precise::clamp(_1418, 0.0, 1.0);
    float _1422 = -_1310;
    float _1424 = _758 + _1422;
    float _1426 = fma(_1398, _1398, _1400);
    float _1428 = -_1336;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1432 = _1298 * 0.15915493667125701904296875;
    float _1434 = fma(_1420, _1424, _1310);
    float _1436 = _1402 * 0.15915493667125701904296875;
    float _1438 = fma(_1430, _1430, _1426);
    float _1440 = _1328 * _1410;
    float _1442 = _1398;
    float _1444 = _1334;
    if (_1394)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1446 = _1442;
    float _1448 = _1386 * _1410;
    float _1450 = _1432 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    int _1454 = as_type<int>(_1446);
    float _1456 = _1386;
    if (_1394)
    {
        out.m_47.x = 0.0;
    }
    if (_1394)
    {
        float _1458 = _1446 * 5.0;
        _1454 = as_type<int>(_1458);
    }
    int _1460 = _1454;
    float _1462 = -_1440;
    float _1464 = fma(_1386, _1406, _1462);
    float _1466 = fma(_1328, _1406, _1448);
    float _1468 = _1432 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    if (_1394)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5172 = as_type<float>(_1460);
        out.gl_Position.z = _5172;
    }
    float _1472 = _1388 * 6.283185482025146484375;
    float _1474 = sin(_1472);
    float _1476 = _1388 * 6.283185482025146484375;
    float _1478 = cos(_1476);
    float _1480 = _1436 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = sqrt(_1438);
    if (_1394)
    {
        return out;
    }
    float _1486 = -_1188;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = -_1208;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1494 = _886 * 0.119999997317790985107421875;
    float _1496 = _1466 + _756;
    float _1498 = _1488 * _1488;
    float _1500 = -_1156;
    float _1502 = _1500 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1504 = _1436 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = -_1466;
    float _1510 = fma(_1508, _1420, _1496);
    float _1512 = fma(_1492, _1492, _1498);
    float _1514 = _1464 + _754;
    float _1516 = fma(_1414, _758, _1434);
    float _1518 = fma(_1414, _756, _1510);
    float _1520 = fma(_1502, _1502, _1512);
    float _1522 = -_1464;
    float _1524 = fma(_1522, _1420, _1514);
    float _1526 = fma(_1304, _1494, _1516);
    float _1528 = _1470 * _1478;
    float _1530 = rsqrt(_1520);
    float _1532 = _1452 * _1474;
    float _1534 = fma(_1414, _754, _1524);
    float _1536 = fma(_1322, _1494, _1518);
    float _1538 = _1452 * _1478;
    float _1540 = fma(_1482, _1532, _1528);
    float _1542 = _1452 * _1506;
    float _1544 = fma(_1482, _1528, _1532);
    float _1546 = fma(_1314, _1494, _1534);
    float _1548 = _1288 * _1484;
    float _1550 = _1470 * _1474;
    float _1552 = _1470 * _1506;
    float _1554 = _1474 * _1506;
    float _1556 = _1478 * _1506;
    float _1558 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1560 = -_1538;
    float _1562 = fma(_1482, _1550, _1560);
    float _1564 = _1492 * _1530;
    float _1566 = _1488 * _1530;
    float _1568 = _1502 * _1530;
    float _1570 = _1548 * _1558;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1574 = _1564 * _1572;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1578 = _1566 * _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1582 = _1568 * _1580;
    float _1584 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1588 = -_1574;
    float _1590 = fma(_1568, _1586, _1588);
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = -_1578;
    float _1596 = fma(_1564, _1592, _1594);
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1600 = -_1582;
    float _1602 = fma(_1566, _1598, _1600);
    float _1604 = _1590 * _1590;
    float _1606 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1608 = -_1550;
    float _1610 = fma(_1482, _1538, _1608);
    float _1612 = _1548 * _1584;
    float _1614 = fma(_1602, _1602, _1604);
    float _1616 = _1548 * _1606;
    float _1618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1536);
    float _1620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1546);
    float _1622 = fma(_1596, _1596, _1614);
    bool _1624 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1626 = isnan(_752);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = _1618 * _1616;
    float _1638 = _1620 * _1612;
    float _1640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1526);
    bool _1642 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1644 = isnan(_752);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = rsqrt(_1622);
    float _1656 = _1610 * _1636;
    float _1658 = -_1634;
    float _1660 = _1658 + 1.0;
    float _1662 = _1640 * _1570;
    float _1664 = _1556 * _1636;
    float _1666 = fma(_1540, _1638, _1656);
    float _1668 = _1544 * _1636;
    bool _1670 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1672 = isnan(_752);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = -_1652;
    float _1684 = _1682 + 1.0;
    float _1686 = _1652 * _1660;
    float _1688 = fma(_1554, _1638, _1664);
    float _1690 = fma(_1562, _1638, _1668);
    float _1692 = fma(_1542, _1662, _1666);
    bool _1694 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1696 = isnan(_752);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    float _1706 = _1680 * _1684;
    float _1708 = -_1680;
    float _1710 = _1708 + 1.0;
    float _1712 = _1602 * _1654;
    float _1714 = -_1482;
    float _1716 = fma(_1714, _1662, _1688);
    float _1718 = _1590 * _1654;
    float _1720 = _1596 * _1654;
    bool _1722 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1724 = isnan(_752);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = _1704 * _1710;
    float _1736 = -_1704;
    float _1738 = _1736 + 1.0;
    float _1740 = _1566 * _1712;
    float _1742 = fma(_1552, _1662, _1690);
    bool _1744 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1746 = isnan(_752);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = _1568 * _1718;
    float _1758 = _758 + _754;
    float _1760 = -_1732;
    float _1762 = _1760 + 1.0;
    float _1764 = -_1740;
    float _1766 = fma(_1564, _1718, _1764);
    float _1768 = _1732 * _1738;
    float _1770 = -_1756;
    float _1772 = fma(_1566, _1720, _1770);
    float _1774 = _1758 * 78.233001708984375;
    bool _1776 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1778 = isnan(_752);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1754 * _1762;
    float _1790 = _1766 * _1716;
    float _1792 = -_1754;
    float _1794 = _1792 + 1.0;
    float _1796 = fma(_754, 12.98980045318603515625, _1774);
    float _1798 = _1772 * _1716;
    float _1800 = fma(_1720, _1692, _1790);
    float _1802 = _1786 * _1794;
    float _1804 = _1796 * 0.15915493667125701904296875;
    float _1806 = fma(_1712, _1692, _1798);
    float _1808 = fma(_1568, _1742, _1800);
    float _1810 = _1130 * _1802;
    float _1812 = -_1786;
    float _1814 = _1812 + 1.0;
    float _1816 = _1804 * 6.283185482025146484375;
    float _1818 = sin(_1816);
    float _1820 = fma(_1564, _1742, _1806);
    float _1822 = _1156 + _1808;
    float _1824 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1810);
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1828 = _752 + _1826;
    float _1830 = _1208 + _1820;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1834 = _1822 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1838 = _752 + _1836;
    float _1840 = fma(_956, _1828, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1844 = _1830 + _1842;
    float _1846 = _1834 * _1834;
    float _1848 = fma(_1136, _1788, _1824);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1852 = _752 + _1850;
    float _1854 = fma(_950, _1838, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1856 = fma(_1844, _1844, _1846);
    float _1858 = fma(_1104, _1768, _1848);
    float _1860 = _1818 * 43758.546875;
    float _1862 = fma(_1016, _1852, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1864 = sqrt(_1856);
    bool _1866 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1868 = isnan(_752);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = fma(_1840, _1734, _1858);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1882 = _752 + _1880;
    float _1884 = _1564 * _1720;
    float _1886 = fma(_1854, _1706, _1878);
    float _1888 = -_1876;
    float _1890 = _1888 + 1.0;
    float _1892 = floor(_1860);
    float _1894 = -_1884;
    float _1896 = fma(_1568, _1712, _1894);
    float _1898 = fma(_974, _1882, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1900 = _1634 * _1890;
    float _1902 = fma(_1862, _1686, _1886);
    float _1904 = _1896 * _1716;
    bool _1906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1908 = isnan(0.5);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1914 = _1910 || _1912;
    float _1916 = fma(_1898, _1900, _1902);
    float _1918 = fma(_1718, _1692, _1904);
    bool _1920 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1922 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1916);
    float _1924 = fma(_1566, _1742, _1918);
    float _1926 = -_1892;
    float _1928 = _1860 + _1926;
    float _1930 = _1188 + _1924;
    float _1932 = _1922 * _1928;
    float _1934 = _1922;
    float _1936 = _1742;
    float _1938 = _1830;
    if (!_1920)
    {
        _1934 = _1822;
    }
    float _1940 = _1934;
    float _1942 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1930);
    float _1944 = _1940;
    if (!_1920)
    {
        _1936 = _1942;
    }
    float _1946 = _1936;
    bool _1948 = !_1920;
    float _1950 = _1946;
    if (!_1948)
    {
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1956 = _1864 + _1954;
        float _1958 = rsqrt(_1856);
        float _1960 = _1956 * _1952;
        float _1962 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1964 = _1960 * 0.15915493667125701904296875;
        float _1966 = _1964 * 6.283185482025146484375;
        float _1968 = sin(_1966);
        float _1970 = _1964 * 6.283185482025146484375;
        float _1972 = cos(_1970);
        float _1974 = fma(_1968, _1962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1976 = _1958 * _1974;
        float _1978 = _1972 + (-1.0);
        float _1980 = fma(_1844, _1976, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1982 = fma(_1834, _1976, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1984 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1986 = fma(_1942, _1972, _1984);
        _1938 = _1980;
        _1950 = _1986;
        _1944 = _1982;
    }
    float _1988 = _1938;
    float _1990 = _1950;
    float _1992 = _1944;
    float _1994 = -_1318;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1988);
    float _1998 = -_1316;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1990);
    float _2002 = -_1336;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1992);
    float _2006 = _2000;
    float _2008 = _1996;
    float _2010 = _2004;
    if (!_1914)
    {
        float _2012 = _1346 * _1346;
        float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2016 = -_1156;
        float _2018 = _2016 + _1992;
        float _2020 = fma(_1354, _1354, _2012);
        float _2022 = fma(_1362, _1362, _2020);
        float _2024 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2026 = sqrt(_2022);
        float _2028 = 1.0 / _1548;
        float _2030 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2032 = precise::min(_2026, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2034 = _2032 * _2014;
        float _2036 = -_1188;
        float _2038 = _2036 + _1990;
        float _2040 = _2034 * _2028;
        float _2042 = -_1208;
        float _2044 = _2042 + _1988;
        float _2046 = _2030 * _2040;
        float _2048 = _2018 * _2040;
        float _2050 = fma(_2044, _2046, _1340);
        float _2052 = fma(_2038, _2046, _1334);
        float _2054 = fma(_2030, _2048, _1350);
        _2006 = _2052;
        _2008 = _2050;
        _2010 = _2054;
    }
    float _2056 = _2006;
    float _2058 = _2008;
    float _2060 = _2010;
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2064 = _2056 + _2062;
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2068 = _2058 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2072 = _2060 + _2070;
    float _2074 = _2064 * _2064;
    float _2076 = fma(_2068, _2068, _2074);
    float _2078 = fma(_2072, _2072, _2076);
    float _2080 = rsqrt(_2078);
    float _2082 = sqrt(_2078);
    float _2084 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2086 = _2068 * _2084;
    float _2088 = _2072 * _2084;
    float _2090 = _2086 * _2086;
    float _2092 = _2088 * _2088;
    float _2094 = _2090 + _2092;
    float _2096 = sqrt(_2094);
    bool _2098 = _2096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2102 = _2096 + _2100;
    float _2104 = _2072;
    float _2106 = _2102;
    float _2108 = _2084;
    if (_2098)
    {
        float _2110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2104 = _2110;
    }
    float _2112 = _2104;
    if (_2098)
    {
        float _2114 = rsqrt(_2094);
        _1282 = _2114;
    }
    float _2116 = _1282;
    float _2118 = _2116;
    if (_2098)
    {
        float _2120 = _2102 * _2112;
        _2106 = _2120;
    }
    float _2122 = _2106;
    float _2124 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_2098)
    {
        float _2126 = _2122 * 0.15915493667125701904296875;
        _1444 = _2126;
    }
    float _2128 = _1444;
    float _2130 = _2080;
    if (_2098)
    {
        float _2132 = _2128 * 6.283185482025146484375;
        float _2134 = sin(_2132);
        _2130 = _2134;
    }
    float _2136 = _2130;
    float _2138 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2140 = precise::max(0.0, _2138);
    float _2142 = _2074;
    float _2144 = _2140;
    float _2146 = _2138;
    if (_2098)
    {
        float _2148 = _2128 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        _2142 = _2150;
    }
    float _2152 = _2142;
    float _2154 = -_2084;
    float _2156 = -_2140;
    float _2158 = fma(_2064, _2154, _2156);
    float _2160 = _2158;
    if (_2098)
    {
        float _2162 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2162;
    }
    float _2164 = _2144;
    float _2166 = _2164;
    float _2168 = _2136;
    if (_2098)
    {
        float _2170 = fma(_2136, _2164, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2166 = _2170;
    }
    float _2172 = _2166;
    float _2174 = _2172;
    if (!_2098)
    {
        _2168 = _2086;
    }
    float _2176 = _2168;
    float _2178 = _2176;
    float _2180 = _2152;
    if (_2098)
    {
        float _2182 = _2152 + (-1.0);
        _2146 = _2182;
    }
    float _2184 = _2146;
    float _2186 = _2184;
    if (_2098)
    {
        float _2188 = _2116 * _2172;
        _2108 = _2188;
    }
    float _2190 = _2108;
    if (!_2098)
    {
        _2174 = _2090;
    }
    float _2192 = _2174;
    float _2194 = _2192;
    if (_2098)
    {
        float _2196 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2118 = _2196;
    }
    float _2198 = _2118;
    if (_2098)
    {
        float _2200 = _2086 * _2190;
        _2178 = _2200;
    }
    float _2202 = _2178;
    if (!_2098)
    {
        _2186 = _2088;
    }
    float _2204 = _2186;
    float _2206 = _2204;
    if (_2098)
    {
        float _2208 = _2088 * _2190;
        _2206 = _2208;
    }
    float _2210 = _2206;
    if (_2098)
    {
        float _2212 = fma(_2158, _2152, _2198);
        _2160 = _2212;
    }
    float _2214 = _2160;
    if (_2098)
    {
        float _2216 = _2202 * _2202;
        _2194 = _2216;
    }
    float _2218 = _2194;
    if (!_2098)
    {
        _2180 = _2092;
    }
    float _2220 = _2180;
    float _2222 = _2220;
    if (_2098)
    {
        float _2224 = _2210 * _2210;
        _2222 = _2224;
    }
    float _2226 = _2222;
    float _2228 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2230 = fma(_2214, _2214, _2218);
    float _2232 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2228);
    float _2234 = _2230 + _2226;
    float _2236 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2240 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2238);
    float _2242 = precise::clamp(_2240, 0.0, 1.0);
    float _2244 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2232);
    float _2246 = rsqrt(_2234);
    float _2248 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2250 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2236);
    float _2252 = -_2242;
    float _2254 = _2252 + 1.0;
    float _2256 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2258 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2248);
    float _2260 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2250);
    float _2262 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2264 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2256);
    float _2266 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2258);
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2270 = abs(_2254);
    float _2272 = log2(_2270);
    float _2274 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2264);
    float _2276 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2280 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2282 = _2246 * _2202;
    float _2284 = _2246 * _2214;
    float _2286 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2278);
    float _2288 = _2246 * _2210;
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2292 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2294 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2286);
    float _2296 = -_2280;
    float _2298 = fma(_2296, _2124, 1.0);
    float _2300 = -_2290;
    float _2302 = fma(_2284, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2300);
    float _2304 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2306 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2294);
    float _2308 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2310 = -_2288;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2302);
    float _2314 = log2(_2298);
    float _2316 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2318 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2304);
    float _2320 = fma(_2312, -0.5, 0.5);
    float _2322 = fma(_2312, 0.5, 0.5);
    float _2324 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2316);
    float _2326 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2318);
    float _2328 = _2284 + 1.0;
    float _2330 = 1.0 / _2306;
    float _2332 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2324);
    float _2334 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2332);
    float _2336 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2326);
    float _2338 = exp2(_2308);
    float _2340 = _2314 * 0.693147182464599609375;
    float _2342 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2344 = sqrt(_2320);
    float _2346 = fma(_2322, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2348 = _2334 * _2330;
    float _2350 = _2336 * _2330;
    float _2352 = fma(_2322, _2346, -0.212114393711090087890625);
    float _2354 = fma(_2348, 0.5, 0.5);
    float _2356 = fma(_2350, -0.5, 0.5);
    float _2358 = -_2284;
    float _2360 = fma(_2338, _2328, _2358);
    float _2362 = fma(_2322, _2352, 1.570728778839111328125);
    float _2364 = fma(_2360, 0.5, 0.5);
    float _2366 = _2344 * 0.636619746685028076171875;
    float3 _6584 = float3(_2354, _2356, _2342);
    float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6584, float3(0.0), isnan(_6584)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6584, float3(0.0), isnan(_6584)), level(0.0)).x;
    float _2370 = -_2362;
    float _2372 = fma(_2366, _2370, 1.0);
    float3 _6600 = float3(_2354, _2356, _2342);
    float4 _2375 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6600, float3(0.0), isnan(_6600)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6600, float3(0.0), isnan(_6600)), level(0.0)).xyzw;
    float _2377 = _2375.x;
    float _2379 = _2375.y;
    float _2381 = _2375.z;
    float _2383 = _2375.w;
    float2 _6617 = float2(_2372, _2364);
    float3 _2387 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6617, float2(0.0), isnan(_6617)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6617, float2(0.0), isnan(_6617)), level(0.0)).xyz;
    float _2389 = _2387.x;
    float _2391 = _2387.y;
    float _2393 = _2387.z;
    float _2395 = in.m_69.x;
    float _2397 = in.m_69.y;
    bool _2399 = _1536 != 0.0;
    bool _2401 = isnan(_1536);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(0.0);
    bool _2407 = _2403 || _2405;
    float _2409 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2411 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2413 = in.m_69.z;
    bool _2415 = _1546 == 0.0;
    bool _2417 = !_2407;
    bool _2419 = _2415 && _2417;
    float _2421 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2411);
    float _2423 = in.m_71.x;
    float _2425 = in.m_71.y;
    float _2427 = in.m_71.z;
    float _2429 = in.m_71.w;
    bool _2431 = _1526 == 0.0;
    bool _2433 = _2431 && _2419;
    float _2435 = exp2(_2409);
    float _2437 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2421);
    out.m_53.x = _358;
    out.m_53.y = _362;
    out.m_53.z = _366;
    out.m_55.x = _368;
    out.m_55.y = _370;
    out.m_55.z = _372;
    out.m_73.x = _2058;
    out.m_73.y = _2056;
    out.m_73.z = _2060;
    float _2439 = _1328 * _2397;
    float _2441 = _1386 * _2397;
    float _2443 = _1554 * _1772;
    float _2445 = -_2435;
    float _2447 = _2445 + 1.0;
    float _2449 = _2342;
    float _2451 = _2395;
    if (_2433)
    {
        _2449 = _2413;
    }
    float _2453 = _2449;
    float _2455 = -_2439;
    float _2457 = fma(_1386, _2395, _2455);
    float _2459 = fma(_1328, _2395, _2441);
    float _2461 = _1556 * _1772;
    float _2463 = _2453;
    if (_2433)
    {
        _1456 = _2453;
    }
    float _2465 = _1456;
    float _2467 = _2457 * _2427;
    float _2469 = _2465;
    if (!_2433)
    {
        _2463 = _2413;
    }
    float _2471 = _2463;
    float _2473 = _2459 * _2423;
    if (_2433)
    {
        _2451 = _2457;
    }
    float _2475 = _2451;
    float _2477 = _2475;
    if (!_2433)
    {
        float _2479 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2457);
        _2477 = _2479;
    }
    float _2481 = _2477;
    float _2483 = _1556 * _1766;
    float _2485 = _2425 * _2471;
    float _2487 = -_2473;
    float _2489 = fma(_2457, _2425, _2487);
    float _2491 = -_2467;
    float _2493 = fma(_2423, _2471, _2491);
    if (!_2433)
    {
        float _2495 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2471);
        _2469 = _2495;
    }
    float _2497 = _2469;
    float _2499 = -_2485;
    float _2501 = fma(_2459, _2427, _2499);
    float _2503 = _2489 * _2429;
    float _2505 = _2493 * _2429;
    float _2507 = _1556 * _1896;
    float _2509 = _2501 * _2429;
    float _2511 = _1554 * _1896;
    float _2513 = -_1772;
    float _2515 = _1482 * _2513;
    float _2517 = -_1896;
    float _2519 = _1482 * _2517;
    float _2521 = -_1766;
    float _2523 = _1482 * _2521;
    float _2525 = _1554 * _1766;
    float _2527 = fma(_1540, _1712, _2443);
    float _2529 = fma(_1610, _1712, _2461);
    float _2531 = fma(_1610, _1718, _2507);
    float _2533 = fma(_1540, _1718, _2511);
    float _2535 = fma(_1610, _1720, _2483);
    if (_2433)
    {
        _1330 = _2459;
    }
    float _2537 = _1330;
    float _2539 = fma(_1542, _1712, _2515);
    float _2541 = fma(_1542, _1718, _2519);
    float _2543 = _2537;
    if (!_2433)
    {
        float _2545 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2459);
        _2543 = _2545;
    }
    float _2547 = _2543;
    float _2549 = fma(_1542, _1720, _2523);
    float _2551 = fma(_1540, _1720, _2525);
    float _2553 = fma(_1562, _1564, _2527);
    float _2555 = fma(_1544, _1564, _2529);
    float _2557 = fma(_1544, _1566, _2531);
    float _2559 = fma(_1562, _1566, _2533);
    float _2561 = fma(_1544, _1568, _2535);
    float _2563 = fma(_1552, _1564, _2539);
    float _2565 = fma(_1552, _1566, _2541);
    float _2567 = fma(_1552, _1568, _2549);
    float _2569 = fma(_1562, _1568, _2551);
    float _2571 = _2555 * _2425;
    float _2573 = _2557 * _2425;
    float _2575 = _2555 * _2547;
    float _2577 = _2557 * _2547;
    float _2579 = _2561 * _2425;
    float _2581 = _2505 * _2555;
    float _2583 = _2505 * _2557;
    float _2585 = _2505 * _2561;
    float _2587 = fma(_2553, _2481, _2575);
    float _2589 = fma(_2559, _2481, _2577);
    float _2591 = fma(_2553, _2423, _2571);
    float _2593 = fma(_2509, _2553, _2581);
    float _2595 = fma(_2559, _2423, _2573);
    float _2597 = fma(_2569, _2423, _2579);
    float _2599 = fma(_2509, _2559, _2583);
    float _2601 = fma(_2509, _2569, _2585);
    float _2603 = _2561 * _2547;
    float _2605 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2607 = fma(_2503, _2563, _2593);
    float _2609 = fma(_2503, _2565, _2599);
    float _2611 = fma(_2503, _2567, _2601);
    float _2613 = fma(_2569, _2481, _2603);
    float _2615 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2437);
    float _2617 = fma(_2563, _2427, _2591);
    float _2619 = fma(_2563, _2497, _2587);
    float _2621 = fma(_2565, _2497, _2589);
    out.m_75.x = _2607;
    out.m_75.y = _2609;
    out.m_75.z = _2611;
    float _2623 = fma(_2567, _2497, _2613);
    float _2625 = _2615 + _2306;
    float _2627 = fma(_2565, _2427, _2595);
    float _2629 = fma(_2567, _2427, _2597);
    float _2631 = _2625 * 0.5;
    out.m_77.x = _2619;
    out.m_77.y = _2621;
    out.m_77.z = _2623;
    bool _2633 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2635 = isnan(_2082);
    bool _2637 = _2633 || _2635;
    bool _2639 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2641 = _2637 || _2639;
    out.m_79.x = _2617;
    out.m_79.y = _2627;
    out.m_79.z = _2629;
    float _2643 = -_2605;
    float _2645 = _2643 + 1.0;
    out.m_81.z = _2631;
    out.m_81.w = _2306;
    out.gl_Position.x = _2334;
    out.gl_Position.y = _2336;
    out.gl_Position.z = _2615;
    out.gl_Position.w = _2306;
    float _2647 = _2625;
    float _2649 = _2611;
    float _2651 = _2609;
    float _2653 = _2334;
    float _2655 = _2645;
    if (!_2641)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2657 = _2647;
    float _2659 = _2657;
    float _2661 = _2657;
    if (!_2641)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2663 = _2649;
    float _2665 = _2663;
    float _2667 = _2663;
    if (!_2641)
    {
        _2651 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2669 = _2651;
    float _2671 = _2669;
    float _2673 = _2669;
    if (!_2641)
    {
        _2653 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2675 = _2653;
    float _2677 = _2605 * _2368;
    float _2679 = _2383 * _2677;
    float _2681 = _2383 * _2645;
    float _2683 = _2679;
    float _2685 = _2675;
    float _2687 = _2675;
    if (!_2641)
    {
        _2655 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2689 = _2655;
    float _2691 = _2393 * _2677;
    float _2693 = fma(_2389, _2679, _2377);
    float _2695 = fma(_2391, _2679, _2379);
    float _2697 = _2689;
    float _2699 = _2689;
    if (!_2641)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2701 = _2683;
    float _2703 = fma(_2383, _2691, _2381);
    out.m_83.x = _2693;
    out.m_83.y = _2695;
    out.m_83.z = _2703;
    out.m_83.w = _2681;
    bool _2705 = !_2641;
    float _2707 = _2701;
    float _2709 = _2701;
    if (!_2705)
    {
        bool _2711 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2713 = isnan(_2082);
        bool _2715 = _2711 || _2713;
        bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2719 = _2715 || _2717;
        if (!_2719)
        {
            float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2723 = _2082 + _2721;
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2727 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2725;
            float _2729 = 1.0 / _2727;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2751 = _2723 * _2729;
            float _2753 = precise::clamp(_2751, 0.0, 1.0);
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2759 = fma(_2753, _2733, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2761 = fma(_2753, _2757, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2763 = fma(_2753, _2737, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2765 = fma(_2753, _2741, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2767 = fma(_2753, _2745, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2769 = fma(_2753, _2749, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2687 = _2761;
            _2673 = _2767;
            _2661 = _2759;
            _2667 = _2765;
            _2709 = _2763;
            _2699 = _2769;
            _2771 = true;
        }
        else
        {
            bool _2773 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2775 = isnan(_2082);
            bool _2777 = _2773 || _2775;
            bool _2779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2781 = _2777 || _2779;
            if (!_2781)
            {
                _2659 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2783 = _2659;
            _2661 = _2783;
            if (!_2781)
            {
                _2685 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2785 = _2685;
            _2687 = _2785;
            if (!_2781)
            {
                _2707 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2787 = _2707;
            _2709 = _2787;
            if (!_2781)
            {
                _2665 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2789 = _2665;
            _2667 = _2789;
            if (!_2781)
            {
                _2671 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2791 = _2671;
            _2673 = _2791;
            if (!_2781)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2793 = _2697;
            bool _2795 = !_2781;
            _2699 = _2793;
            if (!_2795)
            {
                bool _2797 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2799 = isnan(_2082);
                bool _2801 = _2797 || _2799;
                bool _2803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2805 = _2801 || _2803;
                if (!_2805)
                {
                    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2809 = _2082 + _2807;
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2813 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2811;
                    float _2815 = 1.0 / _2813;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2837 = _2809 * _2815;
                    float _2839 = precise::clamp(_2837, 0.0, 1.0);
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2845 = fma(_2839, _2819, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2847 = fma(_2839, _2843, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2849 = fma(_2839, _2823, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2851 = fma(_2839, _2827, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2853 = fma(_2839, _2831, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2855 = fma(_2839, _2835, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2687 = _2847;
                    _2673 = _2853;
                    _2661 = _2845;
                    _2667 = _2851;
                    _2709 = _2849;
                    _2699 = _2855;
                    _2771 = true;
                }
                else
                {
                    _2687 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2673 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2661 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2667 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2709 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2771 = false;
    float _2857 = _2687;
    float _2859 = _2673;
    float _2861 = _2661;
    float _2863 = _2667;
    float _2865 = _2709;
    float _2867 = _2699;
    float _2869 = fma(_2621, -0.5, 0.5);
    float _2871 = precise::clamp(_2869, 0.0, 1.0);
    float _2873 = -_2857;
    float _2875 = _2873 + _2859;
    float _2877 = -_2861;
    float _2879 = _2877 + _2863;
    float _2881 = -_2865;
    float _2883 = _2881 + _2867;
    bool _2885 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2887 = fma(_2871, _2875, _2857);
    float _2889 = fma(_2871, _2879, _2861);
    float _2891 = fma(_2871, _2883, _2865);
    float _2893 = _2887 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2895 = fma(_2889, 0.298911988735198974609375, _2893);
    float _2897 = fma(_2891, 0.114477999508380889892578125, _2895);
    out.m_85.x = 0.0;
    float _2899 = -_2897;
    float _2901 = _2889 + _2899;
    float _2903 = -_2897;
    float _2905 = _2887 + _2903;
    float _2907 = -_2897;
    float _2909 = _2891 + _2907;
    float _2911 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2913 = fma(_2901, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2915 = fma(_2905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2917 = fma(_2909, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    out.m_87.w = _2911;
    out.m_89.x = _2913;
    out.m_89.y = _2915;
    out.m_89.z = _2917;
    if (!_2885)
    {
        return out;
    }
    float _2919 = -_2056;
    float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2923 = -_2058;
    float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2927 = -_2060;
    float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2931 = _2921 * _2921;
    float _2933 = fma(_2925, _2925, _2931);
    float _2935 = fma(_2929, _2929, _2933);
    float _2937 = sqrt(_2935);
    float _2939 = rsqrt(_2935);
    float _2941 = -_2937;
    float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2945 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2947 = precise::clamp(_2945, 0.0, 1.0);
    float _2949 = _2925 * _2939;
    float _2951 = _2921 * _2939;
    float _2953 = abs(_2947);
    float _2955 = log2(_2953);
    float _2957 = _2929 * _2939;
    float _2959 = _2949 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2961 = _2621 * _2951;
    float _2963 = -_2951;
    float _2965 = -_2959;
    float _2967 = fma(_2963, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2965);
    float _2969 = fma(_2619, _2949, _2961);
    float _2971 = -_2957;
    float _2973 = fma(_2971, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2967);
    float _2975 = fma(_2623, _2957, _2969);
    float _2977 = precise::clamp(_2975, 0.0, 1.0);
    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2981 = _2973 + _2979;
    float _2983 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2985 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2987 = precise::clamp(_2985, 0.0, 1.0);
    float _2989 = exp2(_2983);
    float _2991 = _2989 * _2987;
    float _2993 = _2977 * _2991;
    float _2995 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2999 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2995;
    out.m_85.y = _2997;
    out.m_85.z = _2999;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2771 = false;
    bool _750 = false;
    bool _426 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3057 = as_type<float>(_124);
        out.gl_Position.z = _3057;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_49.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3121 = as_type<float>(_158);
        out.gl_Position.z = _3121;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = 1.0 / _130;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _134 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _188 + _194;
    bool _198 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _200 = isnan(_188);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = -_208;
    float _220 = _218 + 1.0;
    float _222 = 1.0 / _212;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _226 = 1.0 / _216;
    float _228 = _192 * _222;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _230;
    bool _234 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_188);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    bool _246 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_188);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = 1.0 / _232;
    float _260 = _244 * _220;
    float _262 = _196 * _226;
    bool _264 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _266 = isnan(_188);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = _188 + _276;
    float _280 = -_244;
    float _282 = _280 + 1.0;
    float _284 = -_256;
    float _286 = _284 + 1.0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = _256 * _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    float _302 = _274 * _286;
    float _304 = fma(_290, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = fma(_296, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _308 = fma(_300, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = -_274;
    float _312 = _310 + 1.0;
    float _314 = _278 * _258;
    float _316 = _306 * _302;
    float _318 = _308 * _302;
    float _320 = _304 * _302;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].x, _318);
    float _336 = fma(_324, _262, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_328, _262, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _340 = fma(_332, _262, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _342 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _344 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[143].z, _320);
    float _346 = fma(_336, _292, _334);
    float _348 = fma(_338, _292, _342);
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _358 = _350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _362 = _352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _366 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _368 = _356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _370 = _360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _372 = _364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _358;
    out.m_53.y = _362;
    out.m_53.z = _366;
    float _374 = fma(_340, _292, _344);
    out.m_55.x = _368;
    out.m_55.y = _370;
    out.m_55.z = _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_378, _314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _390 = fma(_382, _314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _392 = fma(_386, _314, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _394 = fma(_388, _260, _346);
    float _396 = fma(_390, _260, _348);
    float _398 = fma(_392, _260, _374);
    float _400 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[146].x, _394);
    float _402 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[146].y, _396);
    float _404 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[146].z, _398);
    bool _406 = !_224;
    float _424;
    if (!_406)
    {
        float _408 = in.m_51.x;
        float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _412 = _408 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _414 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _416 = _414 * _410;
        float _418 = floor(_416);
        float _420 = -_418;
        float _422 = _416 + _420;
        _424 = _422;
        _426 = true;
    }
    else
    {
        _424 = _164;
    }
    _426 = false;
    float _428 = _424;
    float _430 = in.m_57.x;
    float _432 = in.m_57.y;
    float _434 = in.m_57.z;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _444 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _446 = isnan(_428);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _460 = 1.0 / _438;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _470 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _472 = isnan(_428);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    bool _482 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _484 = isnan(_428);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = 1.0 / _442;
    float _496 = -_480;
    float _498 = _496 + 1.0;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _502 = _404 * _434;
    float _504 = _402 * _432;
    float _506 = 1.0 / _458;
    float _508 = _468 * _460;
    float _510 = _400 * _430;
    bool _512 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _514 = isnan(_428);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _528 = _464 * _494;
    float _530 = -_454;
    float _532 = _530 + 1.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _534;
    float _538 = -_522;
    float _540 = _538 + 1.0;
    float _542 = 1.0 / _526;
    float _544 = _480 * _532;
    bool _546 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _548 = isnan(_428);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _536 * _506;
    float _560 = _522 * _498;
    bool _562 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _564 = isnan(_428);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = _556 * _540;
    float _576 = -_556;
    float _578 = _576 + 1.0;
    bool _580 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _582 = isnan(_428);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _594 = _428 + _592;
    bool _596 = _428 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _598 = isnan(_428);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _572 * _578;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _614 = -_572;
    float _616 = _614 + 1.0;
    float _618 = -_590;
    float _620 = _618 + 1.0;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _626 = fma(_528, _594, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _628 = _606 * _620;
    float _630 = _590 * _616;
    float _632 = 1.0 / _624;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _638 = _612 * _542;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _642 = _428 + _640;
    float _644 = _626 * _628;
    float _646 = -_606;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _652 = _428 + _650;
    float _654 = fma(_508, _642, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _656 = 1.0 / _636;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _664 = _428 + _662;
    float _666 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[159].x, _644);
    float _668 = fma(_638, _652, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _670 = fma(_558, _664, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _672 = fma(_654, _630, _666);
    float _674 = 1.0 / _660;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _676;
    float _680 = fma(_670, _608, _672);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _686 = _678 * _632;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _690 = _428 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _692;
    float _696 = _684 * _656;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _700 = _428 + _698;
    float _702 = fma(_686, _690, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _704 = fma(_668, _574, _680);
    float _706 = -_492;
    float _708 = _706 + 1.0;
    float _710 = fma(_696, _700, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _714 = _428 + _712;
    float _716 = fma(_702, _560, _704);
    float _718 = _694 * _674;
    float _720 = _454 * _708;
    float _722 = fma(_710, _544, _716);
    float _724 = fma(_718, _714, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _726 = fma(_724, _720, _722);
    float _728 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[166].x, _726);
    bool _730 = !_500;
    float _748;
    if (!_730)
    {
        float _732 = in.m_51.x;
        float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _736 = _732 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[14].z, _134);
        float _740 = _738 * _734;
        float _742 = floor(_740);
        float _744 = -_742;
        float _746 = _740 + _744;
        _748 = _746;
        _750 = true;
    }
    else
    {
        _748 = _164;
    }
    _750 = false;
    float _752 = _748;
    float _754 = in.m_59.x;
    float _756 = in.m_59.y;
    float _758 = in.m_59.z;
    float _760 = -_164;
    float _762 = _760 + 0.800000011920928955078125;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    float _766 = in.m_51.x;
    float _768 = in.m_51.y;
    float _770 = in.m_51.z;
    float _772 = in.m_51.w;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _776 = _774 != 0;
    float _778 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _780 = log2(_778);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _784 = _782 != 0;
    float _786 = in.m_61.y;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _792 = in.m_44.x;
    float _794 = in.m_44.y;
    float _796 = in.m_44.z;
    float _798 = 1.0 / _790;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _810 = _808 != 0;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _816 = _434;
    if (_784)
    {
        float _818 = in.m_51.z;
        _816 = _818;
    }
    float _820 = _816;
    float _822 = 1.0 / _814;
    float _824 = _758 * 12.98980045318603515625;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _834 = fma(_770, 6.283185482025146484375, _134);
    float _836 = _768 + _770;
    float _838 = _766 + _770;
    float _840 = _770 + (-0.5);
    float _842 = _770 * 2.0;
    bool _844 = _772 > 0.5;
    float _846 = fma(_772, 6.283185482025146484375, _134);
    float _848 = _768 + _766;
    float _850 = _766 + (-0.5);
    float _852 = _766 * 2.0;
    float _854 = fma(_766, 78.233001708984375, _824);
    float _856 = -_786;
    float _858 = _856 + 1.0;
    float _860 = fma(_768, 6.283185482025146484375, _134);
    float _862 = _768 + (-0.5);
    float _864 = fma(_768, 78.233001708984375, _824);
    float _866 = _768 * 2.0;
    float _868 = fma(_764, -2.0, 3.0);
    float _870 = _764 * _764;
    float _872 = _786;
    if (_776)
    {
        float _874 = _844 ? _858 : _786;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = 1.0 / _828;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _884 = _868 * _870;
    float _886 = precise::clamp(_884, 0.0, 1.0);
    float _888 = _794 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _890 = _794 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _892;
    float _896 = 1.0 / _832;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _902 = _894 * _798;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _916 = _794 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = 1.0 / _882;
    float _920 = _910 * _822;
    float _922 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[5].x, _888);
    float _924 = in.m_61.x;
    float _926 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[6].x, _890);
    float _928 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _930 = _906 * _878;
    float _932 = 1.0 / _900;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _938;
    bool _942 = _820 > 0.5;
    bool _944 = _942 && _784;
    float _946 = _836 + (-1.0);
    float _948 = _838 + (-1.0);
    float _950 = _940 * _896;
    float _952 = _780 * _134;
    float _954 = floor(_842);
    float _956 = _936 * _918;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _962;
    float _966 = _848 + (-1.0);
    float _968 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[4].z, _928);
    float _970 = _854 * 0.15915493667125701904296875;
    float _972 = 1.0 / _914;
    float _974 = _964 * _932;
    float _976 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _978 = _864 * 0.15915493667125701904296875;
    float _980 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _982 = floor(_852);
    bool _984 = _954 > 0.0;
    float _986 = _834 * 1.74532926082611083984375;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[182].x;
    float _990 = _924;
    float _992 = _980;
    int _994 = as_type<int>(_976);
    if (_784)
    {
        _988 = _924;
    }
    float _996 = _988;
    float _998 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1000 = _954 >= 0.0;
    bool _1002 = isnan(_954);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(0.0);
    bool _1008 = _1004 || _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1012 = 1.0 + _1010;
    float _1014 = exp2(_952);
    float _1016 = _960 * _972;
    float _1018 = _996;
    if (_944)
    {
        float _1020 = -_996;
        float _1022 = _1020 + 1.0;
        _1018 = _1022;
    }
    float _1024 = _1018;
    int _1026 = _1008 ? 0 : 1;
    if (_784)
    {
        _990 = _1024;
    }
    float _1028 = _990;
    float _1030 = floor(_866);
    bool _1032 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1034 = isnan(1.0);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1040 = _1036 || _1038;
    int _1042 = ~_1026;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    bool _1048 = _982 >= 0.0;
    bool _1050 = isnan(_982);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    int _1058 = _1046;
    if (!_984)
    {
        int _1060 = ~_1026;
        int _1062 = _1060 + 1;
        _1058 = _1062;
    }
    int _1064 = _1058;
    float _1066 = _978 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = -_1014;
    float _1072 = _1070 + 1.0;
    bool _1074 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1076 = isnan(0.0);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1082 = _1078 || _1080;
    bool _1084 = _982 > 0.0;
    float _1086 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[5].z, _922);
    float _1088 = _1082 ? _1072 : 0.0;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1092 = _752 + _1090;
    float _1094 = 1.0 / _1012;
    int _1096 = _1056 ? 0 : 1;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1100 = _752 + _1098;
    bool _1102 = _1030 > 0.0;
    float _1104 = fma(_920, _1092, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1106 = _1030 >= 0.0;
    bool _1108 = isnan(_1030);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[6].z, _926);
    bool _1118 = !_806;
    int _1120 = _1118 ? 0 : 1;
    float _1122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1124 = _1068 * 43758.546875;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1128 = _752 + _1126;
    float _1130 = fma(_902, _1100, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    int _1132 = abs(_1120);
    float _1134 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1136 = fma(_930, _1128, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    int _1138 = ~_1096;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1146 = _1142;
    if (_1040)
    {
        float _1148 = _1088 * _1094;
        _152 = _1148;
    }
    float _1150 = _152;
    float _1152 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1154 = _1114 ? 0 : 1;
    float _1156 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_1084)
    {
        int _1158 = ~_1096;
        int _1160 = _1158 + 1;
        _1146 = _1160;
    }
    int _1162 = _1146;
    float _1164 = floor(_1124);
    float _1166 = _1152 * _1122;
    int _1168 = ~_1154;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    int _1174 = _1172;
    if (!_1102)
    {
        int _1176 = ~_1154;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    float _1182 = _846 * 1.74532926082611083984375;
    float _1184 = _1134 * _1144;
    float _1186 = _1182 * 0.15915493667125701904296875;
    float _1188 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1190 = float(_1132);
    float _1192 = _970 * 6.283185482025146484375;
    float _1194 = sin(_1192);
    float _1196 = float(_1162);
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1200 = _1188 + _1198;
    out.m_63.z = _1184;
    out.m_63.w = _1166;
    float _1202 = -_1164;
    float _1204 = _1124 + _1202;
    float _1206 = _860 * 1.74532926082611083984375;
    float _1208 = _968 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1210 = _1190 * _1196;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1214 = in.m_65.x;
    float _1216 = in.m_65.y;
    float _1218 = in.m_65.z;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1208 + _1220;
    float _1224 = fma(_1204, 4.0, -2.0);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1156 + _1226;
    bool _1230 = !_810;
    int _1232 = _1230 ? 0 : 1;
    float _1234 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1212);
    bool _1236 = !_802;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1210 * (-2.0);
    int _1242 = abs(_1232);
    float _1244 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1234);
    int _1246 = abs(_1238);
    float _1248 = _986 * 0.15915493667125701904296875;
    float _1250 = float(_1242);
    float _1252 = _1206 * 0.15915493667125701904296875;
    bool _1254 = _1244 >= 0.0;
    float _1256 = _1200 * _1200;
    float _1258 = float(_1180);
    float _1260 = _728 * _1224;
    float _1262 = float(_1246);
    float _1264 = fma(_1222, _1222, _1256);
    float _1266 = float(_1064);
    float _1268 = _1250 * _1258;
    float _1270 = _1194 * 43758.546875;
    float _1272 = fma(_1228, _1228, _1264);
    float _1274 = fma(_1240, _1216, _1216);
    float _1276 = _1262 * _1266;
    float _1278 = fma(_980, _1240, _980);
    float _1280 = _1268 * (-2.0);
    float _1282 = _1208;
    if (_1254)
    {
        _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1284 = _992;
    float _1286 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1274);
    float _1288 = rsqrt(_1272);
    float _1290 = fma(_976, _1280, _976);
    float _1292 = _1260 * 0.15915493667125701904296875;
    if (_1254)
    {
        float _1294 = _1284 * 5.0;
        _994 = as_type<int>(_1294);
    }
    int _1296 = _994;
    float _1298 = fma(_1278, _1150, _1286);
    float _1300 = fma(_1280, _1218, _1218);
    if (_1254)
    {
        out.m_47.x = 0.0;
    }
    float _1302 = _1186 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = in.m_67.x;
    float _1308 = in.m_67.y;
    float _1310 = in.m_67.z;
    if (_1254)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4922 = as_type<float>(_1296);
        out.gl_Position.z = _4922;
    }
    float _1312 = _1252 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1200 * _1288;
    float _1318 = _1222 * _1288;
    float _1320 = _1248 * 6.283185482025146484375;
    float _1322 = sin(_1320);
    float _1324 = floor(_1270);
    float _1326 = _1292 * 6.283185482025146484375;
    float _1328 = sin(_1326);
    float _1330 = _1328;
    if (_1254)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1332 = -_1316;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1188);
    float _1336 = _1228 * _1288;
    float _1338 = -_1318;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1208);
    float _1342 = _1276 * (-2.0);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1334 + _1344;
    float _1348 = -_1336;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1354 = _1340 + _1352;
    float _1356 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1300);
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1362 = _1350 + _1360;
    float _1364 = fma(_1342, _1214, _1214);
    float _1366 = fma(_1290, _1150, _1356);
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1358);
    float _1370 = -_1324;
    float _1372 = _1270 + _1370;
    float _1374 = fma(_998, _1342, _998);
    float _1376 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1364);
    float _1378 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1368);
    float _1380 = -_1316;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1384 = _1292 * 6.283185482025146484375;
    float _1386 = cos(_1384);
    float _1388 = _1366 * 0.15915493667125701904296875;
    float _1390 = _164 * _164;
    float _1392 = _1372 * 0.5;
    bool _1394 = _1378 >= 0.0;
    float _1396 = -_1318;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1400 = _1382 * _1382;
    float _1402 = fma(_1374, _1150, _1376);
    float _1404 = -_754;
    float _1406 = _1404 + _1306;
    float _1408 = -_756;
    float _1410 = _1408 + _1308;
    float _1412 = _728 * _1372;
    float _1414 = _1412 * 4.0;
    float _1416 = -_1392;
    float _1418 = fma(_1390, 1.5, _1416);
    float _1420 = precise::clamp(_1418, 0.0, 1.0);
    float _1422 = -_1310;
    float _1424 = _758 + _1422;
    float _1426 = fma(_1398, _1398, _1400);
    float _1428 = -_1336;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1432 = _1298 * 0.15915493667125701904296875;
    float _1434 = fma(_1420, _1424, _1310);
    float _1436 = _1402 * 0.15915493667125701904296875;
    float _1438 = fma(_1430, _1430, _1426);
    float _1440 = _1328 * _1410;
    float _1442 = _1398;
    float _1444 = _1334;
    if (_1394)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1446 = _1442;
    float _1448 = _1386 * _1410;
    float _1450 = _1432 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    int _1454 = as_type<int>(_1446);
    float _1456 = _1386;
    if (_1394)
    {
        out.m_47.x = 0.0;
    }
    if (_1394)
    {
        float _1458 = _1446 * 5.0;
        _1454 = as_type<int>(_1458);
    }
    int _1460 = _1454;
    float _1462 = -_1440;
    float _1464 = fma(_1386, _1406, _1462);
    float _1466 = fma(_1328, _1406, _1448);
    float _1468 = _1432 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    if (_1394)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5172 = as_type<float>(_1460);
        out.gl_Position.z = _5172;
    }
    float _1472 = _1388 * 6.283185482025146484375;
    float _1474 = sin(_1472);
    float _1476 = _1388 * 6.283185482025146484375;
    float _1478 = cos(_1476);
    float _1480 = _1436 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = sqrt(_1438);
    if (_1394)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1486 = -_1188;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = -_1208;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1494 = _886 * 0.119999997317790985107421875;
    float _1496 = _1466 + _756;
    float _1498 = _1488 * _1488;
    float _1500 = -_1156;
    float _1502 = _1500 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1504 = _1436 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = -_1466;
    float _1510 = fma(_1508, _1420, _1496);
    float _1512 = fma(_1492, _1492, _1498);
    float _1514 = _1464 + _754;
    float _1516 = fma(_1414, _758, _1434);
    float _1518 = fma(_1414, _756, _1510);
    float _1520 = fma(_1502, _1502, _1512);
    float _1522 = -_1464;
    float _1524 = fma(_1522, _1420, _1514);
    float _1526 = fma(_1304, _1494, _1516);
    float _1528 = _1470 * _1478;
    float _1530 = rsqrt(_1520);
    float _1532 = _1452 * _1474;
    float _1534 = fma(_1414, _754, _1524);
    float _1536 = fma(_1322, _1494, _1518);
    float _1538 = _1452 * _1478;
    float _1540 = fma(_1482, _1532, _1528);
    float _1542 = _1452 * _1506;
    float _1544 = fma(_1482, _1528, _1532);
    float _1546 = fma(_1314, _1494, _1534);
    float _1548 = _1288 * _1484;
    float _1550 = _1470 * _1474;
    float _1552 = _1470 * _1506;
    float _1554 = _1474 * _1506;
    float _1556 = _1478 * _1506;
    float _1558 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1560 = -_1538;
    float _1562 = fma(_1482, _1550, _1560);
    float _1564 = _1492 * _1530;
    float _1566 = _1488 * _1530;
    float _1568 = _1502 * _1530;
    float _1570 = _1548 * _1558;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1574 = _1564 * _1572;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1578 = _1566 * _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1582 = _1568 * _1580;
    float _1584 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1588 = -_1574;
    float _1590 = fma(_1568, _1586, _1588);
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = -_1578;
    float _1596 = fma(_1564, _1592, _1594);
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1600 = -_1582;
    float _1602 = fma(_1566, _1598, _1600);
    float _1604 = _1590 * _1590;
    float _1606 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1608 = -_1550;
    float _1610 = fma(_1482, _1538, _1608);
    float _1612 = _1548 * _1584;
    float _1614 = fma(_1602, _1602, _1604);
    float _1616 = _1548 * _1606;
    float _1618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1536);
    float _1620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1546);
    float _1622 = fma(_1596, _1596, _1614);
    bool _1624 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1626 = isnan(_752);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = _1618 * _1616;
    float _1638 = _1620 * _1612;
    float _1640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1526);
    bool _1642 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1644 = isnan(_752);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = rsqrt(_1622);
    float _1656 = _1610 * _1636;
    float _1658 = -_1634;
    float _1660 = _1658 + 1.0;
    float _1662 = _1640 * _1570;
    float _1664 = _1556 * _1636;
    float _1666 = fma(_1540, _1638, _1656);
    float _1668 = _1544 * _1636;
    bool _1670 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1672 = isnan(_752);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = -_1652;
    float _1684 = _1682 + 1.0;
    float _1686 = _1652 * _1660;
    float _1688 = fma(_1554, _1638, _1664);
    float _1690 = fma(_1562, _1638, _1668);
    float _1692 = fma(_1542, _1662, _1666);
    bool _1694 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1696 = isnan(_752);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    float _1706 = _1680 * _1684;
    float _1708 = -_1680;
    float _1710 = _1708 + 1.0;
    float _1712 = _1602 * _1654;
    float _1714 = -_1482;
    float _1716 = fma(_1714, _1662, _1688);
    float _1718 = _1590 * _1654;
    float _1720 = _1596 * _1654;
    bool _1722 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1724 = isnan(_752);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = _1704 * _1710;
    float _1736 = -_1704;
    float _1738 = _1736 + 1.0;
    float _1740 = _1566 * _1712;
    float _1742 = fma(_1552, _1662, _1690);
    bool _1744 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1746 = isnan(_752);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = _1568 * _1718;
    float _1758 = _758 + _754;
    float _1760 = -_1732;
    float _1762 = _1760 + 1.0;
    float _1764 = -_1740;
    float _1766 = fma(_1564, _1718, _1764);
    float _1768 = _1732 * _1738;
    float _1770 = -_1756;
    float _1772 = fma(_1566, _1720, _1770);
    float _1774 = _1758 * 78.233001708984375;
    bool _1776 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1778 = isnan(_752);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1754 * _1762;
    float _1790 = _1766 * _1716;
    float _1792 = -_1754;
    float _1794 = _1792 + 1.0;
    float _1796 = fma(_754, 12.98980045318603515625, _1774);
    float _1798 = _1772 * _1716;
    float _1800 = fma(_1720, _1692, _1790);
    float _1802 = _1786 * _1794;
    float _1804 = _1796 * 0.15915493667125701904296875;
    float _1806 = fma(_1712, _1692, _1798);
    float _1808 = fma(_1568, _1742, _1800);
    float _1810 = _1130 * _1802;
    float _1812 = -_1786;
    float _1814 = _1812 + 1.0;
    float _1816 = _1804 * 6.283185482025146484375;
    float _1818 = sin(_1816);
    float _1820 = fma(_1564, _1742, _1806);
    float _1822 = _1156 + _1808;
    float _1824 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1810);
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1828 = _752 + _1826;
    float _1830 = _1208 + _1820;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1834 = _1822 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1838 = _752 + _1836;
    float _1840 = fma(_956, _1828, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1844 = _1830 + _1842;
    float _1846 = _1834 * _1834;
    float _1848 = fma(_1136, _1788, _1824);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1852 = _752 + _1850;
    float _1854 = fma(_950, _1838, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1856 = fma(_1844, _1844, _1846);
    float _1858 = fma(_1104, _1768, _1848);
    float _1860 = _1818 * 43758.546875;
    float _1862 = fma(_1016, _1852, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1864 = sqrt(_1856);
    bool _1866 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1868 = isnan(_752);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = fma(_1840, _1734, _1858);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1882 = _752 + _1880;
    float _1884 = _1564 * _1720;
    float _1886 = fma(_1854, _1706, _1878);
    float _1888 = -_1876;
    float _1890 = _1888 + 1.0;
    float _1892 = floor(_1860);
    float _1894 = -_1884;
    float _1896 = fma(_1568, _1712, _1894);
    float _1898 = fma(_974, _1882, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1900 = _1634 * _1890;
    float _1902 = fma(_1862, _1686, _1886);
    float _1904 = _1896 * _1716;
    bool _1906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1908 = isnan(0.5);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1914 = _1910 || _1912;
    float _1916 = fma(_1898, _1900, _1902);
    float _1918 = fma(_1718, _1692, _1904);
    bool _1920 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1922 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1916);
    float _1924 = fma(_1566, _1742, _1918);
    float _1926 = -_1892;
    float _1928 = _1860 + _1926;
    float _1930 = _1188 + _1924;
    float _1932 = _1922 * _1928;
    float _1934 = _1922;
    float _1936 = _1742;
    float _1938 = _1830;
    if (!_1920)
    {
        _1934 = _1822;
    }
    float _1940 = _1934;
    float _1942 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1930);
    float _1944 = _1940;
    if (!_1920)
    {
        _1936 = _1942;
    }
    float _1946 = _1936;
    bool _1948 = !_1920;
    float _1950 = _1946;
    if (!_1948)
    {
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1956 = _1864 + _1954;
        float _1958 = rsqrt(_1856);
        float _1960 = _1956 * _1952;
        float _1962 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1964 = _1960 * 0.15915493667125701904296875;
        float _1966 = _1964 * 6.283185482025146484375;
        float _1968 = sin(_1966);
        float _1970 = _1964 * 6.283185482025146484375;
        float _1972 = cos(_1970);
        float _1974 = fma(_1968, _1962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1976 = _1958 * _1974;
        float _1978 = _1972 + (-1.0);
        float _1980 = fma(_1844, _1976, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1982 = fma(_1834, _1976, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1984 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1986 = fma(_1942, _1972, _1984);
        _1938 = _1980;
        _1950 = _1986;
        _1944 = _1982;
    }
    float _1988 = _1938;
    float _1990 = _1950;
    float _1992 = _1944;
    float _1994 = -_1318;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1988);
    float _1998 = -_1316;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1990);
    float _2002 = -_1336;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1992);
    float _2006 = _2000;
    float _2008 = _1996;
    float _2010 = _2004;
    if (!_1914)
    {
        float _2012 = _1346 * _1346;
        float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2016 = -_1156;
        float _2018 = _2016 + _1992;
        float _2020 = fma(_1354, _1354, _2012);
        float _2022 = fma(_1362, _1362, _2020);
        float _2024 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2026 = sqrt(_2022);
        float _2028 = 1.0 / _1548;
        float _2030 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2032 = precise::min(_2026, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2034 = _2032 * _2014;
        float _2036 = -_1188;
        float _2038 = _2036 + _1990;
        float _2040 = _2034 * _2028;
        float _2042 = -_1208;
        float _2044 = _2042 + _1988;
        float _2046 = _2030 * _2040;
        float _2048 = _2018 * _2040;
        float _2050 = fma(_2044, _2046, _1340);
        float _2052 = fma(_2038, _2046, _1334);
        float _2054 = fma(_2030, _2048, _1350);
        _2006 = _2052;
        _2008 = _2050;
        _2010 = _2054;
    }
    float _2056 = _2006;
    float _2058 = _2008;
    float _2060 = _2010;
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2064 = _2056 + _2062;
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2068 = _2058 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2072 = _2060 + _2070;
    float _2074 = _2064 * _2064;
    float _2076 = fma(_2068, _2068, _2074);
    float _2078 = fma(_2072, _2072, _2076);
    float _2080 = rsqrt(_2078);
    float _2082 = sqrt(_2078);
    float _2084 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2086 = _2068 * _2084;
    float _2088 = _2072 * _2084;
    float _2090 = _2086 * _2086;
    float _2092 = _2088 * _2088;
    float _2094 = _2090 + _2092;
    float _2096 = sqrt(_2094);
    bool _2098 = _2096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2102 = _2096 + _2100;
    float _2104 = _2072;
    float _2106 = _2102;
    float _2108 = _2084;
    if (_2098)
    {
        float _2110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2104 = _2110;
    }
    float _2112 = _2104;
    if (_2098)
    {
        float _2114 = rsqrt(_2094);
        _1282 = _2114;
    }
    float _2116 = _1282;
    float _2118 = _2116;
    if (_2098)
    {
        float _2120 = _2102 * _2112;
        _2106 = _2120;
    }
    float _2122 = _2106;
    float _2124 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_2098)
    {
        float _2126 = _2122 * 0.15915493667125701904296875;
        _1444 = _2126;
    }
    float _2128 = _1444;
    float _2130 = _2080;
    if (_2098)
    {
        float _2132 = _2128 * 6.283185482025146484375;
        float _2134 = sin(_2132);
        _2130 = _2134;
    }
    float _2136 = _2130;
    float _2138 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2140 = precise::max(0.0, _2138);
    float _2142 = _2074;
    float _2144 = _2140;
    float _2146 = _2138;
    if (_2098)
    {
        float _2148 = _2128 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        _2142 = _2150;
    }
    float _2152 = _2142;
    float _2154 = -_2084;
    float _2156 = -_2140;
    float _2158 = fma(_2064, _2154, _2156);
    float _2160 = _2158;
    if (_2098)
    {
        float _2162 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2162;
    }
    float _2164 = _2144;
    float _2166 = _2164;
    float _2168 = _2136;
    if (_2098)
    {
        float _2170 = fma(_2136, _2164, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2166 = _2170;
    }
    float _2172 = _2166;
    float _2174 = _2172;
    if (!_2098)
    {
        _2168 = _2086;
    }
    float _2176 = _2168;
    float _2178 = _2176;
    float _2180 = _2152;
    if (_2098)
    {
        float _2182 = _2152 + (-1.0);
        _2146 = _2182;
    }
    float _2184 = _2146;
    float _2186 = _2184;
    if (_2098)
    {
        float _2188 = _2116 * _2172;
        _2108 = _2188;
    }
    float _2190 = _2108;
    if (!_2098)
    {
        _2174 = _2090;
    }
    float _2192 = _2174;
    float _2194 = _2192;
    if (_2098)
    {
        float _2196 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2118 = _2196;
    }
    float _2198 = _2118;
    if (_2098)
    {
        float _2200 = _2086 * _2190;
        _2178 = _2200;
    }
    float _2202 = _2178;
    if (!_2098)
    {
        _2186 = _2088;
    }
    float _2204 = _2186;
    float _2206 = _2204;
    if (_2098)
    {
        float _2208 = _2088 * _2190;
        _2206 = _2208;
    }
    float _2210 = _2206;
    if (_2098)
    {
        float _2212 = fma(_2158, _2152, _2198);
        _2160 = _2212;
    }
    float _2214 = _2160;
    if (_2098)
    {
        float _2216 = _2202 * _2202;
        _2194 = _2216;
    }
    float _2218 = _2194;
    if (!_2098)
    {
        _2180 = _2092;
    }
    float _2220 = _2180;
    float _2222 = _2220;
    if (_2098)
    {
        float _2224 = _2210 * _2210;
        _2222 = _2224;
    }
    float _2226 = _2222;
    float _2228 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2230 = fma(_2214, _2214, _2218);
    float _2232 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2228);
    float _2234 = _2230 + _2226;
    float _2236 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2240 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2238);
    float _2242 = precise::clamp(_2240, 0.0, 1.0);
    float _2244 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2232);
    float _2246 = rsqrt(_2234);
    float _2248 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2250 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2236);
    float _2252 = -_2242;
    float _2254 = _2252 + 1.0;
    float _2256 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2258 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2248);
    float _2260 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2250);
    float _2262 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2264 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2256);
    float _2266 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2258);
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2270 = abs(_2254);
    float _2272 = log2(_2270);
    float _2274 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2264);
    float _2276 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2280 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2282 = _2246 * _2202;
    float _2284 = _2246 * _2214;
    float _2286 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2278);
    float _2288 = _2246 * _2210;
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2292 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2294 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2286);
    float _2296 = -_2280;
    float _2298 = fma(_2296, _2124, 1.0);
    float _2300 = -_2290;
    float _2302 = fma(_2284, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2300);
    float _2304 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2306 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2294);
    float _2308 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2310 = -_2288;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2302);
    float _2314 = log2(_2298);
    float _2316 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2318 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2304);
    float _2320 = fma(_2312, -0.5, 0.5);
    float _2322 = fma(_2312, 0.5, 0.5);
    float _2324 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2316);
    float _2326 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2318);
    float _2328 = _2284 + 1.0;
    float _2330 = 1.0 / _2306;
    float _2332 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2324);
    float _2334 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2332);
    float _2336 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2326);
    float _2338 = exp2(_2308);
    float _2340 = _2314 * 0.693147182464599609375;
    float _2342 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2344 = sqrt(_2320);
    float _2346 = fma(_2322, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2348 = _2334 * _2330;
    float _2350 = _2336 * _2330;
    float _2352 = fma(_2322, _2346, -0.212114393711090087890625);
    float _2354 = fma(_2348, 0.5, 0.5);
    float _2356 = fma(_2350, -0.5, 0.5);
    float _2358 = -_2284;
    float _2360 = fma(_2338, _2328, _2358);
    float _2362 = fma(_2322, _2352, 1.570728778839111328125);
    float _2364 = fma(_2360, 0.5, 0.5);
    float _2366 = _2344 * 0.636619746685028076171875;
    float3 _6584 = float3(_2354, _2356, _2342);
    float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6584, float3(0.0), isnan(_6584)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6584, float3(0.0), isnan(_6584)), level(0.0)).x;
    float _2370 = -_2362;
    float _2372 = fma(_2366, _2370, 1.0);
    float3 _6600 = float3(_2354, _2356, _2342);
    float4 _2375 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6600, float3(0.0), isnan(_6600)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6600, float3(0.0), isnan(_6600)), level(0.0)).xyzw;
    float _2377 = _2375.x;
    float _2379 = _2375.y;
    float _2381 = _2375.z;
    float _2383 = _2375.w;
    float2 _6617 = float2(_2372, _2364);
    float3 _2387 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6617, float2(0.0), isnan(_6617)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6617, float2(0.0), isnan(_6617)), level(0.0)).xyz;
    float _2389 = _2387.x;
    float _2391 = _2387.y;
    float _2393 = _2387.z;
    float _2395 = in.m_69.x;
    float _2397 = in.m_69.y;
    bool _2399 = _1536 != 0.0;
    bool _2401 = isnan(_1536);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(0.0);
    bool _2407 = _2403 || _2405;
    float _2409 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2411 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2413 = in.m_69.z;
    bool _2415 = _1546 == 0.0;
    bool _2417 = !_2407;
    bool _2419 = _2415 && _2417;
    float _2421 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2411);
    float _2423 = in.m_71.x;
    float _2425 = in.m_71.y;
    float _2427 = in.m_71.z;
    float _2429 = in.m_71.w;
    bool _2431 = _1526 == 0.0;
    bool _2433 = _2431 && _2419;
    float _2435 = exp2(_2409);
    float _2437 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2421);
    out.m_53.x = _358;
    out.m_53.y = _362;
    out.m_53.z = _366;
    out.m_55.x = _368;
    out.m_55.y = _370;
    out.m_55.z = _372;
    out.m_73.x = _2058;
    out.m_73.y = _2056;
    out.m_73.z = _2060;
    float _2439 = _1328 * _2397;
    float _2441 = _1386 * _2397;
    float _2443 = _1554 * _1772;
    float _2445 = -_2435;
    float _2447 = _2445 + 1.0;
    float _2449 = _2342;
    float _2451 = _2395;
    if (_2433)
    {
        _2449 = _2413;
    }
    float _2453 = _2449;
    float _2455 = -_2439;
    float _2457 = fma(_1386, _2395, _2455);
    float _2459 = fma(_1328, _2395, _2441);
    float _2461 = _1556 * _1772;
    float _2463 = _2453;
    if (_2433)
    {
        _1456 = _2453;
    }
    float _2465 = _1456;
    float _2467 = _2457 * _2427;
    float _2469 = _2465;
    if (!_2433)
    {
        _2463 = _2413;
    }
    float _2471 = _2463;
    float _2473 = _2459 * _2423;
    if (_2433)
    {
        _2451 = _2457;
    }
    float _2475 = _2451;
    float _2477 = _2475;
    if (!_2433)
    {
        float _2479 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2457);
        _2477 = _2479;
    }
    float _2481 = _2477;
    float _2483 = _1556 * _1766;
    float _2485 = _2425 * _2471;
    float _2487 = -_2473;
    float _2489 = fma(_2457, _2425, _2487);
    float _2491 = -_2467;
    float _2493 = fma(_2423, _2471, _2491);
    if (!_2433)
    {
        float _2495 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2471);
        _2469 = _2495;
    }
    float _2497 = _2469;
    float _2499 = -_2485;
    float _2501 = fma(_2459, _2427, _2499);
    float _2503 = _2489 * _2429;
    float _2505 = _2493 * _2429;
    float _2507 = _1556 * _1896;
    float _2509 = _2501 * _2429;
    float _2511 = _1554 * _1896;
    float _2513 = -_1772;
    float _2515 = _1482 * _2513;
    float _2517 = -_1896;
    float _2519 = _1482 * _2517;
    float _2521 = -_1766;
    float _2523 = _1482 * _2521;
    float _2525 = _1554 * _1766;
    float _2527 = fma(_1540, _1712, _2443);
    float _2529 = fma(_1610, _1712, _2461);
    float _2531 = fma(_1610, _1718, _2507);
    float _2533 = fma(_1540, _1718, _2511);
    float _2535 = fma(_1610, _1720, _2483);
    if (_2433)
    {
        _1330 = _2459;
    }
    float _2537 = _1330;
    float _2539 = fma(_1542, _1712, _2515);
    float _2541 = fma(_1542, _1718, _2519);
    float _2543 = _2537;
    if (!_2433)
    {
        float _2545 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2459);
        _2543 = _2545;
    }
    float _2547 = _2543;
    float _2549 = fma(_1542, _1720, _2523);
    float _2551 = fma(_1540, _1720, _2525);
    float _2553 = fma(_1562, _1564, _2527);
    float _2555 = fma(_1544, _1564, _2529);
    float _2557 = fma(_1544, _1566, _2531);
    float _2559 = fma(_1562, _1566, _2533);
    float _2561 = fma(_1544, _1568, _2535);
    float _2563 = fma(_1552, _1564, _2539);
    float _2565 = fma(_1552, _1566, _2541);
    float _2567 = fma(_1552, _1568, _2549);
    float _2569 = fma(_1562, _1568, _2551);
    float _2571 = _2555 * _2425;
    float _2573 = _2557 * _2425;
    float _2575 = _2555 * _2547;
    float _2577 = _2557 * _2547;
    float _2579 = _2561 * _2425;
    float _2581 = _2505 * _2555;
    float _2583 = _2505 * _2557;
    float _2585 = _2505 * _2561;
    float _2587 = fma(_2553, _2481, _2575);
    float _2589 = fma(_2559, _2481, _2577);
    float _2591 = fma(_2553, _2423, _2571);
    float _2593 = fma(_2509, _2553, _2581);
    float _2595 = fma(_2559, _2423, _2573);
    float _2597 = fma(_2569, _2423, _2579);
    float _2599 = fma(_2509, _2559, _2583);
    float _2601 = fma(_2509, _2569, _2585);
    float _2603 = _2561 * _2547;
    float _2605 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2607 = fma(_2503, _2563, _2593);
    float _2609 = fma(_2503, _2565, _2599);
    float _2611 = fma(_2503, _2567, _2601);
    float _2613 = fma(_2569, _2481, _2603);
    float _2615 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2437);
    float _2617 = fma(_2563, _2427, _2591);
    float _2619 = fma(_2563, _2497, _2587);
    float _2621 = fma(_2565, _2497, _2589);
    out.m_75.x = _2607;
    out.m_75.y = _2609;
    out.m_75.z = _2611;
    float _2623 = fma(_2567, _2497, _2613);
    float _2625 = _2615 + _2306;
    float _2627 = fma(_2565, _2427, _2595);
    float _2629 = fma(_2567, _2427, _2597);
    float _2631 = _2625 * 0.5;
    out.m_77.x = _2619;
    out.m_77.y = _2621;
    out.m_77.z = _2623;
    bool _2633 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2635 = isnan(_2082);
    bool _2637 = _2633 || _2635;
    bool _2639 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2641 = _2637 || _2639;
    out.m_79.x = _2617;
    out.m_79.y = _2627;
    out.m_79.z = _2629;
    float _2643 = -_2605;
    float _2645 = _2643 + 1.0;
    out.m_81.z = _2631;
    out.m_81.w = _2306;
    out.gl_Position.x = _2334;
    out.gl_Position.y = _2336;
    out.gl_Position.z = _2615;
    out.gl_Position.w = _2306;
    float _2647 = _2625;
    float _2649 = _2611;
    float _2651 = _2609;
    float _2653 = _2334;
    float _2655 = _2645;
    if (!_2641)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2657 = _2647;
    float _2659 = _2657;
    float _2661 = _2657;
    if (!_2641)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2663 = _2649;
    float _2665 = _2663;
    float _2667 = _2663;
    if (!_2641)
    {
        _2651 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2669 = _2651;
    float _2671 = _2669;
    float _2673 = _2669;
    if (!_2641)
    {
        _2653 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2675 = _2653;
    float _2677 = _2605 * _2368;
    float _2679 = _2383 * _2677;
    float _2681 = _2383 * _2645;
    float _2683 = _2679;
    float _2685 = _2675;
    float _2687 = _2675;
    if (!_2641)
    {
        _2655 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2689 = _2655;
    float _2691 = _2393 * _2677;
    float _2693 = fma(_2389, _2679, _2377);
    float _2695 = fma(_2391, _2679, _2379);
    float _2697 = _2689;
    float _2699 = _2689;
    if (!_2641)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2701 = _2683;
    float _2703 = fma(_2383, _2691, _2381);
    out.m_83.x = _2693;
    out.m_83.y = _2695;
    out.m_83.z = _2703;
    out.m_83.w = _2681;
    bool _2705 = !_2641;
    float _2707 = _2701;
    float _2709 = _2701;
    if (!_2705)
    {
        bool _2711 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2713 = isnan(_2082);
        bool _2715 = _2711 || _2713;
        bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2719 = _2715 || _2717;
        if (!_2719)
        {
            float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2723 = _2082 + _2721;
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2727 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2725;
            float _2729 = 1.0 / _2727;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2751 = _2723 * _2729;
            float _2753 = precise::clamp(_2751, 0.0, 1.0);
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2759 = fma(_2753, _2733, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2761 = fma(_2753, _2757, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2763 = fma(_2753, _2737, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2765 = fma(_2753, _2741, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2767 = fma(_2753, _2745, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2769 = fma(_2753, _2749, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2687 = _2761;
            _2673 = _2767;
            _2661 = _2759;
            _2667 = _2765;
            _2709 = _2763;
            _2699 = _2769;
            _2771 = true;
        }
        else
        {
            bool _2773 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2775 = isnan(_2082);
            bool _2777 = _2773 || _2775;
            bool _2779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2781 = _2777 || _2779;
            if (!_2781)
            {
                _2659 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2783 = _2659;
            _2661 = _2783;
            if (!_2781)
            {
                _2685 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2785 = _2685;
            _2687 = _2785;
            if (!_2781)
            {
                _2707 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2787 = _2707;
            _2709 = _2787;
            if (!_2781)
            {
                _2665 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2789 = _2665;
            _2667 = _2789;
            if (!_2781)
            {
                _2671 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2791 = _2671;
            _2673 = _2791;
            if (!_2781)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2793 = _2697;
            bool _2795 = !_2781;
            _2699 = _2793;
            if (!_2795)
            {
                bool _2797 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2799 = isnan(_2082);
                bool _2801 = _2797 || _2799;
                bool _2803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2805 = _2801 || _2803;
                if (!_2805)
                {
                    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2809 = _2082 + _2807;
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2813 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2811;
                    float _2815 = 1.0 / _2813;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2837 = _2809 * _2815;
                    float _2839 = precise::clamp(_2837, 0.0, 1.0);
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2845 = fma(_2839, _2819, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2847 = fma(_2839, _2843, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2849 = fma(_2839, _2823, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2851 = fma(_2839, _2827, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2853 = fma(_2839, _2831, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2855 = fma(_2839, _2835, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2687 = _2847;
                    _2673 = _2853;
                    _2661 = _2845;
                    _2667 = _2851;
                    _2709 = _2849;
                    _2699 = _2855;
                    _2771 = true;
                }
                else
                {
                    _2687 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2673 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2661 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2667 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2709 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2771 = false;
    float _2857 = _2687;
    float _2859 = _2673;
    float _2861 = _2661;
    float _2863 = _2667;
    float _2865 = _2709;
    float _2867 = _2699;
    float _2869 = fma(_2621, -0.5, 0.5);
    float _2871 = precise::clamp(_2869, 0.0, 1.0);
    float _2873 = -_2857;
    float _2875 = _2873 + _2859;
    float _2877 = -_2861;
    float _2879 = _2877 + _2863;
    float _2881 = -_2865;
    float _2883 = _2881 + _2867;
    bool _2885 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2887 = fma(_2871, _2875, _2857);
    float _2889 = fma(_2871, _2879, _2861);
    float _2891 = fma(_2871, _2883, _2865);
    float _2893 = _2887 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2895 = fma(_2889, 0.298911988735198974609375, _2893);
    float _2897 = fma(_2891, 0.114477999508380889892578125, _2895);
    out.m_85.x = 0.0;
    float _2899 = -_2897;
    float _2901 = _2889 + _2899;
    float _2903 = -_2897;
    float _2905 = _2887 + _2903;
    float _2907 = -_2897;
    float _2909 = _2891 + _2907;
    float _2911 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2913 = fma(_2901, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2915 = fma(_2905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2917 = fma(_2909, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    out.m_87.w = _2911;
    out.m_89.x = _2913;
    out.m_89.y = _2915;
    out.m_89.z = _2917;
    if (!_2885)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2919 = -_2056;
    float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2923 = -_2058;
    float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2927 = -_2060;
    float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2931 = _2921 * _2921;
    float _2933 = fma(_2925, _2925, _2931);
    float _2935 = fma(_2929, _2929, _2933);
    float _2937 = sqrt(_2935);
    float _2939 = rsqrt(_2935);
    float _2941 = -_2937;
    float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2945 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2947 = precise::clamp(_2945, 0.0, 1.0);
    float _2949 = _2925 * _2939;
    float _2951 = _2921 * _2939;
    float _2953 = abs(_2947);
    float _2955 = log2(_2953);
    float _2957 = _2929 * _2939;
    float _2959 = _2949 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2961 = _2621 * _2951;
    float _2963 = -_2951;
    float _2965 = -_2959;
    float _2967 = fma(_2963, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2965);
    float _2969 = fma(_2619, _2949, _2961);
    float _2971 = -_2957;
    float _2973 = fma(_2971, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2967);
    float _2975 = fma(_2623, _2957, _2969);
    float _2977 = precise::clamp(_2975, 0.0, 1.0);
    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2981 = _2973 + _2979;
    float _2983 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2985 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2987 = precise::clamp(_2985, 0.0, 1.0);
    float _2989 = exp2(_2983);
    float _2991 = _2989 * _2987;
    float _2993 = _2977 * _2991;
    float _2995 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2999 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2995;
    out.m_85.y = _2997;
    out.m_85.z = _2999;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

