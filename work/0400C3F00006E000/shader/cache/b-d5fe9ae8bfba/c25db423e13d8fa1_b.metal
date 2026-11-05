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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_107 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_105 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 m_71 [[user(locn15)]];
    float4 m_75 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_99 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_77 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_73 [[attribute(12)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2363 = false;
    bool _1548 = false;
    bool _682 = false;
    bool _536 = false;
    bool _246 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_51.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_142);
        out.gl_Position.z = _2662;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_53.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
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
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2731 = as_type<float>(_178);
        out.gl_Position.z = _2731;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = _182 * _190;
    float _208 = _182 * _196;
    float _210 = fma(_180, _188, _206);
    float _212 = _182 * _202;
    float _214 = fma(_180, _194, _208);
    float _216 = fma(_180, _200, _212);
    float _218 = fma(_184, _192, _210);
    float _220 = fma(_184, _198, _214);
    float _222 = fma(_184, _204, _216);
    bool _224 = !_186;
    float _226 = _220;
    float _244;
    if (!_224)
    {
        float _228 = in.m_63.x;
        float _230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _232 = _228 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _236 = _234 * _230;
        float _238 = floor(_236);
        float _240 = -_238;
        float _242 = _236 + _240;
        _244 = _242;
        _246 = true;
    }
    else
    {
        float _248 = float(_126);
        float _250 = 1.0 / _248;
        float _252 = _160 * _250;
        _244 = _252;
    }
    _246 = false;
    float _254 = _244;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = _254 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _254 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = _254 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = 1.0 / _270;
    bool _286 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_254);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    bool _298 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_254);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = 1.0 / _274;
    float _312 = -_308;
    float _314 = _312 + 1.0;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _282;
    float _320 = _258 * _284;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _254 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = fma(_328, _320, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _332 = 1.0 / _278;
    float _334 = _262 * _310;
    bool _336 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _338 = isnan(_254);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_346;
    float _350 = _348 + 1.0;
    float _352 = _324 * _318;
    bool _354 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _356 = isnan(_254);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = _364 * _350;
    float _368 = _266 * _332;
    float _370 = -_364;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = _296 * _372;
    float _384 = -_296;
    float _386 = _384 + 1.0;
    float _388 = fma(_376, _320, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_380, _320, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _392 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_254);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = _308 * _386;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = _402 * _314;
    float _420 = fma(_408, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_412, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _390 * _418;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _432;
    float _436 = _388 * _418;
    float _438 = _330 * _418;
    float _440 = -_402;
    float _442 = _440 + 1.0;
    float _444 = in.m_65.x;
    float _446 = in.m_65.y;
    float _448 = in.m_65.z;
    float _450 = fma(_430, _368, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_434, _368, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _454 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _456 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _464 = fma(_422, _404, _454);
    float _466 = fma(_420, _404, _456);
    float _468 = fma(_460, _368, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _482 = fma(_424, _404, _462);
    float _484 = fma(_472, _352, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _486 = fma(_476, _352, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _488 = fma(_480, _352, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _490 = fma(_450, _382, _464);
    float _492 = fma(_452, _382, _466);
    float _494 = fma(_468, _382, _482);
    float _496 = fma(_484, _366, _490);
    float _498 = fma(_486, _366, _492);
    float _500 = fma(_488, _366, _494);
    float _502 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[147].x, _496);
    float _504 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[147].y, _498);
    float _506 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[147].z, _500);
    float _508 = _502 * _444;
    float _510 = _504 * _446;
    float _512 = _506 * _448;
    bool _514 = !_316;
    float _516 = _512;
    float _534;
    if (!_514)
    {
        float _518 = in.m_63.x;
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _522 = _518 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_126);
        float _540 = 1.0 / _538;
        float _542 = _160 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _544 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _572 = isnan(_544);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    bool _586 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _588 = isnan(_544);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _552;
    float _600 = -_564;
    float _602 = _600 + 1.0;
    bool _604 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _606 = _580 * _602;
    float _608 = -_580;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _568;
    float _614 = _584 * _598;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = fma(_614, _548, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _622 = _618 * _612;
    float _624 = _620 * _606;
    float _626 = -_596;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = _544 + _630;
    float _634 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _636 = _564 * _628;
    float _638 = fma(_622, _632, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _642 = fma(_638, _636, _634);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[117].x, _642);
    float _650 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _648 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _650;
    out.m_67.y = _652;
    out.m_67.z = _654;
    out.m_67.w = _656;
    bool _658 = !_604;
    float _660 = _656;
    float _662 = _654;
    float _680;
    if (!_658)
    {
        float _664 = in.m_63.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_126);
        float _686 = 1.0 / _684;
        float _688 = _160 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = in.m_63.w;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _696 = in.m_69.y;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _700 = _698 != 0;
    float _702 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _704 = in.m_63.x;
    float _706 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _708 = in.m_48.x;
    float _710 = in.m_48.y;
    float _712 = in.m_48.z;
    float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _718 = _716 != 0;
    float _720 = in.m_63.z;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _724 = _722 != 0;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _730 = _728 != 0;
    float _732 = in.m_63.y;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _736 = _734 != 0;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    bool _738 = _692 > 0.5;
    float _740 = -_696;
    float _742 = _740 + 1.0;
    float _744 = in.m_57.w;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _748 = _714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _750 = in.m_61.w;
    float _752 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[78].z, _746);
    int _754 = _738 ? as_type<int>(_742) : as_type<int>(_696);
    float _756 = _196 * _710;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _760 = _704 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _762 = _202 * _710;
    float _764 = fma(_194, _708, _756);
    float _766 = _718 ? as_type<float>(_754) : _696;
    float _768 = -_758;
    float _770 = fma(_760, 2.0, _768);
    float _772 = fma(_200, _708, _762);
    float _774 = in.m_73.x;
    float _776 = in.m_73.y;
    float _778 = in.m_73.z;
    float _780 = in.m_73.w;
    float _782 = _190 * _710;
    bool _784 = _720 > 0.5;
    float _786 = in.m_59.w;
    float _788 = _720;
    float _790 = _696;
    float _792 = _694;
    float _794 = _702;
    if (!_700)
    {
        _660 = _732;
    }
    float _796 = _660;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _800 = _796;
    if (!_700)
    {
        _662 = _720;
    }
    float _802 = _662;
    float _804 = in.m_69.x;
    float _806 = _802;
    if (_700)
    {
        _800 = _704;
    }
    float _808 = _800;
    float _810 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _798);
    if (_700)
    {
        _806 = _732;
    }
    float _812 = _806;
    float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _816 = as_type<int>(_812);
    if (_700)
    {
        _788 = _732;
    }
    float _818 = _788;
    float _820 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _824 = _822 != 0;
    float _826 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _752);
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _830 = _828 != 0;
    float _832 = fma(_188, _708, _782);
    bool _834 = _732 > 0.5;
    float _836 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _838 = fma(_204, _712, _772);
    float _840 = fma(_192, _712, _832);
    float _842 = fma(_198, _712, _764);
    int _844 = _834 ? as_type<int>(_742) : as_type<int>(_696);
    float _846 = _776 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _848 = fma(_836, -2.0, _726);
    float _850 = _840 + _744;
    float _852 = _842 + _786;
    float _854 = _824 ? as_type<float>(_844) : _696;
    float _856 = _776 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _858 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _846);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _862 = _852 + _860;
    float _864 = _838 + _750;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _870 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _856);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _850 + _876;
    float _880 = _862 * _862;
    bool _882 = _824;
    float _884 = _850;
    if (_724)
    {
        bool _886 = _704 > 0.5;
        _882 = _886;
    }
    bool _888 = _882;
    float _890 = _776 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _892 = 1.0 / _868;
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _896 = _864 + _894;
    float _898 = fma(_878, _878, _880);
    float _900 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _890);
    float _902 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _900);
    float _904 = 1.0 / _874;
    float _906 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _870);
    float _908 = fma(_896, _896, _898);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _918 = _898;
    if (!_724)
    {
        _918 = _804;
    }
    float _920 = _918;
    float _922 = _920;
    if (_830)
    {
        float _924 = _784 ? _742 : _696;
        _790 = _924;
    }
    float _926 = _790;
    float _928 = sqrt(_908);
    float _930 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _858);
    float _932 = _916 * _892;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _936 = _690 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _940 = _690 + _938;
    bool _942 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _944 = isnan(_690);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    out.m_75.x = _930;
    out.m_75.y = _906;
    out.m_75.z = _902;
    float _954 = _912 * _904;
    float _956 = fma(_932, _940, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _958 = -_952;
    float _960 = _958 + 1.0;
    float _962 = fma(_954, _936, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _964 = _694 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_724)
    {
        _792 = _920;
    }
    float _966 = _792;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _970 = _966;
    if (_724)
    {
        _922 = _804;
    }
    float _972 = _922;
    float _974 = _928 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _976 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _810);
    float _978 = _814 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _980 = rsqrt(_908);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _984 = _702 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _986 = fma(_964, _854, -0.5);
    float _988 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _848);
    bool _990 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _992 = isnan(_690);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[83].w, _982);
    float _1004 = precise::min(_984, _974);
    float _1006 = -_988;
    float _1008 = fma(_976, _986, _1006);
    bool _1010 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1012 = isnan(_690);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -_1000;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_766, _978, -0.5);
    float _1028 = in.m_77.x;
    float _1030 = in.m_77.y;
    float _1032 = in.m_77.z;
    float _1034 = _1020 * _1024;
    float _1036 = -_1020;
    float _1038 = _1036 + 1.0;
    float _1040 = _980 * _1004;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1044 = _952 * _1038;
    float _1046 = _862 * _1040;
    float _1048 = _878 * _1040;
    float _1050 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1042);
    float _1052 = _962 * _1044;
    float _1054 = -_1046;
    float _1056 = _862 + _1054;
    float _1058 = -_1048;
    float _1060 = _878 + _1058;
    float _1062 = _896 * _1040;
    float _1064 = -_968;
    float _1066 = fma(_820, 2.0, _1064);
    float _1068 = _1056 * _1056;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1072 = -_1062;
    float _1074 = _896 + _1072;
    float _1076 = _812 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1078 = fma(_1060, _1060, _1068);
    float _1080 = _1070;
    float _1082 = _1062;
    if (_724)
    {
        float _1084 = -_972;
        float _1086 = _1084 + 1.0;
        _816 = as_type<int>(_1086);
    }
    int _1088 = _816;
    float _1090 = in.m_79.x;
    float _1092 = in.m_79.y;
    float _1094 = in.m_79.z;
    int _1096 = 0;
    float _1098 = as_type<float>(_1088);
    if (_730)
    {
        float _1100 = -_972;
        float _1102 = _1100 + 1.0;
        _1096 = as_type<int>(_1102);
    }
    int _1104 = _1096;
    float _1106 = fma(_1074, _1074, _1078);
    bool _1108 = _1030 != 0.0;
    bool _1110 = isnan(_1030);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(0.0);
    bool _1116 = _1112 || _1114;
    int _1118 = 0;
    if (_736)
    {
        float _1120 = -_972;
        float _1122 = _1120 + 1.0;
        _1118 = as_type<int>(_1122);
    }
    int _1124 = _1118;
    float _1126 = fma(_1076, -2.0, _1070);
    float _1128 = sqrt(_1106);
    bool _1130 = _1028 == 0.0;
    bool _1132 = !_1116;
    bool _1134 = _1130 && _1132;
    float _1136 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1052);
    if (_724)
    {
        float _1138 = _888 ? as_type<float>(_1088) : _972;
        _970 = _1138;
    }
    float _1140 = _970;
    float _1142 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1002);
    if (!_730)
    {
        _1098 = _972;
    }
    float _1144 = _1098;
    float _1146 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1050);
    float _1148 = _1144;
    if (!_736)
    {
        _1080 = _972;
    }
    float _1150 = _1080;
    float _1152 = -_160;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1066);
    bool _1156 = _1032 == 0.0;
    bool _1158 = _1156 && _1134;
    float _1160 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1126);
    float _1162 = _1150;
    if (_730)
    {
        float _1164 = _784 ? as_type<float>(_1104) : _972;
        _1148 = _1164;
    }
    float _1166 = _1148;
    float _1168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_736)
    {
        float _1170 = _834 ? as_type<float>(_1124) : _972;
        _1162 = _1170;
    }
    float _1172 = _1162;
    float _1174 = -_160;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[76].x, _770);
    float _1178 = _980 * _1128;
    float _1180 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1182 = -_1160;
    float _1184 = fma(_1142, _1026, _1182);
    float _1186 = fma(_748, _1140, -0.5);
    float _1188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1030);
    float _1190 = _706 * _1178;
    float _1192 = _702 * _1178;
    float _1194 = _1180 * _1178;
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1028);
    float _1198 = _1190 * _1188;
    float _1200 = _1188;
    if (_1158)
    {
        _1200 = _1092;
    }
    float _1202 = _1200;
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1032);
    float _1206 = _1192 * _1196;
    float _1208 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1210 = _1202;
    float _1212 = _1208;
    if (_1158)
    {
        _794 = _1202;
    }
    float _1214 = _794;
    float _1216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1218 = _1214;
    if (!_1158)
    {
        _1210 = _1092;
    }
    float _1220 = _1210;
    float _1222 = _1194 * _1204;
    float _1224 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1226 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1208);
    float _1228 = _1226;
    if (_1158)
    {
        _1212 = _1094;
    }
    float _1230 = _1212;
    float _1232 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1234 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1224);
    float _1236 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1226);
    float _1238 = _1230;
    if (_1158)
    {
        _1228 = _1230;
    }
    float _1240 = _1228;
    float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1244 = _1240;
    if (!_1158)
    {
        _1238 = _1094;
    }
    float _1246 = _1238;
    float _1248 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1234);
    float _1250 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1252 = fma(_956, _1034, _1136);
    float _1254 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1256 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1258 = _864 + _1250;
    if (!_1158)
    {
        float _1260 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1246);
        _1244 = _1260;
    }
    float _1262 = _1244;
    float _1264 = fma(_1254, _1166, -0.5);
    float _1266 = _850 + _1256;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1270 = _1258 + _1268;
    float _1272 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1232);
    float _1274 = _1266;
    if (!_1158)
    {
        float _1276 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1220);
        _1218 = _1276;
    }
    float _1278 = _1218;
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1282 = _1266 + _1280;
    float _1284 = _1270 * _1270;
    float _1286 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1158)
    {
        _516 = _1090;
    }
    float _1288 = _516;
    float _1290 = _926 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1292 = fma(_1282, _1282, _1284);
    float _1294 = _1288;
    if (!_1158)
    {
        float _1296 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1090);
        _1294 = _1296;
    }
    float _1298 = _1294;
    float _1300 = _776 * _1246;
    float _1302 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1272);
    float _1304 = sqrt(_1292);
    float _1306 = _1286 * _1216;
    float _1308 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1310 = _778 * _1090;
    float _1312 = -_1300;
    float _1314 = fma(_778, _1220, _1312);
    float _1316 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1252);
    float _1318 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1308);
    float _1320 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1322 = _774 * _1220;
    float _1324 = _1290 * _1242;
    float _1326 = -_1310;
    float _1328 = fma(_774, _1246, _1326);
    float _1330 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1332 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1334 = _852 + _1320;
    float _1336 = -_1322;
    float _1338 = fma(_776, _1090, _1336);
    bool _1340 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1330);
    float _1344 = fma(_826, _1186, _1176);
    float _1346 = fma(_1146, _1264, _1154);
    out.m_81.x = _1306;
    out.m_81.y = _1324;
    float _1348 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1332);
    float _1350 = _1332;
    float _1352 = _1324;
    if (!_1340)
    {
        _1350 = _1258;
    }
    float _1354 = _1350;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1358 = _1354;
    if (!_1340)
    {
        _1352 = _1334;
    }
    float _1360 = _1352;
    bool _1362 = !_1340;
    float _1364 = _1360;
    if (!_1362)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1370 = _1304 + _1368;
        float _1372 = _1334 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = rsqrt(_1292);
        float _1376 = _1370 * _1366;
        float _1378 = _1376 * 0.15915493667125701904296875;
        float _1380 = _1378 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = _1378 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = _1382 + (-1.0);
        float _1390 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = fma(_1386, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1394 = fma(_1334, _1382, _1390);
        float _1396 = _1374 * _1392;
        float _1398 = fma(_1282, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1400 = fma(_1270, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1364 = _1394;
        _1274 = _1398;
        _1358 = _1400;
    }
    float _1402 = _1364;
    float _1404 = _1274;
    float _1406 = _1358;
    float _1408 = -_1046;
    float _1410 = _1408 + _1402;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1416 = -_1048;
    float _1418 = _1416 + _1404;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1422 = _1410 + _1420;
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1430 = _1418 + _1428;
    float _1432 = _1422 * _1422;
    float _1434 = _1328 * _780;
    float _1436 = _1314 * _780;
    float _1438 = _1338 * _780;
    float _1440 = -_1062;
    float _1442 = _1440 + _1406;
    float _1444 = fma(_1430, _1430, _1432);
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1448 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1450 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1454 = _1442 + _1452;
    float _1456 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1458 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1446);
    float _1462 = fma(_1454, _1454, _1444);
    float _1464 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1448);
    float _1466 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1450);
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1460);
    out.m_83.x = _1456;
    out.m_83.y = _1424;
    out.m_83.z = _1426;
    out.m_83.w = _1458;
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1464);
    float _1472 = sqrt(_1462);
    float _1474 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1476 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1318);
    float _1478 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1342);
    float _1480 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1348);
    out.m_85.w = _1004;
    float _1482 = -_1048;
    float _1484 = _850 + _1482;
    float _1486 = -_1046;
    float _1488 = _852 + _1486;
    out.m_87.x = _1468;
    out.m_87.y = _1470;
    out.m_87.z = _1474;
    float _1490 = -_1062;
    float _1492 = _864 + _1490;
    float _1494 = _1008 + 0.5;
    float _1496 = _1184 + 0.5;
    float _1498 = _1346 + 0.5;
    float _1500 = _1344 + 0.5;
    out.m_89.x = _1192;
    bool _1502 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1504 = isnan(_1472);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1510 = _1506 || _1508;
    out.m_91.x = _1500;
    out.m_91.y = _1494;
    out.m_91.z = _1498;
    out.m_91.w = _1496;
    out.m_93.x = _1476;
    out.m_93.y = _1478;
    out.m_93.z = _1480;
    float _1512 = _1498;
    if (!_1510)
    {
        _884 = 1.0;
    }
    float _1514 = _884;
    bool _1516 = !_1510;
    float _1518 = _1514;
    if (!_1516)
    {
        bool _1520 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1522 = isnan(_1472);
        bool _1524 = _1520 || _1522;
        bool _1526 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1528 = _1524 || _1526;
        if (!_1528)
        {
            float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1532 = _1472 + _1530;
            float _1534 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1536 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1534;
            float _1538 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1540 = _1538 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1542 = 1.0 / _1536;
            float _1544 = _1532 * _1542;
            float _1546 = fma(_1544, _1540, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1518 = _1546;
            _1548 = true;
        }
        else
        {
            bool _1550 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1552 = isnan(_1472);
            bool _1554 = _1550 || _1552;
            bool _1556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1558 = _1554 || _1556;
            if (!_1558)
            {
                float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1562 = _1472 + _1560;
                float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1570 = _1568 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1572 = 1.0 / _1566;
                float _1574 = _1562 * _1572;
                float _1576 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1518 = _1576;
                _1548 = true;
            }
            else
            {
                _1518 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1548 = false;
    float _1578 = _1518;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1582 = _1410 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1586 = _1418 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1590 = _1442 + _1588;
    float _1592 = fma(_1582, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1594 = fma(_1586, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1596 = fma(_1590, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1598 = -_1488;
    float _1600 = _1598 + _1592;
    float _1602 = -_1484;
    float _1604 = _1602 + _1594;
    float _1606 = -_1492;
    float _1608 = _1606 + _1596;
    float _1610 = _1600 * _1600;
    float _1612 = fma(_1604, _1604, _1610);
    float _1614 = fma(_1608, _1608, _1612);
    float _1616 = sqrt(_1614);
    bool _1618 = _1616 > 0.0;
    float _1620 = _1616;
    float _1622 = _1586;
    float _1624 = _1596;
    if (!_1618)
    {
        _1620 = _1594;
    }
    float _1626 = _1620;
    float _1628 = _1626;
    if (!_1618)
    {
        _1622 = _1592;
    }
    float _1630 = _1622;
    float _1632 = _1630;
    float _1634 = _1630;
    if (!_1618)
    {
        _1512 = _1596;
    }
    float _1636 = _1512;
    bool _1638 = !_1618;
    float _1640 = _1636;
    float _1642 = _1636;
    if (!_1638)
    {
        float _1644 = _220 * _220;
        float _1646 = rsqrt(_1614);
        float _1648 = fma(_218, _218, _1644);
        float _1650 = fma(_222, _222, _1648);
        float _1652 = sqrt(_1650);
        float _1654 = _1604 * _1646;
        float _1656 = _1600 * _1646;
        float _1658 = _1608 * _1646;
        bool _1660 = _1652 > 0.0;
        float _1662 = _1652;
        if (!_1660)
        {
            _1662 = _1594;
        }
        float _1664 = _1662;
        _1628 = _1664;
        if (!_1660)
        {
            _1632 = _1592;
        }
        float _1666 = _1632;
        _1634 = _1666;
        if (!_1660)
        {
            _1640 = _1596;
        }
        float _1668 = _1640;
        bool _1670 = !_1660;
        _1642 = _1668;
        if (!_1670)
        {
            float _1672 = rsqrt(_1650);
            float _1674 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1676 = _220 * _1672;
            float _1678 = _218 * _1672;
            float _1680 = _222 * _1672;
            float _1682 = _1656 * _1676;
            float _1684 = fma(_1654, _1678, _1682);
            float _1686 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1688 = fma(_1658, _1680, _1684);
            float _1690 = _1688 * _1686;
            float _1692 = fma(_218, _1690, _1594);
            float _1694 = fma(_220, _1690, _1592);
            float _1696 = fma(_222, _1690, _1596);
            _1634 = _1694;
            _1628 = _1692;
            _1642 = _1696;
        }
    }
    float _1698 = _1634;
    float _1700 = _1628;
    float _1702 = _1642;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1706 = _1698 + _1704;
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1710 = _1700 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1714 = _1702 + _1712;
    float _1716 = _1706 * _1706;
    float _1718 = fma(_1710, _1710, _1716);
    float _1720 = fma(_1714, _1714, _1718);
    float _1722 = rsqrt(_1720);
    float _1724 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1726 = _1710 * _1724;
    float _1728 = _1714 * _1724;
    float _1730 = _1726 * _1726;
    float _1732 = _1728 * _1728;
    float _1734 = _1730 + _1732;
    float _1736 = sqrt(_1734);
    bool _1738 = _1736 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1742 = _1736 + _1740;
    float _1744 = _1714;
    float _1746 = _1742;
    float _1748 = _1706;
    if (_1738)
    {
        float _1750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1750;
    }
    float _1752 = _1744;
    if (_1738)
    {
        float _1754 = rsqrt(_1734);
        _226 = _1754;
    }
    float _1756 = _226;
    float _1758 = _1756;
    if (_1738)
    {
        float _1760 = _1742 * _1752;
        _1746 = _1760;
    }
    float _1762 = _1746;
    if (_1738)
    {
        float _1764 = _1762 * 0.15915493667125701904296875;
        _1624 = _1764;
    }
    float _1766 = _1624;
    float _1768 = _1716;
    if (_1738)
    {
        float _1770 = _1766 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        _1768 = _1772;
    }
    float _1774 = _1768;
    float _1776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1778 = precise::max(0.0, _1776);
    float _1780 = _1722;
    float _1782 = _1776;
    float _1784 = _1778;
    if (_1738)
    {
        float _1786 = _1766 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        _1780 = _1788;
    }
    float _1790 = _1780;
    float _1792 = -_1724;
    float _1794 = -_1778;
    float _1796 = fma(_1706, _1792, _1794);
    float _1798 = _1796;
    if (_1738)
    {
        float _1800 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1800;
    }
    float _1802 = _1782;
    float _1804 = _1802;
    float _1806 = _1774;
    if (_1738)
    {
        float _1808 = fma(_1774, _1802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1804 = _1808;
    }
    float _1810 = _1804;
    if (!_1738)
    {
        _1806 = _1730;
    }
    float _1812 = _1806;
    float _1814 = _1790;
    float _1816 = _1812;
    if (_1738)
    {
        float _1818 = _1790 + (-1.0);
        _1748 = _1818;
    }
    float _1820 = _1748;
    if (_1738)
    {
        float _1822 = _1756 * _1810;
        _1082 = _1822;
    }
    float _1824 = _1082;
    if (!_1738)
    {
        _1758 = _1726;
    }
    float _1826 = _1758;
    float _1828 = sqrt(_1720);
    float _1830 = _1826;
    if (_1738)
    {
        float _1832 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1832;
    }
    float _1834 = _1784;
    if (_1738)
    {
        float _1836 = _1726 * _1824;
        _1830 = _1836;
    }
    float _1838 = _1830;
    float _1840 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1738)
    {
        float _1842 = fma(_1796, _1790, _1834);
        _1798 = _1842;
    }
    float _1844 = _1798;
    if (!_1738)
    {
        _1814 = _1728;
    }
    float _1846 = _1814;
    float _1848 = _1846;
    if (_1738)
    {
        float _1850 = _1728 * _1824;
        _1848 = _1850;
    }
    float _1852 = _1848;
    if (_1738)
    {
        float _1854 = _1838 * _1838;
        _1816 = _1854;
    }
    float _1856 = _1816;
    float _1858 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1738)
    {
        _1840 = _1732;
    }
    float _1860 = _1840;
    float _1862 = _1860;
    if (_1738)
    {
        float _1864 = _1852 * _1852;
        _1862 = _1864;
    }
    float _1866 = _1862;
    float _1868 = fma(_1844, _1844, _1856);
    float _1870 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1872 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1874 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1876 = _1868 + _1866;
    float _1878 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1870);
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1882 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1880);
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = rsqrt(_1876);
    float _1888 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1878);
    float _1890 = -_1884;
    float _1892 = _1890 + 1.0;
    float _1894 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1874);
    float _1896 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1900 = abs(_1892);
    float _1902 = log2(_1900);
    float _1904 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1906 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1908 = -_1904;
    float _1910 = fma(_1908, _1896, 1.0);
    float _1912 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1914 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1906);
    float _1916 = _1886 * _1838;
    float _1918 = floor(_1858);
    float _1920 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1912);
    float _1922 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1914);
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1926 = _1886 * _1844;
    float _1928 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1920);
    float _1930 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1932 = _1886 * _1852;
    float _1934 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1894);
    float _1936 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1938 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1940 = floor(_1872);
    float _1942 = -_1924;
    float _1944 = fma(_1926, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1942);
    float _1946 = _1934 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1948 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1938);
    float _1950 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1952 = -_1932;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1944);
    float _1956 = -_1918;
    float _1958 = _1858 + _1956;
    float _1960 = log2(_1910);
    float _1962 = fma(_1954, -0.5, 0.5);
    float _1964 = fma(_1954, 0.5, 0.5);
    float _1966 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1968 = fma(_1964, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1970 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1966);
    float _1972 = exp2(_1950);
    float _1974 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1948);
    float _1976 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1978 = -_1940;
    float _1980 = _1872 + _1978;
    float _1982 = fma(_1964, _1968, -0.212114393711090087890625);
    float _1984 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1974);
    float _1986 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1976);
    float _1988 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1970);
    float _1990 = sqrt(_1962);
    float _1992 = _1960 * 0.693147182464599609375;
    float _1994 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1986);
    float _1996 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1988);
    float2 _5801 = float2(_1958, _1980);
    float _1998 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5801, float2(0.0), isnan(_5801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5801, float2(0.0), isnan(_5801)), level(0.0)).x;
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2002 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1994);
    float _2004 = fma(_1964, _1982, 1.570728778839111328125);
    float _2006 = 1.0 / _1984;
    float _2008 = _1926 + 1.0;
    float _2010 = -_1926;
    float _2012 = fma(_1972, _2008, _2010);
    float _2014 = _1990 * 0.636619746685028076171875;
    float _2016 = fma(_2012, 0.5, 0.5);
    float _2018 = -_2004;
    float _2020 = fma(_2014, _2018, 1.0);
    float _2022 = _2002 * _2006;
    float _2024 = _1996 * _2006;
    float _2026 = fma(_2022, 0.5, 0.5);
    float _2028 = fma(_2024, -0.5, 0.5);
    float3 _5855 = float3(_2026, _2028, _2000);
    float _2030 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5855, float3(0.0), isnan(_5855)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5855, float3(0.0), isnan(_5855)), level(0.0)).x;
    float3 _5866 = float3(_2026, _2028, _2000);
    float4 _2033 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5866, float3(0.0), isnan(_5866)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5866, float3(0.0), isnan(_5866)), level(0.0)).xyzw;
    float _2035 = _2033.x;
    float _2037 = _2033.y;
    float _2039 = _2033.z;
    float _2041 = _2033.w;
    float2 _5882 = float2(_2020, _2016);
    float3 _2045 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5882, float2(0.0), isnan(_5882)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5882, float2(0.0), isnan(_5882)), level(0.0)).xyz;
    float _2047 = _2045.x;
    float _2049 = _2045.y;
    float _2051 = _2045.z;
    float _2053 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_95.x = _1484;
    out.m_95.y = _1488;
    out.m_95.z = _1492;
    float _2055 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2053);
    out.m_97.x = _1700;
    out.m_97.y = _1698;
    out.m_97.z = _1702;
    float _2057 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2055);
    float _2059 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2061 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2063 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2059);
    float _2065 = 1.0 / _2061;
    float _2067 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2063);
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2071 = _2069 + _2061;
    bool _2073 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2075 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2077 = _2073 || _2075;
    bool _2079 = isnan(0.5);
    bool _2081 = _2077 || _2079;
    float _2083 = _2071 * _2065;
    float _2085 = _2083 * 0.5;
    float _2087 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2089 = in.m_99.x;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2093 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2091);
    float _2095 = exp2(_2087);
    float _2097 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2099 = _1902;
    float _2101 = _1984;
    float _2103 = _1996;
    if (!_2081)
    {
        _2097 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2105 = _2097;
    if (_2081)
    {
        _2099 = 1.0;
    }
    float _2107 = _2099;
    float _2109 = 1.0 / _2093;
    float _2111 = -_2095;
    float _2113 = _2111 + 1.0;
    float _2115 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2117 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2119 = _2109 * _2117;
    float _2121 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2123 = abs(_2119);
    float _2125 = log2(_2123);
    float _2127 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2121);
    float _2129 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2127);
    float _2131 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2129);
    float _2133 = _2131 + _1984;
    out.gl_Position.x = _2002;
    out.gl_Position.y = _1996;
    out.gl_Position.z = _2131;
    out.gl_Position.w = _1984;
    float _2135 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2137 = _2133 * 0.5;
    float _2139 = exp2(_2135);
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = _2139;
    float _2147 = _2107;
    float _2149 = _2131;
    if (!_2081)
    {
        float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2153 = _2119 + _2151;
        _2145 = _2153;
    }
    float _2155 = _2145;
    float _2157 = fma(_2143, -2.0, 3.0);
    float _2159 = _2143 * _2143;
    float _2161 = _2159 * _2157;
    float _2163 = _2159;
    if (!_2081)
    {
        float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2167 = _2105 + _2165;
        _2163 = _2167;
    }
    float _2169 = _2163;
    float _2171 = -_2161;
    float _2173 = _2171 + 1.0;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2161);
    bool _2177 = _2119 <= 8000.0;
    bool _2179 = isnan(_2119);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(8000.0);
    bool _2185 = _2181 || _2183;
    float _2187 = float(_2185);
    float _2189 = _2020;
    if (!_2081)
    {
        float _2191 = 1.0 / _2169;
        _2189 = _2191;
    }
    float _2193 = _2189;
    float _2195 = _2002 + _1984;
    float _2197 = -_2115;
    float _2199 = _2197 + 1.0;
    float _2201 = _2187 * _2175;
    float _2203 = _2195 * 0.5;
    float _2205 = _1984 * 0.5;
    float _2207 = fma(_1996, -0.5, _2205);
    float _2209 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2211 = _2207;
    float _2213 = _2203;
    float _2215 = _2199;
    if (!_2081)
    {
        float _2217 = _2155 * _2193;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2147 = _2219;
    }
    float _2221 = _2147;
    bool _2223 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2225 = isnan(_1828);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2231 = _2227 || _2229;
    out.m_101.x = _2203;
    out.m_101.y = _2207;
    out.m_101.z = _2137;
    out.m_101.w = _1984;
    if (!_2231)
    {
        _2101 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2233 = _2101;
    float _2235 = _2221 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2237 = _2233;
    float _2239 = _2233;
    if (!_2231)
    {
        _2211 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2241 = _2211;
    float _2243 = _2241;
    float _2245 = _2241;
    if (!_2231)
    {
        _2213 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2247 = _2213;
    float _2249 = _2247;
    float _2251 = _2247;
    if (!_2231)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2253 = _2149;
    float _2255 = _2253;
    float _2257 = _2253;
    if (!_2231)
    {
        _2103 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2259 = _2103;
    float _2261 = -_1998;
    float _2263 = _2261 + 1.0;
    float _2265 = _2263 * _2209;
    float _2267 = precise::clamp(_2265, 0.0, 1.0);
    float _2269 = -_2267;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2273 = _2271 * _2089;
    float _2275 = _2273 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_103.x = _2275;
    float _2277 = _2115 * _2030;
    float _2279 = _2041 * _2199;
    float _2281 = _2259;
    float _2283 = _2259;
    if (!_2231)
    {
        _2215 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2285 = _2215;
    float _2287 = _2041 * _2277;
    float _2289 = _2051 * _2277;
    float _2291 = fma(_2047, _2287, _2035);
    float _2293 = fma(_2049, _2287, _2037);
    float _2295 = fma(_2041, _2289, _2039);
    out.m_105.x = _2291;
    out.m_105.y = _2293;
    out.m_105.z = _2295;
    out.m_105.w = _2279;
    bool _2297 = !_2231;
    float _2299 = _2285;
    float _2301 = _2285;
    if (!_2297)
    {
        bool _2303 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2305 = isnan(_1828);
        bool _2307 = _2303 || _2305;
        bool _2309 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2311 = _2307 || _2309;
        if (!_2311)
        {
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2315 = _1828 + _2313;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2319 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2317;
            float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2325 = 1.0 / _2319;
            float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2329 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2333 = _2331 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2343 = _2315 * _2325;
            float _2345 = precise::clamp(_2343, 0.0, 1.0);
            float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2351 = fma(_2345, _2323, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2353 = fma(_2345, _2349, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2355 = fma(_2345, _2329, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2357 = fma(_2345, _2333, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2359 = fma(_2345, _2337, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2361 = fma(_2345, _2341, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2251 = _2355;
            _2283 = _2359;
            _2245 = _2351;
            _2257 = _2357;
            _2239 = _2353;
            _2301 = _2361;
            _2363 = true;
        }
        else
        {
            bool _2365 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2367 = isnan(_1828);
            bool _2369 = _2365 || _2367;
            bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2373 = _2369 || _2371;
            if (!_2373)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2375 = _2243;
            _2245 = _2375;
            if (!_2373)
            {
                _2249 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2377 = _2249;
            _2251 = _2377;
            if (!_2373)
            {
                _2237 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2379 = _2237;
            _2239 = _2379;
            if (!_2373)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2381 = _2255;
            _2257 = _2381;
            if (!_2373)
            {
                _2281 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2383 = _2281;
            _2283 = _2383;
            if (!_2373)
            {
                _2299 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2385 = _2299;
            bool _2387 = !_2373;
            _2301 = _2385;
            if (!_2387)
            {
                bool _2389 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2391 = isnan(_1828);
                bool _2393 = _2389 || _2391;
                bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2397 = _2393 || _2395;
                if (!_2397)
                {
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2401 = _1828 + _2399;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2405 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2403;
                    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2411 = 1.0 / _2405;
                    float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2429 = _2401 * _2411;
                    float _2431 = precise::clamp(_2429, 0.0, 1.0);
                    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2437 = fma(_2431, _2409, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2439 = fma(_2431, _2435, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2441 = fma(_2431, _2415, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2443 = fma(_2431, _2419, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2445 = fma(_2431, _2423, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2447 = fma(_2431, _2427, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2251 = _2441;
                    _2283 = _2445;
                    _2245 = _2437;
                    _2257 = _2443;
                    _2239 = _2439;
                    _2301 = _2447;
                    _2363 = true;
                }
                else
                {
                    _2251 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2283 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2239 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2301 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2363 = false;
    float _2449 = _2251;
    float _2451 = _2283;
    float _2453 = _2245;
    float _2455 = _2257;
    float _2457 = _2239;
    float _2459 = _2301;
    float _2461 = _2235 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2463 = fma(_1478, -0.5, 0.5);
    float _2465 = precise::clamp(_2463, 0.0, 1.0);
    float _2467 = -_2449;
    float _2469 = _2467 + _2451;
    float _2471 = -_2453;
    float _2473 = _2471 + _2455;
    out.m_107.x = 0.0;
    float _2475 = fma(_2465, _2469, _2449);
    float _2477 = -_2457;
    float _2479 = _2477 + _2459;
    float _2481 = fma(_2465, _2473, _2453);
    float _2483 = _2475 * 0.586610972881317138671875;
    bool _2485 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2487 = fma(_2465, _2479, _2457);
    out.m_51.x = _2461;
    float _2489 = fma(_2481, 0.298911988735198974609375, _2483);
    bool _2491 = _2221 > 0.0;
    bool _2493 = isnan(_2221);
    bool _2495 = _2491 || _2493;
    bool _2497 = isnan(0.0);
    bool _2499 = _2495 || _2497;
    float _2501 = fma(_2487, 0.114477999508380889892578125, _2489);
    float _2503 = -_2501;
    float _2505 = _2481 + _2503;
    float _2507 = -_2501;
    float _2509 = _2475 + _2507;
    float _2511 = -_2501;
    float _2513 = _2487 + _2511;
    float _2515 = fma(_2505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2501);
    float _2517 = fma(_2509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2501);
    float _2519 = fma(_2513, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2501);
    bool _2521 = !_2485;
    if (!_2521)
    {
        float _2523 = -_1698;
        float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2527 = -_1700;
        float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2531 = -_1702;
        float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2535 = _2525 * _2525;
        float _2537 = fma(_2529, _2529, _2535);
        float _2539 = fma(_2533, _2533, _2537);
        float _2541 = sqrt(_2539);
        float _2543 = rsqrt(_2539);
        float _2545 = -_2541;
        float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2549 = _2547 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2551 = precise::clamp(_2549, 0.0, 1.0);
        float _2553 = _2529 * _2543;
        float _2555 = _2525 * _2543;
        float _2557 = abs(_2551);
        float _2559 = log2(_2557);
        float _2561 = _2533 * _2543;
        float _2563 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2565 = _1478 * _2555;
        float _2567 = -_2555;
        float _2569 = -_2563;
        float _2571 = fma(_2567, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2569);
        float _2573 = fma(_1476, _2553, _2565);
        float _2575 = -_2561;
        float _2577 = fma(_2575, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2571);
        float _2579 = fma(_1480, _2561, _2573);
        float _2581 = precise::clamp(_2579, 0.0, 1.0);
        float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2585 = _2577 + _2583;
        float _2587 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2589 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2591 = precise::clamp(_2589, 0.0, 1.0);
        float _2593 = exp2(_2587);
        float _2595 = _2593 * _2591;
        float _2597 = _2581 * _2595;
        float _2599 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2601 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2603 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2599;
        out.m_107.y = _2601;
        out.m_107.z = _2603;
    }
    out.m_85.x = _2515;
    out.m_85.y = _2517;
    out.m_85.z = _2519;
    if (_2499)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2605 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2605;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2363 = false;
    bool _1548 = false;
    bool _682 = false;
    bool _536 = false;
    bool _246 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_51.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_142);
        out.gl_Position.z = _2662;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_53.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
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
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2731 = as_type<float>(_178);
        out.gl_Position.z = _2731;
    }
    if (_170)
    {
        return out;
    }
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = _182 * _190;
    float _208 = _182 * _196;
    float _210 = fma(_180, _188, _206);
    float _212 = _182 * _202;
    float _214 = fma(_180, _194, _208);
    float _216 = fma(_180, _200, _212);
    float _218 = fma(_184, _192, _210);
    float _220 = fma(_184, _198, _214);
    float _222 = fma(_184, _204, _216);
    bool _224 = !_186;
    float _226 = _220;
    float _244;
    if (!_224)
    {
        float _228 = in.m_63.x;
        float _230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _232 = _228 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _236 = _234 * _230;
        float _238 = floor(_236);
        float _240 = -_238;
        float _242 = _236 + _240;
        _244 = _242;
        _246 = true;
    }
    else
    {
        float _248 = float(_126);
        float _250 = 1.0 / _248;
        float _252 = _160 * _250;
        _244 = _252;
    }
    _246 = false;
    float _254 = _244;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = _254 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _254 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = _254 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = 1.0 / _270;
    bool _286 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_254);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    bool _298 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_254);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = 1.0 / _274;
    float _312 = -_308;
    float _314 = _312 + 1.0;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _282;
    float _320 = _258 * _284;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _254 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = fma(_328, _320, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _332 = 1.0 / _278;
    float _334 = _262 * _310;
    bool _336 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _338 = isnan(_254);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_346;
    float _350 = _348 + 1.0;
    float _352 = _324 * _318;
    bool _354 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _356 = isnan(_254);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = _364 * _350;
    float _368 = _266 * _332;
    float _370 = -_364;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = _296 * _372;
    float _384 = -_296;
    float _386 = _384 + 1.0;
    float _388 = fma(_376, _320, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_380, _320, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _392 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_254);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = _308 * _386;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = _402 * _314;
    float _420 = fma(_408, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_412, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _390 * _418;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _432;
    float _436 = _388 * _418;
    float _438 = _330 * _418;
    float _440 = -_402;
    float _442 = _440 + 1.0;
    float _444 = in.m_65.x;
    float _446 = in.m_65.y;
    float _448 = in.m_65.z;
    float _450 = fma(_430, _368, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_434, _368, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _454 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _456 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _464 = fma(_422, _404, _454);
    float _466 = fma(_420, _404, _456);
    float _468 = fma(_460, _368, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _482 = fma(_424, _404, _462);
    float _484 = fma(_472, _352, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _486 = fma(_476, _352, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _488 = fma(_480, _352, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _490 = fma(_450, _382, _464);
    float _492 = fma(_452, _382, _466);
    float _494 = fma(_468, _382, _482);
    float _496 = fma(_484, _366, _490);
    float _498 = fma(_486, _366, _492);
    float _500 = fma(_488, _366, _494);
    float _502 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[147].x, _496);
    float _504 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[147].y, _498);
    float _506 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[147].z, _500);
    float _508 = _502 * _444;
    float _510 = _504 * _446;
    float _512 = _506 * _448;
    bool _514 = !_316;
    float _516 = _512;
    float _534;
    if (!_514)
    {
        float _518 = in.m_63.x;
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _522 = _518 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_126);
        float _540 = 1.0 / _538;
        float _542 = _160 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _544 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _572 = isnan(_544);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    bool _586 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _588 = isnan(_544);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _552;
    float _600 = -_564;
    float _602 = _600 + 1.0;
    bool _604 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _606 = _580 * _602;
    float _608 = -_580;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _568;
    float _614 = _584 * _598;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = fma(_614, _548, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _622 = _618 * _612;
    float _624 = _620 * _606;
    float _626 = -_596;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = _544 + _630;
    float _634 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _636 = _564 * _628;
    float _638 = fma(_622, _632, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _642 = fma(_638, _636, _634);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[117].x, _642);
    float _650 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _648 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _650;
    out.m_67.y = _652;
    out.m_67.z = _654;
    out.m_67.w = _656;
    bool _658 = !_604;
    float _660 = _656;
    float _662 = _654;
    float _680;
    if (!_658)
    {
        float _664 = in.m_63.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_126);
        float _686 = 1.0 / _684;
        float _688 = _160 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = in.m_63.w;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _696 = in.m_69.y;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _700 = _698 != 0;
    float _702 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _704 = in.m_63.x;
    float _706 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _708 = in.m_48.x;
    float _710 = in.m_48.y;
    float _712 = in.m_48.z;
    float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _718 = _716 != 0;
    float _720 = in.m_63.z;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _724 = _722 != 0;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _730 = _728 != 0;
    float _732 = in.m_63.y;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _736 = _734 != 0;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    bool _738 = _692 > 0.5;
    float _740 = -_696;
    float _742 = _740 + 1.0;
    float _744 = in.m_57.w;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _748 = _714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _750 = in.m_61.w;
    float _752 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[78].z, _746);
    int _754 = _738 ? as_type<int>(_742) : as_type<int>(_696);
    float _756 = _196 * _710;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _760 = _704 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _762 = _202 * _710;
    float _764 = fma(_194, _708, _756);
    float _766 = _718 ? as_type<float>(_754) : _696;
    float _768 = -_758;
    float _770 = fma(_760, 2.0, _768);
    float _772 = fma(_200, _708, _762);
    float _774 = in.m_73.x;
    float _776 = in.m_73.y;
    float _778 = in.m_73.z;
    float _780 = in.m_73.w;
    float _782 = _190 * _710;
    bool _784 = _720 > 0.5;
    float _786 = in.m_59.w;
    float _788 = _720;
    float _790 = _696;
    float _792 = _694;
    float _794 = _702;
    if (!_700)
    {
        _660 = _732;
    }
    float _796 = _660;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _800 = _796;
    if (!_700)
    {
        _662 = _720;
    }
    float _802 = _662;
    float _804 = in.m_69.x;
    float _806 = _802;
    if (_700)
    {
        _800 = _704;
    }
    float _808 = _800;
    float _810 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _798);
    if (_700)
    {
        _806 = _732;
    }
    float _812 = _806;
    float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _816 = as_type<int>(_812);
    if (_700)
    {
        _788 = _732;
    }
    float _818 = _788;
    float _820 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _824 = _822 != 0;
    float _826 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _752);
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _830 = _828 != 0;
    float _832 = fma(_188, _708, _782);
    bool _834 = _732 > 0.5;
    float _836 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _838 = fma(_204, _712, _772);
    float _840 = fma(_192, _712, _832);
    float _842 = fma(_198, _712, _764);
    int _844 = _834 ? as_type<int>(_742) : as_type<int>(_696);
    float _846 = _776 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _848 = fma(_836, -2.0, _726);
    float _850 = _840 + _744;
    float _852 = _842 + _786;
    float _854 = _824 ? as_type<float>(_844) : _696;
    float _856 = _776 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _858 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _846);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _862 = _852 + _860;
    float _864 = _838 + _750;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _870 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _856);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _850 + _876;
    float _880 = _862 * _862;
    bool _882 = _824;
    float _884 = _850;
    if (_724)
    {
        bool _886 = _704 > 0.5;
        _882 = _886;
    }
    bool _888 = _882;
    float _890 = _776 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _892 = 1.0 / _868;
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _896 = _864 + _894;
    float _898 = fma(_878, _878, _880);
    float _900 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _890);
    float _902 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _900);
    float _904 = 1.0 / _874;
    float _906 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _870);
    float _908 = fma(_896, _896, _898);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _918 = _898;
    if (!_724)
    {
        _918 = _804;
    }
    float _920 = _918;
    float _922 = _920;
    if (_830)
    {
        float _924 = _784 ? _742 : _696;
        _790 = _924;
    }
    float _926 = _790;
    float _928 = sqrt(_908);
    float _930 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _858);
    float _932 = _916 * _892;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _936 = _690 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _940 = _690 + _938;
    bool _942 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _944 = isnan(_690);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    out.m_75.x = _930;
    out.m_75.y = _906;
    out.m_75.z = _902;
    float _954 = _912 * _904;
    float _956 = fma(_932, _940, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _958 = -_952;
    float _960 = _958 + 1.0;
    float _962 = fma(_954, _936, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _964 = _694 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_724)
    {
        _792 = _920;
    }
    float _966 = _792;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _970 = _966;
    if (_724)
    {
        _922 = _804;
    }
    float _972 = _922;
    float _974 = _928 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _976 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _810);
    float _978 = _814 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _980 = rsqrt(_908);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _984 = _702 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _986 = fma(_964, _854, -0.5);
    float _988 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _848);
    bool _990 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _992 = isnan(_690);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[83].w, _982);
    float _1004 = precise::min(_984, _974);
    float _1006 = -_988;
    float _1008 = fma(_976, _986, _1006);
    bool _1010 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1012 = isnan(_690);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -_1000;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_766, _978, -0.5);
    float _1028 = in.m_77.x;
    float _1030 = in.m_77.y;
    float _1032 = in.m_77.z;
    float _1034 = _1020 * _1024;
    float _1036 = -_1020;
    float _1038 = _1036 + 1.0;
    float _1040 = _980 * _1004;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1044 = _952 * _1038;
    float _1046 = _862 * _1040;
    float _1048 = _878 * _1040;
    float _1050 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1042);
    float _1052 = _962 * _1044;
    float _1054 = -_1046;
    float _1056 = _862 + _1054;
    float _1058 = -_1048;
    float _1060 = _878 + _1058;
    float _1062 = _896 * _1040;
    float _1064 = -_968;
    float _1066 = fma(_820, 2.0, _1064);
    float _1068 = _1056 * _1056;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1072 = -_1062;
    float _1074 = _896 + _1072;
    float _1076 = _812 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1078 = fma(_1060, _1060, _1068);
    float _1080 = _1070;
    float _1082 = _1062;
    if (_724)
    {
        float _1084 = -_972;
        float _1086 = _1084 + 1.0;
        _816 = as_type<int>(_1086);
    }
    int _1088 = _816;
    float _1090 = in.m_79.x;
    float _1092 = in.m_79.y;
    float _1094 = in.m_79.z;
    int _1096 = 0;
    float _1098 = as_type<float>(_1088);
    if (_730)
    {
        float _1100 = -_972;
        float _1102 = _1100 + 1.0;
        _1096 = as_type<int>(_1102);
    }
    int _1104 = _1096;
    float _1106 = fma(_1074, _1074, _1078);
    bool _1108 = _1030 != 0.0;
    bool _1110 = isnan(_1030);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(0.0);
    bool _1116 = _1112 || _1114;
    int _1118 = 0;
    if (_736)
    {
        float _1120 = -_972;
        float _1122 = _1120 + 1.0;
        _1118 = as_type<int>(_1122);
    }
    int _1124 = _1118;
    float _1126 = fma(_1076, -2.0, _1070);
    float _1128 = sqrt(_1106);
    bool _1130 = _1028 == 0.0;
    bool _1132 = !_1116;
    bool _1134 = _1130 && _1132;
    float _1136 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1052);
    if (_724)
    {
        float _1138 = _888 ? as_type<float>(_1088) : _972;
        _970 = _1138;
    }
    float _1140 = _970;
    float _1142 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1002);
    if (!_730)
    {
        _1098 = _972;
    }
    float _1144 = _1098;
    float _1146 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1050);
    float _1148 = _1144;
    if (!_736)
    {
        _1080 = _972;
    }
    float _1150 = _1080;
    float _1152 = -_160;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1066);
    bool _1156 = _1032 == 0.0;
    bool _1158 = _1156 && _1134;
    float _1160 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1126);
    float _1162 = _1150;
    if (_730)
    {
        float _1164 = _784 ? as_type<float>(_1104) : _972;
        _1148 = _1164;
    }
    float _1166 = _1148;
    float _1168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_736)
    {
        float _1170 = _834 ? as_type<float>(_1124) : _972;
        _1162 = _1170;
    }
    float _1172 = _1162;
    float _1174 = -_160;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[76].x, _770);
    float _1178 = _980 * _1128;
    float _1180 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1182 = -_1160;
    float _1184 = fma(_1142, _1026, _1182);
    float _1186 = fma(_748, _1140, -0.5);
    float _1188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1030);
    float _1190 = _706 * _1178;
    float _1192 = _702 * _1178;
    float _1194 = _1180 * _1178;
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1028);
    float _1198 = _1190 * _1188;
    float _1200 = _1188;
    if (_1158)
    {
        _1200 = _1092;
    }
    float _1202 = _1200;
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1032);
    float _1206 = _1192 * _1196;
    float _1208 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1210 = _1202;
    float _1212 = _1208;
    if (_1158)
    {
        _794 = _1202;
    }
    float _1214 = _794;
    float _1216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1218 = _1214;
    if (!_1158)
    {
        _1210 = _1092;
    }
    float _1220 = _1210;
    float _1222 = _1194 * _1204;
    float _1224 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1226 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1208);
    float _1228 = _1226;
    if (_1158)
    {
        _1212 = _1094;
    }
    float _1230 = _1212;
    float _1232 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1234 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1224);
    float _1236 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1226);
    float _1238 = _1230;
    if (_1158)
    {
        _1228 = _1230;
    }
    float _1240 = _1228;
    float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1244 = _1240;
    if (!_1158)
    {
        _1238 = _1094;
    }
    float _1246 = _1238;
    float _1248 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1234);
    float _1250 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1252 = fma(_956, _1034, _1136);
    float _1254 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1256 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1258 = _864 + _1250;
    if (!_1158)
    {
        float _1260 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1246);
        _1244 = _1260;
    }
    float _1262 = _1244;
    float _1264 = fma(_1254, _1166, -0.5);
    float _1266 = _850 + _1256;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1270 = _1258 + _1268;
    float _1272 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1232);
    float _1274 = _1266;
    if (!_1158)
    {
        float _1276 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1220);
        _1218 = _1276;
    }
    float _1278 = _1218;
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1282 = _1266 + _1280;
    float _1284 = _1270 * _1270;
    float _1286 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1158)
    {
        _516 = _1090;
    }
    float _1288 = _516;
    float _1290 = _926 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1292 = fma(_1282, _1282, _1284);
    float _1294 = _1288;
    if (!_1158)
    {
        float _1296 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1090);
        _1294 = _1296;
    }
    float _1298 = _1294;
    float _1300 = _776 * _1246;
    float _1302 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1272);
    float _1304 = sqrt(_1292);
    float _1306 = _1286 * _1216;
    float _1308 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1310 = _778 * _1090;
    float _1312 = -_1300;
    float _1314 = fma(_778, _1220, _1312);
    float _1316 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1252);
    float _1318 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1308);
    float _1320 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1322 = _774 * _1220;
    float _1324 = _1290 * _1242;
    float _1326 = -_1310;
    float _1328 = fma(_774, _1246, _1326);
    float _1330 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1332 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1334 = _852 + _1320;
    float _1336 = -_1322;
    float _1338 = fma(_776, _1090, _1336);
    bool _1340 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1330);
    float _1344 = fma(_826, _1186, _1176);
    float _1346 = fma(_1146, _1264, _1154);
    out.m_81.x = _1306;
    out.m_81.y = _1324;
    float _1348 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1332);
    float _1350 = _1332;
    float _1352 = _1324;
    if (!_1340)
    {
        _1350 = _1258;
    }
    float _1354 = _1350;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1358 = _1354;
    if (!_1340)
    {
        _1352 = _1334;
    }
    float _1360 = _1352;
    bool _1362 = !_1340;
    float _1364 = _1360;
    if (!_1362)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1370 = _1304 + _1368;
        float _1372 = _1334 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = rsqrt(_1292);
        float _1376 = _1370 * _1366;
        float _1378 = _1376 * 0.15915493667125701904296875;
        float _1380 = _1378 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = _1378 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = _1382 + (-1.0);
        float _1390 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = fma(_1386, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1394 = fma(_1334, _1382, _1390);
        float _1396 = _1374 * _1392;
        float _1398 = fma(_1282, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1400 = fma(_1270, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1364 = _1394;
        _1274 = _1398;
        _1358 = _1400;
    }
    float _1402 = _1364;
    float _1404 = _1274;
    float _1406 = _1358;
    float _1408 = -_1046;
    float _1410 = _1408 + _1402;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1416 = -_1048;
    float _1418 = _1416 + _1404;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1422 = _1410 + _1420;
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1430 = _1418 + _1428;
    float _1432 = _1422 * _1422;
    float _1434 = _1328 * _780;
    float _1436 = _1314 * _780;
    float _1438 = _1338 * _780;
    float _1440 = -_1062;
    float _1442 = _1440 + _1406;
    float _1444 = fma(_1430, _1430, _1432);
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1448 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1450 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1454 = _1442 + _1452;
    float _1456 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1458 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1446);
    float _1462 = fma(_1454, _1454, _1444);
    float _1464 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1448);
    float _1466 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1450);
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1460);
    out.m_83.x = _1456;
    out.m_83.y = _1424;
    out.m_83.z = _1426;
    out.m_83.w = _1458;
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1464);
    float _1472 = sqrt(_1462);
    float _1474 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1476 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1318);
    float _1478 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1342);
    float _1480 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1348);
    out.m_85.w = _1004;
    float _1482 = -_1048;
    float _1484 = _850 + _1482;
    float _1486 = -_1046;
    float _1488 = _852 + _1486;
    out.m_87.x = _1468;
    out.m_87.y = _1470;
    out.m_87.z = _1474;
    float _1490 = -_1062;
    float _1492 = _864 + _1490;
    float _1494 = _1008 + 0.5;
    float _1496 = _1184 + 0.5;
    float _1498 = _1346 + 0.5;
    float _1500 = _1344 + 0.5;
    out.m_89.x = _1192;
    bool _1502 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1504 = isnan(_1472);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1510 = _1506 || _1508;
    out.m_91.x = _1500;
    out.m_91.y = _1494;
    out.m_91.z = _1498;
    out.m_91.w = _1496;
    out.m_93.x = _1476;
    out.m_93.y = _1478;
    out.m_93.z = _1480;
    float _1512 = _1498;
    if (!_1510)
    {
        _884 = 1.0;
    }
    float _1514 = _884;
    bool _1516 = !_1510;
    float _1518 = _1514;
    if (!_1516)
    {
        bool _1520 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1522 = isnan(_1472);
        bool _1524 = _1520 || _1522;
        bool _1526 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1528 = _1524 || _1526;
        if (!_1528)
        {
            float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1532 = _1472 + _1530;
            float _1534 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1536 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1534;
            float _1538 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1540 = _1538 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1542 = 1.0 / _1536;
            float _1544 = _1532 * _1542;
            float _1546 = fma(_1544, _1540, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1518 = _1546;
            _1548 = true;
        }
        else
        {
            bool _1550 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1552 = isnan(_1472);
            bool _1554 = _1550 || _1552;
            bool _1556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1558 = _1554 || _1556;
            if (!_1558)
            {
                float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1562 = _1472 + _1560;
                float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1570 = _1568 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1572 = 1.0 / _1566;
                float _1574 = _1562 * _1572;
                float _1576 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1518 = _1576;
                _1548 = true;
            }
            else
            {
                _1518 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1548 = false;
    float _1578 = _1518;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1582 = _1410 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1586 = _1418 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1590 = _1442 + _1588;
    float _1592 = fma(_1582, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1594 = fma(_1586, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1596 = fma(_1590, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1598 = -_1488;
    float _1600 = _1598 + _1592;
    float _1602 = -_1484;
    float _1604 = _1602 + _1594;
    float _1606 = -_1492;
    float _1608 = _1606 + _1596;
    float _1610 = _1600 * _1600;
    float _1612 = fma(_1604, _1604, _1610);
    float _1614 = fma(_1608, _1608, _1612);
    float _1616 = sqrt(_1614);
    bool _1618 = _1616 > 0.0;
    float _1620 = _1616;
    float _1622 = _1586;
    float _1624 = _1596;
    if (!_1618)
    {
        _1620 = _1594;
    }
    float _1626 = _1620;
    float _1628 = _1626;
    if (!_1618)
    {
        _1622 = _1592;
    }
    float _1630 = _1622;
    float _1632 = _1630;
    float _1634 = _1630;
    if (!_1618)
    {
        _1512 = _1596;
    }
    float _1636 = _1512;
    bool _1638 = !_1618;
    float _1640 = _1636;
    float _1642 = _1636;
    if (!_1638)
    {
        float _1644 = _220 * _220;
        float _1646 = rsqrt(_1614);
        float _1648 = fma(_218, _218, _1644);
        float _1650 = fma(_222, _222, _1648);
        float _1652 = sqrt(_1650);
        float _1654 = _1604 * _1646;
        float _1656 = _1600 * _1646;
        float _1658 = _1608 * _1646;
        bool _1660 = _1652 > 0.0;
        float _1662 = _1652;
        if (!_1660)
        {
            _1662 = _1594;
        }
        float _1664 = _1662;
        _1628 = _1664;
        if (!_1660)
        {
            _1632 = _1592;
        }
        float _1666 = _1632;
        _1634 = _1666;
        if (!_1660)
        {
            _1640 = _1596;
        }
        float _1668 = _1640;
        bool _1670 = !_1660;
        _1642 = _1668;
        if (!_1670)
        {
            float _1672 = rsqrt(_1650);
            float _1674 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1676 = _220 * _1672;
            float _1678 = _218 * _1672;
            float _1680 = _222 * _1672;
            float _1682 = _1656 * _1676;
            float _1684 = fma(_1654, _1678, _1682);
            float _1686 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1688 = fma(_1658, _1680, _1684);
            float _1690 = _1688 * _1686;
            float _1692 = fma(_218, _1690, _1594);
            float _1694 = fma(_220, _1690, _1592);
            float _1696 = fma(_222, _1690, _1596);
            _1634 = _1694;
            _1628 = _1692;
            _1642 = _1696;
        }
    }
    float _1698 = _1634;
    float _1700 = _1628;
    float _1702 = _1642;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1706 = _1698 + _1704;
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1710 = _1700 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1714 = _1702 + _1712;
    float _1716 = _1706 * _1706;
    float _1718 = fma(_1710, _1710, _1716);
    float _1720 = fma(_1714, _1714, _1718);
    float _1722 = rsqrt(_1720);
    float _1724 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1726 = _1710 * _1724;
    float _1728 = _1714 * _1724;
    float _1730 = _1726 * _1726;
    float _1732 = _1728 * _1728;
    float _1734 = _1730 + _1732;
    float _1736 = sqrt(_1734);
    bool _1738 = _1736 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1742 = _1736 + _1740;
    float _1744 = _1714;
    float _1746 = _1742;
    float _1748 = _1706;
    if (_1738)
    {
        float _1750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1750;
    }
    float _1752 = _1744;
    if (_1738)
    {
        float _1754 = rsqrt(_1734);
        _226 = _1754;
    }
    float _1756 = _226;
    float _1758 = _1756;
    if (_1738)
    {
        float _1760 = _1742 * _1752;
        _1746 = _1760;
    }
    float _1762 = _1746;
    if (_1738)
    {
        float _1764 = _1762 * 0.15915493667125701904296875;
        _1624 = _1764;
    }
    float _1766 = _1624;
    float _1768 = _1716;
    if (_1738)
    {
        float _1770 = _1766 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        _1768 = _1772;
    }
    float _1774 = _1768;
    float _1776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1778 = precise::max(0.0, _1776);
    float _1780 = _1722;
    float _1782 = _1776;
    float _1784 = _1778;
    if (_1738)
    {
        float _1786 = _1766 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        _1780 = _1788;
    }
    float _1790 = _1780;
    float _1792 = -_1724;
    float _1794 = -_1778;
    float _1796 = fma(_1706, _1792, _1794);
    float _1798 = _1796;
    if (_1738)
    {
        float _1800 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1800;
    }
    float _1802 = _1782;
    float _1804 = _1802;
    float _1806 = _1774;
    if (_1738)
    {
        float _1808 = fma(_1774, _1802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1804 = _1808;
    }
    float _1810 = _1804;
    if (!_1738)
    {
        _1806 = _1730;
    }
    float _1812 = _1806;
    float _1814 = _1790;
    float _1816 = _1812;
    if (_1738)
    {
        float _1818 = _1790 + (-1.0);
        _1748 = _1818;
    }
    float _1820 = _1748;
    if (_1738)
    {
        float _1822 = _1756 * _1810;
        _1082 = _1822;
    }
    float _1824 = _1082;
    if (!_1738)
    {
        _1758 = _1726;
    }
    float _1826 = _1758;
    float _1828 = sqrt(_1720);
    float _1830 = _1826;
    if (_1738)
    {
        float _1832 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1832;
    }
    float _1834 = _1784;
    if (_1738)
    {
        float _1836 = _1726 * _1824;
        _1830 = _1836;
    }
    float _1838 = _1830;
    float _1840 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1738)
    {
        float _1842 = fma(_1796, _1790, _1834);
        _1798 = _1842;
    }
    float _1844 = _1798;
    if (!_1738)
    {
        _1814 = _1728;
    }
    float _1846 = _1814;
    float _1848 = _1846;
    if (_1738)
    {
        float _1850 = _1728 * _1824;
        _1848 = _1850;
    }
    float _1852 = _1848;
    if (_1738)
    {
        float _1854 = _1838 * _1838;
        _1816 = _1854;
    }
    float _1856 = _1816;
    float _1858 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1738)
    {
        _1840 = _1732;
    }
    float _1860 = _1840;
    float _1862 = _1860;
    if (_1738)
    {
        float _1864 = _1852 * _1852;
        _1862 = _1864;
    }
    float _1866 = _1862;
    float _1868 = fma(_1844, _1844, _1856);
    float _1870 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1872 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1874 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1876 = _1868 + _1866;
    float _1878 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1870);
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1882 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1880);
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = rsqrt(_1876);
    float _1888 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1878);
    float _1890 = -_1884;
    float _1892 = _1890 + 1.0;
    float _1894 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1874);
    float _1896 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1900 = abs(_1892);
    float _1902 = log2(_1900);
    float _1904 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1906 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1908 = -_1904;
    float _1910 = fma(_1908, _1896, 1.0);
    float _1912 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1914 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1906);
    float _1916 = _1886 * _1838;
    float _1918 = floor(_1858);
    float _1920 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1912);
    float _1922 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1914);
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1926 = _1886 * _1844;
    float _1928 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1920);
    float _1930 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1932 = _1886 * _1852;
    float _1934 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1894);
    float _1936 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1938 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1940 = floor(_1872);
    float _1942 = -_1924;
    float _1944 = fma(_1926, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1942);
    float _1946 = _1934 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1948 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1938);
    float _1950 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1952 = -_1932;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1944);
    float _1956 = -_1918;
    float _1958 = _1858 + _1956;
    float _1960 = log2(_1910);
    float _1962 = fma(_1954, -0.5, 0.5);
    float _1964 = fma(_1954, 0.5, 0.5);
    float _1966 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1968 = fma(_1964, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1970 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1966);
    float _1972 = exp2(_1950);
    float _1974 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1948);
    float _1976 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1978 = -_1940;
    float _1980 = _1872 + _1978;
    float _1982 = fma(_1964, _1968, -0.212114393711090087890625);
    float _1984 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1974);
    float _1986 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1976);
    float _1988 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1970);
    float _1990 = sqrt(_1962);
    float _1992 = _1960 * 0.693147182464599609375;
    float _1994 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1986);
    float _1996 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1988);
    float2 _5801 = float2(_1958, _1980);
    float _1998 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5801, float2(0.0), isnan(_5801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5801, float2(0.0), isnan(_5801)), level(0.0)).x;
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2002 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1994);
    float _2004 = fma(_1964, _1982, 1.570728778839111328125);
    float _2006 = 1.0 / _1984;
    float _2008 = _1926 + 1.0;
    float _2010 = -_1926;
    float _2012 = fma(_1972, _2008, _2010);
    float _2014 = _1990 * 0.636619746685028076171875;
    float _2016 = fma(_2012, 0.5, 0.5);
    float _2018 = -_2004;
    float _2020 = fma(_2014, _2018, 1.0);
    float _2022 = _2002 * _2006;
    float _2024 = _1996 * _2006;
    float _2026 = fma(_2022, 0.5, 0.5);
    float _2028 = fma(_2024, -0.5, 0.5);
    float3 _5855 = float3(_2026, _2028, _2000);
    float _2030 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5855, float3(0.0), isnan(_5855)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5855, float3(0.0), isnan(_5855)), level(0.0)).x;
    float3 _5866 = float3(_2026, _2028, _2000);
    float4 _2033 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5866, float3(0.0), isnan(_5866)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5866, float3(0.0), isnan(_5866)), level(0.0)).xyzw;
    float _2035 = _2033.x;
    float _2037 = _2033.y;
    float _2039 = _2033.z;
    float _2041 = _2033.w;
    float2 _5882 = float2(_2020, _2016);
    float3 _2045 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5882, float2(0.0), isnan(_5882)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5882, float2(0.0), isnan(_5882)), level(0.0)).xyz;
    float _2047 = _2045.x;
    float _2049 = _2045.y;
    float _2051 = _2045.z;
    float _2053 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_95.x = _1484;
    out.m_95.y = _1488;
    out.m_95.z = _1492;
    float _2055 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2053);
    out.m_97.x = _1700;
    out.m_97.y = _1698;
    out.m_97.z = _1702;
    float _2057 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2055);
    float _2059 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2061 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2063 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2059);
    float _2065 = 1.0 / _2061;
    float _2067 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2063);
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2071 = _2069 + _2061;
    bool _2073 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2075 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2077 = _2073 || _2075;
    bool _2079 = isnan(0.5);
    bool _2081 = _2077 || _2079;
    float _2083 = _2071 * _2065;
    float _2085 = _2083 * 0.5;
    float _2087 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2089 = in.m_99.x;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2093 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2091);
    float _2095 = exp2(_2087);
    float _2097 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2099 = _1902;
    float _2101 = _1984;
    float _2103 = _1996;
    if (!_2081)
    {
        _2097 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2105 = _2097;
    if (_2081)
    {
        _2099 = 1.0;
    }
    float _2107 = _2099;
    float _2109 = 1.0 / _2093;
    float _2111 = -_2095;
    float _2113 = _2111 + 1.0;
    float _2115 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2117 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2119 = _2109 * _2117;
    float _2121 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2123 = abs(_2119);
    float _2125 = log2(_2123);
    float _2127 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2121);
    float _2129 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2127);
    float _2131 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2129);
    float _2133 = _2131 + _1984;
    out.gl_Position.x = _2002;
    out.gl_Position.y = _1996;
    out.gl_Position.z = _2131;
    out.gl_Position.w = _1984;
    float _2135 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2137 = _2133 * 0.5;
    float _2139 = exp2(_2135);
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = _2139;
    float _2147 = _2107;
    float _2149 = _2131;
    if (!_2081)
    {
        float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2153 = _2119 + _2151;
        _2145 = _2153;
    }
    float _2155 = _2145;
    float _2157 = fma(_2143, -2.0, 3.0);
    float _2159 = _2143 * _2143;
    float _2161 = _2159 * _2157;
    float _2163 = _2159;
    if (!_2081)
    {
        float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2167 = _2105 + _2165;
        _2163 = _2167;
    }
    float _2169 = _2163;
    float _2171 = -_2161;
    float _2173 = _2171 + 1.0;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2161);
    bool _2177 = _2119 <= 8000.0;
    bool _2179 = isnan(_2119);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(8000.0);
    bool _2185 = _2181 || _2183;
    float _2187 = float(_2185);
    float _2189 = _2020;
    if (!_2081)
    {
        float _2191 = 1.0 / _2169;
        _2189 = _2191;
    }
    float _2193 = _2189;
    float _2195 = _2002 + _1984;
    float _2197 = -_2115;
    float _2199 = _2197 + 1.0;
    float _2201 = _2187 * _2175;
    float _2203 = _2195 * 0.5;
    float _2205 = _1984 * 0.5;
    float _2207 = fma(_1996, -0.5, _2205);
    float _2209 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2211 = _2207;
    float _2213 = _2203;
    float _2215 = _2199;
    if (!_2081)
    {
        float _2217 = _2155 * _2193;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2147 = _2219;
    }
    float _2221 = _2147;
    bool _2223 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2225 = isnan(_1828);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2231 = _2227 || _2229;
    out.m_101.x = _2203;
    out.m_101.y = _2207;
    out.m_101.z = _2137;
    out.m_101.w = _1984;
    if (!_2231)
    {
        _2101 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2233 = _2101;
    float _2235 = _2221 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2237 = _2233;
    float _2239 = _2233;
    if (!_2231)
    {
        _2211 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2241 = _2211;
    float _2243 = _2241;
    float _2245 = _2241;
    if (!_2231)
    {
        _2213 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2247 = _2213;
    float _2249 = _2247;
    float _2251 = _2247;
    if (!_2231)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2253 = _2149;
    float _2255 = _2253;
    float _2257 = _2253;
    if (!_2231)
    {
        _2103 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2259 = _2103;
    float _2261 = -_1998;
    float _2263 = _2261 + 1.0;
    float _2265 = _2263 * _2209;
    float _2267 = precise::clamp(_2265, 0.0, 1.0);
    float _2269 = -_2267;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2273 = _2271 * _2089;
    float _2275 = _2273 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_103.x = _2275;
    float _2277 = _2115 * _2030;
    float _2279 = _2041 * _2199;
    float _2281 = _2259;
    float _2283 = _2259;
    if (!_2231)
    {
        _2215 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2285 = _2215;
    float _2287 = _2041 * _2277;
    float _2289 = _2051 * _2277;
    float _2291 = fma(_2047, _2287, _2035);
    float _2293 = fma(_2049, _2287, _2037);
    float _2295 = fma(_2041, _2289, _2039);
    out.m_105.x = _2291;
    out.m_105.y = _2293;
    out.m_105.z = _2295;
    out.m_105.w = _2279;
    bool _2297 = !_2231;
    float _2299 = _2285;
    float _2301 = _2285;
    if (!_2297)
    {
        bool _2303 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2305 = isnan(_1828);
        bool _2307 = _2303 || _2305;
        bool _2309 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2311 = _2307 || _2309;
        if (!_2311)
        {
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2315 = _1828 + _2313;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2319 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2317;
            float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2325 = 1.0 / _2319;
            float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2329 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2333 = _2331 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2343 = _2315 * _2325;
            float _2345 = precise::clamp(_2343, 0.0, 1.0);
            float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2351 = fma(_2345, _2323, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2353 = fma(_2345, _2349, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2355 = fma(_2345, _2329, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2357 = fma(_2345, _2333, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2359 = fma(_2345, _2337, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2361 = fma(_2345, _2341, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2251 = _2355;
            _2283 = _2359;
            _2245 = _2351;
            _2257 = _2357;
            _2239 = _2353;
            _2301 = _2361;
            _2363 = true;
        }
        else
        {
            bool _2365 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2367 = isnan(_1828);
            bool _2369 = _2365 || _2367;
            bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2373 = _2369 || _2371;
            if (!_2373)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2375 = _2243;
            _2245 = _2375;
            if (!_2373)
            {
                _2249 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2377 = _2249;
            _2251 = _2377;
            if (!_2373)
            {
                _2237 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2379 = _2237;
            _2239 = _2379;
            if (!_2373)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2381 = _2255;
            _2257 = _2381;
            if (!_2373)
            {
                _2281 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2383 = _2281;
            _2283 = _2383;
            if (!_2373)
            {
                _2299 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2385 = _2299;
            bool _2387 = !_2373;
            _2301 = _2385;
            if (!_2387)
            {
                bool _2389 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2391 = isnan(_1828);
                bool _2393 = _2389 || _2391;
                bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2397 = _2393 || _2395;
                if (!_2397)
                {
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2401 = _1828 + _2399;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2405 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2403;
                    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2411 = 1.0 / _2405;
                    float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2429 = _2401 * _2411;
                    float _2431 = precise::clamp(_2429, 0.0, 1.0);
                    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2437 = fma(_2431, _2409, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2439 = fma(_2431, _2435, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2441 = fma(_2431, _2415, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2443 = fma(_2431, _2419, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2445 = fma(_2431, _2423, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2447 = fma(_2431, _2427, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2251 = _2441;
                    _2283 = _2445;
                    _2245 = _2437;
                    _2257 = _2443;
                    _2239 = _2439;
                    _2301 = _2447;
                    _2363 = true;
                }
                else
                {
                    _2251 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2283 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2239 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2301 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2363 = false;
    float _2449 = _2251;
    float _2451 = _2283;
    float _2453 = _2245;
    float _2455 = _2257;
    float _2457 = _2239;
    float _2459 = _2301;
    float _2461 = _2235 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2463 = fma(_1478, -0.5, 0.5);
    float _2465 = precise::clamp(_2463, 0.0, 1.0);
    float _2467 = -_2449;
    float _2469 = _2467 + _2451;
    float _2471 = -_2453;
    float _2473 = _2471 + _2455;
    out.m_107.x = 0.0;
    float _2475 = fma(_2465, _2469, _2449);
    float _2477 = -_2457;
    float _2479 = _2477 + _2459;
    float _2481 = fma(_2465, _2473, _2453);
    float _2483 = _2475 * 0.586610972881317138671875;
    bool _2485 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2487 = fma(_2465, _2479, _2457);
    out.m_51.x = _2461;
    float _2489 = fma(_2481, 0.298911988735198974609375, _2483);
    bool _2491 = _2221 > 0.0;
    bool _2493 = isnan(_2221);
    bool _2495 = _2491 || _2493;
    bool _2497 = isnan(0.0);
    bool _2499 = _2495 || _2497;
    float _2501 = fma(_2487, 0.114477999508380889892578125, _2489);
    float _2503 = -_2501;
    float _2505 = _2481 + _2503;
    float _2507 = -_2501;
    float _2509 = _2475 + _2507;
    float _2511 = -_2501;
    float _2513 = _2487 + _2511;
    float _2515 = fma(_2505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2501);
    float _2517 = fma(_2509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2501);
    float _2519 = fma(_2513, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2501);
    bool _2521 = !_2485;
    if (!_2521)
    {
        float _2523 = -_1698;
        float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2527 = -_1700;
        float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2531 = -_1702;
        float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2535 = _2525 * _2525;
        float _2537 = fma(_2529, _2529, _2535);
        float _2539 = fma(_2533, _2533, _2537);
        float _2541 = sqrt(_2539);
        float _2543 = rsqrt(_2539);
        float _2545 = -_2541;
        float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2549 = _2547 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2551 = precise::clamp(_2549, 0.0, 1.0);
        float _2553 = _2529 * _2543;
        float _2555 = _2525 * _2543;
        float _2557 = abs(_2551);
        float _2559 = log2(_2557);
        float _2561 = _2533 * _2543;
        float _2563 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2565 = _1478 * _2555;
        float _2567 = -_2555;
        float _2569 = -_2563;
        float _2571 = fma(_2567, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2569);
        float _2573 = fma(_1476, _2553, _2565);
        float _2575 = -_2561;
        float _2577 = fma(_2575, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2571);
        float _2579 = fma(_1480, _2561, _2573);
        float _2581 = precise::clamp(_2579, 0.0, 1.0);
        float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2585 = _2577 + _2583;
        float _2587 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2589 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2591 = precise::clamp(_2589, 0.0, 1.0);
        float _2593 = exp2(_2587);
        float _2595 = _2593 * _2591;
        float _2597 = _2581 * _2595;
        float _2599 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2601 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2603 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2599;
        out.m_107.y = _2601;
        out.m_107.z = _2603;
    }
    out.m_85.x = _2515;
    out.m_85.y = _2517;
    out.m_85.z = _2519;
    if (_2499)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2605 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2605;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2363 = false;
    bool _1548 = false;
    bool _682 = false;
    bool _536 = false;
    bool _246 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_51.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_142);
        out.gl_Position.z = _2662;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_53.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
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
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2731 = as_type<float>(_178);
        out.gl_Position.z = _2731;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = _182 * _190;
    float _208 = _182 * _196;
    float _210 = fma(_180, _188, _206);
    float _212 = _182 * _202;
    float _214 = fma(_180, _194, _208);
    float _216 = fma(_180, _200, _212);
    float _218 = fma(_184, _192, _210);
    float _220 = fma(_184, _198, _214);
    float _222 = fma(_184, _204, _216);
    bool _224 = !_186;
    float _226 = _220;
    float _244;
    if (!_224)
    {
        float _228 = in.m_63.x;
        float _230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _232 = _228 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _236 = _234 * _230;
        float _238 = floor(_236);
        float _240 = -_238;
        float _242 = _236 + _240;
        _244 = _242;
        _246 = true;
    }
    else
    {
        float _248 = float(_126);
        float _250 = 1.0 / _248;
        float _252 = _160 * _250;
        _244 = _252;
    }
    _246 = false;
    float _254 = _244;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = _254 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _254 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = _254 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = 1.0 / _270;
    bool _286 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_254);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    bool _298 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_254);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = 1.0 / _274;
    float _312 = -_308;
    float _314 = _312 + 1.0;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _282;
    float _320 = _258 * _284;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _254 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = fma(_328, _320, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _332 = 1.0 / _278;
    float _334 = _262 * _310;
    bool _336 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _338 = isnan(_254);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_346;
    float _350 = _348 + 1.0;
    float _352 = _324 * _318;
    bool _354 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _356 = isnan(_254);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = _364 * _350;
    float _368 = _266 * _332;
    float _370 = -_364;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = _296 * _372;
    float _384 = -_296;
    float _386 = _384 + 1.0;
    float _388 = fma(_376, _320, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_380, _320, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _392 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_254);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = _308 * _386;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = _402 * _314;
    float _420 = fma(_408, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_412, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _390 * _418;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _432;
    float _436 = _388 * _418;
    float _438 = _330 * _418;
    float _440 = -_402;
    float _442 = _440 + 1.0;
    float _444 = in.m_65.x;
    float _446 = in.m_65.y;
    float _448 = in.m_65.z;
    float _450 = fma(_430, _368, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_434, _368, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _454 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _456 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _464 = fma(_422, _404, _454);
    float _466 = fma(_420, _404, _456);
    float _468 = fma(_460, _368, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _482 = fma(_424, _404, _462);
    float _484 = fma(_472, _352, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _486 = fma(_476, _352, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _488 = fma(_480, _352, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _490 = fma(_450, _382, _464);
    float _492 = fma(_452, _382, _466);
    float _494 = fma(_468, _382, _482);
    float _496 = fma(_484, _366, _490);
    float _498 = fma(_486, _366, _492);
    float _500 = fma(_488, _366, _494);
    float _502 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[147].x, _496);
    float _504 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[147].y, _498);
    float _506 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[147].z, _500);
    float _508 = _502 * _444;
    float _510 = _504 * _446;
    float _512 = _506 * _448;
    bool _514 = !_316;
    float _516 = _512;
    float _534;
    if (!_514)
    {
        float _518 = in.m_63.x;
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _522 = _518 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_126);
        float _540 = 1.0 / _538;
        float _542 = _160 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _544 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _572 = isnan(_544);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    bool _586 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _588 = isnan(_544);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _552;
    float _600 = -_564;
    float _602 = _600 + 1.0;
    bool _604 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _606 = _580 * _602;
    float _608 = -_580;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _568;
    float _614 = _584 * _598;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = fma(_614, _548, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _622 = _618 * _612;
    float _624 = _620 * _606;
    float _626 = -_596;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = _544 + _630;
    float _634 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _636 = _564 * _628;
    float _638 = fma(_622, _632, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _642 = fma(_638, _636, _634);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[117].x, _642);
    float _650 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _648 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _650;
    out.m_67.y = _652;
    out.m_67.z = _654;
    out.m_67.w = _656;
    bool _658 = !_604;
    float _660 = _656;
    float _662 = _654;
    float _680;
    if (!_658)
    {
        float _664 = in.m_63.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_126);
        float _686 = 1.0 / _684;
        float _688 = _160 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = in.m_63.w;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _696 = in.m_69.y;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _700 = _698 != 0;
    float _702 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _704 = in.m_63.x;
    float _706 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _708 = in.m_48.x;
    float _710 = in.m_48.y;
    float _712 = in.m_48.z;
    float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _718 = _716 != 0;
    float _720 = in.m_63.z;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _724 = _722 != 0;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _730 = _728 != 0;
    float _732 = in.m_63.y;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _736 = _734 != 0;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    bool _738 = _692 > 0.5;
    float _740 = -_696;
    float _742 = _740 + 1.0;
    float _744 = in.m_57.w;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _748 = _714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _750 = in.m_61.w;
    float _752 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[78].z, _746);
    int _754 = _738 ? as_type<int>(_742) : as_type<int>(_696);
    float _756 = _196 * _710;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _760 = _704 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _762 = _202 * _710;
    float _764 = fma(_194, _708, _756);
    float _766 = _718 ? as_type<float>(_754) : _696;
    float _768 = -_758;
    float _770 = fma(_760, 2.0, _768);
    float _772 = fma(_200, _708, _762);
    float _774 = in.m_73.x;
    float _776 = in.m_73.y;
    float _778 = in.m_73.z;
    float _780 = in.m_73.w;
    float _782 = _190 * _710;
    bool _784 = _720 > 0.5;
    float _786 = in.m_59.w;
    float _788 = _720;
    float _790 = _696;
    float _792 = _694;
    float _794 = _702;
    if (!_700)
    {
        _660 = _732;
    }
    float _796 = _660;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _800 = _796;
    if (!_700)
    {
        _662 = _720;
    }
    float _802 = _662;
    float _804 = in.m_69.x;
    float _806 = _802;
    if (_700)
    {
        _800 = _704;
    }
    float _808 = _800;
    float _810 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _798);
    if (_700)
    {
        _806 = _732;
    }
    float _812 = _806;
    float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _816 = as_type<int>(_812);
    if (_700)
    {
        _788 = _732;
    }
    float _818 = _788;
    float _820 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _824 = _822 != 0;
    float _826 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _752);
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _830 = _828 != 0;
    float _832 = fma(_188, _708, _782);
    bool _834 = _732 > 0.5;
    float _836 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _838 = fma(_204, _712, _772);
    float _840 = fma(_192, _712, _832);
    float _842 = fma(_198, _712, _764);
    int _844 = _834 ? as_type<int>(_742) : as_type<int>(_696);
    float _846 = _776 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _848 = fma(_836, -2.0, _726);
    float _850 = _840 + _744;
    float _852 = _842 + _786;
    float _854 = _824 ? as_type<float>(_844) : _696;
    float _856 = _776 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _858 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _846);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _862 = _852 + _860;
    float _864 = _838 + _750;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _870 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _856);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _850 + _876;
    float _880 = _862 * _862;
    bool _882 = _824;
    float _884 = _850;
    if (_724)
    {
        bool _886 = _704 > 0.5;
        _882 = _886;
    }
    bool _888 = _882;
    float _890 = _776 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _892 = 1.0 / _868;
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _896 = _864 + _894;
    float _898 = fma(_878, _878, _880);
    float _900 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _890);
    float _902 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _900);
    float _904 = 1.0 / _874;
    float _906 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _870);
    float _908 = fma(_896, _896, _898);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _918 = _898;
    if (!_724)
    {
        _918 = _804;
    }
    float _920 = _918;
    float _922 = _920;
    if (_830)
    {
        float _924 = _784 ? _742 : _696;
        _790 = _924;
    }
    float _926 = _790;
    float _928 = sqrt(_908);
    float _930 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _858);
    float _932 = _916 * _892;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _936 = _690 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _940 = _690 + _938;
    bool _942 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _944 = isnan(_690);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    out.m_75.x = _930;
    out.m_75.y = _906;
    out.m_75.z = _902;
    float _954 = _912 * _904;
    float _956 = fma(_932, _940, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _958 = -_952;
    float _960 = _958 + 1.0;
    float _962 = fma(_954, _936, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _964 = _694 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_724)
    {
        _792 = _920;
    }
    float _966 = _792;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _970 = _966;
    if (_724)
    {
        _922 = _804;
    }
    float _972 = _922;
    float _974 = _928 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _976 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _810);
    float _978 = _814 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _980 = rsqrt(_908);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _984 = _702 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _986 = fma(_964, _854, -0.5);
    float _988 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _848);
    bool _990 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _992 = isnan(_690);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[83].w, _982);
    float _1004 = precise::min(_984, _974);
    float _1006 = -_988;
    float _1008 = fma(_976, _986, _1006);
    bool _1010 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1012 = isnan(_690);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -_1000;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_766, _978, -0.5);
    float _1028 = in.m_77.x;
    float _1030 = in.m_77.y;
    float _1032 = in.m_77.z;
    float _1034 = _1020 * _1024;
    float _1036 = -_1020;
    float _1038 = _1036 + 1.0;
    float _1040 = _980 * _1004;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1044 = _952 * _1038;
    float _1046 = _862 * _1040;
    float _1048 = _878 * _1040;
    float _1050 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1042);
    float _1052 = _962 * _1044;
    float _1054 = -_1046;
    float _1056 = _862 + _1054;
    float _1058 = -_1048;
    float _1060 = _878 + _1058;
    float _1062 = _896 * _1040;
    float _1064 = -_968;
    float _1066 = fma(_820, 2.0, _1064);
    float _1068 = _1056 * _1056;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1072 = -_1062;
    float _1074 = _896 + _1072;
    float _1076 = _812 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1078 = fma(_1060, _1060, _1068);
    float _1080 = _1070;
    float _1082 = _1062;
    if (_724)
    {
        float _1084 = -_972;
        float _1086 = _1084 + 1.0;
        _816 = as_type<int>(_1086);
    }
    int _1088 = _816;
    float _1090 = in.m_79.x;
    float _1092 = in.m_79.y;
    float _1094 = in.m_79.z;
    int _1096 = 0;
    float _1098 = as_type<float>(_1088);
    if (_730)
    {
        float _1100 = -_972;
        float _1102 = _1100 + 1.0;
        _1096 = as_type<int>(_1102);
    }
    int _1104 = _1096;
    float _1106 = fma(_1074, _1074, _1078);
    bool _1108 = _1030 != 0.0;
    bool _1110 = isnan(_1030);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(0.0);
    bool _1116 = _1112 || _1114;
    int _1118 = 0;
    if (_736)
    {
        float _1120 = -_972;
        float _1122 = _1120 + 1.0;
        _1118 = as_type<int>(_1122);
    }
    int _1124 = _1118;
    float _1126 = fma(_1076, -2.0, _1070);
    float _1128 = sqrt(_1106);
    bool _1130 = _1028 == 0.0;
    bool _1132 = !_1116;
    bool _1134 = _1130 && _1132;
    float _1136 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1052);
    if (_724)
    {
        float _1138 = _888 ? as_type<float>(_1088) : _972;
        _970 = _1138;
    }
    float _1140 = _970;
    float _1142 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1002);
    if (!_730)
    {
        _1098 = _972;
    }
    float _1144 = _1098;
    float _1146 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1050);
    float _1148 = _1144;
    if (!_736)
    {
        _1080 = _972;
    }
    float _1150 = _1080;
    float _1152 = -_160;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1066);
    bool _1156 = _1032 == 0.0;
    bool _1158 = _1156 && _1134;
    float _1160 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1126);
    float _1162 = _1150;
    if (_730)
    {
        float _1164 = _784 ? as_type<float>(_1104) : _972;
        _1148 = _1164;
    }
    float _1166 = _1148;
    float _1168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_736)
    {
        float _1170 = _834 ? as_type<float>(_1124) : _972;
        _1162 = _1170;
    }
    float _1172 = _1162;
    float _1174 = -_160;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[76].x, _770);
    float _1178 = _980 * _1128;
    float _1180 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1182 = -_1160;
    float _1184 = fma(_1142, _1026, _1182);
    float _1186 = fma(_748, _1140, -0.5);
    float _1188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1030);
    float _1190 = _706 * _1178;
    float _1192 = _702 * _1178;
    float _1194 = _1180 * _1178;
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1028);
    float _1198 = _1190 * _1188;
    float _1200 = _1188;
    if (_1158)
    {
        _1200 = _1092;
    }
    float _1202 = _1200;
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1032);
    float _1206 = _1192 * _1196;
    float _1208 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1210 = _1202;
    float _1212 = _1208;
    if (_1158)
    {
        _794 = _1202;
    }
    float _1214 = _794;
    float _1216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1218 = _1214;
    if (!_1158)
    {
        _1210 = _1092;
    }
    float _1220 = _1210;
    float _1222 = _1194 * _1204;
    float _1224 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1226 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1208);
    float _1228 = _1226;
    if (_1158)
    {
        _1212 = _1094;
    }
    float _1230 = _1212;
    float _1232 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1234 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1224);
    float _1236 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1226);
    float _1238 = _1230;
    if (_1158)
    {
        _1228 = _1230;
    }
    float _1240 = _1228;
    float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1244 = _1240;
    if (!_1158)
    {
        _1238 = _1094;
    }
    float _1246 = _1238;
    float _1248 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1234);
    float _1250 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1252 = fma(_956, _1034, _1136);
    float _1254 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1256 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1258 = _864 + _1250;
    if (!_1158)
    {
        float _1260 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1246);
        _1244 = _1260;
    }
    float _1262 = _1244;
    float _1264 = fma(_1254, _1166, -0.5);
    float _1266 = _850 + _1256;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1270 = _1258 + _1268;
    float _1272 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1232);
    float _1274 = _1266;
    if (!_1158)
    {
        float _1276 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1220);
        _1218 = _1276;
    }
    float _1278 = _1218;
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1282 = _1266 + _1280;
    float _1284 = _1270 * _1270;
    float _1286 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1158)
    {
        _516 = _1090;
    }
    float _1288 = _516;
    float _1290 = _926 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1292 = fma(_1282, _1282, _1284);
    float _1294 = _1288;
    if (!_1158)
    {
        float _1296 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1090);
        _1294 = _1296;
    }
    float _1298 = _1294;
    float _1300 = _776 * _1246;
    float _1302 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1272);
    float _1304 = sqrt(_1292);
    float _1306 = _1286 * _1216;
    float _1308 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1310 = _778 * _1090;
    float _1312 = -_1300;
    float _1314 = fma(_778, _1220, _1312);
    float _1316 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1252);
    float _1318 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1308);
    float _1320 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1322 = _774 * _1220;
    float _1324 = _1290 * _1242;
    float _1326 = -_1310;
    float _1328 = fma(_774, _1246, _1326);
    float _1330 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1332 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1334 = _852 + _1320;
    float _1336 = -_1322;
    float _1338 = fma(_776, _1090, _1336);
    bool _1340 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1330);
    float _1344 = fma(_826, _1186, _1176);
    float _1346 = fma(_1146, _1264, _1154);
    out.m_81.x = _1306;
    out.m_81.y = _1324;
    float _1348 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1332);
    float _1350 = _1332;
    float _1352 = _1324;
    if (!_1340)
    {
        _1350 = _1258;
    }
    float _1354 = _1350;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1358 = _1354;
    if (!_1340)
    {
        _1352 = _1334;
    }
    float _1360 = _1352;
    bool _1362 = !_1340;
    float _1364 = _1360;
    if (!_1362)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1370 = _1304 + _1368;
        float _1372 = _1334 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = rsqrt(_1292);
        float _1376 = _1370 * _1366;
        float _1378 = _1376 * 0.15915493667125701904296875;
        float _1380 = _1378 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = _1378 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = _1382 + (-1.0);
        float _1390 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = fma(_1386, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1394 = fma(_1334, _1382, _1390);
        float _1396 = _1374 * _1392;
        float _1398 = fma(_1282, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1400 = fma(_1270, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1364 = _1394;
        _1274 = _1398;
        _1358 = _1400;
    }
    float _1402 = _1364;
    float _1404 = _1274;
    float _1406 = _1358;
    float _1408 = -_1046;
    float _1410 = _1408 + _1402;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1416 = -_1048;
    float _1418 = _1416 + _1404;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1422 = _1410 + _1420;
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1430 = _1418 + _1428;
    float _1432 = _1422 * _1422;
    float _1434 = _1328 * _780;
    float _1436 = _1314 * _780;
    float _1438 = _1338 * _780;
    float _1440 = -_1062;
    float _1442 = _1440 + _1406;
    float _1444 = fma(_1430, _1430, _1432);
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1448 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1450 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1454 = _1442 + _1452;
    float _1456 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1458 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1446);
    float _1462 = fma(_1454, _1454, _1444);
    float _1464 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1448);
    float _1466 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1450);
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1460);
    out.m_83.x = _1456;
    out.m_83.y = _1424;
    out.m_83.z = _1426;
    out.m_83.w = _1458;
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1464);
    float _1472 = sqrt(_1462);
    float _1474 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1476 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1318);
    float _1478 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1342);
    float _1480 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1348);
    out.m_85.w = _1004;
    float _1482 = -_1048;
    float _1484 = _850 + _1482;
    float _1486 = -_1046;
    float _1488 = _852 + _1486;
    out.m_87.x = _1468;
    out.m_87.y = _1470;
    out.m_87.z = _1474;
    float _1490 = -_1062;
    float _1492 = _864 + _1490;
    float _1494 = _1008 + 0.5;
    float _1496 = _1184 + 0.5;
    float _1498 = _1346 + 0.5;
    float _1500 = _1344 + 0.5;
    out.m_89.x = _1192;
    bool _1502 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1504 = isnan(_1472);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1510 = _1506 || _1508;
    out.m_91.x = _1500;
    out.m_91.y = _1494;
    out.m_91.z = _1498;
    out.m_91.w = _1496;
    out.m_93.x = _1476;
    out.m_93.y = _1478;
    out.m_93.z = _1480;
    float _1512 = _1498;
    if (!_1510)
    {
        _884 = 1.0;
    }
    float _1514 = _884;
    bool _1516 = !_1510;
    float _1518 = _1514;
    if (!_1516)
    {
        bool _1520 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1522 = isnan(_1472);
        bool _1524 = _1520 || _1522;
        bool _1526 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1528 = _1524 || _1526;
        if (!_1528)
        {
            float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1532 = _1472 + _1530;
            float _1534 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1536 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1534;
            float _1538 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1540 = _1538 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1542 = 1.0 / _1536;
            float _1544 = _1532 * _1542;
            float _1546 = fma(_1544, _1540, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1518 = _1546;
            _1548 = true;
        }
        else
        {
            bool _1550 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1552 = isnan(_1472);
            bool _1554 = _1550 || _1552;
            bool _1556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1558 = _1554 || _1556;
            if (!_1558)
            {
                float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1562 = _1472 + _1560;
                float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1570 = _1568 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1572 = 1.0 / _1566;
                float _1574 = _1562 * _1572;
                float _1576 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1518 = _1576;
                _1548 = true;
            }
            else
            {
                _1518 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1548 = false;
    float _1578 = _1518;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1582 = _1410 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1586 = _1418 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1590 = _1442 + _1588;
    float _1592 = fma(_1582, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1594 = fma(_1586, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1596 = fma(_1590, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1598 = -_1488;
    float _1600 = _1598 + _1592;
    float _1602 = -_1484;
    float _1604 = _1602 + _1594;
    float _1606 = -_1492;
    float _1608 = _1606 + _1596;
    float _1610 = _1600 * _1600;
    float _1612 = fma(_1604, _1604, _1610);
    float _1614 = fma(_1608, _1608, _1612);
    float _1616 = sqrt(_1614);
    bool _1618 = _1616 > 0.0;
    float _1620 = _1616;
    float _1622 = _1586;
    float _1624 = _1596;
    if (!_1618)
    {
        _1620 = _1594;
    }
    float _1626 = _1620;
    float _1628 = _1626;
    if (!_1618)
    {
        _1622 = _1592;
    }
    float _1630 = _1622;
    float _1632 = _1630;
    float _1634 = _1630;
    if (!_1618)
    {
        _1512 = _1596;
    }
    float _1636 = _1512;
    bool _1638 = !_1618;
    float _1640 = _1636;
    float _1642 = _1636;
    if (!_1638)
    {
        float _1644 = _220 * _220;
        float _1646 = rsqrt(_1614);
        float _1648 = fma(_218, _218, _1644);
        float _1650 = fma(_222, _222, _1648);
        float _1652 = sqrt(_1650);
        float _1654 = _1604 * _1646;
        float _1656 = _1600 * _1646;
        float _1658 = _1608 * _1646;
        bool _1660 = _1652 > 0.0;
        float _1662 = _1652;
        if (!_1660)
        {
            _1662 = _1594;
        }
        float _1664 = _1662;
        _1628 = _1664;
        if (!_1660)
        {
            _1632 = _1592;
        }
        float _1666 = _1632;
        _1634 = _1666;
        if (!_1660)
        {
            _1640 = _1596;
        }
        float _1668 = _1640;
        bool _1670 = !_1660;
        _1642 = _1668;
        if (!_1670)
        {
            float _1672 = rsqrt(_1650);
            float _1674 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1676 = _220 * _1672;
            float _1678 = _218 * _1672;
            float _1680 = _222 * _1672;
            float _1682 = _1656 * _1676;
            float _1684 = fma(_1654, _1678, _1682);
            float _1686 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1688 = fma(_1658, _1680, _1684);
            float _1690 = _1688 * _1686;
            float _1692 = fma(_218, _1690, _1594);
            float _1694 = fma(_220, _1690, _1592);
            float _1696 = fma(_222, _1690, _1596);
            _1634 = _1694;
            _1628 = _1692;
            _1642 = _1696;
        }
    }
    float _1698 = _1634;
    float _1700 = _1628;
    float _1702 = _1642;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1706 = _1698 + _1704;
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1710 = _1700 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1714 = _1702 + _1712;
    float _1716 = _1706 * _1706;
    float _1718 = fma(_1710, _1710, _1716);
    float _1720 = fma(_1714, _1714, _1718);
    float _1722 = rsqrt(_1720);
    float _1724 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1726 = _1710 * _1724;
    float _1728 = _1714 * _1724;
    float _1730 = _1726 * _1726;
    float _1732 = _1728 * _1728;
    float _1734 = _1730 + _1732;
    float _1736 = sqrt(_1734);
    bool _1738 = _1736 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1742 = _1736 + _1740;
    float _1744 = _1714;
    float _1746 = _1742;
    float _1748 = _1706;
    if (_1738)
    {
        float _1750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1750;
    }
    float _1752 = _1744;
    if (_1738)
    {
        float _1754 = rsqrt(_1734);
        _226 = _1754;
    }
    float _1756 = _226;
    float _1758 = _1756;
    if (_1738)
    {
        float _1760 = _1742 * _1752;
        _1746 = _1760;
    }
    float _1762 = _1746;
    if (_1738)
    {
        float _1764 = _1762 * 0.15915493667125701904296875;
        _1624 = _1764;
    }
    float _1766 = _1624;
    float _1768 = _1716;
    if (_1738)
    {
        float _1770 = _1766 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        _1768 = _1772;
    }
    float _1774 = _1768;
    float _1776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1778 = precise::max(0.0, _1776);
    float _1780 = _1722;
    float _1782 = _1776;
    float _1784 = _1778;
    if (_1738)
    {
        float _1786 = _1766 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        _1780 = _1788;
    }
    float _1790 = _1780;
    float _1792 = -_1724;
    float _1794 = -_1778;
    float _1796 = fma(_1706, _1792, _1794);
    float _1798 = _1796;
    if (_1738)
    {
        float _1800 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1800;
    }
    float _1802 = _1782;
    float _1804 = _1802;
    float _1806 = _1774;
    if (_1738)
    {
        float _1808 = fma(_1774, _1802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1804 = _1808;
    }
    float _1810 = _1804;
    if (!_1738)
    {
        _1806 = _1730;
    }
    float _1812 = _1806;
    float _1814 = _1790;
    float _1816 = _1812;
    if (_1738)
    {
        float _1818 = _1790 + (-1.0);
        _1748 = _1818;
    }
    float _1820 = _1748;
    if (_1738)
    {
        float _1822 = _1756 * _1810;
        _1082 = _1822;
    }
    float _1824 = _1082;
    if (!_1738)
    {
        _1758 = _1726;
    }
    float _1826 = _1758;
    float _1828 = sqrt(_1720);
    float _1830 = _1826;
    if (_1738)
    {
        float _1832 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1832;
    }
    float _1834 = _1784;
    if (_1738)
    {
        float _1836 = _1726 * _1824;
        _1830 = _1836;
    }
    float _1838 = _1830;
    float _1840 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1738)
    {
        float _1842 = fma(_1796, _1790, _1834);
        _1798 = _1842;
    }
    float _1844 = _1798;
    if (!_1738)
    {
        _1814 = _1728;
    }
    float _1846 = _1814;
    float _1848 = _1846;
    if (_1738)
    {
        float _1850 = _1728 * _1824;
        _1848 = _1850;
    }
    float _1852 = _1848;
    if (_1738)
    {
        float _1854 = _1838 * _1838;
        _1816 = _1854;
    }
    float _1856 = _1816;
    float _1858 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1738)
    {
        _1840 = _1732;
    }
    float _1860 = _1840;
    float _1862 = _1860;
    if (_1738)
    {
        float _1864 = _1852 * _1852;
        _1862 = _1864;
    }
    float _1866 = _1862;
    float _1868 = fma(_1844, _1844, _1856);
    float _1870 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1872 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1874 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1876 = _1868 + _1866;
    float _1878 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1870);
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1882 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1880);
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = rsqrt(_1876);
    float _1888 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1878);
    float _1890 = -_1884;
    float _1892 = _1890 + 1.0;
    float _1894 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1874);
    float _1896 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1900 = abs(_1892);
    float _1902 = log2(_1900);
    float _1904 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1906 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1908 = -_1904;
    float _1910 = fma(_1908, _1896, 1.0);
    float _1912 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1914 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1906);
    float _1916 = _1886 * _1838;
    float _1918 = floor(_1858);
    float _1920 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1912);
    float _1922 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1914);
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1926 = _1886 * _1844;
    float _1928 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1920);
    float _1930 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1932 = _1886 * _1852;
    float _1934 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1894);
    float _1936 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1938 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1940 = floor(_1872);
    float _1942 = -_1924;
    float _1944 = fma(_1926, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1942);
    float _1946 = _1934 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1948 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1938);
    float _1950 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1952 = -_1932;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1944);
    float _1956 = -_1918;
    float _1958 = _1858 + _1956;
    float _1960 = log2(_1910);
    float _1962 = fma(_1954, -0.5, 0.5);
    float _1964 = fma(_1954, 0.5, 0.5);
    float _1966 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1968 = fma(_1964, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1970 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1966);
    float _1972 = exp2(_1950);
    float _1974 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1948);
    float _1976 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1978 = -_1940;
    float _1980 = _1872 + _1978;
    float _1982 = fma(_1964, _1968, -0.212114393711090087890625);
    float _1984 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1974);
    float _1986 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1976);
    float _1988 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1970);
    float _1990 = sqrt(_1962);
    float _1992 = _1960 * 0.693147182464599609375;
    float _1994 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1986);
    float _1996 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1988);
    float2 _5801 = float2(_1958, _1980);
    float _1998 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5801, float2(0.0), isnan(_5801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5801, float2(0.0), isnan(_5801)), level(0.0)).x;
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2002 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1994);
    float _2004 = fma(_1964, _1982, 1.570728778839111328125);
    float _2006 = 1.0 / _1984;
    float _2008 = _1926 + 1.0;
    float _2010 = -_1926;
    float _2012 = fma(_1972, _2008, _2010);
    float _2014 = _1990 * 0.636619746685028076171875;
    float _2016 = fma(_2012, 0.5, 0.5);
    float _2018 = -_2004;
    float _2020 = fma(_2014, _2018, 1.0);
    float _2022 = _2002 * _2006;
    float _2024 = _1996 * _2006;
    float _2026 = fma(_2022, 0.5, 0.5);
    float _2028 = fma(_2024, -0.5, 0.5);
    float3 _5855 = float3(_2026, _2028, _2000);
    float _2030 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5855, float3(0.0), isnan(_5855)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5855, float3(0.0), isnan(_5855)), level(0.0)).x;
    float3 _5866 = float3(_2026, _2028, _2000);
    float4 _2033 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5866, float3(0.0), isnan(_5866)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5866, float3(0.0), isnan(_5866)), level(0.0)).xyzw;
    float _2035 = _2033.x;
    float _2037 = _2033.y;
    float _2039 = _2033.z;
    float _2041 = _2033.w;
    float2 _5882 = float2(_2020, _2016);
    float3 _2045 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5882, float2(0.0), isnan(_5882)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5882, float2(0.0), isnan(_5882)), level(0.0)).xyz;
    float _2047 = _2045.x;
    float _2049 = _2045.y;
    float _2051 = _2045.z;
    float _2053 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_95.x = _1484;
    out.m_95.y = _1488;
    out.m_95.z = _1492;
    float _2055 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2053);
    out.m_97.x = _1700;
    out.m_97.y = _1698;
    out.m_97.z = _1702;
    float _2057 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2055);
    float _2059 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2061 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2063 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2059);
    float _2065 = 1.0 / _2061;
    float _2067 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2063);
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2071 = _2069 + _2061;
    bool _2073 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2075 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2077 = _2073 || _2075;
    bool _2079 = isnan(0.5);
    bool _2081 = _2077 || _2079;
    float _2083 = _2071 * _2065;
    float _2085 = _2083 * 0.5;
    float _2087 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2089 = in.m_99.x;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2093 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2091);
    float _2095 = exp2(_2087);
    float _2097 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2099 = _1902;
    float _2101 = _1984;
    float _2103 = _1996;
    if (!_2081)
    {
        _2097 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2105 = _2097;
    if (_2081)
    {
        _2099 = 1.0;
    }
    float _2107 = _2099;
    float _2109 = 1.0 / _2093;
    float _2111 = -_2095;
    float _2113 = _2111 + 1.0;
    float _2115 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2117 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2119 = _2109 * _2117;
    float _2121 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2123 = abs(_2119);
    float _2125 = log2(_2123);
    float _2127 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2121);
    float _2129 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2127);
    float _2131 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2129);
    float _2133 = _2131 + _1984;
    out.gl_Position.x = _2002;
    out.gl_Position.y = _1996;
    out.gl_Position.z = _2131;
    out.gl_Position.w = _1984;
    float _2135 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2137 = _2133 * 0.5;
    float _2139 = exp2(_2135);
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = _2139;
    float _2147 = _2107;
    float _2149 = _2131;
    if (!_2081)
    {
        float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2153 = _2119 + _2151;
        _2145 = _2153;
    }
    float _2155 = _2145;
    float _2157 = fma(_2143, -2.0, 3.0);
    float _2159 = _2143 * _2143;
    float _2161 = _2159 * _2157;
    float _2163 = _2159;
    if (!_2081)
    {
        float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2167 = _2105 + _2165;
        _2163 = _2167;
    }
    float _2169 = _2163;
    float _2171 = -_2161;
    float _2173 = _2171 + 1.0;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2161);
    bool _2177 = _2119 <= 8000.0;
    bool _2179 = isnan(_2119);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(8000.0);
    bool _2185 = _2181 || _2183;
    float _2187 = float(_2185);
    float _2189 = _2020;
    if (!_2081)
    {
        float _2191 = 1.0 / _2169;
        _2189 = _2191;
    }
    float _2193 = _2189;
    float _2195 = _2002 + _1984;
    float _2197 = -_2115;
    float _2199 = _2197 + 1.0;
    float _2201 = _2187 * _2175;
    float _2203 = _2195 * 0.5;
    float _2205 = _1984 * 0.5;
    float _2207 = fma(_1996, -0.5, _2205);
    float _2209 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2211 = _2207;
    float _2213 = _2203;
    float _2215 = _2199;
    if (!_2081)
    {
        float _2217 = _2155 * _2193;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2147 = _2219;
    }
    float _2221 = _2147;
    bool _2223 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2225 = isnan(_1828);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2231 = _2227 || _2229;
    out.m_101.x = _2203;
    out.m_101.y = _2207;
    out.m_101.z = _2137;
    out.m_101.w = _1984;
    if (!_2231)
    {
        _2101 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2233 = _2101;
    float _2235 = _2221 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2237 = _2233;
    float _2239 = _2233;
    if (!_2231)
    {
        _2211 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2241 = _2211;
    float _2243 = _2241;
    float _2245 = _2241;
    if (!_2231)
    {
        _2213 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2247 = _2213;
    float _2249 = _2247;
    float _2251 = _2247;
    if (!_2231)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2253 = _2149;
    float _2255 = _2253;
    float _2257 = _2253;
    if (!_2231)
    {
        _2103 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2259 = _2103;
    float _2261 = -_1998;
    float _2263 = _2261 + 1.0;
    float _2265 = _2263 * _2209;
    float _2267 = precise::clamp(_2265, 0.0, 1.0);
    float _2269 = -_2267;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2273 = _2271 * _2089;
    float _2275 = _2273 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_103.x = _2275;
    float _2277 = _2115 * _2030;
    float _2279 = _2041 * _2199;
    float _2281 = _2259;
    float _2283 = _2259;
    if (!_2231)
    {
        _2215 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2285 = _2215;
    float _2287 = _2041 * _2277;
    float _2289 = _2051 * _2277;
    float _2291 = fma(_2047, _2287, _2035);
    float _2293 = fma(_2049, _2287, _2037);
    float _2295 = fma(_2041, _2289, _2039);
    out.m_105.x = _2291;
    out.m_105.y = _2293;
    out.m_105.z = _2295;
    out.m_105.w = _2279;
    bool _2297 = !_2231;
    float _2299 = _2285;
    float _2301 = _2285;
    if (!_2297)
    {
        bool _2303 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2305 = isnan(_1828);
        bool _2307 = _2303 || _2305;
        bool _2309 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2311 = _2307 || _2309;
        if (!_2311)
        {
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2315 = _1828 + _2313;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2319 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2317;
            float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2325 = 1.0 / _2319;
            float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2329 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2333 = _2331 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2343 = _2315 * _2325;
            float _2345 = precise::clamp(_2343, 0.0, 1.0);
            float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2351 = fma(_2345, _2323, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2353 = fma(_2345, _2349, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2355 = fma(_2345, _2329, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2357 = fma(_2345, _2333, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2359 = fma(_2345, _2337, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2361 = fma(_2345, _2341, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2251 = _2355;
            _2283 = _2359;
            _2245 = _2351;
            _2257 = _2357;
            _2239 = _2353;
            _2301 = _2361;
            _2363 = true;
        }
        else
        {
            bool _2365 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2367 = isnan(_1828);
            bool _2369 = _2365 || _2367;
            bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2373 = _2369 || _2371;
            if (!_2373)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2375 = _2243;
            _2245 = _2375;
            if (!_2373)
            {
                _2249 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2377 = _2249;
            _2251 = _2377;
            if (!_2373)
            {
                _2237 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2379 = _2237;
            _2239 = _2379;
            if (!_2373)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2381 = _2255;
            _2257 = _2381;
            if (!_2373)
            {
                _2281 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2383 = _2281;
            _2283 = _2383;
            if (!_2373)
            {
                _2299 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2385 = _2299;
            bool _2387 = !_2373;
            _2301 = _2385;
            if (!_2387)
            {
                bool _2389 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2391 = isnan(_1828);
                bool _2393 = _2389 || _2391;
                bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2397 = _2393 || _2395;
                if (!_2397)
                {
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2401 = _1828 + _2399;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2405 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2403;
                    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2411 = 1.0 / _2405;
                    float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2429 = _2401 * _2411;
                    float _2431 = precise::clamp(_2429, 0.0, 1.0);
                    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2437 = fma(_2431, _2409, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2439 = fma(_2431, _2435, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2441 = fma(_2431, _2415, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2443 = fma(_2431, _2419, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2445 = fma(_2431, _2423, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2447 = fma(_2431, _2427, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2251 = _2441;
                    _2283 = _2445;
                    _2245 = _2437;
                    _2257 = _2443;
                    _2239 = _2439;
                    _2301 = _2447;
                    _2363 = true;
                }
                else
                {
                    _2251 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2283 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2239 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2301 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2363 = false;
    float _2449 = _2251;
    float _2451 = _2283;
    float _2453 = _2245;
    float _2455 = _2257;
    float _2457 = _2239;
    float _2459 = _2301;
    float _2461 = _2235 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2463 = fma(_1478, -0.5, 0.5);
    float _2465 = precise::clamp(_2463, 0.0, 1.0);
    float _2467 = -_2449;
    float _2469 = _2467 + _2451;
    float _2471 = -_2453;
    float _2473 = _2471 + _2455;
    out.m_107.x = 0.0;
    float _2475 = fma(_2465, _2469, _2449);
    float _2477 = -_2457;
    float _2479 = _2477 + _2459;
    float _2481 = fma(_2465, _2473, _2453);
    float _2483 = _2475 * 0.586610972881317138671875;
    bool _2485 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2487 = fma(_2465, _2479, _2457);
    out.m_51.x = _2461;
    float _2489 = fma(_2481, 0.298911988735198974609375, _2483);
    bool _2491 = _2221 > 0.0;
    bool _2493 = isnan(_2221);
    bool _2495 = _2491 || _2493;
    bool _2497 = isnan(0.0);
    bool _2499 = _2495 || _2497;
    float _2501 = fma(_2487, 0.114477999508380889892578125, _2489);
    float _2503 = -_2501;
    float _2505 = _2481 + _2503;
    float _2507 = -_2501;
    float _2509 = _2475 + _2507;
    float _2511 = -_2501;
    float _2513 = _2487 + _2511;
    float _2515 = fma(_2505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2501);
    float _2517 = fma(_2509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2501);
    float _2519 = fma(_2513, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2501);
    bool _2521 = !_2485;
    if (!_2521)
    {
        float _2523 = -_1698;
        float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2527 = -_1700;
        float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2531 = -_1702;
        float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2535 = _2525 * _2525;
        float _2537 = fma(_2529, _2529, _2535);
        float _2539 = fma(_2533, _2533, _2537);
        float _2541 = sqrt(_2539);
        float _2543 = rsqrt(_2539);
        float _2545 = -_2541;
        float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2549 = _2547 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2551 = precise::clamp(_2549, 0.0, 1.0);
        float _2553 = _2529 * _2543;
        float _2555 = _2525 * _2543;
        float _2557 = abs(_2551);
        float _2559 = log2(_2557);
        float _2561 = _2533 * _2543;
        float _2563 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2565 = _1478 * _2555;
        float _2567 = -_2555;
        float _2569 = -_2563;
        float _2571 = fma(_2567, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2569);
        float _2573 = fma(_1476, _2553, _2565);
        float _2575 = -_2561;
        float _2577 = fma(_2575, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2571);
        float _2579 = fma(_1480, _2561, _2573);
        float _2581 = precise::clamp(_2579, 0.0, 1.0);
        float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2585 = _2577 + _2583;
        float _2587 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2589 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2591 = precise::clamp(_2589, 0.0, 1.0);
        float _2593 = exp2(_2587);
        float _2595 = _2593 * _2591;
        float _2597 = _2581 * _2595;
        float _2599 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2601 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2603 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2599;
        out.m_107.y = _2601;
        out.m_107.z = _2603;
    }
    out.m_85.x = _2515;
    out.m_85.y = _2517;
    out.m_85.z = _2519;
    if (_2499)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2605 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2605;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

