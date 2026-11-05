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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_95 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_105 [[user(locn4)]];
    float4 m_103 [[user(locn5)]];
    float4 m_101 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_81 [[user(locn14)]];
    float4 m_79 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_91 [[attribute(8)]];
    float4 m_89 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
    float4 m_69 [[attribute(11)]];
    float4 m_55 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3710 = false;
    bool _732 = false;
    bool _628 = false;
    bool _486 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_48.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_51.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4015 = as_type<float>(_140);
        out.gl_Position.z = _4015;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_53.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_51.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4085 = as_type<float>(_178);
        out.gl_Position.z = _4085;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_55.x;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_55.y;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    float _192 = in.m_59.x;
    float _194 = in.m_59.y;
    float _196 = in.m_59.z;
    float _198 = in.m_61.x;
    float _200 = in.m_61.y;
    float _202 = in.m_61.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    out.m_65.x = _180;
    out.m_65.y = _184;
    float _210 = _188 * _194;
    float _212 = _188 * _200;
    float _214 = fma(_186, _192, _210);
    float _216 = _188 * _206;
    float _218 = fma(_186, _198, _212);
    float _220 = fma(_190, _196, _214);
    float _222 = fma(_186, _204, _216);
    float _224 = fma(_190, _202, _218);
    float _226 = fma(_190, _208, _222);
    bool _228 = !_182;
    float _230 = _184;
    float _232 = _180;
    float _250;
    if (!_228)
    {
        float _234 = in.m_67.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_124);
        float _256 = 1.0 / _254;
        float _258 = _158 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _260 + _282;
    float _286 = 1.0 / _272;
    bool _288 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _290 = isnan(_260);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _302 = isnan(_260);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    bool _312 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_260);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _326 = 1.0 / _276;
    float _328 = 1.0 / _280;
    float _330 = _264 * _286;
    bool _332 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _334 = isnan(_260);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _348 = -_342;
    float _350 = _348 + 1.0;
    float _352 = _268 * _326;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = -_310;
    float _364 = _362 + 1.0;
    float _366 = fma(_360, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = _284 * _328;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _374;
    float _378 = fma(_356, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = _322 * _364;
    float _386 = fma(_376, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = _298 * _350;
    float _390 = -_298;
    float _392 = _390 + 1.0;
    float _394 = fma(_370, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _396 = _378 * _384;
    float _398 = _310 * _392;
    float _400 = fma(_346, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _402 = fma(_382, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _404 = in.m_69.x;
    float _406 = in.m_69.y;
    float _408 = in.m_69.z;
    float _410 = _366 * _384;
    float _412 = -_322;
    float _414 = _412 + 1.0;
    float _416 = _386 * _384;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _422;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _436 = fma(_424, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_420, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _440 = fma(_432, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = fma(_400, _398, _426);
    float _444 = fma(_402, _398, _428);
    float _446 = fma(_394, _398, _434);
    float _448 = fma(_436, _388, _442);
    float _450 = fma(_438, _388, _444);
    float _452 = fma(_440, _388, _446);
    float _454 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].x, _448);
    float _456 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].y, _450);
    float _458 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].z, _452);
    float _460 = _454 * _404;
    float _462 = _456 * _406;
    float _464 = _458 * _408;
    bool _466 = !_324;
    float _484;
    if (!_466)
    {
        float _468 = in.m_67.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_124);
        float _490 = 1.0 / _488;
        float _492 = _158 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _494 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _504 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = isnan(_494);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _522 = isnan(_494);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    bool _536 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _538 = isnan(_494);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = 1.0 / _502;
    float _550 = -_514;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _556 = 1.0 / _518;
    float _558 = _534 * _548;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _564 = -_546;
    float _566 = _564 + 1.0;
    float _568 = fma(_558, _498, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _570 = _530 * _552;
    float _572 = -_530;
    float _574 = _572 + 1.0;
    float _576 = _514 * _566;
    float _578 = _562 * _556;
    float _580 = _568 * _570;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _584 = _494 + _582;
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[115].x, _580);
    float _588 = fma(_578, _584, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _592 = fma(_588, _576, _586);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _600 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[117].x, _592);
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _596;
    out.m_71.y = _602;
    out.m_71.z = _604;
    out.m_71.w = _606;
    bool _608 = !_554;
    float _626;
    if (!_608)
    {
        float _610 = in.m_67.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_124);
        float _632 = 1.0 / _630;
        float _634 = _158 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    bool _638 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _654 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _656 = isnan(_636);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _672 = _636 + _670;
    float _674 = -_648;
    float _676 = _674 + 1.0;
    float _678 = 1.0 / _652;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _682 = _664 * _676;
    float _684 = -_664;
    float _686 = _684 + 1.0;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _690 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _668 * _678;
    float _694 = fma(_692, _672, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _696 = _694 * _682;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[131].x, _696);
    float _704 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[132].x, _702);
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _704 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _706;
    out.m_73.y = _708;
    out.m_73.z = _690;
    out.m_73.w = _710;
    bool _712 = !_680;
    float _730;
    if (!_712)
    {
        float _714 = in.m_67.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_124);
        float _736 = 1.0 / _734;
        float _738 = _158 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _744 = int(_742);
    float _746 = float(_124);
    float _748 = in.m_59.w;
    float _750 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _752 = in.m_63.w;
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _756 = int(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _766 = 1.0 / _746;
    float _768 = float(_744);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _782 = 1.0 / _768;
    float _784 = float(uint(_756));
    int _786 = ~_756;
    int _788 = _786 + 1;
    int _790 = ~_756;
    int _792 = _790 + 1;
    int _794 = ~_756;
    int _796 = _794 + 1;
    float _798 = 1.0 / _784;
    float _800 = _782 * _158;
    float _802 = 1.0 / _760;
    int _804 = as_type<int>(_798) + (-2);
    float _806 = trunc(_800);
    int _808 = int(_806);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _812 = _810 != 0;
    float _814 = 1.0 / _780;
    bool _816 = !_812;
    float _818 = _816 ? 7.345489978790283203125 : 1.0;
    float _820 = float(uint(_808));
    float _822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _824 = as_type<float>(_804) * _820;
    float _826 = trunc(_824);
    float _828 = precise::max(_826, 0.0);
    uint _831 = uint(_828);
    float _833 = _822 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _835 = float(_756);
    int _837 = _788 * int(_831);
    int _839 = _837 + _808;
    float _841 = float(uint(_839));
    float _843 = in.m_67.x;
    float _845 = as_type<float>(_804) * _841;
    float _847 = trunc(_845);
    float _849 = precise::max(_847, 0.0);
    uint _851 = uint(_849);
    float _853 = _818 * _843;
    int _855 = int(_831) + int(_851);
    float _857 = float(_808);
    float _859 = 0.0;
    if (_812)
    {
        _859 = _843;
    }
    float _861 = _859;
    int _863 = _792 * _855;
    int _865 = _863 + _808;
    bool _867 = _857 >= _835;
    bool _869 = isnan(_857);
    bool _871 = _867 || _869;
    bool _873 = isnan(_835);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = floor(_853);
    bool _881 = uint(_865) >= uint(_756);
    bool _883 = !_881;
    int _885 = _883 ? 0 : (-1);
    float _887 = trunc(_877);
    int _889 = int(_887);
    bool _891 = _756 == 0;
    int _893 = ~_855;
    int _895 = _893 + _885;
    int _897 = _895 + 1;
    int _899 = _756 * _897;
    int _901 = _899 + _808;
    float _903 = -_879;
    float _905 = _853 + _903;
    int _907 = _756 + (-1);
    float _909 = _905 * _835;
    bool _911 = !_891;
    int _913 = _911 ? _901 : (-1);
    float _915 = _835 * _158;
    int _917 = ~_889;
    int _919 = _917 + 1;
    int _921 = _919 + 1;
    float _923 = trunc(_909);
    int _925 = int(_923);
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _933 = _931 != 0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _937 = _935 != 0;
    float _939 = _915 * _766;
    int _941 = _913 * _921;
    bool _943 = !_933;
    int _945 = _943 ? 0 : 1;
    float _947 = trunc(_939);
    int _949 = int(_947);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _953 = _951 != 0;
    int _955 = _889 * _907;
    int _957 = _955 + _941;
    bool _959 = !_929;
    int _961 = _959 ? 0 : 1;
    bool _963 = !_953;
    int _965 = _963 ? 0 : 1;
    int _967 = abs(_945);
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _971 = _969 != 0;
    bool _973 = !_937;
    int _975 = _973 ? 0 : 1;
    int _977 = _957 * _967;
    int _979 = abs(_961);
    int _981 = abs(_965);
    bool _983 = !_971;
    int _985 = _983 ? 0 : 1;
    int _987 = abs(_975);
    int _989 = _925 * _981;
    int _991 = _989 + _808;
    int _993 = abs(_985);
    int _995 = _949 * _979;
    int _997 = _995 + _977;
    float _999 = in.m_48.x;
    float _1001 = in.m_48.y;
    int _1003 = _991 * _987;
    int _1005 = _1003 + _997;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1009 = _1007 != 0;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1013 = _1011 != 0;
    int _1015 = _925 * _993;
    int _1017 = _1015 + _1005;
    int _1019 = ~_756;
    int _1021 = _1019 + 1;
    float _1023 = in.m_75.y;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1027 = _1025 != 0;
    float _1029 = float(uint(_1017));
    float _1031 = as_type<float>(_804) * _1029;
    int _1033 = _997;
    bool _1035 = _971;
    float _1037 = _861;
    if (_1009)
    {
        float _1039 = -_180;
        float _1041 = _1039 + 1.0;
        _1033 = as_type<int>(_1041);
    }
    int _1043 = _1033;
    if (_1009)
    {
        bool _1045 = _843 > 0.5;
        _1035 = _1045;
    }
    bool _1047 = _1035;
    float _1049 = trunc(_1031);
    float _1051 = precise::max(_1049, 0.0);
    uint _1053 = uint(_1051);
    float _1055 = 0.0;
    if (!_1027)
    {
        _1055 = _180;
    }
    float _1057 = _1055;
    float _1059 = _206 * _1001;
    float _1061 = _200 * _1001;
    float _1063 = _843 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1065 = in.m_67.y;
    float _1067 = fma(_198, _999, _1061);
    float _1069 = -_762;
    float _1071 = fma(_1063, 2.0, _1069);
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1075 = _1073 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1077 = _1021 * int(_1053);
    int _1079 = _1077 + _1017;
    float _1081 = 1.0 / _1075;
    float _1083 = float(uint(_1079));
    float _1085 = as_type<float>(_1079);
    float _1087 = _1057;
    if (!_1009)
    {
        _1085 = _180;
    }
    float _1089 = _1085;
    float _1091 = _1089;
    if (_1009)
    {
        float _1093 = _1047 ? as_type<float>(_1043) : _180;
        _1091 = _1093;
    }
    float _1095 = _1091;
    float _1097 = as_type<float>(_804) * _1083;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1101 = _1099 != 0;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1103;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1109 = _1107 != 0;
    float _1111 = _194 * _1001;
    float _1113 = trunc(_1097);
    float _1115 = precise::max(_1113, 0.0);
    uint _1117 = uint(_1115);
    float _1119 = _1001 + _1023;
    float _1121 = fma(_192, _999, _1111);
    float _1123 = fma(_204, _999, _1059);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1129 = float(uint(_991));
    float _1131 = _1105 * _802;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1137 = 1.0 / _1127;
    float _1139 = -_184;
    float _1141 = _1139 + 1.0;
    float _1143 = as_type<float>(_804) * _1129;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1149 = !_1101;
    int _1151 = _1149 ? 0 : 1;
    float _1153 = _1147 * _1081;
    int _1155 = int(_1053) + int(_1117);
    float _1157 = 1.0 / _1135;
    float _1159 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1161 = _796 * _1155;
    int _1163 = _1161 + _1017;
    float _1165 = fma(_1159, -2.0, _764);
    float _1167 = _776 * _1137;
    float _1169 = trunc(_1143);
    float _1171 = precise::max(_1169, 0.0);
    uint _1173 = uint(_1171);
    float _1175 = in.m_67.z;
    bool _1177 = uint(_1163) >= uint(_756);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1187 = in.m_48.z;
    bool _1189 = !_1177;
    int _1191 = _1189 ? 0 : (-1);
    bool _1193 = _1065 > 0.5;
    float _1195 = _772 * _1157;
    int _1197 = ~_1155;
    int _1199 = _1197 + _1191;
    int _1201 = _1199 + 1;
    float _1203 = 1.0 / _1181;
    int _1205 = _1193 ? as_type<int>(_1141) : as_type<int>(_184);
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1207;
    int _1211 = _756 * _1201;
    int _1213 = _1211 + _1017;
    int _1215 = ~_756;
    int _1217 = _1215 + 1;
    float _1219 = _1209 * _814;
    float _1221 = _1013 ? as_type<float>(_1205) : _184;
    float _1223 = 1.0 / _1185;
    bool _1225 = !_891;
    int _1227 = _1225 ? _1213 : (-1);
    int _1229 = _1217 * int(_1173);
    int _1231 = _1229 + _991;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1237 = ~_756;
    int _1239 = _1237 + 1;
    bool _1241 = _1175 > 0.5;
    int _1243 = _1227 & 3;
    bool _1245 = _1243 != 0;
    float _1247 = _1235 * _1203;
    if (_1109)
    {
        float _1249 = _1241 ? _1141 : _184;
        _230 = _1249;
    }
    float _1251 = _230;
    float _1253 = fma(_202, _1187, _1067);
    bool _1255 = uint(_1243) > 1u;
    float _1257 = _843 * 2.0;
    float _1259 = float(uint(_1231));
    float _1261 = fma(_833, _1251, -0.5);
    int _1263 = _1227 & 3;
    bool _1265 = _1263 != 0;
    float _1267 = as_type<float>(_804) * _1259;
    int _1269 = _1265 ? 0 : 1;
    float _1271 = floor(_1257);
    bool _1273 = uint(_1243) >= 2u;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1275;
    int _1279 = ~_1269;
    int _1281 = _1279 + 1;
    int _1283 = _1281 + 1;
    float _1285 = _1065 * 2.0;
    int _1287 = _1283;
    float _1289 = _1285;
    if (!_1255)
    {
        int _1291 = ~_1269;
        int _1293 = _1291 + 1;
        _1287 = _1293;
    }
    int _1295 = _1287;
    float _1297 = _1277 * _1223;
    int _1299 = _1273 ? 0 : 1;
    float _1301 = trunc(_1267);
    float _1303 = precise::max(_1301, 0.0);
    uint _1305 = uint(_1303);
    bool _1307 = _1065 > 0.5;
    bool _1309 = _1307 && _1027;
    float _1311 = fma(_196, _1187, _1121);
    bool _1313 = _1243 != 3;
    float _1315 = fma(_208, _1187, _1123);
    float _1317 = _1065 + _1175;
    if (!_812)
    {
        _1037 = _1175;
    }
    float _1319 = _1037;
    float _1321 = _843 + _1065;
    float _1323 = floor(_1285);
    int _1325 = ~_1299;
    int _1327 = _1325 + 1;
    int _1329 = _1327 + 1;
    float _1331 = _1317 + (-1.0);
    bool _1333 = !_1245;
    int _1335 = _1333 ? 0 : 1;
    float _1337 = _1321 + (-1.0);
    int _1339 = _1329;
    if (_1309)
    {
        float _1341 = -_180;
        float _1343 = _1341 + 1.0;
        _232 = _1343;
    }
    float _1345 = _232;
    bool _1347 = _1271 >= 0.0;
    bool _1349 = isnan(_1271);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = _1315 + _752;
    int _1359 = int(_1173) + int(_1305);
    float _1361 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_1027)
    {
        _1087 = _1345;
    }
    float _1363 = _1087;
    if (_1313)
    {
        int _1365 = ~_1299;
        int _1367 = _1365 + 1;
        _1339 = _1367;
    }
    int _1369 = _1339;
    int _1371 = _1239 * _1359;
    int _1373 = _1371 + _991;
    bool _1375 = _1271 > 0.0;
    float _1377 = _1175 * 2.0;
    bool _1379 = uint(_1373) >= uint(_756);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1383 = _740 + _1381;
    if (_812)
    {
        _1289 = _1065;
    }
    float _1385 = _1289;
    float _1387 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1389 = _1243 != 3;
    float _1391 = floor(_1377);
    float _1393 = _1385;
    if (!_812)
    {
        _1393 = _843;
    }
    float _1395 = _1393;
    float _1397 = fma(_1131, _1383, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1399 = !_1379;
    int _1401 = _1399 ? 0 : (-1);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1405 = _740 + _1403;
    bool _1407 = _1323 > 0.0;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1411 = _740 + _1409;
    bool _1413 = _1323 >= 0.0;
    bool _1415 = isnan(_1323);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(0.0);
    bool _1421 = _1417 || _1419;
    float _1423 = fma(_1167, _1405, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1425 = _1355 ? 0 : 1;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1429 = _740 + _1427;
    bool _1431 = !_1389;
    int _1433 = _1431 ? 0 : (-1);
    float _1435 = fma(_1247, _1411, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1439 = _1437 != 0;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1443 = _1441 != 0;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1447 = _1445 != 0;
    float _1449 = fma(_1195, _1429, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1451 = _1227 >> 31;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1455 = _740 + _1453;
    int _1457 = ~_1425;
    int _1459 = _1457 + 1;
    int _1461 = _1459 + 1;
    int _1463 = _1461;
    if (!_1375)
    {
        int _1465 = ~_1425;
        int _1467 = _1465 + 1;
        _1463 = _1467;
    }
    int _1469 = _1463;
    float _1471 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1473 = _740 + _1471;
    bool _1475 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1477 = isnan(_740);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = fma(_1219, _1455, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1489 = _1451 & 3;
    float _1491 = fma(_1153, _1473, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1493 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1495 = isnan(_740);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = -_1485;
    float _1507 = _1505 + 1.0;
    int _1509 = _1227 + _1489;
    bool _1511 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1513 = isnan(_740);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = in.m_61.w;
    int _1525 = _1509 >> 2;
    float _1527 = _1503 * _1507;
    int _1529 = _1421 ? 0 : 1;
    float _1531 = -_1503;
    float _1533 = _1531 + 1.0;
    bool _1535 = _1391 > 0.0;
    bool _1537 = _1391 >= 0.0;
    bool _1539 = isnan(_1391);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(0.0);
    bool _1545 = _1541 || _1543;
    float _1547 = -_1521;
    float _1549 = _1547 + 1.0;
    bool _1551 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1553 = isnan(_740);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1559 = _1555 || _1557;
    float _1561 = float(_1559);
    int _1563 = _1525 << 4;
    int _1565 = _1563 + 368;
    float _1567 = _1485 * _1549;
    bool _1569 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1571 = isnan(_740);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1577 = _1573 || _1575;
    float _1579 = float(_1577);
    float _1581 = _1561 * _1533;
    float _1583 = -_1561;
    float _1585 = _1583 + 1.0;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1589 = _740 + _1587;
    uint _1591 = uint(int(uint(_1565) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[int(_1601)][_1603];
    bool _1607 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1609 = isnan(_740);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    float _1619 = -_1579;
    float _1621 = _1619 + 1.0;
    float _1623 = fma(_1297, _1589, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1625 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1627 = isnan(_740);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1633 = _1629 || _1631;
    float _1635 = float(_1633);
    float _1637 = _1579 * _1585;
    float _1639 = _1617 * _1621;
    float _1641 = -_1617;
    float _1643 = _1641 + 1.0;
    float _1645 = _1311 + _748;
    bool _1647 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1649 = isnan(_740);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1655 = _1651 || _1653;
    float _1657 = float(_1655);
    float _1659 = -_1635;
    float _1661 = _1659 + 1.0;
    float _1663 = _1635 * _1643;
    float _1665 = _1253 + _1523;
    float _1667 = _1657 * _1661;
    float _1669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1671 = _1565 + 8;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[int(_1683)][_1685];
    float _1689 = -_1657;
    float _1691 = _1689 + 1.0;
    float _1693 = _1397 * _1667;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1697 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1693);
    int _1701 = abs(_1295);
    float _1703 = -_1695;
    float _1705 = fma(_1697, 2.0, _1703);
    float _1707 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1709 = ~_1359;
    int _1711 = _1709 + _1401;
    int _1713 = _1711 + 1;
    float _1715 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1717 = int(_1715);
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1721 = abs(_1369);
    float _1723 = fma(_1491, _1663, _1699);
    float _1725 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1727 = ~_1529;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    float _1733 = fma(_1707, -2.0, _1719);
    int _1735 = _1731;
    if (!_1407)
    {
        int _1737 = ~_1529;
        int _1739 = _1737 + 1;
        _1735 = _1739;
    }
    int _1741 = _1735;
    float _1743 = fma(_1725, _1363, -0.5);
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1747 = _1645 + _1745;
    int _1749 = abs(_1335);
    int _1751 = _756 * _1713;
    int _1753 = _1751 + _991;
    int _1755 = ~_1701;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1763 = _1665 + _1761;
    float _1765 = _1747 * _1747;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1769 = _1357 + _1767;
    float _1771 = float(uint(_1717));
    float _1773 = -_158;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1705);
    int _1777 = ~_1749;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    float _1783 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1733);
    int _1785 = _1759 * as_type<int>(_1605);
    float _1787 = fma(_1763, _1763, _1765);
    int _1789 = abs(_1433);
    float _1791 = 1.0 / _1771;
    int _1793 = _1781 * as_type<int>(_1597);
    int _1795 = _1793 + _1785;
    float _1797 = fma(_1769, _1769, _1787);
    float _1799 = fma(_1449, _1639, _1723);
    int _1801 = abs(_1151);
    int _1803 = ~_1721;
    int _1805 = _1803 + 1;
    int _1807 = _1805 + 1;
    float _1809 = sqrt(_1797);
    int _1811 = abs(_1717);
    int _1813 = ~_1789;
    int _1815 = _1813 + 1;
    int _1817 = _1815 + 1;
    int _1819 = _1807 * as_type<int>(_1679);
    int _1821 = _1819 + _1795;
    float _1823 = float(uint(_1811));
    float _1825 = rsqrt(_1797);
    int _1827 = ~_1801;
    int _1829 = _1827 + 1;
    int _1831 = _1829 + 1;
    int _1833 = _1817 * as_type<int>(_1687);
    int _1835 = _1833 + _1821;
    int _1837 = _1545 ? 0 : 1;
    int _1839 = _1835 * _1831;
    bool _1841 = !_891;
    int _1843 = _1841 ? _1753 : (-1);
    float _1845 = 1.0 / _1823;
    float _1847 = _1809 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1851 = ~_1837;
    int _1853 = _1851 + 1;
    int _1855 = _1853 + 1;
    int _1857 = _1843 * _1801;
    int _1859 = _1857 + _1839;
    int _1861 = _1855;
    float _1863 = as_type<float>(_1811);
    if (!_1535)
    {
        int _1865 = ~_1837;
        int _1867 = _1865 + 1;
        _1861 = _1867;
    }
    int _1869 = _1861;
    float _1871 = _750 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1875 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1877 = log2(_1875);
    int _1879 = as_type<int>(_1791) + (-2);
    float _1881 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1849);
    float _1883 = precise::min(_1871, _1847);
    float _1885 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1873);
    float _1887 = float(uint(_1859));
    float _1889 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1881);
    int _1891 = abs(_1859);
    out.m_77.w = _1883;
    int _1893 = as_type<int>(_1845) + (-2);
    float _1895 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1885);
    float _1897 = float(uint(_1891));
    float _1899 = as_type<float>(_1879) * _1887;
    int _1901 = ~_1717;
    int _1903 = _1901 + 1;
    float _1905 = fma(_1895, _1743, _1775);
    float _1907 = trunc(_1899);
    float _1909 = precise::max(_1907, 0.0);
    uint _1911 = uint(_1909);
    float _1913 = as_type<float>(_1893) * _1897;
    float _1915 = -_1783;
    float _1917 = fma(_1889, _1261, _1915);
    float _1919 = _1825 * _1883;
    float _1921 = _1877 * _158;
    bool _1923 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1925 = isnan(1.0);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1931 = _1927 || _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1935 = 1.0 + _1933;
    float _1937 = _1763 * _1919;
    float _1939 = trunc(_1913);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    float _1945 = _1747 * _1919;
    int _1947 = ~_1811;
    int _1949 = _1947 + 1;
    float _1951 = -_1937;
    float _1953 = _1763 + _1951;
    bool _1955 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1963 = _1959 || _1961;
    float _1965 = -_1945;
    float _1967 = _1747 + _1965;
    float _1969 = _1917 + 0.5;
    float _1971 = _1953 * _1953;
    float _1973 = _1769 * _1919;
    float _1975 = exp2(_1921);
    int _1977 = _1903 * int(_1911);
    int _1979 = _1977 + _1859;
    float _1981 = fma(_1967, _1967, _1971);
    float _1983 = -_1973;
    float _1985 = _1769 + _1983;
    float _1987 = float(uint(_1979));
    int _1989 = _1949 * int(_1943);
    int _1991 = _1989 + _1891;
    float _1993 = fma(_1985, _1985, _1981);
    float _1995 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1997 = _1119 + _1995;
    float _1999 = as_type<float>(_1879) * _1987;
    float _2001 = float(uint(_1991));
    float _2003 = sqrt(_1993);
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2009 = -_1975;
    float _2011 = _2009 + 1.0;
    float _2013 = as_type<float>(_1893) * _2001;
    float _2015 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2005);
    float _2017 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2007);
    float _2019 = -_158;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1071);
    float _2023 = 1.0 / _1935;
    float _2025 = fma(_1997, _1997, _1765);
    float _2027 = _1963 ? _2011 : 0.0;
    float _2029 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2015);
    float _2031 = float(_1469);
    float _2033 = fma(_1769, _1769, _2025);
    float _2035 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1165);
    float _2037 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2017);
    float _2039 = trunc(_1999);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = _1997 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2047 = _1825 * _2003;
    float _2049 = _1905 + 0.5;
    float _2051 = fma(_1423, _1637, _1799);
    float _2053 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2045);
    float _2055 = _750 * _2047;
    bool _2057 = !_1443;
    int _2059 = _2057 ? 0 : 1;
    float _2061 = trunc(_2013);
    float _2063 = precise::max(_2061, 0.0);
    uint _2065 = uint(_2063);
    float _2067 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2053);
    float _2069 = _1973;
    if (_1931)
    {
        float _2071 = _2027 * _2023;
        _160 = _2071;
    }
    float _2073 = _160;
    float _2075 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_79.x = _2049;
    out.m_79.y = _1969;
    float _2077 = fma(_1487, _1581, _2051);
    bool _2079 = _2067 >= 0.0;
    float _2081 = rsqrt(_2033);
    int _2083 = int(_1911) + int(_2043);
    float _2085 = fma(_1435, _1527, _2077);
    int _2087 = ~_1717;
    int _2089 = _2087 + 1;
    int _2091 = ~_1811;
    int _2093 = _2091 + 1;
    float _2095 = fma(_1623, _1567, _2085);
    int _2097 = _1859 ^ _1717;
    int _2099 = _2089 * _2083;
    int _2101 = _2099 + _1859;
    int _2103 = int(_1943) + int(_2065);
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2107 = abs(_2059);
    float _2109 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2095);
    bool _2111 = uint(_2101) >= uint(_1717);
    int _2113 = _2093 * _2103;
    int _2115 = _2113 + _1891;
    float _2117 = float(_2107);
    float _2119 = _2075 * _2081;
    bool _2121 = !_2111;
    int _2123 = _2121 ? 0 : (-1);
    float _2125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2127 = uint(_2115) >= uint(_1811);
    float _2129 = _1997 * _2119;
    float _2131 = _1747 * _2119;
    int _2133 = ~_2083;
    int _2135 = _2133 + _2123;
    int _2137 = _2135 + 1;
    out.m_81.x = _2109;
    float _2139 = -_2129;
    float _2141 = _1997 + _2139;
    float _2143 = -_2131;
    float _2145 = _1747 + _2143;
    bool _2147 = !_2127;
    int _2149 = _2147 ? 0 : (-1);
    float _2151 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2153 = _2141 * _2141;
    bool _2155 = _1717 == 0;
    if (_2079)
    {
        out.m_51.x = 0.0;
    }
    bool _2157 = _1717 == 0;
    float _2159 = fma(_2145, _2145, _2153);
    uint _2161 = uint(int(uint(_2097) >> uint(31)));
    int _2163 = _1717 * _2137;
    int _2165 = _2163 + _1859;
    int _2167 = ~_2149;
    int _2169 = _2103 + _2167;
    int _2171 = _2169 + 1;
    int _2173 = ~int(_2161);
    int _2175 = _2173 + 1;
    float _2177 = _1769 * _2119;
    bool _2179 = !_2155;
    int _2181 = _2179 ? _2165 : (-1);
    float _2183 = fma(_2151, _1095, -0.5);
    if (_2079)
    {
        _1863 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2185 = _1863;
    float _2187 = -_2177;
    float _2189 = _1769 + _2187;
    float _2191 = float(_2181);
    float _2193 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2195 = _2171 ^ _2175;
    float _2197 = fma(_2189, _2189, _2159);
    int _2199 = as_type<int>(_2185);
    if (_2079)
    {
        float _2201 = _2185 * 5.0;
        _2199 = as_type<int>(_2201);
    }
    int _2203 = _2199;
    float _2205 = fma(_2151, _2191, _2021);
    int _2207 = ~_2175;
    int _2209 = _2207 + _2195;
    int _2211 = _2209 + 1;
    float _2213 = fma(_2193, _1221, -0.5);
    float _2215 = _2117 * _2031;
    float _2217 = sqrt(_2197);
    if (_2079)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7157 = as_type<float>(_2203);
        out.gl_Position.z = _7157;
    }
    float _2219 = fma(_2029, _2183, _2205);
    bool _2221 = !_2157;
    int _2223 = _2221 ? _2211 : (-1);
    float _2225 = float(_1869);
    float _2227 = _2219 + 0.5;
    float _2229 = float(_2223);
    float _2231 = -_2035;
    float _2233 = fma(_2193, _2229, _2231);
    bool _2235 = !_1447;
    int _2237 = _2235 ? 0 : 1;
    bool _2239 = !_1439;
    int _2241 = _2239 ? 0 : 1;
    float _2243 = fma(_2037, _2213, _2233);
    int _2245 = abs(_2237);
    float _2247 = _2081 * _2217;
    int _2249 = abs(_2241);
    float _2251 = _2243 + 0.5;
    float _2253 = in.m_83.x;
    float _2255 = in.m_83.y;
    float _2257 = in.m_83.z;
    float _2259 = _2055 * _2247;
    float _2261 = float(_1741);
    out.m_85.x = _2227;
    out.m_85.y = _2251;
    float _2263 = float(_2245);
    float _2265 = float(_2249);
    out.m_87.x = _2259;
    if (_2079)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2267 = _2265 * _2225;
    float _2269 = -_2131;
    float _2271 = _1645 + _2269;
    float _2273 = -_2129;
    float _2275 = _1119 + _2273;
    float _2277 = _2267 * (-2.0);
    float _2279 = _2263 * _2261;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2283 = _2271 + _2281;
    float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2287 = _2275 + _2285;
    float _2289 = fma(_2277, _2253, _2253);
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _2291;
    float _2295 = -_2177;
    float _2297 = _1357 + _2295;
    float _2299 = _2287 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2301 = fma(_1361, _2277, _1361);
    float _2303 = _843 + (-0.5);
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2307 = _2297 + _2305;
    float _2309 = 1.0 / _2293;
    float _2311 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2299);
    float _2313 = precise::max(_1187, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _2315 = _2215 * (-2.0);
    float _2317 = _843 + _1175;
    float _2319 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2311);
    float _2321 = fma(_2303, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2289);
    float _2323 = precise::min(_2313, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _2325 = fma(_1387, _2315, _1387);
    float _2327 = _2317 + (-1.0);
    float _2329 = fma(_2315, _2255, _2255);
    float _2331 = _1065 + (-0.5);
    float _2333 = fma(_2301, _2073, _2321);
    bool _2335 = _2319 >= 0.0;
    float _2337 = _2279 * (-2.0);
    float _2339 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2341 = _2323 + _2339;
    float _2343 = fma(_2327, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2345 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2329);
    float _2347 = _2333 * 0.15915493667125701904296875;
    float _2349 = _2341 * _2309;
    float _2351 = fma(_2337, _2257, _2257);
    float _2353 = fma(_2343, _2337, _2343);
    float _2355 = fma(_2325, _2073, _2345);
    float _2357 = in.m_89.x;
    float _2359 = in.m_89.y;
    float _2361 = in.m_89.z;
    float _2363 = _1175 + (-0.5);
    float _2365 = _2355 * 0.15915493667125701904296875;
    float _2367 = _2319;
    int _2369 = as_type<int>(_2347);
    if (_2335)
    {
        _2367 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2371 = _2367;
    float _2373 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2351);
    float _2375 = _2347 * 6.283185482025146484375;
    float _2377 = sin(_2375);
    float _2379 = (*spvDescriptorSet0.vp_c9)._m0[191].z + (-1.0);
    if (_2335)
    {
        out.m_51.x = 0.0;
    }
    float _2381 = fma(_2353, _2073, _2373);
    float _2383 = fma(_2349, _2379, 1.0);
    float _2385 = _2365 * 6.283185482025146484375;
    float _2387 = sin(_2385);
    float _2389 = _2381 * 0.15915493667125701904296875;
    float _2391 = _2365 * 6.283185482025146484375;
    float _2393 = cos(_2391);
    float _2395 = _2347 * 6.283185482025146484375;
    float _2397 = cos(_2395);
    if (_2335)
    {
        float _2399 = _2371 * 5.0;
        _2369 = as_type<int>(_2399);
    }
    int _2401 = _2369;
    if (_2335)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7445 = as_type<float>(_2401);
        out.gl_Position.z = _7445;
    }
    if (_2335)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2403 = _2389 * 6.283185482025146484375;
    float _2405 = cos(_2403);
    float _2407 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2409 = _2047 * _2247;
    float _2411 = _2383 * _2359;
    float _2413 = _2383 * _2357;
    float _2415 = _2383 * _2361;
    float _2417 = _2407 * _2409;
    float _2419 = _2389 * 6.283185482025146484375;
    float _2421 = sin(_2419);
    float _2423 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2411);
    float _2425 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2413);
    float _2429 = _2377 * _2387;
    float _2431 = _2397 * _2393;
    float _2433 = _2425 * _2409;
    float _2435 = _2259 * _2427;
    float _2437 = _2397 * _2405;
    float _2439 = _2417 * _2423;
    float _2441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2415);
    float _2443 = _2397 * _2387;
    float _2445 = _2377 * _2393;
    float _2447 = _2437 * _2439;
    float _2449 = _2377 * _2405;
    float _2451 = _2433 * _2441;
    float _2453 = fma(_2421, _2431, _2429);
    float _2455 = _2393 * _2405;
    float _2457 = -_2445;
    float _2459 = fma(_2421, _2443, _2457);
    float _2461 = -_2439;
    float _2463 = _2421 * _2461;
    float _2465 = fma(_2453, _2435, _2447);
    float _2467 = -_2443;
    float _2469 = fma(_2421, _2445, _2467);
    float _2471 = _2449 * _2439;
    float _2473 = _2387 * _2405;
    float _2475 = fma(_2455, _2435, _2463);
    float _2477 = fma(_2459, _2451, _2465);
    float _2479 = fma(_2421, _2429, _2431);
    float _2481 = fma(_2469, _2435, _2471);
    float _2483 = fma(_2473, _2451, _2475);
    float _2485 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2487 = fma(_2479, _2451, _2481);
    float _2489 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2491 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2485);
    float _2493 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2495 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2489);
    float _2497 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2491);
    float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2493);
    float _2501 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2495);
    float _2503 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2505 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2499);
    float _2507 = _2501 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2509 = _1357 + _2503;
    float _2511 = _2505 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2513 = _1645 + _2507;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2517 = _2509 + _2515;
    float _2519 = _1119 + _2511;
    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2523 = _2513 + _2521;
    float _2525 = _2517 * _2517;
    float _2527 = fma(_2523, _2523, _2525);
    float _2529 = sqrt(_2527);
    bool _2531 = _2529 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2533 = _2525;
    float _2535 = _2487;
    float _2537 = _2513;
    if (!_2531)
    {
        _2533 = _2509;
    }
    float _2539 = _2533;
    float _2541 = _2539;
    if (!_2531)
    {
        _2535 = _2519;
    }
    float _2543 = _2535;
    bool _2545 = !_2531;
    float _2547 = _2543;
    if (!_2545)
    {
        float _2549 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2553 = _2529 + _2551;
        float _2555 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2557 = rsqrt(_2527);
        float _2559 = _2553 * _2549;
        float _2561 = _2559 * 0.15915493667125701904296875;
        float _2563 = _2561 * 6.283185482025146484375;
        float _2565 = cos(_2563);
        float _2567 = _2561 * 6.283185482025146484375;
        float _2569 = sin(_2567);
        float _2571 = _2565 + (-1.0);
        float _2573 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2575 = fma(_2569, _2555, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2577 = fma(_2519, _2565, _2573);
        float _2579 = _2557 * _2575;
        float _2581 = fma(_2523, _2579, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2583 = fma(_2517, _2579, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2537 = _2581;
        _2541 = _2583;
        _2547 = _2577;
    }
    float _2585 = _2537;
    float _2587 = _2541;
    float _2589 = _2547;
    float _2591 = -_1945;
    float _2593 = _2591 + _2585;
    float _2595 = -_1973;
    float _2597 = _2595 + _2587;
    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2601 = _2593 + _2599;
    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2605 = _2597 + _2603;
    float _2607 = fma(_2601, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2609 = fma(_2605, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7795 = float2(_2607, _2609);
    float _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7795, float2(0.0), isnan(_7795)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7795, float2(0.0), isnan(_7795)), level(0.0)).x;
    float _2613 = -_1937;
    float _2615 = _2613 + _1119;
    float _2617 = -_1945;
    float _2619 = _1645 + _2617;
    float _2621 = -_1645;
    float _2623 = _2621 + _2585;
    float _2625 = -_1937;
    float _2627 = _2625 + _2589;
    float _2629 = -_1119;
    float _2631 = _2629 + _2589;
    float _2633 = -_1357;
    float _2635 = _2633 + _2587;
    float _2637 = -_1973;
    float _2639 = _1357 + _2637;
    float _2641 = -_2131;
    float _2643 = _2641 + _2619;
    bool _2645 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2647 = isnan(0.5);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2653 = _2649 || _2651;
    float _2655 = _2631 * _2631;
    bool _2657 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2659 = isnan(0.5);
    bool _2661 = _2657 || _2659;
    bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2665 = _2661 || _2663;
    float _2667 = fma(_2623, _2623, _2655);
    float _2669 = fma(_2635, _2635, _2667);
    float _2671 = sqrt(_2669);
    bool _2673 = _2671 > 0.0;
    float _2675 = fma(_2611, 100.0, _2615);
    float _2677 = -_2177;
    float _2679 = _2677 + _2639;
    float _2681 = fma(_2611, 100.0, _2627);
    float _2683 = -_2129;
    float _2685 = _2683 + _2675;
    float _2687 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2689 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2687);
    float _2691 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2689);
    float _2693 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2695 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2697 = 1.0 / _2693;
    float _2699 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2695);
    float _2701 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2699);
    float _2703 = _2701 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2705 = _2703 + _2693;
    float _2707 = _2693;
    float _2709 = _2705;
    float _2711 = _2635;
    float _2713 = _2679;
    if (!_2673)
    {
        _2707 = _2681;
    }
    float _2715 = _2707;
    float _2717 = _2705 * _2697;
    float _2719 = _2717 * 0.5;
    float _2721 = _2719;
    float _2723 = _2715;
    if (!_2673)
    {
        _2709 = _2593;
    }
    float _2725 = _2709;
    float _2727 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2727);
    float _2731 = _2725;
    if (!_2673)
    {
        _2721 = _2597;
    }
    float _2733 = _2721;
    float _2735 = 1.0 / _2729;
    bool _2737 = !_2673;
    float _2739 = _2733;
    float _2741 = _2733;
    float _2743 = _2735;
    if (!_2737)
    {
        float _2745 = _224 * _224;
        float _2747 = fma(_220, _220, _2745);
        float _2749 = fma(_226, _226, _2747);
        float _2751 = rsqrt(_2669);
        float _2753 = sqrt(_2749);
        float _2755 = _2623 * _2751;
        float _2757 = _2631 * _2751;
        float _2759 = _2635 * _2751;
        bool _2761 = _2753 > 0.0;
        float _2763 = _2753;
        float _2765 = _2751;
        _2069 = _2757;
        if (!_2761)
        {
            _2763 = _2593;
        }
        float _2767 = _2763;
        _2731 = _2767;
        if (!_2761)
        {
            _2765 = _2681;
        }
        float _2769 = _2765;
        _2723 = _2769;
        if (!_2761)
        {
            _2739 = _2597;
        }
        float _2771 = _2739;
        bool _2773 = !_2761;
        _2741 = _2771;
        if (!_2773)
        {
            float _2775 = rsqrt(_2749);
            float _2777 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2779 = _224 * _2775;
            float _2781 = _220 * _2775;
            float _2783 = _226 * _2775;
            float _2785 = _2757 * _2779;
            float _2787 = fma(_2755, _2781, _2785);
            float _2789 = _2777 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2791 = fma(_2759, _2783, _2787);
            float _2793 = _2791 * _2789;
            float _2795 = fma(_220, _2793, _2593);
            float _2797 = fma(_224, _2793, _2681);
            float _2799 = fma(_226, _2793, _2597);
            _2731 = _2795;
            _2723 = _2797;
            _2741 = _2799;
        }
    }
    float _2801 = _2731;
    float _2803 = _2723;
    float _2805 = _2741;
    float _2807 = _2069;
    float _2809 = -_2131;
    float _2811 = _2809 + _2801;
    float _2813 = -_2129;
    float _2815 = _2813 + _2803;
    float _2817 = -_2177;
    float _2819 = _2817 + _2805;
    float _2821 = _2807;
    float _2823 = _2815;
    float _2825 = _2811;
    float _2827 = _2819;
    if (_2665)
    {
        _2821 = 1.0;
    }
    float _2829 = _2821;
    float _2831 = _2829;
    if (!_2653)
    {
        float _2833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2835 = _2685 + _2833;
        float _2837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2839 = _2643 + _2837;
        float _2841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2843 = -_2639;
        float _2845 = _2843 + _2805;
        float _2847 = _2835 * _2835;
        float _2849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2851 = _2679 + _2849;
        float _2853 = -_2619;
        float _2855 = _2853 + _2801;
        float _2857 = -_2675;
        float _2859 = _2857 + _2803;
        float _2861 = fma(_2839, _2839, _2847);
        float _2863 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2865 = fma(_2851, _2851, _2861);
        float _2867 = sqrt(_2865);
        float _2869 = 1.0 / _2247;
        float _2871 = _2863 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2873 = precise::min(_2867, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2875 = _2873 * _2841;
        float _2877 = _2875 * _2869;
        float _2879 = _2871 * _2877;
        float _2881 = _2845 * _2877;
        float _2883 = fma(_2855, _2879, _2643);
        float _2885 = fma(_2859, _2879, _2685);
        float _2887 = fma(_2871, _2881, _2679);
        _2823 = _2885;
        _2825 = _2883;
        _2827 = _2887;
    }
    float _2889 = _2823;
    float _2891 = _2825;
    float _2893 = _2827;
    if (_2665)
    {
        _2711 = 1.0;
    }
    float _2895 = _2711;
    float _2897 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2899 = _2735 * _2897;
    float _2901 = _2895;
    if (!_2665)
    {
        float _2903 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2905 = _2903 * 0.15915493667125701904296875;
        float _2907 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2909 = _2905 * 6.283185482025146484375;
        float _2911 = cos(_2909);
        float _2913 = _2907 * 0.15915493667125701904296875;
        float _2915 = _2905 * 6.283185482025146484375;
        float _2917 = sin(_2915);
        float _2919 = 1.0 / _2911;
        float _2921 = _2913 * 6.283185482025146484375;
        float _2923 = cos(_2921);
        float _2925 = _2917 * _2919;
        float _2927 = _2913 * 6.283185482025146484375;
        float _2929 = sin(_2927);
        float _2931 = _2923 * _2925;
        float _2933 = 1.0 / _2931;
        float _2935 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2937 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2935;
        float _2939 = 1.0 / _2937;
        float _2941 = _2929 * _2933;
        float _2943 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2945 = fma(_2899, _2941, _2943);
        float _2947 = _2945 * _2939;
        float _2949 = precise::clamp(_2947, 0.0, 1.0);
        _2831 = _2949;
    }
    float _2951 = _2831;
    if (!_2665)
    {
        float _2953 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2955 = _2953 * 0.15915493667125701904296875;
        float _2957 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2959 = _2955 * 6.283185482025146484375;
        float _2961 = cos(_2959);
        float _2963 = _2957 * 0.15915493667125701904296875;
        float _2965 = _2955 * 6.283185482025146484375;
        float _2967 = sin(_2965);
        float _2969 = 1.0 / _2961;
        float _2971 = _2963 * 6.283185482025146484375;
        float _2973 = cos(_2971);
        float _2975 = _2967 * _2969;
        float _2977 = _2963 * 6.283185482025146484375;
        float _2979 = sin(_2977);
        float _2981 = _2973 * _2975;
        float _2983 = 1.0 / _2981;
        float _2985 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2987 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2985;
        float _2989 = 1.0 / _2987;
        float _2991 = _2979 * _2983;
        float _2993 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2995 = fma(_2899, _2991, _2993);
        float _2997 = _2995 * _2989;
        float _2999 = precise::clamp(_2997, 0.0, 1.0);
        float _3001 = -_2999;
        float _3003 = _3001 + 1.0;
        _2901 = _3003;
    }
    float _3005 = _2901;
    float _3007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3009 = _2889 + _3007;
    float _3011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3013 = _2891 + _3011;
    float _3015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3017 = _2893 + _3015;
    float _3019 = _3009 * _3009;
    float _3021 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3023 = fma(_3013, _3013, _3019);
    float _3025 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3021);
    float _3027 = fma(_3017, _3017, _3023);
    float _3029 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3025);
    float _3031 = rsqrt(_3027);
    float _3033 = _3029 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3035 = sqrt(_3027);
    float _3037 = _3031 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3039 = _3013 * _3037;
    float _3041 = _3017 * _3037;
    float _3043 = _3039 * _3039;
    float _3045 = _3041 * _3041;
    float _3047 = _3043 + _3045;
    float _3049 = sqrt(_3047);
    bool _3051 = _3049 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3055 = _3049 + _3053;
    float _3057 = _3031;
    float _3059 = _3047;
    float _3061 = _3055;
    float _3063 = _3009;
    if (_3051)
    {
        float _3065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3057 = _3065;
    }
    float _3067 = _3057;
    if (_3051)
    {
        float _3069 = rsqrt(_3047);
        _3059 = _3069;
    }
    float _3071 = _3059;
    float _3073 = _3071;
    if (_3051)
    {
        float _3075 = _3055 * _3067;
        _3061 = _3075;
    }
    float _3077 = _3061;
    if (_3051)
    {
        float _3079 = _3077 * 0.15915493667125701904296875;
        _2743 = _3079;
    }
    float _3081 = _2743;
    float _3083 = _3067;
    float _3085 = _3081;
    if (_3051)
    {
        float _3087 = _3081 * 6.283185482025146484375;
        float _3089 = sin(_3087);
        _3083 = _3089;
    }
    float _3091 = _3083;
    float _3093 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3095 = precise::max(0.0, _3093);
    float _3097 = _3017;
    float _3099 = _3095;
    if (_3051)
    {
        float _3101 = _3081 * 6.283185482025146484375;
        float _3103 = cos(_3101);
        _3097 = _3103;
    }
    float _3105 = _3097;
    float _3107 = -_3037;
    float _3109 = -_3095;
    float _3111 = fma(_3009, _3107, _3109);
    float _3113 = _3111;
    if (_3051)
    {
        float _3115 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3099 = _3115;
    }
    float _3117 = _3099;
    float _3119 = _3117;
    if (!_3051)
    {
        _3085 = _3039;
    }
    float _3121 = _3085;
    float _3123 = _3091;
    float _3125 = _3121;
    if (_3051)
    {
        float _3127 = fma(_3091, _3117, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3123 = _3127;
    }
    float _3129 = _3123;
    float _3131 = _3129;
    float _3133 = _3105;
    if (_3051)
    {
        float _3135 = _3105 + (-1.0);
        _3063 = _3135;
    }
    float _3137 = _3063;
    float _3139 = _3137;
    if (_3051)
    {
        float _3141 = _3071 * _3129;
        _3119 = _3141;
    }
    float _3143 = _3119;
    if (!_3051)
    {
        _3131 = _3041;
    }
    float _3145 = _3131;
    float _3147 = _3145;
    if (_3051)
    {
        float _3149 = _3137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3139 = _3149;
    }
    float _3151 = _3139;
    if (_3051)
    {
        float _3153 = _3039 * _3143;
        _3125 = _3153;
    }
    float _3155 = _3125;
    if (_3051)
    {
        float _3157 = _3041 * _3143;
        _3147 = _3157;
    }
    float _3159 = _3147;
    if (!_3051)
    {
        _3073 = _3045;
    }
    float _3161 = _3073;
    float _3163 = _3161;
    if (_3051)
    {
        float _3165 = fma(_3111, _3105, _3151);
        _3113 = _3165;
    }
    float _3167 = _3113;
    if (!_3051)
    {
        _3133 = _3043;
    }
    float _3169 = _3133;
    float _3171 = _3169;
    if (_3051)
    {
        float _3173 = _3155 * _3155;
        _3171 = _3173;
    }
    float _3175 = _3171;
    if (_3051)
    {
        float _3177 = _3159 * _3159;
        _3163 = _3177;
    }
    float _3179 = _3163;
    float _3181 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3183 = fma(_3167, _3167, _3175);
    float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3187 = fma(_3035, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3185);
    float _3189 = precise::clamp(_3187, 0.0, 1.0);
    float _3191 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3181);
    float _3193 = _3183 + _3179;
    float _3195 = -_3189;
    float _3197 = _3195 + 1.0;
    float _3199 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3191);
    float _3201 = rsqrt(_3193);
    float _3203 = fma(_2679, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3205 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3207 = _3199 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3209 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3211 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3213 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3205);
    float _3215 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3217 = abs(_3197);
    float _3219 = log2(_3217);
    float _3221 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3223 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3213);
    float _3225 = -_3215;
    float _3227 = fma(_3225, _3209, 1.0);
    float _3229 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3221);
    float _3231 = _3223 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3233 = _3201 * _3155;
    float _3235 = _3201 * _3167;
    float _3237 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3229);
    float _3239 = _3201 * _3159;
    float _3241 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3243 = floor(_3211);
    float _3245 = _3237 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3247 = -_3241;
    float _3249 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3247);
    float _3251 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3253 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3255 = -_3239;
    float _3257 = fma(_3255, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3249);
    float _3259 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3251);
    float _3261 = floor(_3203);
    float _3263 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3259);
    float _3265 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3263);
    float _3267 = log2(_3227);
    float _3269 = -_3243;
    float _3271 = _3211 + _3269;
    float _3273 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3275 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3277 = _3235 + 1.0;
    float _3279 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3273);
    float _3281 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3275);
    float _3283 = exp2(_3253);
    float _3285 = fma(_3257, -0.5, 0.5);
    float _3287 = fma(_3257, 0.5, 0.5);
    float _3289 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3279);
    float _3291 = -_3261;
    float _3293 = _3203 + _3291;
    float _3295 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3281);
    float _3297 = fma(_3287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3299 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3289);
    float _3301 = 1.0 / _3265;
    float _3303 = _3267 * 0.693147182464599609375;
    float _3305 = fma(_3287, _3297, -0.212114393711090087890625);
    float _3307 = _3303 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3309 = fma(_3287, _3305, 1.570728778839111328125);
    float _3311 = sqrt(_3285);
    float _3313 = -_3235;
    float _3315 = fma(_3283, _3277, _3313);
    float _3317 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3295);
    float _3319 = _3299 * _3301;
    float _3321 = _3317 * _3301;
    float _3323 = fma(_3319, 0.5, 0.5);
    float _3325 = fma(_3321, -0.5, 0.5);
    float _3327 = _3311 * 0.636619746685028076171875;
    float2 _8909 = float2(_3271, _3293);
    float _3329 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8909, float2(0.0), isnan(_8909)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8909, float2(0.0), isnan(_8909)), level(0.0)).x;
    float3 _8918 = float3(_3323, _3325, _3307);
    float _3331 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8918, float3(0.0), isnan(_8918)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8918, float3(0.0), isnan(_8918)), level(0.0)).x;
    float _3333 = -_3309;
    float _3335 = fma(_3327, _3333, 1.0);
    float _3337 = fma(_3315, 0.5, 0.5);
    float3 _8936 = float3(_3323, _3325, _3307);
    float4 _3340 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8936, float3(0.0), isnan(_8936)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8936, float3(0.0), isnan(_8936)), level(0.0)).xyzw;
    float _3342 = _3340.x;
    float _3344 = _3340.y;
    float _3346 = _3340.z;
    float _3348 = _3340.w;
    float2 _8952 = float2(_3335, _3337);
    float3 _3352 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8952, float2(0.0), isnan(_8952)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8952, float2(0.0), isnan(_8952)), level(0.0)).xyz;
    float _3354 = _3352.x;
    float _3356 = _3352.y;
    float _3358 = _3352.z;
    float _3360 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3362 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3364 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3366 = _2411 != 0.0;
    bool _3368 = isnan(_2411);
    bool _3370 = _3366 || _3368;
    bool _3372 = isnan(0.0);
    bool _3374 = _3370 || _3372;
    float _3376 = in.m_91.x;
    float _3378 = in.m_91.y;
    float _3380 = in.m_91.z;
    float _3382 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3360);
    float _3384 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3362);
    bool _3386 = _2413 == 0.0;
    bool _3388 = !_3374;
    bool _3390 = _3386 && _3388;
    float _3392 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3394 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3396 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3398 = _2415 == 0.0;
    bool _3400 = _3398 && _3390;
    float _3402 = -_2421;
    float _3404 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3392);
    float _3406 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3364);
    float _3408 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3410 = -_2421;
    float _3412 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3394);
    float _3414 = -_2421;
    float _3416 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3396);
    float _3418 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3382);
    float _3420 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3384);
    float _3422 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3406);
    float _3424 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3408);
    float _3426 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3428 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3412);
    float _3430 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3404);
    float _3432 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3434 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3416);
    float _3436 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3426);
    float _3438 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3424);
    float _3440 = _3376;
    float _3442 = _3378;
    float _3444 = _3380;
    float _3446 = _3299;
    if (!_3400)
    {
        float _3448 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3376);
        _3440 = _3448;
    }
    float _3450 = _3440;
    if (!_3400)
    {
        float _3452 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3378);
        _3442 = _3452;
    }
    float _3454 = _3442;
    float _3456 = abs(_2899);
    float _3458 = log2(_3456);
    float _3460 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3432);
    float _3462 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3436);
    float _3464 = _3428 * _3454;
    float _3466 = _3430 * _3454;
    float _3468 = _3434 * _3454;
    if (!_3400)
    {
        float _3470 = fma(_2415, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3380);
        _3444 = _3470;
    }
    float _3472 = _3444;
    float _3474 = fma(_3418, _3450, _3464);
    float _3476 = fma(_3420, _3450, _3466);
    float _3478 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3460);
    float _3480 = fma(_3422, _3450, _3468);
    float _3482 = fma(_3438, _3472, _3474);
    float _3484 = fma(_3462, _3472, _3476);
    float _3486 = fma(_3478, _3472, _3480);
    float _3488 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3490 = _3458 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3492 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3494 = in.m_75.x;
    float _3496 = exp2(_3488);
    float _3498 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3492);
    out.m_93.x = _2643;
    out.m_93.y = _2685;
    out.m_93.z = _2679;
    bool _3500 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3502 = isnan(_3035);
    bool _3504 = _3500 || _3502;
    bool _3506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3508 = _3504 || _3506;
    float _3510 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3498);
    out.m_95.x = _3482;
    out.m_95.y = _3484;
    out.m_95.z = _3486;
    float _3512 = exp2(_3490);
    float _3514 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3510);
    out.m_97.x = _2891;
    out.m_97.y = _2889;
    out.m_97.z = _2893;
    out.gl_Position.x = _3299;
    out.gl_Position.y = _3317;
    out.gl_Position.z = _3514;
    out.gl_Position.w = _3265;
    float _3516 = -_3496;
    float _3518 = _3516 + 1.0;
    if (!_3508)
    {
        _2713 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3520 = _2713;
    float _3522 = fma(_3512, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3524 = precise::clamp(_3522, 0.0, 1.0);
    bool _3526 = _2899 <= 8000.0;
    bool _3528 = isnan(_2899);
    bool _3530 = _3526 || _3528;
    bool _3532 = isnan(8000.0);
    bool _3534 = _3530 || _3532;
    float _3536 = float(_3534);
    float _3538 = _3265 * 0.5;
    float _3540 = fma(_3524, -2.0, 3.0);
    float _3542 = _3524 * _3524;
    float _3544 = fma(_3317, -0.5, _3538);
    float _3546 = _3518 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3548 = _3514 + _3265;
    float _3550 = _3542 * _3540;
    float _3552 = _3548 * 0.5;
    float _3554 = -_3550;
    float _3556 = _3554 + 1.0;
    float _3558 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3550);
    float _3560 = _3299 + _3265;
    float _3562 = _3550;
    float _3564 = _3520;
    float _3566 = _3520;
    if (!_3508)
    {
        _3562 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3568 = _3562;
    float _3570 = _3536 * _3558;
    float _3572 = _3560 * 0.5;
    float _3574 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3576 = _3568;
    float _3578 = _3568;
    if (!_3508)
    {
        _3446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3580 = _3446;
    out.m_99.x = _3572;
    out.m_99.y = _3544;
    out.m_99.z = _3552;
    out.m_99.w = _3265;
    float _3582 = -_3329;
    float _3584 = _3582 + 1.0;
    float _3586 = _3546 * _3331;
    float _3588 = -_3546;
    float _3590 = _3588 + 1.0;
    float _3592 = _3584 * _3574;
    float _3594 = precise::clamp(_3592, 0.0, 1.0);
    float _3596 = _3348 * _3586;
    float _3598 = _3348 * _3590;
    float _3600 = -_3594;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3604 = _3358 * _3586;
    float _3606 = fma(_3354, _3596, _3342);
    float _3608 = fma(_3356, _3596, _3344);
    float _3610 = _3602 * _3494;
    float _3612 = fma(_3348, _3604, _3346);
    float _3614 = _2951 * _3005;
    float _3616 = _3610 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3618 = _3610;
    float _3620 = _3614;
    float _3622 = _3616;
    float _3624 = _3580;
    float _3626 = _3580;
    if (!_3508)
    {
        _3618 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3628 = _3618;
    out.m_101.x = _3606;
    out.m_101.y = _3608;
    out.m_101.z = _3612;
    out.m_101.w = _3598;
    float _3630 = _3614 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3632 = _3628;
    float _3634 = _3628;
    if (!_3508)
    {
        _3620 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3636 = _3620;
    out.m_103.x = _3616;
    float _3638 = _3636;
    float _3640 = _3636;
    if (!_3508)
    {
        _3622 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3642 = _3622;
    bool _3644 = !_3508;
    float _3646 = _3642;
    float _3648 = _3642;
    if (!_3644)
    {
        bool _3650 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3652 = isnan(_3035);
        bool _3654 = _3650 || _3652;
        bool _3656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3658 = _3654 || _3656;
        if (!_3658)
        {
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3662 = _3035 + _3660;
            float _3664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3666 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3664;
            float _3668 = 1.0 / _3666;
            float _3670 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3672 = _3670 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3674 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3676 = _3674 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3678 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3680 = _3678 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3684 = _3682 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3686 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3688 = _3686 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3690 = _3662 * _3668;
            float _3692 = precise::clamp(_3690, 0.0, 1.0);
            float _3694 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3696 = _3694 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3698 = fma(_3692, _3672, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3700 = fma(_3692, _3696, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3702 = fma(_3692, _3676, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3704 = fma(_3692, _3680, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3706 = fma(_3692, _3684, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3708 = fma(_3692, _3688, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3626 = _3700;
            _3648 = _3706;
            _3578 = _3698;
            _3566 = _3704;
            _3634 = _3702;
            _3640 = _3708;
            _3710 = true;
        }
        else
        {
            bool _3712 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3714 = isnan(_3035);
            bool _3716 = _3712 || _3714;
            bool _3718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3720 = _3716 || _3718;
            if (!_3720)
            {
                _3576 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3722 = _3576;
            _3578 = _3722;
            if (!_3720)
            {
                _3624 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3724 = _3624;
            _3626 = _3724;
            if (!_3720)
            {
                _3632 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3726 = _3632;
            _3634 = _3726;
            if (!_3720)
            {
                _3564 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3728 = _3564;
            _3566 = _3728;
            if (!_3720)
            {
                _3646 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3730 = _3646;
            _3648 = _3730;
            if (!_3720)
            {
                _3638 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3732 = _3638;
            bool _3734 = !_3720;
            _3640 = _3732;
            if (!_3734)
            {
                bool _3736 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3738 = isnan(_3035);
                bool _3740 = _3736 || _3738;
                bool _3742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3744 = _3740 || _3742;
                if (!_3744)
                {
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3748 = _3035 + _3746;
                    float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3752 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3750;
                    float _3754 = 1.0 / _3752;
                    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3758 = _3756 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3762 = _3760 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3764 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3766 = _3764 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3768 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3770 = _3768 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3772 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3776 = _3748 * _3754;
                    float _3778 = precise::clamp(_3776, 0.0, 1.0);
                    float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3784 = fma(_3778, _3758, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3786 = fma(_3778, _3782, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3788 = fma(_3778, _3762, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3790 = fma(_3778, _3766, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3792 = fma(_3778, _3770, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3794 = fma(_3778, _3774, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3626 = _3786;
                    _3648 = _3792;
                    _3578 = _3784;
                    _3566 = _3790;
                    _3634 = _3788;
                    _3640 = _3794;
                    _3710 = true;
                }
                else
                {
                    _3626 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3648 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3578 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3566 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3634 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3640 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3710 = false;
    float _3796 = _3626;
    float _3798 = _3648;
    float _3800 = _3578;
    float _3802 = _3566;
    float _3804 = _3634;
    float _3806 = _3640;
    float _3808 = fma(_3484, -0.5, 0.5);
    float _3810 = precise::clamp(_3808, 0.0, 1.0);
    float _3812 = -_3796;
    float _3814 = _3812 + _3798;
    float _3816 = _3630 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3818 = -_3800;
    float _3820 = _3818 + _3802;
    float _3822 = fma(_3810, _3814, _3796);
    out.m_105.x = 0.0;
    float _3824 = -_3804;
    float _3826 = _3824 + _3806;
    float _3828 = fma(_3810, _3820, _3800);
    float _3830 = _3822 * 0.586610972881317138671875;
    out.m_51.x = _3816;
    bool _3832 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3834 = fma(_3810, _3826, _3804);
    float _3836 = fma(_3828, 0.298911988735198974609375, _3830);
    bool _3838 = _2951 > 0.0;
    bool _3840 = isnan(_2951);
    bool _3842 = _3838 || _3840;
    bool _3844 = isnan(0.0);
    bool _3846 = _3842 || _3844;
    float _3848 = fma(_3834, 0.114477999508380889892578125, _3836);
    bool _3850 = _3005 <= 0.0;
    bool _3852 = !_3846;
    bool _3854 = _3850 || _3852;
    float _3856 = -_3848;
    float _3858 = _3828 + _3856;
    float _3860 = -_3848;
    float _3862 = _3822 + _3860;
    float _3864 = -_3848;
    float _3866 = _3834 + _3864;
    float _3868 = fma(_3858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3848);
    float _3870 = fma(_3862, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3848);
    float _3872 = fma(_3866, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3848);
    bool _3874 = !_3832;
    if (!_3874)
    {
        float _3876 = -_2889;
        float _3878 = _3876 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3880 = -_2891;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3884 = -_2893;
        float _3886 = _3884 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3888 = _3878 * _3878;
        float _3890 = fma(_3882, _3882, _3888);
        float _3892 = fma(_3886, _3886, _3890);
        float _3894 = sqrt(_3892);
        float _3896 = rsqrt(_3892);
        float _3898 = -_3894;
        float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3902 = _3900 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3904 = precise::clamp(_3902, 0.0, 1.0);
        float _3906 = _3882 * _3896;
        float _3908 = _3878 * _3896;
        float _3910 = abs(_3904);
        float _3912 = log2(_3910);
        float _3914 = _3886 * _3896;
        float _3916 = _3906 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3918 = _3484 * _3908;
        float _3920 = -_3908;
        float _3922 = -_3916;
        float _3924 = fma(_3920, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3922);
        float _3926 = fma(_3482, _3906, _3918);
        float _3928 = -_3914;
        float _3930 = fma(_3928, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3924);
        float _3932 = fma(_3486, _3914, _3926);
        float _3934 = precise::clamp(_3932, 0.0, 1.0);
        float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3938 = _3930 + _3936;
        float _3940 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3942 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3944 = precise::clamp(_3942, 0.0, 1.0);
        float _3946 = exp2(_3940);
        float _3948 = _3946 * _3944;
        float _3950 = _3934 * _3948;
        float _3952 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3956 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _3952;
        out.m_105.y = _3954;
        out.m_105.z = _3956;
    }
    out.m_77.x = _3868;
    out.m_77.y = _3870;
    out.m_77.z = _3872;
    if (!_3854)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3958 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3958;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3710 = false;
    bool _732 = false;
    bool _628 = false;
    bool _486 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_48.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_51.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4015 = as_type<float>(_140);
        out.gl_Position.z = _4015;
    }
    if (!_128)
    {
        return out;
    }
    float _144 = in.m_53.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_51.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4085 = as_type<float>(_178);
        out.gl_Position.z = _4085;
    }
    if (_170)
    {
        return out;
    }
    float _180 = in.m_55.x;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_55.y;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    float _192 = in.m_59.x;
    float _194 = in.m_59.y;
    float _196 = in.m_59.z;
    float _198 = in.m_61.x;
    float _200 = in.m_61.y;
    float _202 = in.m_61.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    out.m_65.x = _180;
    out.m_65.y = _184;
    float _210 = _188 * _194;
    float _212 = _188 * _200;
    float _214 = fma(_186, _192, _210);
    float _216 = _188 * _206;
    float _218 = fma(_186, _198, _212);
    float _220 = fma(_190, _196, _214);
    float _222 = fma(_186, _204, _216);
    float _224 = fma(_190, _202, _218);
    float _226 = fma(_190, _208, _222);
    bool _228 = !_182;
    float _230 = _184;
    float _232 = _180;
    float _250;
    if (!_228)
    {
        float _234 = in.m_67.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_124);
        float _256 = 1.0 / _254;
        float _258 = _158 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _260 + _282;
    float _286 = 1.0 / _272;
    bool _288 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _290 = isnan(_260);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _302 = isnan(_260);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    bool _312 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_260);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _326 = 1.0 / _276;
    float _328 = 1.0 / _280;
    float _330 = _264 * _286;
    bool _332 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _334 = isnan(_260);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _348 = -_342;
    float _350 = _348 + 1.0;
    float _352 = _268 * _326;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = -_310;
    float _364 = _362 + 1.0;
    float _366 = fma(_360, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = _284 * _328;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _374;
    float _378 = fma(_356, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = _322 * _364;
    float _386 = fma(_376, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = _298 * _350;
    float _390 = -_298;
    float _392 = _390 + 1.0;
    float _394 = fma(_370, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _396 = _378 * _384;
    float _398 = _310 * _392;
    float _400 = fma(_346, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _402 = fma(_382, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _404 = in.m_69.x;
    float _406 = in.m_69.y;
    float _408 = in.m_69.z;
    float _410 = _366 * _384;
    float _412 = -_322;
    float _414 = _412 + 1.0;
    float _416 = _386 * _384;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _422;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _436 = fma(_424, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_420, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _440 = fma(_432, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = fma(_400, _398, _426);
    float _444 = fma(_402, _398, _428);
    float _446 = fma(_394, _398, _434);
    float _448 = fma(_436, _388, _442);
    float _450 = fma(_438, _388, _444);
    float _452 = fma(_440, _388, _446);
    float _454 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].x, _448);
    float _456 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].y, _450);
    float _458 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].z, _452);
    float _460 = _454 * _404;
    float _462 = _456 * _406;
    float _464 = _458 * _408;
    bool _466 = !_324;
    float _484;
    if (!_466)
    {
        float _468 = in.m_67.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_124);
        float _490 = 1.0 / _488;
        float _492 = _158 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _494 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _504 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = isnan(_494);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _522 = isnan(_494);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    bool _536 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _538 = isnan(_494);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = 1.0 / _502;
    float _550 = -_514;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _556 = 1.0 / _518;
    float _558 = _534 * _548;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _564 = -_546;
    float _566 = _564 + 1.0;
    float _568 = fma(_558, _498, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _570 = _530 * _552;
    float _572 = -_530;
    float _574 = _572 + 1.0;
    float _576 = _514 * _566;
    float _578 = _562 * _556;
    float _580 = _568 * _570;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _584 = _494 + _582;
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[115].x, _580);
    float _588 = fma(_578, _584, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _592 = fma(_588, _576, _586);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _600 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[117].x, _592);
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _596;
    out.m_71.y = _602;
    out.m_71.z = _604;
    out.m_71.w = _606;
    bool _608 = !_554;
    float _626;
    if (!_608)
    {
        float _610 = in.m_67.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_124);
        float _632 = 1.0 / _630;
        float _634 = _158 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    bool _638 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _654 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _656 = isnan(_636);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _672 = _636 + _670;
    float _674 = -_648;
    float _676 = _674 + 1.0;
    float _678 = 1.0 / _652;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _682 = _664 * _676;
    float _684 = -_664;
    float _686 = _684 + 1.0;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _690 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _668 * _678;
    float _694 = fma(_692, _672, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _696 = _694 * _682;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[131].x, _696);
    float _704 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[132].x, _702);
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _704 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _706;
    out.m_73.y = _708;
    out.m_73.z = _690;
    out.m_73.w = _710;
    bool _712 = !_680;
    float _730;
    if (!_712)
    {
        float _714 = in.m_67.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_124);
        float _736 = 1.0 / _734;
        float _738 = _158 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _744 = int(_742);
    float _746 = float(_124);
    float _748 = in.m_59.w;
    float _750 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _752 = in.m_63.w;
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _756 = int(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _766 = 1.0 / _746;
    float _768 = float(_744);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _782 = 1.0 / _768;
    float _784 = float(uint(_756));
    int _786 = ~_756;
    int _788 = _786 + 1;
    int _790 = ~_756;
    int _792 = _790 + 1;
    int _794 = ~_756;
    int _796 = _794 + 1;
    float _798 = 1.0 / _784;
    float _800 = _782 * _158;
    float _802 = 1.0 / _760;
    int _804 = as_type<int>(_798) + (-2);
    float _806 = trunc(_800);
    int _808 = int(_806);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _812 = _810 != 0;
    float _814 = 1.0 / _780;
    bool _816 = !_812;
    float _818 = _816 ? 7.345489978790283203125 : 1.0;
    float _820 = float(uint(_808));
    float _822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _824 = as_type<float>(_804) * _820;
    float _826 = trunc(_824);
    float _828 = precise::max(_826, 0.0);
    uint _831 = uint(_828);
    float _833 = _822 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _835 = float(_756);
    int _837 = _788 * int(_831);
    int _839 = _837 + _808;
    float _841 = float(uint(_839));
    float _843 = in.m_67.x;
    float _845 = as_type<float>(_804) * _841;
    float _847 = trunc(_845);
    float _849 = precise::max(_847, 0.0);
    uint _851 = uint(_849);
    float _853 = _818 * _843;
    int _855 = int(_831) + int(_851);
    float _857 = float(_808);
    float _859 = 0.0;
    if (_812)
    {
        _859 = _843;
    }
    float _861 = _859;
    int _863 = _792 * _855;
    int _865 = _863 + _808;
    bool _867 = _857 >= _835;
    bool _869 = isnan(_857);
    bool _871 = _867 || _869;
    bool _873 = isnan(_835);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = floor(_853);
    bool _881 = uint(_865) >= uint(_756);
    bool _883 = !_881;
    int _885 = _883 ? 0 : (-1);
    float _887 = trunc(_877);
    int _889 = int(_887);
    bool _891 = _756 == 0;
    int _893 = ~_855;
    int _895 = _893 + _885;
    int _897 = _895 + 1;
    int _899 = _756 * _897;
    int _901 = _899 + _808;
    float _903 = -_879;
    float _905 = _853 + _903;
    int _907 = _756 + (-1);
    float _909 = _905 * _835;
    bool _911 = !_891;
    int _913 = _911 ? _901 : (-1);
    float _915 = _835 * _158;
    int _917 = ~_889;
    int _919 = _917 + 1;
    int _921 = _919 + 1;
    float _923 = trunc(_909);
    int _925 = int(_923);
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _933 = _931 != 0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _937 = _935 != 0;
    float _939 = _915 * _766;
    int _941 = _913 * _921;
    bool _943 = !_933;
    int _945 = _943 ? 0 : 1;
    float _947 = trunc(_939);
    int _949 = int(_947);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _953 = _951 != 0;
    int _955 = _889 * _907;
    int _957 = _955 + _941;
    bool _959 = !_929;
    int _961 = _959 ? 0 : 1;
    bool _963 = !_953;
    int _965 = _963 ? 0 : 1;
    int _967 = abs(_945);
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _971 = _969 != 0;
    bool _973 = !_937;
    int _975 = _973 ? 0 : 1;
    int _977 = _957 * _967;
    int _979 = abs(_961);
    int _981 = abs(_965);
    bool _983 = !_971;
    int _985 = _983 ? 0 : 1;
    int _987 = abs(_975);
    int _989 = _925 * _981;
    int _991 = _989 + _808;
    int _993 = abs(_985);
    int _995 = _949 * _979;
    int _997 = _995 + _977;
    float _999 = in.m_48.x;
    float _1001 = in.m_48.y;
    int _1003 = _991 * _987;
    int _1005 = _1003 + _997;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1009 = _1007 != 0;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1013 = _1011 != 0;
    int _1015 = _925 * _993;
    int _1017 = _1015 + _1005;
    int _1019 = ~_756;
    int _1021 = _1019 + 1;
    float _1023 = in.m_75.y;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1027 = _1025 != 0;
    float _1029 = float(uint(_1017));
    float _1031 = as_type<float>(_804) * _1029;
    int _1033 = _997;
    bool _1035 = _971;
    float _1037 = _861;
    if (_1009)
    {
        float _1039 = -_180;
        float _1041 = _1039 + 1.0;
        _1033 = as_type<int>(_1041);
    }
    int _1043 = _1033;
    if (_1009)
    {
        bool _1045 = _843 > 0.5;
        _1035 = _1045;
    }
    bool _1047 = _1035;
    float _1049 = trunc(_1031);
    float _1051 = precise::max(_1049, 0.0);
    uint _1053 = uint(_1051);
    float _1055 = 0.0;
    if (!_1027)
    {
        _1055 = _180;
    }
    float _1057 = _1055;
    float _1059 = _206 * _1001;
    float _1061 = _200 * _1001;
    float _1063 = _843 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1065 = in.m_67.y;
    float _1067 = fma(_198, _999, _1061);
    float _1069 = -_762;
    float _1071 = fma(_1063, 2.0, _1069);
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1075 = _1073 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1077 = _1021 * int(_1053);
    int _1079 = _1077 + _1017;
    float _1081 = 1.0 / _1075;
    float _1083 = float(uint(_1079));
    float _1085 = as_type<float>(_1079);
    float _1087 = _1057;
    if (!_1009)
    {
        _1085 = _180;
    }
    float _1089 = _1085;
    float _1091 = _1089;
    if (_1009)
    {
        float _1093 = _1047 ? as_type<float>(_1043) : _180;
        _1091 = _1093;
    }
    float _1095 = _1091;
    float _1097 = as_type<float>(_804) * _1083;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1101 = _1099 != 0;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1103;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1109 = _1107 != 0;
    float _1111 = _194 * _1001;
    float _1113 = trunc(_1097);
    float _1115 = precise::max(_1113, 0.0);
    uint _1117 = uint(_1115);
    float _1119 = _1001 + _1023;
    float _1121 = fma(_192, _999, _1111);
    float _1123 = fma(_204, _999, _1059);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1129 = float(uint(_991));
    float _1131 = _1105 * _802;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1137 = 1.0 / _1127;
    float _1139 = -_184;
    float _1141 = _1139 + 1.0;
    float _1143 = as_type<float>(_804) * _1129;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1149 = !_1101;
    int _1151 = _1149 ? 0 : 1;
    float _1153 = _1147 * _1081;
    int _1155 = int(_1053) + int(_1117);
    float _1157 = 1.0 / _1135;
    float _1159 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1161 = _796 * _1155;
    int _1163 = _1161 + _1017;
    float _1165 = fma(_1159, -2.0, _764);
    float _1167 = _776 * _1137;
    float _1169 = trunc(_1143);
    float _1171 = precise::max(_1169, 0.0);
    uint _1173 = uint(_1171);
    float _1175 = in.m_67.z;
    bool _1177 = uint(_1163) >= uint(_756);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1187 = in.m_48.z;
    bool _1189 = !_1177;
    int _1191 = _1189 ? 0 : (-1);
    bool _1193 = _1065 > 0.5;
    float _1195 = _772 * _1157;
    int _1197 = ~_1155;
    int _1199 = _1197 + _1191;
    int _1201 = _1199 + 1;
    float _1203 = 1.0 / _1181;
    int _1205 = _1193 ? as_type<int>(_1141) : as_type<int>(_184);
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1207;
    int _1211 = _756 * _1201;
    int _1213 = _1211 + _1017;
    int _1215 = ~_756;
    int _1217 = _1215 + 1;
    float _1219 = _1209 * _814;
    float _1221 = _1013 ? as_type<float>(_1205) : _184;
    float _1223 = 1.0 / _1185;
    bool _1225 = !_891;
    int _1227 = _1225 ? _1213 : (-1);
    int _1229 = _1217 * int(_1173);
    int _1231 = _1229 + _991;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1237 = ~_756;
    int _1239 = _1237 + 1;
    bool _1241 = _1175 > 0.5;
    int _1243 = _1227 & 3;
    bool _1245 = _1243 != 0;
    float _1247 = _1235 * _1203;
    if (_1109)
    {
        float _1249 = _1241 ? _1141 : _184;
        _230 = _1249;
    }
    float _1251 = _230;
    float _1253 = fma(_202, _1187, _1067);
    bool _1255 = uint(_1243) > 1u;
    float _1257 = _843 * 2.0;
    float _1259 = float(uint(_1231));
    float _1261 = fma(_833, _1251, -0.5);
    int _1263 = _1227 & 3;
    bool _1265 = _1263 != 0;
    float _1267 = as_type<float>(_804) * _1259;
    int _1269 = _1265 ? 0 : 1;
    float _1271 = floor(_1257);
    bool _1273 = uint(_1243) >= 2u;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1275;
    int _1279 = ~_1269;
    int _1281 = _1279 + 1;
    int _1283 = _1281 + 1;
    float _1285 = _1065 * 2.0;
    int _1287 = _1283;
    float _1289 = _1285;
    if (!_1255)
    {
        int _1291 = ~_1269;
        int _1293 = _1291 + 1;
        _1287 = _1293;
    }
    int _1295 = _1287;
    float _1297 = _1277 * _1223;
    int _1299 = _1273 ? 0 : 1;
    float _1301 = trunc(_1267);
    float _1303 = precise::max(_1301, 0.0);
    uint _1305 = uint(_1303);
    bool _1307 = _1065 > 0.5;
    bool _1309 = _1307 && _1027;
    float _1311 = fma(_196, _1187, _1121);
    bool _1313 = _1243 != 3;
    float _1315 = fma(_208, _1187, _1123);
    float _1317 = _1065 + _1175;
    if (!_812)
    {
        _1037 = _1175;
    }
    float _1319 = _1037;
    float _1321 = _843 + _1065;
    float _1323 = floor(_1285);
    int _1325 = ~_1299;
    int _1327 = _1325 + 1;
    int _1329 = _1327 + 1;
    float _1331 = _1317 + (-1.0);
    bool _1333 = !_1245;
    int _1335 = _1333 ? 0 : 1;
    float _1337 = _1321 + (-1.0);
    int _1339 = _1329;
    if (_1309)
    {
        float _1341 = -_180;
        float _1343 = _1341 + 1.0;
        _232 = _1343;
    }
    float _1345 = _232;
    bool _1347 = _1271 >= 0.0;
    bool _1349 = isnan(_1271);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = _1315 + _752;
    int _1359 = int(_1173) + int(_1305);
    float _1361 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_1027)
    {
        _1087 = _1345;
    }
    float _1363 = _1087;
    if (_1313)
    {
        int _1365 = ~_1299;
        int _1367 = _1365 + 1;
        _1339 = _1367;
    }
    int _1369 = _1339;
    int _1371 = _1239 * _1359;
    int _1373 = _1371 + _991;
    bool _1375 = _1271 > 0.0;
    float _1377 = _1175 * 2.0;
    bool _1379 = uint(_1373) >= uint(_756);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1383 = _740 + _1381;
    if (_812)
    {
        _1289 = _1065;
    }
    float _1385 = _1289;
    float _1387 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1389 = _1243 != 3;
    float _1391 = floor(_1377);
    float _1393 = _1385;
    if (!_812)
    {
        _1393 = _843;
    }
    float _1395 = _1393;
    float _1397 = fma(_1131, _1383, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1399 = !_1379;
    int _1401 = _1399 ? 0 : (-1);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1405 = _740 + _1403;
    bool _1407 = _1323 > 0.0;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1411 = _740 + _1409;
    bool _1413 = _1323 >= 0.0;
    bool _1415 = isnan(_1323);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(0.0);
    bool _1421 = _1417 || _1419;
    float _1423 = fma(_1167, _1405, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1425 = _1355 ? 0 : 1;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1429 = _740 + _1427;
    bool _1431 = !_1389;
    int _1433 = _1431 ? 0 : (-1);
    float _1435 = fma(_1247, _1411, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1439 = _1437 != 0;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1443 = _1441 != 0;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1447 = _1445 != 0;
    float _1449 = fma(_1195, _1429, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1451 = _1227 >> 31;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1455 = _740 + _1453;
    int _1457 = ~_1425;
    int _1459 = _1457 + 1;
    int _1461 = _1459 + 1;
    int _1463 = _1461;
    if (!_1375)
    {
        int _1465 = ~_1425;
        int _1467 = _1465 + 1;
        _1463 = _1467;
    }
    int _1469 = _1463;
    float _1471 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1473 = _740 + _1471;
    bool _1475 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1477 = isnan(_740);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = fma(_1219, _1455, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1489 = _1451 & 3;
    float _1491 = fma(_1153, _1473, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1493 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1495 = isnan(_740);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = -_1485;
    float _1507 = _1505 + 1.0;
    int _1509 = _1227 + _1489;
    bool _1511 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1513 = isnan(_740);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = in.m_61.w;
    int _1525 = _1509 >> 2;
    float _1527 = _1503 * _1507;
    int _1529 = _1421 ? 0 : 1;
    float _1531 = -_1503;
    float _1533 = _1531 + 1.0;
    bool _1535 = _1391 > 0.0;
    bool _1537 = _1391 >= 0.0;
    bool _1539 = isnan(_1391);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(0.0);
    bool _1545 = _1541 || _1543;
    float _1547 = -_1521;
    float _1549 = _1547 + 1.0;
    bool _1551 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1553 = isnan(_740);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1559 = _1555 || _1557;
    float _1561 = float(_1559);
    int _1563 = _1525 << 4;
    int _1565 = _1563 + 368;
    float _1567 = _1485 * _1549;
    bool _1569 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1571 = isnan(_740);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1577 = _1573 || _1575;
    float _1579 = float(_1577);
    float _1581 = _1561 * _1533;
    float _1583 = -_1561;
    float _1585 = _1583 + 1.0;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1589 = _740 + _1587;
    uint _1591 = uint(int(uint(_1565) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[int(_1601)][_1603];
    bool _1607 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1609 = isnan(_740);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    float _1619 = -_1579;
    float _1621 = _1619 + 1.0;
    float _1623 = fma(_1297, _1589, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1625 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1627 = isnan(_740);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1633 = _1629 || _1631;
    float _1635 = float(_1633);
    float _1637 = _1579 * _1585;
    float _1639 = _1617 * _1621;
    float _1641 = -_1617;
    float _1643 = _1641 + 1.0;
    float _1645 = _1311 + _748;
    bool _1647 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1649 = isnan(_740);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1655 = _1651 || _1653;
    float _1657 = float(_1655);
    float _1659 = -_1635;
    float _1661 = _1659 + 1.0;
    float _1663 = _1635 * _1643;
    float _1665 = _1253 + _1523;
    float _1667 = _1657 * _1661;
    float _1669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1671 = _1565 + 8;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[int(_1683)][_1685];
    float _1689 = -_1657;
    float _1691 = _1689 + 1.0;
    float _1693 = _1397 * _1667;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1697 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1693);
    int _1701 = abs(_1295);
    float _1703 = -_1695;
    float _1705 = fma(_1697, 2.0, _1703);
    float _1707 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1709 = ~_1359;
    int _1711 = _1709 + _1401;
    int _1713 = _1711 + 1;
    float _1715 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1717 = int(_1715);
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1721 = abs(_1369);
    float _1723 = fma(_1491, _1663, _1699);
    float _1725 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1727 = ~_1529;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    float _1733 = fma(_1707, -2.0, _1719);
    int _1735 = _1731;
    if (!_1407)
    {
        int _1737 = ~_1529;
        int _1739 = _1737 + 1;
        _1735 = _1739;
    }
    int _1741 = _1735;
    float _1743 = fma(_1725, _1363, -0.5);
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1747 = _1645 + _1745;
    int _1749 = abs(_1335);
    int _1751 = _756 * _1713;
    int _1753 = _1751 + _991;
    int _1755 = ~_1701;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1763 = _1665 + _1761;
    float _1765 = _1747 * _1747;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1769 = _1357 + _1767;
    float _1771 = float(uint(_1717));
    float _1773 = -_158;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1705);
    int _1777 = ~_1749;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    float _1783 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1733);
    int _1785 = _1759 * as_type<int>(_1605);
    float _1787 = fma(_1763, _1763, _1765);
    int _1789 = abs(_1433);
    float _1791 = 1.0 / _1771;
    int _1793 = _1781 * as_type<int>(_1597);
    int _1795 = _1793 + _1785;
    float _1797 = fma(_1769, _1769, _1787);
    float _1799 = fma(_1449, _1639, _1723);
    int _1801 = abs(_1151);
    int _1803 = ~_1721;
    int _1805 = _1803 + 1;
    int _1807 = _1805 + 1;
    float _1809 = sqrt(_1797);
    int _1811 = abs(_1717);
    int _1813 = ~_1789;
    int _1815 = _1813 + 1;
    int _1817 = _1815 + 1;
    int _1819 = _1807 * as_type<int>(_1679);
    int _1821 = _1819 + _1795;
    float _1823 = float(uint(_1811));
    float _1825 = rsqrt(_1797);
    int _1827 = ~_1801;
    int _1829 = _1827 + 1;
    int _1831 = _1829 + 1;
    int _1833 = _1817 * as_type<int>(_1687);
    int _1835 = _1833 + _1821;
    int _1837 = _1545 ? 0 : 1;
    int _1839 = _1835 * _1831;
    bool _1841 = !_891;
    int _1843 = _1841 ? _1753 : (-1);
    float _1845 = 1.0 / _1823;
    float _1847 = _1809 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1851 = ~_1837;
    int _1853 = _1851 + 1;
    int _1855 = _1853 + 1;
    int _1857 = _1843 * _1801;
    int _1859 = _1857 + _1839;
    int _1861 = _1855;
    float _1863 = as_type<float>(_1811);
    if (!_1535)
    {
        int _1865 = ~_1837;
        int _1867 = _1865 + 1;
        _1861 = _1867;
    }
    int _1869 = _1861;
    float _1871 = _750 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1875 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1877 = log2(_1875);
    int _1879 = as_type<int>(_1791) + (-2);
    float _1881 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1849);
    float _1883 = precise::min(_1871, _1847);
    float _1885 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1873);
    float _1887 = float(uint(_1859));
    float _1889 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1881);
    int _1891 = abs(_1859);
    out.m_77.w = _1883;
    int _1893 = as_type<int>(_1845) + (-2);
    float _1895 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1885);
    float _1897 = float(uint(_1891));
    float _1899 = as_type<float>(_1879) * _1887;
    int _1901 = ~_1717;
    int _1903 = _1901 + 1;
    float _1905 = fma(_1895, _1743, _1775);
    float _1907 = trunc(_1899);
    float _1909 = precise::max(_1907, 0.0);
    uint _1911 = uint(_1909);
    float _1913 = as_type<float>(_1893) * _1897;
    float _1915 = -_1783;
    float _1917 = fma(_1889, _1261, _1915);
    float _1919 = _1825 * _1883;
    float _1921 = _1877 * _158;
    bool _1923 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1925 = isnan(1.0);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1931 = _1927 || _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1935 = 1.0 + _1933;
    float _1937 = _1763 * _1919;
    float _1939 = trunc(_1913);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    float _1945 = _1747 * _1919;
    int _1947 = ~_1811;
    int _1949 = _1947 + 1;
    float _1951 = -_1937;
    float _1953 = _1763 + _1951;
    bool _1955 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1963 = _1959 || _1961;
    float _1965 = -_1945;
    float _1967 = _1747 + _1965;
    float _1969 = _1917 + 0.5;
    float _1971 = _1953 * _1953;
    float _1973 = _1769 * _1919;
    float _1975 = exp2(_1921);
    int _1977 = _1903 * int(_1911);
    int _1979 = _1977 + _1859;
    float _1981 = fma(_1967, _1967, _1971);
    float _1983 = -_1973;
    float _1985 = _1769 + _1983;
    float _1987 = float(uint(_1979));
    int _1989 = _1949 * int(_1943);
    int _1991 = _1989 + _1891;
    float _1993 = fma(_1985, _1985, _1981);
    float _1995 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1997 = _1119 + _1995;
    float _1999 = as_type<float>(_1879) * _1987;
    float _2001 = float(uint(_1991));
    float _2003 = sqrt(_1993);
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2009 = -_1975;
    float _2011 = _2009 + 1.0;
    float _2013 = as_type<float>(_1893) * _2001;
    float _2015 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2005);
    float _2017 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2007);
    float _2019 = -_158;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1071);
    float _2023 = 1.0 / _1935;
    float _2025 = fma(_1997, _1997, _1765);
    float _2027 = _1963 ? _2011 : 0.0;
    float _2029 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2015);
    float _2031 = float(_1469);
    float _2033 = fma(_1769, _1769, _2025);
    float _2035 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1165);
    float _2037 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2017);
    float _2039 = trunc(_1999);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = _1997 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2047 = _1825 * _2003;
    float _2049 = _1905 + 0.5;
    float _2051 = fma(_1423, _1637, _1799);
    float _2053 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2045);
    float _2055 = _750 * _2047;
    bool _2057 = !_1443;
    int _2059 = _2057 ? 0 : 1;
    float _2061 = trunc(_2013);
    float _2063 = precise::max(_2061, 0.0);
    uint _2065 = uint(_2063);
    float _2067 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2053);
    float _2069 = _1973;
    if (_1931)
    {
        float _2071 = _2027 * _2023;
        _160 = _2071;
    }
    float _2073 = _160;
    float _2075 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_79.x = _2049;
    out.m_79.y = _1969;
    float _2077 = fma(_1487, _1581, _2051);
    bool _2079 = _2067 >= 0.0;
    float _2081 = rsqrt(_2033);
    int _2083 = int(_1911) + int(_2043);
    float _2085 = fma(_1435, _1527, _2077);
    int _2087 = ~_1717;
    int _2089 = _2087 + 1;
    int _2091 = ~_1811;
    int _2093 = _2091 + 1;
    float _2095 = fma(_1623, _1567, _2085);
    int _2097 = _1859 ^ _1717;
    int _2099 = _2089 * _2083;
    int _2101 = _2099 + _1859;
    int _2103 = int(_1943) + int(_2065);
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2107 = abs(_2059);
    float _2109 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2095);
    bool _2111 = uint(_2101) >= uint(_1717);
    int _2113 = _2093 * _2103;
    int _2115 = _2113 + _1891;
    float _2117 = float(_2107);
    float _2119 = _2075 * _2081;
    bool _2121 = !_2111;
    int _2123 = _2121 ? 0 : (-1);
    float _2125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2127 = uint(_2115) >= uint(_1811);
    float _2129 = _1997 * _2119;
    float _2131 = _1747 * _2119;
    int _2133 = ~_2083;
    int _2135 = _2133 + _2123;
    int _2137 = _2135 + 1;
    out.m_81.x = _2109;
    float _2139 = -_2129;
    float _2141 = _1997 + _2139;
    float _2143 = -_2131;
    float _2145 = _1747 + _2143;
    bool _2147 = !_2127;
    int _2149 = _2147 ? 0 : (-1);
    float _2151 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2153 = _2141 * _2141;
    bool _2155 = _1717 == 0;
    if (_2079)
    {
        out.m_51.x = 0.0;
    }
    bool _2157 = _1717 == 0;
    float _2159 = fma(_2145, _2145, _2153);
    uint _2161 = uint(int(uint(_2097) >> uint(31)));
    int _2163 = _1717 * _2137;
    int _2165 = _2163 + _1859;
    int _2167 = ~_2149;
    int _2169 = _2103 + _2167;
    int _2171 = _2169 + 1;
    int _2173 = ~int(_2161);
    int _2175 = _2173 + 1;
    float _2177 = _1769 * _2119;
    bool _2179 = !_2155;
    int _2181 = _2179 ? _2165 : (-1);
    float _2183 = fma(_2151, _1095, -0.5);
    if (_2079)
    {
        _1863 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2185 = _1863;
    float _2187 = -_2177;
    float _2189 = _1769 + _2187;
    float _2191 = float(_2181);
    float _2193 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2195 = _2171 ^ _2175;
    float _2197 = fma(_2189, _2189, _2159);
    int _2199 = as_type<int>(_2185);
    if (_2079)
    {
        float _2201 = _2185 * 5.0;
        _2199 = as_type<int>(_2201);
    }
    int _2203 = _2199;
    float _2205 = fma(_2151, _2191, _2021);
    int _2207 = ~_2175;
    int _2209 = _2207 + _2195;
    int _2211 = _2209 + 1;
    float _2213 = fma(_2193, _1221, -0.5);
    float _2215 = _2117 * _2031;
    float _2217 = sqrt(_2197);
    if (_2079)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7157 = as_type<float>(_2203);
        out.gl_Position.z = _7157;
    }
    float _2219 = fma(_2029, _2183, _2205);
    bool _2221 = !_2157;
    int _2223 = _2221 ? _2211 : (-1);
    float _2225 = float(_1869);
    float _2227 = _2219 + 0.5;
    float _2229 = float(_2223);
    float _2231 = -_2035;
    float _2233 = fma(_2193, _2229, _2231);
    bool _2235 = !_1447;
    int _2237 = _2235 ? 0 : 1;
    bool _2239 = !_1439;
    int _2241 = _2239 ? 0 : 1;
    float _2243 = fma(_2037, _2213, _2233);
    int _2245 = abs(_2237);
    float _2247 = _2081 * _2217;
    int _2249 = abs(_2241);
    float _2251 = _2243 + 0.5;
    float _2253 = in.m_83.x;
    float _2255 = in.m_83.y;
    float _2257 = in.m_83.z;
    float _2259 = _2055 * _2247;
    float _2261 = float(_1741);
    out.m_85.x = _2227;
    out.m_85.y = _2251;
    float _2263 = float(_2245);
    float _2265 = float(_2249);
    out.m_87.x = _2259;
    if (_2079)
    {
        return out;
    }
    float _2267 = _2265 * _2225;
    float _2269 = -_2131;
    float _2271 = _1645 + _2269;
    float _2273 = -_2129;
    float _2275 = _1119 + _2273;
    float _2277 = _2267 * (-2.0);
    float _2279 = _2263 * _2261;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2283 = _2271 + _2281;
    float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2287 = _2275 + _2285;
    float _2289 = fma(_2277, _2253, _2253);
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _2291;
    float _2295 = -_2177;
    float _2297 = _1357 + _2295;
    float _2299 = _2287 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2301 = fma(_1361, _2277, _1361);
    float _2303 = _843 + (-0.5);
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2307 = _2297 + _2305;
    float _2309 = 1.0 / _2293;
    float _2311 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2299);
    float _2313 = precise::max(_1187, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _2315 = _2215 * (-2.0);
    float _2317 = _843 + _1175;
    float _2319 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2311);
    float _2321 = fma(_2303, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2289);
    float _2323 = precise::min(_2313, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _2325 = fma(_1387, _2315, _1387);
    float _2327 = _2317 + (-1.0);
    float _2329 = fma(_2315, _2255, _2255);
    float _2331 = _1065 + (-0.5);
    float _2333 = fma(_2301, _2073, _2321);
    bool _2335 = _2319 >= 0.0;
    float _2337 = _2279 * (-2.0);
    float _2339 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2341 = _2323 + _2339;
    float _2343 = fma(_2327, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2345 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2329);
    float _2347 = _2333 * 0.15915493667125701904296875;
    float _2349 = _2341 * _2309;
    float _2351 = fma(_2337, _2257, _2257);
    float _2353 = fma(_2343, _2337, _2343);
    float _2355 = fma(_2325, _2073, _2345);
    float _2357 = in.m_89.x;
    float _2359 = in.m_89.y;
    float _2361 = in.m_89.z;
    float _2363 = _1175 + (-0.5);
    float _2365 = _2355 * 0.15915493667125701904296875;
    float _2367 = _2319;
    int _2369 = as_type<int>(_2347);
    if (_2335)
    {
        _2367 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2371 = _2367;
    float _2373 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2351);
    float _2375 = _2347 * 6.283185482025146484375;
    float _2377 = sin(_2375);
    float _2379 = (*spvDescriptorSet0.vp_c9)._m0[191].z + (-1.0);
    if (_2335)
    {
        out.m_51.x = 0.0;
    }
    float _2381 = fma(_2353, _2073, _2373);
    float _2383 = fma(_2349, _2379, 1.0);
    float _2385 = _2365 * 6.283185482025146484375;
    float _2387 = sin(_2385);
    float _2389 = _2381 * 0.15915493667125701904296875;
    float _2391 = _2365 * 6.283185482025146484375;
    float _2393 = cos(_2391);
    float _2395 = _2347 * 6.283185482025146484375;
    float _2397 = cos(_2395);
    if (_2335)
    {
        float _2399 = _2371 * 5.0;
        _2369 = as_type<int>(_2399);
    }
    int _2401 = _2369;
    if (_2335)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7445 = as_type<float>(_2401);
        out.gl_Position.z = _7445;
    }
    if (_2335)
    {
        return out;
    }
    float _2403 = _2389 * 6.283185482025146484375;
    float _2405 = cos(_2403);
    float _2407 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2409 = _2047 * _2247;
    float _2411 = _2383 * _2359;
    float _2413 = _2383 * _2357;
    float _2415 = _2383 * _2361;
    float _2417 = _2407 * _2409;
    float _2419 = _2389 * 6.283185482025146484375;
    float _2421 = sin(_2419);
    float _2423 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2411);
    float _2425 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2413);
    float _2429 = _2377 * _2387;
    float _2431 = _2397 * _2393;
    float _2433 = _2425 * _2409;
    float _2435 = _2259 * _2427;
    float _2437 = _2397 * _2405;
    float _2439 = _2417 * _2423;
    float _2441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2415);
    float _2443 = _2397 * _2387;
    float _2445 = _2377 * _2393;
    float _2447 = _2437 * _2439;
    float _2449 = _2377 * _2405;
    float _2451 = _2433 * _2441;
    float _2453 = fma(_2421, _2431, _2429);
    float _2455 = _2393 * _2405;
    float _2457 = -_2445;
    float _2459 = fma(_2421, _2443, _2457);
    float _2461 = -_2439;
    float _2463 = _2421 * _2461;
    float _2465 = fma(_2453, _2435, _2447);
    float _2467 = -_2443;
    float _2469 = fma(_2421, _2445, _2467);
    float _2471 = _2449 * _2439;
    float _2473 = _2387 * _2405;
    float _2475 = fma(_2455, _2435, _2463);
    float _2477 = fma(_2459, _2451, _2465);
    float _2479 = fma(_2421, _2429, _2431);
    float _2481 = fma(_2469, _2435, _2471);
    float _2483 = fma(_2473, _2451, _2475);
    float _2485 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2487 = fma(_2479, _2451, _2481);
    float _2489 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2491 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2485);
    float _2493 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2495 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2489);
    float _2497 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2491);
    float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2493);
    float _2501 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2495);
    float _2503 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2505 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2499);
    float _2507 = _2501 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2509 = _1357 + _2503;
    float _2511 = _2505 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2513 = _1645 + _2507;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2517 = _2509 + _2515;
    float _2519 = _1119 + _2511;
    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2523 = _2513 + _2521;
    float _2525 = _2517 * _2517;
    float _2527 = fma(_2523, _2523, _2525);
    float _2529 = sqrt(_2527);
    bool _2531 = _2529 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2533 = _2525;
    float _2535 = _2487;
    float _2537 = _2513;
    if (!_2531)
    {
        _2533 = _2509;
    }
    float _2539 = _2533;
    float _2541 = _2539;
    if (!_2531)
    {
        _2535 = _2519;
    }
    float _2543 = _2535;
    bool _2545 = !_2531;
    float _2547 = _2543;
    if (!_2545)
    {
        float _2549 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2553 = _2529 + _2551;
        float _2555 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2557 = rsqrt(_2527);
        float _2559 = _2553 * _2549;
        float _2561 = _2559 * 0.15915493667125701904296875;
        float _2563 = _2561 * 6.283185482025146484375;
        float _2565 = cos(_2563);
        float _2567 = _2561 * 6.283185482025146484375;
        float _2569 = sin(_2567);
        float _2571 = _2565 + (-1.0);
        float _2573 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2575 = fma(_2569, _2555, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2577 = fma(_2519, _2565, _2573);
        float _2579 = _2557 * _2575;
        float _2581 = fma(_2523, _2579, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2583 = fma(_2517, _2579, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2537 = _2581;
        _2541 = _2583;
        _2547 = _2577;
    }
    float _2585 = _2537;
    float _2587 = _2541;
    float _2589 = _2547;
    float _2591 = -_1945;
    float _2593 = _2591 + _2585;
    float _2595 = -_1973;
    float _2597 = _2595 + _2587;
    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2601 = _2593 + _2599;
    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2605 = _2597 + _2603;
    float _2607 = fma(_2601, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2609 = fma(_2605, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7795 = float2(_2607, _2609);
    float _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7795, float2(0.0), isnan(_7795)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7795, float2(0.0), isnan(_7795)), level(0.0)).x;
    float _2613 = -_1937;
    float _2615 = _2613 + _1119;
    float _2617 = -_1945;
    float _2619 = _1645 + _2617;
    float _2621 = -_1645;
    float _2623 = _2621 + _2585;
    float _2625 = -_1937;
    float _2627 = _2625 + _2589;
    float _2629 = -_1119;
    float _2631 = _2629 + _2589;
    float _2633 = -_1357;
    float _2635 = _2633 + _2587;
    float _2637 = -_1973;
    float _2639 = _1357 + _2637;
    float _2641 = -_2131;
    float _2643 = _2641 + _2619;
    bool _2645 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2647 = isnan(0.5);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2653 = _2649 || _2651;
    float _2655 = _2631 * _2631;
    bool _2657 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2659 = isnan(0.5);
    bool _2661 = _2657 || _2659;
    bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2665 = _2661 || _2663;
    float _2667 = fma(_2623, _2623, _2655);
    float _2669 = fma(_2635, _2635, _2667);
    float _2671 = sqrt(_2669);
    bool _2673 = _2671 > 0.0;
    float _2675 = fma(_2611, 100.0, _2615);
    float _2677 = -_2177;
    float _2679 = _2677 + _2639;
    float _2681 = fma(_2611, 100.0, _2627);
    float _2683 = -_2129;
    float _2685 = _2683 + _2675;
    float _2687 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2689 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2687);
    float _2691 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2689);
    float _2693 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2695 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2697 = 1.0 / _2693;
    float _2699 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2695);
    float _2701 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2699);
    float _2703 = _2701 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2705 = _2703 + _2693;
    float _2707 = _2693;
    float _2709 = _2705;
    float _2711 = _2635;
    float _2713 = _2679;
    if (!_2673)
    {
        _2707 = _2681;
    }
    float _2715 = _2707;
    float _2717 = _2705 * _2697;
    float _2719 = _2717 * 0.5;
    float _2721 = _2719;
    float _2723 = _2715;
    if (!_2673)
    {
        _2709 = _2593;
    }
    float _2725 = _2709;
    float _2727 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2727);
    float _2731 = _2725;
    if (!_2673)
    {
        _2721 = _2597;
    }
    float _2733 = _2721;
    float _2735 = 1.0 / _2729;
    bool _2737 = !_2673;
    float _2739 = _2733;
    float _2741 = _2733;
    float _2743 = _2735;
    if (!_2737)
    {
        float _2745 = _224 * _224;
        float _2747 = fma(_220, _220, _2745);
        float _2749 = fma(_226, _226, _2747);
        float _2751 = rsqrt(_2669);
        float _2753 = sqrt(_2749);
        float _2755 = _2623 * _2751;
        float _2757 = _2631 * _2751;
        float _2759 = _2635 * _2751;
        bool _2761 = _2753 > 0.0;
        float _2763 = _2753;
        float _2765 = _2751;
        _2069 = _2757;
        if (!_2761)
        {
            _2763 = _2593;
        }
        float _2767 = _2763;
        _2731 = _2767;
        if (!_2761)
        {
            _2765 = _2681;
        }
        float _2769 = _2765;
        _2723 = _2769;
        if (!_2761)
        {
            _2739 = _2597;
        }
        float _2771 = _2739;
        bool _2773 = !_2761;
        _2741 = _2771;
        if (!_2773)
        {
            float _2775 = rsqrt(_2749);
            float _2777 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2779 = _224 * _2775;
            float _2781 = _220 * _2775;
            float _2783 = _226 * _2775;
            float _2785 = _2757 * _2779;
            float _2787 = fma(_2755, _2781, _2785);
            float _2789 = _2777 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2791 = fma(_2759, _2783, _2787);
            float _2793 = _2791 * _2789;
            float _2795 = fma(_220, _2793, _2593);
            float _2797 = fma(_224, _2793, _2681);
            float _2799 = fma(_226, _2793, _2597);
            _2731 = _2795;
            _2723 = _2797;
            _2741 = _2799;
        }
    }
    float _2801 = _2731;
    float _2803 = _2723;
    float _2805 = _2741;
    float _2807 = _2069;
    float _2809 = -_2131;
    float _2811 = _2809 + _2801;
    float _2813 = -_2129;
    float _2815 = _2813 + _2803;
    float _2817 = -_2177;
    float _2819 = _2817 + _2805;
    float _2821 = _2807;
    float _2823 = _2815;
    float _2825 = _2811;
    float _2827 = _2819;
    if (_2665)
    {
        _2821 = 1.0;
    }
    float _2829 = _2821;
    float _2831 = _2829;
    if (!_2653)
    {
        float _2833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2835 = _2685 + _2833;
        float _2837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2839 = _2643 + _2837;
        float _2841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2843 = -_2639;
        float _2845 = _2843 + _2805;
        float _2847 = _2835 * _2835;
        float _2849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2851 = _2679 + _2849;
        float _2853 = -_2619;
        float _2855 = _2853 + _2801;
        float _2857 = -_2675;
        float _2859 = _2857 + _2803;
        float _2861 = fma(_2839, _2839, _2847);
        float _2863 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2865 = fma(_2851, _2851, _2861);
        float _2867 = sqrt(_2865);
        float _2869 = 1.0 / _2247;
        float _2871 = _2863 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2873 = precise::min(_2867, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2875 = _2873 * _2841;
        float _2877 = _2875 * _2869;
        float _2879 = _2871 * _2877;
        float _2881 = _2845 * _2877;
        float _2883 = fma(_2855, _2879, _2643);
        float _2885 = fma(_2859, _2879, _2685);
        float _2887 = fma(_2871, _2881, _2679);
        _2823 = _2885;
        _2825 = _2883;
        _2827 = _2887;
    }
    float _2889 = _2823;
    float _2891 = _2825;
    float _2893 = _2827;
    if (_2665)
    {
        _2711 = 1.0;
    }
    float _2895 = _2711;
    float _2897 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2899 = _2735 * _2897;
    float _2901 = _2895;
    if (!_2665)
    {
        float _2903 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2905 = _2903 * 0.15915493667125701904296875;
        float _2907 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2909 = _2905 * 6.283185482025146484375;
        float _2911 = cos(_2909);
        float _2913 = _2907 * 0.15915493667125701904296875;
        float _2915 = _2905 * 6.283185482025146484375;
        float _2917 = sin(_2915);
        float _2919 = 1.0 / _2911;
        float _2921 = _2913 * 6.283185482025146484375;
        float _2923 = cos(_2921);
        float _2925 = _2917 * _2919;
        float _2927 = _2913 * 6.283185482025146484375;
        float _2929 = sin(_2927);
        float _2931 = _2923 * _2925;
        float _2933 = 1.0 / _2931;
        float _2935 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2937 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2935;
        float _2939 = 1.0 / _2937;
        float _2941 = _2929 * _2933;
        float _2943 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2945 = fma(_2899, _2941, _2943);
        float _2947 = _2945 * _2939;
        float _2949 = precise::clamp(_2947, 0.0, 1.0);
        _2831 = _2949;
    }
    float _2951 = _2831;
    if (!_2665)
    {
        float _2953 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2955 = _2953 * 0.15915493667125701904296875;
        float _2957 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2959 = _2955 * 6.283185482025146484375;
        float _2961 = cos(_2959);
        float _2963 = _2957 * 0.15915493667125701904296875;
        float _2965 = _2955 * 6.283185482025146484375;
        float _2967 = sin(_2965);
        float _2969 = 1.0 / _2961;
        float _2971 = _2963 * 6.283185482025146484375;
        float _2973 = cos(_2971);
        float _2975 = _2967 * _2969;
        float _2977 = _2963 * 6.283185482025146484375;
        float _2979 = sin(_2977);
        float _2981 = _2973 * _2975;
        float _2983 = 1.0 / _2981;
        float _2985 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2987 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2985;
        float _2989 = 1.0 / _2987;
        float _2991 = _2979 * _2983;
        float _2993 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2995 = fma(_2899, _2991, _2993);
        float _2997 = _2995 * _2989;
        float _2999 = precise::clamp(_2997, 0.0, 1.0);
        float _3001 = -_2999;
        float _3003 = _3001 + 1.0;
        _2901 = _3003;
    }
    float _3005 = _2901;
    float _3007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3009 = _2889 + _3007;
    float _3011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3013 = _2891 + _3011;
    float _3015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3017 = _2893 + _3015;
    float _3019 = _3009 * _3009;
    float _3021 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3023 = fma(_3013, _3013, _3019);
    float _3025 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3021);
    float _3027 = fma(_3017, _3017, _3023);
    float _3029 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3025);
    float _3031 = rsqrt(_3027);
    float _3033 = _3029 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3035 = sqrt(_3027);
    float _3037 = _3031 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3039 = _3013 * _3037;
    float _3041 = _3017 * _3037;
    float _3043 = _3039 * _3039;
    float _3045 = _3041 * _3041;
    float _3047 = _3043 + _3045;
    float _3049 = sqrt(_3047);
    bool _3051 = _3049 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3055 = _3049 + _3053;
    float _3057 = _3031;
    float _3059 = _3047;
    float _3061 = _3055;
    float _3063 = _3009;
    if (_3051)
    {
        float _3065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3057 = _3065;
    }
    float _3067 = _3057;
    if (_3051)
    {
        float _3069 = rsqrt(_3047);
        _3059 = _3069;
    }
    float _3071 = _3059;
    float _3073 = _3071;
    if (_3051)
    {
        float _3075 = _3055 * _3067;
        _3061 = _3075;
    }
    float _3077 = _3061;
    if (_3051)
    {
        float _3079 = _3077 * 0.15915493667125701904296875;
        _2743 = _3079;
    }
    float _3081 = _2743;
    float _3083 = _3067;
    float _3085 = _3081;
    if (_3051)
    {
        float _3087 = _3081 * 6.283185482025146484375;
        float _3089 = sin(_3087);
        _3083 = _3089;
    }
    float _3091 = _3083;
    float _3093 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3095 = precise::max(0.0, _3093);
    float _3097 = _3017;
    float _3099 = _3095;
    if (_3051)
    {
        float _3101 = _3081 * 6.283185482025146484375;
        float _3103 = cos(_3101);
        _3097 = _3103;
    }
    float _3105 = _3097;
    float _3107 = -_3037;
    float _3109 = -_3095;
    float _3111 = fma(_3009, _3107, _3109);
    float _3113 = _3111;
    if (_3051)
    {
        float _3115 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3099 = _3115;
    }
    float _3117 = _3099;
    float _3119 = _3117;
    if (!_3051)
    {
        _3085 = _3039;
    }
    float _3121 = _3085;
    float _3123 = _3091;
    float _3125 = _3121;
    if (_3051)
    {
        float _3127 = fma(_3091, _3117, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3123 = _3127;
    }
    float _3129 = _3123;
    float _3131 = _3129;
    float _3133 = _3105;
    if (_3051)
    {
        float _3135 = _3105 + (-1.0);
        _3063 = _3135;
    }
    float _3137 = _3063;
    float _3139 = _3137;
    if (_3051)
    {
        float _3141 = _3071 * _3129;
        _3119 = _3141;
    }
    float _3143 = _3119;
    if (!_3051)
    {
        _3131 = _3041;
    }
    float _3145 = _3131;
    float _3147 = _3145;
    if (_3051)
    {
        float _3149 = _3137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3139 = _3149;
    }
    float _3151 = _3139;
    if (_3051)
    {
        float _3153 = _3039 * _3143;
        _3125 = _3153;
    }
    float _3155 = _3125;
    if (_3051)
    {
        float _3157 = _3041 * _3143;
        _3147 = _3157;
    }
    float _3159 = _3147;
    if (!_3051)
    {
        _3073 = _3045;
    }
    float _3161 = _3073;
    float _3163 = _3161;
    if (_3051)
    {
        float _3165 = fma(_3111, _3105, _3151);
        _3113 = _3165;
    }
    float _3167 = _3113;
    if (!_3051)
    {
        _3133 = _3043;
    }
    float _3169 = _3133;
    float _3171 = _3169;
    if (_3051)
    {
        float _3173 = _3155 * _3155;
        _3171 = _3173;
    }
    float _3175 = _3171;
    if (_3051)
    {
        float _3177 = _3159 * _3159;
        _3163 = _3177;
    }
    float _3179 = _3163;
    float _3181 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3183 = fma(_3167, _3167, _3175);
    float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3187 = fma(_3035, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3185);
    float _3189 = precise::clamp(_3187, 0.0, 1.0);
    float _3191 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3181);
    float _3193 = _3183 + _3179;
    float _3195 = -_3189;
    float _3197 = _3195 + 1.0;
    float _3199 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3191);
    float _3201 = rsqrt(_3193);
    float _3203 = fma(_2679, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3205 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3207 = _3199 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3209 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3211 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3213 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3205);
    float _3215 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3217 = abs(_3197);
    float _3219 = log2(_3217);
    float _3221 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3223 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3213);
    float _3225 = -_3215;
    float _3227 = fma(_3225, _3209, 1.0);
    float _3229 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3221);
    float _3231 = _3223 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3233 = _3201 * _3155;
    float _3235 = _3201 * _3167;
    float _3237 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3229);
    float _3239 = _3201 * _3159;
    float _3241 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3243 = floor(_3211);
    float _3245 = _3237 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3247 = -_3241;
    float _3249 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3247);
    float _3251 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3253 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3255 = -_3239;
    float _3257 = fma(_3255, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3249);
    float _3259 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3251);
    float _3261 = floor(_3203);
    float _3263 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3259);
    float _3265 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3263);
    float _3267 = log2(_3227);
    float _3269 = -_3243;
    float _3271 = _3211 + _3269;
    float _3273 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3275 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3277 = _3235 + 1.0;
    float _3279 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3273);
    float _3281 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3275);
    float _3283 = exp2(_3253);
    float _3285 = fma(_3257, -0.5, 0.5);
    float _3287 = fma(_3257, 0.5, 0.5);
    float _3289 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3279);
    float _3291 = -_3261;
    float _3293 = _3203 + _3291;
    float _3295 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3281);
    float _3297 = fma(_3287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3299 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3289);
    float _3301 = 1.0 / _3265;
    float _3303 = _3267 * 0.693147182464599609375;
    float _3305 = fma(_3287, _3297, -0.212114393711090087890625);
    float _3307 = _3303 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3309 = fma(_3287, _3305, 1.570728778839111328125);
    float _3311 = sqrt(_3285);
    float _3313 = -_3235;
    float _3315 = fma(_3283, _3277, _3313);
    float _3317 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3295);
    float _3319 = _3299 * _3301;
    float _3321 = _3317 * _3301;
    float _3323 = fma(_3319, 0.5, 0.5);
    float _3325 = fma(_3321, -0.5, 0.5);
    float _3327 = _3311 * 0.636619746685028076171875;
    float2 _8909 = float2(_3271, _3293);
    float _3329 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8909, float2(0.0), isnan(_8909)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8909, float2(0.0), isnan(_8909)), level(0.0)).x;
    float3 _8918 = float3(_3323, _3325, _3307);
    float _3331 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8918, float3(0.0), isnan(_8918)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8918, float3(0.0), isnan(_8918)), level(0.0)).x;
    float _3333 = -_3309;
    float _3335 = fma(_3327, _3333, 1.0);
    float _3337 = fma(_3315, 0.5, 0.5);
    float3 _8936 = float3(_3323, _3325, _3307);
    float4 _3340 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8936, float3(0.0), isnan(_8936)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8936, float3(0.0), isnan(_8936)), level(0.0)).xyzw;
    float _3342 = _3340.x;
    float _3344 = _3340.y;
    float _3346 = _3340.z;
    float _3348 = _3340.w;
    float2 _8952 = float2(_3335, _3337);
    float3 _3352 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8952, float2(0.0), isnan(_8952)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8952, float2(0.0), isnan(_8952)), level(0.0)).xyz;
    float _3354 = _3352.x;
    float _3356 = _3352.y;
    float _3358 = _3352.z;
    float _3360 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3362 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3364 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3366 = _2411 != 0.0;
    bool _3368 = isnan(_2411);
    bool _3370 = _3366 || _3368;
    bool _3372 = isnan(0.0);
    bool _3374 = _3370 || _3372;
    float _3376 = in.m_91.x;
    float _3378 = in.m_91.y;
    float _3380 = in.m_91.z;
    float _3382 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3360);
    float _3384 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3362);
    bool _3386 = _2413 == 0.0;
    bool _3388 = !_3374;
    bool _3390 = _3386 && _3388;
    float _3392 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3394 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3396 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3398 = _2415 == 0.0;
    bool _3400 = _3398 && _3390;
    float _3402 = -_2421;
    float _3404 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3392);
    float _3406 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3364);
    float _3408 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3410 = -_2421;
    float _3412 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3394);
    float _3414 = -_2421;
    float _3416 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3396);
    float _3418 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3382);
    float _3420 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3384);
    float _3422 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3406);
    float _3424 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3408);
    float _3426 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3428 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3412);
    float _3430 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3404);
    float _3432 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3434 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3416);
    float _3436 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3426);
    float _3438 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3424);
    float _3440 = _3376;
    float _3442 = _3378;
    float _3444 = _3380;
    float _3446 = _3299;
    if (!_3400)
    {
        float _3448 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3376);
        _3440 = _3448;
    }
    float _3450 = _3440;
    if (!_3400)
    {
        float _3452 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3378);
        _3442 = _3452;
    }
    float _3454 = _3442;
    float _3456 = abs(_2899);
    float _3458 = log2(_3456);
    float _3460 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3432);
    float _3462 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3436);
    float _3464 = _3428 * _3454;
    float _3466 = _3430 * _3454;
    float _3468 = _3434 * _3454;
    if (!_3400)
    {
        float _3470 = fma(_2415, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3380);
        _3444 = _3470;
    }
    float _3472 = _3444;
    float _3474 = fma(_3418, _3450, _3464);
    float _3476 = fma(_3420, _3450, _3466);
    float _3478 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3460);
    float _3480 = fma(_3422, _3450, _3468);
    float _3482 = fma(_3438, _3472, _3474);
    float _3484 = fma(_3462, _3472, _3476);
    float _3486 = fma(_3478, _3472, _3480);
    float _3488 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3490 = _3458 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3492 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3494 = in.m_75.x;
    float _3496 = exp2(_3488);
    float _3498 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3492);
    out.m_93.x = _2643;
    out.m_93.y = _2685;
    out.m_93.z = _2679;
    bool _3500 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3502 = isnan(_3035);
    bool _3504 = _3500 || _3502;
    bool _3506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3508 = _3504 || _3506;
    float _3510 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3498);
    out.m_95.x = _3482;
    out.m_95.y = _3484;
    out.m_95.z = _3486;
    float _3512 = exp2(_3490);
    float _3514 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3510);
    out.m_97.x = _2891;
    out.m_97.y = _2889;
    out.m_97.z = _2893;
    out.gl_Position.x = _3299;
    out.gl_Position.y = _3317;
    out.gl_Position.z = _3514;
    out.gl_Position.w = _3265;
    float _3516 = -_3496;
    float _3518 = _3516 + 1.0;
    if (!_3508)
    {
        _2713 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3520 = _2713;
    float _3522 = fma(_3512, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3524 = precise::clamp(_3522, 0.0, 1.0);
    bool _3526 = _2899 <= 8000.0;
    bool _3528 = isnan(_2899);
    bool _3530 = _3526 || _3528;
    bool _3532 = isnan(8000.0);
    bool _3534 = _3530 || _3532;
    float _3536 = float(_3534);
    float _3538 = _3265 * 0.5;
    float _3540 = fma(_3524, -2.0, 3.0);
    float _3542 = _3524 * _3524;
    float _3544 = fma(_3317, -0.5, _3538);
    float _3546 = _3518 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3548 = _3514 + _3265;
    float _3550 = _3542 * _3540;
    float _3552 = _3548 * 0.5;
    float _3554 = -_3550;
    float _3556 = _3554 + 1.0;
    float _3558 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3550);
    float _3560 = _3299 + _3265;
    float _3562 = _3550;
    float _3564 = _3520;
    float _3566 = _3520;
    if (!_3508)
    {
        _3562 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3568 = _3562;
    float _3570 = _3536 * _3558;
    float _3572 = _3560 * 0.5;
    float _3574 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3576 = _3568;
    float _3578 = _3568;
    if (!_3508)
    {
        _3446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3580 = _3446;
    out.m_99.x = _3572;
    out.m_99.y = _3544;
    out.m_99.z = _3552;
    out.m_99.w = _3265;
    float _3582 = -_3329;
    float _3584 = _3582 + 1.0;
    float _3586 = _3546 * _3331;
    float _3588 = -_3546;
    float _3590 = _3588 + 1.0;
    float _3592 = _3584 * _3574;
    float _3594 = precise::clamp(_3592, 0.0, 1.0);
    float _3596 = _3348 * _3586;
    float _3598 = _3348 * _3590;
    float _3600 = -_3594;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3604 = _3358 * _3586;
    float _3606 = fma(_3354, _3596, _3342);
    float _3608 = fma(_3356, _3596, _3344);
    float _3610 = _3602 * _3494;
    float _3612 = fma(_3348, _3604, _3346);
    float _3614 = _2951 * _3005;
    float _3616 = _3610 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3618 = _3610;
    float _3620 = _3614;
    float _3622 = _3616;
    float _3624 = _3580;
    float _3626 = _3580;
    if (!_3508)
    {
        _3618 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3628 = _3618;
    out.m_101.x = _3606;
    out.m_101.y = _3608;
    out.m_101.z = _3612;
    out.m_101.w = _3598;
    float _3630 = _3614 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3632 = _3628;
    float _3634 = _3628;
    if (!_3508)
    {
        _3620 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3636 = _3620;
    out.m_103.x = _3616;
    float _3638 = _3636;
    float _3640 = _3636;
    if (!_3508)
    {
        _3622 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3642 = _3622;
    bool _3644 = !_3508;
    float _3646 = _3642;
    float _3648 = _3642;
    if (!_3644)
    {
        bool _3650 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3652 = isnan(_3035);
        bool _3654 = _3650 || _3652;
        bool _3656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3658 = _3654 || _3656;
        if (!_3658)
        {
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3662 = _3035 + _3660;
            float _3664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3666 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3664;
            float _3668 = 1.0 / _3666;
            float _3670 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3672 = _3670 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3674 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3676 = _3674 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3678 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3680 = _3678 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3684 = _3682 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3686 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3688 = _3686 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3690 = _3662 * _3668;
            float _3692 = precise::clamp(_3690, 0.0, 1.0);
            float _3694 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3696 = _3694 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3698 = fma(_3692, _3672, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3700 = fma(_3692, _3696, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3702 = fma(_3692, _3676, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3704 = fma(_3692, _3680, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3706 = fma(_3692, _3684, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3708 = fma(_3692, _3688, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3626 = _3700;
            _3648 = _3706;
            _3578 = _3698;
            _3566 = _3704;
            _3634 = _3702;
            _3640 = _3708;
            _3710 = true;
        }
        else
        {
            bool _3712 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3714 = isnan(_3035);
            bool _3716 = _3712 || _3714;
            bool _3718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3720 = _3716 || _3718;
            if (!_3720)
            {
                _3576 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3722 = _3576;
            _3578 = _3722;
            if (!_3720)
            {
                _3624 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3724 = _3624;
            _3626 = _3724;
            if (!_3720)
            {
                _3632 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3726 = _3632;
            _3634 = _3726;
            if (!_3720)
            {
                _3564 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3728 = _3564;
            _3566 = _3728;
            if (!_3720)
            {
                _3646 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3730 = _3646;
            _3648 = _3730;
            if (!_3720)
            {
                _3638 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3732 = _3638;
            bool _3734 = !_3720;
            _3640 = _3732;
            if (!_3734)
            {
                bool _3736 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3738 = isnan(_3035);
                bool _3740 = _3736 || _3738;
                bool _3742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3744 = _3740 || _3742;
                if (!_3744)
                {
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3748 = _3035 + _3746;
                    float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3752 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3750;
                    float _3754 = 1.0 / _3752;
                    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3758 = _3756 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3762 = _3760 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3764 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3766 = _3764 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3768 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3770 = _3768 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3772 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3776 = _3748 * _3754;
                    float _3778 = precise::clamp(_3776, 0.0, 1.0);
                    float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3784 = fma(_3778, _3758, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3786 = fma(_3778, _3782, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3788 = fma(_3778, _3762, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3790 = fma(_3778, _3766, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3792 = fma(_3778, _3770, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3794 = fma(_3778, _3774, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3626 = _3786;
                    _3648 = _3792;
                    _3578 = _3784;
                    _3566 = _3790;
                    _3634 = _3788;
                    _3640 = _3794;
                    _3710 = true;
                }
                else
                {
                    _3626 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3648 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3578 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3566 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3634 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3640 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3710 = false;
    float _3796 = _3626;
    float _3798 = _3648;
    float _3800 = _3578;
    float _3802 = _3566;
    float _3804 = _3634;
    float _3806 = _3640;
    float _3808 = fma(_3484, -0.5, 0.5);
    float _3810 = precise::clamp(_3808, 0.0, 1.0);
    float _3812 = -_3796;
    float _3814 = _3812 + _3798;
    float _3816 = _3630 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3818 = -_3800;
    float _3820 = _3818 + _3802;
    float _3822 = fma(_3810, _3814, _3796);
    out.m_105.x = 0.0;
    float _3824 = -_3804;
    float _3826 = _3824 + _3806;
    float _3828 = fma(_3810, _3820, _3800);
    float _3830 = _3822 * 0.586610972881317138671875;
    out.m_51.x = _3816;
    bool _3832 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3834 = fma(_3810, _3826, _3804);
    float _3836 = fma(_3828, 0.298911988735198974609375, _3830);
    bool _3838 = _2951 > 0.0;
    bool _3840 = isnan(_2951);
    bool _3842 = _3838 || _3840;
    bool _3844 = isnan(0.0);
    bool _3846 = _3842 || _3844;
    float _3848 = fma(_3834, 0.114477999508380889892578125, _3836);
    bool _3850 = _3005 <= 0.0;
    bool _3852 = !_3846;
    bool _3854 = _3850 || _3852;
    float _3856 = -_3848;
    float _3858 = _3828 + _3856;
    float _3860 = -_3848;
    float _3862 = _3822 + _3860;
    float _3864 = -_3848;
    float _3866 = _3834 + _3864;
    float _3868 = fma(_3858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3848);
    float _3870 = fma(_3862, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3848);
    float _3872 = fma(_3866, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3848);
    bool _3874 = !_3832;
    if (!_3874)
    {
        float _3876 = -_2889;
        float _3878 = _3876 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3880 = -_2891;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3884 = -_2893;
        float _3886 = _3884 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3888 = _3878 * _3878;
        float _3890 = fma(_3882, _3882, _3888);
        float _3892 = fma(_3886, _3886, _3890);
        float _3894 = sqrt(_3892);
        float _3896 = rsqrt(_3892);
        float _3898 = -_3894;
        float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3902 = _3900 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3904 = precise::clamp(_3902, 0.0, 1.0);
        float _3906 = _3882 * _3896;
        float _3908 = _3878 * _3896;
        float _3910 = abs(_3904);
        float _3912 = log2(_3910);
        float _3914 = _3886 * _3896;
        float _3916 = _3906 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3918 = _3484 * _3908;
        float _3920 = -_3908;
        float _3922 = -_3916;
        float _3924 = fma(_3920, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3922);
        float _3926 = fma(_3482, _3906, _3918);
        float _3928 = -_3914;
        float _3930 = fma(_3928, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3924);
        float _3932 = fma(_3486, _3914, _3926);
        float _3934 = precise::clamp(_3932, 0.0, 1.0);
        float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3938 = _3930 + _3936;
        float _3940 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3942 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3944 = precise::clamp(_3942, 0.0, 1.0);
        float _3946 = exp2(_3940);
        float _3948 = _3946 * _3944;
        float _3950 = _3934 * _3948;
        float _3952 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3956 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _3952;
        out.m_105.y = _3954;
        out.m_105.z = _3956;
    }
    out.m_77.x = _3868;
    out.m_77.y = _3870;
    out.m_77.z = _3872;
    if (!_3854)
    {
        return out;
    }
    float _3958 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3958;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3710 = false;
    bool _732 = false;
    bool _628 = false;
    bool _486 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_48.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_51.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4015 = as_type<float>(_140);
        out.gl_Position.z = _4015;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_53.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_51.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4085 = as_type<float>(_178);
        out.gl_Position.z = _4085;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_55.x;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_55.y;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    float _192 = in.m_59.x;
    float _194 = in.m_59.y;
    float _196 = in.m_59.z;
    float _198 = in.m_61.x;
    float _200 = in.m_61.y;
    float _202 = in.m_61.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    out.m_65.x = _180;
    out.m_65.y = _184;
    float _210 = _188 * _194;
    float _212 = _188 * _200;
    float _214 = fma(_186, _192, _210);
    float _216 = _188 * _206;
    float _218 = fma(_186, _198, _212);
    float _220 = fma(_190, _196, _214);
    float _222 = fma(_186, _204, _216);
    float _224 = fma(_190, _202, _218);
    float _226 = fma(_190, _208, _222);
    bool _228 = !_182;
    float _230 = _184;
    float _232 = _180;
    float _250;
    if (!_228)
    {
        float _234 = in.m_67.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_124);
        float _256 = 1.0 / _254;
        float _258 = _158 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _260 + _282;
    float _286 = 1.0 / _272;
    bool _288 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _290 = isnan(_260);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _302 = isnan(_260);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    bool _312 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_260);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _326 = 1.0 / _276;
    float _328 = 1.0 / _280;
    float _330 = _264 * _286;
    bool _332 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _334 = isnan(_260);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _348 = -_342;
    float _350 = _348 + 1.0;
    float _352 = _268 * _326;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = -_310;
    float _364 = _362 + 1.0;
    float _366 = fma(_360, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = _284 * _328;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _374;
    float _378 = fma(_356, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = _322 * _364;
    float _386 = fma(_376, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = _298 * _350;
    float _390 = -_298;
    float _392 = _390 + 1.0;
    float _394 = fma(_370, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _396 = _378 * _384;
    float _398 = _310 * _392;
    float _400 = fma(_346, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _402 = fma(_382, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _404 = in.m_69.x;
    float _406 = in.m_69.y;
    float _408 = in.m_69.z;
    float _410 = _366 * _384;
    float _412 = -_322;
    float _414 = _412 + 1.0;
    float _416 = _386 * _384;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _422;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _436 = fma(_424, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_420, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _440 = fma(_432, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = fma(_400, _398, _426);
    float _444 = fma(_402, _398, _428);
    float _446 = fma(_394, _398, _434);
    float _448 = fma(_436, _388, _442);
    float _450 = fma(_438, _388, _444);
    float _452 = fma(_440, _388, _446);
    float _454 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].x, _448);
    float _456 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].y, _450);
    float _458 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].z, _452);
    float _460 = _454 * _404;
    float _462 = _456 * _406;
    float _464 = _458 * _408;
    bool _466 = !_324;
    float _484;
    if (!_466)
    {
        float _468 = in.m_67.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_124);
        float _490 = 1.0 / _488;
        float _492 = _158 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _494 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _504 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = isnan(_494);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _522 = isnan(_494);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    bool _536 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _538 = isnan(_494);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = 1.0 / _502;
    float _550 = -_514;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _556 = 1.0 / _518;
    float _558 = _534 * _548;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _564 = -_546;
    float _566 = _564 + 1.0;
    float _568 = fma(_558, _498, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _570 = _530 * _552;
    float _572 = -_530;
    float _574 = _572 + 1.0;
    float _576 = _514 * _566;
    float _578 = _562 * _556;
    float _580 = _568 * _570;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _584 = _494 + _582;
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[115].x, _580);
    float _588 = fma(_578, _584, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _592 = fma(_588, _576, _586);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _600 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[117].x, _592);
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _596;
    out.m_71.y = _602;
    out.m_71.z = _604;
    out.m_71.w = _606;
    bool _608 = !_554;
    float _626;
    if (!_608)
    {
        float _610 = in.m_67.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_124);
        float _632 = 1.0 / _630;
        float _634 = _158 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    bool _638 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _654 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _656 = isnan(_636);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _672 = _636 + _670;
    float _674 = -_648;
    float _676 = _674 + 1.0;
    float _678 = 1.0 / _652;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _682 = _664 * _676;
    float _684 = -_664;
    float _686 = _684 + 1.0;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _690 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _668 * _678;
    float _694 = fma(_692, _672, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _696 = _694 * _682;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[131].x, _696);
    float _704 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[132].x, _702);
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _704 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _706;
    out.m_73.y = _708;
    out.m_73.z = _690;
    out.m_73.w = _710;
    bool _712 = !_680;
    float _730;
    if (!_712)
    {
        float _714 = in.m_67.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_124);
        float _736 = 1.0 / _734;
        float _738 = _158 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _744 = int(_742);
    float _746 = float(_124);
    float _748 = in.m_59.w;
    float _750 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _752 = in.m_63.w;
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _756 = int(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _766 = 1.0 / _746;
    float _768 = float(_744);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _782 = 1.0 / _768;
    float _784 = float(uint(_756));
    int _786 = ~_756;
    int _788 = _786 + 1;
    int _790 = ~_756;
    int _792 = _790 + 1;
    int _794 = ~_756;
    int _796 = _794 + 1;
    float _798 = 1.0 / _784;
    float _800 = _782 * _158;
    float _802 = 1.0 / _760;
    int _804 = as_type<int>(_798) + (-2);
    float _806 = trunc(_800);
    int _808 = int(_806);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _812 = _810 != 0;
    float _814 = 1.0 / _780;
    bool _816 = !_812;
    float _818 = _816 ? 7.345489978790283203125 : 1.0;
    float _820 = float(uint(_808));
    float _822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _824 = as_type<float>(_804) * _820;
    float _826 = trunc(_824);
    float _828 = precise::max(_826, 0.0);
    uint _831 = uint(_828);
    float _833 = _822 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _835 = float(_756);
    int _837 = _788 * int(_831);
    int _839 = _837 + _808;
    float _841 = float(uint(_839));
    float _843 = in.m_67.x;
    float _845 = as_type<float>(_804) * _841;
    float _847 = trunc(_845);
    float _849 = precise::max(_847, 0.0);
    uint _851 = uint(_849);
    float _853 = _818 * _843;
    int _855 = int(_831) + int(_851);
    float _857 = float(_808);
    float _859 = 0.0;
    if (_812)
    {
        _859 = _843;
    }
    float _861 = _859;
    int _863 = _792 * _855;
    int _865 = _863 + _808;
    bool _867 = _857 >= _835;
    bool _869 = isnan(_857);
    bool _871 = _867 || _869;
    bool _873 = isnan(_835);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = floor(_853);
    bool _881 = uint(_865) >= uint(_756);
    bool _883 = !_881;
    int _885 = _883 ? 0 : (-1);
    float _887 = trunc(_877);
    int _889 = int(_887);
    bool _891 = _756 == 0;
    int _893 = ~_855;
    int _895 = _893 + _885;
    int _897 = _895 + 1;
    int _899 = _756 * _897;
    int _901 = _899 + _808;
    float _903 = -_879;
    float _905 = _853 + _903;
    int _907 = _756 + (-1);
    float _909 = _905 * _835;
    bool _911 = !_891;
    int _913 = _911 ? _901 : (-1);
    float _915 = _835 * _158;
    int _917 = ~_889;
    int _919 = _917 + 1;
    int _921 = _919 + 1;
    float _923 = trunc(_909);
    int _925 = int(_923);
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _933 = _931 != 0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _937 = _935 != 0;
    float _939 = _915 * _766;
    int _941 = _913 * _921;
    bool _943 = !_933;
    int _945 = _943 ? 0 : 1;
    float _947 = trunc(_939);
    int _949 = int(_947);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _953 = _951 != 0;
    int _955 = _889 * _907;
    int _957 = _955 + _941;
    bool _959 = !_929;
    int _961 = _959 ? 0 : 1;
    bool _963 = !_953;
    int _965 = _963 ? 0 : 1;
    int _967 = abs(_945);
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _971 = _969 != 0;
    bool _973 = !_937;
    int _975 = _973 ? 0 : 1;
    int _977 = _957 * _967;
    int _979 = abs(_961);
    int _981 = abs(_965);
    bool _983 = !_971;
    int _985 = _983 ? 0 : 1;
    int _987 = abs(_975);
    int _989 = _925 * _981;
    int _991 = _989 + _808;
    int _993 = abs(_985);
    int _995 = _949 * _979;
    int _997 = _995 + _977;
    float _999 = in.m_48.x;
    float _1001 = in.m_48.y;
    int _1003 = _991 * _987;
    int _1005 = _1003 + _997;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1009 = _1007 != 0;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1013 = _1011 != 0;
    int _1015 = _925 * _993;
    int _1017 = _1015 + _1005;
    int _1019 = ~_756;
    int _1021 = _1019 + 1;
    float _1023 = in.m_75.y;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1027 = _1025 != 0;
    float _1029 = float(uint(_1017));
    float _1031 = as_type<float>(_804) * _1029;
    int _1033 = _997;
    bool _1035 = _971;
    float _1037 = _861;
    if (_1009)
    {
        float _1039 = -_180;
        float _1041 = _1039 + 1.0;
        _1033 = as_type<int>(_1041);
    }
    int _1043 = _1033;
    if (_1009)
    {
        bool _1045 = _843 > 0.5;
        _1035 = _1045;
    }
    bool _1047 = _1035;
    float _1049 = trunc(_1031);
    float _1051 = precise::max(_1049, 0.0);
    uint _1053 = uint(_1051);
    float _1055 = 0.0;
    if (!_1027)
    {
        _1055 = _180;
    }
    float _1057 = _1055;
    float _1059 = _206 * _1001;
    float _1061 = _200 * _1001;
    float _1063 = _843 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1065 = in.m_67.y;
    float _1067 = fma(_198, _999, _1061);
    float _1069 = -_762;
    float _1071 = fma(_1063, 2.0, _1069);
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1075 = _1073 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1077 = _1021 * int(_1053);
    int _1079 = _1077 + _1017;
    float _1081 = 1.0 / _1075;
    float _1083 = float(uint(_1079));
    float _1085 = as_type<float>(_1079);
    float _1087 = _1057;
    if (!_1009)
    {
        _1085 = _180;
    }
    float _1089 = _1085;
    float _1091 = _1089;
    if (_1009)
    {
        float _1093 = _1047 ? as_type<float>(_1043) : _180;
        _1091 = _1093;
    }
    float _1095 = _1091;
    float _1097 = as_type<float>(_804) * _1083;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1101 = _1099 != 0;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1103;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1109 = _1107 != 0;
    float _1111 = _194 * _1001;
    float _1113 = trunc(_1097);
    float _1115 = precise::max(_1113, 0.0);
    uint _1117 = uint(_1115);
    float _1119 = _1001 + _1023;
    float _1121 = fma(_192, _999, _1111);
    float _1123 = fma(_204, _999, _1059);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1129 = float(uint(_991));
    float _1131 = _1105 * _802;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1137 = 1.0 / _1127;
    float _1139 = -_184;
    float _1141 = _1139 + 1.0;
    float _1143 = as_type<float>(_804) * _1129;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1149 = !_1101;
    int _1151 = _1149 ? 0 : 1;
    float _1153 = _1147 * _1081;
    int _1155 = int(_1053) + int(_1117);
    float _1157 = 1.0 / _1135;
    float _1159 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1161 = _796 * _1155;
    int _1163 = _1161 + _1017;
    float _1165 = fma(_1159, -2.0, _764);
    float _1167 = _776 * _1137;
    float _1169 = trunc(_1143);
    float _1171 = precise::max(_1169, 0.0);
    uint _1173 = uint(_1171);
    float _1175 = in.m_67.z;
    bool _1177 = uint(_1163) >= uint(_756);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1187 = in.m_48.z;
    bool _1189 = !_1177;
    int _1191 = _1189 ? 0 : (-1);
    bool _1193 = _1065 > 0.5;
    float _1195 = _772 * _1157;
    int _1197 = ~_1155;
    int _1199 = _1197 + _1191;
    int _1201 = _1199 + 1;
    float _1203 = 1.0 / _1181;
    int _1205 = _1193 ? as_type<int>(_1141) : as_type<int>(_184);
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1207;
    int _1211 = _756 * _1201;
    int _1213 = _1211 + _1017;
    int _1215 = ~_756;
    int _1217 = _1215 + 1;
    float _1219 = _1209 * _814;
    float _1221 = _1013 ? as_type<float>(_1205) : _184;
    float _1223 = 1.0 / _1185;
    bool _1225 = !_891;
    int _1227 = _1225 ? _1213 : (-1);
    int _1229 = _1217 * int(_1173);
    int _1231 = _1229 + _991;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1237 = ~_756;
    int _1239 = _1237 + 1;
    bool _1241 = _1175 > 0.5;
    int _1243 = _1227 & 3;
    bool _1245 = _1243 != 0;
    float _1247 = _1235 * _1203;
    if (_1109)
    {
        float _1249 = _1241 ? _1141 : _184;
        _230 = _1249;
    }
    float _1251 = _230;
    float _1253 = fma(_202, _1187, _1067);
    bool _1255 = uint(_1243) > 1u;
    float _1257 = _843 * 2.0;
    float _1259 = float(uint(_1231));
    float _1261 = fma(_833, _1251, -0.5);
    int _1263 = _1227 & 3;
    bool _1265 = _1263 != 0;
    float _1267 = as_type<float>(_804) * _1259;
    int _1269 = _1265 ? 0 : 1;
    float _1271 = floor(_1257);
    bool _1273 = uint(_1243) >= 2u;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1275;
    int _1279 = ~_1269;
    int _1281 = _1279 + 1;
    int _1283 = _1281 + 1;
    float _1285 = _1065 * 2.0;
    int _1287 = _1283;
    float _1289 = _1285;
    if (!_1255)
    {
        int _1291 = ~_1269;
        int _1293 = _1291 + 1;
        _1287 = _1293;
    }
    int _1295 = _1287;
    float _1297 = _1277 * _1223;
    int _1299 = _1273 ? 0 : 1;
    float _1301 = trunc(_1267);
    float _1303 = precise::max(_1301, 0.0);
    uint _1305 = uint(_1303);
    bool _1307 = _1065 > 0.5;
    bool _1309 = _1307 && _1027;
    float _1311 = fma(_196, _1187, _1121);
    bool _1313 = _1243 != 3;
    float _1315 = fma(_208, _1187, _1123);
    float _1317 = _1065 + _1175;
    if (!_812)
    {
        _1037 = _1175;
    }
    float _1319 = _1037;
    float _1321 = _843 + _1065;
    float _1323 = floor(_1285);
    int _1325 = ~_1299;
    int _1327 = _1325 + 1;
    int _1329 = _1327 + 1;
    float _1331 = _1317 + (-1.0);
    bool _1333 = !_1245;
    int _1335 = _1333 ? 0 : 1;
    float _1337 = _1321 + (-1.0);
    int _1339 = _1329;
    if (_1309)
    {
        float _1341 = -_180;
        float _1343 = _1341 + 1.0;
        _232 = _1343;
    }
    float _1345 = _232;
    bool _1347 = _1271 >= 0.0;
    bool _1349 = isnan(_1271);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = _1315 + _752;
    int _1359 = int(_1173) + int(_1305);
    float _1361 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_1027)
    {
        _1087 = _1345;
    }
    float _1363 = _1087;
    if (_1313)
    {
        int _1365 = ~_1299;
        int _1367 = _1365 + 1;
        _1339 = _1367;
    }
    int _1369 = _1339;
    int _1371 = _1239 * _1359;
    int _1373 = _1371 + _991;
    bool _1375 = _1271 > 0.0;
    float _1377 = _1175 * 2.0;
    bool _1379 = uint(_1373) >= uint(_756);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1383 = _740 + _1381;
    if (_812)
    {
        _1289 = _1065;
    }
    float _1385 = _1289;
    float _1387 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1389 = _1243 != 3;
    float _1391 = floor(_1377);
    float _1393 = _1385;
    if (!_812)
    {
        _1393 = _843;
    }
    float _1395 = _1393;
    float _1397 = fma(_1131, _1383, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1399 = !_1379;
    int _1401 = _1399 ? 0 : (-1);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1405 = _740 + _1403;
    bool _1407 = _1323 > 0.0;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1411 = _740 + _1409;
    bool _1413 = _1323 >= 0.0;
    bool _1415 = isnan(_1323);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(0.0);
    bool _1421 = _1417 || _1419;
    float _1423 = fma(_1167, _1405, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1425 = _1355 ? 0 : 1;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1429 = _740 + _1427;
    bool _1431 = !_1389;
    int _1433 = _1431 ? 0 : (-1);
    float _1435 = fma(_1247, _1411, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1439 = _1437 != 0;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1443 = _1441 != 0;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1447 = _1445 != 0;
    float _1449 = fma(_1195, _1429, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1451 = _1227 >> 31;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1455 = _740 + _1453;
    int _1457 = ~_1425;
    int _1459 = _1457 + 1;
    int _1461 = _1459 + 1;
    int _1463 = _1461;
    if (!_1375)
    {
        int _1465 = ~_1425;
        int _1467 = _1465 + 1;
        _1463 = _1467;
    }
    int _1469 = _1463;
    float _1471 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1473 = _740 + _1471;
    bool _1475 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1477 = isnan(_740);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = fma(_1219, _1455, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1489 = _1451 & 3;
    float _1491 = fma(_1153, _1473, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1493 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1495 = isnan(_740);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = -_1485;
    float _1507 = _1505 + 1.0;
    int _1509 = _1227 + _1489;
    bool _1511 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1513 = isnan(_740);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = in.m_61.w;
    int _1525 = _1509 >> 2;
    float _1527 = _1503 * _1507;
    int _1529 = _1421 ? 0 : 1;
    float _1531 = -_1503;
    float _1533 = _1531 + 1.0;
    bool _1535 = _1391 > 0.0;
    bool _1537 = _1391 >= 0.0;
    bool _1539 = isnan(_1391);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(0.0);
    bool _1545 = _1541 || _1543;
    float _1547 = -_1521;
    float _1549 = _1547 + 1.0;
    bool _1551 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1553 = isnan(_740);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1559 = _1555 || _1557;
    float _1561 = float(_1559);
    int _1563 = _1525 << 4;
    int _1565 = _1563 + 368;
    float _1567 = _1485 * _1549;
    bool _1569 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1571 = isnan(_740);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1577 = _1573 || _1575;
    float _1579 = float(_1577);
    float _1581 = _1561 * _1533;
    float _1583 = -_1561;
    float _1585 = _1583 + 1.0;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1589 = _740 + _1587;
    uint _1591 = uint(int(uint(_1565) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[int(_1601)][_1603];
    bool _1607 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1609 = isnan(_740);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    float _1619 = -_1579;
    float _1621 = _1619 + 1.0;
    float _1623 = fma(_1297, _1589, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1625 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1627 = isnan(_740);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1633 = _1629 || _1631;
    float _1635 = float(_1633);
    float _1637 = _1579 * _1585;
    float _1639 = _1617 * _1621;
    float _1641 = -_1617;
    float _1643 = _1641 + 1.0;
    float _1645 = _1311 + _748;
    bool _1647 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1649 = isnan(_740);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1655 = _1651 || _1653;
    float _1657 = float(_1655);
    float _1659 = -_1635;
    float _1661 = _1659 + 1.0;
    float _1663 = _1635 * _1643;
    float _1665 = _1253 + _1523;
    float _1667 = _1657 * _1661;
    float _1669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1671 = _1565 + 8;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[int(_1683)][_1685];
    float _1689 = -_1657;
    float _1691 = _1689 + 1.0;
    float _1693 = _1397 * _1667;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1697 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1693);
    int _1701 = abs(_1295);
    float _1703 = -_1695;
    float _1705 = fma(_1697, 2.0, _1703);
    float _1707 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1709 = ~_1359;
    int _1711 = _1709 + _1401;
    int _1713 = _1711 + 1;
    float _1715 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1717 = int(_1715);
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1721 = abs(_1369);
    float _1723 = fma(_1491, _1663, _1699);
    float _1725 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1727 = ~_1529;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    float _1733 = fma(_1707, -2.0, _1719);
    int _1735 = _1731;
    if (!_1407)
    {
        int _1737 = ~_1529;
        int _1739 = _1737 + 1;
        _1735 = _1739;
    }
    int _1741 = _1735;
    float _1743 = fma(_1725, _1363, -0.5);
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1747 = _1645 + _1745;
    int _1749 = abs(_1335);
    int _1751 = _756 * _1713;
    int _1753 = _1751 + _991;
    int _1755 = ~_1701;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1763 = _1665 + _1761;
    float _1765 = _1747 * _1747;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1769 = _1357 + _1767;
    float _1771 = float(uint(_1717));
    float _1773 = -_158;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1705);
    int _1777 = ~_1749;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    float _1783 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1733);
    int _1785 = _1759 * as_type<int>(_1605);
    float _1787 = fma(_1763, _1763, _1765);
    int _1789 = abs(_1433);
    float _1791 = 1.0 / _1771;
    int _1793 = _1781 * as_type<int>(_1597);
    int _1795 = _1793 + _1785;
    float _1797 = fma(_1769, _1769, _1787);
    float _1799 = fma(_1449, _1639, _1723);
    int _1801 = abs(_1151);
    int _1803 = ~_1721;
    int _1805 = _1803 + 1;
    int _1807 = _1805 + 1;
    float _1809 = sqrt(_1797);
    int _1811 = abs(_1717);
    int _1813 = ~_1789;
    int _1815 = _1813 + 1;
    int _1817 = _1815 + 1;
    int _1819 = _1807 * as_type<int>(_1679);
    int _1821 = _1819 + _1795;
    float _1823 = float(uint(_1811));
    float _1825 = rsqrt(_1797);
    int _1827 = ~_1801;
    int _1829 = _1827 + 1;
    int _1831 = _1829 + 1;
    int _1833 = _1817 * as_type<int>(_1687);
    int _1835 = _1833 + _1821;
    int _1837 = _1545 ? 0 : 1;
    int _1839 = _1835 * _1831;
    bool _1841 = !_891;
    int _1843 = _1841 ? _1753 : (-1);
    float _1845 = 1.0 / _1823;
    float _1847 = _1809 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1851 = ~_1837;
    int _1853 = _1851 + 1;
    int _1855 = _1853 + 1;
    int _1857 = _1843 * _1801;
    int _1859 = _1857 + _1839;
    int _1861 = _1855;
    float _1863 = as_type<float>(_1811);
    if (!_1535)
    {
        int _1865 = ~_1837;
        int _1867 = _1865 + 1;
        _1861 = _1867;
    }
    int _1869 = _1861;
    float _1871 = _750 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1875 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1877 = log2(_1875);
    int _1879 = as_type<int>(_1791) + (-2);
    float _1881 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1849);
    float _1883 = precise::min(_1871, _1847);
    float _1885 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1873);
    float _1887 = float(uint(_1859));
    float _1889 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1881);
    int _1891 = abs(_1859);
    out.m_77.w = _1883;
    int _1893 = as_type<int>(_1845) + (-2);
    float _1895 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1885);
    float _1897 = float(uint(_1891));
    float _1899 = as_type<float>(_1879) * _1887;
    int _1901 = ~_1717;
    int _1903 = _1901 + 1;
    float _1905 = fma(_1895, _1743, _1775);
    float _1907 = trunc(_1899);
    float _1909 = precise::max(_1907, 0.0);
    uint _1911 = uint(_1909);
    float _1913 = as_type<float>(_1893) * _1897;
    float _1915 = -_1783;
    float _1917 = fma(_1889, _1261, _1915);
    float _1919 = _1825 * _1883;
    float _1921 = _1877 * _158;
    bool _1923 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1925 = isnan(1.0);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1931 = _1927 || _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1935 = 1.0 + _1933;
    float _1937 = _1763 * _1919;
    float _1939 = trunc(_1913);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    float _1945 = _1747 * _1919;
    int _1947 = ~_1811;
    int _1949 = _1947 + 1;
    float _1951 = -_1937;
    float _1953 = _1763 + _1951;
    bool _1955 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1963 = _1959 || _1961;
    float _1965 = -_1945;
    float _1967 = _1747 + _1965;
    float _1969 = _1917 + 0.5;
    float _1971 = _1953 * _1953;
    float _1973 = _1769 * _1919;
    float _1975 = exp2(_1921);
    int _1977 = _1903 * int(_1911);
    int _1979 = _1977 + _1859;
    float _1981 = fma(_1967, _1967, _1971);
    float _1983 = -_1973;
    float _1985 = _1769 + _1983;
    float _1987 = float(uint(_1979));
    int _1989 = _1949 * int(_1943);
    int _1991 = _1989 + _1891;
    float _1993 = fma(_1985, _1985, _1981);
    float _1995 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1997 = _1119 + _1995;
    float _1999 = as_type<float>(_1879) * _1987;
    float _2001 = float(uint(_1991));
    float _2003 = sqrt(_1993);
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2009 = -_1975;
    float _2011 = _2009 + 1.0;
    float _2013 = as_type<float>(_1893) * _2001;
    float _2015 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2005);
    float _2017 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2007);
    float _2019 = -_158;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1071);
    float _2023 = 1.0 / _1935;
    float _2025 = fma(_1997, _1997, _1765);
    float _2027 = _1963 ? _2011 : 0.0;
    float _2029 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2015);
    float _2031 = float(_1469);
    float _2033 = fma(_1769, _1769, _2025);
    float _2035 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1165);
    float _2037 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2017);
    float _2039 = trunc(_1999);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = _1997 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2047 = _1825 * _2003;
    float _2049 = _1905 + 0.5;
    float _2051 = fma(_1423, _1637, _1799);
    float _2053 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2045);
    float _2055 = _750 * _2047;
    bool _2057 = !_1443;
    int _2059 = _2057 ? 0 : 1;
    float _2061 = trunc(_2013);
    float _2063 = precise::max(_2061, 0.0);
    uint _2065 = uint(_2063);
    float _2067 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2053);
    float _2069 = _1973;
    if (_1931)
    {
        float _2071 = _2027 * _2023;
        _160 = _2071;
    }
    float _2073 = _160;
    float _2075 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_79.x = _2049;
    out.m_79.y = _1969;
    float _2077 = fma(_1487, _1581, _2051);
    bool _2079 = _2067 >= 0.0;
    float _2081 = rsqrt(_2033);
    int _2083 = int(_1911) + int(_2043);
    float _2085 = fma(_1435, _1527, _2077);
    int _2087 = ~_1717;
    int _2089 = _2087 + 1;
    int _2091 = ~_1811;
    int _2093 = _2091 + 1;
    float _2095 = fma(_1623, _1567, _2085);
    int _2097 = _1859 ^ _1717;
    int _2099 = _2089 * _2083;
    int _2101 = _2099 + _1859;
    int _2103 = int(_1943) + int(_2065);
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2107 = abs(_2059);
    float _2109 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2095);
    bool _2111 = uint(_2101) >= uint(_1717);
    int _2113 = _2093 * _2103;
    int _2115 = _2113 + _1891;
    float _2117 = float(_2107);
    float _2119 = _2075 * _2081;
    bool _2121 = !_2111;
    int _2123 = _2121 ? 0 : (-1);
    float _2125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2127 = uint(_2115) >= uint(_1811);
    float _2129 = _1997 * _2119;
    float _2131 = _1747 * _2119;
    int _2133 = ~_2083;
    int _2135 = _2133 + _2123;
    int _2137 = _2135 + 1;
    out.m_81.x = _2109;
    float _2139 = -_2129;
    float _2141 = _1997 + _2139;
    float _2143 = -_2131;
    float _2145 = _1747 + _2143;
    bool _2147 = !_2127;
    int _2149 = _2147 ? 0 : (-1);
    float _2151 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2153 = _2141 * _2141;
    bool _2155 = _1717 == 0;
    if (_2079)
    {
        out.m_51.x = 0.0;
    }
    bool _2157 = _1717 == 0;
    float _2159 = fma(_2145, _2145, _2153);
    uint _2161 = uint(int(uint(_2097) >> uint(31)));
    int _2163 = _1717 * _2137;
    int _2165 = _2163 + _1859;
    int _2167 = ~_2149;
    int _2169 = _2103 + _2167;
    int _2171 = _2169 + 1;
    int _2173 = ~int(_2161);
    int _2175 = _2173 + 1;
    float _2177 = _1769 * _2119;
    bool _2179 = !_2155;
    int _2181 = _2179 ? _2165 : (-1);
    float _2183 = fma(_2151, _1095, -0.5);
    if (_2079)
    {
        _1863 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2185 = _1863;
    float _2187 = -_2177;
    float _2189 = _1769 + _2187;
    float _2191 = float(_2181);
    float _2193 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2195 = _2171 ^ _2175;
    float _2197 = fma(_2189, _2189, _2159);
    int _2199 = as_type<int>(_2185);
    if (_2079)
    {
        float _2201 = _2185 * 5.0;
        _2199 = as_type<int>(_2201);
    }
    int _2203 = _2199;
    float _2205 = fma(_2151, _2191, _2021);
    int _2207 = ~_2175;
    int _2209 = _2207 + _2195;
    int _2211 = _2209 + 1;
    float _2213 = fma(_2193, _1221, -0.5);
    float _2215 = _2117 * _2031;
    float _2217 = sqrt(_2197);
    if (_2079)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7157 = as_type<float>(_2203);
        out.gl_Position.z = _7157;
    }
    float _2219 = fma(_2029, _2183, _2205);
    bool _2221 = !_2157;
    int _2223 = _2221 ? _2211 : (-1);
    float _2225 = float(_1869);
    float _2227 = _2219 + 0.5;
    float _2229 = float(_2223);
    float _2231 = -_2035;
    float _2233 = fma(_2193, _2229, _2231);
    bool _2235 = !_1447;
    int _2237 = _2235 ? 0 : 1;
    bool _2239 = !_1439;
    int _2241 = _2239 ? 0 : 1;
    float _2243 = fma(_2037, _2213, _2233);
    int _2245 = abs(_2237);
    float _2247 = _2081 * _2217;
    int _2249 = abs(_2241);
    float _2251 = _2243 + 0.5;
    float _2253 = in.m_83.x;
    float _2255 = in.m_83.y;
    float _2257 = in.m_83.z;
    float _2259 = _2055 * _2247;
    float _2261 = float(_1741);
    out.m_85.x = _2227;
    out.m_85.y = _2251;
    float _2263 = float(_2245);
    float _2265 = float(_2249);
    out.m_87.x = _2259;
    if (_2079)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2267 = _2265 * _2225;
    float _2269 = -_2131;
    float _2271 = _1645 + _2269;
    float _2273 = -_2129;
    float _2275 = _1119 + _2273;
    float _2277 = _2267 * (-2.0);
    float _2279 = _2263 * _2261;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2283 = _2271 + _2281;
    float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2287 = _2275 + _2285;
    float _2289 = fma(_2277, _2253, _2253);
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _2291;
    float _2295 = -_2177;
    float _2297 = _1357 + _2295;
    float _2299 = _2287 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2301 = fma(_1361, _2277, _1361);
    float _2303 = _843 + (-0.5);
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2307 = _2297 + _2305;
    float _2309 = 1.0 / _2293;
    float _2311 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2299);
    float _2313 = precise::max(_1187, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _2315 = _2215 * (-2.0);
    float _2317 = _843 + _1175;
    float _2319 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2311);
    float _2321 = fma(_2303, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2289);
    float _2323 = precise::min(_2313, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _2325 = fma(_1387, _2315, _1387);
    float _2327 = _2317 + (-1.0);
    float _2329 = fma(_2315, _2255, _2255);
    float _2331 = _1065 + (-0.5);
    float _2333 = fma(_2301, _2073, _2321);
    bool _2335 = _2319 >= 0.0;
    float _2337 = _2279 * (-2.0);
    float _2339 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2341 = _2323 + _2339;
    float _2343 = fma(_2327, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2345 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2329);
    float _2347 = _2333 * 0.15915493667125701904296875;
    float _2349 = _2341 * _2309;
    float _2351 = fma(_2337, _2257, _2257);
    float _2353 = fma(_2343, _2337, _2343);
    float _2355 = fma(_2325, _2073, _2345);
    float _2357 = in.m_89.x;
    float _2359 = in.m_89.y;
    float _2361 = in.m_89.z;
    float _2363 = _1175 + (-0.5);
    float _2365 = _2355 * 0.15915493667125701904296875;
    float _2367 = _2319;
    int _2369 = as_type<int>(_2347);
    if (_2335)
    {
        _2367 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2371 = _2367;
    float _2373 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2351);
    float _2375 = _2347 * 6.283185482025146484375;
    float _2377 = sin(_2375);
    float _2379 = (*spvDescriptorSet0.vp_c9)._m0[191].z + (-1.0);
    if (_2335)
    {
        out.m_51.x = 0.0;
    }
    float _2381 = fma(_2353, _2073, _2373);
    float _2383 = fma(_2349, _2379, 1.0);
    float _2385 = _2365 * 6.283185482025146484375;
    float _2387 = sin(_2385);
    float _2389 = _2381 * 0.15915493667125701904296875;
    float _2391 = _2365 * 6.283185482025146484375;
    float _2393 = cos(_2391);
    float _2395 = _2347 * 6.283185482025146484375;
    float _2397 = cos(_2395);
    if (_2335)
    {
        float _2399 = _2371 * 5.0;
        _2369 = as_type<int>(_2399);
    }
    int _2401 = _2369;
    if (_2335)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7445 = as_type<float>(_2401);
        out.gl_Position.z = _7445;
    }
    if (_2335)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2403 = _2389 * 6.283185482025146484375;
    float _2405 = cos(_2403);
    float _2407 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2409 = _2047 * _2247;
    float _2411 = _2383 * _2359;
    float _2413 = _2383 * _2357;
    float _2415 = _2383 * _2361;
    float _2417 = _2407 * _2409;
    float _2419 = _2389 * 6.283185482025146484375;
    float _2421 = sin(_2419);
    float _2423 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2411);
    float _2425 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2413);
    float _2429 = _2377 * _2387;
    float _2431 = _2397 * _2393;
    float _2433 = _2425 * _2409;
    float _2435 = _2259 * _2427;
    float _2437 = _2397 * _2405;
    float _2439 = _2417 * _2423;
    float _2441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2415);
    float _2443 = _2397 * _2387;
    float _2445 = _2377 * _2393;
    float _2447 = _2437 * _2439;
    float _2449 = _2377 * _2405;
    float _2451 = _2433 * _2441;
    float _2453 = fma(_2421, _2431, _2429);
    float _2455 = _2393 * _2405;
    float _2457 = -_2445;
    float _2459 = fma(_2421, _2443, _2457);
    float _2461 = -_2439;
    float _2463 = _2421 * _2461;
    float _2465 = fma(_2453, _2435, _2447);
    float _2467 = -_2443;
    float _2469 = fma(_2421, _2445, _2467);
    float _2471 = _2449 * _2439;
    float _2473 = _2387 * _2405;
    float _2475 = fma(_2455, _2435, _2463);
    float _2477 = fma(_2459, _2451, _2465);
    float _2479 = fma(_2421, _2429, _2431);
    float _2481 = fma(_2469, _2435, _2471);
    float _2483 = fma(_2473, _2451, _2475);
    float _2485 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2487 = fma(_2479, _2451, _2481);
    float _2489 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2491 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2485);
    float _2493 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2495 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2489);
    float _2497 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2491);
    float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2493);
    float _2501 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2495);
    float _2503 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2505 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2499);
    float _2507 = _2501 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2509 = _1357 + _2503;
    float _2511 = _2505 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2513 = _1645 + _2507;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2517 = _2509 + _2515;
    float _2519 = _1119 + _2511;
    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2523 = _2513 + _2521;
    float _2525 = _2517 * _2517;
    float _2527 = fma(_2523, _2523, _2525);
    float _2529 = sqrt(_2527);
    bool _2531 = _2529 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2533 = _2525;
    float _2535 = _2487;
    float _2537 = _2513;
    if (!_2531)
    {
        _2533 = _2509;
    }
    float _2539 = _2533;
    float _2541 = _2539;
    if (!_2531)
    {
        _2535 = _2519;
    }
    float _2543 = _2535;
    bool _2545 = !_2531;
    float _2547 = _2543;
    if (!_2545)
    {
        float _2549 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2553 = _2529 + _2551;
        float _2555 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2557 = rsqrt(_2527);
        float _2559 = _2553 * _2549;
        float _2561 = _2559 * 0.15915493667125701904296875;
        float _2563 = _2561 * 6.283185482025146484375;
        float _2565 = cos(_2563);
        float _2567 = _2561 * 6.283185482025146484375;
        float _2569 = sin(_2567);
        float _2571 = _2565 + (-1.0);
        float _2573 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2575 = fma(_2569, _2555, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2577 = fma(_2519, _2565, _2573);
        float _2579 = _2557 * _2575;
        float _2581 = fma(_2523, _2579, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2583 = fma(_2517, _2579, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2537 = _2581;
        _2541 = _2583;
        _2547 = _2577;
    }
    float _2585 = _2537;
    float _2587 = _2541;
    float _2589 = _2547;
    float _2591 = -_1945;
    float _2593 = _2591 + _2585;
    float _2595 = -_1973;
    float _2597 = _2595 + _2587;
    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2601 = _2593 + _2599;
    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2605 = _2597 + _2603;
    float _2607 = fma(_2601, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2609 = fma(_2605, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7795 = float2(_2607, _2609);
    float _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7795, float2(0.0), isnan(_7795)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7795, float2(0.0), isnan(_7795)), level(0.0)).x;
    float _2613 = -_1937;
    float _2615 = _2613 + _1119;
    float _2617 = -_1945;
    float _2619 = _1645 + _2617;
    float _2621 = -_1645;
    float _2623 = _2621 + _2585;
    float _2625 = -_1937;
    float _2627 = _2625 + _2589;
    float _2629 = -_1119;
    float _2631 = _2629 + _2589;
    float _2633 = -_1357;
    float _2635 = _2633 + _2587;
    float _2637 = -_1973;
    float _2639 = _1357 + _2637;
    float _2641 = -_2131;
    float _2643 = _2641 + _2619;
    bool _2645 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2647 = isnan(0.5);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2653 = _2649 || _2651;
    float _2655 = _2631 * _2631;
    bool _2657 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2659 = isnan(0.5);
    bool _2661 = _2657 || _2659;
    bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2665 = _2661 || _2663;
    float _2667 = fma(_2623, _2623, _2655);
    float _2669 = fma(_2635, _2635, _2667);
    float _2671 = sqrt(_2669);
    bool _2673 = _2671 > 0.0;
    float _2675 = fma(_2611, 100.0, _2615);
    float _2677 = -_2177;
    float _2679 = _2677 + _2639;
    float _2681 = fma(_2611, 100.0, _2627);
    float _2683 = -_2129;
    float _2685 = _2683 + _2675;
    float _2687 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2689 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2687);
    float _2691 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2689);
    float _2693 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2695 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2697 = 1.0 / _2693;
    float _2699 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2695);
    float _2701 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2699);
    float _2703 = _2701 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2705 = _2703 + _2693;
    float _2707 = _2693;
    float _2709 = _2705;
    float _2711 = _2635;
    float _2713 = _2679;
    if (!_2673)
    {
        _2707 = _2681;
    }
    float _2715 = _2707;
    float _2717 = _2705 * _2697;
    float _2719 = _2717 * 0.5;
    float _2721 = _2719;
    float _2723 = _2715;
    if (!_2673)
    {
        _2709 = _2593;
    }
    float _2725 = _2709;
    float _2727 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2727);
    float _2731 = _2725;
    if (!_2673)
    {
        _2721 = _2597;
    }
    float _2733 = _2721;
    float _2735 = 1.0 / _2729;
    bool _2737 = !_2673;
    float _2739 = _2733;
    float _2741 = _2733;
    float _2743 = _2735;
    if (!_2737)
    {
        float _2745 = _224 * _224;
        float _2747 = fma(_220, _220, _2745);
        float _2749 = fma(_226, _226, _2747);
        float _2751 = rsqrt(_2669);
        float _2753 = sqrt(_2749);
        float _2755 = _2623 * _2751;
        float _2757 = _2631 * _2751;
        float _2759 = _2635 * _2751;
        bool _2761 = _2753 > 0.0;
        float _2763 = _2753;
        float _2765 = _2751;
        _2069 = _2757;
        if (!_2761)
        {
            _2763 = _2593;
        }
        float _2767 = _2763;
        _2731 = _2767;
        if (!_2761)
        {
            _2765 = _2681;
        }
        float _2769 = _2765;
        _2723 = _2769;
        if (!_2761)
        {
            _2739 = _2597;
        }
        float _2771 = _2739;
        bool _2773 = !_2761;
        _2741 = _2771;
        if (!_2773)
        {
            float _2775 = rsqrt(_2749);
            float _2777 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2779 = _224 * _2775;
            float _2781 = _220 * _2775;
            float _2783 = _226 * _2775;
            float _2785 = _2757 * _2779;
            float _2787 = fma(_2755, _2781, _2785);
            float _2789 = _2777 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2791 = fma(_2759, _2783, _2787);
            float _2793 = _2791 * _2789;
            float _2795 = fma(_220, _2793, _2593);
            float _2797 = fma(_224, _2793, _2681);
            float _2799 = fma(_226, _2793, _2597);
            _2731 = _2795;
            _2723 = _2797;
            _2741 = _2799;
        }
    }
    float _2801 = _2731;
    float _2803 = _2723;
    float _2805 = _2741;
    float _2807 = _2069;
    float _2809 = -_2131;
    float _2811 = _2809 + _2801;
    float _2813 = -_2129;
    float _2815 = _2813 + _2803;
    float _2817 = -_2177;
    float _2819 = _2817 + _2805;
    float _2821 = _2807;
    float _2823 = _2815;
    float _2825 = _2811;
    float _2827 = _2819;
    if (_2665)
    {
        _2821 = 1.0;
    }
    float _2829 = _2821;
    float _2831 = _2829;
    if (!_2653)
    {
        float _2833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2835 = _2685 + _2833;
        float _2837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2839 = _2643 + _2837;
        float _2841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2843 = -_2639;
        float _2845 = _2843 + _2805;
        float _2847 = _2835 * _2835;
        float _2849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2851 = _2679 + _2849;
        float _2853 = -_2619;
        float _2855 = _2853 + _2801;
        float _2857 = -_2675;
        float _2859 = _2857 + _2803;
        float _2861 = fma(_2839, _2839, _2847);
        float _2863 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2865 = fma(_2851, _2851, _2861);
        float _2867 = sqrt(_2865);
        float _2869 = 1.0 / _2247;
        float _2871 = _2863 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2873 = precise::min(_2867, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2875 = _2873 * _2841;
        float _2877 = _2875 * _2869;
        float _2879 = _2871 * _2877;
        float _2881 = _2845 * _2877;
        float _2883 = fma(_2855, _2879, _2643);
        float _2885 = fma(_2859, _2879, _2685);
        float _2887 = fma(_2871, _2881, _2679);
        _2823 = _2885;
        _2825 = _2883;
        _2827 = _2887;
    }
    float _2889 = _2823;
    float _2891 = _2825;
    float _2893 = _2827;
    if (_2665)
    {
        _2711 = 1.0;
    }
    float _2895 = _2711;
    float _2897 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2899 = _2735 * _2897;
    float _2901 = _2895;
    if (!_2665)
    {
        float _2903 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2905 = _2903 * 0.15915493667125701904296875;
        float _2907 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2909 = _2905 * 6.283185482025146484375;
        float _2911 = cos(_2909);
        float _2913 = _2907 * 0.15915493667125701904296875;
        float _2915 = _2905 * 6.283185482025146484375;
        float _2917 = sin(_2915);
        float _2919 = 1.0 / _2911;
        float _2921 = _2913 * 6.283185482025146484375;
        float _2923 = cos(_2921);
        float _2925 = _2917 * _2919;
        float _2927 = _2913 * 6.283185482025146484375;
        float _2929 = sin(_2927);
        float _2931 = _2923 * _2925;
        float _2933 = 1.0 / _2931;
        float _2935 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2937 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2935;
        float _2939 = 1.0 / _2937;
        float _2941 = _2929 * _2933;
        float _2943 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2945 = fma(_2899, _2941, _2943);
        float _2947 = _2945 * _2939;
        float _2949 = precise::clamp(_2947, 0.0, 1.0);
        _2831 = _2949;
    }
    float _2951 = _2831;
    if (!_2665)
    {
        float _2953 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2955 = _2953 * 0.15915493667125701904296875;
        float _2957 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2959 = _2955 * 6.283185482025146484375;
        float _2961 = cos(_2959);
        float _2963 = _2957 * 0.15915493667125701904296875;
        float _2965 = _2955 * 6.283185482025146484375;
        float _2967 = sin(_2965);
        float _2969 = 1.0 / _2961;
        float _2971 = _2963 * 6.283185482025146484375;
        float _2973 = cos(_2971);
        float _2975 = _2967 * _2969;
        float _2977 = _2963 * 6.283185482025146484375;
        float _2979 = sin(_2977);
        float _2981 = _2973 * _2975;
        float _2983 = 1.0 / _2981;
        float _2985 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2987 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2985;
        float _2989 = 1.0 / _2987;
        float _2991 = _2979 * _2983;
        float _2993 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2995 = fma(_2899, _2991, _2993);
        float _2997 = _2995 * _2989;
        float _2999 = precise::clamp(_2997, 0.0, 1.0);
        float _3001 = -_2999;
        float _3003 = _3001 + 1.0;
        _2901 = _3003;
    }
    float _3005 = _2901;
    float _3007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3009 = _2889 + _3007;
    float _3011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3013 = _2891 + _3011;
    float _3015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3017 = _2893 + _3015;
    float _3019 = _3009 * _3009;
    float _3021 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3023 = fma(_3013, _3013, _3019);
    float _3025 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3021);
    float _3027 = fma(_3017, _3017, _3023);
    float _3029 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3025);
    float _3031 = rsqrt(_3027);
    float _3033 = _3029 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3035 = sqrt(_3027);
    float _3037 = _3031 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3039 = _3013 * _3037;
    float _3041 = _3017 * _3037;
    float _3043 = _3039 * _3039;
    float _3045 = _3041 * _3041;
    float _3047 = _3043 + _3045;
    float _3049 = sqrt(_3047);
    bool _3051 = _3049 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3055 = _3049 + _3053;
    float _3057 = _3031;
    float _3059 = _3047;
    float _3061 = _3055;
    float _3063 = _3009;
    if (_3051)
    {
        float _3065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3057 = _3065;
    }
    float _3067 = _3057;
    if (_3051)
    {
        float _3069 = rsqrt(_3047);
        _3059 = _3069;
    }
    float _3071 = _3059;
    float _3073 = _3071;
    if (_3051)
    {
        float _3075 = _3055 * _3067;
        _3061 = _3075;
    }
    float _3077 = _3061;
    if (_3051)
    {
        float _3079 = _3077 * 0.15915493667125701904296875;
        _2743 = _3079;
    }
    float _3081 = _2743;
    float _3083 = _3067;
    float _3085 = _3081;
    if (_3051)
    {
        float _3087 = _3081 * 6.283185482025146484375;
        float _3089 = sin(_3087);
        _3083 = _3089;
    }
    float _3091 = _3083;
    float _3093 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3095 = precise::max(0.0, _3093);
    float _3097 = _3017;
    float _3099 = _3095;
    if (_3051)
    {
        float _3101 = _3081 * 6.283185482025146484375;
        float _3103 = cos(_3101);
        _3097 = _3103;
    }
    float _3105 = _3097;
    float _3107 = -_3037;
    float _3109 = -_3095;
    float _3111 = fma(_3009, _3107, _3109);
    float _3113 = _3111;
    if (_3051)
    {
        float _3115 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3099 = _3115;
    }
    float _3117 = _3099;
    float _3119 = _3117;
    if (!_3051)
    {
        _3085 = _3039;
    }
    float _3121 = _3085;
    float _3123 = _3091;
    float _3125 = _3121;
    if (_3051)
    {
        float _3127 = fma(_3091, _3117, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3123 = _3127;
    }
    float _3129 = _3123;
    float _3131 = _3129;
    float _3133 = _3105;
    if (_3051)
    {
        float _3135 = _3105 + (-1.0);
        _3063 = _3135;
    }
    float _3137 = _3063;
    float _3139 = _3137;
    if (_3051)
    {
        float _3141 = _3071 * _3129;
        _3119 = _3141;
    }
    float _3143 = _3119;
    if (!_3051)
    {
        _3131 = _3041;
    }
    float _3145 = _3131;
    float _3147 = _3145;
    if (_3051)
    {
        float _3149 = _3137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3139 = _3149;
    }
    float _3151 = _3139;
    if (_3051)
    {
        float _3153 = _3039 * _3143;
        _3125 = _3153;
    }
    float _3155 = _3125;
    if (_3051)
    {
        float _3157 = _3041 * _3143;
        _3147 = _3157;
    }
    float _3159 = _3147;
    if (!_3051)
    {
        _3073 = _3045;
    }
    float _3161 = _3073;
    float _3163 = _3161;
    if (_3051)
    {
        float _3165 = fma(_3111, _3105, _3151);
        _3113 = _3165;
    }
    float _3167 = _3113;
    if (!_3051)
    {
        _3133 = _3043;
    }
    float _3169 = _3133;
    float _3171 = _3169;
    if (_3051)
    {
        float _3173 = _3155 * _3155;
        _3171 = _3173;
    }
    float _3175 = _3171;
    if (_3051)
    {
        float _3177 = _3159 * _3159;
        _3163 = _3177;
    }
    float _3179 = _3163;
    float _3181 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3183 = fma(_3167, _3167, _3175);
    float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3187 = fma(_3035, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3185);
    float _3189 = precise::clamp(_3187, 0.0, 1.0);
    float _3191 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3181);
    float _3193 = _3183 + _3179;
    float _3195 = -_3189;
    float _3197 = _3195 + 1.0;
    float _3199 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3191);
    float _3201 = rsqrt(_3193);
    float _3203 = fma(_2679, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3205 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3207 = _3199 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3209 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3211 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3213 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3205);
    float _3215 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3217 = abs(_3197);
    float _3219 = log2(_3217);
    float _3221 = _2889 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3223 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3213);
    float _3225 = -_3215;
    float _3227 = fma(_3225, _3209, 1.0);
    float _3229 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3221);
    float _3231 = _3223 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3233 = _3201 * _3155;
    float _3235 = _3201 * _3167;
    float _3237 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3229);
    float _3239 = _3201 * _3159;
    float _3241 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3243 = floor(_3211);
    float _3245 = _3237 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3247 = -_3241;
    float _3249 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3247);
    float _3251 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3253 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3255 = -_3239;
    float _3257 = fma(_3255, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3249);
    float _3259 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3251);
    float _3261 = floor(_3203);
    float _3263 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3259);
    float _3265 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3263);
    float _3267 = log2(_3227);
    float _3269 = -_3243;
    float _3271 = _3211 + _3269;
    float _3273 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3275 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3277 = _3235 + 1.0;
    float _3279 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3273);
    float _3281 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3275);
    float _3283 = exp2(_3253);
    float _3285 = fma(_3257, -0.5, 0.5);
    float _3287 = fma(_3257, 0.5, 0.5);
    float _3289 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3279);
    float _3291 = -_3261;
    float _3293 = _3203 + _3291;
    float _3295 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3281);
    float _3297 = fma(_3287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3299 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3289);
    float _3301 = 1.0 / _3265;
    float _3303 = _3267 * 0.693147182464599609375;
    float _3305 = fma(_3287, _3297, -0.212114393711090087890625);
    float _3307 = _3303 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3309 = fma(_3287, _3305, 1.570728778839111328125);
    float _3311 = sqrt(_3285);
    float _3313 = -_3235;
    float _3315 = fma(_3283, _3277, _3313);
    float _3317 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3295);
    float _3319 = _3299 * _3301;
    float _3321 = _3317 * _3301;
    float _3323 = fma(_3319, 0.5, 0.5);
    float _3325 = fma(_3321, -0.5, 0.5);
    float _3327 = _3311 * 0.636619746685028076171875;
    float2 _8909 = float2(_3271, _3293);
    float _3329 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8909, float2(0.0), isnan(_8909)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8909, float2(0.0), isnan(_8909)), level(0.0)).x;
    float3 _8918 = float3(_3323, _3325, _3307);
    float _3331 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8918, float3(0.0), isnan(_8918)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8918, float3(0.0), isnan(_8918)), level(0.0)).x;
    float _3333 = -_3309;
    float _3335 = fma(_3327, _3333, 1.0);
    float _3337 = fma(_3315, 0.5, 0.5);
    float3 _8936 = float3(_3323, _3325, _3307);
    float4 _3340 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8936, float3(0.0), isnan(_8936)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8936, float3(0.0), isnan(_8936)), level(0.0)).xyzw;
    float _3342 = _3340.x;
    float _3344 = _3340.y;
    float _3346 = _3340.z;
    float _3348 = _3340.w;
    float2 _8952 = float2(_3335, _3337);
    float3 _3352 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8952, float2(0.0), isnan(_8952)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8952, float2(0.0), isnan(_8952)), level(0.0)).xyz;
    float _3354 = _3352.x;
    float _3356 = _3352.y;
    float _3358 = _3352.z;
    float _3360 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3362 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3364 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3366 = _2411 != 0.0;
    bool _3368 = isnan(_2411);
    bool _3370 = _3366 || _3368;
    bool _3372 = isnan(0.0);
    bool _3374 = _3370 || _3372;
    float _3376 = in.m_91.x;
    float _3378 = in.m_91.y;
    float _3380 = in.m_91.z;
    float _3382 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3360);
    float _3384 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3362);
    bool _3386 = _2413 == 0.0;
    bool _3388 = !_3374;
    bool _3390 = _3386 && _3388;
    float _3392 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3394 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3396 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3398 = _2415 == 0.0;
    bool _3400 = _3398 && _3390;
    float _3402 = -_2421;
    float _3404 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3392);
    float _3406 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3364);
    float _3408 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3410 = -_2421;
    float _3412 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3394);
    float _3414 = -_2421;
    float _3416 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3396);
    float _3418 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3382);
    float _3420 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3384);
    float _3422 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3406);
    float _3424 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3408);
    float _3426 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3428 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3412);
    float _3430 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3404);
    float _3432 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3434 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3416);
    float _3436 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3426);
    float _3438 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3424);
    float _3440 = _3376;
    float _3442 = _3378;
    float _3444 = _3380;
    float _3446 = _3299;
    if (!_3400)
    {
        float _3448 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3376);
        _3440 = _3448;
    }
    float _3450 = _3440;
    if (!_3400)
    {
        float _3452 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3378);
        _3442 = _3452;
    }
    float _3454 = _3442;
    float _3456 = abs(_2899);
    float _3458 = log2(_3456);
    float _3460 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3432);
    float _3462 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3436);
    float _3464 = _3428 * _3454;
    float _3466 = _3430 * _3454;
    float _3468 = _3434 * _3454;
    if (!_3400)
    {
        float _3470 = fma(_2415, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3380);
        _3444 = _3470;
    }
    float _3472 = _3444;
    float _3474 = fma(_3418, _3450, _3464);
    float _3476 = fma(_3420, _3450, _3466);
    float _3478 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3460);
    float _3480 = fma(_3422, _3450, _3468);
    float _3482 = fma(_3438, _3472, _3474);
    float _3484 = fma(_3462, _3472, _3476);
    float _3486 = fma(_3478, _3472, _3480);
    float _3488 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3490 = _3458 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3492 = _3231 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3494 = in.m_75.x;
    float _3496 = exp2(_3488);
    float _3498 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3492);
    out.m_93.x = _2643;
    out.m_93.y = _2685;
    out.m_93.z = _2679;
    bool _3500 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3502 = isnan(_3035);
    bool _3504 = _3500 || _3502;
    bool _3506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3508 = _3504 || _3506;
    float _3510 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3498);
    out.m_95.x = _3482;
    out.m_95.y = _3484;
    out.m_95.z = _3486;
    float _3512 = exp2(_3490);
    float _3514 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3510);
    out.m_97.x = _2891;
    out.m_97.y = _2889;
    out.m_97.z = _2893;
    out.gl_Position.x = _3299;
    out.gl_Position.y = _3317;
    out.gl_Position.z = _3514;
    out.gl_Position.w = _3265;
    float _3516 = -_3496;
    float _3518 = _3516 + 1.0;
    if (!_3508)
    {
        _2713 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3520 = _2713;
    float _3522 = fma(_3512, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3524 = precise::clamp(_3522, 0.0, 1.0);
    bool _3526 = _2899 <= 8000.0;
    bool _3528 = isnan(_2899);
    bool _3530 = _3526 || _3528;
    bool _3532 = isnan(8000.0);
    bool _3534 = _3530 || _3532;
    float _3536 = float(_3534);
    float _3538 = _3265 * 0.5;
    float _3540 = fma(_3524, -2.0, 3.0);
    float _3542 = _3524 * _3524;
    float _3544 = fma(_3317, -0.5, _3538);
    float _3546 = _3518 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3548 = _3514 + _3265;
    float _3550 = _3542 * _3540;
    float _3552 = _3548 * 0.5;
    float _3554 = -_3550;
    float _3556 = _3554 + 1.0;
    float _3558 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3550);
    float _3560 = _3299 + _3265;
    float _3562 = _3550;
    float _3564 = _3520;
    float _3566 = _3520;
    if (!_3508)
    {
        _3562 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3568 = _3562;
    float _3570 = _3536 * _3558;
    float _3572 = _3560 * 0.5;
    float _3574 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3576 = _3568;
    float _3578 = _3568;
    if (!_3508)
    {
        _3446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3580 = _3446;
    out.m_99.x = _3572;
    out.m_99.y = _3544;
    out.m_99.z = _3552;
    out.m_99.w = _3265;
    float _3582 = -_3329;
    float _3584 = _3582 + 1.0;
    float _3586 = _3546 * _3331;
    float _3588 = -_3546;
    float _3590 = _3588 + 1.0;
    float _3592 = _3584 * _3574;
    float _3594 = precise::clamp(_3592, 0.0, 1.0);
    float _3596 = _3348 * _3586;
    float _3598 = _3348 * _3590;
    float _3600 = -_3594;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3604 = _3358 * _3586;
    float _3606 = fma(_3354, _3596, _3342);
    float _3608 = fma(_3356, _3596, _3344);
    float _3610 = _3602 * _3494;
    float _3612 = fma(_3348, _3604, _3346);
    float _3614 = _2951 * _3005;
    float _3616 = _3610 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3618 = _3610;
    float _3620 = _3614;
    float _3622 = _3616;
    float _3624 = _3580;
    float _3626 = _3580;
    if (!_3508)
    {
        _3618 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3628 = _3618;
    out.m_101.x = _3606;
    out.m_101.y = _3608;
    out.m_101.z = _3612;
    out.m_101.w = _3598;
    float _3630 = _3614 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3632 = _3628;
    float _3634 = _3628;
    if (!_3508)
    {
        _3620 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3636 = _3620;
    out.m_103.x = _3616;
    float _3638 = _3636;
    float _3640 = _3636;
    if (!_3508)
    {
        _3622 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3642 = _3622;
    bool _3644 = !_3508;
    float _3646 = _3642;
    float _3648 = _3642;
    if (!_3644)
    {
        bool _3650 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3652 = isnan(_3035);
        bool _3654 = _3650 || _3652;
        bool _3656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3658 = _3654 || _3656;
        if (!_3658)
        {
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3662 = _3035 + _3660;
            float _3664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3666 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3664;
            float _3668 = 1.0 / _3666;
            float _3670 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3672 = _3670 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3674 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3676 = _3674 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3678 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3680 = _3678 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3684 = _3682 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3686 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3688 = _3686 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3690 = _3662 * _3668;
            float _3692 = precise::clamp(_3690, 0.0, 1.0);
            float _3694 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3696 = _3694 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3698 = fma(_3692, _3672, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3700 = fma(_3692, _3696, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3702 = fma(_3692, _3676, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3704 = fma(_3692, _3680, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3706 = fma(_3692, _3684, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3708 = fma(_3692, _3688, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3626 = _3700;
            _3648 = _3706;
            _3578 = _3698;
            _3566 = _3704;
            _3634 = _3702;
            _3640 = _3708;
            _3710 = true;
        }
        else
        {
            bool _3712 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3714 = isnan(_3035);
            bool _3716 = _3712 || _3714;
            bool _3718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3720 = _3716 || _3718;
            if (!_3720)
            {
                _3576 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3722 = _3576;
            _3578 = _3722;
            if (!_3720)
            {
                _3624 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3724 = _3624;
            _3626 = _3724;
            if (!_3720)
            {
                _3632 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3726 = _3632;
            _3634 = _3726;
            if (!_3720)
            {
                _3564 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3728 = _3564;
            _3566 = _3728;
            if (!_3720)
            {
                _3646 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3730 = _3646;
            _3648 = _3730;
            if (!_3720)
            {
                _3638 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3732 = _3638;
            bool _3734 = !_3720;
            _3640 = _3732;
            if (!_3734)
            {
                bool _3736 = _3035 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3738 = isnan(_3035);
                bool _3740 = _3736 || _3738;
                bool _3742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3744 = _3740 || _3742;
                if (!_3744)
                {
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3748 = _3035 + _3746;
                    float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3752 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3750;
                    float _3754 = 1.0 / _3752;
                    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3758 = _3756 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3762 = _3760 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3764 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3766 = _3764 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3768 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3770 = _3768 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3772 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3776 = _3748 * _3754;
                    float _3778 = precise::clamp(_3776, 0.0, 1.0);
                    float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3784 = fma(_3778, _3758, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3786 = fma(_3778, _3782, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3788 = fma(_3778, _3762, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3790 = fma(_3778, _3766, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3792 = fma(_3778, _3770, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3794 = fma(_3778, _3774, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3626 = _3786;
                    _3648 = _3792;
                    _3578 = _3784;
                    _3566 = _3790;
                    _3634 = _3788;
                    _3640 = _3794;
                    _3710 = true;
                }
                else
                {
                    _3626 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3648 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3578 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3566 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3634 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3640 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3710 = false;
    float _3796 = _3626;
    float _3798 = _3648;
    float _3800 = _3578;
    float _3802 = _3566;
    float _3804 = _3634;
    float _3806 = _3640;
    float _3808 = fma(_3484, -0.5, 0.5);
    float _3810 = precise::clamp(_3808, 0.0, 1.0);
    float _3812 = -_3796;
    float _3814 = _3812 + _3798;
    float _3816 = _3630 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3818 = -_3800;
    float _3820 = _3818 + _3802;
    float _3822 = fma(_3810, _3814, _3796);
    out.m_105.x = 0.0;
    float _3824 = -_3804;
    float _3826 = _3824 + _3806;
    float _3828 = fma(_3810, _3820, _3800);
    float _3830 = _3822 * 0.586610972881317138671875;
    out.m_51.x = _3816;
    bool _3832 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3834 = fma(_3810, _3826, _3804);
    float _3836 = fma(_3828, 0.298911988735198974609375, _3830);
    bool _3838 = _2951 > 0.0;
    bool _3840 = isnan(_2951);
    bool _3842 = _3838 || _3840;
    bool _3844 = isnan(0.0);
    bool _3846 = _3842 || _3844;
    float _3848 = fma(_3834, 0.114477999508380889892578125, _3836);
    bool _3850 = _3005 <= 0.0;
    bool _3852 = !_3846;
    bool _3854 = _3850 || _3852;
    float _3856 = -_3848;
    float _3858 = _3828 + _3856;
    float _3860 = -_3848;
    float _3862 = _3822 + _3860;
    float _3864 = -_3848;
    float _3866 = _3834 + _3864;
    float _3868 = fma(_3858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3848);
    float _3870 = fma(_3862, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3848);
    float _3872 = fma(_3866, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3848);
    bool _3874 = !_3832;
    if (!_3874)
    {
        float _3876 = -_2889;
        float _3878 = _3876 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3880 = -_2891;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3884 = -_2893;
        float _3886 = _3884 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3888 = _3878 * _3878;
        float _3890 = fma(_3882, _3882, _3888);
        float _3892 = fma(_3886, _3886, _3890);
        float _3894 = sqrt(_3892);
        float _3896 = rsqrt(_3892);
        float _3898 = -_3894;
        float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3902 = _3900 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3904 = precise::clamp(_3902, 0.0, 1.0);
        float _3906 = _3882 * _3896;
        float _3908 = _3878 * _3896;
        float _3910 = abs(_3904);
        float _3912 = log2(_3910);
        float _3914 = _3886 * _3896;
        float _3916 = _3906 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3918 = _3484 * _3908;
        float _3920 = -_3908;
        float _3922 = -_3916;
        float _3924 = fma(_3920, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3922);
        float _3926 = fma(_3482, _3906, _3918);
        float _3928 = -_3914;
        float _3930 = fma(_3928, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3924);
        float _3932 = fma(_3486, _3914, _3926);
        float _3934 = precise::clamp(_3932, 0.0, 1.0);
        float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3938 = _3930 + _3936;
        float _3940 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3942 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3944 = precise::clamp(_3942, 0.0, 1.0);
        float _3946 = exp2(_3940);
        float _3948 = _3946 * _3944;
        float _3950 = _3934 * _3948;
        float _3952 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3956 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _3952;
        out.m_105.y = _3954;
        out.m_105.z = _3956;
    }
    out.m_77.x = _3868;
    out.m_77.y = _3870;
    out.m_77.z = _3872;
    if (!_3854)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3958 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3958;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

