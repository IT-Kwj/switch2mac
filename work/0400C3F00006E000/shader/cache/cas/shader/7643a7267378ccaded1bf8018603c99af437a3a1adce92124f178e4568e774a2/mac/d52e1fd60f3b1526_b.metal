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
    float4 m_55 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_57 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2282 = false;
    bool _828 = false;
    bool _726 = false;
    bool _490 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3036 = as_type<float>(_120);
        out.gl_Position.z = _3036;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3106 = as_type<float>(_158);
        out.gl_Position.z = _3106;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    float _214 = float(_192);
    int _216 = abs(_212);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _222 = _208 < 0.5;
    float _224 = float(_222);
    float _226 = fma(_196, 0.5, 0.5);
    float _228 = abs(_220);
    float _230 = _214 * _228;
    float _232 = float(_204);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_216);
    float _244 = fma(_232, _240, _230);
    float _246 = abs(_236);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    bool _252 = _168;
    float _268;
    if (!_250)
    {
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _256 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_104);
        float _274 = 1.0 / _272;
        float _276 = _138 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _278 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = _278 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _278 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _300;
    float _304 = 1.0 / _294;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _308 = 1.0 / _302;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = 1.0 / _298;
    float _316 = _282 * _304;
    bool _318 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _320 = isnan(_278);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = fma(_312, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = fma(_332, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = _286 * _308;
    bool _340 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_278);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_328;
    float _354 = _352 + 1.0;
    float _356 = _350 * _354;
    bool _358 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_278);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _290 * _314;
    bool _372 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _374 = isnan(_278);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = -_350;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = fma(_386, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_382;
    float _400 = _398 + 1.0;
    float _402 = _382 * _390;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = _368 * _400;
    float _414 = -_368;
    float _416 = _414 + 1.0;
    float _418 = fma(_394, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_406, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = _334 * _412;
    float _424 = _336 * _412;
    float _426 = _396 * _412;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _422);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _432 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _434 = fma(_410, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _444;
    float _448 = fma(_418, _402, _428);
    float _450 = fma(_438, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_442, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _454 = fma(_446, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _456 = fma(_420, _402, _430);
    float _458 = fma(_434, _402, _432);
    float _460 = fma(_450, _356, _448);
    float _462 = fma(_452, _356, _456);
    float _464 = fma(_454, _356, _458);
    float _466 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].x, _460);
    float _468 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].y, _462);
    float _470 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].z, _464);
    bool _472 = !_306;
    float _488;
    if (!_472)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _476 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_104);
        float _494 = 1.0 / _492;
        float _496 = _138 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = in.m_53.x;
    float _502 = in.m_53.y;
    float _504 = in.m_53.z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _508 = _498 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _512 = _498 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = 1.0 / _516;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _530 = 1.0 / _524;
    float _532 = _470 * _504;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _536 = _498 + _534;
    float _538 = 1.0 / _520;
    float _540 = _508 * _526;
    bool _542 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _544 = isnan(_498);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = _468 * _502;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _556;
    float _560 = _466 * _500;
    float _562 = -_552;
    float _564 = _562 + 1.0;
    float _566 = _512 * _530;
    bool _568 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _570 = isnan(_498);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    bool _580 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _582 = isnan(_498);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _578 * _564;
    bool _594 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _596 = isnan(_498);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = _536 * _538;
    float _608 = -_590;
    float _610 = _608 + 1.0;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _612;
    float _616 = -_578;
    float _618 = _616 + 1.0;
    float _620 = fma(_558, _606, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _630 = _604 * _610;
    float _632 = fma(_614, _606, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _634 = fma(_624, _606, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _636 = _590 * _618;
    float _638 = _620 * _630;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _644 = _634 * _630;
    float _646 = _632 * _630;
    float _648 = -_604;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _656 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].x, _644);
    float _658 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].y, _638);
    float _660 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].z, _646);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _662;
    float _666 = fma(_628, _566, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _668 = fma(_654, _566, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _670 = fma(_642, _566, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _676;
    float _680 = fma(_666, _636, _656);
    float _682 = fma(_664, _540, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _684 = fma(_674, _540, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _686 = fma(_678, _540, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _688 = fma(_668, _636, _658);
    float _690 = fma(_670, _636, _660);
    float _692 = fma(_682, _592, _680);
    float _694 = fma(_684, _592, _688);
    float _696 = fma(_686, _592, _690);
    float _698 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].x, _692);
    float _700 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].y, _694);
    float _702 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].z, _696);
    bool _704 = !_528;
    int _706 = as_type<int>(_566);
    float _708 = _540;
    float _724;
    if (!_704)
    {
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _712 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        float _728 = float(_104);
        float _730 = 1.0 / _728;
        float _732 = _138 * _730;
        _724 = _732;
    }
    _726 = false;
    float _734 = _724;
    bool _736 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _738 = isnan(_734);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _752 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _754 = isnan(_734);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _770 = _734 + _768;
    float _772 = 1.0 / _750;
    float _774 = -_746;
    float _776 = _774 + 1.0;
    bool _778 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _780 = _762 * _776;
    float _782 = -_762;
    float _784 = _782 + 1.0;
    float _786 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _788 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _766 * _772;
    float _792 = fma(_790, _770, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _794 = _702 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = _792 * _780;
    float _798 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[115].x, _796);
    float _802 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[116].x, _800);
    float _804 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = _802 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _788;
    out.m_55.y = _804;
    out.m_55.z = _806;
    out.m_55.w = _808;
    bool _810 = !_778;
    float _826;
    if (!_810)
    {
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _814 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_104);
        float _832 = 1.0 / _830;
        float _834 = _138 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = in.m_57.x;
    float _840 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _842 = log2(_840);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _846 = _844 != 0;
    float _848 = in.m_51.z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _852 = _850 != 0;
    float _854 = _160 * 2.0;
    float _856 = in.m_44.x;
    float _858 = in.m_44.y;
    float _860 = in.m_44.z;
    float _862 = floor(_854);
    float _864 = in.m_59.x;
    float _866 = in.m_59.y;
    float _868 = in.m_59.z;
    if (_846)
    {
        bool _870 = _160 > 0.5;
        _252 = _870;
    }
    bool _872 = _252;
    float _874 = in.m_61.x;
    float _876 = in.m_61.y;
    float _878 = in.m_61.z;
    float _880 = _842 * _138;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _888 = in.m_63.x;
    float _890 = in.m_63.y;
    float _892 = in.m_63.z;
    if (_846)
    {
        float _894 = -_838;
        float _896 = _894 + 1.0;
        _706 = as_type<int>(_896);
    }
    int _898 = _706;
    float _900 = as_type<float>(_898);
    if (!_846)
    {
        _708 = _838;
    }
    float _902 = _708;
    float _904 = in.m_57.y;
    int _906 = 0;
    float _908 = _902;
    if (_852)
    {
        float _910 = -_838;
        float _912 = _910 + 1.0;
        _906 = as_type<int>(_912);
    }
    int _914 = _906;
    float _916 = exp2(_880);
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _928 = _926 != 0;
    float _930 = in.m_51.w;
    bool _932 = _872;
    if (_846)
    {
        float _934 = _872 ? as_type<float>(_898) : _838;
        _908 = _934;
    }
    float _936 = _908;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _938;
    if (_852)
    {
        bool _942 = _848 > 0.5;
        _932 = _942;
    }
    bool _944 = _932;
    if (!_852)
    {
        _900 = _838;
    }
    float _946 = _900;
    float _948 = 1.0 / _940;
    float _950 = _946;
    if (_852)
    {
        float _952 = _944 ? as_type<float>(_914) : _838;
        _950 = _952;
    }
    float _954 = _950;
    float _956 = _858 * _866;
    float _958 = in.m_51.y;
    float _960 = _858 * _876;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _964 = _962 != 0;
    float _966 = 1.0 / _884;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _968;
    float _972 = _858 * _890;
    float _974 = fma(_856, _864, _956);
    float _976 = fma(_856, _874, _960);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _980 = _836 + _978;
    float _982 = -_904;
    float _984 = _982 + 1.0;
    float _986 = fma(_856, _888, _972);
    float _988 = 1.0 / _970;
    float _990 = fma(_860, _878, _976);
    bool _992 = _930 > 0.5;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _996 = _836 + _994;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1000 = _998 != 0;
    float _1002 = fma(_860, _868, _974);
    int _1004 = _992 ? as_type<int>(_984) : as_type<int>(_904);
    float _1006 = _980 * _948;
    float _1008 = _996 * _966;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1012 = _836 + _1010;
    float _1014 = _958 * 2.0;
    float _1016 = _1000 ? as_type<float>(_1004) : _904;
    float _1018 = fma(_860, _892, _986);
    bool _1020 = _958 > 0.5;
    float _1022 = floor(_1014);
    float _1024 = _1012 * _988;
    float _1026 = _160 + _848;
    float _1028 = _904;
    if (_964)
    {
        float _1030 = _1020 ? _984 : _904;
        _1028 = _1030;
    }
    float _1032 = _1028;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1036 = 1.0 + _1034;
    bool _1038 = _862 > 0.0;
    float _1040 = _1026 + (-1.0);
    bool _1042 = _862 >= 0.0;
    bool _1044 = isnan(_862);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = -_916;
    float _1054 = _1052 + 1.0;
    float _1056 = _848 * 2.0;
    float _1058 = 1.0 / _1036;
    float _1060 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1062 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1064 = isnan(1.0);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1070 = _1066 || _1068;
    float _1072 = _958 + _848;
    bool _1074 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1076 = isnan(0.0);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1082 = _1078 || _1080;
    float _1084 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1086 = floor(_1056);
    float _1088 = _1072 + (-1.0);
    int _1090 = _1050 ? 0 : 1;
    float _1092 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1094 = _1082 ? _1054 : 0.0;
    float _1096 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1098 = _1022 > 0.0;
    float _1100 = _848 + (-0.5);
    bool _1102 = _1022 >= 0.0;
    bool _1104 = isnan(_1022);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.0);
    bool _1110 = _1106 || _1108;
    float _1112 = _1060;
    if (_1070)
    {
        float _1114 = _1094 * _1058;
        _140 = _1114;
    }
    float _1116 = _140;
    int _1118 = ~_1090;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1124;
    int _1128 = _1122;
    if (!_1038)
    {
        int _1130 = ~_1090;
        int _1132 = _1130 + 1;
        _1128 = _1132;
    }
    int _1134 = _1128;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1136;
    bool _1140 = _1086 > 0.0;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1142;
    bool _1146 = _1086 >= 0.0;
    bool _1148 = isnan(_1086);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    float _1156 = fma(_1138, _1006, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1158 = fma(_1126, _1006, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1172 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1174 = isnan(_836);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = fma(_1144, _1006, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1186 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1188 = isnan(_836);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = fma(_1162, _1008, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1200 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1202 = isnan(_836);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = fma(_1166, _1008, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1214 = fma(_1170, _1008, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1216 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1218 = isnan(_836);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = -_1182;
    float _1230 = _1228 + 1.0;
    float _1232 = -_1196;
    float _1234 = _1232 + 1.0;
    float _1236 = _1226 * _1230;
    float _1238 = -_1226;
    float _1240 = _1238 + 1.0;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1242;
    float _1246 = _1182 * _1234;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1252;
    float _1256 = _1210 * _1240;
    float _1258 = fma(_1244, _1024, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1260 = fma(_1250, _1024, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1262 = fma(_1254, _1024, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1264 = !_924;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = _1156 * _1256;
    float _1270 = _1184 * _1256;
    float _1272 = -_1210;
    float _1274 = _1272 + 1.0;
    float _1276 = _1158 * _1256;
    int _1278 = abs(_1266);
    float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1268);
    float _1284 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1270);
    float _1286 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1276);
    float _1288 = fma(_1198, _1236, _1282);
    float _1290 = float(_1134);
    float _1292 = fma(_1212, _1236, _1284);
    float _1294 = float(_1278);
    float _1296 = fma(_1214, _1236, _1286);
    int _1298 = _1110 ? 0 : 1;
    float _1300 = fma(_1258, _1246, _1288);
    float _1302 = fma(_1260, _1246, _1292);
    float _1304 = _1294 * _1290;
    float _1306 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1308 = ~_1298;
    int _1310 = _1308 + 1;
    int _1312 = _1310 + 1;
    float _1314 = fma(_1262, _1246, _1296);
    int _1316 = _1312;
    int _1318 = as_type<int>(_1300);
    if (!_1098)
    {
        int _1320 = ~_1298;
        int _1322 = _1320 + 1;
        _1316 = _1322;
    }
    int _1324 = _1316;
    float _1326 = _1306 * _1280;
    bool _1328 = !_928;
    int _1330 = _1328 ? 0 : 1;
    float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1334 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1336 = _990 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1338 = abs(_1330);
    float _1340 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1342 = in.m_65.x;
    float _1344 = in.m_65.y;
    float _1346 = in.m_65.z;
    bool _1348 = !_920;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1354 = _1336 + _1352;
    int _1356 = _1154 ? 0 : 1;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1360 = _1092 + _1358;
    int _1362 = abs(_1350);
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1368 = _1060 + _1366;
    int _1370 = ~_1356;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = _954 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1378 = _1374;
    float _1380 = _1326;
    if (!_1140)
    {
        int _1382 = ~_1356;
        int _1384 = _1382 + 1;
        _1378 = _1384;
    }
    int _1386 = _1378;
    float _1388 = _1340 * _1332;
    float _1390 = float(_1338);
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1394 = float(_1324);
    float _1396 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1364);
    float _1398 = float(_1362);
    float _1400 = _1334 * _886;
    float _1402 = float(_1386);
    float _1404 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1396);
    float _1406 = _1390 * _1394;
    float _1408 = _1304 * (-2.0);
    float _1410 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1302);
    float _1412 = _1398 * _1402;
    bool _1414 = _1404 >= 0.0;
    float _1416 = fma(_1096, _1408, _1096);
    float _1418 = fma(_1408, _1344, _1344);
    float _1420 = _958 + (-0.5);
    float _1422 = _1354 * _1354;
    float _1424 = _1376 * _1392;
    float _1426 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1314);
    float _1428 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1418);
    float _1430 = fma(_1368, _1368, _1422);
    float _1432 = _1406 * (-2.0);
    out.m_67.x = _1388;
    out.m_67.y = _1326;
    out.m_67.z = _1424;
    out.m_67.w = _1400;
    float _1434 = fma(_1416, _1116, _1428);
    float _1436 = fma(_1360, _1360, _1430);
    float _1438 = fma(_1432, _1346, _1346);
    float _1440 = fma(_1084, _1432, _1084);
    if (_1414)
    {
        out.m_47.x = 0.0;
    }
    float _1442 = rsqrt(_1436);
    float _1444 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1438);
    float _1446 = _1434 * 0.15915493667125701904296875;
    float _1448 = fma(_1440, _1116, _1444);
    float _1450 = _1448;
    if (_1414)
    {
        _1380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1452 = _1380;
    float _1454 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1300);
    float _1456 = _1426 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1414)
    {
        float _1458 = _1452 * 5.0;
        _1318 = as_type<int>(_1458);
    }
    int _1460 = _1318;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1464 = _1410 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1468 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1414)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5184 = as_type<float>(_1460);
        out.gl_Position.z = _5184;
    }
    float _1474 = _1354 * _1442;
    float _1476 = _1368 * _1442;
    out.m_69.x = _1470;
    out.m_69.y = _1472;
    out.m_69.z = _1468;
    out.m_69.w = _1466;
    if (_1414)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1478 = -_1474;
    float _1480 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1336);
    float _1482 = _1360 * _1442;
    float _1484 = -_1476;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1060);
    float _1488 = _160 + _958;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1492 = _1480 + _1490;
    float _1494 = -_1482;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1092);
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1500 = _1486 + _1498;
    float _1502 = _1488 + (-1.0);
    float _1504 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1508 = _1496 + _1506;
    float _1510 = _1412 * (-2.0);
    float _1512 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1514 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1504);
    float _1516 = _160 + (-0.5);
    float _1518 = fma(_1510, _1342, _1342);
    float _1520 = -_1474;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1354);
    float _1524 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1514);
    float _1526 = fma(_1512, _1510, _1512);
    float _1528 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1518);
    float _1530 = -_1476;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1368);
    float _1534 = _1522 * _1522;
    bool _1536 = _1524 >= 0.0;
    float _1538 = fma(_1526, _1116, _1528);
    float _1540 = -_1482;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1360);
    float _1544 = fma(_1532, _1532, _1534);
    float _1546 = _1448 * 0.15915493667125701904296875;
    float _1548 = _1538 * 0.15915493667125701904296875;
    float _1550 = _1446 * 6.283185482025146484375;
    float _1552 = sin(_1550);
    float _1554 = fma(_1542, _1542, _1544);
    if (_1536)
    {
        _1450 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1556 = _1450;
    float _1558 = _1446 * 6.283185482025146484375;
    float _1560 = cos(_1558);
    int _1562 = as_type<int>(_1556);
    if (_1536)
    {
        out.m_47.x = 0.0;
    }
    if (_1536)
    {
        float _1564 = _1556 * 5.0;
        _1562 = as_type<int>(_1564);
    }
    int _1566 = _1562;
    float _1568 = _1546 * 6.283185482025146484375;
    float _1570 = sin(_1568);
    if (_1536)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5368 = as_type<float>(_1566);
        out.gl_Position.z = _5368;
    }
    float _1572 = _1546 * 6.283185482025146484375;
    float _1574 = cos(_1572);
    float _1576 = _1548 * 6.283185482025146484375;
    float _1578 = sin(_1576);
    float _1580 = sqrt(_1554);
    if (_1536)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1582 = -_1336;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1586 = -_1060;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1590 = _1548 * 6.283185482025146484375;
    float _1592 = cos(_1590);
    float _1594 = -_1092;
    float _1596 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1598 = _1584 * _1584;
    float _1600 = _1560 * _1574;
    float _1602 = _1552 * _1570;
    float _1604 = _1442 * _1580;
    float _1606 = fma(_1588, _1588, _1598);
    float _1608 = _1560 * _1570;
    float _1610 = fma(_1578, _1602, _1600);
    float _1612 = fma(_1578, _1600, _1602);
    float _1614 = fma(_1596, _1596, _1606);
    float _1616 = _1552 * _1574;
    float _1618 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1620 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1622 = precise::clamp(_1620, 0.0, 1.0);
    float _1624 = rsqrt(_1614);
    float _1626 = _1570 * _1592;
    float _1628 = _1574 * _1592;
    float _1630 = _1552 * _1592;
    float _1632 = _1560 * _1592;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1634;
    float _1638 = in.m_71.x;
    float _1640 = in.m_71.y;
    float _1642 = in.m_71.z;
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1646 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1644;
    float _1648 = _1636 * _1636;
    float _1650 = -_1616;
    float _1652 = fma(_1578, _1608, _1650);
    float _1654 = -_1608;
    float _1656 = fma(_1578, _1616, _1654);
    float _1658 = _1604 * _1618;
    float _1660 = fma(_1622, -0.64999997615814208984375, 1.0);
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1664 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1662;
    float _1666 = _1588 * _1624;
    float _1668 = _1596 * _1624;
    float _1670 = _1584 * _1624;
    float _1672 = fma(_1646, _1646, _1648);
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1676 = _1666 * _1674;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1680 = _1668 * _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1684 = _1670 * _1682;
    float _1686 = fma(_1664, _1664, _1672);
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1690 = -_1676;
    float _1692 = fma(_1668, _1688, _1690);
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1696 = -_1680;
    float _1698 = fma(_1670, _1694, _1696);
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1702 = -_1684;
    float _1704 = fma(_1666, _1700, _1702);
    float _1706 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1708 = _1692 * _1692;
    float _1710 = rsqrt(_1686);
    float _1712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1638);
    float _1714 = _1604 * _1706;
    float _1716 = fma(_1698, _1698, _1708);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1640);
    float _1720 = _1712 * _1658;
    float _1722 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1724 = fma(_1704, _1704, _1716);
    float _1726 = sqrt(_1686);
    float _1728 = _1718 * _1714;
    float _1730 = _1604 * _1722;
    float _1732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1642);
    bool _1734 = _1640 != 0.0;
    bool _1736 = isnan(_1640);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = _1628 * _1728;
    float _1746 = _1612 * _1728;
    float _1748 = _1732 * _1730;
    float _1750 = rsqrt(_1724);
    float _1752 = _1656 * _1728;
    float _1754 = _1710 * (-0.20000000298023223876953125);
    float _1756 = fma(_1626, _1720, _1744);
    float _1758 = fma(_1652, _1720, _1746);
    float _1760 = fma(_1610, _1720, _1752);
    float _1762 = fma(_1646, _1754, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1764 = _1638 == 0.0;
    bool _1766 = !_1742;
    bool _1768 = _1764 && _1766;
    float _1770 = _1726 * 0.066666670143604278564453125;
    float _1772 = fma(_1630, _1748, _1760);
    float _1774 = fma(_1636, _1754, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1776 = -_1578;
    float _1778 = fma(_1776, _1748, _1756);
    float _1780 = fma(_1632, _1748, _1758);
    float _1782 = fma(_1664, _1754, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1784 = -_1774;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1788 = precise::max(_1770, 1.0);
    float _1790 = _1704 * _1750;
    float _1792 = _1692 * _1750;
    float _1794 = _1698 * _1750;
    float _1796 = _1786 * _1786;
    float _1798 = _1666 * _1790;
    float _1800 = _1668 * _1792;
    float _1802 = precise::min(_1788, 2.0);
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1806 = _1774 + _1804;
    float _1808 = -_1798;
    float _1810 = fma(_1668, _1794, _1808);
    float _1812 = _1670 * _1794;
    float _1814 = -_1800;
    float _1816 = fma(_1670, _1790, _1814);
    float _1818 = _1802 * _1660;
    float _1820 = _1810 * _1778;
    float _1822 = -_1812;
    float _1824 = fma(_1666, _1792, _1822);
    float _1826 = _1816 * _1778;
    float _1828 = -_1762;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1832 = fma(_1792, _1772, _1820);
    float _1834 = _1824 * _1778;
    float _1836 = fma(_1794, _1772, _1826);
    bool _1838 = _1642 == 0.0;
    bool _1840 = _1838 && _1768;
    float _1842 = fma(_1670, _1780, _1832);
    float _1844 = fma(_1790, _1772, _1834);
    float _1846 = fma(_1666, _1780, _1836);
    float _1848 = fma(_1830, _1830, _1796);
    float _1850 = _1336 + _1842;
    float _1852 = -_1782;
    float _1854 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1060 + _1846;
    float _1858 = in.m_73.x;
    float _1860 = in.m_73.y;
    float _1862 = in.m_73.z;
    float _1864 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1866 = _1850 + _1864;
    float _1868 = fma(_1668, _1780, _1844);
    float _1870 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1872 = _1856 + _1870;
    float _1874 = fma(_1854, _1854, _1848);
    float _1876 = fma(_1866, _1818, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1878 = _1092 + _1868;
    float _1880 = fma(_1872, _1818, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1884 = _1762 + _1882;
    float _1886 = -_1876;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1890 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1892 = _1878 + _1890;
    float _1894 = -_1880;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1898 = _1806 * _1806;
    float _1900 = _1888 * _1888;
    float _1902 = fma(_1892, _1818, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1906 = _1782 + _1904;
    float _1908 = fma(_1884, _1884, _1898);
    float _1910 = fma(_1896, _1896, _1900);
    float _1912 = -_1902;
    float _1914 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1916 = in.m_75.x;
    float _1918 = in.m_75.y;
    float _1920 = in.m_75.z;
    float _1922 = in.m_75.w;
    float _1924 = fma(_1906, _1906, _1908);
    float _1926 = sqrt(_1874);
    float _1928 = fma(_1914, _1914, _1910);
    float _1930 = _1626 * _1810;
    float _1932 = _1910;
    float _1934 = _1908;
    float _1936 = _1914;
    float _1938 = _1858;
    float _1940 = _1612;
    if (_1840)
    {
        _1932 = _1858;
    }
    float _1942 = _1932;
    float _1944 = _1626 * _1824;
    float _1946 = _1942;
    if (_1840)
    {
        _1934 = _1862;
    }
    float _1948 = _1934;
    float _1950 = _1948;
    if (!_1840)
    {
        float _1952 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1862);
        _1950 = _1952;
    }
    float _1954 = _1950;
    if (_1840)
    {
        _1936 = _1942;
    }
    float _1956 = _1936;
    float _1958 = sqrt(_1928);
    float _1960 = _1956;
    if (!_1840)
    {
        _1946 = _1858;
    }
    float _1962 = _1946;
    float _1964 = fma(_1610, _1790, _1944);
    if (_1840)
    {
        _1938 = _1860;
    }
    float _1966 = _1938;
    float _1968 = _1966;
    if (!_1840)
    {
        float _1970 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1860);
        _1968 = _1970;
    }
    float _1972 = _1968;
    if (!_1840)
    {
        float _1974 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1962);
        _1960 = _1974;
    }
    float _1976 = _1960;
    float _1978 = rsqrt(_1924);
    float _1980 = _1920 * _1962;
    float _1982 = _1918 * _1862;
    float _1984 = -_1926;
    float _1986 = _1958 + _1984;
    float _1988 = _1916 * _1860;
    float _1990 = -_1980;
    float _1992 = fma(_1916, _1862, _1990);
    float _1994 = -_1982;
    float _1996 = fma(_1920, _1860, _1994);
    float _1998 = _1628 * _1824;
    float _2000 = -_1988;
    float _2002 = fma(_1918, _1962, _2000);
    float _2004 = _1992 * _1922;
    float _2006 = _1996 * _1922;
    float _2008 = _1978 * _1986;
    float _2010 = _2002 * _1922;
    float _2012 = _1626 * _1816;
    float _2014 = _1628 * _1816;
    float _2016 = -_2008;
    float _2018 = fma(_1884, _2016, _1880);
    float _2020 = -_2008;
    float _2022 = fma(_1906, _2020, _1902);
    float _2024 = _1628 * _1810;
    float _2026 = -_1816;
    float _2028 = _1578 * _2026;
    float _2030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2032 = _2018 + _2030;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2036 = _2022 + _2034;
    float _2038 = -_1810;
    float _2040 = _1578 * _2038;
    float _2042 = -_1824;
    float _2044 = _1578 * _2042;
    float _2046 = _2032 * _2032;
    float _2048 = _2036 * _2036;
    float _2050 = fma(_1656, _1794, _2014);
    float _2052 = fma(_1656, _1792, _2024);
    float _2054 = fma(_1656, _1790, _1998);
    float _2056 = _2046 + _2048;
    float _2058 = fma(_1610, _1794, _2012);
    float _2060 = fma(_1610, _1792, _1930);
    float _2062 = fma(_1630, _1790, _2044);
    float _2064 = sqrt(_2056);
    float _2066 = fma(_1630, _1794, _2028);
    float _2068 = fma(_1630, _1792, _2040);
    float _2070 = fma(_1612, _1666, _2050);
    float _2072 = fma(_1612, _1670, _2052);
    float _2074 = fma(_1612, _1668, _2054);
    float _2076 = fma(_1652, _1666, _2058);
    float _2078 = fma(_1652, _1670, _2060);
    float _2080 = fma(_1652, _1668, _1964);
    float _2082 = fma(_1632, _1668, _2062);
    float _2084 = fma(_1632, _1666, _2066);
    float _2086 = fma(_1632, _1670, _2068);
    float _2088 = _2070 * _1918;
    float _2090 = _2072 * _1918;
    float _2092 = _2074 * _1918;
    float _2094 = _2070 * _1972;
    bool _2096 = _2064 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2098 = _2004 * _2070;
    float _2100 = _2072 * _1972;
    float _2102 = _2004 * _2072;
    float _2104 = _2074 * _1972;
    float _2106 = _2004 * _2074;
    float _2108 = -_2008;
    float _2110 = fma(_1806, _2108, _1876);
    float _2112 = _2110;
    float _2114 = _2046;
    float _2116 = _2048;
    float _2118 = _2022;
    float _2120 = _2010;
    if (!_2096)
    {
        _1940 = _2018;
    }
    float _2122 = _1940;
    bool _2124 = !_2096;
    float _2126 = _2122;
    if (!_2124)
    {
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2132 = _2064 + _2130;
        float _2134 = rsqrt(_2056);
        float _2136 = _2132 * _2128;
        float _2138 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2140 = _2136 * 0.15915493667125701904296875;
        float _2142 = _2140 * 6.283185482025146484375;
        float _2144 = sin(_2142);
        float _2146 = _2140 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = fma(_2144, _2138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2152 = _2134 * _2150;
        float _2154 = fma(_2032, _2152, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2156 = _2148 + (-1.0);
        float _2158 = fma(_2036, _2152, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2162 = _2154 + _2160;
        float _2164 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2168 = _2158 + _2166;
        float _2170 = _2162 * _2162;
        float _2172 = fma(_2110, _2148, _2164);
        float _2174 = _2168 * _2168;
        _2112 = _2172;
        _2114 = _2170;
        _2116 = _2174;
        _2126 = _2154;
        _2118 = _2158;
    }
    float _2176 = _2112;
    float _2178 = _2114;
    float _2180 = _2116;
    float _2182 = _2126;
    float _2184 = _2118;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2188 = _2176 + _2186;
    float _2190 = fma(_2076, _1976, _2094);
    float _2192 = fma(_2076, _1916, _2088);
    float _2194 = fma(_2078, _1916, _2090);
    float _2196 = fma(_2188, _2188, _2178);
    float _2198 = fma(_2078, _1976, _2100);
    float _2200 = fma(_2080, _1976, _2104);
    float _2202 = fma(_2006, _2076, _2098);
    float _2204 = _2196 + _2180;
    float _2206 = fma(_2080, _1916, _2092);
    float _2208 = fma(_2006, _2078, _2102);
    float _2210 = fma(_2006, _2080, _2106);
    float _2212 = fma(_2084, _1920, _2192);
    float _2214 = fma(_2086, _1920, _2194);
    float _2216 = sqrt(_2204);
    float _2218 = fma(_2084, _1954, _2190);
    float _2220 = fma(_2010, _2084, _2202);
    float _2222 = fma(_2086, _1954, _2198);
    float _2224 = fma(_2010, _2086, _2208);
    float _2226 = fma(_2010, _2082, _2210);
    float _2228 = fma(_2082, _1954, _2200);
    float _2230 = fma(_2082, _1920, _2206);
    out.m_55.x = _788;
    out.m_55.y = _804;
    out.m_55.z = _806;
    out.m_55.w = _808;
    out.m_69.x = _1470;
    out.m_69.y = _1472;
    out.m_69.z = _1468;
    out.m_69.w = _1466;
    out.m_77.x = _2220;
    out.m_77.y = _2224;
    out.m_77.z = _2226;
    bool _2232 = _2216 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2234 = isnan(_2216);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2240 = _2236 || _2238;
    out.m_79.x = _2218;
    out.m_79.y = _2222;
    out.m_79.z = _2228;
    out.m_81.x = _2212;
    out.m_81.y = _2214;
    out.m_81.z = _2230;
    float _2242 = _2230;
    float _2244 = _2220;
    float _2246 = _2224;
    if (!_2240)
    {
        _2120 = 1.0;
    }
    float _2248 = _2120;
    bool _2250 = !_2240;
    float _2252 = _2248;
    if (!_2250)
    {
        bool _2254 = _2216 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2256 = isnan(_2216);
        bool _2258 = _2254 || _2256;
        bool _2260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2262 = _2258 || _2260;
        if (!_2262)
        {
            float _2264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2266 = _2216 + _2264;
            float _2268 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2270 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2268;
            float _2272 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2274 = _2272 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2276 = 1.0 / _2270;
            float _2278 = _2266 * _2276;
            float _2280 = fma(_2278, _2274, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2252 = _2280;
            _2282 = true;
        }
        else
        {
            bool _2284 = _2216 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2286 = isnan(_2216);
            bool _2288 = _2284 || _2286;
            bool _2290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2292 = _2288 || _2290;
            if (!_2292)
            {
                float _2294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2296 = _2216 + _2294;
                float _2298 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2300 = _2298 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2302 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2304 = _2302 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2306 = 1.0 / _2300;
                float _2308 = _2296 * _2306;
                float _2310 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2252 = _2310;
                _2282 = true;
            }
            else
            {
                _2252 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2282 = false;
    float _2312 = _2252;
    float _2314 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2316 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2318 = _2182 + _2316;
    float _2320 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2314);
    float _2322 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2324 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2326 = _2176 + _2324;
    float _2328 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2320);
    bool _2330 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2332 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan(0.5);
    bool _2338 = _2334 || _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2342 = _2184 + _2340;
    bool _2344 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2346 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan(0.5);
    bool _2352 = _2348 || _2350;
    float _2354 = _2328 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2356 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2322);
    float _2358 = fma(_2326, _2312, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2360 = fma(_2342, _2312, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2362 = 1.0 / _2354;
    float _2364 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2368 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2352)
    {
        _2368 = 1.0;
    }
    float _2370 = _2368;
    float _2372 = _2366 + _2354;
    float _2374 = -_1474;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2358);
    float _2378 = _2372 * _2362;
    float _2380 = _2378 * 0.5;
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2384 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2382);
    float _2386 = fma(_2318, _2312, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2388 = -_1482;
    float _2390 = fma(_2388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2360);
    float _2392 = 1.0 / _2384;
    float _2394 = -_1476;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2386);
    float _2398 = _2376;
    float _2400 = _2396;
    float _2402 = _2390;
    float _2404 = _2386;
    float _2406 = _2370;
    if (!_2338)
    {
        float _2408 = _1492 * _1492;
        float _2410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2412 = -_1092;
        float _2414 = _2412 + _2360;
        float _2416 = -_1336;
        float _2418 = _2416 + _2358;
        float _2420 = fma(_1500, _1500, _2408);
        float _2422 = fma(_1508, _1508, _2420);
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2426 = sqrt(_2422);
        float _2428 = 1.0 / _1604;
        float _2430 = precise::min(_2426, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2432 = _2430 * _2410;
        float _2434 = _2424 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2436 = _2432 * _2428;
        float _2438 = -_1060;
        float _2440 = _2438 + _2386;
        float _2442 = _2434 * _2436;
        float _2444 = _2414 * _2436;
        float _2446 = fma(_2440, _2442, _1486);
        float _2448 = fma(_2418, _2442, _1480);
        float _2450 = fma(_2434, _2444, _1496);
        _2398 = _2448;
        _2400 = _2446;
        _2402 = _2450;
    }
    float _2452 = _2398;
    float _2454 = _2400;
    float _2456 = _2402;
    if (_2352)
    {
        _2404 = 1.0;
    }
    float _2458 = _2404;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2462 = _2392 * _2460;
    float _2464 = _2458;
    if (!_2352)
    {
        float _2466 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2470 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2468;
        float _2472 = _2466 * 0.15915493667125701904296875;
        float _2474 = _2472 * 6.283185482025146484375;
        float _2476 = cos(_2474);
        float _2478 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2480 = _2478 * 0.15915493667125701904296875;
        float _2482 = _2472 * 6.283185482025146484375;
        float _2484 = sin(_2482);
        float _2486 = 1.0 / _2476;
        float _2488 = _2480 * 6.283185482025146484375;
        float _2490 = cos(_2488);
        float _2492 = _2484 * _2486;
        float _2494 = _2480 * 6.283185482025146484375;
        float _2496 = sin(_2494);
        float _2498 = _2490 * _2492;
        float _2500 = 1.0 / _2470;
        float _2502 = 1.0 / _2498;
        float _2504 = _2496 * _2502;
        float _2506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2508 = fma(_2462, _2504, _2506);
        float _2510 = _2508 * _2500;
        float _2512 = precise::clamp(_2510, 0.0, 1.0);
        _2242 = _2500;
        _2406 = _2512;
    }
    float _2514 = _2242;
    float _2516 = _2406;
    float _2518 = _2514;
    if (!_2352)
    {
        float _2520 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2522 = _2520 * 0.15915493667125701904296875;
        float _2524 = _2522 * 6.283185482025146484375;
        float _2526 = cos(_2524);
        float _2528 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2530 = _2528 * 0.15915493667125701904296875;
        float _2532 = _2522 * 6.283185482025146484375;
        float _2534 = sin(_2532);
        float _2536 = 1.0 / _2526;
        float _2538 = _2530 * 6.283185482025146484375;
        float _2540 = cos(_2538);
        float _2542 = _2534 * _2536;
        float _2544 = _2530 * 6.283185482025146484375;
        float _2546 = sin(_2544);
        float _2548 = _2540 * _2542;
        float _2550 = 1.0 / _2548;
        float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2554 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2552;
        float _2556 = 1.0 / _2554;
        float _2558 = _2546 * _2550;
        float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2562 = fma(_2462, _2558, _2560);
        float _2564 = _2562 * _2556;
        float _2566 = precise::clamp(_2564, 0.0, 1.0);
        float _2568 = -_2566;
        float _2570 = _2568 + 1.0;
        _2518 = _2526;
        _2464 = _2570;
    }
    float _2572 = _2518;
    float _2574 = _2464;
    float _2576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2578 = _2452 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2582 = _2454 + _2580;
    float _2584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2586 = _2456 + _2584;
    float _2588 = _2578 * _2578;
    float _2590 = fma(_2582, _2582, _2588);
    float _2592 = fma(_2586, _2586, _2590);
    float _2594 = rsqrt(_2592);
    float _2596 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2598 = _2582 * _2596;
    float _2600 = _2586 * _2596;
    float _2602 = _2598 * _2598;
    float _2604 = _2600 * _2600;
    float _2606 = _2602 + _2604;
    float _2608 = sqrt(_2606);
    bool _2610 = _2608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2614 = _2608 + _2612;
    float _2616 = _2586;
    float _2618 = _2606;
    float _2620 = _2614;
    float _2622 = _2598;
    if (_2610)
    {
        float _2624 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2616 = _2624;
    }
    float _2626 = _2616;
    if (_2610)
    {
        float _2628 = rsqrt(_2606);
        _2618 = _2628;
    }
    float _2630 = _2618;
    float _2632 = _2630;
    if (_2610)
    {
        float _2634 = _2614 * _2626;
        _2620 = _2634;
    }
    float _2636 = _2620;
    if (_2610)
    {
        float _2638 = _2636 * 0.15915493667125701904296875;
        _2244 = _2638;
    }
    float _2640 = _2244;
    float _2642 = _2594;
    if (_2610)
    {
        float _2644 = _2640 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        _2642 = _2646;
    }
    float _2648 = _2642;
    float _2650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2652 = precise::max(0.0, _2650);
    float _2654 = _2572;
    float _2656 = _2652;
    float _2658 = _2650;
    if (_2610)
    {
        float _2660 = _2640 * 6.283185482025146484375;
        float _2662 = cos(_2660);
        _2654 = _2662;
    }
    float _2664 = _2654;
    float _2666 = -_2596;
    float _2668 = -_2652;
    float _2670 = fma(_2578, _2666, _2668);
    if (_2610)
    {
        float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2656 = _2672;
    }
    float _2674 = _2656;
    float _2676 = sqrt(_2592);
    float _2678 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2680 = _2648;
    float _2682 = _2674;
    if (_2610)
    {
        float _2684 = fma(_2648, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2680 = _2684;
    }
    float _2686 = _2680;
    float _2688 = _2686;
    if (!_2610)
    {
        _2682 = _2600;
    }
    float _2690 = _2682;
    float _2692 = _2690;
    if (_2610)
    {
        float _2694 = _2664 + (-1.0);
        _2658 = _2694;
    }
    float _2696 = _2658;
    float _2698 = _2696;
    if (_2610)
    {
        float _2700 = _2630 * _2686;
        _1112 = _2700;
    }
    float _2702 = _1112;
    if (!_2610)
    {
        _2688 = _2670;
    }
    float _2704 = _2688;
    float _2706 = _2704;
    if (_2610)
    {
        float _2708 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2246 = _2708;
    }
    float _2710 = _2246;
    if (_2610)
    {
        float _2712 = _2598 * _2702;
        _2622 = _2712;
    }
    float _2714 = _2622;
    if (!_2610)
    {
        _2632 = _2602;
    }
    float _2716 = _2632;
    float _2718 = _2716;
    if (_2610)
    {
        float _2720 = _2600 * _2702;
        _2692 = _2720;
    }
    float _2722 = _2692;
    if (_2610)
    {
        float _2724 = fma(_2670, _2664, _2710);
        _2706 = _2724;
    }
    float _2726 = _2706;
    if (_2610)
    {
        float _2728 = _2714 * _2714;
        _2718 = _2728;
    }
    float _2730 = _2718;
    if (!_2610)
    {
        _2698 = _2604;
    }
    float _2732 = _2698;
    float _2734 = _2732;
    if (_2610)
    {
        float _2736 = _2722 * _2722;
        _2734 = _2736;
    }
    float _2738 = _2734;
    float _2740 = fma(_2726, _2726, _2730);
    float _2742 = _2740 + _2738;
    float _2744 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2748 = fma(_2676, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2746);
    float _2750 = precise::clamp(_2748, 0.0, 1.0);
    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2754 = rsqrt(_2742);
    float _2756 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2744);
    float _2758 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2760 = -_2750;
    float _2762 = _2760 + 1.0;
    float _2764 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2766 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2756);
    float _2768 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2758);
    float _2770 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2764);
    float _2772 = _2766 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2774 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2768);
    float _2776 = abs(_2762);
    float _2778 = log2(_2776);
    float _2780 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2770);
    float _2782 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2678);
    float _2784 = _2774 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2786 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2788 = _2754 * _2714;
    float _2790 = _2780 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2792 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2794 = _2754 * _2726;
    float _2796 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2798 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2782);
    float _2800 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2792);
    float _2802 = _2754 * _2722;
    float _2804 = -_2796;
    float _2806 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2804);
    float _2808 = _2798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2810 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2800);
    float _2812 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2814 = -_2802;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2806);
    float _2818 = -_2786;
    float _2820 = fma(_2818, _2752, 1.0);
    float _2822 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2810);
    float _2824 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2826 = fma(_2816, -0.5, 0.5);
    float _2828 = exp2(_2812);
    float _2830 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2832 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2824);
    float _2834 = fma(_2816, 0.5, 0.5);
    float _2836 = _2794 + 1.0;
    float _2838 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2830);
    float _2840 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2832);
    float _2842 = fma(_2834, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2844 = log2(_2820);
    float _2846 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2838);
    float _2848 = fma(_2834, _2842, -0.212114393711090087890625);
    float _2850 = fma(_2834, _2848, 1.570728778839111328125);
    float _2852 = 1.0 / _2822;
    float _2854 = -_2794;
    float _2856 = fma(_2828, _2836, _2854);
    float _2858 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2840);
    float _2860 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2846);
    float _2862 = fma(_2856, 0.5, 0.5);
    float _2864 = sqrt(_2826);
    float _2866 = _2844 * 0.693147182464599609375;
    float _2868 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2870 = _2858 * _2852;
    float _2872 = _2860 * _2852;
    float _2874 = fma(_2870, 0.5, 0.5);
    float _2876 = fma(_2872, -0.5, 0.5);
    float _2878 = _2864 * 0.636619746685028076171875;
    float _2880 = -_2850;
    float _2882 = fma(_2878, _2880, 1.0);
    float3 _7476 = float3(_2874, _2876, _2868);
    float _2884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7476, float3(0.0), isnan(_7476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7476, float3(0.0), isnan(_7476)), level(0.0)).x;
    float3 _7487 = float3(_2874, _2876, _2868);
    float4 _2887 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7487, float3(0.0), isnan(_7487)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7487, float3(0.0), isnan(_7487)), level(0.0)).xyzw;
    float _2889 = _2887.x;
    float _2891 = _2887.y;
    float _2893 = _2887.z;
    float _2895 = _2887.w;
    float2 _7504 = float2(_2882, _2862);
    float3 _2899 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7504, float2(0.0), isnan(_7504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7504, float2(0.0), isnan(_7504)), level(0.0)).xyz;
    float _2901 = _2899.x;
    float _2903 = _2899.y;
    float _2905 = _2899.z;
    float _2907 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2909 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2911 = _2516 * _2574;
    bool _2913 = _2516 > 0.0;
    bool _2915 = isnan(_2516);
    bool _2917 = _2913 || _2915;
    bool _2919 = isnan(0.0);
    bool _2921 = _2917 || _2919;
    float _2923 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2909);
    float _2925 = exp2(_2907);
    float _2927 = _2911 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2929 = _2574 <= 0.0;
    bool _2931 = !_2921;
    bool _2933 = _2929 || _2931;
    float _2935 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2923);
    float _2937 = _2822 * 0.5;
    float _2939 = _248 * _2927;
    float _2941 = _2858 + _2822;
    float _2943 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2935);
    float _2945 = fma(_2860, -0.5, _2937);
    float _2947 = _2941 * 0.5;
    float _2949 = _2943 + _2822;
    out.gl_Position.x = _2858;
    out.gl_Position.y = _2860;
    out.gl_Position.z = _2943;
    out.gl_Position.w = _2822;
    float _2951 = _2939 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2953 = _2949 * 0.5;
    float _2955 = -_2925;
    float _2957 = _2955 + 1.0;
    out.m_47.x = _2951;
    float _2959 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2947;
    out.m_83.y = _2945;
    out.m_83.z = _2953;
    out.m_83.w = _2822;
    float _2961 = -_2959;
    float _2963 = _2961 + 1.0;
    float _2965 = _2959 * _2884;
    float _2967 = _2895 * _2963;
    float _2969 = _2895 * _2965;
    float _2971 = _2905 * _2965;
    float _2973 = fma(_2901, _2969, _2889);
    float _2975 = fma(_2903, _2969, _2891);
    float _2977 = fma(_2895, _2971, _2893);
    out.m_85.x = _2973;
    out.m_85.y = _2975;
    out.m_85.z = _2977;
    out.m_85.w = _2967;
    if (!_2933)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2979 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2979;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2282 = false;
    bool _828 = false;
    bool _726 = false;
    bool _490 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3036 = as_type<float>(_120);
        out.gl_Position.z = _3036;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3106 = as_type<float>(_158);
        out.gl_Position.z = _3106;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    float _214 = float(_192);
    int _216 = abs(_212);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _222 = _208 < 0.5;
    float _224 = float(_222);
    float _226 = fma(_196, 0.5, 0.5);
    float _228 = abs(_220);
    float _230 = _214 * _228;
    float _232 = float(_204);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_216);
    float _244 = fma(_232, _240, _230);
    float _246 = abs(_236);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    bool _252 = _168;
    float _268;
    if (!_250)
    {
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _256 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_104);
        float _274 = 1.0 / _272;
        float _276 = _138 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _278 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = _278 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _278 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _300;
    float _304 = 1.0 / _294;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _308 = 1.0 / _302;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = 1.0 / _298;
    float _316 = _282 * _304;
    bool _318 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _320 = isnan(_278);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = fma(_312, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = fma(_332, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = _286 * _308;
    bool _340 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_278);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_328;
    float _354 = _352 + 1.0;
    float _356 = _350 * _354;
    bool _358 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_278);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _290 * _314;
    bool _372 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _374 = isnan(_278);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = -_350;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = fma(_386, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_382;
    float _400 = _398 + 1.0;
    float _402 = _382 * _390;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = _368 * _400;
    float _414 = -_368;
    float _416 = _414 + 1.0;
    float _418 = fma(_394, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_406, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = _334 * _412;
    float _424 = _336 * _412;
    float _426 = _396 * _412;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _422);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _432 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _434 = fma(_410, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _444;
    float _448 = fma(_418, _402, _428);
    float _450 = fma(_438, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_442, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _454 = fma(_446, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _456 = fma(_420, _402, _430);
    float _458 = fma(_434, _402, _432);
    float _460 = fma(_450, _356, _448);
    float _462 = fma(_452, _356, _456);
    float _464 = fma(_454, _356, _458);
    float _466 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].x, _460);
    float _468 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].y, _462);
    float _470 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].z, _464);
    bool _472 = !_306;
    float _488;
    if (!_472)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _476 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_104);
        float _494 = 1.0 / _492;
        float _496 = _138 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = in.m_53.x;
    float _502 = in.m_53.y;
    float _504 = in.m_53.z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _508 = _498 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _512 = _498 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = 1.0 / _516;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _530 = 1.0 / _524;
    float _532 = _470 * _504;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _536 = _498 + _534;
    float _538 = 1.0 / _520;
    float _540 = _508 * _526;
    bool _542 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _544 = isnan(_498);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = _468 * _502;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _556;
    float _560 = _466 * _500;
    float _562 = -_552;
    float _564 = _562 + 1.0;
    float _566 = _512 * _530;
    bool _568 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _570 = isnan(_498);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    bool _580 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _582 = isnan(_498);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _578 * _564;
    bool _594 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _596 = isnan(_498);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = _536 * _538;
    float _608 = -_590;
    float _610 = _608 + 1.0;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _612;
    float _616 = -_578;
    float _618 = _616 + 1.0;
    float _620 = fma(_558, _606, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _630 = _604 * _610;
    float _632 = fma(_614, _606, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _634 = fma(_624, _606, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _636 = _590 * _618;
    float _638 = _620 * _630;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _644 = _634 * _630;
    float _646 = _632 * _630;
    float _648 = -_604;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _656 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].x, _644);
    float _658 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].y, _638);
    float _660 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].z, _646);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _662;
    float _666 = fma(_628, _566, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _668 = fma(_654, _566, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _670 = fma(_642, _566, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _676;
    float _680 = fma(_666, _636, _656);
    float _682 = fma(_664, _540, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _684 = fma(_674, _540, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _686 = fma(_678, _540, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _688 = fma(_668, _636, _658);
    float _690 = fma(_670, _636, _660);
    float _692 = fma(_682, _592, _680);
    float _694 = fma(_684, _592, _688);
    float _696 = fma(_686, _592, _690);
    float _698 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].x, _692);
    float _700 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].y, _694);
    float _702 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].z, _696);
    bool _704 = !_528;
    int _706 = as_type<int>(_566);
    float _708 = _540;
    float _724;
    if (!_704)
    {
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _712 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        float _728 = float(_104);
        float _730 = 1.0 / _728;
        float _732 = _138 * _730;
        _724 = _732;
    }
    _726 = false;
    float _734 = _724;
    bool _736 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _738 = isnan(_734);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _752 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _754 = isnan(_734);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _770 = _734 + _768;
    float _772 = 1.0 / _750;
    float _774 = -_746;
    float _776 = _774 + 1.0;
    bool _778 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _780 = _762 * _776;
    float _782 = -_762;
    float _784 = _782 + 1.0;
    float _786 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _788 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _766 * _772;
    float _792 = fma(_790, _770, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _794 = _702 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = _792 * _780;
    float _798 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[115].x, _796);
    float _802 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[116].x, _800);
    float _804 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = _802 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _788;
    out.m_55.y = _804;
    out.m_55.z = _806;
    out.m_55.w = _808;
    bool _810 = !_778;
    float _826;
    if (!_810)
    {
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _814 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_104);
        float _832 = 1.0 / _830;
        float _834 = _138 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = in.m_57.x;
    float _840 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _842 = log2(_840);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _846 = _844 != 0;
    float _848 = in.m_51.z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _852 = _850 != 0;
    float _854 = _160 * 2.0;
    float _856 = in.m_44.x;
    float _858 = in.m_44.y;
    float _860 = in.m_44.z;
    float _862 = floor(_854);
    float _864 = in.m_59.x;
    float _866 = in.m_59.y;
    float _868 = in.m_59.z;
    if (_846)
    {
        bool _870 = _160 > 0.5;
        _252 = _870;
    }
    bool _872 = _252;
    float _874 = in.m_61.x;
    float _876 = in.m_61.y;
    float _878 = in.m_61.z;
    float _880 = _842 * _138;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _888 = in.m_63.x;
    float _890 = in.m_63.y;
    float _892 = in.m_63.z;
    if (_846)
    {
        float _894 = -_838;
        float _896 = _894 + 1.0;
        _706 = as_type<int>(_896);
    }
    int _898 = _706;
    float _900 = as_type<float>(_898);
    if (!_846)
    {
        _708 = _838;
    }
    float _902 = _708;
    float _904 = in.m_57.y;
    int _906 = 0;
    float _908 = _902;
    if (_852)
    {
        float _910 = -_838;
        float _912 = _910 + 1.0;
        _906 = as_type<int>(_912);
    }
    int _914 = _906;
    float _916 = exp2(_880);
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _928 = _926 != 0;
    float _930 = in.m_51.w;
    bool _932 = _872;
    if (_846)
    {
        float _934 = _872 ? as_type<float>(_898) : _838;
        _908 = _934;
    }
    float _936 = _908;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _938;
    if (_852)
    {
        bool _942 = _848 > 0.5;
        _932 = _942;
    }
    bool _944 = _932;
    if (!_852)
    {
        _900 = _838;
    }
    float _946 = _900;
    float _948 = 1.0 / _940;
    float _950 = _946;
    if (_852)
    {
        float _952 = _944 ? as_type<float>(_914) : _838;
        _950 = _952;
    }
    float _954 = _950;
    float _956 = _858 * _866;
    float _958 = in.m_51.y;
    float _960 = _858 * _876;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _964 = _962 != 0;
    float _966 = 1.0 / _884;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _968;
    float _972 = _858 * _890;
    float _974 = fma(_856, _864, _956);
    float _976 = fma(_856, _874, _960);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _980 = _836 + _978;
    float _982 = -_904;
    float _984 = _982 + 1.0;
    float _986 = fma(_856, _888, _972);
    float _988 = 1.0 / _970;
    float _990 = fma(_860, _878, _976);
    bool _992 = _930 > 0.5;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _996 = _836 + _994;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1000 = _998 != 0;
    float _1002 = fma(_860, _868, _974);
    int _1004 = _992 ? as_type<int>(_984) : as_type<int>(_904);
    float _1006 = _980 * _948;
    float _1008 = _996 * _966;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1012 = _836 + _1010;
    float _1014 = _958 * 2.0;
    float _1016 = _1000 ? as_type<float>(_1004) : _904;
    float _1018 = fma(_860, _892, _986);
    bool _1020 = _958 > 0.5;
    float _1022 = floor(_1014);
    float _1024 = _1012 * _988;
    float _1026 = _160 + _848;
    float _1028 = _904;
    if (_964)
    {
        float _1030 = _1020 ? _984 : _904;
        _1028 = _1030;
    }
    float _1032 = _1028;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1036 = 1.0 + _1034;
    bool _1038 = _862 > 0.0;
    float _1040 = _1026 + (-1.0);
    bool _1042 = _862 >= 0.0;
    bool _1044 = isnan(_862);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = -_916;
    float _1054 = _1052 + 1.0;
    float _1056 = _848 * 2.0;
    float _1058 = 1.0 / _1036;
    float _1060 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1062 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1064 = isnan(1.0);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1070 = _1066 || _1068;
    float _1072 = _958 + _848;
    bool _1074 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1076 = isnan(0.0);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1082 = _1078 || _1080;
    float _1084 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1086 = floor(_1056);
    float _1088 = _1072 + (-1.0);
    int _1090 = _1050 ? 0 : 1;
    float _1092 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1094 = _1082 ? _1054 : 0.0;
    float _1096 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1098 = _1022 > 0.0;
    float _1100 = _848 + (-0.5);
    bool _1102 = _1022 >= 0.0;
    bool _1104 = isnan(_1022);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.0);
    bool _1110 = _1106 || _1108;
    float _1112 = _1060;
    if (_1070)
    {
        float _1114 = _1094 * _1058;
        _140 = _1114;
    }
    float _1116 = _140;
    int _1118 = ~_1090;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1124;
    int _1128 = _1122;
    if (!_1038)
    {
        int _1130 = ~_1090;
        int _1132 = _1130 + 1;
        _1128 = _1132;
    }
    int _1134 = _1128;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1136;
    bool _1140 = _1086 > 0.0;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1142;
    bool _1146 = _1086 >= 0.0;
    bool _1148 = isnan(_1086);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    float _1156 = fma(_1138, _1006, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1158 = fma(_1126, _1006, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1172 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1174 = isnan(_836);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = fma(_1144, _1006, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1186 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1188 = isnan(_836);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = fma(_1162, _1008, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1200 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1202 = isnan(_836);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = fma(_1166, _1008, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1214 = fma(_1170, _1008, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1216 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1218 = isnan(_836);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = -_1182;
    float _1230 = _1228 + 1.0;
    float _1232 = -_1196;
    float _1234 = _1232 + 1.0;
    float _1236 = _1226 * _1230;
    float _1238 = -_1226;
    float _1240 = _1238 + 1.0;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1242;
    float _1246 = _1182 * _1234;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1252;
    float _1256 = _1210 * _1240;
    float _1258 = fma(_1244, _1024, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1260 = fma(_1250, _1024, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1262 = fma(_1254, _1024, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1264 = !_924;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = _1156 * _1256;
    float _1270 = _1184 * _1256;
    float _1272 = -_1210;
    float _1274 = _1272 + 1.0;
    float _1276 = _1158 * _1256;
    int _1278 = abs(_1266);
    float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1268);
    float _1284 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1270);
    float _1286 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1276);
    float _1288 = fma(_1198, _1236, _1282);
    float _1290 = float(_1134);
    float _1292 = fma(_1212, _1236, _1284);
    float _1294 = float(_1278);
    float _1296 = fma(_1214, _1236, _1286);
    int _1298 = _1110 ? 0 : 1;
    float _1300 = fma(_1258, _1246, _1288);
    float _1302 = fma(_1260, _1246, _1292);
    float _1304 = _1294 * _1290;
    float _1306 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1308 = ~_1298;
    int _1310 = _1308 + 1;
    int _1312 = _1310 + 1;
    float _1314 = fma(_1262, _1246, _1296);
    int _1316 = _1312;
    int _1318 = as_type<int>(_1300);
    if (!_1098)
    {
        int _1320 = ~_1298;
        int _1322 = _1320 + 1;
        _1316 = _1322;
    }
    int _1324 = _1316;
    float _1326 = _1306 * _1280;
    bool _1328 = !_928;
    int _1330 = _1328 ? 0 : 1;
    float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1334 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1336 = _990 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1338 = abs(_1330);
    float _1340 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1342 = in.m_65.x;
    float _1344 = in.m_65.y;
    float _1346 = in.m_65.z;
    bool _1348 = !_920;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1354 = _1336 + _1352;
    int _1356 = _1154 ? 0 : 1;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1360 = _1092 + _1358;
    int _1362 = abs(_1350);
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1368 = _1060 + _1366;
    int _1370 = ~_1356;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = _954 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1378 = _1374;
    float _1380 = _1326;
    if (!_1140)
    {
        int _1382 = ~_1356;
        int _1384 = _1382 + 1;
        _1378 = _1384;
    }
    int _1386 = _1378;
    float _1388 = _1340 * _1332;
    float _1390 = float(_1338);
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1394 = float(_1324);
    float _1396 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1364);
    float _1398 = float(_1362);
    float _1400 = _1334 * _886;
    float _1402 = float(_1386);
    float _1404 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1396);
    float _1406 = _1390 * _1394;
    float _1408 = _1304 * (-2.0);
    float _1410 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1302);
    float _1412 = _1398 * _1402;
    bool _1414 = _1404 >= 0.0;
    float _1416 = fma(_1096, _1408, _1096);
    float _1418 = fma(_1408, _1344, _1344);
    float _1420 = _958 + (-0.5);
    float _1422 = _1354 * _1354;
    float _1424 = _1376 * _1392;
    float _1426 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1314);
    float _1428 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1418);
    float _1430 = fma(_1368, _1368, _1422);
    float _1432 = _1406 * (-2.0);
    out.m_67.x = _1388;
    out.m_67.y = _1326;
    out.m_67.z = _1424;
    out.m_67.w = _1400;
    float _1434 = fma(_1416, _1116, _1428);
    float _1436 = fma(_1360, _1360, _1430);
    float _1438 = fma(_1432, _1346, _1346);
    float _1440 = fma(_1084, _1432, _1084);
    if (_1414)
    {
        out.m_47.x = 0.0;
    }
    float _1442 = rsqrt(_1436);
    float _1444 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1438);
    float _1446 = _1434 * 0.15915493667125701904296875;
    float _1448 = fma(_1440, _1116, _1444);
    float _1450 = _1448;
    if (_1414)
    {
        _1380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1452 = _1380;
    float _1454 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1300);
    float _1456 = _1426 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1414)
    {
        float _1458 = _1452 * 5.0;
        _1318 = as_type<int>(_1458);
    }
    int _1460 = _1318;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1464 = _1410 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1468 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1414)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5184 = as_type<float>(_1460);
        out.gl_Position.z = _5184;
    }
    float _1474 = _1354 * _1442;
    float _1476 = _1368 * _1442;
    out.m_69.x = _1470;
    out.m_69.y = _1472;
    out.m_69.z = _1468;
    out.m_69.w = _1466;
    if (_1414)
    {
        return out;
    }
    float _1478 = -_1474;
    float _1480 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1336);
    float _1482 = _1360 * _1442;
    float _1484 = -_1476;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1060);
    float _1488 = _160 + _958;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1492 = _1480 + _1490;
    float _1494 = -_1482;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1092);
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1500 = _1486 + _1498;
    float _1502 = _1488 + (-1.0);
    float _1504 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1508 = _1496 + _1506;
    float _1510 = _1412 * (-2.0);
    float _1512 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1514 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1504);
    float _1516 = _160 + (-0.5);
    float _1518 = fma(_1510, _1342, _1342);
    float _1520 = -_1474;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1354);
    float _1524 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1514);
    float _1526 = fma(_1512, _1510, _1512);
    float _1528 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1518);
    float _1530 = -_1476;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1368);
    float _1534 = _1522 * _1522;
    bool _1536 = _1524 >= 0.0;
    float _1538 = fma(_1526, _1116, _1528);
    float _1540 = -_1482;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1360);
    float _1544 = fma(_1532, _1532, _1534);
    float _1546 = _1448 * 0.15915493667125701904296875;
    float _1548 = _1538 * 0.15915493667125701904296875;
    float _1550 = _1446 * 6.283185482025146484375;
    float _1552 = sin(_1550);
    float _1554 = fma(_1542, _1542, _1544);
    if (_1536)
    {
        _1450 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1556 = _1450;
    float _1558 = _1446 * 6.283185482025146484375;
    float _1560 = cos(_1558);
    int _1562 = as_type<int>(_1556);
    if (_1536)
    {
        out.m_47.x = 0.0;
    }
    if (_1536)
    {
        float _1564 = _1556 * 5.0;
        _1562 = as_type<int>(_1564);
    }
    int _1566 = _1562;
    float _1568 = _1546 * 6.283185482025146484375;
    float _1570 = sin(_1568);
    if (_1536)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5368 = as_type<float>(_1566);
        out.gl_Position.z = _5368;
    }
    float _1572 = _1546 * 6.283185482025146484375;
    float _1574 = cos(_1572);
    float _1576 = _1548 * 6.283185482025146484375;
    float _1578 = sin(_1576);
    float _1580 = sqrt(_1554);
    if (_1536)
    {
        return out;
    }
    float _1582 = -_1336;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1586 = -_1060;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1590 = _1548 * 6.283185482025146484375;
    float _1592 = cos(_1590);
    float _1594 = -_1092;
    float _1596 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1598 = _1584 * _1584;
    float _1600 = _1560 * _1574;
    float _1602 = _1552 * _1570;
    float _1604 = _1442 * _1580;
    float _1606 = fma(_1588, _1588, _1598);
    float _1608 = _1560 * _1570;
    float _1610 = fma(_1578, _1602, _1600);
    float _1612 = fma(_1578, _1600, _1602);
    float _1614 = fma(_1596, _1596, _1606);
    float _1616 = _1552 * _1574;
    float _1618 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1620 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1622 = precise::clamp(_1620, 0.0, 1.0);
    float _1624 = rsqrt(_1614);
    float _1626 = _1570 * _1592;
    float _1628 = _1574 * _1592;
    float _1630 = _1552 * _1592;
    float _1632 = _1560 * _1592;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1634;
    float _1638 = in.m_71.x;
    float _1640 = in.m_71.y;
    float _1642 = in.m_71.z;
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1646 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1644;
    float _1648 = _1636 * _1636;
    float _1650 = -_1616;
    float _1652 = fma(_1578, _1608, _1650);
    float _1654 = -_1608;
    float _1656 = fma(_1578, _1616, _1654);
    float _1658 = _1604 * _1618;
    float _1660 = fma(_1622, -0.64999997615814208984375, 1.0);
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1664 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1662;
    float _1666 = _1588 * _1624;
    float _1668 = _1596 * _1624;
    float _1670 = _1584 * _1624;
    float _1672 = fma(_1646, _1646, _1648);
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1676 = _1666 * _1674;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1680 = _1668 * _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1684 = _1670 * _1682;
    float _1686 = fma(_1664, _1664, _1672);
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1690 = -_1676;
    float _1692 = fma(_1668, _1688, _1690);
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1696 = -_1680;
    float _1698 = fma(_1670, _1694, _1696);
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1702 = -_1684;
    float _1704 = fma(_1666, _1700, _1702);
    float _1706 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1708 = _1692 * _1692;
    float _1710 = rsqrt(_1686);
    float _1712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1638);
    float _1714 = _1604 * _1706;
    float _1716 = fma(_1698, _1698, _1708);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1640);
    float _1720 = _1712 * _1658;
    float _1722 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1724 = fma(_1704, _1704, _1716);
    float _1726 = sqrt(_1686);
    float _1728 = _1718 * _1714;
    float _1730 = _1604 * _1722;
    float _1732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1642);
    bool _1734 = _1640 != 0.0;
    bool _1736 = isnan(_1640);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = _1628 * _1728;
    float _1746 = _1612 * _1728;
    float _1748 = _1732 * _1730;
    float _1750 = rsqrt(_1724);
    float _1752 = _1656 * _1728;
    float _1754 = _1710 * (-0.20000000298023223876953125);
    float _1756 = fma(_1626, _1720, _1744);
    float _1758 = fma(_1652, _1720, _1746);
    float _1760 = fma(_1610, _1720, _1752);
    float _1762 = fma(_1646, _1754, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1764 = _1638 == 0.0;
    bool _1766 = !_1742;
    bool _1768 = _1764 && _1766;
    float _1770 = _1726 * 0.066666670143604278564453125;
    float _1772 = fma(_1630, _1748, _1760);
    float _1774 = fma(_1636, _1754, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1776 = -_1578;
    float _1778 = fma(_1776, _1748, _1756);
    float _1780 = fma(_1632, _1748, _1758);
    float _1782 = fma(_1664, _1754, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1784 = -_1774;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1788 = precise::max(_1770, 1.0);
    float _1790 = _1704 * _1750;
    float _1792 = _1692 * _1750;
    float _1794 = _1698 * _1750;
    float _1796 = _1786 * _1786;
    float _1798 = _1666 * _1790;
    float _1800 = _1668 * _1792;
    float _1802 = precise::min(_1788, 2.0);
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1806 = _1774 + _1804;
    float _1808 = -_1798;
    float _1810 = fma(_1668, _1794, _1808);
    float _1812 = _1670 * _1794;
    float _1814 = -_1800;
    float _1816 = fma(_1670, _1790, _1814);
    float _1818 = _1802 * _1660;
    float _1820 = _1810 * _1778;
    float _1822 = -_1812;
    float _1824 = fma(_1666, _1792, _1822);
    float _1826 = _1816 * _1778;
    float _1828 = -_1762;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1832 = fma(_1792, _1772, _1820);
    float _1834 = _1824 * _1778;
    float _1836 = fma(_1794, _1772, _1826);
    bool _1838 = _1642 == 0.0;
    bool _1840 = _1838 && _1768;
    float _1842 = fma(_1670, _1780, _1832);
    float _1844 = fma(_1790, _1772, _1834);
    float _1846 = fma(_1666, _1780, _1836);
    float _1848 = fma(_1830, _1830, _1796);
    float _1850 = _1336 + _1842;
    float _1852 = -_1782;
    float _1854 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1060 + _1846;
    float _1858 = in.m_73.x;
    float _1860 = in.m_73.y;
    float _1862 = in.m_73.z;
    float _1864 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1866 = _1850 + _1864;
    float _1868 = fma(_1668, _1780, _1844);
    float _1870 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1872 = _1856 + _1870;
    float _1874 = fma(_1854, _1854, _1848);
    float _1876 = fma(_1866, _1818, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1878 = _1092 + _1868;
    float _1880 = fma(_1872, _1818, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1884 = _1762 + _1882;
    float _1886 = -_1876;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1890 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1892 = _1878 + _1890;
    float _1894 = -_1880;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1898 = _1806 * _1806;
    float _1900 = _1888 * _1888;
    float _1902 = fma(_1892, _1818, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1906 = _1782 + _1904;
    float _1908 = fma(_1884, _1884, _1898);
    float _1910 = fma(_1896, _1896, _1900);
    float _1912 = -_1902;
    float _1914 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1916 = in.m_75.x;
    float _1918 = in.m_75.y;
    float _1920 = in.m_75.z;
    float _1922 = in.m_75.w;
    float _1924 = fma(_1906, _1906, _1908);
    float _1926 = sqrt(_1874);
    float _1928 = fma(_1914, _1914, _1910);
    float _1930 = _1626 * _1810;
    float _1932 = _1910;
    float _1934 = _1908;
    float _1936 = _1914;
    float _1938 = _1858;
    float _1940 = _1612;
    if (_1840)
    {
        _1932 = _1858;
    }
    float _1942 = _1932;
    float _1944 = _1626 * _1824;
    float _1946 = _1942;
    if (_1840)
    {
        _1934 = _1862;
    }
    float _1948 = _1934;
    float _1950 = _1948;
    if (!_1840)
    {
        float _1952 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1862);
        _1950 = _1952;
    }
    float _1954 = _1950;
    if (_1840)
    {
        _1936 = _1942;
    }
    float _1956 = _1936;
    float _1958 = sqrt(_1928);
    float _1960 = _1956;
    if (!_1840)
    {
        _1946 = _1858;
    }
    float _1962 = _1946;
    float _1964 = fma(_1610, _1790, _1944);
    if (_1840)
    {
        _1938 = _1860;
    }
    float _1966 = _1938;
    float _1968 = _1966;
    if (!_1840)
    {
        float _1970 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1860);
        _1968 = _1970;
    }
    float _1972 = _1968;
    if (!_1840)
    {
        float _1974 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1962);
        _1960 = _1974;
    }
    float _1976 = _1960;
    float _1978 = rsqrt(_1924);
    float _1980 = _1920 * _1962;
    float _1982 = _1918 * _1862;
    float _1984 = -_1926;
    float _1986 = _1958 + _1984;
    float _1988 = _1916 * _1860;
    float _1990 = -_1980;
    float _1992 = fma(_1916, _1862, _1990);
    float _1994 = -_1982;
    float _1996 = fma(_1920, _1860, _1994);
    float _1998 = _1628 * _1824;
    float _2000 = -_1988;
    float _2002 = fma(_1918, _1962, _2000);
    float _2004 = _1992 * _1922;
    float _2006 = _1996 * _1922;
    float _2008 = _1978 * _1986;
    float _2010 = _2002 * _1922;
    float _2012 = _1626 * _1816;
    float _2014 = _1628 * _1816;
    float _2016 = -_2008;
    float _2018 = fma(_1884, _2016, _1880);
    float _2020 = -_2008;
    float _2022 = fma(_1906, _2020, _1902);
    float _2024 = _1628 * _1810;
    float _2026 = -_1816;
    float _2028 = _1578 * _2026;
    float _2030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2032 = _2018 + _2030;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2036 = _2022 + _2034;
    float _2038 = -_1810;
    float _2040 = _1578 * _2038;
    float _2042 = -_1824;
    float _2044 = _1578 * _2042;
    float _2046 = _2032 * _2032;
    float _2048 = _2036 * _2036;
    float _2050 = fma(_1656, _1794, _2014);
    float _2052 = fma(_1656, _1792, _2024);
    float _2054 = fma(_1656, _1790, _1998);
    float _2056 = _2046 + _2048;
    float _2058 = fma(_1610, _1794, _2012);
    float _2060 = fma(_1610, _1792, _1930);
    float _2062 = fma(_1630, _1790, _2044);
    float _2064 = sqrt(_2056);
    float _2066 = fma(_1630, _1794, _2028);
    float _2068 = fma(_1630, _1792, _2040);
    float _2070 = fma(_1612, _1666, _2050);
    float _2072 = fma(_1612, _1670, _2052);
    float _2074 = fma(_1612, _1668, _2054);
    float _2076 = fma(_1652, _1666, _2058);
    float _2078 = fma(_1652, _1670, _2060);
    float _2080 = fma(_1652, _1668, _1964);
    float _2082 = fma(_1632, _1668, _2062);
    float _2084 = fma(_1632, _1666, _2066);
    float _2086 = fma(_1632, _1670, _2068);
    float _2088 = _2070 * _1918;
    float _2090 = _2072 * _1918;
    float _2092 = _2074 * _1918;
    float _2094 = _2070 * _1972;
    bool _2096 = _2064 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2098 = _2004 * _2070;
    float _2100 = _2072 * _1972;
    float _2102 = _2004 * _2072;
    float _2104 = _2074 * _1972;
    float _2106 = _2004 * _2074;
    float _2108 = -_2008;
    float _2110 = fma(_1806, _2108, _1876);
    float _2112 = _2110;
    float _2114 = _2046;
    float _2116 = _2048;
    float _2118 = _2022;
    float _2120 = _2010;
    if (!_2096)
    {
        _1940 = _2018;
    }
    float _2122 = _1940;
    bool _2124 = !_2096;
    float _2126 = _2122;
    if (!_2124)
    {
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2132 = _2064 + _2130;
        float _2134 = rsqrt(_2056);
        float _2136 = _2132 * _2128;
        float _2138 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2140 = _2136 * 0.15915493667125701904296875;
        float _2142 = _2140 * 6.283185482025146484375;
        float _2144 = sin(_2142);
        float _2146 = _2140 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = fma(_2144, _2138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2152 = _2134 * _2150;
        float _2154 = fma(_2032, _2152, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2156 = _2148 + (-1.0);
        float _2158 = fma(_2036, _2152, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2162 = _2154 + _2160;
        float _2164 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2168 = _2158 + _2166;
        float _2170 = _2162 * _2162;
        float _2172 = fma(_2110, _2148, _2164);
        float _2174 = _2168 * _2168;
        _2112 = _2172;
        _2114 = _2170;
        _2116 = _2174;
        _2126 = _2154;
        _2118 = _2158;
    }
    float _2176 = _2112;
    float _2178 = _2114;
    float _2180 = _2116;
    float _2182 = _2126;
    float _2184 = _2118;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2188 = _2176 + _2186;
    float _2190 = fma(_2076, _1976, _2094);
    float _2192 = fma(_2076, _1916, _2088);
    float _2194 = fma(_2078, _1916, _2090);
    float _2196 = fma(_2188, _2188, _2178);
    float _2198 = fma(_2078, _1976, _2100);
    float _2200 = fma(_2080, _1976, _2104);
    float _2202 = fma(_2006, _2076, _2098);
    float _2204 = _2196 + _2180;
    float _2206 = fma(_2080, _1916, _2092);
    float _2208 = fma(_2006, _2078, _2102);
    float _2210 = fma(_2006, _2080, _2106);
    float _2212 = fma(_2084, _1920, _2192);
    float _2214 = fma(_2086, _1920, _2194);
    float _2216 = sqrt(_2204);
    float _2218 = fma(_2084, _1954, _2190);
    float _2220 = fma(_2010, _2084, _2202);
    float _2222 = fma(_2086, _1954, _2198);
    float _2224 = fma(_2010, _2086, _2208);
    float _2226 = fma(_2010, _2082, _2210);
    float _2228 = fma(_2082, _1954, _2200);
    float _2230 = fma(_2082, _1920, _2206);
    out.m_55.x = _788;
    out.m_55.y = _804;
    out.m_55.z = _806;
    out.m_55.w = _808;
    out.m_69.x = _1470;
    out.m_69.y = _1472;
    out.m_69.z = _1468;
    out.m_69.w = _1466;
    out.m_77.x = _2220;
    out.m_77.y = _2224;
    out.m_77.z = _2226;
    bool _2232 = _2216 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2234 = isnan(_2216);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2240 = _2236 || _2238;
    out.m_79.x = _2218;
    out.m_79.y = _2222;
    out.m_79.z = _2228;
    out.m_81.x = _2212;
    out.m_81.y = _2214;
    out.m_81.z = _2230;
    float _2242 = _2230;
    float _2244 = _2220;
    float _2246 = _2224;
    if (!_2240)
    {
        _2120 = 1.0;
    }
    float _2248 = _2120;
    bool _2250 = !_2240;
    float _2252 = _2248;
    if (!_2250)
    {
        bool _2254 = _2216 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2256 = isnan(_2216);
        bool _2258 = _2254 || _2256;
        bool _2260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2262 = _2258 || _2260;
        if (!_2262)
        {
            float _2264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2266 = _2216 + _2264;
            float _2268 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2270 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2268;
            float _2272 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2274 = _2272 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2276 = 1.0 / _2270;
            float _2278 = _2266 * _2276;
            float _2280 = fma(_2278, _2274, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2252 = _2280;
            _2282 = true;
        }
        else
        {
            bool _2284 = _2216 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2286 = isnan(_2216);
            bool _2288 = _2284 || _2286;
            bool _2290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2292 = _2288 || _2290;
            if (!_2292)
            {
                float _2294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2296 = _2216 + _2294;
                float _2298 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2300 = _2298 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2302 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2304 = _2302 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2306 = 1.0 / _2300;
                float _2308 = _2296 * _2306;
                float _2310 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2252 = _2310;
                _2282 = true;
            }
            else
            {
                _2252 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2282 = false;
    float _2312 = _2252;
    float _2314 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2316 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2318 = _2182 + _2316;
    float _2320 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2314);
    float _2322 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2324 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2326 = _2176 + _2324;
    float _2328 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2320);
    bool _2330 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2332 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan(0.5);
    bool _2338 = _2334 || _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2342 = _2184 + _2340;
    bool _2344 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2346 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan(0.5);
    bool _2352 = _2348 || _2350;
    float _2354 = _2328 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2356 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2322);
    float _2358 = fma(_2326, _2312, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2360 = fma(_2342, _2312, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2362 = 1.0 / _2354;
    float _2364 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2368 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2352)
    {
        _2368 = 1.0;
    }
    float _2370 = _2368;
    float _2372 = _2366 + _2354;
    float _2374 = -_1474;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2358);
    float _2378 = _2372 * _2362;
    float _2380 = _2378 * 0.5;
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2384 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2382);
    float _2386 = fma(_2318, _2312, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2388 = -_1482;
    float _2390 = fma(_2388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2360);
    float _2392 = 1.0 / _2384;
    float _2394 = -_1476;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2386);
    float _2398 = _2376;
    float _2400 = _2396;
    float _2402 = _2390;
    float _2404 = _2386;
    float _2406 = _2370;
    if (!_2338)
    {
        float _2408 = _1492 * _1492;
        float _2410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2412 = -_1092;
        float _2414 = _2412 + _2360;
        float _2416 = -_1336;
        float _2418 = _2416 + _2358;
        float _2420 = fma(_1500, _1500, _2408);
        float _2422 = fma(_1508, _1508, _2420);
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2426 = sqrt(_2422);
        float _2428 = 1.0 / _1604;
        float _2430 = precise::min(_2426, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2432 = _2430 * _2410;
        float _2434 = _2424 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2436 = _2432 * _2428;
        float _2438 = -_1060;
        float _2440 = _2438 + _2386;
        float _2442 = _2434 * _2436;
        float _2444 = _2414 * _2436;
        float _2446 = fma(_2440, _2442, _1486);
        float _2448 = fma(_2418, _2442, _1480);
        float _2450 = fma(_2434, _2444, _1496);
        _2398 = _2448;
        _2400 = _2446;
        _2402 = _2450;
    }
    float _2452 = _2398;
    float _2454 = _2400;
    float _2456 = _2402;
    if (_2352)
    {
        _2404 = 1.0;
    }
    float _2458 = _2404;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2462 = _2392 * _2460;
    float _2464 = _2458;
    if (!_2352)
    {
        float _2466 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2470 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2468;
        float _2472 = _2466 * 0.15915493667125701904296875;
        float _2474 = _2472 * 6.283185482025146484375;
        float _2476 = cos(_2474);
        float _2478 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2480 = _2478 * 0.15915493667125701904296875;
        float _2482 = _2472 * 6.283185482025146484375;
        float _2484 = sin(_2482);
        float _2486 = 1.0 / _2476;
        float _2488 = _2480 * 6.283185482025146484375;
        float _2490 = cos(_2488);
        float _2492 = _2484 * _2486;
        float _2494 = _2480 * 6.283185482025146484375;
        float _2496 = sin(_2494);
        float _2498 = _2490 * _2492;
        float _2500 = 1.0 / _2470;
        float _2502 = 1.0 / _2498;
        float _2504 = _2496 * _2502;
        float _2506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2508 = fma(_2462, _2504, _2506);
        float _2510 = _2508 * _2500;
        float _2512 = precise::clamp(_2510, 0.0, 1.0);
        _2242 = _2500;
        _2406 = _2512;
    }
    float _2514 = _2242;
    float _2516 = _2406;
    float _2518 = _2514;
    if (!_2352)
    {
        float _2520 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2522 = _2520 * 0.15915493667125701904296875;
        float _2524 = _2522 * 6.283185482025146484375;
        float _2526 = cos(_2524);
        float _2528 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2530 = _2528 * 0.15915493667125701904296875;
        float _2532 = _2522 * 6.283185482025146484375;
        float _2534 = sin(_2532);
        float _2536 = 1.0 / _2526;
        float _2538 = _2530 * 6.283185482025146484375;
        float _2540 = cos(_2538);
        float _2542 = _2534 * _2536;
        float _2544 = _2530 * 6.283185482025146484375;
        float _2546 = sin(_2544);
        float _2548 = _2540 * _2542;
        float _2550 = 1.0 / _2548;
        float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2554 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2552;
        float _2556 = 1.0 / _2554;
        float _2558 = _2546 * _2550;
        float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2562 = fma(_2462, _2558, _2560);
        float _2564 = _2562 * _2556;
        float _2566 = precise::clamp(_2564, 0.0, 1.0);
        float _2568 = -_2566;
        float _2570 = _2568 + 1.0;
        _2518 = _2526;
        _2464 = _2570;
    }
    float _2572 = _2518;
    float _2574 = _2464;
    float _2576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2578 = _2452 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2582 = _2454 + _2580;
    float _2584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2586 = _2456 + _2584;
    float _2588 = _2578 * _2578;
    float _2590 = fma(_2582, _2582, _2588);
    float _2592 = fma(_2586, _2586, _2590);
    float _2594 = rsqrt(_2592);
    float _2596 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2598 = _2582 * _2596;
    float _2600 = _2586 * _2596;
    float _2602 = _2598 * _2598;
    float _2604 = _2600 * _2600;
    float _2606 = _2602 + _2604;
    float _2608 = sqrt(_2606);
    bool _2610 = _2608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2614 = _2608 + _2612;
    float _2616 = _2586;
    float _2618 = _2606;
    float _2620 = _2614;
    float _2622 = _2598;
    if (_2610)
    {
        float _2624 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2616 = _2624;
    }
    float _2626 = _2616;
    if (_2610)
    {
        float _2628 = rsqrt(_2606);
        _2618 = _2628;
    }
    float _2630 = _2618;
    float _2632 = _2630;
    if (_2610)
    {
        float _2634 = _2614 * _2626;
        _2620 = _2634;
    }
    float _2636 = _2620;
    if (_2610)
    {
        float _2638 = _2636 * 0.15915493667125701904296875;
        _2244 = _2638;
    }
    float _2640 = _2244;
    float _2642 = _2594;
    if (_2610)
    {
        float _2644 = _2640 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        _2642 = _2646;
    }
    float _2648 = _2642;
    float _2650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2652 = precise::max(0.0, _2650);
    float _2654 = _2572;
    float _2656 = _2652;
    float _2658 = _2650;
    if (_2610)
    {
        float _2660 = _2640 * 6.283185482025146484375;
        float _2662 = cos(_2660);
        _2654 = _2662;
    }
    float _2664 = _2654;
    float _2666 = -_2596;
    float _2668 = -_2652;
    float _2670 = fma(_2578, _2666, _2668);
    if (_2610)
    {
        float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2656 = _2672;
    }
    float _2674 = _2656;
    float _2676 = sqrt(_2592);
    float _2678 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2680 = _2648;
    float _2682 = _2674;
    if (_2610)
    {
        float _2684 = fma(_2648, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2680 = _2684;
    }
    float _2686 = _2680;
    float _2688 = _2686;
    if (!_2610)
    {
        _2682 = _2600;
    }
    float _2690 = _2682;
    float _2692 = _2690;
    if (_2610)
    {
        float _2694 = _2664 + (-1.0);
        _2658 = _2694;
    }
    float _2696 = _2658;
    float _2698 = _2696;
    if (_2610)
    {
        float _2700 = _2630 * _2686;
        _1112 = _2700;
    }
    float _2702 = _1112;
    if (!_2610)
    {
        _2688 = _2670;
    }
    float _2704 = _2688;
    float _2706 = _2704;
    if (_2610)
    {
        float _2708 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2246 = _2708;
    }
    float _2710 = _2246;
    if (_2610)
    {
        float _2712 = _2598 * _2702;
        _2622 = _2712;
    }
    float _2714 = _2622;
    if (!_2610)
    {
        _2632 = _2602;
    }
    float _2716 = _2632;
    float _2718 = _2716;
    if (_2610)
    {
        float _2720 = _2600 * _2702;
        _2692 = _2720;
    }
    float _2722 = _2692;
    if (_2610)
    {
        float _2724 = fma(_2670, _2664, _2710);
        _2706 = _2724;
    }
    float _2726 = _2706;
    if (_2610)
    {
        float _2728 = _2714 * _2714;
        _2718 = _2728;
    }
    float _2730 = _2718;
    if (!_2610)
    {
        _2698 = _2604;
    }
    float _2732 = _2698;
    float _2734 = _2732;
    if (_2610)
    {
        float _2736 = _2722 * _2722;
        _2734 = _2736;
    }
    float _2738 = _2734;
    float _2740 = fma(_2726, _2726, _2730);
    float _2742 = _2740 + _2738;
    float _2744 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2748 = fma(_2676, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2746);
    float _2750 = precise::clamp(_2748, 0.0, 1.0);
    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2754 = rsqrt(_2742);
    float _2756 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2744);
    float _2758 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2760 = -_2750;
    float _2762 = _2760 + 1.0;
    float _2764 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2766 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2756);
    float _2768 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2758);
    float _2770 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2764);
    float _2772 = _2766 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2774 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2768);
    float _2776 = abs(_2762);
    float _2778 = log2(_2776);
    float _2780 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2770);
    float _2782 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2678);
    float _2784 = _2774 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2786 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2788 = _2754 * _2714;
    float _2790 = _2780 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2792 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2794 = _2754 * _2726;
    float _2796 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2798 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2782);
    float _2800 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2792);
    float _2802 = _2754 * _2722;
    float _2804 = -_2796;
    float _2806 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2804);
    float _2808 = _2798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2810 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2800);
    float _2812 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2814 = -_2802;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2806);
    float _2818 = -_2786;
    float _2820 = fma(_2818, _2752, 1.0);
    float _2822 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2810);
    float _2824 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2826 = fma(_2816, -0.5, 0.5);
    float _2828 = exp2(_2812);
    float _2830 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2832 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2824);
    float _2834 = fma(_2816, 0.5, 0.5);
    float _2836 = _2794 + 1.0;
    float _2838 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2830);
    float _2840 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2832);
    float _2842 = fma(_2834, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2844 = log2(_2820);
    float _2846 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2838);
    float _2848 = fma(_2834, _2842, -0.212114393711090087890625);
    float _2850 = fma(_2834, _2848, 1.570728778839111328125);
    float _2852 = 1.0 / _2822;
    float _2854 = -_2794;
    float _2856 = fma(_2828, _2836, _2854);
    float _2858 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2840);
    float _2860 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2846);
    float _2862 = fma(_2856, 0.5, 0.5);
    float _2864 = sqrt(_2826);
    float _2866 = _2844 * 0.693147182464599609375;
    float _2868 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2870 = _2858 * _2852;
    float _2872 = _2860 * _2852;
    float _2874 = fma(_2870, 0.5, 0.5);
    float _2876 = fma(_2872, -0.5, 0.5);
    float _2878 = _2864 * 0.636619746685028076171875;
    float _2880 = -_2850;
    float _2882 = fma(_2878, _2880, 1.0);
    float3 _7476 = float3(_2874, _2876, _2868);
    float _2884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7476, float3(0.0), isnan(_7476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7476, float3(0.0), isnan(_7476)), level(0.0)).x;
    float3 _7487 = float3(_2874, _2876, _2868);
    float4 _2887 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7487, float3(0.0), isnan(_7487)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7487, float3(0.0), isnan(_7487)), level(0.0)).xyzw;
    float _2889 = _2887.x;
    float _2891 = _2887.y;
    float _2893 = _2887.z;
    float _2895 = _2887.w;
    float2 _7504 = float2(_2882, _2862);
    float3 _2899 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7504, float2(0.0), isnan(_7504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7504, float2(0.0), isnan(_7504)), level(0.0)).xyz;
    float _2901 = _2899.x;
    float _2903 = _2899.y;
    float _2905 = _2899.z;
    float _2907 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2909 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2911 = _2516 * _2574;
    bool _2913 = _2516 > 0.0;
    bool _2915 = isnan(_2516);
    bool _2917 = _2913 || _2915;
    bool _2919 = isnan(0.0);
    bool _2921 = _2917 || _2919;
    float _2923 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2909);
    float _2925 = exp2(_2907);
    float _2927 = _2911 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2929 = _2574 <= 0.0;
    bool _2931 = !_2921;
    bool _2933 = _2929 || _2931;
    float _2935 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2923);
    float _2937 = _2822 * 0.5;
    float _2939 = _248 * _2927;
    float _2941 = _2858 + _2822;
    float _2943 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2935);
    float _2945 = fma(_2860, -0.5, _2937);
    float _2947 = _2941 * 0.5;
    float _2949 = _2943 + _2822;
    out.gl_Position.x = _2858;
    out.gl_Position.y = _2860;
    out.gl_Position.z = _2943;
    out.gl_Position.w = _2822;
    float _2951 = _2939 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2953 = _2949 * 0.5;
    float _2955 = -_2925;
    float _2957 = _2955 + 1.0;
    out.m_47.x = _2951;
    float _2959 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2947;
    out.m_83.y = _2945;
    out.m_83.z = _2953;
    out.m_83.w = _2822;
    float _2961 = -_2959;
    float _2963 = _2961 + 1.0;
    float _2965 = _2959 * _2884;
    float _2967 = _2895 * _2963;
    float _2969 = _2895 * _2965;
    float _2971 = _2905 * _2965;
    float _2973 = fma(_2901, _2969, _2889);
    float _2975 = fma(_2903, _2969, _2891);
    float _2977 = fma(_2895, _2971, _2893);
    out.m_85.x = _2973;
    out.m_85.y = _2975;
    out.m_85.z = _2977;
    out.m_85.w = _2967;
    if (!_2933)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2979 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2979;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2282 = false;
    bool _828 = false;
    bool _726 = false;
    bool _490 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3036 = as_type<float>(_120);
        out.gl_Position.z = _3036;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3106 = as_type<float>(_158);
        out.gl_Position.z = _3106;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    float _214 = float(_192);
    int _216 = abs(_212);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _222 = _208 < 0.5;
    float _224 = float(_222);
    float _226 = fma(_196, 0.5, 0.5);
    float _228 = abs(_220);
    float _230 = _214 * _228;
    float _232 = float(_204);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_216);
    float _244 = fma(_232, _240, _230);
    float _246 = abs(_236);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    bool _252 = _168;
    float _268;
    if (!_250)
    {
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _256 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_104);
        float _274 = 1.0 / _272;
        float _276 = _138 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _278 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = _278 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _278 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _300;
    float _304 = 1.0 / _294;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _308 = 1.0 / _302;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = 1.0 / _298;
    float _316 = _282 * _304;
    bool _318 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _320 = isnan(_278);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = fma(_312, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = fma(_332, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = _286 * _308;
    bool _340 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_278);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_328;
    float _354 = _352 + 1.0;
    float _356 = _350 * _354;
    bool _358 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_278);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _290 * _314;
    bool _372 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _374 = isnan(_278);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = -_350;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = fma(_386, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_382;
    float _400 = _398 + 1.0;
    float _402 = _382 * _390;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = _368 * _400;
    float _414 = -_368;
    float _416 = _414 + 1.0;
    float _418 = fma(_394, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_406, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = _334 * _412;
    float _424 = _336 * _412;
    float _426 = _396 * _412;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _422);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _432 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _434 = fma(_410, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _444;
    float _448 = fma(_418, _402, _428);
    float _450 = fma(_438, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_442, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _454 = fma(_446, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _456 = fma(_420, _402, _430);
    float _458 = fma(_434, _402, _432);
    float _460 = fma(_450, _356, _448);
    float _462 = fma(_452, _356, _456);
    float _464 = fma(_454, _356, _458);
    float _466 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].x, _460);
    float _468 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].y, _462);
    float _470 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].z, _464);
    bool _472 = !_306;
    float _488;
    if (!_472)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _476 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_104);
        float _494 = 1.0 / _492;
        float _496 = _138 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = in.m_53.x;
    float _502 = in.m_53.y;
    float _504 = in.m_53.z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _508 = _498 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _512 = _498 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = 1.0 / _516;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _530 = 1.0 / _524;
    float _532 = _470 * _504;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _536 = _498 + _534;
    float _538 = 1.0 / _520;
    float _540 = _508 * _526;
    bool _542 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _544 = isnan(_498);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = _468 * _502;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _556;
    float _560 = _466 * _500;
    float _562 = -_552;
    float _564 = _562 + 1.0;
    float _566 = _512 * _530;
    bool _568 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _570 = isnan(_498);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    bool _580 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _582 = isnan(_498);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _578 * _564;
    bool _594 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _596 = isnan(_498);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = _536 * _538;
    float _608 = -_590;
    float _610 = _608 + 1.0;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _612;
    float _616 = -_578;
    float _618 = _616 + 1.0;
    float _620 = fma(_558, _606, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _630 = _604 * _610;
    float _632 = fma(_614, _606, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _634 = fma(_624, _606, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _636 = _590 * _618;
    float _638 = _620 * _630;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _644 = _634 * _630;
    float _646 = _632 * _630;
    float _648 = -_604;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _656 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].x, _644);
    float _658 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].y, _638);
    float _660 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].z, _646);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _662;
    float _666 = fma(_628, _566, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _668 = fma(_654, _566, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _670 = fma(_642, _566, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _676;
    float _680 = fma(_666, _636, _656);
    float _682 = fma(_664, _540, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _684 = fma(_674, _540, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _686 = fma(_678, _540, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _688 = fma(_668, _636, _658);
    float _690 = fma(_670, _636, _660);
    float _692 = fma(_682, _592, _680);
    float _694 = fma(_684, _592, _688);
    float _696 = fma(_686, _592, _690);
    float _698 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].x, _692);
    float _700 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].y, _694);
    float _702 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[110].z, _696);
    bool _704 = !_528;
    int _706 = as_type<int>(_566);
    float _708 = _540;
    float _724;
    if (!_704)
    {
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _712 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        float _728 = float(_104);
        float _730 = 1.0 / _728;
        float _732 = _138 * _730;
        _724 = _732;
    }
    _726 = false;
    float _734 = _724;
    bool _736 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _738 = isnan(_734);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _752 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _754 = isnan(_734);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _770 = _734 + _768;
    float _772 = 1.0 / _750;
    float _774 = -_746;
    float _776 = _774 + 1.0;
    bool _778 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _780 = _762 * _776;
    float _782 = -_762;
    float _784 = _782 + 1.0;
    float _786 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _788 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _766 * _772;
    float _792 = fma(_790, _770, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _794 = _702 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = _792 * _780;
    float _798 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[115].x, _796);
    float _802 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[116].x, _800);
    float _804 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = _802 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _788;
    out.m_55.y = _804;
    out.m_55.z = _806;
    out.m_55.w = _808;
    bool _810 = !_778;
    float _826;
    if (!_810)
    {
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _814 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_104);
        float _832 = 1.0 / _830;
        float _834 = _138 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = in.m_57.x;
    float _840 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _842 = log2(_840);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _846 = _844 != 0;
    float _848 = in.m_51.z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _852 = _850 != 0;
    float _854 = _160 * 2.0;
    float _856 = in.m_44.x;
    float _858 = in.m_44.y;
    float _860 = in.m_44.z;
    float _862 = floor(_854);
    float _864 = in.m_59.x;
    float _866 = in.m_59.y;
    float _868 = in.m_59.z;
    if (_846)
    {
        bool _870 = _160 > 0.5;
        _252 = _870;
    }
    bool _872 = _252;
    float _874 = in.m_61.x;
    float _876 = in.m_61.y;
    float _878 = in.m_61.z;
    float _880 = _842 * _138;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _888 = in.m_63.x;
    float _890 = in.m_63.y;
    float _892 = in.m_63.z;
    if (_846)
    {
        float _894 = -_838;
        float _896 = _894 + 1.0;
        _706 = as_type<int>(_896);
    }
    int _898 = _706;
    float _900 = as_type<float>(_898);
    if (!_846)
    {
        _708 = _838;
    }
    float _902 = _708;
    float _904 = in.m_57.y;
    int _906 = 0;
    float _908 = _902;
    if (_852)
    {
        float _910 = -_838;
        float _912 = _910 + 1.0;
        _906 = as_type<int>(_912);
    }
    int _914 = _906;
    float _916 = exp2(_880);
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _928 = _926 != 0;
    float _930 = in.m_51.w;
    bool _932 = _872;
    if (_846)
    {
        float _934 = _872 ? as_type<float>(_898) : _838;
        _908 = _934;
    }
    float _936 = _908;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _938;
    if (_852)
    {
        bool _942 = _848 > 0.5;
        _932 = _942;
    }
    bool _944 = _932;
    if (!_852)
    {
        _900 = _838;
    }
    float _946 = _900;
    float _948 = 1.0 / _940;
    float _950 = _946;
    if (_852)
    {
        float _952 = _944 ? as_type<float>(_914) : _838;
        _950 = _952;
    }
    float _954 = _950;
    float _956 = _858 * _866;
    float _958 = in.m_51.y;
    float _960 = _858 * _876;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _964 = _962 != 0;
    float _966 = 1.0 / _884;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _968;
    float _972 = _858 * _890;
    float _974 = fma(_856, _864, _956);
    float _976 = fma(_856, _874, _960);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _980 = _836 + _978;
    float _982 = -_904;
    float _984 = _982 + 1.0;
    float _986 = fma(_856, _888, _972);
    float _988 = 1.0 / _970;
    float _990 = fma(_860, _878, _976);
    bool _992 = _930 > 0.5;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _996 = _836 + _994;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1000 = _998 != 0;
    float _1002 = fma(_860, _868, _974);
    int _1004 = _992 ? as_type<int>(_984) : as_type<int>(_904);
    float _1006 = _980 * _948;
    float _1008 = _996 * _966;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1012 = _836 + _1010;
    float _1014 = _958 * 2.0;
    float _1016 = _1000 ? as_type<float>(_1004) : _904;
    float _1018 = fma(_860, _892, _986);
    bool _1020 = _958 > 0.5;
    float _1022 = floor(_1014);
    float _1024 = _1012 * _988;
    float _1026 = _160 + _848;
    float _1028 = _904;
    if (_964)
    {
        float _1030 = _1020 ? _984 : _904;
        _1028 = _1030;
    }
    float _1032 = _1028;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1036 = 1.0 + _1034;
    bool _1038 = _862 > 0.0;
    float _1040 = _1026 + (-1.0);
    bool _1042 = _862 >= 0.0;
    bool _1044 = isnan(_862);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = -_916;
    float _1054 = _1052 + 1.0;
    float _1056 = _848 * 2.0;
    float _1058 = 1.0 / _1036;
    float _1060 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1062 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1064 = isnan(1.0);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1070 = _1066 || _1068;
    float _1072 = _958 + _848;
    bool _1074 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1076 = isnan(0.0);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1082 = _1078 || _1080;
    float _1084 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1086 = floor(_1056);
    float _1088 = _1072 + (-1.0);
    int _1090 = _1050 ? 0 : 1;
    float _1092 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1094 = _1082 ? _1054 : 0.0;
    float _1096 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1098 = _1022 > 0.0;
    float _1100 = _848 + (-0.5);
    bool _1102 = _1022 >= 0.0;
    bool _1104 = isnan(_1022);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.0);
    bool _1110 = _1106 || _1108;
    float _1112 = _1060;
    if (_1070)
    {
        float _1114 = _1094 * _1058;
        _140 = _1114;
    }
    float _1116 = _140;
    int _1118 = ~_1090;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1124;
    int _1128 = _1122;
    if (!_1038)
    {
        int _1130 = ~_1090;
        int _1132 = _1130 + 1;
        _1128 = _1132;
    }
    int _1134 = _1128;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1136;
    bool _1140 = _1086 > 0.0;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1142;
    bool _1146 = _1086 >= 0.0;
    bool _1148 = isnan(_1086);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    float _1156 = fma(_1138, _1006, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1158 = fma(_1126, _1006, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1172 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1174 = isnan(_836);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = fma(_1144, _1006, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1186 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1188 = isnan(_836);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = fma(_1162, _1008, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1200 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1202 = isnan(_836);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = fma(_1166, _1008, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1214 = fma(_1170, _1008, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1216 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1218 = isnan(_836);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = -_1182;
    float _1230 = _1228 + 1.0;
    float _1232 = -_1196;
    float _1234 = _1232 + 1.0;
    float _1236 = _1226 * _1230;
    float _1238 = -_1226;
    float _1240 = _1238 + 1.0;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1242;
    float _1246 = _1182 * _1234;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1252;
    float _1256 = _1210 * _1240;
    float _1258 = fma(_1244, _1024, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1260 = fma(_1250, _1024, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1262 = fma(_1254, _1024, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1264 = !_924;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = _1156 * _1256;
    float _1270 = _1184 * _1256;
    float _1272 = -_1210;
    float _1274 = _1272 + 1.0;
    float _1276 = _1158 * _1256;
    int _1278 = abs(_1266);
    float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1268);
    float _1284 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1270);
    float _1286 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1276);
    float _1288 = fma(_1198, _1236, _1282);
    float _1290 = float(_1134);
    float _1292 = fma(_1212, _1236, _1284);
    float _1294 = float(_1278);
    float _1296 = fma(_1214, _1236, _1286);
    int _1298 = _1110 ? 0 : 1;
    float _1300 = fma(_1258, _1246, _1288);
    float _1302 = fma(_1260, _1246, _1292);
    float _1304 = _1294 * _1290;
    float _1306 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1308 = ~_1298;
    int _1310 = _1308 + 1;
    int _1312 = _1310 + 1;
    float _1314 = fma(_1262, _1246, _1296);
    int _1316 = _1312;
    int _1318 = as_type<int>(_1300);
    if (!_1098)
    {
        int _1320 = ~_1298;
        int _1322 = _1320 + 1;
        _1316 = _1322;
    }
    int _1324 = _1316;
    float _1326 = _1306 * _1280;
    bool _1328 = !_928;
    int _1330 = _1328 ? 0 : 1;
    float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1334 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1336 = _990 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1338 = abs(_1330);
    float _1340 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1342 = in.m_65.x;
    float _1344 = in.m_65.y;
    float _1346 = in.m_65.z;
    bool _1348 = !_920;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1354 = _1336 + _1352;
    int _1356 = _1154 ? 0 : 1;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1360 = _1092 + _1358;
    int _1362 = abs(_1350);
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1368 = _1060 + _1366;
    int _1370 = ~_1356;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = _954 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1378 = _1374;
    float _1380 = _1326;
    if (!_1140)
    {
        int _1382 = ~_1356;
        int _1384 = _1382 + 1;
        _1378 = _1384;
    }
    int _1386 = _1378;
    float _1388 = _1340 * _1332;
    float _1390 = float(_1338);
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1394 = float(_1324);
    float _1396 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1364);
    float _1398 = float(_1362);
    float _1400 = _1334 * _886;
    float _1402 = float(_1386);
    float _1404 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1396);
    float _1406 = _1390 * _1394;
    float _1408 = _1304 * (-2.0);
    float _1410 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1302);
    float _1412 = _1398 * _1402;
    bool _1414 = _1404 >= 0.0;
    float _1416 = fma(_1096, _1408, _1096);
    float _1418 = fma(_1408, _1344, _1344);
    float _1420 = _958 + (-0.5);
    float _1422 = _1354 * _1354;
    float _1424 = _1376 * _1392;
    float _1426 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1314);
    float _1428 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1418);
    float _1430 = fma(_1368, _1368, _1422);
    float _1432 = _1406 * (-2.0);
    out.m_67.x = _1388;
    out.m_67.y = _1326;
    out.m_67.z = _1424;
    out.m_67.w = _1400;
    float _1434 = fma(_1416, _1116, _1428);
    float _1436 = fma(_1360, _1360, _1430);
    float _1438 = fma(_1432, _1346, _1346);
    float _1440 = fma(_1084, _1432, _1084);
    if (_1414)
    {
        out.m_47.x = 0.0;
    }
    float _1442 = rsqrt(_1436);
    float _1444 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1438);
    float _1446 = _1434 * 0.15915493667125701904296875;
    float _1448 = fma(_1440, _1116, _1444);
    float _1450 = _1448;
    if (_1414)
    {
        _1380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1452 = _1380;
    float _1454 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1300);
    float _1456 = _1426 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1414)
    {
        float _1458 = _1452 * 5.0;
        _1318 = as_type<int>(_1458);
    }
    int _1460 = _1318;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1464 = _1410 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1468 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1414)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5184 = as_type<float>(_1460);
        out.gl_Position.z = _5184;
    }
    float _1474 = _1354 * _1442;
    float _1476 = _1368 * _1442;
    out.m_69.x = _1470;
    out.m_69.y = _1472;
    out.m_69.z = _1468;
    out.m_69.w = _1466;
    if (_1414)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1478 = -_1474;
    float _1480 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1336);
    float _1482 = _1360 * _1442;
    float _1484 = -_1476;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1060);
    float _1488 = _160 + _958;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1492 = _1480 + _1490;
    float _1494 = -_1482;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1092);
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1500 = _1486 + _1498;
    float _1502 = _1488 + (-1.0);
    float _1504 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1508 = _1496 + _1506;
    float _1510 = _1412 * (-2.0);
    float _1512 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1514 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1504);
    float _1516 = _160 + (-0.5);
    float _1518 = fma(_1510, _1342, _1342);
    float _1520 = -_1474;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1354);
    float _1524 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1514);
    float _1526 = fma(_1512, _1510, _1512);
    float _1528 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1518);
    float _1530 = -_1476;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1368);
    float _1534 = _1522 * _1522;
    bool _1536 = _1524 >= 0.0;
    float _1538 = fma(_1526, _1116, _1528);
    float _1540 = -_1482;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1360);
    float _1544 = fma(_1532, _1532, _1534);
    float _1546 = _1448 * 0.15915493667125701904296875;
    float _1548 = _1538 * 0.15915493667125701904296875;
    float _1550 = _1446 * 6.283185482025146484375;
    float _1552 = sin(_1550);
    float _1554 = fma(_1542, _1542, _1544);
    if (_1536)
    {
        _1450 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1556 = _1450;
    float _1558 = _1446 * 6.283185482025146484375;
    float _1560 = cos(_1558);
    int _1562 = as_type<int>(_1556);
    if (_1536)
    {
        out.m_47.x = 0.0;
    }
    if (_1536)
    {
        float _1564 = _1556 * 5.0;
        _1562 = as_type<int>(_1564);
    }
    int _1566 = _1562;
    float _1568 = _1546 * 6.283185482025146484375;
    float _1570 = sin(_1568);
    if (_1536)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5368 = as_type<float>(_1566);
        out.gl_Position.z = _5368;
    }
    float _1572 = _1546 * 6.283185482025146484375;
    float _1574 = cos(_1572);
    float _1576 = _1548 * 6.283185482025146484375;
    float _1578 = sin(_1576);
    float _1580 = sqrt(_1554);
    if (_1536)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1582 = -_1336;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1586 = -_1060;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1590 = _1548 * 6.283185482025146484375;
    float _1592 = cos(_1590);
    float _1594 = -_1092;
    float _1596 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1598 = _1584 * _1584;
    float _1600 = _1560 * _1574;
    float _1602 = _1552 * _1570;
    float _1604 = _1442 * _1580;
    float _1606 = fma(_1588, _1588, _1598);
    float _1608 = _1560 * _1570;
    float _1610 = fma(_1578, _1602, _1600);
    float _1612 = fma(_1578, _1600, _1602);
    float _1614 = fma(_1596, _1596, _1606);
    float _1616 = _1552 * _1574;
    float _1618 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1620 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1622 = precise::clamp(_1620, 0.0, 1.0);
    float _1624 = rsqrt(_1614);
    float _1626 = _1570 * _1592;
    float _1628 = _1574 * _1592;
    float _1630 = _1552 * _1592;
    float _1632 = _1560 * _1592;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1634;
    float _1638 = in.m_71.x;
    float _1640 = in.m_71.y;
    float _1642 = in.m_71.z;
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1646 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1644;
    float _1648 = _1636 * _1636;
    float _1650 = -_1616;
    float _1652 = fma(_1578, _1608, _1650);
    float _1654 = -_1608;
    float _1656 = fma(_1578, _1616, _1654);
    float _1658 = _1604 * _1618;
    float _1660 = fma(_1622, -0.64999997615814208984375, 1.0);
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1664 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1662;
    float _1666 = _1588 * _1624;
    float _1668 = _1596 * _1624;
    float _1670 = _1584 * _1624;
    float _1672 = fma(_1646, _1646, _1648);
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1676 = _1666 * _1674;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1680 = _1668 * _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1684 = _1670 * _1682;
    float _1686 = fma(_1664, _1664, _1672);
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1690 = -_1676;
    float _1692 = fma(_1668, _1688, _1690);
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1696 = -_1680;
    float _1698 = fma(_1670, _1694, _1696);
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1702 = -_1684;
    float _1704 = fma(_1666, _1700, _1702);
    float _1706 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1708 = _1692 * _1692;
    float _1710 = rsqrt(_1686);
    float _1712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1638);
    float _1714 = _1604 * _1706;
    float _1716 = fma(_1698, _1698, _1708);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1640);
    float _1720 = _1712 * _1658;
    float _1722 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1724 = fma(_1704, _1704, _1716);
    float _1726 = sqrt(_1686);
    float _1728 = _1718 * _1714;
    float _1730 = _1604 * _1722;
    float _1732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1642);
    bool _1734 = _1640 != 0.0;
    bool _1736 = isnan(_1640);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = _1628 * _1728;
    float _1746 = _1612 * _1728;
    float _1748 = _1732 * _1730;
    float _1750 = rsqrt(_1724);
    float _1752 = _1656 * _1728;
    float _1754 = _1710 * (-0.20000000298023223876953125);
    float _1756 = fma(_1626, _1720, _1744);
    float _1758 = fma(_1652, _1720, _1746);
    float _1760 = fma(_1610, _1720, _1752);
    float _1762 = fma(_1646, _1754, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1764 = _1638 == 0.0;
    bool _1766 = !_1742;
    bool _1768 = _1764 && _1766;
    float _1770 = _1726 * 0.066666670143604278564453125;
    float _1772 = fma(_1630, _1748, _1760);
    float _1774 = fma(_1636, _1754, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1776 = -_1578;
    float _1778 = fma(_1776, _1748, _1756);
    float _1780 = fma(_1632, _1748, _1758);
    float _1782 = fma(_1664, _1754, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1784 = -_1774;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1788 = precise::max(_1770, 1.0);
    float _1790 = _1704 * _1750;
    float _1792 = _1692 * _1750;
    float _1794 = _1698 * _1750;
    float _1796 = _1786 * _1786;
    float _1798 = _1666 * _1790;
    float _1800 = _1668 * _1792;
    float _1802 = precise::min(_1788, 2.0);
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1806 = _1774 + _1804;
    float _1808 = -_1798;
    float _1810 = fma(_1668, _1794, _1808);
    float _1812 = _1670 * _1794;
    float _1814 = -_1800;
    float _1816 = fma(_1670, _1790, _1814);
    float _1818 = _1802 * _1660;
    float _1820 = _1810 * _1778;
    float _1822 = -_1812;
    float _1824 = fma(_1666, _1792, _1822);
    float _1826 = _1816 * _1778;
    float _1828 = -_1762;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1832 = fma(_1792, _1772, _1820);
    float _1834 = _1824 * _1778;
    float _1836 = fma(_1794, _1772, _1826);
    bool _1838 = _1642 == 0.0;
    bool _1840 = _1838 && _1768;
    float _1842 = fma(_1670, _1780, _1832);
    float _1844 = fma(_1790, _1772, _1834);
    float _1846 = fma(_1666, _1780, _1836);
    float _1848 = fma(_1830, _1830, _1796);
    float _1850 = _1336 + _1842;
    float _1852 = -_1782;
    float _1854 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1060 + _1846;
    float _1858 = in.m_73.x;
    float _1860 = in.m_73.y;
    float _1862 = in.m_73.z;
    float _1864 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1866 = _1850 + _1864;
    float _1868 = fma(_1668, _1780, _1844);
    float _1870 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1872 = _1856 + _1870;
    float _1874 = fma(_1854, _1854, _1848);
    float _1876 = fma(_1866, _1818, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1878 = _1092 + _1868;
    float _1880 = fma(_1872, _1818, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1884 = _1762 + _1882;
    float _1886 = -_1876;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1890 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1892 = _1878 + _1890;
    float _1894 = -_1880;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1898 = _1806 * _1806;
    float _1900 = _1888 * _1888;
    float _1902 = fma(_1892, _1818, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1906 = _1782 + _1904;
    float _1908 = fma(_1884, _1884, _1898);
    float _1910 = fma(_1896, _1896, _1900);
    float _1912 = -_1902;
    float _1914 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1916 = in.m_75.x;
    float _1918 = in.m_75.y;
    float _1920 = in.m_75.z;
    float _1922 = in.m_75.w;
    float _1924 = fma(_1906, _1906, _1908);
    float _1926 = sqrt(_1874);
    float _1928 = fma(_1914, _1914, _1910);
    float _1930 = _1626 * _1810;
    float _1932 = _1910;
    float _1934 = _1908;
    float _1936 = _1914;
    float _1938 = _1858;
    float _1940 = _1612;
    if (_1840)
    {
        _1932 = _1858;
    }
    float _1942 = _1932;
    float _1944 = _1626 * _1824;
    float _1946 = _1942;
    if (_1840)
    {
        _1934 = _1862;
    }
    float _1948 = _1934;
    float _1950 = _1948;
    if (!_1840)
    {
        float _1952 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1862);
        _1950 = _1952;
    }
    float _1954 = _1950;
    if (_1840)
    {
        _1936 = _1942;
    }
    float _1956 = _1936;
    float _1958 = sqrt(_1928);
    float _1960 = _1956;
    if (!_1840)
    {
        _1946 = _1858;
    }
    float _1962 = _1946;
    float _1964 = fma(_1610, _1790, _1944);
    if (_1840)
    {
        _1938 = _1860;
    }
    float _1966 = _1938;
    float _1968 = _1966;
    if (!_1840)
    {
        float _1970 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1860);
        _1968 = _1970;
    }
    float _1972 = _1968;
    if (!_1840)
    {
        float _1974 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1962);
        _1960 = _1974;
    }
    float _1976 = _1960;
    float _1978 = rsqrt(_1924);
    float _1980 = _1920 * _1962;
    float _1982 = _1918 * _1862;
    float _1984 = -_1926;
    float _1986 = _1958 + _1984;
    float _1988 = _1916 * _1860;
    float _1990 = -_1980;
    float _1992 = fma(_1916, _1862, _1990);
    float _1994 = -_1982;
    float _1996 = fma(_1920, _1860, _1994);
    float _1998 = _1628 * _1824;
    float _2000 = -_1988;
    float _2002 = fma(_1918, _1962, _2000);
    float _2004 = _1992 * _1922;
    float _2006 = _1996 * _1922;
    float _2008 = _1978 * _1986;
    float _2010 = _2002 * _1922;
    float _2012 = _1626 * _1816;
    float _2014 = _1628 * _1816;
    float _2016 = -_2008;
    float _2018 = fma(_1884, _2016, _1880);
    float _2020 = -_2008;
    float _2022 = fma(_1906, _2020, _1902);
    float _2024 = _1628 * _1810;
    float _2026 = -_1816;
    float _2028 = _1578 * _2026;
    float _2030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2032 = _2018 + _2030;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2036 = _2022 + _2034;
    float _2038 = -_1810;
    float _2040 = _1578 * _2038;
    float _2042 = -_1824;
    float _2044 = _1578 * _2042;
    float _2046 = _2032 * _2032;
    float _2048 = _2036 * _2036;
    float _2050 = fma(_1656, _1794, _2014);
    float _2052 = fma(_1656, _1792, _2024);
    float _2054 = fma(_1656, _1790, _1998);
    float _2056 = _2046 + _2048;
    float _2058 = fma(_1610, _1794, _2012);
    float _2060 = fma(_1610, _1792, _1930);
    float _2062 = fma(_1630, _1790, _2044);
    float _2064 = sqrt(_2056);
    float _2066 = fma(_1630, _1794, _2028);
    float _2068 = fma(_1630, _1792, _2040);
    float _2070 = fma(_1612, _1666, _2050);
    float _2072 = fma(_1612, _1670, _2052);
    float _2074 = fma(_1612, _1668, _2054);
    float _2076 = fma(_1652, _1666, _2058);
    float _2078 = fma(_1652, _1670, _2060);
    float _2080 = fma(_1652, _1668, _1964);
    float _2082 = fma(_1632, _1668, _2062);
    float _2084 = fma(_1632, _1666, _2066);
    float _2086 = fma(_1632, _1670, _2068);
    float _2088 = _2070 * _1918;
    float _2090 = _2072 * _1918;
    float _2092 = _2074 * _1918;
    float _2094 = _2070 * _1972;
    bool _2096 = _2064 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2098 = _2004 * _2070;
    float _2100 = _2072 * _1972;
    float _2102 = _2004 * _2072;
    float _2104 = _2074 * _1972;
    float _2106 = _2004 * _2074;
    float _2108 = -_2008;
    float _2110 = fma(_1806, _2108, _1876);
    float _2112 = _2110;
    float _2114 = _2046;
    float _2116 = _2048;
    float _2118 = _2022;
    float _2120 = _2010;
    if (!_2096)
    {
        _1940 = _2018;
    }
    float _2122 = _1940;
    bool _2124 = !_2096;
    float _2126 = _2122;
    if (!_2124)
    {
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2132 = _2064 + _2130;
        float _2134 = rsqrt(_2056);
        float _2136 = _2132 * _2128;
        float _2138 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2140 = _2136 * 0.15915493667125701904296875;
        float _2142 = _2140 * 6.283185482025146484375;
        float _2144 = sin(_2142);
        float _2146 = _2140 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = fma(_2144, _2138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2152 = _2134 * _2150;
        float _2154 = fma(_2032, _2152, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2156 = _2148 + (-1.0);
        float _2158 = fma(_2036, _2152, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2162 = _2154 + _2160;
        float _2164 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2168 = _2158 + _2166;
        float _2170 = _2162 * _2162;
        float _2172 = fma(_2110, _2148, _2164);
        float _2174 = _2168 * _2168;
        _2112 = _2172;
        _2114 = _2170;
        _2116 = _2174;
        _2126 = _2154;
        _2118 = _2158;
    }
    float _2176 = _2112;
    float _2178 = _2114;
    float _2180 = _2116;
    float _2182 = _2126;
    float _2184 = _2118;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2188 = _2176 + _2186;
    float _2190 = fma(_2076, _1976, _2094);
    float _2192 = fma(_2076, _1916, _2088);
    float _2194 = fma(_2078, _1916, _2090);
    float _2196 = fma(_2188, _2188, _2178);
    float _2198 = fma(_2078, _1976, _2100);
    float _2200 = fma(_2080, _1976, _2104);
    float _2202 = fma(_2006, _2076, _2098);
    float _2204 = _2196 + _2180;
    float _2206 = fma(_2080, _1916, _2092);
    float _2208 = fma(_2006, _2078, _2102);
    float _2210 = fma(_2006, _2080, _2106);
    float _2212 = fma(_2084, _1920, _2192);
    float _2214 = fma(_2086, _1920, _2194);
    float _2216 = sqrt(_2204);
    float _2218 = fma(_2084, _1954, _2190);
    float _2220 = fma(_2010, _2084, _2202);
    float _2222 = fma(_2086, _1954, _2198);
    float _2224 = fma(_2010, _2086, _2208);
    float _2226 = fma(_2010, _2082, _2210);
    float _2228 = fma(_2082, _1954, _2200);
    float _2230 = fma(_2082, _1920, _2206);
    out.m_55.x = _788;
    out.m_55.y = _804;
    out.m_55.z = _806;
    out.m_55.w = _808;
    out.m_69.x = _1470;
    out.m_69.y = _1472;
    out.m_69.z = _1468;
    out.m_69.w = _1466;
    out.m_77.x = _2220;
    out.m_77.y = _2224;
    out.m_77.z = _2226;
    bool _2232 = _2216 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2234 = isnan(_2216);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2240 = _2236 || _2238;
    out.m_79.x = _2218;
    out.m_79.y = _2222;
    out.m_79.z = _2228;
    out.m_81.x = _2212;
    out.m_81.y = _2214;
    out.m_81.z = _2230;
    float _2242 = _2230;
    float _2244 = _2220;
    float _2246 = _2224;
    if (!_2240)
    {
        _2120 = 1.0;
    }
    float _2248 = _2120;
    bool _2250 = !_2240;
    float _2252 = _2248;
    if (!_2250)
    {
        bool _2254 = _2216 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2256 = isnan(_2216);
        bool _2258 = _2254 || _2256;
        bool _2260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2262 = _2258 || _2260;
        if (!_2262)
        {
            float _2264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2266 = _2216 + _2264;
            float _2268 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2270 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2268;
            float _2272 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2274 = _2272 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2276 = 1.0 / _2270;
            float _2278 = _2266 * _2276;
            float _2280 = fma(_2278, _2274, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2252 = _2280;
            _2282 = true;
        }
        else
        {
            bool _2284 = _2216 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2286 = isnan(_2216);
            bool _2288 = _2284 || _2286;
            bool _2290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2292 = _2288 || _2290;
            if (!_2292)
            {
                float _2294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2296 = _2216 + _2294;
                float _2298 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2300 = _2298 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2302 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2304 = _2302 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2306 = 1.0 / _2300;
                float _2308 = _2296 * _2306;
                float _2310 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2252 = _2310;
                _2282 = true;
            }
            else
            {
                _2252 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2282 = false;
    float _2312 = _2252;
    float _2314 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2316 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2318 = _2182 + _2316;
    float _2320 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2314);
    float _2322 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2324 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2326 = _2176 + _2324;
    float _2328 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2320);
    bool _2330 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2332 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan(0.5);
    bool _2338 = _2334 || _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2342 = _2184 + _2340;
    bool _2344 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2346 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan(0.5);
    bool _2352 = _2348 || _2350;
    float _2354 = _2328 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2356 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2322);
    float _2358 = fma(_2326, _2312, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2360 = fma(_2342, _2312, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2362 = 1.0 / _2354;
    float _2364 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2368 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2352)
    {
        _2368 = 1.0;
    }
    float _2370 = _2368;
    float _2372 = _2366 + _2354;
    float _2374 = -_1474;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2358);
    float _2378 = _2372 * _2362;
    float _2380 = _2378 * 0.5;
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2384 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2382);
    float _2386 = fma(_2318, _2312, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2388 = -_1482;
    float _2390 = fma(_2388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2360);
    float _2392 = 1.0 / _2384;
    float _2394 = -_1476;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2386);
    float _2398 = _2376;
    float _2400 = _2396;
    float _2402 = _2390;
    float _2404 = _2386;
    float _2406 = _2370;
    if (!_2338)
    {
        float _2408 = _1492 * _1492;
        float _2410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2412 = -_1092;
        float _2414 = _2412 + _2360;
        float _2416 = -_1336;
        float _2418 = _2416 + _2358;
        float _2420 = fma(_1500, _1500, _2408);
        float _2422 = fma(_1508, _1508, _2420);
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2426 = sqrt(_2422);
        float _2428 = 1.0 / _1604;
        float _2430 = precise::min(_2426, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2432 = _2430 * _2410;
        float _2434 = _2424 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2436 = _2432 * _2428;
        float _2438 = -_1060;
        float _2440 = _2438 + _2386;
        float _2442 = _2434 * _2436;
        float _2444 = _2414 * _2436;
        float _2446 = fma(_2440, _2442, _1486);
        float _2448 = fma(_2418, _2442, _1480);
        float _2450 = fma(_2434, _2444, _1496);
        _2398 = _2448;
        _2400 = _2446;
        _2402 = _2450;
    }
    float _2452 = _2398;
    float _2454 = _2400;
    float _2456 = _2402;
    if (_2352)
    {
        _2404 = 1.0;
    }
    float _2458 = _2404;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2462 = _2392 * _2460;
    float _2464 = _2458;
    if (!_2352)
    {
        float _2466 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2470 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2468;
        float _2472 = _2466 * 0.15915493667125701904296875;
        float _2474 = _2472 * 6.283185482025146484375;
        float _2476 = cos(_2474);
        float _2478 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2480 = _2478 * 0.15915493667125701904296875;
        float _2482 = _2472 * 6.283185482025146484375;
        float _2484 = sin(_2482);
        float _2486 = 1.0 / _2476;
        float _2488 = _2480 * 6.283185482025146484375;
        float _2490 = cos(_2488);
        float _2492 = _2484 * _2486;
        float _2494 = _2480 * 6.283185482025146484375;
        float _2496 = sin(_2494);
        float _2498 = _2490 * _2492;
        float _2500 = 1.0 / _2470;
        float _2502 = 1.0 / _2498;
        float _2504 = _2496 * _2502;
        float _2506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2508 = fma(_2462, _2504, _2506);
        float _2510 = _2508 * _2500;
        float _2512 = precise::clamp(_2510, 0.0, 1.0);
        _2242 = _2500;
        _2406 = _2512;
    }
    float _2514 = _2242;
    float _2516 = _2406;
    float _2518 = _2514;
    if (!_2352)
    {
        float _2520 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2522 = _2520 * 0.15915493667125701904296875;
        float _2524 = _2522 * 6.283185482025146484375;
        float _2526 = cos(_2524);
        float _2528 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2530 = _2528 * 0.15915493667125701904296875;
        float _2532 = _2522 * 6.283185482025146484375;
        float _2534 = sin(_2532);
        float _2536 = 1.0 / _2526;
        float _2538 = _2530 * 6.283185482025146484375;
        float _2540 = cos(_2538);
        float _2542 = _2534 * _2536;
        float _2544 = _2530 * 6.283185482025146484375;
        float _2546 = sin(_2544);
        float _2548 = _2540 * _2542;
        float _2550 = 1.0 / _2548;
        float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2554 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2552;
        float _2556 = 1.0 / _2554;
        float _2558 = _2546 * _2550;
        float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2562 = fma(_2462, _2558, _2560);
        float _2564 = _2562 * _2556;
        float _2566 = precise::clamp(_2564, 0.0, 1.0);
        float _2568 = -_2566;
        float _2570 = _2568 + 1.0;
        _2518 = _2526;
        _2464 = _2570;
    }
    float _2572 = _2518;
    float _2574 = _2464;
    float _2576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2578 = _2452 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2582 = _2454 + _2580;
    float _2584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2586 = _2456 + _2584;
    float _2588 = _2578 * _2578;
    float _2590 = fma(_2582, _2582, _2588);
    float _2592 = fma(_2586, _2586, _2590);
    float _2594 = rsqrt(_2592);
    float _2596 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2598 = _2582 * _2596;
    float _2600 = _2586 * _2596;
    float _2602 = _2598 * _2598;
    float _2604 = _2600 * _2600;
    float _2606 = _2602 + _2604;
    float _2608 = sqrt(_2606);
    bool _2610 = _2608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2614 = _2608 + _2612;
    float _2616 = _2586;
    float _2618 = _2606;
    float _2620 = _2614;
    float _2622 = _2598;
    if (_2610)
    {
        float _2624 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2616 = _2624;
    }
    float _2626 = _2616;
    if (_2610)
    {
        float _2628 = rsqrt(_2606);
        _2618 = _2628;
    }
    float _2630 = _2618;
    float _2632 = _2630;
    if (_2610)
    {
        float _2634 = _2614 * _2626;
        _2620 = _2634;
    }
    float _2636 = _2620;
    if (_2610)
    {
        float _2638 = _2636 * 0.15915493667125701904296875;
        _2244 = _2638;
    }
    float _2640 = _2244;
    float _2642 = _2594;
    if (_2610)
    {
        float _2644 = _2640 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        _2642 = _2646;
    }
    float _2648 = _2642;
    float _2650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2652 = precise::max(0.0, _2650);
    float _2654 = _2572;
    float _2656 = _2652;
    float _2658 = _2650;
    if (_2610)
    {
        float _2660 = _2640 * 6.283185482025146484375;
        float _2662 = cos(_2660);
        _2654 = _2662;
    }
    float _2664 = _2654;
    float _2666 = -_2596;
    float _2668 = -_2652;
    float _2670 = fma(_2578, _2666, _2668);
    if (_2610)
    {
        float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2656 = _2672;
    }
    float _2674 = _2656;
    float _2676 = sqrt(_2592);
    float _2678 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2680 = _2648;
    float _2682 = _2674;
    if (_2610)
    {
        float _2684 = fma(_2648, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2680 = _2684;
    }
    float _2686 = _2680;
    float _2688 = _2686;
    if (!_2610)
    {
        _2682 = _2600;
    }
    float _2690 = _2682;
    float _2692 = _2690;
    if (_2610)
    {
        float _2694 = _2664 + (-1.0);
        _2658 = _2694;
    }
    float _2696 = _2658;
    float _2698 = _2696;
    if (_2610)
    {
        float _2700 = _2630 * _2686;
        _1112 = _2700;
    }
    float _2702 = _1112;
    if (!_2610)
    {
        _2688 = _2670;
    }
    float _2704 = _2688;
    float _2706 = _2704;
    if (_2610)
    {
        float _2708 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2246 = _2708;
    }
    float _2710 = _2246;
    if (_2610)
    {
        float _2712 = _2598 * _2702;
        _2622 = _2712;
    }
    float _2714 = _2622;
    if (!_2610)
    {
        _2632 = _2602;
    }
    float _2716 = _2632;
    float _2718 = _2716;
    if (_2610)
    {
        float _2720 = _2600 * _2702;
        _2692 = _2720;
    }
    float _2722 = _2692;
    if (_2610)
    {
        float _2724 = fma(_2670, _2664, _2710);
        _2706 = _2724;
    }
    float _2726 = _2706;
    if (_2610)
    {
        float _2728 = _2714 * _2714;
        _2718 = _2728;
    }
    float _2730 = _2718;
    if (!_2610)
    {
        _2698 = _2604;
    }
    float _2732 = _2698;
    float _2734 = _2732;
    if (_2610)
    {
        float _2736 = _2722 * _2722;
        _2734 = _2736;
    }
    float _2738 = _2734;
    float _2740 = fma(_2726, _2726, _2730);
    float _2742 = _2740 + _2738;
    float _2744 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2748 = fma(_2676, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2746);
    float _2750 = precise::clamp(_2748, 0.0, 1.0);
    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2754 = rsqrt(_2742);
    float _2756 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2744);
    float _2758 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2760 = -_2750;
    float _2762 = _2760 + 1.0;
    float _2764 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2766 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2756);
    float _2768 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2758);
    float _2770 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2764);
    float _2772 = _2766 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2774 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2768);
    float _2776 = abs(_2762);
    float _2778 = log2(_2776);
    float _2780 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2770);
    float _2782 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2678);
    float _2784 = _2774 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2786 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2788 = _2754 * _2714;
    float _2790 = _2780 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2792 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2794 = _2754 * _2726;
    float _2796 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2798 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2782);
    float _2800 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2792);
    float _2802 = _2754 * _2722;
    float _2804 = -_2796;
    float _2806 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2804);
    float _2808 = _2798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2810 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2800);
    float _2812 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2814 = -_2802;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2806);
    float _2818 = -_2786;
    float _2820 = fma(_2818, _2752, 1.0);
    float _2822 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2810);
    float _2824 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2826 = fma(_2816, -0.5, 0.5);
    float _2828 = exp2(_2812);
    float _2830 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2832 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2824);
    float _2834 = fma(_2816, 0.5, 0.5);
    float _2836 = _2794 + 1.0;
    float _2838 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2830);
    float _2840 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2832);
    float _2842 = fma(_2834, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2844 = log2(_2820);
    float _2846 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2838);
    float _2848 = fma(_2834, _2842, -0.212114393711090087890625);
    float _2850 = fma(_2834, _2848, 1.570728778839111328125);
    float _2852 = 1.0 / _2822;
    float _2854 = -_2794;
    float _2856 = fma(_2828, _2836, _2854);
    float _2858 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2840);
    float _2860 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2846);
    float _2862 = fma(_2856, 0.5, 0.5);
    float _2864 = sqrt(_2826);
    float _2866 = _2844 * 0.693147182464599609375;
    float _2868 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2870 = _2858 * _2852;
    float _2872 = _2860 * _2852;
    float _2874 = fma(_2870, 0.5, 0.5);
    float _2876 = fma(_2872, -0.5, 0.5);
    float _2878 = _2864 * 0.636619746685028076171875;
    float _2880 = -_2850;
    float _2882 = fma(_2878, _2880, 1.0);
    float3 _7476 = float3(_2874, _2876, _2868);
    float _2884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7476, float3(0.0), isnan(_7476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7476, float3(0.0), isnan(_7476)), level(0.0)).x;
    float3 _7487 = float3(_2874, _2876, _2868);
    float4 _2887 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7487, float3(0.0), isnan(_7487)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7487, float3(0.0), isnan(_7487)), level(0.0)).xyzw;
    float _2889 = _2887.x;
    float _2891 = _2887.y;
    float _2893 = _2887.z;
    float _2895 = _2887.w;
    float2 _7504 = float2(_2882, _2862);
    float3 _2899 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7504, float2(0.0), isnan(_7504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7504, float2(0.0), isnan(_7504)), level(0.0)).xyz;
    float _2901 = _2899.x;
    float _2903 = _2899.y;
    float _2905 = _2899.z;
    float _2907 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2909 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2911 = _2516 * _2574;
    bool _2913 = _2516 > 0.0;
    bool _2915 = isnan(_2516);
    bool _2917 = _2913 || _2915;
    bool _2919 = isnan(0.0);
    bool _2921 = _2917 || _2919;
    float _2923 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2909);
    float _2925 = exp2(_2907);
    float _2927 = _2911 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2929 = _2574 <= 0.0;
    bool _2931 = !_2921;
    bool _2933 = _2929 || _2931;
    float _2935 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2923);
    float _2937 = _2822 * 0.5;
    float _2939 = _248 * _2927;
    float _2941 = _2858 + _2822;
    float _2943 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2935);
    float _2945 = fma(_2860, -0.5, _2937);
    float _2947 = _2941 * 0.5;
    float _2949 = _2943 + _2822;
    out.gl_Position.x = _2858;
    out.gl_Position.y = _2860;
    out.gl_Position.z = _2943;
    out.gl_Position.w = _2822;
    float _2951 = _2939 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2953 = _2949 * 0.5;
    float _2955 = -_2925;
    float _2957 = _2955 + 1.0;
    out.m_47.x = _2951;
    float _2959 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2947;
    out.m_83.y = _2945;
    out.m_83.z = _2953;
    out.m_83.w = _2822;
    float _2961 = -_2959;
    float _2963 = _2961 + 1.0;
    float _2965 = _2959 * _2884;
    float _2967 = _2895 * _2963;
    float _2969 = _2895 * _2965;
    float _2971 = _2905 * _2965;
    float _2973 = fma(_2901, _2969, _2889);
    float _2975 = fma(_2903, _2969, _2891);
    float _2977 = fma(_2895, _2971, _2893);
    out.m_85.x = _2973;
    out.m_85.y = _2975;
    out.m_85.z = _2977;
    out.m_85.w = _2967;
    if (!_2933)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2979 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2979;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

