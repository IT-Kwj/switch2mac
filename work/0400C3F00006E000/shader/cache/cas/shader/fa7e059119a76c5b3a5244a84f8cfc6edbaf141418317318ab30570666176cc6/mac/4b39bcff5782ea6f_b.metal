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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture2d<float> vp_t_tcb_A [[id(6)]];
    sampler vp_t_tcb_ASmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_ASmplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_105 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_97 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_103 [[user(locn15)]];
    float4 m_101 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_69 [[attribute(2)]];
    float4 m_75 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_91 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_87 [[attribute(11)]];
    float4 m_65 [[attribute(12)]];
    float4 m_71 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3854 = false;
    bool _906 = false;
    bool _822 = false;
    bool _624 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_46.w;
    float _121 = in.m_48.w;
    float _123 = trunc(_119);
    int _126 = int(_123);
    float _128 = -_121;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _130;
    bool _134 = _126 >= 1;
    float _136 = 0.0;
    float _138 = _121;
    float _140 = _130;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _136;
    if (!_134)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_134)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4112 = as_type<float>(_148);
        out.gl_Position.z = _4112;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _152 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_121);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = float(_126);
    bool _164 = _130 >= _162;
    bool _166 = !_160;
    bool _168 = _164 || _166;
    float _170 = 1.0 / _162;
    if (_168)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _138;
    if (_168)
    {
        out.m_53.x = 0.0;
    }
    float _174 = _130 * _170;
    float _176 = _174;
    if (_168)
    {
        float _178 = _172 * 5.0;
        _150 = as_type<int>(_178);
    }
    int _180 = _150;
    out.m_51.x = _174;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4175 = as_type<float>(_180);
        out.gl_Position.z = _4175;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = in.m_55.x;
    float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _186 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _194 = _192 != 0;
    int _196 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _198 = _196 != 0;
    float _200 = _186 * _184;
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[20].x, _200);
    float _204 = _202 * 6.283185482025146484375;
    float _206 = floor(_202);
    float _208 = _204 * 0.15915493667125701904296875;
    bool _210 = !_190;
    int _212 = _210 ? 0 : 1;
    int _214 = abs(_212);
    float _216 = _208 * 6.283185482025146484375;
    float _218 = cos(_216);
    bool _220 = !_198;
    int _222 = _220 ? 0 : 1;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _226 = abs(_222);
    float _228 = -_206;
    float _230 = _202 + _228;
    bool _232 = !_194;
    int _234 = _232 ? 0 : 1;
    float _236 = float(_214);
    int _238 = abs(_234);
    float _240 = -_230;
    float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _244 = fma(_218, 0.5, 0.5);
    float _246 = abs(_242);
    float _248 = _236 * _246;
    bool _250 = _230 < 0.5;
    float _252 = float(_250);
    float _254 = float(_226);
    float _256 = -_244;
    float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _260 = float(_238);
    float _262 = -_252;
    float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _266 = fma(_254, _258, _248);
    float _268 = abs(_264);
    float _270 = fma(_260, _268, _266);
    bool _272 = !_224;
    float _288;
    if (!_272)
    {
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        _288 = _174;
    }
    _290 = false;
    float _292 = _288;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = 1.0 / _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _312;
    float _316 = 1.0 / _300;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _320 = _292 + _318;
    bool _322 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _324 = isnan(_292);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _308;
    float _348 = _320 * _310;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _352 = _292 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _356 = _292 + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _360 = _292 + _358;
    float _362 = 1.0 / _314;
    float _364 = _352 * _316;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _368 = 1.0 / _304;
    float _370 = _356 * _346;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = fma(_374, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _380 = _292 + _378;
    float _382 = _380 * _362;
    bool _384 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _386 = isnan(_292);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = _360 * _368;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -_394;
    float _408 = _406 + 1.0;
    float _410 = fma(_398, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = fma(_404, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _414 = -_332;
    float _416 = _414 + 1.0;
    float _418 = _332 * _408;
    bool _420 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _422 = isnan(_292);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _440 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_292);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _456 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _458 = isnan(_292);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_430;
    float _470 = _468 + 1.0;
    float _472 = _430 * _416;
    float _474 = fma(_434, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _476 = fma(_454, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = fma(_438, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _480 = -_466;
    float _482 = _480 + 1.0;
    float _484 = _344 * _470;
    float _486 = -_344;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _490;
    float _494 = _450 * _482;
    float _496 = -_450;
    float _498 = _496 + 1.0;
    float _500 = _466 * _488;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _502;
    float _506 = _412 * _494;
    float _508 = _376 * _494;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _510;
    float _514 = fma(_504, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _516 = _410 * _494;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _522 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[143].x, _506);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _532 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[143].y, _508);
    float _534 = fma(_512, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _536 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[143].z, _516);
    float _538 = fma(_520, _370, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _540 = fma(_526, _370, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _542 = fma(_530, _370, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _544 = fma(_474, _500, _522);
    float _546 = fma(_476, _500, _532);
    float _548 = in.m_57.x;
    float _550 = in.m_57.y;
    float _552 = in.m_57.z;
    float _554 = fma(_478, _500, _536);
    float _556 = fma(_492, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _558 = fma(_514, _484, _544);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _560;
    float _564 = fma(_534, _484, _546);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _566;
    float _570 = fma(_556, _484, _554);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _572;
    float _576 = fma(_562, _382, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _578 = fma(_568, _382, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _580 = fma(_542, _472, _570);
    float _582 = fma(_574, _382, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _584 = fma(_540, _472, _564);
    float _586 = fma(_538, _472, _558);
    float _588 = fma(_582, _418, _580);
    float _590 = fma(_578, _418, _584);
    float _592 = fma(_576, _418, _586);
    float _594 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[148].z, _588);
    float _596 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[148].y, _590);
    float _598 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[148].x, _592);
    float _600 = _594 * _552;
    float _602 = _596 * _550;
    float _604 = _598 * _548;
    bool _606 = !_366;
    float _622;
    if (!_606)
    {
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _610 = _182 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        _622 = _174;
    }
    _624 = false;
    float _626 = _622;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _626 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _644 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _646 = isnan(_626);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = 1.0 / _634;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _662 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _664 = isnan(_626);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    bool _674 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _676 = 1.0 / _642;
    float _678 = _638 * _656;
    bool _680 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _682 = isnan(_626);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _660;
    float _694 = -_654;
    float _696 = _694 + 1.0;
    float _698 = fma(_678, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _704 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _706 = isnan(_626);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -_690;
    float _718 = _716 + 1.0;
    float _720 = _690 * _696;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _726 = 1.0 / _702;
    float _728 = -_714;
    float _730 = _728 + 1.0;
    float _732 = _672 * _718;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _734;
    float _738 = _724 * _676;
    float _740 = _654 * _730;
    float _742 = _698 * _732;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _746 = _626 + _744;
    float _748 = -_672;
    float _750 = _748 + 1.0;
    bool _752 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _754 = isnan(_626);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = _736 * _692;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _772 = _626 + _770;
    float _774 = fma(_738, _746, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _776 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[115].x, _742);
    float _778 = -_762;
    float _780 = _778 + 1.0;
    float _782 = _768 * _726;
    float _784 = fma(_764, _772, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _788 = _626 + _786;
    float _790 = fma(_774, _720, _776);
    float _792 = _714 * _780;
    float _794 = fma(_782, _788, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _796 = fma(_784, _740, _790);
    float _798 = fma(_794, _792, _796);
    float _800 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[119].x, _798);
    float _802 = _800 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.w = _802;
    bool _804 = !_674;
    float _820;
    if (!_804)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _808 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        _820 = _174;
    }
    _822 = false;
    float _824 = _820;
    bool _826 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _828 = isnan(_824);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _842 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _844 = isnan(_824);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _860 = _824 + _858;
    float _862 = -_836;
    float _864 = _862 + 1.0;
    bool _866 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _868 = 1.0 / _840;
    float _870 = _852 * _864;
    float _872 = -_852;
    float _874 = _872 + 1.0;
    float _876 = _856 * _868;
    float _878 = fma(_876, _860, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _880 = _878 * _870;
    float _882 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[131].x, _880);
    float _884 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[132].x, _882);
    float _886 = _884 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.w = _886;
    bool _888 = !_866;
    float _904;
    if (!_888)
    {
        float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _892 = _182 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _896 = _894 * _890;
        float _898 = floor(_896);
        float _900 = -_898;
        float _902 = _896 + _900;
        _904 = _902;
        _906 = true;
    }
    else
    {
        _904 = _174;
    }
    _906 = false;
    float _908 = _904;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _912 = _908 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _916 = _908 + _914;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _934 = 1.0 / _920;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _944 = 1.0 / _924;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _948 = _908 + _946;
    bool _950 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _952 = 1.0 / _932;
    float _954 = _948 * _934;
    bool _956 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _958 = isnan(_908);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _968;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _974 = _908 + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _978 = _908 + _976;
    float _980 = 1.0 / _928;
    float _982 = _912 * _944;
    float _984 = -_966;
    float _986 = _984 + 1.0;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _990 = _908 + _988;
    float _992 = 1.0 / _938;
    bool _994 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _996 = isnan(_908);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = _974 * _952;
    bool _1008 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1010 = isnan(_908);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = 1.0 / _942;
    bool _1022 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1024 = isnan(_908);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = _916 * _980;
    bool _1036 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1038 = isnan(_908);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = 1.0 / _970;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1052 = _908 + _1050;
    float _1054 = _978 * _992;
    bool _1056 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1058 = isnan(_908);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -_1046;
    float _1070 = _1068 + 1.0;
    float _1072 = _1052 * _1020;
    float _1074 = _1004 * _986;
    float _1076 = -_1004;
    float _1078 = _1076 + 1.0;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1080;
    float _1084 = _1032 * _1078;
    float _1086 = -_1032;
    float _1088 = _1086 + 1.0;
    float _1090 = fma(_1082, _954, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1092 = _990 * _1048;
    bool _1094 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1096 = isnan(_908);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = _1018 * _1088;
    float _1108 = -_1018;
    float _1110 = _1108 + 1.0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1112;
    float _1116 = _1046 * _1110;
    float _1118 = fma(_1114, _954, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1120 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1122 = isnan(_908);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = _1066 * _1070;
    float _1134 = -_1066;
    float _1136 = _1134 + 1.0;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1142;
    float _1146 = -_1130;
    float _1148 = _1146 + 1.0;
    float _1150 = _1130 * _1136;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1156 = fma(_1140, _982, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1158 = _1104 * _1148;
    float _1160 = -_1104;
    float _1162 = _1160 + 1.0;
    float _1164 = fma(_1154, _982, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1170 = _1118 * _1158;
    float _1172 = _1090 * _1158;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1174;
    float _1178 = fma(_1168, _1006, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1170);
    float _1182 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1172);
    float _1184 = fma(_1144, _1034, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1186 = fma(_1176, _1034, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1192 = fma(_1156, _1150, _1180);
    float _1194 = fma(_1164, _1150, _1182);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1200;
    float _1204 = fma(_1190, _1006, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1206 = fma(_1184, _1132, _1192);
    float _1208 = fma(_1186, _1132, _1194);
    float _1210 = fma(_1198, _1054, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1212 = fma(_1202, _1054, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1222 = fma(_1178, _1116, _1206);
    float _1224 = fma(_1204, _1116, _1208);
    float _1226 = fma(_1216, _1072, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1228 = fma(_1220, _1072, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1234;
    float _1238 = fma(_1210, _1106, _1222);
    float _1240 = fma(_1212, _1106, _1224);
    float _1242 = fma(_1232, _1092, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1244 = fma(_1236, _1092, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1246 = fma(_1226, _1084, _1238);
    float _1248 = fma(_1228, _1084, _1240);
    float _1250 = fma(_1242, _1074, _1246);
    float _1252 = fma(_1244, _1074, _1248);
    float _1254 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1250);
    float _1256 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1252);
    out.m_63.x = _1254;
    out.m_63.z = _1256;
    bool _1258 = !_950;
    int _1260 = as_type<int>(_1256);
    float _1262 = _1106;
    if (!_1258)
    {
        float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1266 = _182 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1268 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[14].y, _130);
        float _1270 = _1268 * _1264;
        float _1272 = floor(_1270);
        float _1274 = -_1272;
        float _1276 = _1270 + _1274;
        _176 = _1276;
    }
    float _1278 = _176;
    float _1280 = in.m_65.y;
    float _1282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1284 = in.m_55.w;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1288 = _1286 != 0;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1292 = _1290 != 0;
    float _1294 = in.m_65.x;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1298 = _1296 != 0;
    float _1300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1302 = in.m_55.z;
    float _1304 = in.m_55.y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1308 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1316 = _1314 != 0;
    float _1318 = -_1280;
    float _1320 = _1318 + 1.0;
    bool _1322 = _1284 > 0.5;
    int _1324 = _1322 ? as_type<int>(_1320) : as_type<int>(_1280);
    bool _1326 = _1322;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1330 = _1308;
    float _1332 = _1284;
    float _1334 = _1280;
    if (_1288)
    {
        float _1336 = -_1294;
        float _1338 = _1336 + 1.0;
        _1260 = as_type<int>(_1338);
    }
    int _1340 = _1260;
    if (!_1288)
    {
        _1262 = _1294;
    }
    float _1342 = _1262;
    float _1344 = _1298 ? as_type<float>(_1324) : _1280;
    float _1346 = _1344;
    float _1348 = _1342;
    if (_1288)
    {
        bool _1350 = _1302 > 0.5;
        _1326 = _1350;
    }
    bool _1352 = _1326;
    if (!_1292)
    {
        _1328 = _1302;
    }
    float _1354 = _1328;
    float _1356 = fma(_1344, _1308, -0.5);
    float _1358 = _1354;
    if (!_1292)
    {
        _1346 = _1304;
    }
    float _1360 = _1346;
    float _1362 = _1360;
    if (_1288)
    {
        float _1364 = _1352 ? as_type<float>(_1340) : _1294;
        _1348 = _1364;
    }
    float _1366 = _1348;
    if (_1292)
    {
        _1362 = _182;
    }
    float _1368 = _1362;
    if (_1292)
    {
        _1358 = _1304;
    }
    float _1370 = _1358;
    float _1372 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1306);
    if (!_1292)
    {
        _1330 = _1302;
    }
    float _1374 = _1330;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1378 = _1374;
    if (_1292)
    {
        _1378 = _1304;
    }
    float _1380 = _1378;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1386 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1316)
    {
        _1332 = _1294;
    }
    float _1388 = _1332;
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1312);
    float _1392 = -_1376;
    float _1394 = fma(_1382, 2.0, _1392);
    float _1396 = fma(_1384, -2.0, _1310);
    float _1398 = fma(_1386, _1366, -0.5);
    float _1400 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1372);
    float _1402 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1390);
    float _1404 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1396);
    float _1406 = -_130;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1394);
    float _1410 = -_1404;
    float _1412 = fma(_1402, _1356, _1410);
    float _1414 = fma(_1400, _1398, _1408);
    float _1416 = _1412 + 0.5;
    float _1418 = _1414 + 0.5;
    float2 _6187 = float2(_1418, _1416);
    float _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_6187, float2(0.0), isnan(_6187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_6187, float2(0.0), isnan(_6187)), level(0.0)).w;
    float _1422 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1424 = int(_1422);
    float _1426 = in.m_67.x;
    float _1428 = in.m_67.y;
    float _1430 = in.m_67.z;
    float _1432 = in.m_67.w;
    float _1434 = _1304 * 2.0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1438 = _1436 != 0;
    float _1440 = in.m_69.x;
    float _1442 = in.m_69.y;
    float _1444 = in.m_69.z;
    float _1446 = in.m_69.w;
    bool _1448 = _1304 > 0.5;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1454 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1456 = int(_1454);
    float _1458 = in.m_71.w;
    float _1460 = _270 * _604;
    float _1462 = float(_1424);
    float _1464 = 1.0 / _1452;
    bool _1466 = _1448;
    float _1468 = _1388;
    if (_1438)
    {
        float _1470 = _1448 ? _1320 : _1280;
        _1334 = _1470;
    }
    float _1472 = _1334;
    if (_1316)
    {
        bool _1474 = _182 > 0.5;
        _1466 = _1474;
    }
    bool _1476 = _1466;
    float _1478 = float(uint(_1456));
    float _1480 = 1.0 / _1462;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1486 = !_1292;
    float _1488 = _1486 ? 7.345489978790283203125 : 1.0;
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1492 = _1490 != 0;
    float _1494 = 1.0 / _1478;
    out.m_73.w = _1458;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1506 = _1504 != 0;
    float _1508 = _1480 * _130;
    int _1510 = ~_1456;
    int _1512 = _1510 + 1;
    float _1514 = in.m_75.x;
    float _1516 = in.m_75.y;
    float _1518 = in.m_75.z;
    float _1520 = in.m_75.w;
    float _1522 = 1.0 / _1484;
    int _1524 = as_type<int>(_1494) + (-2);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1532 = trunc(_1508);
    int _1534 = int(_1532);
    float _1536 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    float _1538 = 1.0 / _1528;
    float _1540 = float(uint(_1534));
    float _1542 = as_type<float>(_1524) * _1540;
    float _1544 = in.m_46.x;
    float _1546 = in.m_46.y;
    float _1548 = in.m_46.z;
    float _1550 = trunc(_1542);
    float _1552 = precise::max(_1550, 0.0);
    uint _1555 = uint(_1552);
    int _1557 = _1512 * int(_1555);
    int _1559 = _1557 + _1534;
    float _1561 = _1546 * _1516;
    float _1563 = float(uint(_1559));
    float _1565 = _1546 * _1428;
    float _1567 = _1546 * _1442;
    float _1569 = as_type<float>(_1524) * _1563;
    float _1571 = fma(_1544, _1514, _1561);
    float _1573 = fma(_1544, _1426, _1565);
    float _1575 = trunc(_1569);
    float _1577 = precise::max(_1575, 0.0);
    uint _1579 = uint(_1577);
    float _1581 = _182 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1585 = fma(_1544, _1440, _1567);
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1591 = _182 * 2.0;
    float _1593 = -_1583;
    float _1595 = fma(_1581, 2.0, _1593);
    float _1597 = fma(_1548, _1430, _1573);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1599;
    float _1603 = 1.0 / _1589;
    int _1605 = as_type<int>(_1583);
    if (_1316)
    {
        float _1607 = -_1294;
        float _1609 = _1607 + 1.0;
        _1605 = as_type<int>(_1609);
    }
    int _1611 = _1605;
    float _1613 = _1601 * _1464;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1619 = !_1492;
    int _1621 = _1619 ? 0 : 1;
    float _1623 = _1597 + _1432;
    int _1625 = int(_1555) + int(_1579);
    float _1627 = fma(_1548, _1444, _1585);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1631 = _1629 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1633 = floor(_1591);
    float _1635 = fma(_1548, _1518, _1571);
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1639 = _1637 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    if (_1316)
    {
        float _1641 = _1476 ? as_type<float>(_1611) : _1294;
        _1468 = _1641;
    }
    float _1643 = _1468;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1647 = _1645 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1649 = _1631 * _1603;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1651;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1657 = _1655 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1659 = 1.0 / _1639;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1663 = ~_1456;
    int _1665 = _1663 + 1;
    float _1667 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1669 = float(_1534);
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1671;
    float _1675 = _1653 * _1522;
    float _1677 = 1.0 / _1617;
    float _1679 = fma(_1667, -2.0, _1661);
    int _1681 = _1665 * _1625;
    int _1683 = _1681 + _1534;
    float _1685 = _1673 * _1538;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _1691 = _1633 > 0.0;
    float _1693 = _182 + _1302;
    bool _1695 = _1633 >= 0.0;
    bool _1697 = isnan(_1633);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan(0.0);
    bool _1703 = _1699 || _1701;
    float _1705 = _1657 * _1659;
    float _1707 = _1488 * _182;
    float _1709 = float(_1456);
    float _1711 = 1.0 / _1647;
    bool _1713 = !_1498;
    int _1715 = _1713 ? 0 : 1;
    float _1717 = _1693 + (-1.0);
    bool _1719 = uint(_1683) >= uint(_1456);
    float _1721 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1679);
    float _1723 = _1689 * _1677;
    float _1725 = _1627 + _1446;
    float _1727 = floor(_1707);
    bool _1729 = _1669 >= _1709;
    bool _1731 = isnan(_1669);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan(_1709);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = _1709 * _130;
    bool _1743 = !_1719;
    int _1745 = _1743 ? 0 : (-1);
    float _1747 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1747;
    bool _1751 = !_1502;
    int _1753 = _1751 ? 0 : 1;
    float _1755 = _1741 * _170;
    int _1757 = ~_1625;
    int _1759 = _1757 + _1745;
    int _1761 = _1759 + 1;
    float _1763 = trunc(_1739);
    int _1765 = int(_1763);
    float _1767 = _182 + _1304;
    bool _1769 = !_1506;
    int _1771 = _1769 ? 0 : 1;
    float _1773 = _1749 * _1711;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1777 = _1775 != 0;
    int _1779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1781 = _1779 != 0;
    int _1783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1785 = _1783 != 0;
    float _1787 = _1767 + (-1.0);
    int _1789 = _1456 * _1761;
    int _1791 = _1789 + _1534;
    bool _1793 = _1456 == 0;
    float _1795 = -_1727;
    float _1797 = _1707 + _1795;
    float _1799 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1801 = fma(_1717, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1803 = !_1793;
    int _1805 = _1803 ? _1791 : (-1);
    float _1807 = _1797 * _1709;
    int _1809 = _1456 + (-1);
    float _1811 = trunc(_1755);
    int _1813 = int(_1811);
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1817 = _1815 != 0;
    float _1819 = _1304 + _1302;
    int _1821 = ~_1765;
    int _1823 = _1821 + 1;
    int _1825 = _1823 + 1;
    float _1827 = _1635 + _1520;
    int _1829 = abs(_1621);
    int _1831 = abs(_1715);
    int _1833 = _1805 * _1825;
    float _1835 = trunc(_1807);
    int _1837 = int(_1835);
    float _1839 = _1302 * 2.0;
    int _1841 = abs(_1771);
    int _1843 = _1765 * _1809;
    int _1845 = _1843 + _1833;
    int _1847 = abs(_1753);
    bool _1849 = !_1817;
    int _1851 = _1849 ? 0 : 1;
    float _1853 = floor(_1434);
    int _1855 = _1703 ? 0 : 1;
    bool _1857 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1859 = isnan(_1278);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1865 = _1861 || _1863;
    float _1867 = float(_1865);
    int _1869 = _1845 * _1847;
    int _1871 = abs(_1851);
    float _1873 = floor(_1839);
    int _1875 = _1837 * _1829;
    int _1877 = _1875 + _1534;
    float _1879 = _1819 + (-1.0);
    int _1881 = _1813 * _1831;
    int _1883 = _1881 + _1869;
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1887 = _1278 + _1885;
    int _1889 = ~_1855;
    int _1891 = _1889 + 1;
    int _1893 = _1891 + 1;
    int _1895 = _1877 * _1841;
    int _1897 = _1895 + _1883;
    int _1899 = _1893;
    if (!_1691)
    {
        int _1901 = ~_1855;
        int _1903 = _1901 + 1;
        _1899 = _1903;
    }
    int _1905 = _1899;
    float _1907 = fma(_1613, _1887, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1909 = _1853 >= 0.0;
    bool _1911 = isnan(_1853);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan(0.0);
    bool _1917 = _1913 || _1915;
    int _1919 = _1837 * _1871;
    int _1921 = _1919 + _1897;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1925 = _1278 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1929 = _1278 + _1927;
    int _1931 = _1917 ? 0 : 1;
    float _1933 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1935 = _1278 + _1933;
    bool _1937 = _1873 >= 0.0;
    bool _1939 = isnan(_1873);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(0.0);
    bool _1945 = _1941 || _1943;
    float _1947 = fma(_1649, _1929, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1949 = float(uint(_1921));
    float _1951 = fma(_1685, _1935, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    int _1953 = _1945 ? 0 : 1;
    float _1955 = fma(_1879, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1957 = _1873 > 0.0;
    float _1959 = fma(_1705, _1925, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1961 = as_type<float>(_1524) * _1949;
    bool _1963 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1965 = isnan(_1278);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1977 = _1278 + _1975;
    bool _1979 = _1853 > 0.0;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1983 = _1278 + _1981;
    bool _1985 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1987 = isnan(_1278);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1993 = _1989 || _1991;
    float _1995 = float(_1993);
    float _1997 = trunc(_1961);
    float _1999 = precise::max(_1997, 0.0);
    uint _2001 = uint(_1999);
    float _2003 = -_1973;
    float _2005 = _2003 + 1.0;
    bool _2007 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2009 = isnan(_1278);
    bool _2011 = _2007 || _2009;
    bool _2013 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2015 = _2011 || _2013;
    float _2017 = float(_2015);
    float _2019 = fma(_1675, _1983, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2021 = fma(_1723, _1977, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2023 = _1995 * _2005;
    float _2025 = -_1995;
    float _2027 = _2025 + 1.0;
    bool _2029 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2031 = isnan(_1278);
    bool _2033 = _2029 || _2031;
    bool _2035 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2037 = _2033 || _2035;
    float _2039 = float(_2037);
    float _2041 = -_2017;
    float _2043 = _2041 + 1.0;
    int _2045 = ~_1456;
    int _2047 = _2045 + 1;
    float _2049 = _2017 * _2027;
    float _2051 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2053 = _1278 + _2051;
    float _2055 = _2039 * _2043;
    float _2057 = -_2039;
    float _2059 = _2057 + 1.0;
    bool _2061 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2063 = isnan(_1278);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = fma(_1773, _2053, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _2075 = _2047 * int(_2001);
    int _2077 = _2075 + _1921;
    float _2079 = _1867 * _2059;
    float _2081 = -_1867;
    float _2083 = _2081 + 1.0;
    bool _2085 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2087 = isnan(_1278);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2093 = _2089 || _2091;
    float _2095 = float(_2093);
    float _2097 = float(uint(_2077));
    bool _2099 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2101 = isnan(_1278);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2107 = _2103 || _2105;
    float _2109 = float(_2107);
    float _2111 = _2071 * _2083;
    float _2113 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2115 = log2(_2113);
    float _2117 = as_type<float>(_1524) * _2097;
    float _2119 = -_2071;
    float _2121 = _2119 + 1.0;
    float _2123 = -_2109;
    float _2125 = _2123 + 1.0;
    float _2127 = -_2095;
    float _2129 = _2127 + 1.0;
    float _2131 = _2109 * _2121;
    float _2133 = trunc(_2117);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    float _2139 = _2095 * _2125;
    float _2141 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _1472, -0.5);
    float _2143 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1536);
    float _2145 = _1907 * _2139;
    float _2147 = -_1721;
    float _2149 = fma(_2143, _2141, _2147);
    int _2151 = ~_1456;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2145);
    float _2157 = _2115 * _130;
    float _2159 = fma(_1947, _2131, _2155);
    int _2161 = ~_1931;
    int _2163 = _2161 + 1;
    int _2165 = _2163 + 1;
    float _2167 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2169 = int(_2001) + int(_2137);
    float _2171 = -_130;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1595);
    int _2175 = _2165;
    if (!_1979)
    {
        int _2177 = ~_1931;
        int _2179 = _2177 + 1;
        _2175 = _2179;
    }
    int _2181 = _2175;
    float _2183 = exp2(_2157);
    float _2185 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2187 = 1.0 + _2185;
    int _2189 = _2153 * _2169;
    int _2191 = _2189 + _1921;
    float _2193 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2167);
    int _2195 = ~_1953;
    int _2197 = _2195 + 1;
    int _2199 = _2197 + 1;
    float _2201 = fma(_2019, _2111, _2159);
    int _2203 = _2199;
    if (!_1957)
    {
        int _2205 = ~_1953;
        int _2207 = _2205 + 1;
        _2203 = _2207;
    }
    int _2209 = _2203;
    float _2211 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2193);
    float _2213 = 1.0 / _2187;
    bool _2215 = uint(_2191) >= uint(_1456);
    float _2217 = _182 * 6.283185482025146484375;
    bool _2219 = !_1781;
    int _2221 = _2219 ? 0 : 1;
    float _2223 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2225 = float(_1905);
    float _2227 = _2217 + _130;
    bool _2229 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2231 = isnan(1.0);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2237 = _2233 || _2235;
    float _2239 = -_2183;
    float _2241 = _2239 + 1.0;
    float _2243 = float(uint(_1877));
    float _2245 = fma(_2211, _2223, _2173);
    int _2247 = abs(_2221);
    float _2249 = fma(_1959, _2079, _2201);
    bool _2251 = !_2215;
    int _2253 = _2251 ? 0 : (-1);
    float _2255 = as_type<float>(_1524) * _2243;
    bool _2257 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2265 = _2261 || _2263;
    float _2267 = float(_2247);
    int _2269 = ~_2169;
    int _2271 = _2269 + _2253;
    int _2273 = _2271 + 1;
    float _2275 = trunc(_2255);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = _2265 ? _2241 : 0.0;
    float _2283 = _2267 * _2225;
    bool _2285 = !_1785;
    int _2287 = _2285 ? 0 : 1;
    int _2289 = _1456 * _2273;
    int _2291 = _2289 + _1921;
    bool _2293 = !_1777;
    int _2295 = _2293 ? 0 : 1;
    if (_2237)
    {
        float _2297 = _2281 * _2213;
        _140 = _2297;
    }
    float _2299 = _140;
    int _2301 = abs(_2287);
    int _2303 = abs(_2295);
    int _2305 = ~_1456;
    int _2307 = _2305 + 1;
    bool _2309 = !_1793;
    int _2311 = _2309 ? _2291 : (-1);
    int _2313 = _2307 * int(_2279);
    int _2315 = _2313 + _1877;
    float _2317 = float(_2303);
    float _2319 = in.m_77.x;
    float _2321 = in.m_77.y;
    float _2323 = in.m_77.z;
    float _2325 = float(_2209);
    int _2327 = _2311 >> 31;
    float _2329 = float(_2301);
    float _2331 = _2317 * _2325;
    float _2333 = float(_2181);
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2337 = _1725 + _2335;
    int _2339 = _2327 & 3;
    float _2341 = float(uint(_2315));
    float _2343 = _2329 * _2333;
    int _2345 = _2311 + _2339;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2349 = _1623 + _2347;
    float _2351 = _2337 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2353 = as_type<float>(_1524) * _2341;
    int _2355 = _2345 >> 2;
    float _2357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2359 = _1827 + _2357;
    float _2361 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2351);
    float _2363 = _2283 * (-2.0);
    int _2365 = _2355 << 4;
    int _2367 = _2365 + 368;
    float _2369 = _2331 * (-2.0);
    float _2371 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2361);
    float _2373 = fma(_1955, _2363, _1955);
    float _2375 = _2149 + 0.5;
    uint _2377 = uint(int(uint(_2367) >> uint(2)));
    uint _2379 = uint(int(uint(int(_2377)) >> uint(2)));
    int _2381 = int(_2377) & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = int(_2377) + 1;
    uint _2387 = uint(int(uint(_2385) >> uint(2)));
    int _2389 = _2385 & 3;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[int(_2387)][_2389];
    float _2393 = fma(_1951, _2055, _2249);
    float _2395 = fma(_1799, _2369, _1799);
    bool _2397 = _2371 >= 0.0;
    float _2399 = trunc(_2353);
    float _2401 = precise::max(_2399, 0.0);
    uint _2403 = uint(_2401);
    int _2405 = _2311 & 3;
    bool _2407 = _2405 != 0;
    float _2409 = _2245 + 0.5;
    int _2411 = _2311 & 3;
    bool _2413 = _2411 != 0;
    int _2415 = _2367 + 8;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    uint _2419 = uint(int(uint(int(_2417)) >> uint(2)));
    int _2421 = int(_2417) & 3;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[int(_2419)][_2421];
    int _2425 = int(_2417) + 1;
    uint _2427 = uint(int(uint(_2425) >> uint(2)));
    int _2429 = _2425 & 3;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[int(_2427)][_2429];
    bool _2433 = uint(_2405) > 1u;
    float _2435 = _2343 * (-2.0);
    out.m_79.x = _2409;
    out.m_79.y = _2375;
    out.m_79.z = _1418;
    out.m_79.w = _1416;
    float _2437 = fma(_2369, _2319, _2319);
    float _2439 = _1304 + (-0.5);
    float _2441 = fma(_2435, _2323, _2323);
    float _2443 = _1302 + (-0.5);
    float _2445 = fma(_2363, _2321, _2321);
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2449 = _2447 != 0;
    float _2451 = fma(_1801, _2435, _1801);
    float _2453 = fma(_2443, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2441);
    int _2455 = int(_2279) + int(_2403);
    float _2457 = _2217 * 0.15915493667125701904296875;
    float _2459 = fma(_2021, _2049, _2393);
    float _2461 = _2369;
    if (_2397)
    {
        out.m_53.x = 0.0;
    }
    int _2463 = _2413 ? 0 : 1;
    float _2465 = fma(_2439, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2445);
    int _2467 = ~_1456;
    int _2469 = _2467 + 1;
    float _2471 = _182 + (-0.5);
    int _2473 = ~_2463;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    float _2479 = fma(_2373, _2299, _2465);
    int _2481 = _2477;
    if (!_2433)
    {
        int _2483 = ~_2463;
        int _2485 = _2483 + 1;
        _2481 = _2485;
    }
    int _2487 = _2481;
    int _2489 = _2469 * _2455;
    int _2491 = _2489 + _1877;
    bool _2493 = _2405 != 3;
    float _2495 = fma(_2471, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2437);
    bool _2497 = uint(_2405) >= 2u;
    float _2499 = _2479 * 0.15915493667125701904296875;
    bool _2501 = !_2407;
    int _2503 = _2501 ? 0 : 1;
    float _2505 = fma(_2395, _2299, _2495);
    int _2507 = abs(_2487);
    float _2509 = fma(_2073, _2023, _2459);
    int _2511 = _2497 ? 0 : 1;
    float _2513 = _1460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2515 = abs(_2503);
    float _2517 = _2499 * 6.283185482025146484375;
    float _2519 = sin(_2517);
    float _2521 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2509);
    bool _2523 = _2405 != 3;
    float _2525 = _2505 * 0.15915493667125701904296875;
    int _2527 = ~_2511;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    int _2533 = _2531;
    if (_2493)
    {
        int _2535 = ~_2511;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    float _2541 = _2499 * 6.283185482025146484375;
    float _2543 = cos(_2541);
    int _2545 = ~_2507;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    out.m_81.x = _2521;
    bool _2551 = !_2523;
    int _2553 = _2551 ? 0 : (-1);
    int _2555 = _2549 * as_type<int>(_2391);
    bool _2557 = uint(_2491) >= uint(_1456);
    int _2559 = ~_2515;
    int _2561 = _2559 + 1;
    int _2563 = _2561 + 1;
    bool _2565 = !_2449;
    int _2567 = _2565 ? 0 : 1;
    int _2569 = abs(_2539);
    int _2571 = _2563 * as_type<int>(_2383);
    int _2573 = _2571 + _2555;
    int _2575 = abs(_2553);
    bool _2577 = !_2557;
    int _2579 = _2577 ? 0 : (-1);
    int _2581 = abs(_2567);
    int _2583 = ~_2569;
    int _2585 = _2583 + 1;
    int _2587 = _2585 + 1;
    int _2589 = ~_2455;
    int _2591 = _2589 + _2579;
    int _2593 = _2591 + 1;
    float _2595 = _2337 * _2337;
    int _2597 = ~_2575;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    int _2603 = _2587 * as_type<int>(_2423);
    int _2605 = _2603 + _2573;
    int _2607 = ~_2581;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    int _2613 = _1456 * _2593;
    int _2615 = _2613 + _1877;
    float _2617 = fma(_2349, _2349, _2595);
    int _2619 = _2601 * as_type<int>(_2431);
    int _2621 = _2619 + _2605;
    float _2623 = _2457 * 6.283185482025146484375;
    float _2625 = sin(_2623);
    bool _2627 = !_1793;
    int _2629 = _2627 ? _2615 : (-1);
    int _2631 = _2621 * _2611;
    float _2633 = fma(_2359, _2359, _2617);
    float _2635 = _2617;
    if (_2397)
    {
        _2635 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2637 = _2635;
    int _2639 = _2629 * _2581;
    int _2641 = _2639 + _2631;
    float _2643 = _2457 * 6.283185482025146484375;
    float _2645 = cos(_2643);
    float _2647 = _2513 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2649 = as_type<int>(_2637);
    float _2651 = _2645;
    if (_2397)
    {
        float _2653 = _2637 * 5.0;
        _2649 = as_type<int>(_2653);
    }
    int _2655 = _2649;
    float _2657 = float(_2641);
    float _2659 = in.m_83.x;
    float _2661 = in.m_83.y;
    float _2663 = in.m_83.z;
    float _2665 = rsqrt(_2633);
    float _2667 = as_type<float>(_2655);
    if (_2397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7979 = as_type<float>(_2655);
        out.gl_Position.z = _7979;
    }
    out.m_85.x = _2657;
    float _2669 = _2647 * _2665;
    float _2671 = _2349 * _2669;
    float _2673 = _2337 * _2669;
    float _2675 = _2673;
    if (_2397)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2677 = -_2673;
    float _2679 = _1725 + _2677;
    float _2681 = _2359 * _2669;
    float _2683 = -_2671;
    float _2685 = _1623 + _2683;
    float _2687 = -_2673;
    float _2689 = _2337 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2693 = _2679 + _2691;
    float _2695 = -_2681;
    float _2697 = _1827 + _2695;
    float _2699 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2701 = _2685 + _2699;
    float _2703 = -_2671;
    float _2705 = _2349 + _2703;
    float _2707 = _2693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2709 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2711 = _2697 + _2709;
    float _2713 = fma(_2451, _2299, _2453);
    float _2715 = -_2681;
    float _2717 = _2359 + _2715;
    float _2719 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2707);
    float _2721 = _2689 * _2689;
    float _2723 = _2525 * 6.283185482025146484375;
    float _2725 = sin(_2723);
    float _2727 = _2713 * 0.15915493667125701904296875;
    float _2729 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2719);
    float _2731 = fma(_2705, _2705, _2721);
    float _2733 = _2625 * _2661;
    float _2735 = _270 * _602;
    float _2737 = _270 * _600;
    bool _2739 = _2729 >= 0.0;
    float _2741 = _2525 * 6.283185482025146484375;
    float _2743 = cos(_2741);
    float _2745 = fma(_2717, _2717, _2731);
    float _2747 = _2645 * _2661;
    float _2749 = -_2733;
    float _2751 = fma(_2645, _2659, _2749);
    float _2753 = _2227 * 0.070000000298023223876953125;
    float _2755 = fma(_2625, _2659, _2747);
    float _2757 = _2727 * 6.283185482025146484375;
    float _2759 = sin(_2757);
    float _2761 = _2725 * _2519;
    float _2763 = fma(_1420, 6.283185482025146484375, _2753);
    float _2765 = _2697;
    if (_2739)
    {
        _2667 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2767 = _2667;
    int _2769 = as_type<int>(_2767);
    if (_2739)
    {
        out.m_53.x = 0.0;
    }
    float _2771 = sqrt(_2745);
    if (_2739)
    {
        float _2773 = _2767 * 5.0;
        _2769 = as_type<int>(_2773);
    }
    int _2775 = _2769;
    float _2777 = _2743 * _2543;
    if (_2739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8155 = as_type<float>(_2775);
        out.gl_Position.z = _8155;
    }
    float _2779 = fma(_2759, _2777, _2761);
    float _2781 = fma(_2759, _2761, _2777);
    float _2783 = _2665 * _2771;
    if (_2739)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2785 = _2763 * 0.15915493667125701904296875;
    float _2787 = _2727 * 6.283185482025146484375;
    float _2789 = cos(_2787);
    float _2791 = _2743 * _2519;
    float _2793 = _2725 * _2543;
    float _2795 = _2737 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2797 = _2513 * _2783;
    float _2799 = -_2791;
    float _2801 = fma(_2759, _2793, _2799);
    bool _2803 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2805 = isnan(0.5);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2811 = _2807 || _2809;
    float _2813 = _2785 * 6.283185482025146484375;
    float _2815 = sin(_2813);
    bool _2817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2819 = isnan(0.5);
    bool _2821 = _2817 || _2819;
    bool _2823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2825 = _2821 || _2823;
    float _2827 = _2743 * _2789;
    float _2829 = _2543 * _2789;
    float _2831 = _2725 * _2789;
    float _2833 = _2519 * _2789;
    float _2835 = -_2793;
    float _2837 = fma(_2759, _2791, _2835);
    float _2839 = _2735 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2841 = _2815 * 0.100000001490116119384765625;
    float _2843 = _2783 * _2839;
    float _2845 = fma(_2755, _2841, _2755);
    float _2847 = fma(_2751, _2841, _2751);
    float _2849 = fma(_2841, _2663, _2663);
    float _2851 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2845);
    float _2853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2847);
    float _2855 = _2851 * _2843;
    float _2857 = _2783 * _2795;
    float _2859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2849);
    float _2861 = _2853 * _2797;
    float _2863 = _2827 * _2855;
    float _2865 = -_2855;
    float _2867 = _2759 * _2865;
    float _2869 = _2859 * _2857;
    float _2871 = _2831 * _2855;
    float _2873 = fma(_2779, _2861, _2863);
    float _2875 = fma(_2829, _2861, _2867);
    float _2877 = _2679 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2879 = fma(_2801, _2861, _2871);
    float _2881 = fma(_2837, _2869, _2873);
    float _2883 = fma(_2833, _2869, _2875);
    float _2885 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2877);
    float _2887 = fma(_2781, _2869, _2879);
    float _2889 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2891 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2893 = fma(_2697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2885);
    float _2895 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2889);
    float _2897 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2891);
    float _2899 = _2893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2901 = fma(_2887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2895);
    float _2903 = fma(_2887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2897);
    float _2905 = _2901 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2907 = _2903 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2909 = _1827 + _2905;
    float _2911 = _1623 + _2907;
    float _2913 = _2679 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2917 = _2909 + _2915;
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2921 = _2911 + _2919;
    float _2923 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2913);
    float _2925 = _2917 * _2917;
    float _2927 = fma(_2697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2923);
    float _2929 = fma(_2921, _2921, _2925);
    float _2931 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2933 = _2927 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2935 = sqrt(_2929);
    float _2937 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2931);
    float _2939 = _2933 + _2899;
    float _2941 = fma(_2887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2937);
    float _2943 = 1.0 / _2899;
    float _2945 = _2941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2947 = _1725 + _2945;
    bool _2949 = _2935 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2951 = _2939 * _2943;
    float _2953 = _2951 * 0.5;
    float _2955 = _2887;
    float _2957 = _2943;
    float _2959 = _2911;
    float _2961 = _2935;
    if (!_2949)
    {
        _2955 = _2909;
    }
    float _2963 = _2955;
    float _2965 = _2963;
    if (!_2949)
    {
        _2957 = _2947;
    }
    float _2967 = _2957;
    bool _2969 = !_2949;
    float _2971 = _2967;
    if (!_2969)
    {
        float _2973 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2977 = _2935 + _2975;
        float _2979 = rsqrt(_2929);
        float _2981 = _2977 * _2973;
        float _2983 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2985 = _2981 * 0.15915493667125701904296875;
        float _2987 = _2985 * 6.283185482025146484375;
        float _2989 = cos(_2987);
        float _2991 = _2985 * 6.283185482025146484375;
        float _2993 = sin(_2991);
        float _2995 = _2989 + (-1.0);
        float _2997 = fma(_2993, _2983, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3001 = _2979 * _2997;
        float _3003 = fma(_2947, _2989, _2999);
        float _3005 = fma(_2921, _3001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3007 = fma(_2917, _3001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2959 = _3005;
        _2971 = _3003;
        _2965 = _3007;
        _2961 = _2995;
    }
    float _3009 = _2959;
    float _3011 = _2971;
    float _3013 = _2965;
    float _3015 = _2961;
    float _3017 = -_2671;
    float _3019 = _3017 + _3009;
    float _3021 = -_2673;
    float _3023 = _3021 + _3011;
    float _3025 = -_2681;
    float _3027 = _3025 + _3013;
    float _3029 = _3015;
    float _3031 = _3023;
    float _3033 = _3019;
    float _3035 = _3027;
    float _3037 = _3013;
    if (_2825)
    {
        _3029 = 1.0;
    }
    float _3039 = _3029;
    float _3041 = _3039;
    if (!_2811)
    {
        float _3043 = _2693 * _2693;
        float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3047 = -_1827;
        float _3049 = _3047 + _3013;
        float _3051 = fma(_2701, _2701, _3043);
        float _3053 = fma(_2711, _2711, _3051);
        float _3055 = 1.0 / _2783;
        float _3057 = sqrt(_3053);
        float _3059 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3061 = precise::min(_3057, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3063 = _3061 * _3045;
        float _3065 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3067 = _3063 * _3055;
        float _3069 = -_1623;
        float _3071 = _3069 + _3009;
        float _3073 = -_1725;
        float _3075 = _3073 + _3011;
        float _3077 = _3065 * _3067;
        float _3079 = _3049 * _3067;
        float _3081 = fma(_3071, _3077, _2685);
        float _3083 = fma(_3075, _3077, _2679);
        float _3085 = fma(_3065, _3079, _2697);
        _3031 = _3083;
        _3033 = _3081;
        _3035 = _3085;
        _3037 = _3079;
    }
    float _3087 = _3031;
    float _3089 = _3033;
    float _3091 = _3035;
    float _3093 = _3037;
    float _3095 = _3093;
    if (!_2825)
    {
        float _3097 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3099 = _3097 * 0.15915493667125701904296875;
        float _3101 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3103 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3105 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3103);
        float _3107 = _3099 * 6.283185482025146484375;
        float _3109 = cos(_3107);
        float _3111 = _3101 * 0.15915493667125701904296875;
        float _3113 = _3099 * 6.283185482025146484375;
        float _3115 = sin(_3113);
        float _3117 = 1.0 / _3109;
        float _3119 = _3111 * 6.283185482025146484375;
        float _3121 = cos(_3119);
        float _3123 = _3115 * _3117;
        float _3125 = _3111 * 6.283185482025146484375;
        float _3127 = sin(_3125);
        float _3129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3131 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3129;
        float _3133 = _3121 * _3123;
        float _3135 = 1.0 / _3105;
        float _3137 = 1.0 / _3133;
        float _3139 = 1.0 / _3131;
        float _3141 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3143 = _3135 * _3141;
        float _3145 = _3127 * _3137;
        float _3147 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3149 = fma(_3145, _3143, _3147);
        float _3151 = _3149 * _3139;
        float _3153 = precise::clamp(_3151, 0.0, 1.0);
        _2765 = _3111;
        _3095 = _3135;
        _3041 = _3153;
    }
    float _3155 = _2765;
    float _3157 = _3095;
    float _3159 = _3041;
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3163 = _3087 + _3161;
    float _3165 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3167 = _3089 + _3165;
    float _3169 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3171 = _3091 + _3169;
    float _3173 = _3163 * _3163;
    float _3175 = fma(_3167, _3167, _3173);
    float _3177 = fma(_3171, _3171, _3175);
    float _3179 = rsqrt(_3177);
    float _3181 = sqrt(_3177);
    float _3183 = _3179 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3185 = _3167 * _3183;
    float _3187 = _3171 * _3183;
    float _3189 = _3185 * _3185;
    float _3191 = _3187 * _3187;
    float _3193 = _3189 + _3191;
    float _3195 = sqrt(_3193);
    bool _3197 = _3195 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3201 = _3195 + _3199;
    float _3203 = _3171;
    float _3205 = _3157;
    float _3207 = _3201;
    float _3209 = _3155;
    float _3211 = _3163;
    if (_3197)
    {
        float _3213 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3203 = _3213;
    }
    float _3215 = _3203;
    if (_3197)
    {
        float _3217 = rsqrt(_3193);
        _3205 = _3217;
    }
    float _3219 = _3205;
    float _3221 = _3219;
    if (_3197)
    {
        float _3223 = _3201 * _3215;
        _3207 = _3223;
    }
    float _3225 = _3207;
    if (_3197)
    {
        float _3227 = _3225 * 0.15915493667125701904296875;
        _3209 = _3227;
    }
    float _3229 = _3209;
    float _3231 = _3179;
    if (_3197)
    {
        float _3233 = _3229 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        _3231 = _3235;
    }
    float _3237 = _3231;
    float _3239 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3241 = precise::max(0.0, _3239);
    float _3243 = _3175;
    float _3245 = _3241;
    float _3247 = _3239;
    if (_3197)
    {
        float _3249 = _3229 * 6.283185482025146484375;
        float _3251 = cos(_3249);
        _3243 = _3251;
    }
    float _3253 = _3243;
    float _3255 = -_3183;
    float _3257 = -_3241;
    float _3259 = fma(_3163, _3255, _3257);
    if (!_3197)
    {
        _3245 = _3185;
    }
    float _3261 = _3245;
    float _3263 = _3261;
    if (_3197)
    {
        float _3265 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3247 = _3265;
    }
    float _3267 = _3247;
    float _3269 = _3237;
    float _3271 = _3267;
    if (_3197)
    {
        float _3273 = fma(_3237, _3267, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3211 = _3273;
    }
    float _3275 = _3211;
    float _3277 = _3275;
    if (!_3197)
    {
        _3269 = _3189;
    }
    float _3279 = _3269;
    float _3281 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3285 = fma(_3181, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3283);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = _3279;
    float _3291 = _3253;
    if (_3197)
    {
        float _3293 = _3253 + (-1.0);
        _3271 = _3293;
    }
    float _3295 = _3271;
    float _3297 = _3295;
    if (_3197)
    {
        float _3299 = _3219 * _3275;
        _2675 = _3299;
    }
    float _3301 = _2675;
    if (!_3197)
    {
        _3277 = _3259;
    }
    float _3303 = _3277;
    float _3305 = -_3287;
    float _3307 = _3305 + 1.0;
    float _3309 = _3303;
    if (_3197)
    {
        float _3311 = _3295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3221 = _3311;
    }
    float _3313 = _3221;
    if (_3197)
    {
        float _3315 = _3185 * _3301;
        _3263 = _3315;
    }
    float _3317 = _3263;
    if (!_3197)
    {
        _3297 = _3187;
    }
    float _3319 = _3297;
    float _3321 = _3319;
    if (_3197)
    {
        float _3323 = _3187 * _3301;
        _3321 = _3323;
    }
    float _3325 = _3321;
    if (_3197)
    {
        float _3327 = fma(_3259, _3253, _3313);
        _3309 = _3327;
    }
    float _3329 = _3309;
    if (_3197)
    {
        float _3331 = _3317 * _3317;
        _3289 = _3331;
    }
    float _3333 = _3289;
    if (!_3197)
    {
        _3291 = _3191;
    }
    float _3335 = _3291;
    float _3337 = _3335;
    if (_3197)
    {
        float _3339 = _3325 * _3325;
        _3337 = _3339;
    }
    float _3341 = _3337;
    float _3343 = abs(_3307);
    float _3345 = log2(_3343);
    float _3347 = fma(_3329, _3329, _3333);
    float _3349 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3351 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3353 = _3347 + _3341;
    float _3355 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3349);
    float _3357 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3359 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3351);
    float _3361 = rsqrt(_3353);
    float _3363 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3355);
    float _3365 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3367 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3357);
    float _3369 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3359);
    float _3371 = _3363 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3373 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3365);
    float _3375 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3367);
    float _3377 = _3369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3379 = _3371 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3381 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3373);
    float _3383 = _3375 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3385 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3387 = -_3379;
    float _3389 = fma(_3387, _3281, 1.0);
    float _3391 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3393 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3395 = _3361 * _3317;
    float _3397 = _3361 * _3325;
    float _3399 = exp2(_3385);
    float _3401 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3393);
    float _3403 = _3361 * _3329;
    float _3405 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3407 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3409 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3401);
    float _3411 = -_3405;
    float _3413 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3411);
    float _3415 = log2(_3389);
    float _3417 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3409);
    float _3419 = -_3397;
    float _3421 = fma(_3419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3413);
    float _3423 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3425 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3407);
    float _3427 = fma(_3421, -0.5, 0.5);
    float _3429 = 1.0 / _3417;
    float _3431 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3423);
    float _3433 = fma(_3421, 0.5, 0.5);
    float _3435 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3425);
    float _3437 = _3403 + 1.0;
    float _3439 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3431);
    float _3441 = fma(_3433, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3443 = sqrt(_3427);
    float _3445 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3439);
    float _3447 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3435);
    float _3449 = -_3403;
    float _3451 = fma(_3399, _3437, _3449);
    float _3453 = fma(_3433, _3441, -0.212114393711090087890625);
    float _3455 = _3415 * 0.693147182464599609375;
    float _3457 = _3445 * _3429;
    float _3459 = _3447 * _3429;
    float _3461 = fma(_3433, _3453, 1.570728778839111328125);
    float _3463 = _3455 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3465 = fma(_3457, 0.5, 0.5);
    float _3467 = fma(_3459, -0.5, 0.5);
    float _3469 = _3443 * 0.636619746685028076171875;
    float _3471 = fma(_3451, 0.5, 0.5);
    float3 _9267 = float3(_3465, _3467, _3463);
    float _3473 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9267, float3(0.0), isnan(_9267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9267, float3(0.0), isnan(_9267)), level(0.0)).x;
    float _3475 = -_3461;
    float _3477 = fma(_3469, _3475, 1.0);
    float3 _9283 = float3(_3465, _3467, _3463);
    float4 _3480 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9283, float3(0.0), isnan(_9283)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9283, float3(0.0), isnan(_9283)), level(0.0)).xyzw;
    float _3482 = _3480.x;
    float _3484 = _3480.y;
    float _3486 = _3480.z;
    float _3488 = _3480.w;
    float2 _9299 = float2(_3477, _3471);
    float3 _3492 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9299, float2(0.0), isnan(_9299)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9299, float2(0.0), isnan(_9299)), level(0.0)).xyz;
    float _3494 = _3492.x;
    float _3496 = _3492.y;
    float _3498 = _3492.z;
    float _3500 = in.m_87.x;
    float _3502 = in.m_87.y;
    float _3504 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3506 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3508 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3510 = _2845 != 0.0;
    bool _3512 = isnan(_2845);
    bool _3514 = _3510 || _3512;
    bool _3516 = isnan(0.0);
    bool _3518 = _3514 || _3516;
    float _3520 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3504);
    float _3522 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3506);
    float _3524 = _2827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3526 = _2847 == 0.0;
    bool _3528 = !_3518;
    bool _3530 = _3526 && _3528;
    float _3532 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3520);
    float _3534 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3522);
    float _3536 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3538 = _2849 == 0.0;
    bool _3540 = _3538 && _3530;
    float _3542 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _3089;
    out.m_89.y = _3087;
    out.m_89.z = _3091;
    float _3544 = exp2(_3536);
    float _3546 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3542);
    float _3548 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3546);
    float _3550 = _2625 * _3502;
    float _3552 = _2645 * _3502;
    float _3554 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3508);
    float _3556 = -_2759;
    float _3558 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3524);
    float _3560 = -_3550;
    float _3562 = fma(_2645, _3500, _3560);
    float _3564 = fma(_2625, _3500, _3552);
    float _3566 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3554);
    float _3568 = _2827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3570 = _2827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3572 = in.m_91.z;
    float _3574 = _2837 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3576 = -_2759;
    float _3578 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3568);
    float _3580 = -_2759;
    float _3582 = fma(_3580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3570);
    float _3584 = in.m_91.x;
    float _3586 = in.m_91.y;
    float _3588 = _2837 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3590 = _2837 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3592 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3558);
    float _3594 = in.m_87.z;
    float _3596 = in.m_87.w;
    float _3598 = fma(_2833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3588);
    float _3600 = fma(_2833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3590);
    float _3602 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3582);
    float _3604 = _3564 * _3592;
    float _3606 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3598);
    float _3608 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3600);
    float _3610 = fma(_2833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3574);
    float _3612 = fma(_3562, _3566, _3604);
    float _3614 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3578);
    float _3616 = _3564 * _3602;
    float _3618 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3610);
    float _3620 = -_3544;
    float _3622 = _3620 + 1.0;
    float _3624 = _3564 * _3614;
    float _3626 = fma(_3562, _3534, _3616);
    float _3628 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3548);
    float _3630 = _3572;
    if (_3540)
    {
        _2461 = _3572;
    }
    float _3632 = _2461;
    float _3634 = fma(_3562, _3532, _3624);
    float _3636 = _2645 * _3586;
    float _3638 = _2625 * _3586;
    out.gl_Position.x = _3445;
    out.gl_Position.y = _3447;
    out.gl_Position.z = _3628;
    out.gl_Position.w = _3417;
    float _3640 = fma(_2625, _3584, _3636);
    float _3642 = -_3638;
    float _3644 = fma(_2645, _3584, _3642);
    float _3646 = _3632;
    float _3648 = _3584;
    if (_3540)
    {
        _2651 = _3632;
    }
    float _3650 = _2651;
    float _3652 = fma(_3618, _3594, _3626);
    float _3654 = _3640 * _3562;
    float _3656 = _3650;
    if (!_3540)
    {
        _3646 = _3572;
    }
    float _3658 = _3646;
    float _3660 = _3644 * _3594;
    float _3662 = fma(_3606, _3594, _3634);
    float _3664 = -_3654;
    float _3666 = fma(_3644, _3564, _3664);
    float _3668 = fma(_3608, _3594, _3612);
    float _3670 = _3564 * _3658;
    float _3672 = -_3660;
    float _3674 = fma(_3562, _3658, _3672);
    if (_3540)
    {
        _3630 = _3640;
    }
    float _3676 = _3630;
    float _3678 = _3676;
    if (!_3540)
    {
        float _3680 = fma(_2845, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3640);
        _3678 = _3680;
    }
    float _3682 = _3678;
    float _3684 = -_3670;
    float _3686 = fma(_3640, _3594, _3684);
    float _3688 = _3674 * _3596;
    out.m_93.x = _3662;
    out.m_93.y = _3652;
    out.m_93.z = _3668;
    if (_3540)
    {
        _3648 = _3644;
    }
    float _3690 = _3648;
    float _3692 = _3690;
    if (!_3540)
    {
        float _3694 = fma(_2847, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3644);
        _3692 = _3694;
    }
    float _3696 = _3692;
    float _3698 = _3686 * _3596;
    float _3700 = _3417 * 0.5;
    float _3702 = _3688 * _3614;
    if (!_3540)
    {
        float _3704 = fma(_2849, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3658);
        _3656 = _3704;
    }
    float _3706 = _3656;
    float _3708 = _3666 * _3596;
    float _3710 = _3628 + _3417;
    float _3712 = fma(_3698, _3532, _3702);
    float _3714 = _3445 + _3417;
    float _3716 = _3602 * _3682;
    float _3718 = _3614 * _3682;
    float _3720 = _3688 * _3602;
    float _3722 = _3592 * _3682;
    float _3724 = fma(_3534, _3696, _3716);
    float _3726 = fma(_3532, _3696, _3718);
    float _3728 = fma(_3698, _3534, _3720);
    float _3730 = fma(_3447, -0.5, _3700);
    float _3732 = fma(_3566, _3696, _3722);
    float _3734 = _3622 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3736 = fma(_3606, _3706, _3726);
    float _3738 = fma(_3618, _3706, _3724);
    float _3740 = fma(_3608, _3706, _3732);
    float _3742 = _3688 * _3592;
    float _3744 = fma(_3708, _3618, _3728);
    float _3746 = fma(_3708, _3606, _3712);
    float _3748 = _3710 * 0.5;
    float _3750 = fma(_3698, _3566, _3742);
    float _3752 = _3714 * 0.5;
    out.m_95.x = _3736;
    out.m_95.y = _3738;
    out.m_95.z = _3740;
    bool _3754 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3756 = isnan(_3181);
    bool _3758 = _3754 || _3756;
    bool _3760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3762 = _3758 || _3760;
    float _3764 = fma(_3708, _3608, _3750);
    float _3766 = _3159 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _3752;
    out.m_97.y = _3730;
    out.m_97.z = _3748;
    out.m_97.w = _3417;
    out.m_99.x = _3746;
    out.m_99.y = _3744;
    out.m_99.z = _3764;
    float _3768 = _3712;
    float _3770 = _3744;
    float _3772 = _3746;
    if (!_3762)
    {
        _3768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3774 = _3768;
    float _3776 = _3774;
    float _3778 = _3774;
    if (!_3762)
    {
        _3770 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3780 = _3770;
    float _3782 = _3780;
    float _3784 = _3780;
    if (!_3762)
    {
        _3772 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3786 = _3772;
    float _3788 = _3734 * _3473;
    float _3790 = -_3734;
    float _3792 = _3790 + 1.0;
    float _3794 = _3488 * _3788;
    float _3796 = _3488 * _3792;
    float _3798 = _3498 * _3788;
    float _3800 = fma(_3494, _3794, _3482);
    float _3802 = fma(_3496, _3794, _3484);
    float _3804 = fma(_3488, _3798, _3486);
    out.m_101.x = _3800;
    out.m_101.y = _3802;
    out.m_101.z = _3804;
    out.m_101.w = _3796;
    bool _3806 = !_3762;
    float _3808 = _3786;
    float _3810 = _3786;
    if (!_3806)
    {
        bool _3812 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3814 = isnan(_3181);
        bool _3816 = _3812 || _3814;
        bool _3818 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3820 = _3816 || _3818;
        if (!_3820)
        {
            float _3822 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3824 = _3181 + _3822;
            float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3828 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3826;
            float _3830 = 1.0 / _3828;
            float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3834 = _3832 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3840 = _3824 * _3830;
            float _3842 = precise::clamp(_3840, 0.0, 1.0);
            float _3844 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3846 = _3844 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3848 = fma(_3842, _3838, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3850 = fma(_3842, _3846, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3852 = fma(_3842, _3834, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3810 = _3852;
            _3784 = _3850;
            _3778 = _3848;
            _3854 = true;
        }
        else
        {
            bool _3856 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3858 = isnan(_3181);
            bool _3860 = _3856 || _3858;
            bool _3862 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3864 = _3860 || _3862;
            if (!_3864)
            {
                _3782 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3866 = _3782;
            _3784 = _3866;
            if (!_3864)
            {
                _3808 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3868 = _3808;
            _3810 = _3868;
            if (!_3864)
            {
                _3776 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3870 = _3776;
            bool _3872 = !_3864;
            _3778 = _3870;
            if (!_3872)
            {
                bool _3874 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3876 = isnan(_3181);
                bool _3878 = _3874 || _3876;
                bool _3880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3882 = _3878 || _3880;
                if (!_3882)
                {
                    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3886 = _3181 + _3884;
                    float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3890 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3888;
                    float _3892 = 1.0 / _3890;
                    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3902 = _3886 * _3892;
                    float _3904 = precise::clamp(_3902, 0.0, 1.0);
                    float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3908 = _3906 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3910 = fma(_3904, _3900, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3912 = fma(_3904, _3908, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3914 = fma(_3904, _3896, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3810 = _3914;
                    _3784 = _3912;
                    _3778 = _3910;
                    _3854 = true;
                }
                else
                {
                    _3810 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3784 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3778 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3854 = false;
    float _3916 = _3810;
    float _3918 = _3784;
    float _3920 = _3778;
    float _3922 = _3766 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_103.x = 0.0;
    float _3924 = _3916 * 0.586610972881317138671875;
    bool _3926 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _3922;
    float _3928 = fma(_3918, 0.298911988735198974609375, _3924);
    bool _3930 = _3159 > 0.0;
    bool _3932 = isnan(_3159);
    bool _3934 = _3930 || _3932;
    bool _3936 = isnan(0.0);
    bool _3938 = _3934 || _3936;
    float _3940 = fma(_3920, 0.114477999508380889892578125, _3928);
    float _3942 = -_3940;
    float _3944 = _3942 + _3918;
    float _3946 = -_3940;
    float _3948 = _3946 + _3916;
    float _3950 = -_3940;
    float _3952 = _3950 + _3920;
    float _3954 = fma(_3944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3940);
    float _3956 = fma(_3948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3940);
    float _3958 = fma(_3952, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3940);
    bool _3960 = !_3926;
    if (!_3960)
    {
        float _3962 = -_3087;
        float _3964 = _3962 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3966 = -_3089;
        float _3968 = _3966 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3970 = -_3091;
        float _3972 = _3970 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3974 = _3964 * _3964;
        float _3976 = fma(_3968, _3968, _3974);
        float _3978 = fma(_3972, _3972, _3976);
        float _3980 = sqrt(_3978);
        float _3982 = rsqrt(_3978);
        float _3984 = -_3980;
        float _3986 = _3984 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3988 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3990 = precise::clamp(_3988, 0.0, 1.0);
        float _3992 = _3968 * _3982;
        float _3994 = _3964 * _3982;
        float _3996 = abs(_3990);
        float _3998 = log2(_3996);
        float _4000 = _3972 * _3982;
        float _4002 = _3992 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4004 = _3738 * _3994;
        float _4006 = -_3994;
        float _4008 = -_4002;
        float _4010 = fma(_4006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4008);
        float _4012 = fma(_3736, _3992, _4004);
        float _4014 = -_4000;
        float _4016 = fma(_4014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4010);
        float _4018 = fma(_3740, _4000, _4012);
        float _4020 = precise::clamp(_4018, 0.0, 1.0);
        float _4022 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4024 = _4016 + _4022;
        float _4026 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4028 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4030 = precise::clamp(_4028, 0.0, 1.0);
        float _4032 = exp2(_4026);
        float _4034 = _4032 * _4030;
        float _4036 = _4020 * _4034;
        float _4038 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4040 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4042 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _4038;
        out.m_103.y = _4040;
        out.m_103.z = _4042;
    }
    out.m_105.x = _3954;
    out.m_105.y = _3956;
    out.m_105.z = _3958;
    if (_3938)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4044;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3854 = false;
    bool _906 = false;
    bool _822 = false;
    bool _624 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_46.w;
    float _121 = in.m_48.w;
    float _123 = trunc(_119);
    int _126 = int(_123);
    float _128 = -_121;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _130;
    bool _134 = _126 >= 1;
    float _136 = 0.0;
    float _138 = _121;
    float _140 = _130;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _136;
    if (!_134)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_134)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4112 = as_type<float>(_148);
        out.gl_Position.z = _4112;
    }
    if (!_134)
    {
        return out;
    }
    bool _152 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_121);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = float(_126);
    bool _164 = _130 >= _162;
    bool _166 = !_160;
    bool _168 = _164 || _166;
    float _170 = 1.0 / _162;
    if (_168)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _138;
    if (_168)
    {
        out.m_53.x = 0.0;
    }
    float _174 = _130 * _170;
    float _176 = _174;
    if (_168)
    {
        float _178 = _172 * 5.0;
        _150 = as_type<int>(_178);
    }
    int _180 = _150;
    out.m_51.x = _174;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4175 = as_type<float>(_180);
        out.gl_Position.z = _4175;
    }
    if (_168)
    {
        return out;
    }
    float _182 = in.m_55.x;
    float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _186 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _194 = _192 != 0;
    int _196 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _198 = _196 != 0;
    float _200 = _186 * _184;
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[20].x, _200);
    float _204 = _202 * 6.283185482025146484375;
    float _206 = floor(_202);
    float _208 = _204 * 0.15915493667125701904296875;
    bool _210 = !_190;
    int _212 = _210 ? 0 : 1;
    int _214 = abs(_212);
    float _216 = _208 * 6.283185482025146484375;
    float _218 = cos(_216);
    bool _220 = !_198;
    int _222 = _220 ? 0 : 1;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _226 = abs(_222);
    float _228 = -_206;
    float _230 = _202 + _228;
    bool _232 = !_194;
    int _234 = _232 ? 0 : 1;
    float _236 = float(_214);
    int _238 = abs(_234);
    float _240 = -_230;
    float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _244 = fma(_218, 0.5, 0.5);
    float _246 = abs(_242);
    float _248 = _236 * _246;
    bool _250 = _230 < 0.5;
    float _252 = float(_250);
    float _254 = float(_226);
    float _256 = -_244;
    float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _260 = float(_238);
    float _262 = -_252;
    float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _266 = fma(_254, _258, _248);
    float _268 = abs(_264);
    float _270 = fma(_260, _268, _266);
    bool _272 = !_224;
    float _288;
    if (!_272)
    {
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        _288 = _174;
    }
    _290 = false;
    float _292 = _288;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = 1.0 / _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _312;
    float _316 = 1.0 / _300;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _320 = _292 + _318;
    bool _322 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _324 = isnan(_292);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _308;
    float _348 = _320 * _310;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _352 = _292 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _356 = _292 + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _360 = _292 + _358;
    float _362 = 1.0 / _314;
    float _364 = _352 * _316;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _368 = 1.0 / _304;
    float _370 = _356 * _346;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = fma(_374, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _380 = _292 + _378;
    float _382 = _380 * _362;
    bool _384 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _386 = isnan(_292);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = _360 * _368;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -_394;
    float _408 = _406 + 1.0;
    float _410 = fma(_398, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = fma(_404, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _414 = -_332;
    float _416 = _414 + 1.0;
    float _418 = _332 * _408;
    bool _420 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _422 = isnan(_292);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _440 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_292);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _456 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _458 = isnan(_292);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_430;
    float _470 = _468 + 1.0;
    float _472 = _430 * _416;
    float _474 = fma(_434, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _476 = fma(_454, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = fma(_438, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _480 = -_466;
    float _482 = _480 + 1.0;
    float _484 = _344 * _470;
    float _486 = -_344;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _490;
    float _494 = _450 * _482;
    float _496 = -_450;
    float _498 = _496 + 1.0;
    float _500 = _466 * _488;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _502;
    float _506 = _412 * _494;
    float _508 = _376 * _494;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _510;
    float _514 = fma(_504, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _516 = _410 * _494;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _522 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[143].x, _506);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _532 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[143].y, _508);
    float _534 = fma(_512, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _536 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[143].z, _516);
    float _538 = fma(_520, _370, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _540 = fma(_526, _370, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _542 = fma(_530, _370, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _544 = fma(_474, _500, _522);
    float _546 = fma(_476, _500, _532);
    float _548 = in.m_57.x;
    float _550 = in.m_57.y;
    float _552 = in.m_57.z;
    float _554 = fma(_478, _500, _536);
    float _556 = fma(_492, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _558 = fma(_514, _484, _544);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _560;
    float _564 = fma(_534, _484, _546);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _566;
    float _570 = fma(_556, _484, _554);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _572;
    float _576 = fma(_562, _382, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _578 = fma(_568, _382, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _580 = fma(_542, _472, _570);
    float _582 = fma(_574, _382, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _584 = fma(_540, _472, _564);
    float _586 = fma(_538, _472, _558);
    float _588 = fma(_582, _418, _580);
    float _590 = fma(_578, _418, _584);
    float _592 = fma(_576, _418, _586);
    float _594 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[148].z, _588);
    float _596 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[148].y, _590);
    float _598 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[148].x, _592);
    float _600 = _594 * _552;
    float _602 = _596 * _550;
    float _604 = _598 * _548;
    bool _606 = !_366;
    float _622;
    if (!_606)
    {
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _610 = _182 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        _622 = _174;
    }
    _624 = false;
    float _626 = _622;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _626 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _644 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _646 = isnan(_626);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = 1.0 / _634;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _662 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _664 = isnan(_626);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    bool _674 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _676 = 1.0 / _642;
    float _678 = _638 * _656;
    bool _680 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _682 = isnan(_626);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _660;
    float _694 = -_654;
    float _696 = _694 + 1.0;
    float _698 = fma(_678, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _704 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _706 = isnan(_626);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -_690;
    float _718 = _716 + 1.0;
    float _720 = _690 * _696;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _726 = 1.0 / _702;
    float _728 = -_714;
    float _730 = _728 + 1.0;
    float _732 = _672 * _718;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _734;
    float _738 = _724 * _676;
    float _740 = _654 * _730;
    float _742 = _698 * _732;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _746 = _626 + _744;
    float _748 = -_672;
    float _750 = _748 + 1.0;
    bool _752 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _754 = isnan(_626);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = _736 * _692;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _772 = _626 + _770;
    float _774 = fma(_738, _746, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _776 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[115].x, _742);
    float _778 = -_762;
    float _780 = _778 + 1.0;
    float _782 = _768 * _726;
    float _784 = fma(_764, _772, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _788 = _626 + _786;
    float _790 = fma(_774, _720, _776);
    float _792 = _714 * _780;
    float _794 = fma(_782, _788, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _796 = fma(_784, _740, _790);
    float _798 = fma(_794, _792, _796);
    float _800 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[119].x, _798);
    float _802 = _800 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.w = _802;
    bool _804 = !_674;
    float _820;
    if (!_804)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _808 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        _820 = _174;
    }
    _822 = false;
    float _824 = _820;
    bool _826 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _828 = isnan(_824);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _842 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _844 = isnan(_824);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _860 = _824 + _858;
    float _862 = -_836;
    float _864 = _862 + 1.0;
    bool _866 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _868 = 1.0 / _840;
    float _870 = _852 * _864;
    float _872 = -_852;
    float _874 = _872 + 1.0;
    float _876 = _856 * _868;
    float _878 = fma(_876, _860, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _880 = _878 * _870;
    float _882 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[131].x, _880);
    float _884 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[132].x, _882);
    float _886 = _884 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.w = _886;
    bool _888 = !_866;
    float _904;
    if (!_888)
    {
        float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _892 = _182 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _896 = _894 * _890;
        float _898 = floor(_896);
        float _900 = -_898;
        float _902 = _896 + _900;
        _904 = _902;
        _906 = true;
    }
    else
    {
        _904 = _174;
    }
    _906 = false;
    float _908 = _904;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _912 = _908 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _916 = _908 + _914;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _934 = 1.0 / _920;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _944 = 1.0 / _924;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _948 = _908 + _946;
    bool _950 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _952 = 1.0 / _932;
    float _954 = _948 * _934;
    bool _956 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _958 = isnan(_908);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _968;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _974 = _908 + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _978 = _908 + _976;
    float _980 = 1.0 / _928;
    float _982 = _912 * _944;
    float _984 = -_966;
    float _986 = _984 + 1.0;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _990 = _908 + _988;
    float _992 = 1.0 / _938;
    bool _994 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _996 = isnan(_908);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = _974 * _952;
    bool _1008 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1010 = isnan(_908);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = 1.0 / _942;
    bool _1022 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1024 = isnan(_908);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = _916 * _980;
    bool _1036 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1038 = isnan(_908);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = 1.0 / _970;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1052 = _908 + _1050;
    float _1054 = _978 * _992;
    bool _1056 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1058 = isnan(_908);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -_1046;
    float _1070 = _1068 + 1.0;
    float _1072 = _1052 * _1020;
    float _1074 = _1004 * _986;
    float _1076 = -_1004;
    float _1078 = _1076 + 1.0;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1080;
    float _1084 = _1032 * _1078;
    float _1086 = -_1032;
    float _1088 = _1086 + 1.0;
    float _1090 = fma(_1082, _954, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1092 = _990 * _1048;
    bool _1094 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1096 = isnan(_908);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = _1018 * _1088;
    float _1108 = -_1018;
    float _1110 = _1108 + 1.0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1112;
    float _1116 = _1046 * _1110;
    float _1118 = fma(_1114, _954, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1120 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1122 = isnan(_908);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = _1066 * _1070;
    float _1134 = -_1066;
    float _1136 = _1134 + 1.0;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1142;
    float _1146 = -_1130;
    float _1148 = _1146 + 1.0;
    float _1150 = _1130 * _1136;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1156 = fma(_1140, _982, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1158 = _1104 * _1148;
    float _1160 = -_1104;
    float _1162 = _1160 + 1.0;
    float _1164 = fma(_1154, _982, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1170 = _1118 * _1158;
    float _1172 = _1090 * _1158;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1174;
    float _1178 = fma(_1168, _1006, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1170);
    float _1182 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1172);
    float _1184 = fma(_1144, _1034, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1186 = fma(_1176, _1034, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1192 = fma(_1156, _1150, _1180);
    float _1194 = fma(_1164, _1150, _1182);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1200;
    float _1204 = fma(_1190, _1006, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1206 = fma(_1184, _1132, _1192);
    float _1208 = fma(_1186, _1132, _1194);
    float _1210 = fma(_1198, _1054, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1212 = fma(_1202, _1054, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1222 = fma(_1178, _1116, _1206);
    float _1224 = fma(_1204, _1116, _1208);
    float _1226 = fma(_1216, _1072, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1228 = fma(_1220, _1072, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1234;
    float _1238 = fma(_1210, _1106, _1222);
    float _1240 = fma(_1212, _1106, _1224);
    float _1242 = fma(_1232, _1092, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1244 = fma(_1236, _1092, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1246 = fma(_1226, _1084, _1238);
    float _1248 = fma(_1228, _1084, _1240);
    float _1250 = fma(_1242, _1074, _1246);
    float _1252 = fma(_1244, _1074, _1248);
    float _1254 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1250);
    float _1256 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1252);
    out.m_63.x = _1254;
    out.m_63.z = _1256;
    bool _1258 = !_950;
    int _1260 = as_type<int>(_1256);
    float _1262 = _1106;
    if (!_1258)
    {
        float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1266 = _182 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1268 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[14].y, _130);
        float _1270 = _1268 * _1264;
        float _1272 = floor(_1270);
        float _1274 = -_1272;
        float _1276 = _1270 + _1274;
        _176 = _1276;
    }
    float _1278 = _176;
    float _1280 = in.m_65.y;
    float _1282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1284 = in.m_55.w;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1288 = _1286 != 0;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1292 = _1290 != 0;
    float _1294 = in.m_65.x;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1298 = _1296 != 0;
    float _1300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1302 = in.m_55.z;
    float _1304 = in.m_55.y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1308 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1316 = _1314 != 0;
    float _1318 = -_1280;
    float _1320 = _1318 + 1.0;
    bool _1322 = _1284 > 0.5;
    int _1324 = _1322 ? as_type<int>(_1320) : as_type<int>(_1280);
    bool _1326 = _1322;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1330 = _1308;
    float _1332 = _1284;
    float _1334 = _1280;
    if (_1288)
    {
        float _1336 = -_1294;
        float _1338 = _1336 + 1.0;
        _1260 = as_type<int>(_1338);
    }
    int _1340 = _1260;
    if (!_1288)
    {
        _1262 = _1294;
    }
    float _1342 = _1262;
    float _1344 = _1298 ? as_type<float>(_1324) : _1280;
    float _1346 = _1344;
    float _1348 = _1342;
    if (_1288)
    {
        bool _1350 = _1302 > 0.5;
        _1326 = _1350;
    }
    bool _1352 = _1326;
    if (!_1292)
    {
        _1328 = _1302;
    }
    float _1354 = _1328;
    float _1356 = fma(_1344, _1308, -0.5);
    float _1358 = _1354;
    if (!_1292)
    {
        _1346 = _1304;
    }
    float _1360 = _1346;
    float _1362 = _1360;
    if (_1288)
    {
        float _1364 = _1352 ? as_type<float>(_1340) : _1294;
        _1348 = _1364;
    }
    float _1366 = _1348;
    if (_1292)
    {
        _1362 = _182;
    }
    float _1368 = _1362;
    if (_1292)
    {
        _1358 = _1304;
    }
    float _1370 = _1358;
    float _1372 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1306);
    if (!_1292)
    {
        _1330 = _1302;
    }
    float _1374 = _1330;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1378 = _1374;
    if (_1292)
    {
        _1378 = _1304;
    }
    float _1380 = _1378;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1386 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1316)
    {
        _1332 = _1294;
    }
    float _1388 = _1332;
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1312);
    float _1392 = -_1376;
    float _1394 = fma(_1382, 2.0, _1392);
    float _1396 = fma(_1384, -2.0, _1310);
    float _1398 = fma(_1386, _1366, -0.5);
    float _1400 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1372);
    float _1402 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1390);
    float _1404 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1396);
    float _1406 = -_130;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1394);
    float _1410 = -_1404;
    float _1412 = fma(_1402, _1356, _1410);
    float _1414 = fma(_1400, _1398, _1408);
    float _1416 = _1412 + 0.5;
    float _1418 = _1414 + 0.5;
    float2 _6187 = float2(_1418, _1416);
    float _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_6187, float2(0.0), isnan(_6187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_6187, float2(0.0), isnan(_6187)), level(0.0)).w;
    float _1422 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1424 = int(_1422);
    float _1426 = in.m_67.x;
    float _1428 = in.m_67.y;
    float _1430 = in.m_67.z;
    float _1432 = in.m_67.w;
    float _1434 = _1304 * 2.0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1438 = _1436 != 0;
    float _1440 = in.m_69.x;
    float _1442 = in.m_69.y;
    float _1444 = in.m_69.z;
    float _1446 = in.m_69.w;
    bool _1448 = _1304 > 0.5;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1454 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1456 = int(_1454);
    float _1458 = in.m_71.w;
    float _1460 = _270 * _604;
    float _1462 = float(_1424);
    float _1464 = 1.0 / _1452;
    bool _1466 = _1448;
    float _1468 = _1388;
    if (_1438)
    {
        float _1470 = _1448 ? _1320 : _1280;
        _1334 = _1470;
    }
    float _1472 = _1334;
    if (_1316)
    {
        bool _1474 = _182 > 0.5;
        _1466 = _1474;
    }
    bool _1476 = _1466;
    float _1478 = float(uint(_1456));
    float _1480 = 1.0 / _1462;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1486 = !_1292;
    float _1488 = _1486 ? 7.345489978790283203125 : 1.0;
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1492 = _1490 != 0;
    float _1494 = 1.0 / _1478;
    out.m_73.w = _1458;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1506 = _1504 != 0;
    float _1508 = _1480 * _130;
    int _1510 = ~_1456;
    int _1512 = _1510 + 1;
    float _1514 = in.m_75.x;
    float _1516 = in.m_75.y;
    float _1518 = in.m_75.z;
    float _1520 = in.m_75.w;
    float _1522 = 1.0 / _1484;
    int _1524 = as_type<int>(_1494) + (-2);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1532 = trunc(_1508);
    int _1534 = int(_1532);
    float _1536 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    float _1538 = 1.0 / _1528;
    float _1540 = float(uint(_1534));
    float _1542 = as_type<float>(_1524) * _1540;
    float _1544 = in.m_46.x;
    float _1546 = in.m_46.y;
    float _1548 = in.m_46.z;
    float _1550 = trunc(_1542);
    float _1552 = precise::max(_1550, 0.0);
    uint _1555 = uint(_1552);
    int _1557 = _1512 * int(_1555);
    int _1559 = _1557 + _1534;
    float _1561 = _1546 * _1516;
    float _1563 = float(uint(_1559));
    float _1565 = _1546 * _1428;
    float _1567 = _1546 * _1442;
    float _1569 = as_type<float>(_1524) * _1563;
    float _1571 = fma(_1544, _1514, _1561);
    float _1573 = fma(_1544, _1426, _1565);
    float _1575 = trunc(_1569);
    float _1577 = precise::max(_1575, 0.0);
    uint _1579 = uint(_1577);
    float _1581 = _182 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1585 = fma(_1544, _1440, _1567);
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1591 = _182 * 2.0;
    float _1593 = -_1583;
    float _1595 = fma(_1581, 2.0, _1593);
    float _1597 = fma(_1548, _1430, _1573);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1599;
    float _1603 = 1.0 / _1589;
    int _1605 = as_type<int>(_1583);
    if (_1316)
    {
        float _1607 = -_1294;
        float _1609 = _1607 + 1.0;
        _1605 = as_type<int>(_1609);
    }
    int _1611 = _1605;
    float _1613 = _1601 * _1464;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1619 = !_1492;
    int _1621 = _1619 ? 0 : 1;
    float _1623 = _1597 + _1432;
    int _1625 = int(_1555) + int(_1579);
    float _1627 = fma(_1548, _1444, _1585);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1631 = _1629 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1633 = floor(_1591);
    float _1635 = fma(_1548, _1518, _1571);
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1639 = _1637 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    if (_1316)
    {
        float _1641 = _1476 ? as_type<float>(_1611) : _1294;
        _1468 = _1641;
    }
    float _1643 = _1468;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1647 = _1645 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1649 = _1631 * _1603;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1651;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1657 = _1655 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1659 = 1.0 / _1639;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1663 = ~_1456;
    int _1665 = _1663 + 1;
    float _1667 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1669 = float(_1534);
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1671;
    float _1675 = _1653 * _1522;
    float _1677 = 1.0 / _1617;
    float _1679 = fma(_1667, -2.0, _1661);
    int _1681 = _1665 * _1625;
    int _1683 = _1681 + _1534;
    float _1685 = _1673 * _1538;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _1691 = _1633 > 0.0;
    float _1693 = _182 + _1302;
    bool _1695 = _1633 >= 0.0;
    bool _1697 = isnan(_1633);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan(0.0);
    bool _1703 = _1699 || _1701;
    float _1705 = _1657 * _1659;
    float _1707 = _1488 * _182;
    float _1709 = float(_1456);
    float _1711 = 1.0 / _1647;
    bool _1713 = !_1498;
    int _1715 = _1713 ? 0 : 1;
    float _1717 = _1693 + (-1.0);
    bool _1719 = uint(_1683) >= uint(_1456);
    float _1721 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1679);
    float _1723 = _1689 * _1677;
    float _1725 = _1627 + _1446;
    float _1727 = floor(_1707);
    bool _1729 = _1669 >= _1709;
    bool _1731 = isnan(_1669);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan(_1709);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = _1709 * _130;
    bool _1743 = !_1719;
    int _1745 = _1743 ? 0 : (-1);
    float _1747 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1747;
    bool _1751 = !_1502;
    int _1753 = _1751 ? 0 : 1;
    float _1755 = _1741 * _170;
    int _1757 = ~_1625;
    int _1759 = _1757 + _1745;
    int _1761 = _1759 + 1;
    float _1763 = trunc(_1739);
    int _1765 = int(_1763);
    float _1767 = _182 + _1304;
    bool _1769 = !_1506;
    int _1771 = _1769 ? 0 : 1;
    float _1773 = _1749 * _1711;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1777 = _1775 != 0;
    int _1779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1781 = _1779 != 0;
    int _1783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1785 = _1783 != 0;
    float _1787 = _1767 + (-1.0);
    int _1789 = _1456 * _1761;
    int _1791 = _1789 + _1534;
    bool _1793 = _1456 == 0;
    float _1795 = -_1727;
    float _1797 = _1707 + _1795;
    float _1799 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1801 = fma(_1717, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1803 = !_1793;
    int _1805 = _1803 ? _1791 : (-1);
    float _1807 = _1797 * _1709;
    int _1809 = _1456 + (-1);
    float _1811 = trunc(_1755);
    int _1813 = int(_1811);
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1817 = _1815 != 0;
    float _1819 = _1304 + _1302;
    int _1821 = ~_1765;
    int _1823 = _1821 + 1;
    int _1825 = _1823 + 1;
    float _1827 = _1635 + _1520;
    int _1829 = abs(_1621);
    int _1831 = abs(_1715);
    int _1833 = _1805 * _1825;
    float _1835 = trunc(_1807);
    int _1837 = int(_1835);
    float _1839 = _1302 * 2.0;
    int _1841 = abs(_1771);
    int _1843 = _1765 * _1809;
    int _1845 = _1843 + _1833;
    int _1847 = abs(_1753);
    bool _1849 = !_1817;
    int _1851 = _1849 ? 0 : 1;
    float _1853 = floor(_1434);
    int _1855 = _1703 ? 0 : 1;
    bool _1857 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1859 = isnan(_1278);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1865 = _1861 || _1863;
    float _1867 = float(_1865);
    int _1869 = _1845 * _1847;
    int _1871 = abs(_1851);
    float _1873 = floor(_1839);
    int _1875 = _1837 * _1829;
    int _1877 = _1875 + _1534;
    float _1879 = _1819 + (-1.0);
    int _1881 = _1813 * _1831;
    int _1883 = _1881 + _1869;
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1887 = _1278 + _1885;
    int _1889 = ~_1855;
    int _1891 = _1889 + 1;
    int _1893 = _1891 + 1;
    int _1895 = _1877 * _1841;
    int _1897 = _1895 + _1883;
    int _1899 = _1893;
    if (!_1691)
    {
        int _1901 = ~_1855;
        int _1903 = _1901 + 1;
        _1899 = _1903;
    }
    int _1905 = _1899;
    float _1907 = fma(_1613, _1887, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1909 = _1853 >= 0.0;
    bool _1911 = isnan(_1853);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan(0.0);
    bool _1917 = _1913 || _1915;
    int _1919 = _1837 * _1871;
    int _1921 = _1919 + _1897;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1925 = _1278 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1929 = _1278 + _1927;
    int _1931 = _1917 ? 0 : 1;
    float _1933 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1935 = _1278 + _1933;
    bool _1937 = _1873 >= 0.0;
    bool _1939 = isnan(_1873);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(0.0);
    bool _1945 = _1941 || _1943;
    float _1947 = fma(_1649, _1929, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1949 = float(uint(_1921));
    float _1951 = fma(_1685, _1935, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    int _1953 = _1945 ? 0 : 1;
    float _1955 = fma(_1879, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1957 = _1873 > 0.0;
    float _1959 = fma(_1705, _1925, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1961 = as_type<float>(_1524) * _1949;
    bool _1963 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1965 = isnan(_1278);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1977 = _1278 + _1975;
    bool _1979 = _1853 > 0.0;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1983 = _1278 + _1981;
    bool _1985 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1987 = isnan(_1278);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1993 = _1989 || _1991;
    float _1995 = float(_1993);
    float _1997 = trunc(_1961);
    float _1999 = precise::max(_1997, 0.0);
    uint _2001 = uint(_1999);
    float _2003 = -_1973;
    float _2005 = _2003 + 1.0;
    bool _2007 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2009 = isnan(_1278);
    bool _2011 = _2007 || _2009;
    bool _2013 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2015 = _2011 || _2013;
    float _2017 = float(_2015);
    float _2019 = fma(_1675, _1983, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2021 = fma(_1723, _1977, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2023 = _1995 * _2005;
    float _2025 = -_1995;
    float _2027 = _2025 + 1.0;
    bool _2029 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2031 = isnan(_1278);
    bool _2033 = _2029 || _2031;
    bool _2035 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2037 = _2033 || _2035;
    float _2039 = float(_2037);
    float _2041 = -_2017;
    float _2043 = _2041 + 1.0;
    int _2045 = ~_1456;
    int _2047 = _2045 + 1;
    float _2049 = _2017 * _2027;
    float _2051 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2053 = _1278 + _2051;
    float _2055 = _2039 * _2043;
    float _2057 = -_2039;
    float _2059 = _2057 + 1.0;
    bool _2061 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2063 = isnan(_1278);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = fma(_1773, _2053, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _2075 = _2047 * int(_2001);
    int _2077 = _2075 + _1921;
    float _2079 = _1867 * _2059;
    float _2081 = -_1867;
    float _2083 = _2081 + 1.0;
    bool _2085 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2087 = isnan(_1278);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2093 = _2089 || _2091;
    float _2095 = float(_2093);
    float _2097 = float(uint(_2077));
    bool _2099 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2101 = isnan(_1278);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2107 = _2103 || _2105;
    float _2109 = float(_2107);
    float _2111 = _2071 * _2083;
    float _2113 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2115 = log2(_2113);
    float _2117 = as_type<float>(_1524) * _2097;
    float _2119 = -_2071;
    float _2121 = _2119 + 1.0;
    float _2123 = -_2109;
    float _2125 = _2123 + 1.0;
    float _2127 = -_2095;
    float _2129 = _2127 + 1.0;
    float _2131 = _2109 * _2121;
    float _2133 = trunc(_2117);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    float _2139 = _2095 * _2125;
    float _2141 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _1472, -0.5);
    float _2143 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1536);
    float _2145 = _1907 * _2139;
    float _2147 = -_1721;
    float _2149 = fma(_2143, _2141, _2147);
    int _2151 = ~_1456;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2145);
    float _2157 = _2115 * _130;
    float _2159 = fma(_1947, _2131, _2155);
    int _2161 = ~_1931;
    int _2163 = _2161 + 1;
    int _2165 = _2163 + 1;
    float _2167 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2169 = int(_2001) + int(_2137);
    float _2171 = -_130;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1595);
    int _2175 = _2165;
    if (!_1979)
    {
        int _2177 = ~_1931;
        int _2179 = _2177 + 1;
        _2175 = _2179;
    }
    int _2181 = _2175;
    float _2183 = exp2(_2157);
    float _2185 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2187 = 1.0 + _2185;
    int _2189 = _2153 * _2169;
    int _2191 = _2189 + _1921;
    float _2193 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2167);
    int _2195 = ~_1953;
    int _2197 = _2195 + 1;
    int _2199 = _2197 + 1;
    float _2201 = fma(_2019, _2111, _2159);
    int _2203 = _2199;
    if (!_1957)
    {
        int _2205 = ~_1953;
        int _2207 = _2205 + 1;
        _2203 = _2207;
    }
    int _2209 = _2203;
    float _2211 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2193);
    float _2213 = 1.0 / _2187;
    bool _2215 = uint(_2191) >= uint(_1456);
    float _2217 = _182 * 6.283185482025146484375;
    bool _2219 = !_1781;
    int _2221 = _2219 ? 0 : 1;
    float _2223 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2225 = float(_1905);
    float _2227 = _2217 + _130;
    bool _2229 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2231 = isnan(1.0);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2237 = _2233 || _2235;
    float _2239 = -_2183;
    float _2241 = _2239 + 1.0;
    float _2243 = float(uint(_1877));
    float _2245 = fma(_2211, _2223, _2173);
    int _2247 = abs(_2221);
    float _2249 = fma(_1959, _2079, _2201);
    bool _2251 = !_2215;
    int _2253 = _2251 ? 0 : (-1);
    float _2255 = as_type<float>(_1524) * _2243;
    bool _2257 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2265 = _2261 || _2263;
    float _2267 = float(_2247);
    int _2269 = ~_2169;
    int _2271 = _2269 + _2253;
    int _2273 = _2271 + 1;
    float _2275 = trunc(_2255);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = _2265 ? _2241 : 0.0;
    float _2283 = _2267 * _2225;
    bool _2285 = !_1785;
    int _2287 = _2285 ? 0 : 1;
    int _2289 = _1456 * _2273;
    int _2291 = _2289 + _1921;
    bool _2293 = !_1777;
    int _2295 = _2293 ? 0 : 1;
    if (_2237)
    {
        float _2297 = _2281 * _2213;
        _140 = _2297;
    }
    float _2299 = _140;
    int _2301 = abs(_2287);
    int _2303 = abs(_2295);
    int _2305 = ~_1456;
    int _2307 = _2305 + 1;
    bool _2309 = !_1793;
    int _2311 = _2309 ? _2291 : (-1);
    int _2313 = _2307 * int(_2279);
    int _2315 = _2313 + _1877;
    float _2317 = float(_2303);
    float _2319 = in.m_77.x;
    float _2321 = in.m_77.y;
    float _2323 = in.m_77.z;
    float _2325 = float(_2209);
    int _2327 = _2311 >> 31;
    float _2329 = float(_2301);
    float _2331 = _2317 * _2325;
    float _2333 = float(_2181);
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2337 = _1725 + _2335;
    int _2339 = _2327 & 3;
    float _2341 = float(uint(_2315));
    float _2343 = _2329 * _2333;
    int _2345 = _2311 + _2339;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2349 = _1623 + _2347;
    float _2351 = _2337 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2353 = as_type<float>(_1524) * _2341;
    int _2355 = _2345 >> 2;
    float _2357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2359 = _1827 + _2357;
    float _2361 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2351);
    float _2363 = _2283 * (-2.0);
    int _2365 = _2355 << 4;
    int _2367 = _2365 + 368;
    float _2369 = _2331 * (-2.0);
    float _2371 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2361);
    float _2373 = fma(_1955, _2363, _1955);
    float _2375 = _2149 + 0.5;
    uint _2377 = uint(int(uint(_2367) >> uint(2)));
    uint _2379 = uint(int(uint(int(_2377)) >> uint(2)));
    int _2381 = int(_2377) & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = int(_2377) + 1;
    uint _2387 = uint(int(uint(_2385) >> uint(2)));
    int _2389 = _2385 & 3;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[int(_2387)][_2389];
    float _2393 = fma(_1951, _2055, _2249);
    float _2395 = fma(_1799, _2369, _1799);
    bool _2397 = _2371 >= 0.0;
    float _2399 = trunc(_2353);
    float _2401 = precise::max(_2399, 0.0);
    uint _2403 = uint(_2401);
    int _2405 = _2311 & 3;
    bool _2407 = _2405 != 0;
    float _2409 = _2245 + 0.5;
    int _2411 = _2311 & 3;
    bool _2413 = _2411 != 0;
    int _2415 = _2367 + 8;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    uint _2419 = uint(int(uint(int(_2417)) >> uint(2)));
    int _2421 = int(_2417) & 3;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[int(_2419)][_2421];
    int _2425 = int(_2417) + 1;
    uint _2427 = uint(int(uint(_2425) >> uint(2)));
    int _2429 = _2425 & 3;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[int(_2427)][_2429];
    bool _2433 = uint(_2405) > 1u;
    float _2435 = _2343 * (-2.0);
    out.m_79.x = _2409;
    out.m_79.y = _2375;
    out.m_79.z = _1418;
    out.m_79.w = _1416;
    float _2437 = fma(_2369, _2319, _2319);
    float _2439 = _1304 + (-0.5);
    float _2441 = fma(_2435, _2323, _2323);
    float _2443 = _1302 + (-0.5);
    float _2445 = fma(_2363, _2321, _2321);
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2449 = _2447 != 0;
    float _2451 = fma(_1801, _2435, _1801);
    float _2453 = fma(_2443, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2441);
    int _2455 = int(_2279) + int(_2403);
    float _2457 = _2217 * 0.15915493667125701904296875;
    float _2459 = fma(_2021, _2049, _2393);
    float _2461 = _2369;
    if (_2397)
    {
        out.m_53.x = 0.0;
    }
    int _2463 = _2413 ? 0 : 1;
    float _2465 = fma(_2439, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2445);
    int _2467 = ~_1456;
    int _2469 = _2467 + 1;
    float _2471 = _182 + (-0.5);
    int _2473 = ~_2463;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    float _2479 = fma(_2373, _2299, _2465);
    int _2481 = _2477;
    if (!_2433)
    {
        int _2483 = ~_2463;
        int _2485 = _2483 + 1;
        _2481 = _2485;
    }
    int _2487 = _2481;
    int _2489 = _2469 * _2455;
    int _2491 = _2489 + _1877;
    bool _2493 = _2405 != 3;
    float _2495 = fma(_2471, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2437);
    bool _2497 = uint(_2405) >= 2u;
    float _2499 = _2479 * 0.15915493667125701904296875;
    bool _2501 = !_2407;
    int _2503 = _2501 ? 0 : 1;
    float _2505 = fma(_2395, _2299, _2495);
    int _2507 = abs(_2487);
    float _2509 = fma(_2073, _2023, _2459);
    int _2511 = _2497 ? 0 : 1;
    float _2513 = _1460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2515 = abs(_2503);
    float _2517 = _2499 * 6.283185482025146484375;
    float _2519 = sin(_2517);
    float _2521 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2509);
    bool _2523 = _2405 != 3;
    float _2525 = _2505 * 0.15915493667125701904296875;
    int _2527 = ~_2511;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    int _2533 = _2531;
    if (_2493)
    {
        int _2535 = ~_2511;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    float _2541 = _2499 * 6.283185482025146484375;
    float _2543 = cos(_2541);
    int _2545 = ~_2507;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    out.m_81.x = _2521;
    bool _2551 = !_2523;
    int _2553 = _2551 ? 0 : (-1);
    int _2555 = _2549 * as_type<int>(_2391);
    bool _2557 = uint(_2491) >= uint(_1456);
    int _2559 = ~_2515;
    int _2561 = _2559 + 1;
    int _2563 = _2561 + 1;
    bool _2565 = !_2449;
    int _2567 = _2565 ? 0 : 1;
    int _2569 = abs(_2539);
    int _2571 = _2563 * as_type<int>(_2383);
    int _2573 = _2571 + _2555;
    int _2575 = abs(_2553);
    bool _2577 = !_2557;
    int _2579 = _2577 ? 0 : (-1);
    int _2581 = abs(_2567);
    int _2583 = ~_2569;
    int _2585 = _2583 + 1;
    int _2587 = _2585 + 1;
    int _2589 = ~_2455;
    int _2591 = _2589 + _2579;
    int _2593 = _2591 + 1;
    float _2595 = _2337 * _2337;
    int _2597 = ~_2575;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    int _2603 = _2587 * as_type<int>(_2423);
    int _2605 = _2603 + _2573;
    int _2607 = ~_2581;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    int _2613 = _1456 * _2593;
    int _2615 = _2613 + _1877;
    float _2617 = fma(_2349, _2349, _2595);
    int _2619 = _2601 * as_type<int>(_2431);
    int _2621 = _2619 + _2605;
    float _2623 = _2457 * 6.283185482025146484375;
    float _2625 = sin(_2623);
    bool _2627 = !_1793;
    int _2629 = _2627 ? _2615 : (-1);
    int _2631 = _2621 * _2611;
    float _2633 = fma(_2359, _2359, _2617);
    float _2635 = _2617;
    if (_2397)
    {
        _2635 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2637 = _2635;
    int _2639 = _2629 * _2581;
    int _2641 = _2639 + _2631;
    float _2643 = _2457 * 6.283185482025146484375;
    float _2645 = cos(_2643);
    float _2647 = _2513 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2649 = as_type<int>(_2637);
    float _2651 = _2645;
    if (_2397)
    {
        float _2653 = _2637 * 5.0;
        _2649 = as_type<int>(_2653);
    }
    int _2655 = _2649;
    float _2657 = float(_2641);
    float _2659 = in.m_83.x;
    float _2661 = in.m_83.y;
    float _2663 = in.m_83.z;
    float _2665 = rsqrt(_2633);
    float _2667 = as_type<float>(_2655);
    if (_2397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7979 = as_type<float>(_2655);
        out.gl_Position.z = _7979;
    }
    out.m_85.x = _2657;
    float _2669 = _2647 * _2665;
    float _2671 = _2349 * _2669;
    float _2673 = _2337 * _2669;
    float _2675 = _2673;
    if (_2397)
    {
        return out;
    }
    float _2677 = -_2673;
    float _2679 = _1725 + _2677;
    float _2681 = _2359 * _2669;
    float _2683 = -_2671;
    float _2685 = _1623 + _2683;
    float _2687 = -_2673;
    float _2689 = _2337 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2693 = _2679 + _2691;
    float _2695 = -_2681;
    float _2697 = _1827 + _2695;
    float _2699 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2701 = _2685 + _2699;
    float _2703 = -_2671;
    float _2705 = _2349 + _2703;
    float _2707 = _2693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2709 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2711 = _2697 + _2709;
    float _2713 = fma(_2451, _2299, _2453);
    float _2715 = -_2681;
    float _2717 = _2359 + _2715;
    float _2719 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2707);
    float _2721 = _2689 * _2689;
    float _2723 = _2525 * 6.283185482025146484375;
    float _2725 = sin(_2723);
    float _2727 = _2713 * 0.15915493667125701904296875;
    float _2729 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2719);
    float _2731 = fma(_2705, _2705, _2721);
    float _2733 = _2625 * _2661;
    float _2735 = _270 * _602;
    float _2737 = _270 * _600;
    bool _2739 = _2729 >= 0.0;
    float _2741 = _2525 * 6.283185482025146484375;
    float _2743 = cos(_2741);
    float _2745 = fma(_2717, _2717, _2731);
    float _2747 = _2645 * _2661;
    float _2749 = -_2733;
    float _2751 = fma(_2645, _2659, _2749);
    float _2753 = _2227 * 0.070000000298023223876953125;
    float _2755 = fma(_2625, _2659, _2747);
    float _2757 = _2727 * 6.283185482025146484375;
    float _2759 = sin(_2757);
    float _2761 = _2725 * _2519;
    float _2763 = fma(_1420, 6.283185482025146484375, _2753);
    float _2765 = _2697;
    if (_2739)
    {
        _2667 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2767 = _2667;
    int _2769 = as_type<int>(_2767);
    if (_2739)
    {
        out.m_53.x = 0.0;
    }
    float _2771 = sqrt(_2745);
    if (_2739)
    {
        float _2773 = _2767 * 5.0;
        _2769 = as_type<int>(_2773);
    }
    int _2775 = _2769;
    float _2777 = _2743 * _2543;
    if (_2739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8155 = as_type<float>(_2775);
        out.gl_Position.z = _8155;
    }
    float _2779 = fma(_2759, _2777, _2761);
    float _2781 = fma(_2759, _2761, _2777);
    float _2783 = _2665 * _2771;
    if (_2739)
    {
        return out;
    }
    float _2785 = _2763 * 0.15915493667125701904296875;
    float _2787 = _2727 * 6.283185482025146484375;
    float _2789 = cos(_2787);
    float _2791 = _2743 * _2519;
    float _2793 = _2725 * _2543;
    float _2795 = _2737 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2797 = _2513 * _2783;
    float _2799 = -_2791;
    float _2801 = fma(_2759, _2793, _2799);
    bool _2803 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2805 = isnan(0.5);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2811 = _2807 || _2809;
    float _2813 = _2785 * 6.283185482025146484375;
    float _2815 = sin(_2813);
    bool _2817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2819 = isnan(0.5);
    bool _2821 = _2817 || _2819;
    bool _2823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2825 = _2821 || _2823;
    float _2827 = _2743 * _2789;
    float _2829 = _2543 * _2789;
    float _2831 = _2725 * _2789;
    float _2833 = _2519 * _2789;
    float _2835 = -_2793;
    float _2837 = fma(_2759, _2791, _2835);
    float _2839 = _2735 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2841 = _2815 * 0.100000001490116119384765625;
    float _2843 = _2783 * _2839;
    float _2845 = fma(_2755, _2841, _2755);
    float _2847 = fma(_2751, _2841, _2751);
    float _2849 = fma(_2841, _2663, _2663);
    float _2851 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2845);
    float _2853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2847);
    float _2855 = _2851 * _2843;
    float _2857 = _2783 * _2795;
    float _2859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2849);
    float _2861 = _2853 * _2797;
    float _2863 = _2827 * _2855;
    float _2865 = -_2855;
    float _2867 = _2759 * _2865;
    float _2869 = _2859 * _2857;
    float _2871 = _2831 * _2855;
    float _2873 = fma(_2779, _2861, _2863);
    float _2875 = fma(_2829, _2861, _2867);
    float _2877 = _2679 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2879 = fma(_2801, _2861, _2871);
    float _2881 = fma(_2837, _2869, _2873);
    float _2883 = fma(_2833, _2869, _2875);
    float _2885 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2877);
    float _2887 = fma(_2781, _2869, _2879);
    float _2889 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2891 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2893 = fma(_2697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2885);
    float _2895 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2889);
    float _2897 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2891);
    float _2899 = _2893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2901 = fma(_2887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2895);
    float _2903 = fma(_2887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2897);
    float _2905 = _2901 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2907 = _2903 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2909 = _1827 + _2905;
    float _2911 = _1623 + _2907;
    float _2913 = _2679 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2917 = _2909 + _2915;
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2921 = _2911 + _2919;
    float _2923 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2913);
    float _2925 = _2917 * _2917;
    float _2927 = fma(_2697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2923);
    float _2929 = fma(_2921, _2921, _2925);
    float _2931 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2933 = _2927 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2935 = sqrt(_2929);
    float _2937 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2931);
    float _2939 = _2933 + _2899;
    float _2941 = fma(_2887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2937);
    float _2943 = 1.0 / _2899;
    float _2945 = _2941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2947 = _1725 + _2945;
    bool _2949 = _2935 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2951 = _2939 * _2943;
    float _2953 = _2951 * 0.5;
    float _2955 = _2887;
    float _2957 = _2943;
    float _2959 = _2911;
    float _2961 = _2935;
    if (!_2949)
    {
        _2955 = _2909;
    }
    float _2963 = _2955;
    float _2965 = _2963;
    if (!_2949)
    {
        _2957 = _2947;
    }
    float _2967 = _2957;
    bool _2969 = !_2949;
    float _2971 = _2967;
    if (!_2969)
    {
        float _2973 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2977 = _2935 + _2975;
        float _2979 = rsqrt(_2929);
        float _2981 = _2977 * _2973;
        float _2983 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2985 = _2981 * 0.15915493667125701904296875;
        float _2987 = _2985 * 6.283185482025146484375;
        float _2989 = cos(_2987);
        float _2991 = _2985 * 6.283185482025146484375;
        float _2993 = sin(_2991);
        float _2995 = _2989 + (-1.0);
        float _2997 = fma(_2993, _2983, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3001 = _2979 * _2997;
        float _3003 = fma(_2947, _2989, _2999);
        float _3005 = fma(_2921, _3001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3007 = fma(_2917, _3001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2959 = _3005;
        _2971 = _3003;
        _2965 = _3007;
        _2961 = _2995;
    }
    float _3009 = _2959;
    float _3011 = _2971;
    float _3013 = _2965;
    float _3015 = _2961;
    float _3017 = -_2671;
    float _3019 = _3017 + _3009;
    float _3021 = -_2673;
    float _3023 = _3021 + _3011;
    float _3025 = -_2681;
    float _3027 = _3025 + _3013;
    float _3029 = _3015;
    float _3031 = _3023;
    float _3033 = _3019;
    float _3035 = _3027;
    float _3037 = _3013;
    if (_2825)
    {
        _3029 = 1.0;
    }
    float _3039 = _3029;
    float _3041 = _3039;
    if (!_2811)
    {
        float _3043 = _2693 * _2693;
        float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3047 = -_1827;
        float _3049 = _3047 + _3013;
        float _3051 = fma(_2701, _2701, _3043);
        float _3053 = fma(_2711, _2711, _3051);
        float _3055 = 1.0 / _2783;
        float _3057 = sqrt(_3053);
        float _3059 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3061 = precise::min(_3057, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3063 = _3061 * _3045;
        float _3065 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3067 = _3063 * _3055;
        float _3069 = -_1623;
        float _3071 = _3069 + _3009;
        float _3073 = -_1725;
        float _3075 = _3073 + _3011;
        float _3077 = _3065 * _3067;
        float _3079 = _3049 * _3067;
        float _3081 = fma(_3071, _3077, _2685);
        float _3083 = fma(_3075, _3077, _2679);
        float _3085 = fma(_3065, _3079, _2697);
        _3031 = _3083;
        _3033 = _3081;
        _3035 = _3085;
        _3037 = _3079;
    }
    float _3087 = _3031;
    float _3089 = _3033;
    float _3091 = _3035;
    float _3093 = _3037;
    float _3095 = _3093;
    if (!_2825)
    {
        float _3097 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3099 = _3097 * 0.15915493667125701904296875;
        float _3101 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3103 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3105 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3103);
        float _3107 = _3099 * 6.283185482025146484375;
        float _3109 = cos(_3107);
        float _3111 = _3101 * 0.15915493667125701904296875;
        float _3113 = _3099 * 6.283185482025146484375;
        float _3115 = sin(_3113);
        float _3117 = 1.0 / _3109;
        float _3119 = _3111 * 6.283185482025146484375;
        float _3121 = cos(_3119);
        float _3123 = _3115 * _3117;
        float _3125 = _3111 * 6.283185482025146484375;
        float _3127 = sin(_3125);
        float _3129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3131 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3129;
        float _3133 = _3121 * _3123;
        float _3135 = 1.0 / _3105;
        float _3137 = 1.0 / _3133;
        float _3139 = 1.0 / _3131;
        float _3141 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3143 = _3135 * _3141;
        float _3145 = _3127 * _3137;
        float _3147 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3149 = fma(_3145, _3143, _3147);
        float _3151 = _3149 * _3139;
        float _3153 = precise::clamp(_3151, 0.0, 1.0);
        _2765 = _3111;
        _3095 = _3135;
        _3041 = _3153;
    }
    float _3155 = _2765;
    float _3157 = _3095;
    float _3159 = _3041;
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3163 = _3087 + _3161;
    float _3165 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3167 = _3089 + _3165;
    float _3169 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3171 = _3091 + _3169;
    float _3173 = _3163 * _3163;
    float _3175 = fma(_3167, _3167, _3173);
    float _3177 = fma(_3171, _3171, _3175);
    float _3179 = rsqrt(_3177);
    float _3181 = sqrt(_3177);
    float _3183 = _3179 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3185 = _3167 * _3183;
    float _3187 = _3171 * _3183;
    float _3189 = _3185 * _3185;
    float _3191 = _3187 * _3187;
    float _3193 = _3189 + _3191;
    float _3195 = sqrt(_3193);
    bool _3197 = _3195 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3201 = _3195 + _3199;
    float _3203 = _3171;
    float _3205 = _3157;
    float _3207 = _3201;
    float _3209 = _3155;
    float _3211 = _3163;
    if (_3197)
    {
        float _3213 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3203 = _3213;
    }
    float _3215 = _3203;
    if (_3197)
    {
        float _3217 = rsqrt(_3193);
        _3205 = _3217;
    }
    float _3219 = _3205;
    float _3221 = _3219;
    if (_3197)
    {
        float _3223 = _3201 * _3215;
        _3207 = _3223;
    }
    float _3225 = _3207;
    if (_3197)
    {
        float _3227 = _3225 * 0.15915493667125701904296875;
        _3209 = _3227;
    }
    float _3229 = _3209;
    float _3231 = _3179;
    if (_3197)
    {
        float _3233 = _3229 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        _3231 = _3235;
    }
    float _3237 = _3231;
    float _3239 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3241 = precise::max(0.0, _3239);
    float _3243 = _3175;
    float _3245 = _3241;
    float _3247 = _3239;
    if (_3197)
    {
        float _3249 = _3229 * 6.283185482025146484375;
        float _3251 = cos(_3249);
        _3243 = _3251;
    }
    float _3253 = _3243;
    float _3255 = -_3183;
    float _3257 = -_3241;
    float _3259 = fma(_3163, _3255, _3257);
    if (!_3197)
    {
        _3245 = _3185;
    }
    float _3261 = _3245;
    float _3263 = _3261;
    if (_3197)
    {
        float _3265 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3247 = _3265;
    }
    float _3267 = _3247;
    float _3269 = _3237;
    float _3271 = _3267;
    if (_3197)
    {
        float _3273 = fma(_3237, _3267, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3211 = _3273;
    }
    float _3275 = _3211;
    float _3277 = _3275;
    if (!_3197)
    {
        _3269 = _3189;
    }
    float _3279 = _3269;
    float _3281 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3285 = fma(_3181, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3283);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = _3279;
    float _3291 = _3253;
    if (_3197)
    {
        float _3293 = _3253 + (-1.0);
        _3271 = _3293;
    }
    float _3295 = _3271;
    float _3297 = _3295;
    if (_3197)
    {
        float _3299 = _3219 * _3275;
        _2675 = _3299;
    }
    float _3301 = _2675;
    if (!_3197)
    {
        _3277 = _3259;
    }
    float _3303 = _3277;
    float _3305 = -_3287;
    float _3307 = _3305 + 1.0;
    float _3309 = _3303;
    if (_3197)
    {
        float _3311 = _3295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3221 = _3311;
    }
    float _3313 = _3221;
    if (_3197)
    {
        float _3315 = _3185 * _3301;
        _3263 = _3315;
    }
    float _3317 = _3263;
    if (!_3197)
    {
        _3297 = _3187;
    }
    float _3319 = _3297;
    float _3321 = _3319;
    if (_3197)
    {
        float _3323 = _3187 * _3301;
        _3321 = _3323;
    }
    float _3325 = _3321;
    if (_3197)
    {
        float _3327 = fma(_3259, _3253, _3313);
        _3309 = _3327;
    }
    float _3329 = _3309;
    if (_3197)
    {
        float _3331 = _3317 * _3317;
        _3289 = _3331;
    }
    float _3333 = _3289;
    if (!_3197)
    {
        _3291 = _3191;
    }
    float _3335 = _3291;
    float _3337 = _3335;
    if (_3197)
    {
        float _3339 = _3325 * _3325;
        _3337 = _3339;
    }
    float _3341 = _3337;
    float _3343 = abs(_3307);
    float _3345 = log2(_3343);
    float _3347 = fma(_3329, _3329, _3333);
    float _3349 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3351 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3353 = _3347 + _3341;
    float _3355 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3349);
    float _3357 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3359 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3351);
    float _3361 = rsqrt(_3353);
    float _3363 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3355);
    float _3365 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3367 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3357);
    float _3369 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3359);
    float _3371 = _3363 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3373 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3365);
    float _3375 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3367);
    float _3377 = _3369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3379 = _3371 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3381 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3373);
    float _3383 = _3375 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3385 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3387 = -_3379;
    float _3389 = fma(_3387, _3281, 1.0);
    float _3391 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3393 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3395 = _3361 * _3317;
    float _3397 = _3361 * _3325;
    float _3399 = exp2(_3385);
    float _3401 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3393);
    float _3403 = _3361 * _3329;
    float _3405 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3407 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3409 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3401);
    float _3411 = -_3405;
    float _3413 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3411);
    float _3415 = log2(_3389);
    float _3417 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3409);
    float _3419 = -_3397;
    float _3421 = fma(_3419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3413);
    float _3423 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3425 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3407);
    float _3427 = fma(_3421, -0.5, 0.5);
    float _3429 = 1.0 / _3417;
    float _3431 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3423);
    float _3433 = fma(_3421, 0.5, 0.5);
    float _3435 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3425);
    float _3437 = _3403 + 1.0;
    float _3439 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3431);
    float _3441 = fma(_3433, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3443 = sqrt(_3427);
    float _3445 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3439);
    float _3447 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3435);
    float _3449 = -_3403;
    float _3451 = fma(_3399, _3437, _3449);
    float _3453 = fma(_3433, _3441, -0.212114393711090087890625);
    float _3455 = _3415 * 0.693147182464599609375;
    float _3457 = _3445 * _3429;
    float _3459 = _3447 * _3429;
    float _3461 = fma(_3433, _3453, 1.570728778839111328125);
    float _3463 = _3455 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3465 = fma(_3457, 0.5, 0.5);
    float _3467 = fma(_3459, -0.5, 0.5);
    float _3469 = _3443 * 0.636619746685028076171875;
    float _3471 = fma(_3451, 0.5, 0.5);
    float3 _9267 = float3(_3465, _3467, _3463);
    float _3473 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9267, float3(0.0), isnan(_9267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9267, float3(0.0), isnan(_9267)), level(0.0)).x;
    float _3475 = -_3461;
    float _3477 = fma(_3469, _3475, 1.0);
    float3 _9283 = float3(_3465, _3467, _3463);
    float4 _3480 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9283, float3(0.0), isnan(_9283)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9283, float3(0.0), isnan(_9283)), level(0.0)).xyzw;
    float _3482 = _3480.x;
    float _3484 = _3480.y;
    float _3486 = _3480.z;
    float _3488 = _3480.w;
    float2 _9299 = float2(_3477, _3471);
    float3 _3492 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9299, float2(0.0), isnan(_9299)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9299, float2(0.0), isnan(_9299)), level(0.0)).xyz;
    float _3494 = _3492.x;
    float _3496 = _3492.y;
    float _3498 = _3492.z;
    float _3500 = in.m_87.x;
    float _3502 = in.m_87.y;
    float _3504 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3506 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3508 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3510 = _2845 != 0.0;
    bool _3512 = isnan(_2845);
    bool _3514 = _3510 || _3512;
    bool _3516 = isnan(0.0);
    bool _3518 = _3514 || _3516;
    float _3520 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3504);
    float _3522 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3506);
    float _3524 = _2827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3526 = _2847 == 0.0;
    bool _3528 = !_3518;
    bool _3530 = _3526 && _3528;
    float _3532 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3520);
    float _3534 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3522);
    float _3536 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3538 = _2849 == 0.0;
    bool _3540 = _3538 && _3530;
    float _3542 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _3089;
    out.m_89.y = _3087;
    out.m_89.z = _3091;
    float _3544 = exp2(_3536);
    float _3546 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3542);
    float _3548 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3546);
    float _3550 = _2625 * _3502;
    float _3552 = _2645 * _3502;
    float _3554 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3508);
    float _3556 = -_2759;
    float _3558 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3524);
    float _3560 = -_3550;
    float _3562 = fma(_2645, _3500, _3560);
    float _3564 = fma(_2625, _3500, _3552);
    float _3566 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3554);
    float _3568 = _2827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3570 = _2827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3572 = in.m_91.z;
    float _3574 = _2837 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3576 = -_2759;
    float _3578 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3568);
    float _3580 = -_2759;
    float _3582 = fma(_3580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3570);
    float _3584 = in.m_91.x;
    float _3586 = in.m_91.y;
    float _3588 = _2837 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3590 = _2837 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3592 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3558);
    float _3594 = in.m_87.z;
    float _3596 = in.m_87.w;
    float _3598 = fma(_2833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3588);
    float _3600 = fma(_2833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3590);
    float _3602 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3582);
    float _3604 = _3564 * _3592;
    float _3606 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3598);
    float _3608 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3600);
    float _3610 = fma(_2833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3574);
    float _3612 = fma(_3562, _3566, _3604);
    float _3614 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3578);
    float _3616 = _3564 * _3602;
    float _3618 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3610);
    float _3620 = -_3544;
    float _3622 = _3620 + 1.0;
    float _3624 = _3564 * _3614;
    float _3626 = fma(_3562, _3534, _3616);
    float _3628 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3548);
    float _3630 = _3572;
    if (_3540)
    {
        _2461 = _3572;
    }
    float _3632 = _2461;
    float _3634 = fma(_3562, _3532, _3624);
    float _3636 = _2645 * _3586;
    float _3638 = _2625 * _3586;
    out.gl_Position.x = _3445;
    out.gl_Position.y = _3447;
    out.gl_Position.z = _3628;
    out.gl_Position.w = _3417;
    float _3640 = fma(_2625, _3584, _3636);
    float _3642 = -_3638;
    float _3644 = fma(_2645, _3584, _3642);
    float _3646 = _3632;
    float _3648 = _3584;
    if (_3540)
    {
        _2651 = _3632;
    }
    float _3650 = _2651;
    float _3652 = fma(_3618, _3594, _3626);
    float _3654 = _3640 * _3562;
    float _3656 = _3650;
    if (!_3540)
    {
        _3646 = _3572;
    }
    float _3658 = _3646;
    float _3660 = _3644 * _3594;
    float _3662 = fma(_3606, _3594, _3634);
    float _3664 = -_3654;
    float _3666 = fma(_3644, _3564, _3664);
    float _3668 = fma(_3608, _3594, _3612);
    float _3670 = _3564 * _3658;
    float _3672 = -_3660;
    float _3674 = fma(_3562, _3658, _3672);
    if (_3540)
    {
        _3630 = _3640;
    }
    float _3676 = _3630;
    float _3678 = _3676;
    if (!_3540)
    {
        float _3680 = fma(_2845, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3640);
        _3678 = _3680;
    }
    float _3682 = _3678;
    float _3684 = -_3670;
    float _3686 = fma(_3640, _3594, _3684);
    float _3688 = _3674 * _3596;
    out.m_93.x = _3662;
    out.m_93.y = _3652;
    out.m_93.z = _3668;
    if (_3540)
    {
        _3648 = _3644;
    }
    float _3690 = _3648;
    float _3692 = _3690;
    if (!_3540)
    {
        float _3694 = fma(_2847, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3644);
        _3692 = _3694;
    }
    float _3696 = _3692;
    float _3698 = _3686 * _3596;
    float _3700 = _3417 * 0.5;
    float _3702 = _3688 * _3614;
    if (!_3540)
    {
        float _3704 = fma(_2849, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3658);
        _3656 = _3704;
    }
    float _3706 = _3656;
    float _3708 = _3666 * _3596;
    float _3710 = _3628 + _3417;
    float _3712 = fma(_3698, _3532, _3702);
    float _3714 = _3445 + _3417;
    float _3716 = _3602 * _3682;
    float _3718 = _3614 * _3682;
    float _3720 = _3688 * _3602;
    float _3722 = _3592 * _3682;
    float _3724 = fma(_3534, _3696, _3716);
    float _3726 = fma(_3532, _3696, _3718);
    float _3728 = fma(_3698, _3534, _3720);
    float _3730 = fma(_3447, -0.5, _3700);
    float _3732 = fma(_3566, _3696, _3722);
    float _3734 = _3622 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3736 = fma(_3606, _3706, _3726);
    float _3738 = fma(_3618, _3706, _3724);
    float _3740 = fma(_3608, _3706, _3732);
    float _3742 = _3688 * _3592;
    float _3744 = fma(_3708, _3618, _3728);
    float _3746 = fma(_3708, _3606, _3712);
    float _3748 = _3710 * 0.5;
    float _3750 = fma(_3698, _3566, _3742);
    float _3752 = _3714 * 0.5;
    out.m_95.x = _3736;
    out.m_95.y = _3738;
    out.m_95.z = _3740;
    bool _3754 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3756 = isnan(_3181);
    bool _3758 = _3754 || _3756;
    bool _3760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3762 = _3758 || _3760;
    float _3764 = fma(_3708, _3608, _3750);
    float _3766 = _3159 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _3752;
    out.m_97.y = _3730;
    out.m_97.z = _3748;
    out.m_97.w = _3417;
    out.m_99.x = _3746;
    out.m_99.y = _3744;
    out.m_99.z = _3764;
    float _3768 = _3712;
    float _3770 = _3744;
    float _3772 = _3746;
    if (!_3762)
    {
        _3768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3774 = _3768;
    float _3776 = _3774;
    float _3778 = _3774;
    if (!_3762)
    {
        _3770 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3780 = _3770;
    float _3782 = _3780;
    float _3784 = _3780;
    if (!_3762)
    {
        _3772 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3786 = _3772;
    float _3788 = _3734 * _3473;
    float _3790 = -_3734;
    float _3792 = _3790 + 1.0;
    float _3794 = _3488 * _3788;
    float _3796 = _3488 * _3792;
    float _3798 = _3498 * _3788;
    float _3800 = fma(_3494, _3794, _3482);
    float _3802 = fma(_3496, _3794, _3484);
    float _3804 = fma(_3488, _3798, _3486);
    out.m_101.x = _3800;
    out.m_101.y = _3802;
    out.m_101.z = _3804;
    out.m_101.w = _3796;
    bool _3806 = !_3762;
    float _3808 = _3786;
    float _3810 = _3786;
    if (!_3806)
    {
        bool _3812 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3814 = isnan(_3181);
        bool _3816 = _3812 || _3814;
        bool _3818 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3820 = _3816 || _3818;
        if (!_3820)
        {
            float _3822 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3824 = _3181 + _3822;
            float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3828 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3826;
            float _3830 = 1.0 / _3828;
            float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3834 = _3832 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3840 = _3824 * _3830;
            float _3842 = precise::clamp(_3840, 0.0, 1.0);
            float _3844 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3846 = _3844 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3848 = fma(_3842, _3838, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3850 = fma(_3842, _3846, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3852 = fma(_3842, _3834, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3810 = _3852;
            _3784 = _3850;
            _3778 = _3848;
            _3854 = true;
        }
        else
        {
            bool _3856 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3858 = isnan(_3181);
            bool _3860 = _3856 || _3858;
            bool _3862 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3864 = _3860 || _3862;
            if (!_3864)
            {
                _3782 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3866 = _3782;
            _3784 = _3866;
            if (!_3864)
            {
                _3808 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3868 = _3808;
            _3810 = _3868;
            if (!_3864)
            {
                _3776 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3870 = _3776;
            bool _3872 = !_3864;
            _3778 = _3870;
            if (!_3872)
            {
                bool _3874 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3876 = isnan(_3181);
                bool _3878 = _3874 || _3876;
                bool _3880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3882 = _3878 || _3880;
                if (!_3882)
                {
                    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3886 = _3181 + _3884;
                    float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3890 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3888;
                    float _3892 = 1.0 / _3890;
                    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3902 = _3886 * _3892;
                    float _3904 = precise::clamp(_3902, 0.0, 1.0);
                    float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3908 = _3906 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3910 = fma(_3904, _3900, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3912 = fma(_3904, _3908, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3914 = fma(_3904, _3896, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3810 = _3914;
                    _3784 = _3912;
                    _3778 = _3910;
                    _3854 = true;
                }
                else
                {
                    _3810 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3784 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3778 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3854 = false;
    float _3916 = _3810;
    float _3918 = _3784;
    float _3920 = _3778;
    float _3922 = _3766 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_103.x = 0.0;
    float _3924 = _3916 * 0.586610972881317138671875;
    bool _3926 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _3922;
    float _3928 = fma(_3918, 0.298911988735198974609375, _3924);
    bool _3930 = _3159 > 0.0;
    bool _3932 = isnan(_3159);
    bool _3934 = _3930 || _3932;
    bool _3936 = isnan(0.0);
    bool _3938 = _3934 || _3936;
    float _3940 = fma(_3920, 0.114477999508380889892578125, _3928);
    float _3942 = -_3940;
    float _3944 = _3942 + _3918;
    float _3946 = -_3940;
    float _3948 = _3946 + _3916;
    float _3950 = -_3940;
    float _3952 = _3950 + _3920;
    float _3954 = fma(_3944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3940);
    float _3956 = fma(_3948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3940);
    float _3958 = fma(_3952, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3940);
    bool _3960 = !_3926;
    if (!_3960)
    {
        float _3962 = -_3087;
        float _3964 = _3962 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3966 = -_3089;
        float _3968 = _3966 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3970 = -_3091;
        float _3972 = _3970 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3974 = _3964 * _3964;
        float _3976 = fma(_3968, _3968, _3974);
        float _3978 = fma(_3972, _3972, _3976);
        float _3980 = sqrt(_3978);
        float _3982 = rsqrt(_3978);
        float _3984 = -_3980;
        float _3986 = _3984 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3988 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3990 = precise::clamp(_3988, 0.0, 1.0);
        float _3992 = _3968 * _3982;
        float _3994 = _3964 * _3982;
        float _3996 = abs(_3990);
        float _3998 = log2(_3996);
        float _4000 = _3972 * _3982;
        float _4002 = _3992 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4004 = _3738 * _3994;
        float _4006 = -_3994;
        float _4008 = -_4002;
        float _4010 = fma(_4006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4008);
        float _4012 = fma(_3736, _3992, _4004);
        float _4014 = -_4000;
        float _4016 = fma(_4014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4010);
        float _4018 = fma(_3740, _4000, _4012);
        float _4020 = precise::clamp(_4018, 0.0, 1.0);
        float _4022 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4024 = _4016 + _4022;
        float _4026 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4028 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4030 = precise::clamp(_4028, 0.0, 1.0);
        float _4032 = exp2(_4026);
        float _4034 = _4032 * _4030;
        float _4036 = _4020 * _4034;
        float _4038 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4040 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4042 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _4038;
        out.m_103.y = _4040;
        out.m_103.z = _4042;
    }
    out.m_105.x = _3954;
    out.m_105.y = _3956;
    out.m_105.z = _3958;
    if (_3938)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4044;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3854 = false;
    bool _906 = false;
    bool _822 = false;
    bool _624 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_46.w;
    float _121 = in.m_48.w;
    float _123 = trunc(_119);
    int _126 = int(_123);
    float _128 = -_121;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _130;
    bool _134 = _126 >= 1;
    float _136 = 0.0;
    float _138 = _121;
    float _140 = _130;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _136;
    if (!_134)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_134)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4112 = as_type<float>(_148);
        out.gl_Position.z = _4112;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _152 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_121);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = float(_126);
    bool _164 = _130 >= _162;
    bool _166 = !_160;
    bool _168 = _164 || _166;
    float _170 = 1.0 / _162;
    if (_168)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _138;
    if (_168)
    {
        out.m_53.x = 0.0;
    }
    float _174 = _130 * _170;
    float _176 = _174;
    if (_168)
    {
        float _178 = _172 * 5.0;
        _150 = as_type<int>(_178);
    }
    int _180 = _150;
    out.m_51.x = _174;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4175 = as_type<float>(_180);
        out.gl_Position.z = _4175;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = in.m_55.x;
    float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _186 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _194 = _192 != 0;
    int _196 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _198 = _196 != 0;
    float _200 = _186 * _184;
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[20].x, _200);
    float _204 = _202 * 6.283185482025146484375;
    float _206 = floor(_202);
    float _208 = _204 * 0.15915493667125701904296875;
    bool _210 = !_190;
    int _212 = _210 ? 0 : 1;
    int _214 = abs(_212);
    float _216 = _208 * 6.283185482025146484375;
    float _218 = cos(_216);
    bool _220 = !_198;
    int _222 = _220 ? 0 : 1;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _226 = abs(_222);
    float _228 = -_206;
    float _230 = _202 + _228;
    bool _232 = !_194;
    int _234 = _232 ? 0 : 1;
    float _236 = float(_214);
    int _238 = abs(_234);
    float _240 = -_230;
    float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _244 = fma(_218, 0.5, 0.5);
    float _246 = abs(_242);
    float _248 = _236 * _246;
    bool _250 = _230 < 0.5;
    float _252 = float(_250);
    float _254 = float(_226);
    float _256 = -_244;
    float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _260 = float(_238);
    float _262 = -_252;
    float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _266 = fma(_254, _258, _248);
    float _268 = abs(_264);
    float _270 = fma(_260, _268, _266);
    bool _272 = !_224;
    float _288;
    if (!_272)
    {
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        _288 = _174;
    }
    _290 = false;
    float _292 = _288;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = 1.0 / _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _312;
    float _316 = 1.0 / _300;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _320 = _292 + _318;
    bool _322 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _324 = isnan(_292);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _308;
    float _348 = _320 * _310;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _352 = _292 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _356 = _292 + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _360 = _292 + _358;
    float _362 = 1.0 / _314;
    float _364 = _352 * _316;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _368 = 1.0 / _304;
    float _370 = _356 * _346;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = fma(_374, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _380 = _292 + _378;
    float _382 = _380 * _362;
    bool _384 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _386 = isnan(_292);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = _360 * _368;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -_394;
    float _408 = _406 + 1.0;
    float _410 = fma(_398, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = fma(_404, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _414 = -_332;
    float _416 = _414 + 1.0;
    float _418 = _332 * _408;
    bool _420 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _422 = isnan(_292);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _440 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_292);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _456 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _458 = isnan(_292);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_430;
    float _470 = _468 + 1.0;
    float _472 = _430 * _416;
    float _474 = fma(_434, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _476 = fma(_454, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = fma(_438, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _480 = -_466;
    float _482 = _480 + 1.0;
    float _484 = _344 * _470;
    float _486 = -_344;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _490;
    float _494 = _450 * _482;
    float _496 = -_450;
    float _498 = _496 + 1.0;
    float _500 = _466 * _488;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _502;
    float _506 = _412 * _494;
    float _508 = _376 * _494;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _510;
    float _514 = fma(_504, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _516 = _410 * _494;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _522 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[143].x, _506);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _532 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[143].y, _508);
    float _534 = fma(_512, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _536 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[143].z, _516);
    float _538 = fma(_520, _370, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _540 = fma(_526, _370, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _542 = fma(_530, _370, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _544 = fma(_474, _500, _522);
    float _546 = fma(_476, _500, _532);
    float _548 = in.m_57.x;
    float _550 = in.m_57.y;
    float _552 = in.m_57.z;
    float _554 = fma(_478, _500, _536);
    float _556 = fma(_492, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _558 = fma(_514, _484, _544);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _560;
    float _564 = fma(_534, _484, _546);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _566;
    float _570 = fma(_556, _484, _554);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _572;
    float _576 = fma(_562, _382, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _578 = fma(_568, _382, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _580 = fma(_542, _472, _570);
    float _582 = fma(_574, _382, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _584 = fma(_540, _472, _564);
    float _586 = fma(_538, _472, _558);
    float _588 = fma(_582, _418, _580);
    float _590 = fma(_578, _418, _584);
    float _592 = fma(_576, _418, _586);
    float _594 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[148].z, _588);
    float _596 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[148].y, _590);
    float _598 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[148].x, _592);
    float _600 = _594 * _552;
    float _602 = _596 * _550;
    float _604 = _598 * _548;
    bool _606 = !_366;
    float _622;
    if (!_606)
    {
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _610 = _182 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        _622 = _174;
    }
    _624 = false;
    float _626 = _622;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _626 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _644 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _646 = isnan(_626);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = 1.0 / _634;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _662 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _664 = isnan(_626);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    bool _674 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _676 = 1.0 / _642;
    float _678 = _638 * _656;
    bool _680 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _682 = isnan(_626);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _660;
    float _694 = -_654;
    float _696 = _694 + 1.0;
    float _698 = fma(_678, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _704 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _706 = isnan(_626);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -_690;
    float _718 = _716 + 1.0;
    float _720 = _690 * _696;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _726 = 1.0 / _702;
    float _728 = -_714;
    float _730 = _728 + 1.0;
    float _732 = _672 * _718;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _734;
    float _738 = _724 * _676;
    float _740 = _654 * _730;
    float _742 = _698 * _732;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _746 = _626 + _744;
    float _748 = -_672;
    float _750 = _748 + 1.0;
    bool _752 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _754 = isnan(_626);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = _736 * _692;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _772 = _626 + _770;
    float _774 = fma(_738, _746, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _776 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[115].x, _742);
    float _778 = -_762;
    float _780 = _778 + 1.0;
    float _782 = _768 * _726;
    float _784 = fma(_764, _772, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _788 = _626 + _786;
    float _790 = fma(_774, _720, _776);
    float _792 = _714 * _780;
    float _794 = fma(_782, _788, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _796 = fma(_784, _740, _790);
    float _798 = fma(_794, _792, _796);
    float _800 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[119].x, _798);
    float _802 = _800 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.w = _802;
    bool _804 = !_674;
    float _820;
    if (!_804)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _808 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        _820 = _174;
    }
    _822 = false;
    float _824 = _820;
    bool _826 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _828 = isnan(_824);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _842 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _844 = isnan(_824);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _860 = _824 + _858;
    float _862 = -_836;
    float _864 = _862 + 1.0;
    bool _866 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _868 = 1.0 / _840;
    float _870 = _852 * _864;
    float _872 = -_852;
    float _874 = _872 + 1.0;
    float _876 = _856 * _868;
    float _878 = fma(_876, _860, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _880 = _878 * _870;
    float _882 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[131].x, _880);
    float _884 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[132].x, _882);
    float _886 = _884 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.w = _886;
    bool _888 = !_866;
    float _904;
    if (!_888)
    {
        float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _892 = _182 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _896 = _894 * _890;
        float _898 = floor(_896);
        float _900 = -_898;
        float _902 = _896 + _900;
        _904 = _902;
        _906 = true;
    }
    else
    {
        _904 = _174;
    }
    _906 = false;
    float _908 = _904;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _912 = _908 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _916 = _908 + _914;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _934 = 1.0 / _920;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _944 = 1.0 / _924;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _948 = _908 + _946;
    bool _950 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _952 = 1.0 / _932;
    float _954 = _948 * _934;
    bool _956 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _958 = isnan(_908);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _968;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _974 = _908 + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _978 = _908 + _976;
    float _980 = 1.0 / _928;
    float _982 = _912 * _944;
    float _984 = -_966;
    float _986 = _984 + 1.0;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _990 = _908 + _988;
    float _992 = 1.0 / _938;
    bool _994 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _996 = isnan(_908);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = _974 * _952;
    bool _1008 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1010 = isnan(_908);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = 1.0 / _942;
    bool _1022 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1024 = isnan(_908);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = _916 * _980;
    bool _1036 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1038 = isnan(_908);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = 1.0 / _970;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1052 = _908 + _1050;
    float _1054 = _978 * _992;
    bool _1056 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1058 = isnan(_908);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -_1046;
    float _1070 = _1068 + 1.0;
    float _1072 = _1052 * _1020;
    float _1074 = _1004 * _986;
    float _1076 = -_1004;
    float _1078 = _1076 + 1.0;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1080;
    float _1084 = _1032 * _1078;
    float _1086 = -_1032;
    float _1088 = _1086 + 1.0;
    float _1090 = fma(_1082, _954, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1092 = _990 * _1048;
    bool _1094 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1096 = isnan(_908);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = _1018 * _1088;
    float _1108 = -_1018;
    float _1110 = _1108 + 1.0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1112;
    float _1116 = _1046 * _1110;
    float _1118 = fma(_1114, _954, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1120 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1122 = isnan(_908);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = _1066 * _1070;
    float _1134 = -_1066;
    float _1136 = _1134 + 1.0;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1142;
    float _1146 = -_1130;
    float _1148 = _1146 + 1.0;
    float _1150 = _1130 * _1136;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1156 = fma(_1140, _982, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1158 = _1104 * _1148;
    float _1160 = -_1104;
    float _1162 = _1160 + 1.0;
    float _1164 = fma(_1154, _982, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1170 = _1118 * _1158;
    float _1172 = _1090 * _1158;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1174;
    float _1178 = fma(_1168, _1006, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1170);
    float _1182 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1172);
    float _1184 = fma(_1144, _1034, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1186 = fma(_1176, _1034, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1192 = fma(_1156, _1150, _1180);
    float _1194 = fma(_1164, _1150, _1182);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1200;
    float _1204 = fma(_1190, _1006, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1206 = fma(_1184, _1132, _1192);
    float _1208 = fma(_1186, _1132, _1194);
    float _1210 = fma(_1198, _1054, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1212 = fma(_1202, _1054, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1222 = fma(_1178, _1116, _1206);
    float _1224 = fma(_1204, _1116, _1208);
    float _1226 = fma(_1216, _1072, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1228 = fma(_1220, _1072, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1234;
    float _1238 = fma(_1210, _1106, _1222);
    float _1240 = fma(_1212, _1106, _1224);
    float _1242 = fma(_1232, _1092, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1244 = fma(_1236, _1092, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1246 = fma(_1226, _1084, _1238);
    float _1248 = fma(_1228, _1084, _1240);
    float _1250 = fma(_1242, _1074, _1246);
    float _1252 = fma(_1244, _1074, _1248);
    float _1254 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1250);
    float _1256 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1252);
    out.m_63.x = _1254;
    out.m_63.z = _1256;
    bool _1258 = !_950;
    int _1260 = as_type<int>(_1256);
    float _1262 = _1106;
    if (!_1258)
    {
        float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1266 = _182 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1268 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[14].y, _130);
        float _1270 = _1268 * _1264;
        float _1272 = floor(_1270);
        float _1274 = -_1272;
        float _1276 = _1270 + _1274;
        _176 = _1276;
    }
    float _1278 = _176;
    float _1280 = in.m_65.y;
    float _1282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1284 = in.m_55.w;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1288 = _1286 != 0;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1292 = _1290 != 0;
    float _1294 = in.m_65.x;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1298 = _1296 != 0;
    float _1300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1302 = in.m_55.z;
    float _1304 = in.m_55.y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1308 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1316 = _1314 != 0;
    float _1318 = -_1280;
    float _1320 = _1318 + 1.0;
    bool _1322 = _1284 > 0.5;
    int _1324 = _1322 ? as_type<int>(_1320) : as_type<int>(_1280);
    bool _1326 = _1322;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1330 = _1308;
    float _1332 = _1284;
    float _1334 = _1280;
    if (_1288)
    {
        float _1336 = -_1294;
        float _1338 = _1336 + 1.0;
        _1260 = as_type<int>(_1338);
    }
    int _1340 = _1260;
    if (!_1288)
    {
        _1262 = _1294;
    }
    float _1342 = _1262;
    float _1344 = _1298 ? as_type<float>(_1324) : _1280;
    float _1346 = _1344;
    float _1348 = _1342;
    if (_1288)
    {
        bool _1350 = _1302 > 0.5;
        _1326 = _1350;
    }
    bool _1352 = _1326;
    if (!_1292)
    {
        _1328 = _1302;
    }
    float _1354 = _1328;
    float _1356 = fma(_1344, _1308, -0.5);
    float _1358 = _1354;
    if (!_1292)
    {
        _1346 = _1304;
    }
    float _1360 = _1346;
    float _1362 = _1360;
    if (_1288)
    {
        float _1364 = _1352 ? as_type<float>(_1340) : _1294;
        _1348 = _1364;
    }
    float _1366 = _1348;
    if (_1292)
    {
        _1362 = _182;
    }
    float _1368 = _1362;
    if (_1292)
    {
        _1358 = _1304;
    }
    float _1370 = _1358;
    float _1372 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1306);
    if (!_1292)
    {
        _1330 = _1302;
    }
    float _1374 = _1330;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1378 = _1374;
    if (_1292)
    {
        _1378 = _1304;
    }
    float _1380 = _1378;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1386 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1316)
    {
        _1332 = _1294;
    }
    float _1388 = _1332;
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1312);
    float _1392 = -_1376;
    float _1394 = fma(_1382, 2.0, _1392);
    float _1396 = fma(_1384, -2.0, _1310);
    float _1398 = fma(_1386, _1366, -0.5);
    float _1400 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1372);
    float _1402 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1390);
    float _1404 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1396);
    float _1406 = -_130;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1394);
    float _1410 = -_1404;
    float _1412 = fma(_1402, _1356, _1410);
    float _1414 = fma(_1400, _1398, _1408);
    float _1416 = _1412 + 0.5;
    float _1418 = _1414 + 0.5;
    float2 _6187 = float2(_1418, _1416);
    float _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_6187, float2(0.0), isnan(_6187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_6187, float2(0.0), isnan(_6187)), level(0.0)).w;
    float _1422 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1424 = int(_1422);
    float _1426 = in.m_67.x;
    float _1428 = in.m_67.y;
    float _1430 = in.m_67.z;
    float _1432 = in.m_67.w;
    float _1434 = _1304 * 2.0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1438 = _1436 != 0;
    float _1440 = in.m_69.x;
    float _1442 = in.m_69.y;
    float _1444 = in.m_69.z;
    float _1446 = in.m_69.w;
    bool _1448 = _1304 > 0.5;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1454 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1456 = int(_1454);
    float _1458 = in.m_71.w;
    float _1460 = _270 * _604;
    float _1462 = float(_1424);
    float _1464 = 1.0 / _1452;
    bool _1466 = _1448;
    float _1468 = _1388;
    if (_1438)
    {
        float _1470 = _1448 ? _1320 : _1280;
        _1334 = _1470;
    }
    float _1472 = _1334;
    if (_1316)
    {
        bool _1474 = _182 > 0.5;
        _1466 = _1474;
    }
    bool _1476 = _1466;
    float _1478 = float(uint(_1456));
    float _1480 = 1.0 / _1462;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1486 = !_1292;
    float _1488 = _1486 ? 7.345489978790283203125 : 1.0;
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1492 = _1490 != 0;
    float _1494 = 1.0 / _1478;
    out.m_73.w = _1458;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1506 = _1504 != 0;
    float _1508 = _1480 * _130;
    int _1510 = ~_1456;
    int _1512 = _1510 + 1;
    float _1514 = in.m_75.x;
    float _1516 = in.m_75.y;
    float _1518 = in.m_75.z;
    float _1520 = in.m_75.w;
    float _1522 = 1.0 / _1484;
    int _1524 = as_type<int>(_1494) + (-2);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1532 = trunc(_1508);
    int _1534 = int(_1532);
    float _1536 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    float _1538 = 1.0 / _1528;
    float _1540 = float(uint(_1534));
    float _1542 = as_type<float>(_1524) * _1540;
    float _1544 = in.m_46.x;
    float _1546 = in.m_46.y;
    float _1548 = in.m_46.z;
    float _1550 = trunc(_1542);
    float _1552 = precise::max(_1550, 0.0);
    uint _1555 = uint(_1552);
    int _1557 = _1512 * int(_1555);
    int _1559 = _1557 + _1534;
    float _1561 = _1546 * _1516;
    float _1563 = float(uint(_1559));
    float _1565 = _1546 * _1428;
    float _1567 = _1546 * _1442;
    float _1569 = as_type<float>(_1524) * _1563;
    float _1571 = fma(_1544, _1514, _1561);
    float _1573 = fma(_1544, _1426, _1565);
    float _1575 = trunc(_1569);
    float _1577 = precise::max(_1575, 0.0);
    uint _1579 = uint(_1577);
    float _1581 = _182 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1585 = fma(_1544, _1440, _1567);
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1591 = _182 * 2.0;
    float _1593 = -_1583;
    float _1595 = fma(_1581, 2.0, _1593);
    float _1597 = fma(_1548, _1430, _1573);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1599;
    float _1603 = 1.0 / _1589;
    int _1605 = as_type<int>(_1583);
    if (_1316)
    {
        float _1607 = -_1294;
        float _1609 = _1607 + 1.0;
        _1605 = as_type<int>(_1609);
    }
    int _1611 = _1605;
    float _1613 = _1601 * _1464;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1619 = !_1492;
    int _1621 = _1619 ? 0 : 1;
    float _1623 = _1597 + _1432;
    int _1625 = int(_1555) + int(_1579);
    float _1627 = fma(_1548, _1444, _1585);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1631 = _1629 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1633 = floor(_1591);
    float _1635 = fma(_1548, _1518, _1571);
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1639 = _1637 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    if (_1316)
    {
        float _1641 = _1476 ? as_type<float>(_1611) : _1294;
        _1468 = _1641;
    }
    float _1643 = _1468;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1647 = _1645 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1649 = _1631 * _1603;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1651;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1657 = _1655 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1659 = 1.0 / _1639;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1663 = ~_1456;
    int _1665 = _1663 + 1;
    float _1667 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1669 = float(_1534);
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1671;
    float _1675 = _1653 * _1522;
    float _1677 = 1.0 / _1617;
    float _1679 = fma(_1667, -2.0, _1661);
    int _1681 = _1665 * _1625;
    int _1683 = _1681 + _1534;
    float _1685 = _1673 * _1538;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _1691 = _1633 > 0.0;
    float _1693 = _182 + _1302;
    bool _1695 = _1633 >= 0.0;
    bool _1697 = isnan(_1633);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan(0.0);
    bool _1703 = _1699 || _1701;
    float _1705 = _1657 * _1659;
    float _1707 = _1488 * _182;
    float _1709 = float(_1456);
    float _1711 = 1.0 / _1647;
    bool _1713 = !_1498;
    int _1715 = _1713 ? 0 : 1;
    float _1717 = _1693 + (-1.0);
    bool _1719 = uint(_1683) >= uint(_1456);
    float _1721 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1679);
    float _1723 = _1689 * _1677;
    float _1725 = _1627 + _1446;
    float _1727 = floor(_1707);
    bool _1729 = _1669 >= _1709;
    bool _1731 = isnan(_1669);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan(_1709);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = _1709 * _130;
    bool _1743 = !_1719;
    int _1745 = _1743 ? 0 : (-1);
    float _1747 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1747;
    bool _1751 = !_1502;
    int _1753 = _1751 ? 0 : 1;
    float _1755 = _1741 * _170;
    int _1757 = ~_1625;
    int _1759 = _1757 + _1745;
    int _1761 = _1759 + 1;
    float _1763 = trunc(_1739);
    int _1765 = int(_1763);
    float _1767 = _182 + _1304;
    bool _1769 = !_1506;
    int _1771 = _1769 ? 0 : 1;
    float _1773 = _1749 * _1711;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1777 = _1775 != 0;
    int _1779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1781 = _1779 != 0;
    int _1783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1785 = _1783 != 0;
    float _1787 = _1767 + (-1.0);
    int _1789 = _1456 * _1761;
    int _1791 = _1789 + _1534;
    bool _1793 = _1456 == 0;
    float _1795 = -_1727;
    float _1797 = _1707 + _1795;
    float _1799 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1801 = fma(_1717, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1803 = !_1793;
    int _1805 = _1803 ? _1791 : (-1);
    float _1807 = _1797 * _1709;
    int _1809 = _1456 + (-1);
    float _1811 = trunc(_1755);
    int _1813 = int(_1811);
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1817 = _1815 != 0;
    float _1819 = _1304 + _1302;
    int _1821 = ~_1765;
    int _1823 = _1821 + 1;
    int _1825 = _1823 + 1;
    float _1827 = _1635 + _1520;
    int _1829 = abs(_1621);
    int _1831 = abs(_1715);
    int _1833 = _1805 * _1825;
    float _1835 = trunc(_1807);
    int _1837 = int(_1835);
    float _1839 = _1302 * 2.0;
    int _1841 = abs(_1771);
    int _1843 = _1765 * _1809;
    int _1845 = _1843 + _1833;
    int _1847 = abs(_1753);
    bool _1849 = !_1817;
    int _1851 = _1849 ? 0 : 1;
    float _1853 = floor(_1434);
    int _1855 = _1703 ? 0 : 1;
    bool _1857 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1859 = isnan(_1278);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1865 = _1861 || _1863;
    float _1867 = float(_1865);
    int _1869 = _1845 * _1847;
    int _1871 = abs(_1851);
    float _1873 = floor(_1839);
    int _1875 = _1837 * _1829;
    int _1877 = _1875 + _1534;
    float _1879 = _1819 + (-1.0);
    int _1881 = _1813 * _1831;
    int _1883 = _1881 + _1869;
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1887 = _1278 + _1885;
    int _1889 = ~_1855;
    int _1891 = _1889 + 1;
    int _1893 = _1891 + 1;
    int _1895 = _1877 * _1841;
    int _1897 = _1895 + _1883;
    int _1899 = _1893;
    if (!_1691)
    {
        int _1901 = ~_1855;
        int _1903 = _1901 + 1;
        _1899 = _1903;
    }
    int _1905 = _1899;
    float _1907 = fma(_1613, _1887, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1909 = _1853 >= 0.0;
    bool _1911 = isnan(_1853);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan(0.0);
    bool _1917 = _1913 || _1915;
    int _1919 = _1837 * _1871;
    int _1921 = _1919 + _1897;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1925 = _1278 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1929 = _1278 + _1927;
    int _1931 = _1917 ? 0 : 1;
    float _1933 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1935 = _1278 + _1933;
    bool _1937 = _1873 >= 0.0;
    bool _1939 = isnan(_1873);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(0.0);
    bool _1945 = _1941 || _1943;
    float _1947 = fma(_1649, _1929, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1949 = float(uint(_1921));
    float _1951 = fma(_1685, _1935, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    int _1953 = _1945 ? 0 : 1;
    float _1955 = fma(_1879, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1957 = _1873 > 0.0;
    float _1959 = fma(_1705, _1925, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1961 = as_type<float>(_1524) * _1949;
    bool _1963 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1965 = isnan(_1278);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1977 = _1278 + _1975;
    bool _1979 = _1853 > 0.0;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1983 = _1278 + _1981;
    bool _1985 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1987 = isnan(_1278);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1993 = _1989 || _1991;
    float _1995 = float(_1993);
    float _1997 = trunc(_1961);
    float _1999 = precise::max(_1997, 0.0);
    uint _2001 = uint(_1999);
    float _2003 = -_1973;
    float _2005 = _2003 + 1.0;
    bool _2007 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2009 = isnan(_1278);
    bool _2011 = _2007 || _2009;
    bool _2013 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2015 = _2011 || _2013;
    float _2017 = float(_2015);
    float _2019 = fma(_1675, _1983, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2021 = fma(_1723, _1977, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2023 = _1995 * _2005;
    float _2025 = -_1995;
    float _2027 = _2025 + 1.0;
    bool _2029 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2031 = isnan(_1278);
    bool _2033 = _2029 || _2031;
    bool _2035 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2037 = _2033 || _2035;
    float _2039 = float(_2037);
    float _2041 = -_2017;
    float _2043 = _2041 + 1.0;
    int _2045 = ~_1456;
    int _2047 = _2045 + 1;
    float _2049 = _2017 * _2027;
    float _2051 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2053 = _1278 + _2051;
    float _2055 = _2039 * _2043;
    float _2057 = -_2039;
    float _2059 = _2057 + 1.0;
    bool _2061 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2063 = isnan(_1278);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = fma(_1773, _2053, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _2075 = _2047 * int(_2001);
    int _2077 = _2075 + _1921;
    float _2079 = _1867 * _2059;
    float _2081 = -_1867;
    float _2083 = _2081 + 1.0;
    bool _2085 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2087 = isnan(_1278);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2093 = _2089 || _2091;
    float _2095 = float(_2093);
    float _2097 = float(uint(_2077));
    bool _2099 = _1278 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2101 = isnan(_1278);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2107 = _2103 || _2105;
    float _2109 = float(_2107);
    float _2111 = _2071 * _2083;
    float _2113 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2115 = log2(_2113);
    float _2117 = as_type<float>(_1524) * _2097;
    float _2119 = -_2071;
    float _2121 = _2119 + 1.0;
    float _2123 = -_2109;
    float _2125 = _2123 + 1.0;
    float _2127 = -_2095;
    float _2129 = _2127 + 1.0;
    float _2131 = _2109 * _2121;
    float _2133 = trunc(_2117);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    float _2139 = _2095 * _2125;
    float _2141 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _1472, -0.5);
    float _2143 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1536);
    float _2145 = _1907 * _2139;
    float _2147 = -_1721;
    float _2149 = fma(_2143, _2141, _2147);
    int _2151 = ~_1456;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2145);
    float _2157 = _2115 * _130;
    float _2159 = fma(_1947, _2131, _2155);
    int _2161 = ~_1931;
    int _2163 = _2161 + 1;
    int _2165 = _2163 + 1;
    float _2167 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2169 = int(_2001) + int(_2137);
    float _2171 = -_130;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1595);
    int _2175 = _2165;
    if (!_1979)
    {
        int _2177 = ~_1931;
        int _2179 = _2177 + 1;
        _2175 = _2179;
    }
    int _2181 = _2175;
    float _2183 = exp2(_2157);
    float _2185 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2187 = 1.0 + _2185;
    int _2189 = _2153 * _2169;
    int _2191 = _2189 + _1921;
    float _2193 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2167);
    int _2195 = ~_1953;
    int _2197 = _2195 + 1;
    int _2199 = _2197 + 1;
    float _2201 = fma(_2019, _2111, _2159);
    int _2203 = _2199;
    if (!_1957)
    {
        int _2205 = ~_1953;
        int _2207 = _2205 + 1;
        _2203 = _2207;
    }
    int _2209 = _2203;
    float _2211 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2193);
    float _2213 = 1.0 / _2187;
    bool _2215 = uint(_2191) >= uint(_1456);
    float _2217 = _182 * 6.283185482025146484375;
    bool _2219 = !_1781;
    int _2221 = _2219 ? 0 : 1;
    float _2223 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2225 = float(_1905);
    float _2227 = _2217 + _130;
    bool _2229 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2231 = isnan(1.0);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2237 = _2233 || _2235;
    float _2239 = -_2183;
    float _2241 = _2239 + 1.0;
    float _2243 = float(uint(_1877));
    float _2245 = fma(_2211, _2223, _2173);
    int _2247 = abs(_2221);
    float _2249 = fma(_1959, _2079, _2201);
    bool _2251 = !_2215;
    int _2253 = _2251 ? 0 : (-1);
    float _2255 = as_type<float>(_1524) * _2243;
    bool _2257 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2265 = _2261 || _2263;
    float _2267 = float(_2247);
    int _2269 = ~_2169;
    int _2271 = _2269 + _2253;
    int _2273 = _2271 + 1;
    float _2275 = trunc(_2255);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = _2265 ? _2241 : 0.0;
    float _2283 = _2267 * _2225;
    bool _2285 = !_1785;
    int _2287 = _2285 ? 0 : 1;
    int _2289 = _1456 * _2273;
    int _2291 = _2289 + _1921;
    bool _2293 = !_1777;
    int _2295 = _2293 ? 0 : 1;
    if (_2237)
    {
        float _2297 = _2281 * _2213;
        _140 = _2297;
    }
    float _2299 = _140;
    int _2301 = abs(_2287);
    int _2303 = abs(_2295);
    int _2305 = ~_1456;
    int _2307 = _2305 + 1;
    bool _2309 = !_1793;
    int _2311 = _2309 ? _2291 : (-1);
    int _2313 = _2307 * int(_2279);
    int _2315 = _2313 + _1877;
    float _2317 = float(_2303);
    float _2319 = in.m_77.x;
    float _2321 = in.m_77.y;
    float _2323 = in.m_77.z;
    float _2325 = float(_2209);
    int _2327 = _2311 >> 31;
    float _2329 = float(_2301);
    float _2331 = _2317 * _2325;
    float _2333 = float(_2181);
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2337 = _1725 + _2335;
    int _2339 = _2327 & 3;
    float _2341 = float(uint(_2315));
    float _2343 = _2329 * _2333;
    int _2345 = _2311 + _2339;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2349 = _1623 + _2347;
    float _2351 = _2337 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2353 = as_type<float>(_1524) * _2341;
    int _2355 = _2345 >> 2;
    float _2357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2359 = _1827 + _2357;
    float _2361 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2351);
    float _2363 = _2283 * (-2.0);
    int _2365 = _2355 << 4;
    int _2367 = _2365 + 368;
    float _2369 = _2331 * (-2.0);
    float _2371 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2361);
    float _2373 = fma(_1955, _2363, _1955);
    float _2375 = _2149 + 0.5;
    uint _2377 = uint(int(uint(_2367) >> uint(2)));
    uint _2379 = uint(int(uint(int(_2377)) >> uint(2)));
    int _2381 = int(_2377) & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = int(_2377) + 1;
    uint _2387 = uint(int(uint(_2385) >> uint(2)));
    int _2389 = _2385 & 3;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[int(_2387)][_2389];
    float _2393 = fma(_1951, _2055, _2249);
    float _2395 = fma(_1799, _2369, _1799);
    bool _2397 = _2371 >= 0.0;
    float _2399 = trunc(_2353);
    float _2401 = precise::max(_2399, 0.0);
    uint _2403 = uint(_2401);
    int _2405 = _2311 & 3;
    bool _2407 = _2405 != 0;
    float _2409 = _2245 + 0.5;
    int _2411 = _2311 & 3;
    bool _2413 = _2411 != 0;
    int _2415 = _2367 + 8;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    uint _2419 = uint(int(uint(int(_2417)) >> uint(2)));
    int _2421 = int(_2417) & 3;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[int(_2419)][_2421];
    int _2425 = int(_2417) + 1;
    uint _2427 = uint(int(uint(_2425) >> uint(2)));
    int _2429 = _2425 & 3;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[int(_2427)][_2429];
    bool _2433 = uint(_2405) > 1u;
    float _2435 = _2343 * (-2.0);
    out.m_79.x = _2409;
    out.m_79.y = _2375;
    out.m_79.z = _1418;
    out.m_79.w = _1416;
    float _2437 = fma(_2369, _2319, _2319);
    float _2439 = _1304 + (-0.5);
    float _2441 = fma(_2435, _2323, _2323);
    float _2443 = _1302 + (-0.5);
    float _2445 = fma(_2363, _2321, _2321);
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2449 = _2447 != 0;
    float _2451 = fma(_1801, _2435, _1801);
    float _2453 = fma(_2443, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2441);
    int _2455 = int(_2279) + int(_2403);
    float _2457 = _2217 * 0.15915493667125701904296875;
    float _2459 = fma(_2021, _2049, _2393);
    float _2461 = _2369;
    if (_2397)
    {
        out.m_53.x = 0.0;
    }
    int _2463 = _2413 ? 0 : 1;
    float _2465 = fma(_2439, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2445);
    int _2467 = ~_1456;
    int _2469 = _2467 + 1;
    float _2471 = _182 + (-0.5);
    int _2473 = ~_2463;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    float _2479 = fma(_2373, _2299, _2465);
    int _2481 = _2477;
    if (!_2433)
    {
        int _2483 = ~_2463;
        int _2485 = _2483 + 1;
        _2481 = _2485;
    }
    int _2487 = _2481;
    int _2489 = _2469 * _2455;
    int _2491 = _2489 + _1877;
    bool _2493 = _2405 != 3;
    float _2495 = fma(_2471, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2437);
    bool _2497 = uint(_2405) >= 2u;
    float _2499 = _2479 * 0.15915493667125701904296875;
    bool _2501 = !_2407;
    int _2503 = _2501 ? 0 : 1;
    float _2505 = fma(_2395, _2299, _2495);
    int _2507 = abs(_2487);
    float _2509 = fma(_2073, _2023, _2459);
    int _2511 = _2497 ? 0 : 1;
    float _2513 = _1460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2515 = abs(_2503);
    float _2517 = _2499 * 6.283185482025146484375;
    float _2519 = sin(_2517);
    float _2521 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2509);
    bool _2523 = _2405 != 3;
    float _2525 = _2505 * 0.15915493667125701904296875;
    int _2527 = ~_2511;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    int _2533 = _2531;
    if (_2493)
    {
        int _2535 = ~_2511;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    float _2541 = _2499 * 6.283185482025146484375;
    float _2543 = cos(_2541);
    int _2545 = ~_2507;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    out.m_81.x = _2521;
    bool _2551 = !_2523;
    int _2553 = _2551 ? 0 : (-1);
    int _2555 = _2549 * as_type<int>(_2391);
    bool _2557 = uint(_2491) >= uint(_1456);
    int _2559 = ~_2515;
    int _2561 = _2559 + 1;
    int _2563 = _2561 + 1;
    bool _2565 = !_2449;
    int _2567 = _2565 ? 0 : 1;
    int _2569 = abs(_2539);
    int _2571 = _2563 * as_type<int>(_2383);
    int _2573 = _2571 + _2555;
    int _2575 = abs(_2553);
    bool _2577 = !_2557;
    int _2579 = _2577 ? 0 : (-1);
    int _2581 = abs(_2567);
    int _2583 = ~_2569;
    int _2585 = _2583 + 1;
    int _2587 = _2585 + 1;
    int _2589 = ~_2455;
    int _2591 = _2589 + _2579;
    int _2593 = _2591 + 1;
    float _2595 = _2337 * _2337;
    int _2597 = ~_2575;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    int _2603 = _2587 * as_type<int>(_2423);
    int _2605 = _2603 + _2573;
    int _2607 = ~_2581;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    int _2613 = _1456 * _2593;
    int _2615 = _2613 + _1877;
    float _2617 = fma(_2349, _2349, _2595);
    int _2619 = _2601 * as_type<int>(_2431);
    int _2621 = _2619 + _2605;
    float _2623 = _2457 * 6.283185482025146484375;
    float _2625 = sin(_2623);
    bool _2627 = !_1793;
    int _2629 = _2627 ? _2615 : (-1);
    int _2631 = _2621 * _2611;
    float _2633 = fma(_2359, _2359, _2617);
    float _2635 = _2617;
    if (_2397)
    {
        _2635 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2637 = _2635;
    int _2639 = _2629 * _2581;
    int _2641 = _2639 + _2631;
    float _2643 = _2457 * 6.283185482025146484375;
    float _2645 = cos(_2643);
    float _2647 = _2513 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2649 = as_type<int>(_2637);
    float _2651 = _2645;
    if (_2397)
    {
        float _2653 = _2637 * 5.0;
        _2649 = as_type<int>(_2653);
    }
    int _2655 = _2649;
    float _2657 = float(_2641);
    float _2659 = in.m_83.x;
    float _2661 = in.m_83.y;
    float _2663 = in.m_83.z;
    float _2665 = rsqrt(_2633);
    float _2667 = as_type<float>(_2655);
    if (_2397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7979 = as_type<float>(_2655);
        out.gl_Position.z = _7979;
    }
    out.m_85.x = _2657;
    float _2669 = _2647 * _2665;
    float _2671 = _2349 * _2669;
    float _2673 = _2337 * _2669;
    float _2675 = _2673;
    if (_2397)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2677 = -_2673;
    float _2679 = _1725 + _2677;
    float _2681 = _2359 * _2669;
    float _2683 = -_2671;
    float _2685 = _1623 + _2683;
    float _2687 = -_2673;
    float _2689 = _2337 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2693 = _2679 + _2691;
    float _2695 = -_2681;
    float _2697 = _1827 + _2695;
    float _2699 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2701 = _2685 + _2699;
    float _2703 = -_2671;
    float _2705 = _2349 + _2703;
    float _2707 = _2693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2709 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2711 = _2697 + _2709;
    float _2713 = fma(_2451, _2299, _2453);
    float _2715 = -_2681;
    float _2717 = _2359 + _2715;
    float _2719 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2707);
    float _2721 = _2689 * _2689;
    float _2723 = _2525 * 6.283185482025146484375;
    float _2725 = sin(_2723);
    float _2727 = _2713 * 0.15915493667125701904296875;
    float _2729 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2719);
    float _2731 = fma(_2705, _2705, _2721);
    float _2733 = _2625 * _2661;
    float _2735 = _270 * _602;
    float _2737 = _270 * _600;
    bool _2739 = _2729 >= 0.0;
    float _2741 = _2525 * 6.283185482025146484375;
    float _2743 = cos(_2741);
    float _2745 = fma(_2717, _2717, _2731);
    float _2747 = _2645 * _2661;
    float _2749 = -_2733;
    float _2751 = fma(_2645, _2659, _2749);
    float _2753 = _2227 * 0.070000000298023223876953125;
    float _2755 = fma(_2625, _2659, _2747);
    float _2757 = _2727 * 6.283185482025146484375;
    float _2759 = sin(_2757);
    float _2761 = _2725 * _2519;
    float _2763 = fma(_1420, 6.283185482025146484375, _2753);
    float _2765 = _2697;
    if (_2739)
    {
        _2667 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2767 = _2667;
    int _2769 = as_type<int>(_2767);
    if (_2739)
    {
        out.m_53.x = 0.0;
    }
    float _2771 = sqrt(_2745);
    if (_2739)
    {
        float _2773 = _2767 * 5.0;
        _2769 = as_type<int>(_2773);
    }
    int _2775 = _2769;
    float _2777 = _2743 * _2543;
    if (_2739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8155 = as_type<float>(_2775);
        out.gl_Position.z = _8155;
    }
    float _2779 = fma(_2759, _2777, _2761);
    float _2781 = fma(_2759, _2761, _2777);
    float _2783 = _2665 * _2771;
    if (_2739)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2785 = _2763 * 0.15915493667125701904296875;
    float _2787 = _2727 * 6.283185482025146484375;
    float _2789 = cos(_2787);
    float _2791 = _2743 * _2519;
    float _2793 = _2725 * _2543;
    float _2795 = _2737 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2797 = _2513 * _2783;
    float _2799 = -_2791;
    float _2801 = fma(_2759, _2793, _2799);
    bool _2803 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2805 = isnan(0.5);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2811 = _2807 || _2809;
    float _2813 = _2785 * 6.283185482025146484375;
    float _2815 = sin(_2813);
    bool _2817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2819 = isnan(0.5);
    bool _2821 = _2817 || _2819;
    bool _2823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2825 = _2821 || _2823;
    float _2827 = _2743 * _2789;
    float _2829 = _2543 * _2789;
    float _2831 = _2725 * _2789;
    float _2833 = _2519 * _2789;
    float _2835 = -_2793;
    float _2837 = fma(_2759, _2791, _2835);
    float _2839 = _2735 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2841 = _2815 * 0.100000001490116119384765625;
    float _2843 = _2783 * _2839;
    float _2845 = fma(_2755, _2841, _2755);
    float _2847 = fma(_2751, _2841, _2751);
    float _2849 = fma(_2841, _2663, _2663);
    float _2851 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2845);
    float _2853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2847);
    float _2855 = _2851 * _2843;
    float _2857 = _2783 * _2795;
    float _2859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2849);
    float _2861 = _2853 * _2797;
    float _2863 = _2827 * _2855;
    float _2865 = -_2855;
    float _2867 = _2759 * _2865;
    float _2869 = _2859 * _2857;
    float _2871 = _2831 * _2855;
    float _2873 = fma(_2779, _2861, _2863);
    float _2875 = fma(_2829, _2861, _2867);
    float _2877 = _2679 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2879 = fma(_2801, _2861, _2871);
    float _2881 = fma(_2837, _2869, _2873);
    float _2883 = fma(_2833, _2869, _2875);
    float _2885 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2877);
    float _2887 = fma(_2781, _2869, _2879);
    float _2889 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2891 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2893 = fma(_2697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2885);
    float _2895 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2889);
    float _2897 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2891);
    float _2899 = _2893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2901 = fma(_2887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2895);
    float _2903 = fma(_2887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2897);
    float _2905 = _2901 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2907 = _2903 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2909 = _1827 + _2905;
    float _2911 = _1623 + _2907;
    float _2913 = _2679 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2917 = _2909 + _2915;
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2921 = _2911 + _2919;
    float _2923 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2913);
    float _2925 = _2917 * _2917;
    float _2927 = fma(_2697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2923);
    float _2929 = fma(_2921, _2921, _2925);
    float _2931 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2933 = _2927 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2935 = sqrt(_2929);
    float _2937 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2931);
    float _2939 = _2933 + _2899;
    float _2941 = fma(_2887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2937);
    float _2943 = 1.0 / _2899;
    float _2945 = _2941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2947 = _1725 + _2945;
    bool _2949 = _2935 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2951 = _2939 * _2943;
    float _2953 = _2951 * 0.5;
    float _2955 = _2887;
    float _2957 = _2943;
    float _2959 = _2911;
    float _2961 = _2935;
    if (!_2949)
    {
        _2955 = _2909;
    }
    float _2963 = _2955;
    float _2965 = _2963;
    if (!_2949)
    {
        _2957 = _2947;
    }
    float _2967 = _2957;
    bool _2969 = !_2949;
    float _2971 = _2967;
    if (!_2969)
    {
        float _2973 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2977 = _2935 + _2975;
        float _2979 = rsqrt(_2929);
        float _2981 = _2977 * _2973;
        float _2983 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2985 = _2981 * 0.15915493667125701904296875;
        float _2987 = _2985 * 6.283185482025146484375;
        float _2989 = cos(_2987);
        float _2991 = _2985 * 6.283185482025146484375;
        float _2993 = sin(_2991);
        float _2995 = _2989 + (-1.0);
        float _2997 = fma(_2993, _2983, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3001 = _2979 * _2997;
        float _3003 = fma(_2947, _2989, _2999);
        float _3005 = fma(_2921, _3001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3007 = fma(_2917, _3001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2959 = _3005;
        _2971 = _3003;
        _2965 = _3007;
        _2961 = _2995;
    }
    float _3009 = _2959;
    float _3011 = _2971;
    float _3013 = _2965;
    float _3015 = _2961;
    float _3017 = -_2671;
    float _3019 = _3017 + _3009;
    float _3021 = -_2673;
    float _3023 = _3021 + _3011;
    float _3025 = -_2681;
    float _3027 = _3025 + _3013;
    float _3029 = _3015;
    float _3031 = _3023;
    float _3033 = _3019;
    float _3035 = _3027;
    float _3037 = _3013;
    if (_2825)
    {
        _3029 = 1.0;
    }
    float _3039 = _3029;
    float _3041 = _3039;
    if (!_2811)
    {
        float _3043 = _2693 * _2693;
        float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3047 = -_1827;
        float _3049 = _3047 + _3013;
        float _3051 = fma(_2701, _2701, _3043);
        float _3053 = fma(_2711, _2711, _3051);
        float _3055 = 1.0 / _2783;
        float _3057 = sqrt(_3053);
        float _3059 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3061 = precise::min(_3057, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3063 = _3061 * _3045;
        float _3065 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3067 = _3063 * _3055;
        float _3069 = -_1623;
        float _3071 = _3069 + _3009;
        float _3073 = -_1725;
        float _3075 = _3073 + _3011;
        float _3077 = _3065 * _3067;
        float _3079 = _3049 * _3067;
        float _3081 = fma(_3071, _3077, _2685);
        float _3083 = fma(_3075, _3077, _2679);
        float _3085 = fma(_3065, _3079, _2697);
        _3031 = _3083;
        _3033 = _3081;
        _3035 = _3085;
        _3037 = _3079;
    }
    float _3087 = _3031;
    float _3089 = _3033;
    float _3091 = _3035;
    float _3093 = _3037;
    float _3095 = _3093;
    if (!_2825)
    {
        float _3097 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3099 = _3097 * 0.15915493667125701904296875;
        float _3101 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3103 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3105 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3103);
        float _3107 = _3099 * 6.283185482025146484375;
        float _3109 = cos(_3107);
        float _3111 = _3101 * 0.15915493667125701904296875;
        float _3113 = _3099 * 6.283185482025146484375;
        float _3115 = sin(_3113);
        float _3117 = 1.0 / _3109;
        float _3119 = _3111 * 6.283185482025146484375;
        float _3121 = cos(_3119);
        float _3123 = _3115 * _3117;
        float _3125 = _3111 * 6.283185482025146484375;
        float _3127 = sin(_3125);
        float _3129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3131 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3129;
        float _3133 = _3121 * _3123;
        float _3135 = 1.0 / _3105;
        float _3137 = 1.0 / _3133;
        float _3139 = 1.0 / _3131;
        float _3141 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3143 = _3135 * _3141;
        float _3145 = _3127 * _3137;
        float _3147 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3149 = fma(_3145, _3143, _3147);
        float _3151 = _3149 * _3139;
        float _3153 = precise::clamp(_3151, 0.0, 1.0);
        _2765 = _3111;
        _3095 = _3135;
        _3041 = _3153;
    }
    float _3155 = _2765;
    float _3157 = _3095;
    float _3159 = _3041;
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3163 = _3087 + _3161;
    float _3165 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3167 = _3089 + _3165;
    float _3169 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3171 = _3091 + _3169;
    float _3173 = _3163 * _3163;
    float _3175 = fma(_3167, _3167, _3173);
    float _3177 = fma(_3171, _3171, _3175);
    float _3179 = rsqrt(_3177);
    float _3181 = sqrt(_3177);
    float _3183 = _3179 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3185 = _3167 * _3183;
    float _3187 = _3171 * _3183;
    float _3189 = _3185 * _3185;
    float _3191 = _3187 * _3187;
    float _3193 = _3189 + _3191;
    float _3195 = sqrt(_3193);
    bool _3197 = _3195 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3201 = _3195 + _3199;
    float _3203 = _3171;
    float _3205 = _3157;
    float _3207 = _3201;
    float _3209 = _3155;
    float _3211 = _3163;
    if (_3197)
    {
        float _3213 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3203 = _3213;
    }
    float _3215 = _3203;
    if (_3197)
    {
        float _3217 = rsqrt(_3193);
        _3205 = _3217;
    }
    float _3219 = _3205;
    float _3221 = _3219;
    if (_3197)
    {
        float _3223 = _3201 * _3215;
        _3207 = _3223;
    }
    float _3225 = _3207;
    if (_3197)
    {
        float _3227 = _3225 * 0.15915493667125701904296875;
        _3209 = _3227;
    }
    float _3229 = _3209;
    float _3231 = _3179;
    if (_3197)
    {
        float _3233 = _3229 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        _3231 = _3235;
    }
    float _3237 = _3231;
    float _3239 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3241 = precise::max(0.0, _3239);
    float _3243 = _3175;
    float _3245 = _3241;
    float _3247 = _3239;
    if (_3197)
    {
        float _3249 = _3229 * 6.283185482025146484375;
        float _3251 = cos(_3249);
        _3243 = _3251;
    }
    float _3253 = _3243;
    float _3255 = -_3183;
    float _3257 = -_3241;
    float _3259 = fma(_3163, _3255, _3257);
    if (!_3197)
    {
        _3245 = _3185;
    }
    float _3261 = _3245;
    float _3263 = _3261;
    if (_3197)
    {
        float _3265 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3247 = _3265;
    }
    float _3267 = _3247;
    float _3269 = _3237;
    float _3271 = _3267;
    if (_3197)
    {
        float _3273 = fma(_3237, _3267, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3211 = _3273;
    }
    float _3275 = _3211;
    float _3277 = _3275;
    if (!_3197)
    {
        _3269 = _3189;
    }
    float _3279 = _3269;
    float _3281 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3285 = fma(_3181, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3283);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = _3279;
    float _3291 = _3253;
    if (_3197)
    {
        float _3293 = _3253 + (-1.0);
        _3271 = _3293;
    }
    float _3295 = _3271;
    float _3297 = _3295;
    if (_3197)
    {
        float _3299 = _3219 * _3275;
        _2675 = _3299;
    }
    float _3301 = _2675;
    if (!_3197)
    {
        _3277 = _3259;
    }
    float _3303 = _3277;
    float _3305 = -_3287;
    float _3307 = _3305 + 1.0;
    float _3309 = _3303;
    if (_3197)
    {
        float _3311 = _3295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3221 = _3311;
    }
    float _3313 = _3221;
    if (_3197)
    {
        float _3315 = _3185 * _3301;
        _3263 = _3315;
    }
    float _3317 = _3263;
    if (!_3197)
    {
        _3297 = _3187;
    }
    float _3319 = _3297;
    float _3321 = _3319;
    if (_3197)
    {
        float _3323 = _3187 * _3301;
        _3321 = _3323;
    }
    float _3325 = _3321;
    if (_3197)
    {
        float _3327 = fma(_3259, _3253, _3313);
        _3309 = _3327;
    }
    float _3329 = _3309;
    if (_3197)
    {
        float _3331 = _3317 * _3317;
        _3289 = _3331;
    }
    float _3333 = _3289;
    if (!_3197)
    {
        _3291 = _3191;
    }
    float _3335 = _3291;
    float _3337 = _3335;
    if (_3197)
    {
        float _3339 = _3325 * _3325;
        _3337 = _3339;
    }
    float _3341 = _3337;
    float _3343 = abs(_3307);
    float _3345 = log2(_3343);
    float _3347 = fma(_3329, _3329, _3333);
    float _3349 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3351 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3353 = _3347 + _3341;
    float _3355 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3349);
    float _3357 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3359 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3351);
    float _3361 = rsqrt(_3353);
    float _3363 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3355);
    float _3365 = _3087 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3367 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3357);
    float _3369 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3359);
    float _3371 = _3363 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3373 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3365);
    float _3375 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3367);
    float _3377 = _3369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3379 = _3371 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3381 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3373);
    float _3383 = _3375 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3385 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3387 = -_3379;
    float _3389 = fma(_3387, _3281, 1.0);
    float _3391 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3393 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3395 = _3361 * _3317;
    float _3397 = _3361 * _3325;
    float _3399 = exp2(_3385);
    float _3401 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3393);
    float _3403 = _3361 * _3329;
    float _3405 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3407 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3409 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3401);
    float _3411 = -_3405;
    float _3413 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3411);
    float _3415 = log2(_3389);
    float _3417 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3409);
    float _3419 = -_3397;
    float _3421 = fma(_3419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3413);
    float _3423 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3425 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3407);
    float _3427 = fma(_3421, -0.5, 0.5);
    float _3429 = 1.0 / _3417;
    float _3431 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3423);
    float _3433 = fma(_3421, 0.5, 0.5);
    float _3435 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3425);
    float _3437 = _3403 + 1.0;
    float _3439 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3431);
    float _3441 = fma(_3433, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3443 = sqrt(_3427);
    float _3445 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3439);
    float _3447 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3435);
    float _3449 = -_3403;
    float _3451 = fma(_3399, _3437, _3449);
    float _3453 = fma(_3433, _3441, -0.212114393711090087890625);
    float _3455 = _3415 * 0.693147182464599609375;
    float _3457 = _3445 * _3429;
    float _3459 = _3447 * _3429;
    float _3461 = fma(_3433, _3453, 1.570728778839111328125);
    float _3463 = _3455 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3465 = fma(_3457, 0.5, 0.5);
    float _3467 = fma(_3459, -0.5, 0.5);
    float _3469 = _3443 * 0.636619746685028076171875;
    float _3471 = fma(_3451, 0.5, 0.5);
    float3 _9267 = float3(_3465, _3467, _3463);
    float _3473 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9267, float3(0.0), isnan(_9267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9267, float3(0.0), isnan(_9267)), level(0.0)).x;
    float _3475 = -_3461;
    float _3477 = fma(_3469, _3475, 1.0);
    float3 _9283 = float3(_3465, _3467, _3463);
    float4 _3480 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9283, float3(0.0), isnan(_9283)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9283, float3(0.0), isnan(_9283)), level(0.0)).xyzw;
    float _3482 = _3480.x;
    float _3484 = _3480.y;
    float _3486 = _3480.z;
    float _3488 = _3480.w;
    float2 _9299 = float2(_3477, _3471);
    float3 _3492 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9299, float2(0.0), isnan(_9299)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9299, float2(0.0), isnan(_9299)), level(0.0)).xyz;
    float _3494 = _3492.x;
    float _3496 = _3492.y;
    float _3498 = _3492.z;
    float _3500 = in.m_87.x;
    float _3502 = in.m_87.y;
    float _3504 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3506 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3508 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3510 = _2845 != 0.0;
    bool _3512 = isnan(_2845);
    bool _3514 = _3510 || _3512;
    bool _3516 = isnan(0.0);
    bool _3518 = _3514 || _3516;
    float _3520 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3504);
    float _3522 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3506);
    float _3524 = _2827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3526 = _2847 == 0.0;
    bool _3528 = !_3518;
    bool _3530 = _3526 && _3528;
    float _3532 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3520);
    float _3534 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3522);
    float _3536 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3538 = _2849 == 0.0;
    bool _3540 = _3538 && _3530;
    float _3542 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _3089;
    out.m_89.y = _3087;
    out.m_89.z = _3091;
    float _3544 = exp2(_3536);
    float _3546 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3542);
    float _3548 = fma(_3371, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3546);
    float _3550 = _2625 * _3502;
    float _3552 = _2645 * _3502;
    float _3554 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3508);
    float _3556 = -_2759;
    float _3558 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3524);
    float _3560 = -_3550;
    float _3562 = fma(_2645, _3500, _3560);
    float _3564 = fma(_2625, _3500, _3552);
    float _3566 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3554);
    float _3568 = _2827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3570 = _2827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3572 = in.m_91.z;
    float _3574 = _2837 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3576 = -_2759;
    float _3578 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3568);
    float _3580 = -_2759;
    float _3582 = fma(_3580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3570);
    float _3584 = in.m_91.x;
    float _3586 = in.m_91.y;
    float _3588 = _2837 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3590 = _2837 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3592 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3558);
    float _3594 = in.m_87.z;
    float _3596 = in.m_87.w;
    float _3598 = fma(_2833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3588);
    float _3600 = fma(_2833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3590);
    float _3602 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3582);
    float _3604 = _3564 * _3592;
    float _3606 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3598);
    float _3608 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3600);
    float _3610 = fma(_2833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3574);
    float _3612 = fma(_3562, _3566, _3604);
    float _3614 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3578);
    float _3616 = _3564 * _3602;
    float _3618 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3610);
    float _3620 = -_3544;
    float _3622 = _3620 + 1.0;
    float _3624 = _3564 * _3614;
    float _3626 = fma(_3562, _3534, _3616);
    float _3628 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3548);
    float _3630 = _3572;
    if (_3540)
    {
        _2461 = _3572;
    }
    float _3632 = _2461;
    float _3634 = fma(_3562, _3532, _3624);
    float _3636 = _2645 * _3586;
    float _3638 = _2625 * _3586;
    out.gl_Position.x = _3445;
    out.gl_Position.y = _3447;
    out.gl_Position.z = _3628;
    out.gl_Position.w = _3417;
    float _3640 = fma(_2625, _3584, _3636);
    float _3642 = -_3638;
    float _3644 = fma(_2645, _3584, _3642);
    float _3646 = _3632;
    float _3648 = _3584;
    if (_3540)
    {
        _2651 = _3632;
    }
    float _3650 = _2651;
    float _3652 = fma(_3618, _3594, _3626);
    float _3654 = _3640 * _3562;
    float _3656 = _3650;
    if (!_3540)
    {
        _3646 = _3572;
    }
    float _3658 = _3646;
    float _3660 = _3644 * _3594;
    float _3662 = fma(_3606, _3594, _3634);
    float _3664 = -_3654;
    float _3666 = fma(_3644, _3564, _3664);
    float _3668 = fma(_3608, _3594, _3612);
    float _3670 = _3564 * _3658;
    float _3672 = -_3660;
    float _3674 = fma(_3562, _3658, _3672);
    if (_3540)
    {
        _3630 = _3640;
    }
    float _3676 = _3630;
    float _3678 = _3676;
    if (!_3540)
    {
        float _3680 = fma(_2845, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3640);
        _3678 = _3680;
    }
    float _3682 = _3678;
    float _3684 = -_3670;
    float _3686 = fma(_3640, _3594, _3684);
    float _3688 = _3674 * _3596;
    out.m_93.x = _3662;
    out.m_93.y = _3652;
    out.m_93.z = _3668;
    if (_3540)
    {
        _3648 = _3644;
    }
    float _3690 = _3648;
    float _3692 = _3690;
    if (!_3540)
    {
        float _3694 = fma(_2847, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3644);
        _3692 = _3694;
    }
    float _3696 = _3692;
    float _3698 = _3686 * _3596;
    float _3700 = _3417 * 0.5;
    float _3702 = _3688 * _3614;
    if (!_3540)
    {
        float _3704 = fma(_2849, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3658);
        _3656 = _3704;
    }
    float _3706 = _3656;
    float _3708 = _3666 * _3596;
    float _3710 = _3628 + _3417;
    float _3712 = fma(_3698, _3532, _3702);
    float _3714 = _3445 + _3417;
    float _3716 = _3602 * _3682;
    float _3718 = _3614 * _3682;
    float _3720 = _3688 * _3602;
    float _3722 = _3592 * _3682;
    float _3724 = fma(_3534, _3696, _3716);
    float _3726 = fma(_3532, _3696, _3718);
    float _3728 = fma(_3698, _3534, _3720);
    float _3730 = fma(_3447, -0.5, _3700);
    float _3732 = fma(_3566, _3696, _3722);
    float _3734 = _3622 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3736 = fma(_3606, _3706, _3726);
    float _3738 = fma(_3618, _3706, _3724);
    float _3740 = fma(_3608, _3706, _3732);
    float _3742 = _3688 * _3592;
    float _3744 = fma(_3708, _3618, _3728);
    float _3746 = fma(_3708, _3606, _3712);
    float _3748 = _3710 * 0.5;
    float _3750 = fma(_3698, _3566, _3742);
    float _3752 = _3714 * 0.5;
    out.m_95.x = _3736;
    out.m_95.y = _3738;
    out.m_95.z = _3740;
    bool _3754 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3756 = isnan(_3181);
    bool _3758 = _3754 || _3756;
    bool _3760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3762 = _3758 || _3760;
    float _3764 = fma(_3708, _3608, _3750);
    float _3766 = _3159 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _3752;
    out.m_97.y = _3730;
    out.m_97.z = _3748;
    out.m_97.w = _3417;
    out.m_99.x = _3746;
    out.m_99.y = _3744;
    out.m_99.z = _3764;
    float _3768 = _3712;
    float _3770 = _3744;
    float _3772 = _3746;
    if (!_3762)
    {
        _3768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3774 = _3768;
    float _3776 = _3774;
    float _3778 = _3774;
    if (!_3762)
    {
        _3770 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3780 = _3770;
    float _3782 = _3780;
    float _3784 = _3780;
    if (!_3762)
    {
        _3772 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3786 = _3772;
    float _3788 = _3734 * _3473;
    float _3790 = -_3734;
    float _3792 = _3790 + 1.0;
    float _3794 = _3488 * _3788;
    float _3796 = _3488 * _3792;
    float _3798 = _3498 * _3788;
    float _3800 = fma(_3494, _3794, _3482);
    float _3802 = fma(_3496, _3794, _3484);
    float _3804 = fma(_3488, _3798, _3486);
    out.m_101.x = _3800;
    out.m_101.y = _3802;
    out.m_101.z = _3804;
    out.m_101.w = _3796;
    bool _3806 = !_3762;
    float _3808 = _3786;
    float _3810 = _3786;
    if (!_3806)
    {
        bool _3812 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3814 = isnan(_3181);
        bool _3816 = _3812 || _3814;
        bool _3818 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3820 = _3816 || _3818;
        if (!_3820)
        {
            float _3822 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3824 = _3181 + _3822;
            float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3828 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3826;
            float _3830 = 1.0 / _3828;
            float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3834 = _3832 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3840 = _3824 * _3830;
            float _3842 = precise::clamp(_3840, 0.0, 1.0);
            float _3844 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3846 = _3844 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3848 = fma(_3842, _3838, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3850 = fma(_3842, _3846, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3852 = fma(_3842, _3834, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3810 = _3852;
            _3784 = _3850;
            _3778 = _3848;
            _3854 = true;
        }
        else
        {
            bool _3856 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3858 = isnan(_3181);
            bool _3860 = _3856 || _3858;
            bool _3862 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3864 = _3860 || _3862;
            if (!_3864)
            {
                _3782 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3866 = _3782;
            _3784 = _3866;
            if (!_3864)
            {
                _3808 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3868 = _3808;
            _3810 = _3868;
            if (!_3864)
            {
                _3776 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3870 = _3776;
            bool _3872 = !_3864;
            _3778 = _3870;
            if (!_3872)
            {
                bool _3874 = _3181 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3876 = isnan(_3181);
                bool _3878 = _3874 || _3876;
                bool _3880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3882 = _3878 || _3880;
                if (!_3882)
                {
                    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3886 = _3181 + _3884;
                    float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3890 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3888;
                    float _3892 = 1.0 / _3890;
                    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3902 = _3886 * _3892;
                    float _3904 = precise::clamp(_3902, 0.0, 1.0);
                    float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3908 = _3906 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3910 = fma(_3904, _3900, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3912 = fma(_3904, _3908, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3914 = fma(_3904, _3896, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3810 = _3914;
                    _3784 = _3912;
                    _3778 = _3910;
                    _3854 = true;
                }
                else
                {
                    _3810 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3784 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3778 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3854 = false;
    float _3916 = _3810;
    float _3918 = _3784;
    float _3920 = _3778;
    float _3922 = _3766 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_103.x = 0.0;
    float _3924 = _3916 * 0.586610972881317138671875;
    bool _3926 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _3922;
    float _3928 = fma(_3918, 0.298911988735198974609375, _3924);
    bool _3930 = _3159 > 0.0;
    bool _3932 = isnan(_3159);
    bool _3934 = _3930 || _3932;
    bool _3936 = isnan(0.0);
    bool _3938 = _3934 || _3936;
    float _3940 = fma(_3920, 0.114477999508380889892578125, _3928);
    float _3942 = -_3940;
    float _3944 = _3942 + _3918;
    float _3946 = -_3940;
    float _3948 = _3946 + _3916;
    float _3950 = -_3940;
    float _3952 = _3950 + _3920;
    float _3954 = fma(_3944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3940);
    float _3956 = fma(_3948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3940);
    float _3958 = fma(_3952, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3940);
    bool _3960 = !_3926;
    if (!_3960)
    {
        float _3962 = -_3087;
        float _3964 = _3962 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3966 = -_3089;
        float _3968 = _3966 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3970 = -_3091;
        float _3972 = _3970 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3974 = _3964 * _3964;
        float _3976 = fma(_3968, _3968, _3974);
        float _3978 = fma(_3972, _3972, _3976);
        float _3980 = sqrt(_3978);
        float _3982 = rsqrt(_3978);
        float _3984 = -_3980;
        float _3986 = _3984 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3988 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3990 = precise::clamp(_3988, 0.0, 1.0);
        float _3992 = _3968 * _3982;
        float _3994 = _3964 * _3982;
        float _3996 = abs(_3990);
        float _3998 = log2(_3996);
        float _4000 = _3972 * _3982;
        float _4002 = _3992 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4004 = _3738 * _3994;
        float _4006 = -_3994;
        float _4008 = -_4002;
        float _4010 = fma(_4006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4008);
        float _4012 = fma(_3736, _3992, _4004);
        float _4014 = -_4000;
        float _4016 = fma(_4014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4010);
        float _4018 = fma(_3740, _4000, _4012);
        float _4020 = precise::clamp(_4018, 0.0, 1.0);
        float _4022 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4024 = _4016 + _4022;
        float _4026 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4028 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4030 = precise::clamp(_4028, 0.0, 1.0);
        float _4032 = exp2(_4026);
        float _4034 = _4032 * _4030;
        float _4036 = _4020 * _4034;
        float _4038 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4040 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4042 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _4038;
        out.m_103.y = _4040;
        out.m_103.z = _4042;
    }
    out.m_105.x = _3954;
    out.m_105.y = _3956;
    out.m_105.z = _3958;
    if (_3938)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4044;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

