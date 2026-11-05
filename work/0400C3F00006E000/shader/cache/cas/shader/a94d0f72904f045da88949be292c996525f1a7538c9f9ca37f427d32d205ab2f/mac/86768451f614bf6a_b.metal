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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    texture2d<float> vp_t_tcb_20 [[id(12)]];
    sampler vp_t_tcb_20Smplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_111 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_99 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 m_109 [[user(locn15)]];
    float4 m_105 [[user(locn16)]];
    float4 m_107 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_87 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_93 [[attribute(8)]];
    float4 m_91 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_69 [[attribute(11)]];
    float4 m_95 [[attribute(12)]];
    float4 m_57 [[attribute(13)]];
    float4 m_77 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3962 = false;
    bool _742 = false;
    bool _538 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_46.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_49.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4261 = as_type<float>(_146);
        out.gl_Position.z = _4261;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.w;
    float _152 = in.m_53.x;
    float _154 = in.m_53.y;
    float _156 = in.m_53.z;
    bool _158 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _160 = isnan(_150);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _166 = _162 || _164;
    float _168 = -_150;
    float _170 = _168 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _152;
    out.m_55.y = _154;
    out.m_55.z = _156;
    float _172 = _170;
    if (_166)
    {
        float _174 = float(_130);
        _140 = _174;
    }
    float _176 = _140;
    bool _178 = _170 >= _176;
    bool _180 = !_166;
    bool _182 = _178 || _180;
    float _184 = _176;
    if (_182)
    {
        _184 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _186 = _184;
    if (_182)
    {
        out.m_49.x = 0.0;
    }
    if (_182)
    {
        float _188 = _186 * 5.0;
        _148 = as_type<int>(_188);
    }
    int _190 = _148;
    if (_182)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4343 = as_type<float>(_190);
        out.gl_Position.z = _4343;
    }
    if (_182)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _192 = in.m_57.x;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_57.y;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = in.m_63.x;
    float _212 = in.m_63.y;
    float _214 = in.m_63.z;
    float _216 = in.m_65.x;
    float _218 = in.m_65.y;
    float _220 = in.m_65.z;
    out.m_67.x = _192;
    out.m_67.y = _196;
    float _222 = _200 * _206;
    float _224 = _200 * _212;
    float _226 = fma(_198, _204, _222);
    float _228 = _200 * _218;
    float _230 = fma(_198, _210, _224);
    float _232 = fma(_202, _208, _226);
    float _234 = fma(_198, _216, _228);
    float _236 = fma(_202, _214, _230);
    float _238 = fma(_202, _220, _234);
    bool _240 = !_194;
    float _242 = _196;
    float _244 = _192;
    float _246 = _238;
    float _262;
    if (!_240)
    {
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _170);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_130);
        float _268 = 1.0 / _266;
        float _270 = _170 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _272 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _272 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = 1.0 / _288;
    float _304 = 1.0 / _296;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _308 = 1.0 / _300;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _272 + _310;
    float _314 = _276 * _302;
    bool _316 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _318 = isnan(_272);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _330 = isnan(_272);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = 1.0 / _292;
    float _342 = _280 * _304;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = fma(_346, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = _284 * _308;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_354, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _370 = -_366;
    float _372 = _370 + 1.0;
    float _374 = _312 * _340;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _376;
    float _380 = -_326;
    float _382 = _380 + 1.0;
    float _384 = fma(_378, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _386 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_272);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = _338 * _382;
    bool _400 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _402 = isnan(_272);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -_338;
    float _414 = _412 + 1.0;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = _396 * _372;
    float _422 = -_396;
    float _424 = _422 + 1.0;
    float _426 = _366 * _414;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _410 * _424;
    float _438 = fma(_418, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _440 = fma(_430, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _442 = fma(_434, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _444 = _384 * _436;
    float _446 = _348 * _436;
    float _448 = -_410;
    float _450 = _448 + 1.0;
    float _452 = _368 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _458;
    float _462 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[143].x, _444);
    float _464 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[143].y, _446);
    float _466 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_438, _420, _462);
    float _474 = fma(_440, _420, _464);
    float _476 = fma(_456, _314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _478 = fma(_460, _314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _480 = fma(_442, _420, _466);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = fma(_470, _314, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _496 = fma(_476, _426, _472);
    float _498 = fma(_484, _374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _500 = fma(_488, _374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _502 = fma(_478, _426, _474);
    float _504 = fma(_494, _374, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _506 = fma(_490, _426, _480);
    float _508 = fma(_498, _398, _496);
    float _510 = fma(_500, _398, _502);
    float _512 = fma(_504, _398, _506);
    float _514 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].x, _508);
    float _516 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].y, _510);
    float _518 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].z, _512);
    bool _520 = !_306;
    float _536;
    if (!_520)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _170);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_130);
        float _542 = 1.0 / _540;
        float _544 = _170 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _546 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _558 = isnan(_546);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _576 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_546);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = 1.0 / _554;
    float _590 = -_566;
    float _592 = _590 + 1.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    bool _598 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _600 = isnan(_546);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = _586 * _592;
    float _612 = -_586;
    float _614 = _612 + 1.0;
    float _616 = 1.0 / _570;
    bool _618 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _620 = _608 * _614;
    float _622 = -_608;
    float _624 = _622 + 1.0;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _628 = 1.0 / _574;
    float _630 = _596 * _588;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _638 = fma(_630, _550, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _640 = _634 * _616;
    bool _642 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _644 = isnan(_546);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _660 = _546 + _658;
    float _662 = _638 * _620;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _666 = _546 + _664;
    float _668 = -_652;
    float _670 = _668 + 1.0;
    float _672 = fma(_640, _660, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _674 = _656 * _628;
    float _676 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[115].x, _662);
    float _678 = _566 * _670;
    float _680 = fma(_674, _666, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _682 = fma(_672, _610, _676);
    float _684 = fma(_680, _678, _682);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[118].x, _684);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _700 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _712 = in.m_69.x;
    float _714 = in.m_69.y;
    float _716 = in.m_69.z;
    out.m_71.x = _700;
    out.m_71.y = _702;
    out.m_71.z = _704;
    out.m_71.w = _698;
    out.m_73.x = _706;
    out.m_73.y = _636;
    out.m_73.z = _708;
    out.m_73.w = _710;
    float _718 = _518 * _716;
    float _720 = _516 * _714;
    float _722 = _514 * _712;
    bool _724 = !_618;
    float _740;
    if (!_724)
    {
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _170);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_130);
        float _746 = 1.0 / _744;
        float _748 = _170 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _754 = int(_752);
    float _756 = float(_130);
    float _758 = _156 * 2.0;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _762 = _750 + _760;
    float _764 = in.m_65.w;
    float _766 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _768 = int(_766);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _778 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _780 = isnan(_750);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = float(_754);
    float _792 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _794 = int(_792);
    float _796 = -_788;
    float _798 = _796 + 1.0;
    bool _800 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _802 = isnan(_750);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _812;
    float _816 = float(_768);
    float _818 = 1.0 / _790;
    bool _820 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _822 = isnan(_750);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _832;
    bool _836 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _838 = isnan(_750);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _850 = int(_848);
    float _852 = float(uint(_794));
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _856 = float(_794);
    float _858 = 1.0 / _816;
    float _860 = _818 * _170;
    float _862 = float(uint(_850));
    float _864 = 1.0 / _852;
    int _866 = ~_850;
    int _868 = _866 + 1;
    int _870 = ~_850;
    int _872 = _870 + 1;
    float _874 = _858 * _170;
    float _876 = trunc(_860);
    int _878 = int(_876);
    float _880 = 1.0 / _862;
    int _882 = as_type<int>(_864) + (-2);
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _886 = _884 != 0;
    float _888 = trunc(_874);
    int _890 = int(_888);
    float _892 = float(uint(_878));
    float _894 = as_type<float>(_882) * _892;
    int _896 = as_type<int>(_880) + (-2);
    float _898 = 1.0 / _756;
    int _900 = ~_794;
    int _902 = _900 + 1;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_886)
    {
        _904 = 1.0;
    }
    float _906 = _904;
    float _908 = _906;
    if (!_886)
    {
        _908 = 7.345489978790283203125;
    }
    float _910 = _908;
    float _912 = float(uint(_890));
    float _914 = trunc(_894);
    float _916 = precise::max(_914, 0.0);
    uint _919 = uint(_916);
    float _921 = as_type<float>(_896) * _912;
    float _923 = _910 * _152;
    float _925 = _910;
    if (_886)
    {
        _925 = _152;
    }
    float _927 = _925;
    float _929 = trunc(_921);
    float _931 = precise::max(_929, 0.0);
    uint _933 = uint(_931);
    float _935 = _927;
    if (!_886)
    {
        _935 = _154;
    }
    float _937 = _935;
    int _939 = _902 * int(_919);
    int _941 = _939 + _878;
    float _943 = floor(_758);
    float _945 = float(uint(_941));
    int _947 = _868 * int(_933);
    int _949 = _947 + _890;
    float _951 = floor(_923);
    float _953 = as_type<float>(_882) * _945;
    float _955 = _945;
    if (_886)
    {
        _955 = 1.0;
    }
    float _957 = _955;
    float _959 = float(uint(_949));
    float _961 = _957;
    if (!_886)
    {
        _961 = 1.2345600128173828125;
    }
    float _963 = _961;
    float _965 = trunc(_953);
    float _967 = precise::max(_965, 0.0);
    uint _969 = uint(_967);
    float _971 = as_type<float>(_896) * _959;
    float _973 = _937 * _963;
    int _975 = ~_794;
    int _977 = _975 + 1;
    float _979 = float(_878);
    float _981 = trunc(_971);
    float _983 = precise::max(_981, 0.0);
    uint _985 = uint(_983);
    float _987 = floor(_973);
    int _989 = int(_919) + int(_969);
    float _991 = -_951;
    float _993 = _923 + _991;
    int _995 = ~_850;
    int _997 = _995 + 1;
    bool _999 = _979 >= _856;
    bool _1001 = isnan(_979);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(_856);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    int _1011 = _977 * _989;
    int _1013 = _1011 + _878;
    float _1015 = _856 * _993;
    int _1017 = int(_933) + int(_985);
    float _1019 = _898 * _170;
    float _1021 = trunc(_1009);
    int _1023 = int(_1021);
    bool _1025 = uint(_1013) >= uint(_794);
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1029 = _1027 != 0;
    float _1031 = -_987;
    float _1033 = _973 + _1031;
    int _1035 = _997 * _1017;
    int _1037 = _1035 + _890;
    bool _1039 = !_1025;
    int _1041 = _1039 ? 0 : (-1);
    float _1043 = trunc(_1015);
    int _1045 = int(_1043);
    float _1047 = float(_850);
    float _1049 = float(_890);
    bool _1051 = uint(_1037) >= uint(_850);
    float _1053 = _1047 * _1033;
    bool _1055 = _1049 >= _1047;
    bool _1057 = isnan(_1049);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan(_1047);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = _856 * _1019;
    int _1069 = ~_989;
    int _1071 = _1069 + _1041;
    int _1073 = _1071 + 1;
    float _1075 = _1047 * _1019;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1079 = _1077 != 0;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1083 = _1081 != 0;
    float _1085 = trunc(_1065);
    int _1087 = int(_1085);
    bool _1089 = !_1051;
    int _1091 = _1089 ? 0 : (-1);
    int _1093 = _794 * _1073;
    int _1095 = _1093 + _878;
    bool _1097 = !_1029;
    int _1099 = _1097 ? 0 : 1;
    int _1101 = ~_1017;
    int _1103 = _1101 + _1091;
    int _1105 = _1103 + 1;
    int _1107 = abs(_1099);
    float _1109 = trunc(_1053);
    int _1111 = int(_1109);
    bool _1113 = !_1083;
    int _1115 = _1113 ? 0 : 1;
    int _1117 = _850 * _1105;
    int _1119 = _1117 + _890;
    bool _1121 = _794 == 0;
    int _1123 = _1045 * _1107;
    int _1125 = _1123 + _878;
    int _1127 = ~_1023;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    bool _1133 = !_1121;
    int _1135 = _1133 ? _1095 : (-1);
    float _1137 = 1.0 / _772;
    int _1139 = abs(_1115);
    int _1141 = _794 + (-1);
    int _1143 = _1131 * _1135;
    bool _1145 = _850 == 0;
    bool _1147 = !_1079;
    int _1149 = _1147 ? 0 : 1;
    float _1151 = trunc(_1067);
    int _1153 = int(_1151);
    int _1155 = _1023 * _1141;
    int _1157 = _1155 + _1143;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1161 = _1159 != 0;
    int _1163 = ~_1087;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    int _1169 = _1157 * _1139;
    bool _1171 = !_1145;
    int _1173 = _1171 ? _1119 : (-1);
    int _1175 = abs(_1149);
    float _1177 = 1.0 / _776;
    bool _1179 = !_1161;
    int _1181 = _1179 ? 0 : 1;
    int _1183 = _1167 * _1173;
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1187 = _1185 != 0;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1195 = _1193 != 0;
    int _1197 = _850 + (-1);
    int _1199 = _1153 * _1175;
    int _1201 = _1199 + _1169;
    int _1203 = abs(_1181);
    float _1205 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1207 = log2(_1205);
    bool _1209 = !_1191;
    int _1211 = _1209 ? 0 : 1;
    int _1213 = _1087 * _1197;
    int _1215 = _1213 + _1183;
    bool _1217 = !_1195;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = _1125 * _1203;
    int _1223 = _1221 + _1201;
    int _1225 = abs(_1211);
    int _1227 = abs(_1219);
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1231 = _1229 != 0;
    int _1233 = _1215 * _1225;
    float _1235 = trunc(_1075);
    int _1237 = int(_1235);
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1245 = _1243 != 0;
    bool _1247 = !_1231;
    int _1249 = _1247 ? 0 : 1;
    int _1251 = _1045 * _1227;
    int _1253 = _1251 + _1223;
    bool _1255 = !_1187;
    int _1257 = _1255 ? 0 : 1;
    float _1259 = _1207 * _170;
    int _1261 = abs(_1249);
    float _1263 = -_846;
    float _1265 = _1263 + 1.0;
    bool _1267 = !_1241;
    int _1269 = _1267 ? 0 : 1;
    float _1271 = in.m_75.y;
    int _1273 = abs(_1257);
    int _1275 = abs(_1269);
    int _1277 = _1237 * _1273;
    int _1279 = _1277 + _1233;
    float _1281 = float(uint(_1253));
    int _1283 = _1111 * _1261;
    int _1285 = _1283 + _890;
    bool _1287 = !_1245;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = as_type<float>(_882) * _1281;
    int _1293 = abs(_1289);
    int _1295 = ~_850;
    int _1297 = _1295 + 1;
    int _1299 = _1285 * _1275;
    int _1301 = _1299 + _1279;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1305 = _1303 != 0;
    float _1307 = trunc(_1291);
    float _1309 = precise::max(_1307, 0.0);
    uint _1311 = uint(_1309);
    int _1313 = ~_850;
    int _1315 = _1313 + 1;
    int _1317 = _1111 * _1293;
    int _1319 = _1317 + _1301;
    int _1321 = ~_794;
    int _1323 = _1321 + 1;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1327 = _1325 != 0;
    float _1329 = float(uint(_1319));
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1333 = _1331 != 0;
    float _1335 = as_type<float>(_896) * _1329;
    int _1337 = _1275;
    bool _1339 = _1187;
    if (_1305)
    {
        float _1341 = -_192;
        float _1343 = _1341 + 1.0;
        _1337 = as_type<int>(_1343);
    }
    int _1345 = _1337;
    if (_1305)
    {
        bool _1347 = _152 > 0.5;
        _1339 = _1347;
    }
    bool _1349 = _1339;
    int _1351 = _1323 * int(_1311);
    int _1353 = _1351 + _1253;
    float _1355 = trunc(_1335);
    float _1357 = precise::max(_1355, 0.0);
    uint _1359 = uint(_1357);
    float _1361 = float(uint(_1353));
    float _1363 = as_type<float>(_882) * _1361;
    int _1365 = ~_794;
    int _1367 = _1365 + 1;
    float _1369 = trunc(_1363);
    float _1371 = precise::max(_1369, 0.0);
    uint _1373 = uint(_1371);
    int _1375 = _1297 * int(_1359);
    int _1377 = _1375 + _1319;
    float _1379 = float(uint(_1377));
    float _1381 = as_type<float>(_896) * _1379;
    int _1383 = int(_1311) + int(_1373);
    float _1385 = as_type<float>(_1373);
    if (!_1305)
    {
        _1385 = _192;
    }
    float _1387 = _1385;
    float _1389 = trunc(_1381);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    float _1395 = _1387;
    if (_1305)
    {
        float _1397 = _1349 ? as_type<float>(_1345) : _192;
        _1395 = _1397;
    }
    float _1399 = _1395;
    int _1401 = _1367 * _1383;
    int _1403 = _1401 + _1253;
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1407 = _1405 != 0;
    bool _1409 = _154 > 0.5;
    bool _1411 = uint(_1403) >= uint(_794);
    float _1413 = in.m_46.x;
    float _1415 = in.m_46.y;
    float _1417 = in.m_46.z;
    bool _1419 = !_1411;
    int _1421 = _1419 ? 0 : (-1);
    bool _1423 = _156 > 0.5;
    int _1425 = int(_1359) + int(_1393);
    int _1427 = ~_1383;
    int _1429 = _1427 + _1421;
    int _1431 = _1429 + 1;
    float _1433 = -_196;
    float _1435 = _1433 + 1.0;
    float _1437 = in.m_77.w;
    int _1439 = _1315 * _1425;
    int _1441 = _1439 + _1319;
    float _1443 = _152 * 2.0;
    int _1445 = _794 * _1431;
    int _1447 = _1445 + _1253;
    int _1449 = _1409 ? as_type<int>(_1435) : as_type<int>(_196);
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1453 = _1451 != 0;
    float _1455 = _1327 ? as_type<float>(_1449) : _196;
    float _1457 = floor(_1443);
    if (_1407)
    {
        float _1459 = _1423 ? _1435 : _196;
        _242 = _1459;
    }
    float _1461 = _242;
    float _1463 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1465 = uint(_1441) >= uint(_850);
    float _1467 = _212 * _1415;
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1471 = _1469 != 0;
    float _1473 = _1415 + _1271;
    bool _1475 = !_1465;
    int _1477 = _1475 ? 0 : (-1);
    float _1479 = fma(_210, _1413, _1467);
    bool _1481 = _154 > 0.5;
    bool _1483 = _1481 && _1333;
    float _1485 = _218 * _1415;
    int _1487 = ~_1425;
    int _1489 = _1487 + _1477;
    int _1491 = _1489 + 1;
    float _1493 = _154 * 2.0;
    float _1495 = float(uint(_1125));
    float _1497 = fma(_216, _1413, _1485);
    bool _1499 = !_1121;
    int _1501 = _1499 ? _1447 : (-1);
    int _1503 = _850 * _1491;
    int _1505 = _1503 + _1319;
    float _1507 = _1415;
    if (!_1333)
    {
        _1507 = _192;
    }
    float _1509 = _1507;
    float _1511 = as_type<float>(_882) * _1495;
    int _1513 = _1501 & 3;
    out.m_79.w = _1437;
    bool _1515 = !_1145;
    int _1517 = _1515 ? _1505 : (-1);
    float _1519 = _1509;
    if (_1483)
    {
        float _1521 = -_192;
        float _1523 = _1521 + 1.0;
        _244 = _1523;
    }
    float _1525 = _244;
    float _1527 = trunc(_1511);
    float _1529 = precise::max(_1527, 0.0);
    uint _1531 = uint(_1529);
    bool _1533 = _1513 != 3;
    float _1535 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1537 = uint(_1513) >= 2u;
    if (_1333)
    {
        _1519 = _1525;
    }
    float _1539 = _1519;
    int _1541 = ~_794;
    int _1543 = _1541 + 1;
    float _1545 = floor(_1493);
    int _1547 = _1517 & 3;
    int _1549 = _1537 ? 0 : 1;
    bool _1551 = uint(_1547) >= 2u;
    bool _1553 = uint(_1513) > 1u;
    int _1555 = _1543 * int(_1531);
    int _1557 = _1555 + _1125;
    int _1559 = _1551 ? 0 : 1;
    bool _1561 = _1547 != 3;
    int _1563 = ~_1549;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = _1567;
    if (_1533)
    {
        int _1571 = ~_1549;
        int _1573 = _1571 + 1;
        _1569 = _1573;
    }
    int _1575 = _1569;
    int _1577 = _1501 & 3;
    bool _1579 = _1577 != 0;
    float _1581 = float(uint(_1557));
    int _1583 = ~_1559;
    int _1585 = _1583 + 1;
    int _1587 = _1585 + 1;
    int _1589 = _1579 ? 0 : 1;
    float _1591 = as_type<float>(_882) * _1581;
    int _1593 = _1587;
    if (_1561)
    {
        int _1595 = ~_1559;
        int _1597 = _1595 + 1;
        _1593 = _1597;
    }
    int _1599 = _1593;
    float _1601 = _152 + _154;
    float _1603 = float(uint(_1285));
    float _1605 = trunc(_1591);
    float _1607 = precise::max(_1605, 0.0);
    uint _1609 = uint(_1607);
    int _1611 = ~_1589;
    int _1613 = _1611 + 1;
    int _1615 = _1613 + 1;
    float _1617 = _1601 + (-1.0);
    int _1619 = _1615;
    if (!_1553)
    {
        int _1621 = ~_1589;
        int _1623 = _1621 + 1;
        _1619 = _1623;
    }
    int _1625 = _1619;
    float _1627 = as_type<float>(_896) * _1603;
    float _1629 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1631 = trunc(_1627);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    bool _1637 = uint(_1547) > 1u;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1641 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1645 = _1517 & 3;
    bool _1647 = _1645 != 0;
    float _1649 = -_1639;
    float _1651 = fma(_1463, 2.0, _1649);
    float _1653 = fma(_1641, -2.0, _1643);
    int _1655 = _1647 ? 0 : 1;
    float _1657 = _154 + _156;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1659;
    int _1663 = ~_1655;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    float _1669 = _1657 + (-1.0);
    int _1671 = _1667;
    if (!_1637)
    {
        int _1673 = ~_1655;
        int _1675 = _1673 + 1;
        _1671 = _1675;
    }
    int _1677 = _1671;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1683 = int(_1531) + int(_1609);
    float _1685 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1687 = ~_794;
    int _1689 = _1687 + 1;
    int _1691 = _872 * int(_1635);
    int _1693 = _1691 + _1285;
    bool _1695 = !_1453;
    int _1697 = _1695 ? 0 : 1;
    float _1699 = 1.0 / _1661;
    bool _1701 = _1457 > 0.0;
    int _1703 = _1689 * _1683;
    int _1705 = _1703 + _1125;
    bool _1707 = _1457 >= 0.0;
    bool _1709 = isnan(_1457);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan(0.0);
    bool _1715 = _1711 || _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1717;
    float _1721 = float(uint(_1693));
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1727 = !_1471;
    int _1729 = _1727 ? 0 : 1;
    float _1731 = 1.0 / _1681;
    int _1733 = _1715 ? 0 : 1;
    float _1735 = as_type<float>(_896) * _1721;
    bool _1737 = uint(_1705) >= uint(_794);
    float _1739 = fma(_220, _1417, _1497);
    bool _1741 = _1545 >= 0.0;
    bool _1743 = isnan(_1545);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan(0.0);
    bool _1749 = _1745 || _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1753 = _750 + _1751;
    int _1755 = ~_1733;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = 1.0 / _1719;
    bool _1763 = !_1737;
    int _1765 = _1763 ? 0 : (-1);
    float _1767 = -_170;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1651);
    bool _1771 = _1545 > 0.0;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1775 = _750 + _1773;
    int _1777 = _1759;
    if (!_1701)
    {
        int _1779 = ~_1733;
        int _1781 = _1779 + 1;
        _1777 = _1781;
    }
    int _1783 = _1777;
    float _1785 = fma(_214, _1417, _1479);
    int _1787 = _1749 ? 0 : 1;
    float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1789;
    bool _1793 = _943 > 0.0;
    float _1795 = _1775 * _1699;
    bool _1797 = _943 >= 0.0;
    bool _1799 = isnan(_943);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1809 = _750 + _1807;
    float _1811 = trunc(_1735);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1819 = _750 + _1817;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1823 = _750 + _1821;
    float _1825 = _1809 * _1731;
    float _1827 = _1753 * _1761;
    float _1829 = _1819 * _1137;
    int _1831 = ~_850;
    int _1833 = _1831 + 1;
    float _1835 = _1823 * _1177;
    float _1837 = 1.0 / _1791;
    int _1839 = ~_1787;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = _1739 + _764;
    int _1847 = _1843;
    if (!_1771)
    {
        int _1849 = ~_1787;
        int _1851 = _1849 + 1;
        _1847 = _1851;
    }
    int _1853 = _1847;
    float _1855 = 1.0 / _1725;
    int _1857 = int(_1635) + int(_1815);
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1863 = _750 + _1861;
    int _1865 = _1833 * _1857;
    int _1867 = _1865 + _1285;
    float _1869 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1859);
    float _1871 = _762 * _1837;
    bool _1873 = uint(_1867) >= uint(_850);
    float _1875 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1869);
    float _1877 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1653);
    float _1879 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1881 = _1805 ? 0 : 1;
    float _1883 = _1863 * _1855;
    float _1885 = -_1877;
    float _1887 = fma(_1875, _1879, _1885);
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1891 = _1889 != 0;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1895 = _1893 != 0;
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1899 = _1897 != 0;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1905;
    float _1909 = fma(_1903, _1795, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1915;
    float _1919 = fma(_1907, _1795, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1925;
    float _1929 = fma(_1917, _1829, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1935 = fma(_1913, _1825, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1937 = fma(_1923, _1825, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1939 = fma(_1927, _1829, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1943 = _1941 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1945 = fma(_1933, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1947 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1955 = fma(_1943, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1957;
    bool _1961 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1963 = isnan(_750);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1969 = _1965 || _1967;
    float _1971 = float(_1969);
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _1977 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1979 = isnan(_750);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = fma(_1949, _1827, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1991 = fma(_1959, _1827, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1993 = fma(_1953, _1883, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1995 = fma(_1975, _1883, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1997 = -_1971;
    float _1999 = _1997 + 1.0;
    bool _2001 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2003 = isnan(_750);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1987;
    float _2015 = _2013 + 1.0;
    bool _2017 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2019 = isnan(_750);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    float _2029 = _1987 * _1999;
    int _2031 = abs(_1625);
    float _2033 = _2011 * _2015;
    float _2035 = -_2011;
    float _2037 = _2035 + 1.0;
    bool _2039 = !_1579;
    int _2041 = _2039 ? 0 : 1;
    float _2043 = in.m_63.w;
    int _2045 = abs(_1575);
    float _2047 = _788 * _2037;
    float _2049 = _810 * _798;
    float _2051 = -_810;
    float _2053 = _2051 + 1.0;
    float _2055 = fma(_814, _1871, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2057 = fma(_834, _1871, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2059 = -_830;
    float _2061 = _2059 + 1.0;
    float _2063 = _830 * _2053;
    float _2065 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _854);
    int _2067 = abs(_1599);
    float _2069 = _846 * _2061;
    float _2071 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2073 = _2027 * _1265;
    float _2075 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2065);
    float _2077 = -_2027;
    float _2079 = _2077 + 1.0;
    float _2081 = exp2(_1259);
    float _2083 = _1909 * _2073;
    float _2085 = _1919 * _2073;
    int _2087 = _1501 >> 31;
    float _2089 = fma(_2075, _2071, _1769);
    int _2091 = _2087 & 3;
    float _2093 = _1785 + _2043;
    int _2095 = ~_1881;
    int _2097 = _2095 + 1;
    int _2099 = _2097 + 1;
    float _2101 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2083);
    int _2103 = _2099;
    float _2105 = _2049;
    float _2107 = _2055;
    if (!_1793)
    {
        int _2109 = ~_1881;
        int _2111 = _2109 + 1;
        _2103 = _2111;
    }
    int _2113 = _2103;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2117 = 1.0 + _2115;
    int _2119 = _1517 >> 31;
    float _2121 = fma(_1935, _2069, _2101);
    int _2123 = _1501 + _2091;
    float _2125 = _1887 + 0.5;
    int _2127 = _2119 & 3;
    float _2129 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2085);
    float _2131 = _2089 + 0.5;
    float _2133 = -_2081;
    float _2135 = _2133 + 1.0;
    int _2137 = _1517 + _2127;
    float _2139 = fma(_1937, _2069, _2129);
    int _2141 = _2123 >> 2;
    out.m_81.x = _2131;
    out.m_81.y = _2125;
    int _2143 = _2137 >> 2;
    float _2145 = fma(_1939, _2063, _2139);
    int _2147 = _2141 << 4;
    int _2149 = _2147 + 368;
    float _2151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2153 = _2143 << 4;
    int _2155 = _2153 + 512;
    float _2157 = fma(_1929, _2063, _2121);
    uint _2159 = uint(int(uint(_2149) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[int(_2169)][_2171];
    bool _2175 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2177 = isnan(0.0);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2183 = _2179 || _2181;
    float _2185 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2187 = fma(_1945, _2049, _2157);
    bool _2189 = !_1647;
    int _2191 = _2189 ? 0 : 1;
    float _2193 = 1.0 / _2117;
    float _2195 = _2183 ? _2135 : 0.0;
    float _2197 = fma(_1989, _2047, _2187);
    uint _2199 = uint(int(uint(_2155) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[int(_2209)][_2211];
    bool _2215 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2217 = isnan(1.0);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2223 = _2219 || _2221;
    float _2225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2227 = _1473 + _2225;
    bool _2229 = _1513 != 3;
    float _2231 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2233 = _1845 + _2231;
    float _2235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2237 = _2185 * _2151;
    int _2239 = abs(_2191);
    int _2241 = _2149 + 8;
    uint _2243 = uint(int(uint(_2241) >> uint(2)));
    uint _2245 = uint(int(uint(int(_2243)) >> uint(2)));
    int _2247 = int(_2243) & 3;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[int(_2245)][_2247];
    int _2251 = int(_2243) + 1;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    int _2255 = _2251 & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    bool _2259 = !_1873;
    int _2261 = _2259 ? 0 : (-1);
    float _2263 = fma(_1993, _2033, _2197);
    int _2265 = abs(_1729);
    int _2267 = ~_1857;
    int _2269 = _2267 + _2261;
    int _2271 = _2269 + 1;
    if (_2223)
    {
        float _2273 = _2195 * _2193;
        _172 = _2273;
    }
    float _2275 = _172;
    float _2277 = fma(_1955, _2049, _2145);
    int _2279 = _2155 + 8;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    uint _2283 = uint(int(uint(int(_2281)) >> uint(2)));
    int _2285 = int(_2281) & 3;
    float _2287 = (*spvDescriptorSet0.vp_c9)._m0[int(_2283)][_2285];
    int _2289 = int(_2281) + 1;
    uint _2291 = uint(int(uint(_2289) >> uint(2)));
    int _2293 = _2289 & 3;
    float _2295 = (*spvDescriptorSet0.vp_c9)._m0[int(_2291)][_2293];
    bool _2297 = !_2229;
    int _2299 = _2297 ? 0 : (-1);
    bool _2301 = _1547 != 3;
    float _2303 = fma(_1991, _2047, _2277);
    float _2305 = _1535 * _2235;
    int _2307 = ~_1683;
    int _2309 = _2307 + _1765;
    int _2311 = _2309 + 1;
    float _2313 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2315 = abs(_1677);
    float _2317 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2319 = _2093 + _2317;
    out.m_83.x = _2237;
    out.m_83.y = _2305;
    int _2321 = abs(_2041);
    int _2323 = _794 * _2311;
    int _2325 = _2323 + _1125;
    int _2327 = ~_2315;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    float _2333 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2313);
    int _2335 = ~_2321;
    int _2337 = _2335 + 1;
    int _2339 = _2337 + 1;
    float _2341 = fma(_1995, _2033, _2303);
    bool _2343 = !_2301;
    int _2345 = _2343 ? 0 : (-1);
    float _2347 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2333);
    bool _2349 = _794 == 0;
    float _2351 = fma(_2057, _2029, _2341);
    int _2353 = ~_2031;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    bool _2359 = _850 == 0;
    bool _2361 = _2347 >= 0.0;
    int _2363 = _2357 * as_type<int>(_2173);
    int _2365 = ~_2239;
    int _2367 = _2365 + 1;
    int _2369 = _2367 + 1;
    int _2371 = _2331 * as_type<int>(_2213);
    int _2373 = ~_2045;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    int _2379 = _2339 * as_type<int>(_2165);
    int _2381 = _2379 + _2363;
    int _2383 = abs(_1697);
    int _2385 = _2369 * as_type<int>(_2205);
    int _2387 = _2385 + _2371;
    int _2389 = abs(_2299);
    int _2391 = _2377 * as_type<int>(_2249);
    int _2393 = _2391 + _2381;
    int _2395 = ~_2067;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    float _2401 = fma(_2055, _2029, _2263);
    int _2403 = ~_2389;
    int _2405 = _2403 + 1;
    int _2407 = _2405 + 1;
    if (_2361)
    {
        out.m_49.x = 0.0;
    }
    int _2409 = abs(_2345);
    float _2411 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2401);
    int _2413 = ~_2383;
    int _2415 = _2413 + 1;
    int _2417 = _2415 + 1;
    int _2419 = _2399 * as_type<int>(_2287);
    int _2421 = _2419 + _2387;
    int _2423 = _2407 * as_type<int>(_2257);
    int _2425 = _2423 + _2393;
    int _2427 = ~_2409;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    int _2433 = _850 * _2271;
    int _2435 = _2433 + _1285;
    int _2437 = ~_2265;
    int _2439 = _2437 + 1;
    int _2441 = _2439 + 1;
    int _2443 = _2417 * _2425;
    bool _2445 = !_2349;
    int _2447 = _2445 ? _2325 : (-1);
    int _2449 = _2431 * as_type<int>(_2295);
    int _2451 = _2449 + _2421;
    bool _2453 = !_2359;
    int _2455 = _2453 ? _2435 : (-1);
    float _2457 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2351);
    bool _2459 = !_1891;
    int _2461 = _2459 ? 0 : 1;
    int _2463 = _2441 * _2451;
    bool _2465 = !_1899;
    int _2467 = _2465 ? 0 : 1;
    int _2469 = _2447 * _2383;
    int _2471 = _2469 + _2443;
    float _2473 = _2227 * _2227;
    bool _2475 = !_1895;
    int _2477 = _2475 ? 0 : 1;
    int _2479 = _2455 * _2265;
    int _2481 = _2479 + _2463;
    float _2483 = as_type<float>(_2463);
    if (_2361)
    {
        _2483 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2485 = _2483;
    float _2487 = fma(_2319, _2319, _2473);
    int _2489 = abs(_2477);
    out.m_85.x = _2411;
    out.m_85.y = _2457;
    float _2491 = float(_2471);
    float _2493 = fma(_2233, _2233, _2487);
    float _2495 = float(_1783);
    float _2497 = float(_2489);
    float _2499 = rsqrt(_2493);
    float _2501 = float(_2481);
    int _2503 = as_type<int>(_2485);
    if (_2361)
    {
        float _2505 = _2485 * 5.0;
        _2503 = as_type<int>(_2505);
    }
    int _2507 = _2503;
    int _2509 = abs(_2461);
    float _2511 = _2497 * _2495;
    float _2513 = float(_2113);
    float _2515 = in.m_87.x;
    float _2517 = in.m_87.y;
    float _2519 = in.m_87.z;
    float _2521 = float(_2509);
    if (_2361)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7802 = as_type<float>(_2507);
        out.gl_Position.z = _7802;
    }
    out.m_89.x = _2491;
    out.m_89.y = _2501;
    float _2523 = _2227 * _2499;
    float _2525 = _2319 * _2499;
    float _2527 = _2523;
    if (_2361)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2529 = -_2523;
    float _2531 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    float _2533 = _2233 * _2499;
    float _2535 = -_2525;
    float _2537 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2093);
    float _2539 = _2521 * _2513;
    float _2541 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2543 = _2531 + _2541;
    float _2545 = -_2533;
    float _2547 = fma(_2545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1845);
    float _2549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2551 = _2537 + _2549;
    float _2553 = _2539 * (-2.0);
    float _2555 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2559 = _2547 + _2557;
    float _2561 = _152 + (-0.5);
    float _2563 = -_2523;
    float _2565 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2227);
    float _2567 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2555);
    float _2569 = fma(_2553, _2515, _2515);
    float _2571 = -_2525;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2319);
    float _2575 = _2565 * _2565;
    float _2577 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2567);
    float _2579 = fma(_1629, _2553, _1629);
    float _2581 = fma(_2561, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2569);
    float _2583 = _2511 * (-2.0);
    float _2585 = fma(_2573, _2573, _2575);
    bool _2587 = _2577 >= 0.0;
    float _2589 = -_2533;
    float _2591 = fma(_2589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2233);
    float _2593 = fma(_2579, _2275, _2581);
    float _2595 = _154 + (-0.5);
    float _2597 = fma(_2583, _2517, _2517);
    float _2599 = fma(_2591, _2591, _2585);
    float _2601 = _2593 * 0.15915493667125701904296875;
    int _2603 = abs(_2467);
    float _2605 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2597);
    float _2607 = sqrt(_2599);
    float _2609 = fma(_1685, _2583, _1685);
    float _2611 = float(_1853);
    float _2613 = _2597;
    float _2615 = _2565;
    if (_2587)
    {
        _2613 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2617 = _2613;
    int _2619 = as_type<int>(_2617);
    if (_2587)
    {
        out.m_49.x = 0.0;
    }
    float _2621 = float(_2603);
    float _2623 = fma(_2609, _2275, _2605);
    float _2625 = _2601 * 6.283185482025146484375;
    float _2627 = sin(_2625);
    if (_2587)
    {
        float _2629 = _2617 * 5.0;
        _2619 = as_type<int>(_2629);
    }
    int _2631 = _2619;
    float _2633 = _152 + _156;
    float _2635 = _2621 * _2611;
    if (_2587)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8005 = as_type<float>(_2631);
        out.gl_Position.z = _8005;
    }
    float _2637 = _2601 * 6.283185482025146484375;
    float _2639 = cos(_2637);
    if (_2587)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2641 = -_1473;
    float _2643 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2645 = -_2093;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2649 = _2623 * 0.15915493667125701904296875;
    float _2651 = _2643 * _2643;
    float _2653 = _2633 + (-1.0);
    float _2655 = -_1845;
    float _2657 = _2655 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2659 = _2635 * (-2.0);
    float _2661 = fma(_2647, _2647, _2651);
    float _2663 = fma(_2653, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2665 = _156 + (-0.5);
    float _2667 = _2499 * _2607;
    float _2669 = fma(_2657, _2657, _2661);
    float _2671 = fma(_2659, _2519, _2519);
    float _2673 = fma(_2663, _2659, _2663);
    float _2675 = _2649 * 6.283185482025146484375;
    float _2677 = sin(_2675);
    float _2679 = in.m_91.x;
    float _2681 = in.m_91.y;
    float _2683 = in.m_91.z;
    float _2685 = fma(_2665, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2671);
    float _2687 = fma(_2673, _2275, _2685);
    float _2689 = rsqrt(_2669);
    float _2691 = _2687 * 0.15915493667125701904296875;
    float _2693 = _2649 * 6.283185482025146484375;
    float _2695 = cos(_2693);
    float _2697 = _2627 * _2677;
    float _2699 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2701 = _2639 * _2677;
    float _2703 = _2647 * _2689;
    float _2705 = _2657 * _2689;
    float _2707 = _2643 * _2689;
    float _2709 = _2691 * 6.283185482025146484375;
    float _2711 = sin(_2709);
    float _2713 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2715 = _2703 * _2713;
    float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2719 = _2705 * _2717;
    float _2721 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2723 = -_2715;
    float _2725 = fma(_2705, _2721, _2723);
    float _2727 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2729 = -_2719;
    float _2731 = fma(_2707, _2727, _2729);
    float _2733 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2735 = _2707 * _2733;
    float _2737 = _2639 * _2695;
    float _2739 = _2725 * _2725;
    float _2741 = _2691 * 6.283185482025146484375;
    float _2743 = cos(_2741);
    float _2745 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2747 = -_2735;
    float _2749 = fma(_2703, _2745, _2747);
    float _2751 = _2667 * _2699;
    float _2753 = fma(_2731, _2731, _2739);
    float _2755 = fma(_2711, _2737, _2697);
    float _2757 = fma(_2749, _2749, _2753);
    float _2759 = fma(_2711, _2697, _2737);
    float _2761 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2763 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2765 = _2627 * _2695;
    float _2767 = rsqrt(_2757);
    float _2769 = _2667 * _2763;
    float _2771 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2681);
    float _2773 = _2677 * _2743;
    float _2775 = _2639 * _2743;
    float _2777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2679);
    float _2779 = _2771 * _2769;
    float _2781 = _2667 * _2761;
    float _2783 = -_2701;
    float _2785 = fma(_2711, _2765, _2783);
    float _2787 = -_2765;
    float _2789 = fma(_2711, _2701, _2787);
    float _2791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2683);
    float _2793 = _2777 * _2781;
    float _2795 = _2775 * _2779;
    float _2797 = _2627 * _2743;
    float _2799 = _2695 * _2743;
    float _2801 = _2791 * _2751;
    float _2803 = _2731 * _2767;
    float _2805 = _2725 * _2767;
    float _2807 = -_2779;
    float _2809 = _2711 * _2807;
    float _2811 = fma(_2755, _2793, _2795);
    float _2813 = _2707 * _2803;
    float _2815 = _2797 * _2779;
    float _2817 = _2749 * _2767;
    float _2819 = fma(_2799, _2793, _2809);
    float _2821 = fma(_2789, _2801, _2811);
    float _2823 = _2705 * _2805;
    float _2825 = -_2813;
    float _2827 = fma(_2703, _2805, _2825);
    float _2829 = fma(_2785, _2793, _2815);
    float _2831 = fma(_2773, _2801, _2819);
    float _2833 = -_2823;
    float _2835 = fma(_2707, _2817, _2833);
    float _2837 = _2827 * _2821;
    float _2839 = fma(_2759, _2801, _2829);
    float _2841 = _2703 * _2817;
    float _2843 = _2835 * _2821;
    float _2845 = fma(_2817, _2831, _2837);
    float _2847 = -_2841;
    float _2849 = fma(_2705, _2803, _2847);
    float _2851 = fma(_2803, _2831, _2843);
    float _2853 = fma(_2705, _2839, _2845);
    float _2855 = fma(_2703, _2839, _2851);
    float _2857 = _1845 + _2853;
    float _2859 = _2849 * _2821;
    float _2861 = _2093 + _2855;
    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2865 = _2857 + _2863;
    float _2867 = fma(_2805, _2831, _2859);
    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2871 = _2861 + _2869;
    float _2873 = _2865 * _2865;
    float _2875 = fma(_2707, _2839, _2867);
    float _2877 = fma(_2871, _2871, _2873);
    float _2879 = _1473 + _2875;
    float _2881 = sqrt(_2877);
    bool _2883 = _2881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2885 = _2821;
    float _2887 = _2873;
    float _2889 = _2861;
    float _2891 = _2839;
    if (!_2883)
    {
        _2885 = _2857;
    }
    float _2893 = _2885;
    float _2895 = _2893;
    if (!_2883)
    {
        _2887 = _2879;
    }
    float _2897 = _2887;
    bool _2899 = !_2883;
    float _2901 = _2897;
    if (!_2899)
    {
        float _2903 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2905 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2907 = _2881 + _2905;
        float _2909 = rsqrt(_2877);
        float _2911 = _2907 * _2903;
        float _2913 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2915 = _2911 * 0.15915493667125701904296875;
        float _2917 = _2915 * 6.283185482025146484375;
        float _2919 = cos(_2917);
        float _2921 = _2915 * 6.283185482025146484375;
        float _2923 = sin(_2921);
        float _2925 = _2919 + (-1.0);
        float _2927 = fma(_2923, _2913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2929 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2931 = _2909 * _2927;
        float _2933 = fma(_2879, _2919, _2929);
        float _2935 = fma(_2871, _2931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2937 = fma(_2865, _2931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2901 = _2933;
        _2889 = _2935;
        _2895 = _2937;
        _2891 = _2931;
    }
    float _2939 = _2901;
    float _2941 = _2889;
    float _2943 = _2895;
    float _2945 = _2891;
    float _2947 = -_1473;
    float _2949 = _2947 + _2939;
    float _2951 = -_2093;
    float _2953 = _2951 + _2941;
    float _2955 = -_1845;
    float _2957 = _2955 + _2943;
    float _2959 = _2949 * _2949;
    bool _2961 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2963 = isnan(0.5);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2969 = _2965 || _2967;
    bool _2971 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2973 = isnan(0.5);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2979 = _2975 || _2977;
    float _2981 = fma(_2953, _2953, _2959);
    float _2983 = fma(_2957, _2957, _2981);
    float _2985 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2987 = sqrt(_2983);
    float _2989 = fma(_2537, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2985);
    float _2991 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2993 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2989);
    float _2995 = fma(_2537, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2991);
    float _2997 = _2993 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2999 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2995);
    float _3001 = 1.0 / _2997;
    float _3003 = _2999 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3005 = _2987 > 0.0;
    float _3007 = _3003 + _2997;
    float _3009 = _2945;
    float _3011 = _2987;
    float _3013 = _2939;
    if (!_3005)
    {
        _3009 = _2941;
    }
    float _3015 = _3009;
    float _3017 = _3015;
    float _3019 = _3015;
    if (!_3005)
    {
        _3011 = _2943;
    }
    float _3021 = _3011;
    bool _3023 = !_3005;
    float _3025 = _3021;
    float _3027 = _3001;
    if (!_3023)
    {
        float _3029 = _232 * _232;
        float _3031 = fma(_236, _236, _3029);
        float _3033 = fma(_238, _238, _3031);
        float _3035 = rsqrt(_2983);
        float _3037 = sqrt(_3033);
        float _3039 = _2953 * _3035;
        float _3041 = _2949 * _3035;
        float _3043 = _2957 * _3035;
        bool _3045 = _3037 > 0.0;
        float _3047 = _3037;
        if (!_3045)
        {
            _3017 = _2941;
        }
        float _3049 = _3017;
        _3019 = _3049;
        if (!_3045)
        {
            _3047 = _2943;
        }
        float _3051 = _3047;
        bool _3053 = !_3045;
        _3025 = _3051;
        if (!_3053)
        {
            float _3055 = rsqrt(_3033);
            float _3057 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3059 = _232 * _3055;
            float _3061 = _236 * _3055;
            float _3063 = _3041 * _3059;
            float _3065 = _238 * _3055;
            float _3067 = fma(_3039, _3061, _3063);
            float _3069 = _3057 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3071 = fma(_3043, _3065, _3067);
            float _3073 = _3071 * _3069;
            float _3075 = fma(_232, _3073, _2939);
            float _3077 = fma(_236, _3073, _2941);
            float _3079 = fma(_238, _3073, _2943);
            _3013 = _3075;
            _3019 = _3077;
            _3025 = _3079;
        }
    }
    float _3081 = _3013;
    float _3083 = _3019;
    float _3085 = _3025;
    float _3087 = -_2523;
    float _3089 = fma(_3087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3081);
    float _3091 = -_2525;
    float _3093 = fma(_3091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3083);
    float _3095 = -_2533;
    float _3097 = fma(_3095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3085);
    float _3099 = _3007 * _3001;
    float _3101 = _3099 * 0.5;
    float _3103 = _3089;
    float _3105 = _3093;
    float _3107 = _3097;
    if (_2979)
    {
        _2527 = 1.0;
    }
    float _3109 = _2527;
    float _3111 = _3109;
    if (!_2969)
    {
        float _3113 = _2543 * _2543;
        float _3115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3117 = -_1845;
        float _3119 = _3117 + _3085;
        float _3121 = -_2093;
        float _3123 = _3121 + _3083;
        float _3125 = fma(_2551, _2551, _3113);
        float _3127 = -_1473;
        float _3129 = _3127 + _3081;
        float _3131 = fma(_2559, _2559, _3125);
        float _3133 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3135 = sqrt(_3131);
        float _3137 = 1.0 / _2667;
        float _3139 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3141 = precise::min(_3135, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3143 = _3141 * _3115;
        float _3145 = _3143 * _3137;
        float _3147 = _3139 * _3145;
        float _3149 = _3119 * _3145;
        float _3151 = fma(_3123, _3147, _2537);
        float _3153 = fma(_3129, _3147, _2531);
        float _3155 = fma(_3139, _3149, _2547);
        _3103 = _3153;
        _3105 = _3151;
        _3107 = _3155;
        _246 = _3145;
    }
    float _3157 = _3103;
    float _3159 = _3105;
    float _3161 = _3107;
    float _3163 = _246;
    float _3165 = _3163;
    if (!_2979)
    {
        float _3167 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3169 = _3167 * 0.15915493667125701904296875;
        float _3171 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3173 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3175 = fma(_3101, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3173);
        float _3177 = _3169 * 6.283185482025146484375;
        float _3179 = cos(_3177);
        float _3181 = _3171 * 0.15915493667125701904296875;
        float _3183 = _3169 * 6.283185482025146484375;
        float _3185 = sin(_3183);
        float _3187 = 1.0 / _3179;
        float _3189 = _3181 * 6.283185482025146484375;
        float _3191 = cos(_3189);
        float _3193 = _3185 * _3187;
        float _3195 = _3181 * 6.283185482025146484375;
        float _3197 = sin(_3195);
        float _3199 = _3191 * _3193;
        float _3201 = 1.0 / _3175;
        float _3203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3205 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3203;
        float _3207 = 1.0 / _3199;
        float _3209 = 1.0 / _3205;
        float _3211 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3213 = _3201 * _3211;
        float _3215 = _3197 * _3207;
        float _3217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3219 = fma(_3215, _3213, _3217);
        float _3221 = _3219 * _3209;
        float _3223 = precise::clamp(_3221, 0.0, 1.0);
        _3111 = _3223;
    }
    float _3225 = _3111;
    float _3227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3229 = _3157 + _3227;
    float _3231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3233 = _3159 + _3231;
    float _3235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3237 = _3161 + _3235;
    float _3239 = fma(_2943, 6.2500002968590706586837768554688e-05, 0.5);
    float _3241 = _3229 * _3229;
    float _3243 = fma(_3233, _3233, _3241);
    float _3245 = fma(_3237, _3237, _3243);
    float _3247 = rsqrt(_3245);
    float _3249 = sqrt(_3245);
    float _3251 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3253 = _3233 * _3251;
    float _3255 = _3237 * _3251;
    float _3257 = _3253 * _3253;
    float _3259 = _3255 * _3255;
    float _3261 = _3257 + _3259;
    float _3263 = sqrt(_3261);
    bool _3265 = _3263 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3269 = _3263 + _3267;
    float _3271 = _3237;
    float _3273 = _3241;
    float _3275 = _3269;
    float _3277 = _3251;
    if (_3265)
    {
        float _3279 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3271 = _3279;
    }
    float _3281 = _3271;
    if (_3265)
    {
        float _3283 = rsqrt(_3261);
        _3273 = _3283;
    }
    float _3285 = _3273;
    float _3287 = _3285;
    if (_3265)
    {
        float _3289 = _3269 * _3281;
        _3275 = _3289;
    }
    float _3291 = _3275;
    if (_3265)
    {
        float _3293 = _3291 * 0.15915493667125701904296875;
        _3165 = _3293;
    }
    float _3295 = _3165;
    float _3297 = _3281;
    if (_3265)
    {
        float _3299 = _3295 * 6.283185482025146484375;
        float _3301 = sin(_3299);
        _3297 = _3301;
    }
    float _3303 = _3297;
    float _3305 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3307 = precise::max(0.0, _3305);
    float _3309 = _3247;
    float _3311 = _3307;
    if (_3265)
    {
        float _3313 = _3295 * 6.283185482025146484375;
        float _3315 = cos(_3313);
        _3309 = _3315;
    }
    float _3317 = _3309;
    float _3319 = -_3251;
    float _3321 = -_3307;
    float _3323 = fma(_3229, _3319, _3321);
    float _3325 = _3323;
    if (_3265)
    {
        float _3327 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3311 = _3327;
    }
    float _3329 = _3311;
    float _3331 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3333 = _3303;
    float _3335 = _3329;
    if (_3265)
    {
        float _3337 = fma(_3303, _3329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3277 = _3337;
    }
    float _3339 = _3277;
    if (!_3265)
    {
        _3333 = _3253;
    }
    float _3341 = _3333;
    float _3343 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3331);
    float _3345 = _3341;
    float _3347 = _3317;
    if (_3265)
    {
        float _3349 = _3317 + (-1.0);
        _3335 = _3349;
    }
    float _3351 = _3335;
    float _3353 = _3351;
    if (_3265)
    {
        float _3355 = _3285 * _3339;
        _3027 = _3355;
    }
    float _3357 = _3027;
    float _3359 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3361 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3343);
    if (_3265)
    {
        float _3363 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3287 = _3363;
    }
    float _3365 = _3287;
    float _3367 = _3365;
    if (_3265)
    {
        float _3369 = _3253 * _3357;
        _3345 = _3369;
    }
    float _3371 = _3345;
    if (!_3265)
    {
        _3353 = _3255;
    }
    float _3373 = _3353;
    float _3375 = _3373;
    if (_3265)
    {
        float _3377 = _3255 * _3357;
        _3375 = _3377;
    }
    float _3379 = _3375;
    if (_3265)
    {
        float _3381 = fma(_3323, _3317, _3365);
        _3325 = _3381;
    }
    float _3383 = _3325;
    if (!_3265)
    {
        _3347 = _3257;
    }
    float _3385 = _3347;
    float _3387 = _3385;
    if (_3265)
    {
        float _3389 = _3371 * _3371;
        _3387 = _3389;
    }
    float _3391 = _3387;
    if (!_3265)
    {
        _3367 = _3259;
    }
    float _3393 = _3367;
    float _3395 = _3393;
    if (_3265)
    {
        float _3397 = _3379 * _3379;
        _3395 = _3397;
    }
    float _3399 = _3395;
    float _3401 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3359);
    float _3403 = fma(_3383, _3383, _3391);
    float _3405 = _3361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3407 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3401);
    float _3409 = _3403 + _3399;
    float _3411 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3413 = _3407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3415 = rsqrt(_3409);
    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3419 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3417);
    float _3421 = precise::clamp(_3419, 0.0, 1.0);
    float _3423 = _3413 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3425 = -_3421;
    float _3427 = _3425 + 1.0;
    float _3429 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3431 = -_3423;
    float _3433 = fma(_3431, _3411, 1.0);
    float _3435 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3437 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3429);
    float _3439 = abs(_3427);
    float _3441 = log2(_3439);
    float _3443 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3435);
    float _3445 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3437);
    float _3447 = _3415 * _3371;
    float _3449 = _3415 * _3383;
    float _3451 = _3415 * _3379;
    float _3453 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3443);
    float _3455 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3457 = _3445 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3459 = log2(_3433);
    float _3461 = _3453 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3463 = -_3455;
    float _3465 = fma(_3449, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3463);
    float _3467 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3469 = _3449 + 1.0;
    float _3471 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3473 = -_3451;
    float _3475 = fma(_3473, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3465);
    float _3477 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3467);
    float _3479 = exp2(_3471);
    float _3481 = fma(_3475, -0.5, 0.5);
    float _3483 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3477);
    float _3485 = fma(_3475, 0.5, 0.5);
    float _3487 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3483);
    float _3489 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3491 = sqrt(_3481);
    float _3493 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3495 = fma(_3485, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3497 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3489);
    float _3499 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3493);
    float _3501 = fma(_3485, _3495, -0.212114393711090087890625);
    float _3503 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3497);
    float _3505 = 1.0 / _3487;
    float _3507 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3499);
    float _3509 = -_3449;
    float _3511 = fma(_3479, _3469, _3509);
    float _3513 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3503);
    float _3515 = fma(_3485, _3501, 1.570728778839111328125);
    float _3517 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3507);
    float _3519 = _3459 * 0.693147182464599609375;
    float _3521 = fma(_3511, 0.5, 0.5);
    float _3523 = _3491 * 0.636619746685028076171875;
    float _3525 = fma(_2941, 6.2500002968590706586837768554688e-05, 0.5);
    float _3527 = _3519 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3529 = -_3515;
    float _3531 = fma(_3523, _3529, 1.0);
    float _3533 = _3513 * _3505;
    float _3535 = _3517 * _3505;
    float _3537 = fma(_3533, 0.5, 0.5);
    float _3539 = fma(_3535, -0.5, 0.5);
    float3 _9429 = float3(_3537, _3539, _3527);
    float _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9429, float3(0.0), isnan(_9429)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9429, float3(0.0), isnan(_9429)), level(0.0)).x;
    float3 _9440 = float3(_3537, _3539, _3527);
    float4 _3544 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9440, float3(0.0), isnan(_9440)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9440, float3(0.0), isnan(_9440)), level(0.0)).xyzw;
    float _3546 = _3544.x;
    float _3548 = _3544.y;
    float _3550 = _3544.z;
    float _3552 = _3544.w;
    float2 _9457 = float2(_3531, _3521);
    float3 _3556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9457, float2(0.0), isnan(_9457)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9457, float2(0.0), isnan(_9457)), level(0.0)).xyz;
    float _3558 = _3556.x;
    float _3560 = _3556.y;
    float _3562 = _3556.z;
    float2 _9473 = float2(_3525, _3239);
    float3 _3564 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_9473, float2(0.0), isnan(_9473)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_9473, float2(0.0), isnan(_9473)), level(0.0)).xyz;
    float _3566 = _3564.x;
    float _3568 = _3564.y;
    float _3570 = _3564.z;
    float _3572 = in.m_93.x;
    float _3574 = in.m_93.y;
    float _3576 = in.m_93.z;
    bool _3578 = _2681 != 0.0;
    bool _3580 = isnan(_2681);
    bool _3582 = _3578 || _3580;
    bool _3584 = isnan(0.0);
    bool _3586 = _3582 || _3584;
    float _3588 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3590 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3592 = in.m_95.x;
    float _3594 = in.m_95.y;
    float _3596 = in.m_95.z;
    float _3598 = in.m_95.w;
    bool _3600 = _2679 == 0.0;
    bool _3602 = !_3586;
    bool _3604 = _3600 && _3602;
    float _3606 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3590);
    float _3608 = exp2(_3588);
    bool _3610 = _2683 == 0.0;
    bool _3612 = _3610 && _3604;
    float _3614 = _3537;
    float _3616 = _3527;
    float _3618 = _3572;
    float _3620 = _3487;
    float _3622 = _3513;
    float _3624 = _3517;
    if (_3612)
    {
        _2105 = _3572;
    }
    float _3626 = _2105;
    float _3628 = -_3608;
    float _3630 = _3628 + 1.0;
    float _3632 = _3626;
    if (_3612)
    {
        _2107 = _3576;
    }
    float _3634 = _2107;
    float _3636 = _3634;
    if (_3612)
    {
        _2615 = _3574;
    }
    float _3638 = _2615;
    float _3640 = _3638;
    if (_3612)
    {
        _3614 = _3626;
    }
    float _3642 = _3614;
    float _3644 = _3642;
    if (!_3612)
    {
        _3632 = _3572;
    }
    float _3646 = _3632;
    if (_3612)
    {
        _3616 = _3634;
    }
    float _3648 = _3616;
    float _3650 = _3648;
    if (!_3612)
    {
        _3636 = _3576;
    }
    float _3652 = _3636;
    if (!_3612)
    {
        float _3654 = fma(_2679, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3646);
        _3644 = _3654;
    }
    float _3656 = _3644;
    if (_3612)
    {
        _3618 = _3638;
    }
    float _3658 = _3618;
    float _3660 = _3596 * _3646;
    float _3662 = _3658;
    if (!_3612)
    {
        _3640 = _3574;
    }
    float _3664 = _3640;
    float _3666 = _3594 * _3652;
    if (!_3612)
    {
        float _3668 = fma(_2683, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3652);
        _3650 = _3668;
    }
    float _3670 = _3650;
    float _3672 = -_3660;
    float _3674 = fma(_3592, _3652, _3672);
    float _3676 = _2789 * _2835;
    float _3678 = _3592 * _3664;
    if (!_3612)
    {
        float _3680 = fma(_2681, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3664);
        _3662 = _3680;
    }
    float _3682 = _3662;
    float _3684 = -_3666;
    float _3686 = fma(_3596, _3664, _3684);
    float _3688 = _2755 * _2835;
    float _3690 = -_3678;
    float _3692 = fma(_3594, _3646, _3690);
    float _3694 = _3674 * _3598;
    float _3696 = _3686 * _3598;
    float _3698 = _2755 * _2849;
    float _3700 = _3692 * _3598;
    float _3702 = _2755 * _2827;
    float _3704 = _2775 * _2835;
    float _3706 = _2775 * _2849;
    float _3708 = _2775 * _2827;
    float _3710 = _2789 * _2849;
    float _3712 = _2789 * _2827;
    float _3714 = fma(_2799, _2803, _3688);
    float _3716 = fma(_2799, _2805, _3698);
    float _3718 = fma(_2799, _2817, _3702);
    float _3720 = -_2711;
    float _3722 = fma(_3720, _2803, _3704);
    float _3724 = -_2711;
    float _3726 = fma(_3724, _2805, _3706);
    float _3728 = -_2711;
    float _3730 = fma(_3728, _2817, _3708);
    float _3732 = fma(_2773, _2803, _3676);
    float _3734 = fma(_2773, _2805, _3710);
    float _3736 = fma(_2773, _2817, _3712);
    float _3738 = fma(_2797, _2703, _3722);
    float _3740 = fma(_2797, _2707, _3726);
    float _3742 = fma(_2797, _2705, _3730);
    float _3744 = fma(_2785, _2707, _3716);
    float _3746 = fma(_2785, _2703, _3714);
    float _3748 = _3738 * _3594;
    float _3750 = _3740 * _3594;
    float _3752 = _3742 * _3594;
    float _3754 = fma(_2759, _2707, _3734);
    float _3756 = _3738 * _3682;
    float _3758 = _3694 * _3738;
    float _3760 = fma(_2759, _2703, _3732);
    float _3762 = fma(_2759, _2705, _3736);
    float _3764 = fma(_2785, _2705, _3718);
    float _3766 = _3740 * _3682;
    float _3768 = _3742 * _3682;
    float _3770 = _3694 * _3740;
    float _3772 = _3694 * _3742;
    float _3774 = fma(_3746, _3592, _3748);
    float _3776 = fma(_3746, _3656, _3756);
    float _3778 = fma(_3696, _3746, _3758);
    float _3780 = fma(_3744, _3592, _3750);
    float _3782 = fma(_3764, _3592, _3752);
    float _3784 = fma(_3760, _3596, _3774);
    float _3786 = fma(_3700, _3760, _3778);
    float _3788 = fma(_3744, _3656, _3766);
    float _3790 = _3630 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3792 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3606);
    float _3794 = fma(_3754, _3596, _3780);
    float _3796 = fma(_3762, _3596, _3782);
    float _3798 = fma(_3696, _3744, _3770);
    float _3800 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3792);
    float _3802 = _3487 * 0.5;
    float _3804 = fma(_3760, _3670, _3776);
    float _3806 = fma(_3764, _3656, _3768);
    out.m_97.x = _3784;
    out.m_97.y = _3794;
    out.m_97.z = _3796;
    float _3808 = _3800 + _3487;
    float _3810 = _3513 + _3487;
    float _3812 = fma(_3696, _3764, _3772);
    float _3814 = fma(_3700, _3754, _3798);
    float _3816 = fma(_3517, -0.5, _3802);
    float _3818 = fma(_3754, _3670, _3788);
    float _3820 = _3808 * 0.5;
    float _3822 = _3810 * 0.5;
    float _3824 = fma(_3762, _3670, _3806);
    bool _3826 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3828 = isnan(_3249);
    bool _3830 = _3826 || _3828;
    bool _3832 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3834 = _3830 || _3832;
    float _3836 = -_3790;
    float _3838 = _3836 + 1.0;
    float _3840 = fma(_3700, _3762, _3812);
    out.m_99.x = _3822;
    out.m_99.y = _3816;
    out.m_99.z = _3820;
    out.m_99.w = _3487;
    out.m_101.x = _3804;
    out.m_101.y = _3818;
    out.m_101.z = _3824;
    out.m_103.x = _3786;
    out.m_103.y = _3814;
    out.m_103.z = _3840;
    out.gl_Position.x = _3513;
    out.gl_Position.y = _3517;
    out.gl_Position.z = _3800;
    out.gl_Position.w = _3487;
    float _3842 = _3840;
    float _3844 = _3814;
    float _3846 = _3786;
    if (!_3834)
    {
        _3842 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3848 = _3842;
    float _3850 = _3848;
    float _3852 = _3848;
    if (!_3834)
    {
        _3844 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3854 = _3844;
    float _3856 = _3854;
    float _3858 = _3854;
    if (!_3834)
    {
        _3846 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3860 = _3846;
    float _3862 = _3860;
    float _3864 = _3860;
    if (!_3834)
    {
        _3620 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3866 = _3620;
    float _3868 = _3866;
    float _3870 = _3866;
    if (!_3834)
    {
        _3622 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3872 = _3622;
    float _3874 = _3872;
    float _3876 = _3872;
    if (!_3834)
    {
        _3624 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3878 = _3624;
    float _3880 = _3790 * _3541;
    float _3882 = _3552 * _3838;
    float _3884 = _3552 * _3880;
    float _3886 = _3562 * _3880;
    float _3888 = fma(_3558, _3884, _3546);
    float _3890 = fma(_3560, _3884, _3548);
    float _3892 = fma(_3552, _3886, _3550);
    out.m_105.x = _3566;
    out.m_105.y = _3568;
    out.m_105.z = _3570;
    float _3894 = _3225 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_107.x = _3888;
    out.m_107.y = _3890;
    out.m_107.z = _3892;
    out.m_107.w = _3882;
    bool _3896 = !_3834;
    float _3898 = _3878;
    float _3900 = _3878;
    if (!_3896)
    {
        bool _3902 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3904 = isnan(_3249);
        bool _3906 = _3902 || _3904;
        bool _3908 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3910 = _3906 || _3908;
        if (!_3910)
        {
            float _3912 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3914 = _3249 + _3912;
            float _3916 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3918 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3916;
            float _3920 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3922 = _3920 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3924 = 1.0 / _3918;
            float _3926 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3928 = _3926 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3930 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3932 = _3930 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3934 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3936 = _3934 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3940 = _3938 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3942 = _3914 * _3924;
            float _3944 = precise::clamp(_3942, 0.0, 1.0);
            float _3946 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3948 = _3946 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3950 = fma(_3944, _3922, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3952 = fma(_3944, _3948, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3954 = fma(_3944, _3928, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3956 = fma(_3944, _3932, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3958 = fma(_3944, _3936, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3960 = fma(_3944, _3940, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3876 = _3954;
            _3858 = _3958;
            _3870 = _3950;
            _3852 = _3956;
            _3900 = _3952;
            _3864 = _3960;
            _3962 = true;
        }
        else
        {
            bool _3964 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3966 = isnan(_3249);
            bool _3968 = _3964 || _3966;
            bool _3970 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3972 = _3968 || _3970;
            if (!_3972)
            {
                _3868 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3974 = _3868;
            _3870 = _3974;
            if (!_3972)
            {
                _3874 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3976 = _3874;
            _3876 = _3976;
            if (!_3972)
            {
                _3898 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3978 = _3898;
            _3900 = _3978;
            if (!_3972)
            {
                _3850 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3980 = _3850;
            _3852 = _3980;
            if (!_3972)
            {
                _3856 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3982 = _3856;
            _3858 = _3982;
            if (!_3972)
            {
                _3862 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3984 = _3862;
            bool _3986 = !_3972;
            _3864 = _3984;
            if (!_3986)
            {
                bool _3988 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3990 = isnan(_3249);
                bool _3992 = _3988 || _3990;
                bool _3994 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3996 = _3992 || _3994;
                if (!_3996)
                {
                    float _3998 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4000 = _3249 + _3998;
                    float _4002 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4004 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4002;
                    float _4006 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4008 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4010 = 1.0 / _4004;
                    float _4012 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4014 = _4012 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4016 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4018 = _4016 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4022 = _4020 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4024 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4026 = _4024 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4028 = _4000 * _4010;
                    float _4030 = precise::clamp(_4028, 0.0, 1.0);
                    float _4032 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4034 = _4032 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4036 = fma(_4030, _4008, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4038 = fma(_4030, _4034, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4040 = fma(_4030, _4014, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4042 = fma(_4030, _4018, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4044 = fma(_4030, _4022, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4046 = fma(_4030, _4026, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3876 = _4040;
                    _3858 = _4044;
                    _3870 = _4036;
                    _3852 = _4042;
                    _3900 = _4038;
                    _3864 = _4046;
                    _3962 = true;
                }
                else
                {
                    _3876 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3858 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3870 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3852 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3900 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3864 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3962 = false;
    float _4048 = _3876;
    float _4050 = _3858;
    float _4052 = _3870;
    float _4054 = _3852;
    float _4056 = _3900;
    float _4058 = _3864;
    float _4060 = fma(_3818, -0.5, 0.5);
    float _4062 = precise::clamp(_4060, 0.0, 1.0);
    float _4064 = -_4048;
    float _4066 = _4064 + _4050;
    float _4068 = -_4052;
    float _4070 = _4068 + _4054;
    out.m_109.x = 0.0;
    float _4072 = fma(_4062, _4066, _4048);
    float _4074 = -_4056;
    float _4076 = _4074 + _4058;
    float _4078 = fma(_4062, _4070, _4052);
    float _4080 = _4072 * 0.586610972881317138671875;
    bool _4082 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4084 = fma(_4062, _4076, _4056);
    float _4086 = _3894 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4088 = fma(_4078, 0.298911988735198974609375, _4080);
    bool _4090 = _3225 > 0.0;
    bool _4092 = isnan(_3225);
    bool _4094 = _4090 || _4092;
    bool _4096 = isnan(0.0);
    bool _4098 = _4094 || _4096;
    float _4100 = fma(_4084, 0.114477999508380889892578125, _4088);
    out.m_49.x = _4086;
    float _4102 = -_4100;
    float _4104 = _4078 + _4102;
    float _4106 = -_4100;
    float _4108 = _4072 + _4106;
    float _4110 = -_4100;
    float _4112 = _4084 + _4110;
    float _4114 = fma(_4104, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4100);
    float _4116 = fma(_4108, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4100);
    float _4118 = fma(_4112, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4100);
    bool _4120 = !_4082;
    if (!_4120)
    {
        float _4122 = -_3157;
        float _4124 = _4122 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4126 = -_3159;
        float _4128 = _4126 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4130 = -_3161;
        float _4132 = _4130 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4134 = _4124 * _4124;
        float _4136 = fma(_4128, _4128, _4134);
        float _4138 = fma(_4132, _4132, _4136);
        float _4140 = sqrt(_4138);
        float _4142 = rsqrt(_4138);
        float _4144 = -_4140;
        float _4146 = _4144 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4148 = _4146 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4150 = precise::clamp(_4148, 0.0, 1.0);
        float _4152 = _4128 * _4142;
        float _4154 = _4124 * _4142;
        float _4156 = abs(_4150);
        float _4158 = log2(_4156);
        float _4160 = _4132 * _4142;
        float _4162 = _4152 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4164 = _3818 * _4154;
        float _4166 = -_4154;
        float _4168 = -_4162;
        float _4170 = fma(_4166, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4168);
        float _4172 = fma(_3804, _4152, _4164);
        float _4174 = -_4160;
        float _4176 = fma(_4174, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4170);
        float _4178 = fma(_3824, _4160, _4172);
        float _4180 = precise::clamp(_4178, 0.0, 1.0);
        float _4182 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4184 = _4176 + _4182;
        float _4186 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4188 = _4184 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4190 = precise::clamp(_4188, 0.0, 1.0);
        float _4192 = exp2(_4186);
        float _4194 = _4192 * _4190;
        float _4196 = _4180 * _4194;
        float _4198 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4200 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4202 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _4198;
        out.m_109.y = _4200;
        out.m_109.z = _4202;
    }
    out.m_111.x = _4114;
    out.m_111.y = _4116;
    out.m_111.z = _4118;
    if (_4098)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _4204 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4204;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3962 = false;
    bool _742 = false;
    bool _538 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_46.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_49.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4261 = as_type<float>(_146);
        out.gl_Position.z = _4261;
    }
    if (!_134)
    {
        return out;
    }
    float _150 = in.m_51.w;
    float _152 = in.m_53.x;
    float _154 = in.m_53.y;
    float _156 = in.m_53.z;
    bool _158 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _160 = isnan(_150);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _166 = _162 || _164;
    float _168 = -_150;
    float _170 = _168 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _152;
    out.m_55.y = _154;
    out.m_55.z = _156;
    float _172 = _170;
    if (_166)
    {
        float _174 = float(_130);
        _140 = _174;
    }
    float _176 = _140;
    bool _178 = _170 >= _176;
    bool _180 = !_166;
    bool _182 = _178 || _180;
    float _184 = _176;
    if (_182)
    {
        _184 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _186 = _184;
    if (_182)
    {
        out.m_49.x = 0.0;
    }
    if (_182)
    {
        float _188 = _186 * 5.0;
        _148 = as_type<int>(_188);
    }
    int _190 = _148;
    if (_182)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4343 = as_type<float>(_190);
        out.gl_Position.z = _4343;
    }
    if (_182)
    {
        return out;
    }
    float _192 = in.m_57.x;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_57.y;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = in.m_63.x;
    float _212 = in.m_63.y;
    float _214 = in.m_63.z;
    float _216 = in.m_65.x;
    float _218 = in.m_65.y;
    float _220 = in.m_65.z;
    out.m_67.x = _192;
    out.m_67.y = _196;
    float _222 = _200 * _206;
    float _224 = _200 * _212;
    float _226 = fma(_198, _204, _222);
    float _228 = _200 * _218;
    float _230 = fma(_198, _210, _224);
    float _232 = fma(_202, _208, _226);
    float _234 = fma(_198, _216, _228);
    float _236 = fma(_202, _214, _230);
    float _238 = fma(_202, _220, _234);
    bool _240 = !_194;
    float _242 = _196;
    float _244 = _192;
    float _246 = _238;
    float _262;
    if (!_240)
    {
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _170);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_130);
        float _268 = 1.0 / _266;
        float _270 = _170 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _272 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _272 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = 1.0 / _288;
    float _304 = 1.0 / _296;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _308 = 1.0 / _300;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _272 + _310;
    float _314 = _276 * _302;
    bool _316 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _318 = isnan(_272);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _330 = isnan(_272);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = 1.0 / _292;
    float _342 = _280 * _304;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = fma(_346, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = _284 * _308;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_354, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _370 = -_366;
    float _372 = _370 + 1.0;
    float _374 = _312 * _340;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _376;
    float _380 = -_326;
    float _382 = _380 + 1.0;
    float _384 = fma(_378, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _386 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_272);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = _338 * _382;
    bool _400 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _402 = isnan(_272);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -_338;
    float _414 = _412 + 1.0;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = _396 * _372;
    float _422 = -_396;
    float _424 = _422 + 1.0;
    float _426 = _366 * _414;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _410 * _424;
    float _438 = fma(_418, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _440 = fma(_430, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _442 = fma(_434, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _444 = _384 * _436;
    float _446 = _348 * _436;
    float _448 = -_410;
    float _450 = _448 + 1.0;
    float _452 = _368 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _458;
    float _462 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[143].x, _444);
    float _464 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[143].y, _446);
    float _466 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_438, _420, _462);
    float _474 = fma(_440, _420, _464);
    float _476 = fma(_456, _314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _478 = fma(_460, _314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _480 = fma(_442, _420, _466);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = fma(_470, _314, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _496 = fma(_476, _426, _472);
    float _498 = fma(_484, _374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _500 = fma(_488, _374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _502 = fma(_478, _426, _474);
    float _504 = fma(_494, _374, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _506 = fma(_490, _426, _480);
    float _508 = fma(_498, _398, _496);
    float _510 = fma(_500, _398, _502);
    float _512 = fma(_504, _398, _506);
    float _514 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].x, _508);
    float _516 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].y, _510);
    float _518 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].z, _512);
    bool _520 = !_306;
    float _536;
    if (!_520)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _170);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_130);
        float _542 = 1.0 / _540;
        float _544 = _170 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _546 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _558 = isnan(_546);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _576 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_546);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = 1.0 / _554;
    float _590 = -_566;
    float _592 = _590 + 1.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    bool _598 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _600 = isnan(_546);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = _586 * _592;
    float _612 = -_586;
    float _614 = _612 + 1.0;
    float _616 = 1.0 / _570;
    bool _618 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _620 = _608 * _614;
    float _622 = -_608;
    float _624 = _622 + 1.0;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _628 = 1.0 / _574;
    float _630 = _596 * _588;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _638 = fma(_630, _550, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _640 = _634 * _616;
    bool _642 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _644 = isnan(_546);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _660 = _546 + _658;
    float _662 = _638 * _620;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _666 = _546 + _664;
    float _668 = -_652;
    float _670 = _668 + 1.0;
    float _672 = fma(_640, _660, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _674 = _656 * _628;
    float _676 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[115].x, _662);
    float _678 = _566 * _670;
    float _680 = fma(_674, _666, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _682 = fma(_672, _610, _676);
    float _684 = fma(_680, _678, _682);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[118].x, _684);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _700 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _712 = in.m_69.x;
    float _714 = in.m_69.y;
    float _716 = in.m_69.z;
    out.m_71.x = _700;
    out.m_71.y = _702;
    out.m_71.z = _704;
    out.m_71.w = _698;
    out.m_73.x = _706;
    out.m_73.y = _636;
    out.m_73.z = _708;
    out.m_73.w = _710;
    float _718 = _518 * _716;
    float _720 = _516 * _714;
    float _722 = _514 * _712;
    bool _724 = !_618;
    float _740;
    if (!_724)
    {
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _170);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_130);
        float _746 = 1.0 / _744;
        float _748 = _170 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _754 = int(_752);
    float _756 = float(_130);
    float _758 = _156 * 2.0;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _762 = _750 + _760;
    float _764 = in.m_65.w;
    float _766 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _768 = int(_766);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _778 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _780 = isnan(_750);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = float(_754);
    float _792 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _794 = int(_792);
    float _796 = -_788;
    float _798 = _796 + 1.0;
    bool _800 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _802 = isnan(_750);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _812;
    float _816 = float(_768);
    float _818 = 1.0 / _790;
    bool _820 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _822 = isnan(_750);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _832;
    bool _836 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _838 = isnan(_750);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _850 = int(_848);
    float _852 = float(uint(_794));
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _856 = float(_794);
    float _858 = 1.0 / _816;
    float _860 = _818 * _170;
    float _862 = float(uint(_850));
    float _864 = 1.0 / _852;
    int _866 = ~_850;
    int _868 = _866 + 1;
    int _870 = ~_850;
    int _872 = _870 + 1;
    float _874 = _858 * _170;
    float _876 = trunc(_860);
    int _878 = int(_876);
    float _880 = 1.0 / _862;
    int _882 = as_type<int>(_864) + (-2);
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _886 = _884 != 0;
    float _888 = trunc(_874);
    int _890 = int(_888);
    float _892 = float(uint(_878));
    float _894 = as_type<float>(_882) * _892;
    int _896 = as_type<int>(_880) + (-2);
    float _898 = 1.0 / _756;
    int _900 = ~_794;
    int _902 = _900 + 1;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_886)
    {
        _904 = 1.0;
    }
    float _906 = _904;
    float _908 = _906;
    if (!_886)
    {
        _908 = 7.345489978790283203125;
    }
    float _910 = _908;
    float _912 = float(uint(_890));
    float _914 = trunc(_894);
    float _916 = precise::max(_914, 0.0);
    uint _919 = uint(_916);
    float _921 = as_type<float>(_896) * _912;
    float _923 = _910 * _152;
    float _925 = _910;
    if (_886)
    {
        _925 = _152;
    }
    float _927 = _925;
    float _929 = trunc(_921);
    float _931 = precise::max(_929, 0.0);
    uint _933 = uint(_931);
    float _935 = _927;
    if (!_886)
    {
        _935 = _154;
    }
    float _937 = _935;
    int _939 = _902 * int(_919);
    int _941 = _939 + _878;
    float _943 = floor(_758);
    float _945 = float(uint(_941));
    int _947 = _868 * int(_933);
    int _949 = _947 + _890;
    float _951 = floor(_923);
    float _953 = as_type<float>(_882) * _945;
    float _955 = _945;
    if (_886)
    {
        _955 = 1.0;
    }
    float _957 = _955;
    float _959 = float(uint(_949));
    float _961 = _957;
    if (!_886)
    {
        _961 = 1.2345600128173828125;
    }
    float _963 = _961;
    float _965 = trunc(_953);
    float _967 = precise::max(_965, 0.0);
    uint _969 = uint(_967);
    float _971 = as_type<float>(_896) * _959;
    float _973 = _937 * _963;
    int _975 = ~_794;
    int _977 = _975 + 1;
    float _979 = float(_878);
    float _981 = trunc(_971);
    float _983 = precise::max(_981, 0.0);
    uint _985 = uint(_983);
    float _987 = floor(_973);
    int _989 = int(_919) + int(_969);
    float _991 = -_951;
    float _993 = _923 + _991;
    int _995 = ~_850;
    int _997 = _995 + 1;
    bool _999 = _979 >= _856;
    bool _1001 = isnan(_979);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(_856);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    int _1011 = _977 * _989;
    int _1013 = _1011 + _878;
    float _1015 = _856 * _993;
    int _1017 = int(_933) + int(_985);
    float _1019 = _898 * _170;
    float _1021 = trunc(_1009);
    int _1023 = int(_1021);
    bool _1025 = uint(_1013) >= uint(_794);
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1029 = _1027 != 0;
    float _1031 = -_987;
    float _1033 = _973 + _1031;
    int _1035 = _997 * _1017;
    int _1037 = _1035 + _890;
    bool _1039 = !_1025;
    int _1041 = _1039 ? 0 : (-1);
    float _1043 = trunc(_1015);
    int _1045 = int(_1043);
    float _1047 = float(_850);
    float _1049 = float(_890);
    bool _1051 = uint(_1037) >= uint(_850);
    float _1053 = _1047 * _1033;
    bool _1055 = _1049 >= _1047;
    bool _1057 = isnan(_1049);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan(_1047);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = _856 * _1019;
    int _1069 = ~_989;
    int _1071 = _1069 + _1041;
    int _1073 = _1071 + 1;
    float _1075 = _1047 * _1019;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1079 = _1077 != 0;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1083 = _1081 != 0;
    float _1085 = trunc(_1065);
    int _1087 = int(_1085);
    bool _1089 = !_1051;
    int _1091 = _1089 ? 0 : (-1);
    int _1093 = _794 * _1073;
    int _1095 = _1093 + _878;
    bool _1097 = !_1029;
    int _1099 = _1097 ? 0 : 1;
    int _1101 = ~_1017;
    int _1103 = _1101 + _1091;
    int _1105 = _1103 + 1;
    int _1107 = abs(_1099);
    float _1109 = trunc(_1053);
    int _1111 = int(_1109);
    bool _1113 = !_1083;
    int _1115 = _1113 ? 0 : 1;
    int _1117 = _850 * _1105;
    int _1119 = _1117 + _890;
    bool _1121 = _794 == 0;
    int _1123 = _1045 * _1107;
    int _1125 = _1123 + _878;
    int _1127 = ~_1023;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    bool _1133 = !_1121;
    int _1135 = _1133 ? _1095 : (-1);
    float _1137 = 1.0 / _772;
    int _1139 = abs(_1115);
    int _1141 = _794 + (-1);
    int _1143 = _1131 * _1135;
    bool _1145 = _850 == 0;
    bool _1147 = !_1079;
    int _1149 = _1147 ? 0 : 1;
    float _1151 = trunc(_1067);
    int _1153 = int(_1151);
    int _1155 = _1023 * _1141;
    int _1157 = _1155 + _1143;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1161 = _1159 != 0;
    int _1163 = ~_1087;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    int _1169 = _1157 * _1139;
    bool _1171 = !_1145;
    int _1173 = _1171 ? _1119 : (-1);
    int _1175 = abs(_1149);
    float _1177 = 1.0 / _776;
    bool _1179 = !_1161;
    int _1181 = _1179 ? 0 : 1;
    int _1183 = _1167 * _1173;
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1187 = _1185 != 0;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1195 = _1193 != 0;
    int _1197 = _850 + (-1);
    int _1199 = _1153 * _1175;
    int _1201 = _1199 + _1169;
    int _1203 = abs(_1181);
    float _1205 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1207 = log2(_1205);
    bool _1209 = !_1191;
    int _1211 = _1209 ? 0 : 1;
    int _1213 = _1087 * _1197;
    int _1215 = _1213 + _1183;
    bool _1217 = !_1195;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = _1125 * _1203;
    int _1223 = _1221 + _1201;
    int _1225 = abs(_1211);
    int _1227 = abs(_1219);
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1231 = _1229 != 0;
    int _1233 = _1215 * _1225;
    float _1235 = trunc(_1075);
    int _1237 = int(_1235);
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1245 = _1243 != 0;
    bool _1247 = !_1231;
    int _1249 = _1247 ? 0 : 1;
    int _1251 = _1045 * _1227;
    int _1253 = _1251 + _1223;
    bool _1255 = !_1187;
    int _1257 = _1255 ? 0 : 1;
    float _1259 = _1207 * _170;
    int _1261 = abs(_1249);
    float _1263 = -_846;
    float _1265 = _1263 + 1.0;
    bool _1267 = !_1241;
    int _1269 = _1267 ? 0 : 1;
    float _1271 = in.m_75.y;
    int _1273 = abs(_1257);
    int _1275 = abs(_1269);
    int _1277 = _1237 * _1273;
    int _1279 = _1277 + _1233;
    float _1281 = float(uint(_1253));
    int _1283 = _1111 * _1261;
    int _1285 = _1283 + _890;
    bool _1287 = !_1245;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = as_type<float>(_882) * _1281;
    int _1293 = abs(_1289);
    int _1295 = ~_850;
    int _1297 = _1295 + 1;
    int _1299 = _1285 * _1275;
    int _1301 = _1299 + _1279;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1305 = _1303 != 0;
    float _1307 = trunc(_1291);
    float _1309 = precise::max(_1307, 0.0);
    uint _1311 = uint(_1309);
    int _1313 = ~_850;
    int _1315 = _1313 + 1;
    int _1317 = _1111 * _1293;
    int _1319 = _1317 + _1301;
    int _1321 = ~_794;
    int _1323 = _1321 + 1;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1327 = _1325 != 0;
    float _1329 = float(uint(_1319));
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1333 = _1331 != 0;
    float _1335 = as_type<float>(_896) * _1329;
    int _1337 = _1275;
    bool _1339 = _1187;
    if (_1305)
    {
        float _1341 = -_192;
        float _1343 = _1341 + 1.0;
        _1337 = as_type<int>(_1343);
    }
    int _1345 = _1337;
    if (_1305)
    {
        bool _1347 = _152 > 0.5;
        _1339 = _1347;
    }
    bool _1349 = _1339;
    int _1351 = _1323 * int(_1311);
    int _1353 = _1351 + _1253;
    float _1355 = trunc(_1335);
    float _1357 = precise::max(_1355, 0.0);
    uint _1359 = uint(_1357);
    float _1361 = float(uint(_1353));
    float _1363 = as_type<float>(_882) * _1361;
    int _1365 = ~_794;
    int _1367 = _1365 + 1;
    float _1369 = trunc(_1363);
    float _1371 = precise::max(_1369, 0.0);
    uint _1373 = uint(_1371);
    int _1375 = _1297 * int(_1359);
    int _1377 = _1375 + _1319;
    float _1379 = float(uint(_1377));
    float _1381 = as_type<float>(_896) * _1379;
    int _1383 = int(_1311) + int(_1373);
    float _1385 = as_type<float>(_1373);
    if (!_1305)
    {
        _1385 = _192;
    }
    float _1387 = _1385;
    float _1389 = trunc(_1381);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    float _1395 = _1387;
    if (_1305)
    {
        float _1397 = _1349 ? as_type<float>(_1345) : _192;
        _1395 = _1397;
    }
    float _1399 = _1395;
    int _1401 = _1367 * _1383;
    int _1403 = _1401 + _1253;
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1407 = _1405 != 0;
    bool _1409 = _154 > 0.5;
    bool _1411 = uint(_1403) >= uint(_794);
    float _1413 = in.m_46.x;
    float _1415 = in.m_46.y;
    float _1417 = in.m_46.z;
    bool _1419 = !_1411;
    int _1421 = _1419 ? 0 : (-1);
    bool _1423 = _156 > 0.5;
    int _1425 = int(_1359) + int(_1393);
    int _1427 = ~_1383;
    int _1429 = _1427 + _1421;
    int _1431 = _1429 + 1;
    float _1433 = -_196;
    float _1435 = _1433 + 1.0;
    float _1437 = in.m_77.w;
    int _1439 = _1315 * _1425;
    int _1441 = _1439 + _1319;
    float _1443 = _152 * 2.0;
    int _1445 = _794 * _1431;
    int _1447 = _1445 + _1253;
    int _1449 = _1409 ? as_type<int>(_1435) : as_type<int>(_196);
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1453 = _1451 != 0;
    float _1455 = _1327 ? as_type<float>(_1449) : _196;
    float _1457 = floor(_1443);
    if (_1407)
    {
        float _1459 = _1423 ? _1435 : _196;
        _242 = _1459;
    }
    float _1461 = _242;
    float _1463 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1465 = uint(_1441) >= uint(_850);
    float _1467 = _212 * _1415;
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1471 = _1469 != 0;
    float _1473 = _1415 + _1271;
    bool _1475 = !_1465;
    int _1477 = _1475 ? 0 : (-1);
    float _1479 = fma(_210, _1413, _1467);
    bool _1481 = _154 > 0.5;
    bool _1483 = _1481 && _1333;
    float _1485 = _218 * _1415;
    int _1487 = ~_1425;
    int _1489 = _1487 + _1477;
    int _1491 = _1489 + 1;
    float _1493 = _154 * 2.0;
    float _1495 = float(uint(_1125));
    float _1497 = fma(_216, _1413, _1485);
    bool _1499 = !_1121;
    int _1501 = _1499 ? _1447 : (-1);
    int _1503 = _850 * _1491;
    int _1505 = _1503 + _1319;
    float _1507 = _1415;
    if (!_1333)
    {
        _1507 = _192;
    }
    float _1509 = _1507;
    float _1511 = as_type<float>(_882) * _1495;
    int _1513 = _1501 & 3;
    out.m_79.w = _1437;
    bool _1515 = !_1145;
    int _1517 = _1515 ? _1505 : (-1);
    float _1519 = _1509;
    if (_1483)
    {
        float _1521 = -_192;
        float _1523 = _1521 + 1.0;
        _244 = _1523;
    }
    float _1525 = _244;
    float _1527 = trunc(_1511);
    float _1529 = precise::max(_1527, 0.0);
    uint _1531 = uint(_1529);
    bool _1533 = _1513 != 3;
    float _1535 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1537 = uint(_1513) >= 2u;
    if (_1333)
    {
        _1519 = _1525;
    }
    float _1539 = _1519;
    int _1541 = ~_794;
    int _1543 = _1541 + 1;
    float _1545 = floor(_1493);
    int _1547 = _1517 & 3;
    int _1549 = _1537 ? 0 : 1;
    bool _1551 = uint(_1547) >= 2u;
    bool _1553 = uint(_1513) > 1u;
    int _1555 = _1543 * int(_1531);
    int _1557 = _1555 + _1125;
    int _1559 = _1551 ? 0 : 1;
    bool _1561 = _1547 != 3;
    int _1563 = ~_1549;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = _1567;
    if (_1533)
    {
        int _1571 = ~_1549;
        int _1573 = _1571 + 1;
        _1569 = _1573;
    }
    int _1575 = _1569;
    int _1577 = _1501 & 3;
    bool _1579 = _1577 != 0;
    float _1581 = float(uint(_1557));
    int _1583 = ~_1559;
    int _1585 = _1583 + 1;
    int _1587 = _1585 + 1;
    int _1589 = _1579 ? 0 : 1;
    float _1591 = as_type<float>(_882) * _1581;
    int _1593 = _1587;
    if (_1561)
    {
        int _1595 = ~_1559;
        int _1597 = _1595 + 1;
        _1593 = _1597;
    }
    int _1599 = _1593;
    float _1601 = _152 + _154;
    float _1603 = float(uint(_1285));
    float _1605 = trunc(_1591);
    float _1607 = precise::max(_1605, 0.0);
    uint _1609 = uint(_1607);
    int _1611 = ~_1589;
    int _1613 = _1611 + 1;
    int _1615 = _1613 + 1;
    float _1617 = _1601 + (-1.0);
    int _1619 = _1615;
    if (!_1553)
    {
        int _1621 = ~_1589;
        int _1623 = _1621 + 1;
        _1619 = _1623;
    }
    int _1625 = _1619;
    float _1627 = as_type<float>(_896) * _1603;
    float _1629 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1631 = trunc(_1627);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    bool _1637 = uint(_1547) > 1u;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1641 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1645 = _1517 & 3;
    bool _1647 = _1645 != 0;
    float _1649 = -_1639;
    float _1651 = fma(_1463, 2.0, _1649);
    float _1653 = fma(_1641, -2.0, _1643);
    int _1655 = _1647 ? 0 : 1;
    float _1657 = _154 + _156;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1659;
    int _1663 = ~_1655;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    float _1669 = _1657 + (-1.0);
    int _1671 = _1667;
    if (!_1637)
    {
        int _1673 = ~_1655;
        int _1675 = _1673 + 1;
        _1671 = _1675;
    }
    int _1677 = _1671;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1683 = int(_1531) + int(_1609);
    float _1685 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1687 = ~_794;
    int _1689 = _1687 + 1;
    int _1691 = _872 * int(_1635);
    int _1693 = _1691 + _1285;
    bool _1695 = !_1453;
    int _1697 = _1695 ? 0 : 1;
    float _1699 = 1.0 / _1661;
    bool _1701 = _1457 > 0.0;
    int _1703 = _1689 * _1683;
    int _1705 = _1703 + _1125;
    bool _1707 = _1457 >= 0.0;
    bool _1709 = isnan(_1457);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan(0.0);
    bool _1715 = _1711 || _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1717;
    float _1721 = float(uint(_1693));
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1727 = !_1471;
    int _1729 = _1727 ? 0 : 1;
    float _1731 = 1.0 / _1681;
    int _1733 = _1715 ? 0 : 1;
    float _1735 = as_type<float>(_896) * _1721;
    bool _1737 = uint(_1705) >= uint(_794);
    float _1739 = fma(_220, _1417, _1497);
    bool _1741 = _1545 >= 0.0;
    bool _1743 = isnan(_1545);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan(0.0);
    bool _1749 = _1745 || _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1753 = _750 + _1751;
    int _1755 = ~_1733;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = 1.0 / _1719;
    bool _1763 = !_1737;
    int _1765 = _1763 ? 0 : (-1);
    float _1767 = -_170;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1651);
    bool _1771 = _1545 > 0.0;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1775 = _750 + _1773;
    int _1777 = _1759;
    if (!_1701)
    {
        int _1779 = ~_1733;
        int _1781 = _1779 + 1;
        _1777 = _1781;
    }
    int _1783 = _1777;
    float _1785 = fma(_214, _1417, _1479);
    int _1787 = _1749 ? 0 : 1;
    float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1789;
    bool _1793 = _943 > 0.0;
    float _1795 = _1775 * _1699;
    bool _1797 = _943 >= 0.0;
    bool _1799 = isnan(_943);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1809 = _750 + _1807;
    float _1811 = trunc(_1735);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1819 = _750 + _1817;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1823 = _750 + _1821;
    float _1825 = _1809 * _1731;
    float _1827 = _1753 * _1761;
    float _1829 = _1819 * _1137;
    int _1831 = ~_850;
    int _1833 = _1831 + 1;
    float _1835 = _1823 * _1177;
    float _1837 = 1.0 / _1791;
    int _1839 = ~_1787;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = _1739 + _764;
    int _1847 = _1843;
    if (!_1771)
    {
        int _1849 = ~_1787;
        int _1851 = _1849 + 1;
        _1847 = _1851;
    }
    int _1853 = _1847;
    float _1855 = 1.0 / _1725;
    int _1857 = int(_1635) + int(_1815);
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1863 = _750 + _1861;
    int _1865 = _1833 * _1857;
    int _1867 = _1865 + _1285;
    float _1869 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1859);
    float _1871 = _762 * _1837;
    bool _1873 = uint(_1867) >= uint(_850);
    float _1875 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1869);
    float _1877 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1653);
    float _1879 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1881 = _1805 ? 0 : 1;
    float _1883 = _1863 * _1855;
    float _1885 = -_1877;
    float _1887 = fma(_1875, _1879, _1885);
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1891 = _1889 != 0;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1895 = _1893 != 0;
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1899 = _1897 != 0;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1905;
    float _1909 = fma(_1903, _1795, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1915;
    float _1919 = fma(_1907, _1795, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1925;
    float _1929 = fma(_1917, _1829, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1935 = fma(_1913, _1825, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1937 = fma(_1923, _1825, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1939 = fma(_1927, _1829, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1943 = _1941 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1945 = fma(_1933, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1947 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1955 = fma(_1943, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1957;
    bool _1961 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1963 = isnan(_750);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1969 = _1965 || _1967;
    float _1971 = float(_1969);
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _1977 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1979 = isnan(_750);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = fma(_1949, _1827, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1991 = fma(_1959, _1827, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1993 = fma(_1953, _1883, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1995 = fma(_1975, _1883, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1997 = -_1971;
    float _1999 = _1997 + 1.0;
    bool _2001 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2003 = isnan(_750);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1987;
    float _2015 = _2013 + 1.0;
    bool _2017 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2019 = isnan(_750);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    float _2029 = _1987 * _1999;
    int _2031 = abs(_1625);
    float _2033 = _2011 * _2015;
    float _2035 = -_2011;
    float _2037 = _2035 + 1.0;
    bool _2039 = !_1579;
    int _2041 = _2039 ? 0 : 1;
    float _2043 = in.m_63.w;
    int _2045 = abs(_1575);
    float _2047 = _788 * _2037;
    float _2049 = _810 * _798;
    float _2051 = -_810;
    float _2053 = _2051 + 1.0;
    float _2055 = fma(_814, _1871, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2057 = fma(_834, _1871, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2059 = -_830;
    float _2061 = _2059 + 1.0;
    float _2063 = _830 * _2053;
    float _2065 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _854);
    int _2067 = abs(_1599);
    float _2069 = _846 * _2061;
    float _2071 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2073 = _2027 * _1265;
    float _2075 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2065);
    float _2077 = -_2027;
    float _2079 = _2077 + 1.0;
    float _2081 = exp2(_1259);
    float _2083 = _1909 * _2073;
    float _2085 = _1919 * _2073;
    int _2087 = _1501 >> 31;
    float _2089 = fma(_2075, _2071, _1769);
    int _2091 = _2087 & 3;
    float _2093 = _1785 + _2043;
    int _2095 = ~_1881;
    int _2097 = _2095 + 1;
    int _2099 = _2097 + 1;
    float _2101 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2083);
    int _2103 = _2099;
    float _2105 = _2049;
    float _2107 = _2055;
    if (!_1793)
    {
        int _2109 = ~_1881;
        int _2111 = _2109 + 1;
        _2103 = _2111;
    }
    int _2113 = _2103;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2117 = 1.0 + _2115;
    int _2119 = _1517 >> 31;
    float _2121 = fma(_1935, _2069, _2101);
    int _2123 = _1501 + _2091;
    float _2125 = _1887 + 0.5;
    int _2127 = _2119 & 3;
    float _2129 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2085);
    float _2131 = _2089 + 0.5;
    float _2133 = -_2081;
    float _2135 = _2133 + 1.0;
    int _2137 = _1517 + _2127;
    float _2139 = fma(_1937, _2069, _2129);
    int _2141 = _2123 >> 2;
    out.m_81.x = _2131;
    out.m_81.y = _2125;
    int _2143 = _2137 >> 2;
    float _2145 = fma(_1939, _2063, _2139);
    int _2147 = _2141 << 4;
    int _2149 = _2147 + 368;
    float _2151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2153 = _2143 << 4;
    int _2155 = _2153 + 512;
    float _2157 = fma(_1929, _2063, _2121);
    uint _2159 = uint(int(uint(_2149) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[int(_2169)][_2171];
    bool _2175 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2177 = isnan(0.0);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2183 = _2179 || _2181;
    float _2185 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2187 = fma(_1945, _2049, _2157);
    bool _2189 = !_1647;
    int _2191 = _2189 ? 0 : 1;
    float _2193 = 1.0 / _2117;
    float _2195 = _2183 ? _2135 : 0.0;
    float _2197 = fma(_1989, _2047, _2187);
    uint _2199 = uint(int(uint(_2155) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[int(_2209)][_2211];
    bool _2215 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2217 = isnan(1.0);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2223 = _2219 || _2221;
    float _2225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2227 = _1473 + _2225;
    bool _2229 = _1513 != 3;
    float _2231 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2233 = _1845 + _2231;
    float _2235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2237 = _2185 * _2151;
    int _2239 = abs(_2191);
    int _2241 = _2149 + 8;
    uint _2243 = uint(int(uint(_2241) >> uint(2)));
    uint _2245 = uint(int(uint(int(_2243)) >> uint(2)));
    int _2247 = int(_2243) & 3;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[int(_2245)][_2247];
    int _2251 = int(_2243) + 1;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    int _2255 = _2251 & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    bool _2259 = !_1873;
    int _2261 = _2259 ? 0 : (-1);
    float _2263 = fma(_1993, _2033, _2197);
    int _2265 = abs(_1729);
    int _2267 = ~_1857;
    int _2269 = _2267 + _2261;
    int _2271 = _2269 + 1;
    if (_2223)
    {
        float _2273 = _2195 * _2193;
        _172 = _2273;
    }
    float _2275 = _172;
    float _2277 = fma(_1955, _2049, _2145);
    int _2279 = _2155 + 8;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    uint _2283 = uint(int(uint(int(_2281)) >> uint(2)));
    int _2285 = int(_2281) & 3;
    float _2287 = (*spvDescriptorSet0.vp_c9)._m0[int(_2283)][_2285];
    int _2289 = int(_2281) + 1;
    uint _2291 = uint(int(uint(_2289) >> uint(2)));
    int _2293 = _2289 & 3;
    float _2295 = (*spvDescriptorSet0.vp_c9)._m0[int(_2291)][_2293];
    bool _2297 = !_2229;
    int _2299 = _2297 ? 0 : (-1);
    bool _2301 = _1547 != 3;
    float _2303 = fma(_1991, _2047, _2277);
    float _2305 = _1535 * _2235;
    int _2307 = ~_1683;
    int _2309 = _2307 + _1765;
    int _2311 = _2309 + 1;
    float _2313 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2315 = abs(_1677);
    float _2317 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2319 = _2093 + _2317;
    out.m_83.x = _2237;
    out.m_83.y = _2305;
    int _2321 = abs(_2041);
    int _2323 = _794 * _2311;
    int _2325 = _2323 + _1125;
    int _2327 = ~_2315;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    float _2333 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2313);
    int _2335 = ~_2321;
    int _2337 = _2335 + 1;
    int _2339 = _2337 + 1;
    float _2341 = fma(_1995, _2033, _2303);
    bool _2343 = !_2301;
    int _2345 = _2343 ? 0 : (-1);
    float _2347 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2333);
    bool _2349 = _794 == 0;
    float _2351 = fma(_2057, _2029, _2341);
    int _2353 = ~_2031;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    bool _2359 = _850 == 0;
    bool _2361 = _2347 >= 0.0;
    int _2363 = _2357 * as_type<int>(_2173);
    int _2365 = ~_2239;
    int _2367 = _2365 + 1;
    int _2369 = _2367 + 1;
    int _2371 = _2331 * as_type<int>(_2213);
    int _2373 = ~_2045;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    int _2379 = _2339 * as_type<int>(_2165);
    int _2381 = _2379 + _2363;
    int _2383 = abs(_1697);
    int _2385 = _2369 * as_type<int>(_2205);
    int _2387 = _2385 + _2371;
    int _2389 = abs(_2299);
    int _2391 = _2377 * as_type<int>(_2249);
    int _2393 = _2391 + _2381;
    int _2395 = ~_2067;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    float _2401 = fma(_2055, _2029, _2263);
    int _2403 = ~_2389;
    int _2405 = _2403 + 1;
    int _2407 = _2405 + 1;
    if (_2361)
    {
        out.m_49.x = 0.0;
    }
    int _2409 = abs(_2345);
    float _2411 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2401);
    int _2413 = ~_2383;
    int _2415 = _2413 + 1;
    int _2417 = _2415 + 1;
    int _2419 = _2399 * as_type<int>(_2287);
    int _2421 = _2419 + _2387;
    int _2423 = _2407 * as_type<int>(_2257);
    int _2425 = _2423 + _2393;
    int _2427 = ~_2409;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    int _2433 = _850 * _2271;
    int _2435 = _2433 + _1285;
    int _2437 = ~_2265;
    int _2439 = _2437 + 1;
    int _2441 = _2439 + 1;
    int _2443 = _2417 * _2425;
    bool _2445 = !_2349;
    int _2447 = _2445 ? _2325 : (-1);
    int _2449 = _2431 * as_type<int>(_2295);
    int _2451 = _2449 + _2421;
    bool _2453 = !_2359;
    int _2455 = _2453 ? _2435 : (-1);
    float _2457 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2351);
    bool _2459 = !_1891;
    int _2461 = _2459 ? 0 : 1;
    int _2463 = _2441 * _2451;
    bool _2465 = !_1899;
    int _2467 = _2465 ? 0 : 1;
    int _2469 = _2447 * _2383;
    int _2471 = _2469 + _2443;
    float _2473 = _2227 * _2227;
    bool _2475 = !_1895;
    int _2477 = _2475 ? 0 : 1;
    int _2479 = _2455 * _2265;
    int _2481 = _2479 + _2463;
    float _2483 = as_type<float>(_2463);
    if (_2361)
    {
        _2483 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2485 = _2483;
    float _2487 = fma(_2319, _2319, _2473);
    int _2489 = abs(_2477);
    out.m_85.x = _2411;
    out.m_85.y = _2457;
    float _2491 = float(_2471);
    float _2493 = fma(_2233, _2233, _2487);
    float _2495 = float(_1783);
    float _2497 = float(_2489);
    float _2499 = rsqrt(_2493);
    float _2501 = float(_2481);
    int _2503 = as_type<int>(_2485);
    if (_2361)
    {
        float _2505 = _2485 * 5.0;
        _2503 = as_type<int>(_2505);
    }
    int _2507 = _2503;
    int _2509 = abs(_2461);
    float _2511 = _2497 * _2495;
    float _2513 = float(_2113);
    float _2515 = in.m_87.x;
    float _2517 = in.m_87.y;
    float _2519 = in.m_87.z;
    float _2521 = float(_2509);
    if (_2361)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7802 = as_type<float>(_2507);
        out.gl_Position.z = _7802;
    }
    out.m_89.x = _2491;
    out.m_89.y = _2501;
    float _2523 = _2227 * _2499;
    float _2525 = _2319 * _2499;
    float _2527 = _2523;
    if (_2361)
    {
        return out;
    }
    float _2529 = -_2523;
    float _2531 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    float _2533 = _2233 * _2499;
    float _2535 = -_2525;
    float _2537 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2093);
    float _2539 = _2521 * _2513;
    float _2541 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2543 = _2531 + _2541;
    float _2545 = -_2533;
    float _2547 = fma(_2545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1845);
    float _2549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2551 = _2537 + _2549;
    float _2553 = _2539 * (-2.0);
    float _2555 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2559 = _2547 + _2557;
    float _2561 = _152 + (-0.5);
    float _2563 = -_2523;
    float _2565 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2227);
    float _2567 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2555);
    float _2569 = fma(_2553, _2515, _2515);
    float _2571 = -_2525;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2319);
    float _2575 = _2565 * _2565;
    float _2577 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2567);
    float _2579 = fma(_1629, _2553, _1629);
    float _2581 = fma(_2561, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2569);
    float _2583 = _2511 * (-2.0);
    float _2585 = fma(_2573, _2573, _2575);
    bool _2587 = _2577 >= 0.0;
    float _2589 = -_2533;
    float _2591 = fma(_2589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2233);
    float _2593 = fma(_2579, _2275, _2581);
    float _2595 = _154 + (-0.5);
    float _2597 = fma(_2583, _2517, _2517);
    float _2599 = fma(_2591, _2591, _2585);
    float _2601 = _2593 * 0.15915493667125701904296875;
    int _2603 = abs(_2467);
    float _2605 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2597);
    float _2607 = sqrt(_2599);
    float _2609 = fma(_1685, _2583, _1685);
    float _2611 = float(_1853);
    float _2613 = _2597;
    float _2615 = _2565;
    if (_2587)
    {
        _2613 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2617 = _2613;
    int _2619 = as_type<int>(_2617);
    if (_2587)
    {
        out.m_49.x = 0.0;
    }
    float _2621 = float(_2603);
    float _2623 = fma(_2609, _2275, _2605);
    float _2625 = _2601 * 6.283185482025146484375;
    float _2627 = sin(_2625);
    if (_2587)
    {
        float _2629 = _2617 * 5.0;
        _2619 = as_type<int>(_2629);
    }
    int _2631 = _2619;
    float _2633 = _152 + _156;
    float _2635 = _2621 * _2611;
    if (_2587)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8005 = as_type<float>(_2631);
        out.gl_Position.z = _8005;
    }
    float _2637 = _2601 * 6.283185482025146484375;
    float _2639 = cos(_2637);
    if (_2587)
    {
        return out;
    }
    float _2641 = -_1473;
    float _2643 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2645 = -_2093;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2649 = _2623 * 0.15915493667125701904296875;
    float _2651 = _2643 * _2643;
    float _2653 = _2633 + (-1.0);
    float _2655 = -_1845;
    float _2657 = _2655 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2659 = _2635 * (-2.0);
    float _2661 = fma(_2647, _2647, _2651);
    float _2663 = fma(_2653, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2665 = _156 + (-0.5);
    float _2667 = _2499 * _2607;
    float _2669 = fma(_2657, _2657, _2661);
    float _2671 = fma(_2659, _2519, _2519);
    float _2673 = fma(_2663, _2659, _2663);
    float _2675 = _2649 * 6.283185482025146484375;
    float _2677 = sin(_2675);
    float _2679 = in.m_91.x;
    float _2681 = in.m_91.y;
    float _2683 = in.m_91.z;
    float _2685 = fma(_2665, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2671);
    float _2687 = fma(_2673, _2275, _2685);
    float _2689 = rsqrt(_2669);
    float _2691 = _2687 * 0.15915493667125701904296875;
    float _2693 = _2649 * 6.283185482025146484375;
    float _2695 = cos(_2693);
    float _2697 = _2627 * _2677;
    float _2699 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2701 = _2639 * _2677;
    float _2703 = _2647 * _2689;
    float _2705 = _2657 * _2689;
    float _2707 = _2643 * _2689;
    float _2709 = _2691 * 6.283185482025146484375;
    float _2711 = sin(_2709);
    float _2713 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2715 = _2703 * _2713;
    float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2719 = _2705 * _2717;
    float _2721 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2723 = -_2715;
    float _2725 = fma(_2705, _2721, _2723);
    float _2727 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2729 = -_2719;
    float _2731 = fma(_2707, _2727, _2729);
    float _2733 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2735 = _2707 * _2733;
    float _2737 = _2639 * _2695;
    float _2739 = _2725 * _2725;
    float _2741 = _2691 * 6.283185482025146484375;
    float _2743 = cos(_2741);
    float _2745 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2747 = -_2735;
    float _2749 = fma(_2703, _2745, _2747);
    float _2751 = _2667 * _2699;
    float _2753 = fma(_2731, _2731, _2739);
    float _2755 = fma(_2711, _2737, _2697);
    float _2757 = fma(_2749, _2749, _2753);
    float _2759 = fma(_2711, _2697, _2737);
    float _2761 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2763 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2765 = _2627 * _2695;
    float _2767 = rsqrt(_2757);
    float _2769 = _2667 * _2763;
    float _2771 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2681);
    float _2773 = _2677 * _2743;
    float _2775 = _2639 * _2743;
    float _2777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2679);
    float _2779 = _2771 * _2769;
    float _2781 = _2667 * _2761;
    float _2783 = -_2701;
    float _2785 = fma(_2711, _2765, _2783);
    float _2787 = -_2765;
    float _2789 = fma(_2711, _2701, _2787);
    float _2791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2683);
    float _2793 = _2777 * _2781;
    float _2795 = _2775 * _2779;
    float _2797 = _2627 * _2743;
    float _2799 = _2695 * _2743;
    float _2801 = _2791 * _2751;
    float _2803 = _2731 * _2767;
    float _2805 = _2725 * _2767;
    float _2807 = -_2779;
    float _2809 = _2711 * _2807;
    float _2811 = fma(_2755, _2793, _2795);
    float _2813 = _2707 * _2803;
    float _2815 = _2797 * _2779;
    float _2817 = _2749 * _2767;
    float _2819 = fma(_2799, _2793, _2809);
    float _2821 = fma(_2789, _2801, _2811);
    float _2823 = _2705 * _2805;
    float _2825 = -_2813;
    float _2827 = fma(_2703, _2805, _2825);
    float _2829 = fma(_2785, _2793, _2815);
    float _2831 = fma(_2773, _2801, _2819);
    float _2833 = -_2823;
    float _2835 = fma(_2707, _2817, _2833);
    float _2837 = _2827 * _2821;
    float _2839 = fma(_2759, _2801, _2829);
    float _2841 = _2703 * _2817;
    float _2843 = _2835 * _2821;
    float _2845 = fma(_2817, _2831, _2837);
    float _2847 = -_2841;
    float _2849 = fma(_2705, _2803, _2847);
    float _2851 = fma(_2803, _2831, _2843);
    float _2853 = fma(_2705, _2839, _2845);
    float _2855 = fma(_2703, _2839, _2851);
    float _2857 = _1845 + _2853;
    float _2859 = _2849 * _2821;
    float _2861 = _2093 + _2855;
    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2865 = _2857 + _2863;
    float _2867 = fma(_2805, _2831, _2859);
    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2871 = _2861 + _2869;
    float _2873 = _2865 * _2865;
    float _2875 = fma(_2707, _2839, _2867);
    float _2877 = fma(_2871, _2871, _2873);
    float _2879 = _1473 + _2875;
    float _2881 = sqrt(_2877);
    bool _2883 = _2881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2885 = _2821;
    float _2887 = _2873;
    float _2889 = _2861;
    float _2891 = _2839;
    if (!_2883)
    {
        _2885 = _2857;
    }
    float _2893 = _2885;
    float _2895 = _2893;
    if (!_2883)
    {
        _2887 = _2879;
    }
    float _2897 = _2887;
    bool _2899 = !_2883;
    float _2901 = _2897;
    if (!_2899)
    {
        float _2903 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2905 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2907 = _2881 + _2905;
        float _2909 = rsqrt(_2877);
        float _2911 = _2907 * _2903;
        float _2913 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2915 = _2911 * 0.15915493667125701904296875;
        float _2917 = _2915 * 6.283185482025146484375;
        float _2919 = cos(_2917);
        float _2921 = _2915 * 6.283185482025146484375;
        float _2923 = sin(_2921);
        float _2925 = _2919 + (-1.0);
        float _2927 = fma(_2923, _2913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2929 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2931 = _2909 * _2927;
        float _2933 = fma(_2879, _2919, _2929);
        float _2935 = fma(_2871, _2931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2937 = fma(_2865, _2931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2901 = _2933;
        _2889 = _2935;
        _2895 = _2937;
        _2891 = _2931;
    }
    float _2939 = _2901;
    float _2941 = _2889;
    float _2943 = _2895;
    float _2945 = _2891;
    float _2947 = -_1473;
    float _2949 = _2947 + _2939;
    float _2951 = -_2093;
    float _2953 = _2951 + _2941;
    float _2955 = -_1845;
    float _2957 = _2955 + _2943;
    float _2959 = _2949 * _2949;
    bool _2961 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2963 = isnan(0.5);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2969 = _2965 || _2967;
    bool _2971 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2973 = isnan(0.5);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2979 = _2975 || _2977;
    float _2981 = fma(_2953, _2953, _2959);
    float _2983 = fma(_2957, _2957, _2981);
    float _2985 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2987 = sqrt(_2983);
    float _2989 = fma(_2537, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2985);
    float _2991 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2993 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2989);
    float _2995 = fma(_2537, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2991);
    float _2997 = _2993 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2999 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2995);
    float _3001 = 1.0 / _2997;
    float _3003 = _2999 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3005 = _2987 > 0.0;
    float _3007 = _3003 + _2997;
    float _3009 = _2945;
    float _3011 = _2987;
    float _3013 = _2939;
    if (!_3005)
    {
        _3009 = _2941;
    }
    float _3015 = _3009;
    float _3017 = _3015;
    float _3019 = _3015;
    if (!_3005)
    {
        _3011 = _2943;
    }
    float _3021 = _3011;
    bool _3023 = !_3005;
    float _3025 = _3021;
    float _3027 = _3001;
    if (!_3023)
    {
        float _3029 = _232 * _232;
        float _3031 = fma(_236, _236, _3029);
        float _3033 = fma(_238, _238, _3031);
        float _3035 = rsqrt(_2983);
        float _3037 = sqrt(_3033);
        float _3039 = _2953 * _3035;
        float _3041 = _2949 * _3035;
        float _3043 = _2957 * _3035;
        bool _3045 = _3037 > 0.0;
        float _3047 = _3037;
        if (!_3045)
        {
            _3017 = _2941;
        }
        float _3049 = _3017;
        _3019 = _3049;
        if (!_3045)
        {
            _3047 = _2943;
        }
        float _3051 = _3047;
        bool _3053 = !_3045;
        _3025 = _3051;
        if (!_3053)
        {
            float _3055 = rsqrt(_3033);
            float _3057 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3059 = _232 * _3055;
            float _3061 = _236 * _3055;
            float _3063 = _3041 * _3059;
            float _3065 = _238 * _3055;
            float _3067 = fma(_3039, _3061, _3063);
            float _3069 = _3057 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3071 = fma(_3043, _3065, _3067);
            float _3073 = _3071 * _3069;
            float _3075 = fma(_232, _3073, _2939);
            float _3077 = fma(_236, _3073, _2941);
            float _3079 = fma(_238, _3073, _2943);
            _3013 = _3075;
            _3019 = _3077;
            _3025 = _3079;
        }
    }
    float _3081 = _3013;
    float _3083 = _3019;
    float _3085 = _3025;
    float _3087 = -_2523;
    float _3089 = fma(_3087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3081);
    float _3091 = -_2525;
    float _3093 = fma(_3091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3083);
    float _3095 = -_2533;
    float _3097 = fma(_3095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3085);
    float _3099 = _3007 * _3001;
    float _3101 = _3099 * 0.5;
    float _3103 = _3089;
    float _3105 = _3093;
    float _3107 = _3097;
    if (_2979)
    {
        _2527 = 1.0;
    }
    float _3109 = _2527;
    float _3111 = _3109;
    if (!_2969)
    {
        float _3113 = _2543 * _2543;
        float _3115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3117 = -_1845;
        float _3119 = _3117 + _3085;
        float _3121 = -_2093;
        float _3123 = _3121 + _3083;
        float _3125 = fma(_2551, _2551, _3113);
        float _3127 = -_1473;
        float _3129 = _3127 + _3081;
        float _3131 = fma(_2559, _2559, _3125);
        float _3133 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3135 = sqrt(_3131);
        float _3137 = 1.0 / _2667;
        float _3139 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3141 = precise::min(_3135, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3143 = _3141 * _3115;
        float _3145 = _3143 * _3137;
        float _3147 = _3139 * _3145;
        float _3149 = _3119 * _3145;
        float _3151 = fma(_3123, _3147, _2537);
        float _3153 = fma(_3129, _3147, _2531);
        float _3155 = fma(_3139, _3149, _2547);
        _3103 = _3153;
        _3105 = _3151;
        _3107 = _3155;
        _246 = _3145;
    }
    float _3157 = _3103;
    float _3159 = _3105;
    float _3161 = _3107;
    float _3163 = _246;
    float _3165 = _3163;
    if (!_2979)
    {
        float _3167 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3169 = _3167 * 0.15915493667125701904296875;
        float _3171 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3173 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3175 = fma(_3101, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3173);
        float _3177 = _3169 * 6.283185482025146484375;
        float _3179 = cos(_3177);
        float _3181 = _3171 * 0.15915493667125701904296875;
        float _3183 = _3169 * 6.283185482025146484375;
        float _3185 = sin(_3183);
        float _3187 = 1.0 / _3179;
        float _3189 = _3181 * 6.283185482025146484375;
        float _3191 = cos(_3189);
        float _3193 = _3185 * _3187;
        float _3195 = _3181 * 6.283185482025146484375;
        float _3197 = sin(_3195);
        float _3199 = _3191 * _3193;
        float _3201 = 1.0 / _3175;
        float _3203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3205 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3203;
        float _3207 = 1.0 / _3199;
        float _3209 = 1.0 / _3205;
        float _3211 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3213 = _3201 * _3211;
        float _3215 = _3197 * _3207;
        float _3217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3219 = fma(_3215, _3213, _3217);
        float _3221 = _3219 * _3209;
        float _3223 = precise::clamp(_3221, 0.0, 1.0);
        _3111 = _3223;
    }
    float _3225 = _3111;
    float _3227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3229 = _3157 + _3227;
    float _3231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3233 = _3159 + _3231;
    float _3235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3237 = _3161 + _3235;
    float _3239 = fma(_2943, 6.2500002968590706586837768554688e-05, 0.5);
    float _3241 = _3229 * _3229;
    float _3243 = fma(_3233, _3233, _3241);
    float _3245 = fma(_3237, _3237, _3243);
    float _3247 = rsqrt(_3245);
    float _3249 = sqrt(_3245);
    float _3251 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3253 = _3233 * _3251;
    float _3255 = _3237 * _3251;
    float _3257 = _3253 * _3253;
    float _3259 = _3255 * _3255;
    float _3261 = _3257 + _3259;
    float _3263 = sqrt(_3261);
    bool _3265 = _3263 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3269 = _3263 + _3267;
    float _3271 = _3237;
    float _3273 = _3241;
    float _3275 = _3269;
    float _3277 = _3251;
    if (_3265)
    {
        float _3279 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3271 = _3279;
    }
    float _3281 = _3271;
    if (_3265)
    {
        float _3283 = rsqrt(_3261);
        _3273 = _3283;
    }
    float _3285 = _3273;
    float _3287 = _3285;
    if (_3265)
    {
        float _3289 = _3269 * _3281;
        _3275 = _3289;
    }
    float _3291 = _3275;
    if (_3265)
    {
        float _3293 = _3291 * 0.15915493667125701904296875;
        _3165 = _3293;
    }
    float _3295 = _3165;
    float _3297 = _3281;
    if (_3265)
    {
        float _3299 = _3295 * 6.283185482025146484375;
        float _3301 = sin(_3299);
        _3297 = _3301;
    }
    float _3303 = _3297;
    float _3305 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3307 = precise::max(0.0, _3305);
    float _3309 = _3247;
    float _3311 = _3307;
    if (_3265)
    {
        float _3313 = _3295 * 6.283185482025146484375;
        float _3315 = cos(_3313);
        _3309 = _3315;
    }
    float _3317 = _3309;
    float _3319 = -_3251;
    float _3321 = -_3307;
    float _3323 = fma(_3229, _3319, _3321);
    float _3325 = _3323;
    if (_3265)
    {
        float _3327 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3311 = _3327;
    }
    float _3329 = _3311;
    float _3331 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3333 = _3303;
    float _3335 = _3329;
    if (_3265)
    {
        float _3337 = fma(_3303, _3329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3277 = _3337;
    }
    float _3339 = _3277;
    if (!_3265)
    {
        _3333 = _3253;
    }
    float _3341 = _3333;
    float _3343 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3331);
    float _3345 = _3341;
    float _3347 = _3317;
    if (_3265)
    {
        float _3349 = _3317 + (-1.0);
        _3335 = _3349;
    }
    float _3351 = _3335;
    float _3353 = _3351;
    if (_3265)
    {
        float _3355 = _3285 * _3339;
        _3027 = _3355;
    }
    float _3357 = _3027;
    float _3359 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3361 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3343);
    if (_3265)
    {
        float _3363 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3287 = _3363;
    }
    float _3365 = _3287;
    float _3367 = _3365;
    if (_3265)
    {
        float _3369 = _3253 * _3357;
        _3345 = _3369;
    }
    float _3371 = _3345;
    if (!_3265)
    {
        _3353 = _3255;
    }
    float _3373 = _3353;
    float _3375 = _3373;
    if (_3265)
    {
        float _3377 = _3255 * _3357;
        _3375 = _3377;
    }
    float _3379 = _3375;
    if (_3265)
    {
        float _3381 = fma(_3323, _3317, _3365);
        _3325 = _3381;
    }
    float _3383 = _3325;
    if (!_3265)
    {
        _3347 = _3257;
    }
    float _3385 = _3347;
    float _3387 = _3385;
    if (_3265)
    {
        float _3389 = _3371 * _3371;
        _3387 = _3389;
    }
    float _3391 = _3387;
    if (!_3265)
    {
        _3367 = _3259;
    }
    float _3393 = _3367;
    float _3395 = _3393;
    if (_3265)
    {
        float _3397 = _3379 * _3379;
        _3395 = _3397;
    }
    float _3399 = _3395;
    float _3401 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3359);
    float _3403 = fma(_3383, _3383, _3391);
    float _3405 = _3361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3407 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3401);
    float _3409 = _3403 + _3399;
    float _3411 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3413 = _3407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3415 = rsqrt(_3409);
    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3419 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3417);
    float _3421 = precise::clamp(_3419, 0.0, 1.0);
    float _3423 = _3413 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3425 = -_3421;
    float _3427 = _3425 + 1.0;
    float _3429 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3431 = -_3423;
    float _3433 = fma(_3431, _3411, 1.0);
    float _3435 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3437 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3429);
    float _3439 = abs(_3427);
    float _3441 = log2(_3439);
    float _3443 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3435);
    float _3445 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3437);
    float _3447 = _3415 * _3371;
    float _3449 = _3415 * _3383;
    float _3451 = _3415 * _3379;
    float _3453 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3443);
    float _3455 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3457 = _3445 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3459 = log2(_3433);
    float _3461 = _3453 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3463 = -_3455;
    float _3465 = fma(_3449, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3463);
    float _3467 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3469 = _3449 + 1.0;
    float _3471 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3473 = -_3451;
    float _3475 = fma(_3473, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3465);
    float _3477 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3467);
    float _3479 = exp2(_3471);
    float _3481 = fma(_3475, -0.5, 0.5);
    float _3483 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3477);
    float _3485 = fma(_3475, 0.5, 0.5);
    float _3487 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3483);
    float _3489 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3491 = sqrt(_3481);
    float _3493 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3495 = fma(_3485, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3497 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3489);
    float _3499 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3493);
    float _3501 = fma(_3485, _3495, -0.212114393711090087890625);
    float _3503 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3497);
    float _3505 = 1.0 / _3487;
    float _3507 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3499);
    float _3509 = -_3449;
    float _3511 = fma(_3479, _3469, _3509);
    float _3513 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3503);
    float _3515 = fma(_3485, _3501, 1.570728778839111328125);
    float _3517 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3507);
    float _3519 = _3459 * 0.693147182464599609375;
    float _3521 = fma(_3511, 0.5, 0.5);
    float _3523 = _3491 * 0.636619746685028076171875;
    float _3525 = fma(_2941, 6.2500002968590706586837768554688e-05, 0.5);
    float _3527 = _3519 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3529 = -_3515;
    float _3531 = fma(_3523, _3529, 1.0);
    float _3533 = _3513 * _3505;
    float _3535 = _3517 * _3505;
    float _3537 = fma(_3533, 0.5, 0.5);
    float _3539 = fma(_3535, -0.5, 0.5);
    float3 _9429 = float3(_3537, _3539, _3527);
    float _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9429, float3(0.0), isnan(_9429)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9429, float3(0.0), isnan(_9429)), level(0.0)).x;
    float3 _9440 = float3(_3537, _3539, _3527);
    float4 _3544 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9440, float3(0.0), isnan(_9440)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9440, float3(0.0), isnan(_9440)), level(0.0)).xyzw;
    float _3546 = _3544.x;
    float _3548 = _3544.y;
    float _3550 = _3544.z;
    float _3552 = _3544.w;
    float2 _9457 = float2(_3531, _3521);
    float3 _3556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9457, float2(0.0), isnan(_9457)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9457, float2(0.0), isnan(_9457)), level(0.0)).xyz;
    float _3558 = _3556.x;
    float _3560 = _3556.y;
    float _3562 = _3556.z;
    float2 _9473 = float2(_3525, _3239);
    float3 _3564 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_9473, float2(0.0), isnan(_9473)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_9473, float2(0.0), isnan(_9473)), level(0.0)).xyz;
    float _3566 = _3564.x;
    float _3568 = _3564.y;
    float _3570 = _3564.z;
    float _3572 = in.m_93.x;
    float _3574 = in.m_93.y;
    float _3576 = in.m_93.z;
    bool _3578 = _2681 != 0.0;
    bool _3580 = isnan(_2681);
    bool _3582 = _3578 || _3580;
    bool _3584 = isnan(0.0);
    bool _3586 = _3582 || _3584;
    float _3588 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3590 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3592 = in.m_95.x;
    float _3594 = in.m_95.y;
    float _3596 = in.m_95.z;
    float _3598 = in.m_95.w;
    bool _3600 = _2679 == 0.0;
    bool _3602 = !_3586;
    bool _3604 = _3600 && _3602;
    float _3606 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3590);
    float _3608 = exp2(_3588);
    bool _3610 = _2683 == 0.0;
    bool _3612 = _3610 && _3604;
    float _3614 = _3537;
    float _3616 = _3527;
    float _3618 = _3572;
    float _3620 = _3487;
    float _3622 = _3513;
    float _3624 = _3517;
    if (_3612)
    {
        _2105 = _3572;
    }
    float _3626 = _2105;
    float _3628 = -_3608;
    float _3630 = _3628 + 1.0;
    float _3632 = _3626;
    if (_3612)
    {
        _2107 = _3576;
    }
    float _3634 = _2107;
    float _3636 = _3634;
    if (_3612)
    {
        _2615 = _3574;
    }
    float _3638 = _2615;
    float _3640 = _3638;
    if (_3612)
    {
        _3614 = _3626;
    }
    float _3642 = _3614;
    float _3644 = _3642;
    if (!_3612)
    {
        _3632 = _3572;
    }
    float _3646 = _3632;
    if (_3612)
    {
        _3616 = _3634;
    }
    float _3648 = _3616;
    float _3650 = _3648;
    if (!_3612)
    {
        _3636 = _3576;
    }
    float _3652 = _3636;
    if (!_3612)
    {
        float _3654 = fma(_2679, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3646);
        _3644 = _3654;
    }
    float _3656 = _3644;
    if (_3612)
    {
        _3618 = _3638;
    }
    float _3658 = _3618;
    float _3660 = _3596 * _3646;
    float _3662 = _3658;
    if (!_3612)
    {
        _3640 = _3574;
    }
    float _3664 = _3640;
    float _3666 = _3594 * _3652;
    if (!_3612)
    {
        float _3668 = fma(_2683, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3652);
        _3650 = _3668;
    }
    float _3670 = _3650;
    float _3672 = -_3660;
    float _3674 = fma(_3592, _3652, _3672);
    float _3676 = _2789 * _2835;
    float _3678 = _3592 * _3664;
    if (!_3612)
    {
        float _3680 = fma(_2681, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3664);
        _3662 = _3680;
    }
    float _3682 = _3662;
    float _3684 = -_3666;
    float _3686 = fma(_3596, _3664, _3684);
    float _3688 = _2755 * _2835;
    float _3690 = -_3678;
    float _3692 = fma(_3594, _3646, _3690);
    float _3694 = _3674 * _3598;
    float _3696 = _3686 * _3598;
    float _3698 = _2755 * _2849;
    float _3700 = _3692 * _3598;
    float _3702 = _2755 * _2827;
    float _3704 = _2775 * _2835;
    float _3706 = _2775 * _2849;
    float _3708 = _2775 * _2827;
    float _3710 = _2789 * _2849;
    float _3712 = _2789 * _2827;
    float _3714 = fma(_2799, _2803, _3688);
    float _3716 = fma(_2799, _2805, _3698);
    float _3718 = fma(_2799, _2817, _3702);
    float _3720 = -_2711;
    float _3722 = fma(_3720, _2803, _3704);
    float _3724 = -_2711;
    float _3726 = fma(_3724, _2805, _3706);
    float _3728 = -_2711;
    float _3730 = fma(_3728, _2817, _3708);
    float _3732 = fma(_2773, _2803, _3676);
    float _3734 = fma(_2773, _2805, _3710);
    float _3736 = fma(_2773, _2817, _3712);
    float _3738 = fma(_2797, _2703, _3722);
    float _3740 = fma(_2797, _2707, _3726);
    float _3742 = fma(_2797, _2705, _3730);
    float _3744 = fma(_2785, _2707, _3716);
    float _3746 = fma(_2785, _2703, _3714);
    float _3748 = _3738 * _3594;
    float _3750 = _3740 * _3594;
    float _3752 = _3742 * _3594;
    float _3754 = fma(_2759, _2707, _3734);
    float _3756 = _3738 * _3682;
    float _3758 = _3694 * _3738;
    float _3760 = fma(_2759, _2703, _3732);
    float _3762 = fma(_2759, _2705, _3736);
    float _3764 = fma(_2785, _2705, _3718);
    float _3766 = _3740 * _3682;
    float _3768 = _3742 * _3682;
    float _3770 = _3694 * _3740;
    float _3772 = _3694 * _3742;
    float _3774 = fma(_3746, _3592, _3748);
    float _3776 = fma(_3746, _3656, _3756);
    float _3778 = fma(_3696, _3746, _3758);
    float _3780 = fma(_3744, _3592, _3750);
    float _3782 = fma(_3764, _3592, _3752);
    float _3784 = fma(_3760, _3596, _3774);
    float _3786 = fma(_3700, _3760, _3778);
    float _3788 = fma(_3744, _3656, _3766);
    float _3790 = _3630 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3792 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3606);
    float _3794 = fma(_3754, _3596, _3780);
    float _3796 = fma(_3762, _3596, _3782);
    float _3798 = fma(_3696, _3744, _3770);
    float _3800 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3792);
    float _3802 = _3487 * 0.5;
    float _3804 = fma(_3760, _3670, _3776);
    float _3806 = fma(_3764, _3656, _3768);
    out.m_97.x = _3784;
    out.m_97.y = _3794;
    out.m_97.z = _3796;
    float _3808 = _3800 + _3487;
    float _3810 = _3513 + _3487;
    float _3812 = fma(_3696, _3764, _3772);
    float _3814 = fma(_3700, _3754, _3798);
    float _3816 = fma(_3517, -0.5, _3802);
    float _3818 = fma(_3754, _3670, _3788);
    float _3820 = _3808 * 0.5;
    float _3822 = _3810 * 0.5;
    float _3824 = fma(_3762, _3670, _3806);
    bool _3826 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3828 = isnan(_3249);
    bool _3830 = _3826 || _3828;
    bool _3832 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3834 = _3830 || _3832;
    float _3836 = -_3790;
    float _3838 = _3836 + 1.0;
    float _3840 = fma(_3700, _3762, _3812);
    out.m_99.x = _3822;
    out.m_99.y = _3816;
    out.m_99.z = _3820;
    out.m_99.w = _3487;
    out.m_101.x = _3804;
    out.m_101.y = _3818;
    out.m_101.z = _3824;
    out.m_103.x = _3786;
    out.m_103.y = _3814;
    out.m_103.z = _3840;
    out.gl_Position.x = _3513;
    out.gl_Position.y = _3517;
    out.gl_Position.z = _3800;
    out.gl_Position.w = _3487;
    float _3842 = _3840;
    float _3844 = _3814;
    float _3846 = _3786;
    if (!_3834)
    {
        _3842 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3848 = _3842;
    float _3850 = _3848;
    float _3852 = _3848;
    if (!_3834)
    {
        _3844 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3854 = _3844;
    float _3856 = _3854;
    float _3858 = _3854;
    if (!_3834)
    {
        _3846 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3860 = _3846;
    float _3862 = _3860;
    float _3864 = _3860;
    if (!_3834)
    {
        _3620 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3866 = _3620;
    float _3868 = _3866;
    float _3870 = _3866;
    if (!_3834)
    {
        _3622 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3872 = _3622;
    float _3874 = _3872;
    float _3876 = _3872;
    if (!_3834)
    {
        _3624 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3878 = _3624;
    float _3880 = _3790 * _3541;
    float _3882 = _3552 * _3838;
    float _3884 = _3552 * _3880;
    float _3886 = _3562 * _3880;
    float _3888 = fma(_3558, _3884, _3546);
    float _3890 = fma(_3560, _3884, _3548);
    float _3892 = fma(_3552, _3886, _3550);
    out.m_105.x = _3566;
    out.m_105.y = _3568;
    out.m_105.z = _3570;
    float _3894 = _3225 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_107.x = _3888;
    out.m_107.y = _3890;
    out.m_107.z = _3892;
    out.m_107.w = _3882;
    bool _3896 = !_3834;
    float _3898 = _3878;
    float _3900 = _3878;
    if (!_3896)
    {
        bool _3902 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3904 = isnan(_3249);
        bool _3906 = _3902 || _3904;
        bool _3908 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3910 = _3906 || _3908;
        if (!_3910)
        {
            float _3912 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3914 = _3249 + _3912;
            float _3916 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3918 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3916;
            float _3920 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3922 = _3920 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3924 = 1.0 / _3918;
            float _3926 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3928 = _3926 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3930 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3932 = _3930 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3934 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3936 = _3934 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3940 = _3938 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3942 = _3914 * _3924;
            float _3944 = precise::clamp(_3942, 0.0, 1.0);
            float _3946 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3948 = _3946 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3950 = fma(_3944, _3922, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3952 = fma(_3944, _3948, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3954 = fma(_3944, _3928, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3956 = fma(_3944, _3932, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3958 = fma(_3944, _3936, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3960 = fma(_3944, _3940, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3876 = _3954;
            _3858 = _3958;
            _3870 = _3950;
            _3852 = _3956;
            _3900 = _3952;
            _3864 = _3960;
            _3962 = true;
        }
        else
        {
            bool _3964 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3966 = isnan(_3249);
            bool _3968 = _3964 || _3966;
            bool _3970 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3972 = _3968 || _3970;
            if (!_3972)
            {
                _3868 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3974 = _3868;
            _3870 = _3974;
            if (!_3972)
            {
                _3874 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3976 = _3874;
            _3876 = _3976;
            if (!_3972)
            {
                _3898 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3978 = _3898;
            _3900 = _3978;
            if (!_3972)
            {
                _3850 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3980 = _3850;
            _3852 = _3980;
            if (!_3972)
            {
                _3856 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3982 = _3856;
            _3858 = _3982;
            if (!_3972)
            {
                _3862 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3984 = _3862;
            bool _3986 = !_3972;
            _3864 = _3984;
            if (!_3986)
            {
                bool _3988 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3990 = isnan(_3249);
                bool _3992 = _3988 || _3990;
                bool _3994 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3996 = _3992 || _3994;
                if (!_3996)
                {
                    float _3998 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4000 = _3249 + _3998;
                    float _4002 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4004 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4002;
                    float _4006 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4008 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4010 = 1.0 / _4004;
                    float _4012 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4014 = _4012 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4016 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4018 = _4016 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4022 = _4020 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4024 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4026 = _4024 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4028 = _4000 * _4010;
                    float _4030 = precise::clamp(_4028, 0.0, 1.0);
                    float _4032 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4034 = _4032 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4036 = fma(_4030, _4008, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4038 = fma(_4030, _4034, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4040 = fma(_4030, _4014, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4042 = fma(_4030, _4018, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4044 = fma(_4030, _4022, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4046 = fma(_4030, _4026, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3876 = _4040;
                    _3858 = _4044;
                    _3870 = _4036;
                    _3852 = _4042;
                    _3900 = _4038;
                    _3864 = _4046;
                    _3962 = true;
                }
                else
                {
                    _3876 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3858 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3870 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3852 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3900 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3864 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3962 = false;
    float _4048 = _3876;
    float _4050 = _3858;
    float _4052 = _3870;
    float _4054 = _3852;
    float _4056 = _3900;
    float _4058 = _3864;
    float _4060 = fma(_3818, -0.5, 0.5);
    float _4062 = precise::clamp(_4060, 0.0, 1.0);
    float _4064 = -_4048;
    float _4066 = _4064 + _4050;
    float _4068 = -_4052;
    float _4070 = _4068 + _4054;
    out.m_109.x = 0.0;
    float _4072 = fma(_4062, _4066, _4048);
    float _4074 = -_4056;
    float _4076 = _4074 + _4058;
    float _4078 = fma(_4062, _4070, _4052);
    float _4080 = _4072 * 0.586610972881317138671875;
    bool _4082 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4084 = fma(_4062, _4076, _4056);
    float _4086 = _3894 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4088 = fma(_4078, 0.298911988735198974609375, _4080);
    bool _4090 = _3225 > 0.0;
    bool _4092 = isnan(_3225);
    bool _4094 = _4090 || _4092;
    bool _4096 = isnan(0.0);
    bool _4098 = _4094 || _4096;
    float _4100 = fma(_4084, 0.114477999508380889892578125, _4088);
    out.m_49.x = _4086;
    float _4102 = -_4100;
    float _4104 = _4078 + _4102;
    float _4106 = -_4100;
    float _4108 = _4072 + _4106;
    float _4110 = -_4100;
    float _4112 = _4084 + _4110;
    float _4114 = fma(_4104, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4100);
    float _4116 = fma(_4108, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4100);
    float _4118 = fma(_4112, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4100);
    bool _4120 = !_4082;
    if (!_4120)
    {
        float _4122 = -_3157;
        float _4124 = _4122 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4126 = -_3159;
        float _4128 = _4126 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4130 = -_3161;
        float _4132 = _4130 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4134 = _4124 * _4124;
        float _4136 = fma(_4128, _4128, _4134);
        float _4138 = fma(_4132, _4132, _4136);
        float _4140 = sqrt(_4138);
        float _4142 = rsqrt(_4138);
        float _4144 = -_4140;
        float _4146 = _4144 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4148 = _4146 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4150 = precise::clamp(_4148, 0.0, 1.0);
        float _4152 = _4128 * _4142;
        float _4154 = _4124 * _4142;
        float _4156 = abs(_4150);
        float _4158 = log2(_4156);
        float _4160 = _4132 * _4142;
        float _4162 = _4152 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4164 = _3818 * _4154;
        float _4166 = -_4154;
        float _4168 = -_4162;
        float _4170 = fma(_4166, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4168);
        float _4172 = fma(_3804, _4152, _4164);
        float _4174 = -_4160;
        float _4176 = fma(_4174, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4170);
        float _4178 = fma(_3824, _4160, _4172);
        float _4180 = precise::clamp(_4178, 0.0, 1.0);
        float _4182 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4184 = _4176 + _4182;
        float _4186 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4188 = _4184 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4190 = precise::clamp(_4188, 0.0, 1.0);
        float _4192 = exp2(_4186);
        float _4194 = _4192 * _4190;
        float _4196 = _4180 * _4194;
        float _4198 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4200 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4202 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _4198;
        out.m_109.y = _4200;
        out.m_109.z = _4202;
    }
    out.m_111.x = _4114;
    out.m_111.y = _4116;
    out.m_111.z = _4118;
    if (_4098)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _4204 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4204;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3962 = false;
    bool _742 = false;
    bool _538 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_46.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_49.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4261 = as_type<float>(_146);
        out.gl_Position.z = _4261;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.w;
    float _152 = in.m_53.x;
    float _154 = in.m_53.y;
    float _156 = in.m_53.z;
    bool _158 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _160 = isnan(_150);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _166 = _162 || _164;
    float _168 = -_150;
    float _170 = _168 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _152;
    out.m_55.y = _154;
    out.m_55.z = _156;
    float _172 = _170;
    if (_166)
    {
        float _174 = float(_130);
        _140 = _174;
    }
    float _176 = _140;
    bool _178 = _170 >= _176;
    bool _180 = !_166;
    bool _182 = _178 || _180;
    float _184 = _176;
    if (_182)
    {
        _184 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _186 = _184;
    if (_182)
    {
        out.m_49.x = 0.0;
    }
    if (_182)
    {
        float _188 = _186 * 5.0;
        _148 = as_type<int>(_188);
    }
    int _190 = _148;
    if (_182)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4343 = as_type<float>(_190);
        out.gl_Position.z = _4343;
    }
    if (_182)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _192 = in.m_57.x;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_57.y;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = in.m_63.x;
    float _212 = in.m_63.y;
    float _214 = in.m_63.z;
    float _216 = in.m_65.x;
    float _218 = in.m_65.y;
    float _220 = in.m_65.z;
    out.m_67.x = _192;
    out.m_67.y = _196;
    float _222 = _200 * _206;
    float _224 = _200 * _212;
    float _226 = fma(_198, _204, _222);
    float _228 = _200 * _218;
    float _230 = fma(_198, _210, _224);
    float _232 = fma(_202, _208, _226);
    float _234 = fma(_198, _216, _228);
    float _236 = fma(_202, _214, _230);
    float _238 = fma(_202, _220, _234);
    bool _240 = !_194;
    float _242 = _196;
    float _244 = _192;
    float _246 = _238;
    float _262;
    if (!_240)
    {
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _170);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_130);
        float _268 = 1.0 / _266;
        float _270 = _170 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _272 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _272 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = 1.0 / _288;
    float _304 = 1.0 / _296;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _308 = 1.0 / _300;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _272 + _310;
    float _314 = _276 * _302;
    bool _316 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _318 = isnan(_272);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _330 = isnan(_272);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = 1.0 / _292;
    float _342 = _280 * _304;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = fma(_346, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = _284 * _308;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_354, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _370 = -_366;
    float _372 = _370 + 1.0;
    float _374 = _312 * _340;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _376;
    float _380 = -_326;
    float _382 = _380 + 1.0;
    float _384 = fma(_378, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _386 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_272);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = _338 * _382;
    bool _400 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _402 = isnan(_272);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -_338;
    float _414 = _412 + 1.0;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = _396 * _372;
    float _422 = -_396;
    float _424 = _422 + 1.0;
    float _426 = _366 * _414;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _410 * _424;
    float _438 = fma(_418, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _440 = fma(_430, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _442 = fma(_434, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _444 = _384 * _436;
    float _446 = _348 * _436;
    float _448 = -_410;
    float _450 = _448 + 1.0;
    float _452 = _368 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _458;
    float _462 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[143].x, _444);
    float _464 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[143].y, _446);
    float _466 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_438, _420, _462);
    float _474 = fma(_440, _420, _464);
    float _476 = fma(_456, _314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _478 = fma(_460, _314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _480 = fma(_442, _420, _466);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = fma(_470, _314, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _496 = fma(_476, _426, _472);
    float _498 = fma(_484, _374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _500 = fma(_488, _374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _502 = fma(_478, _426, _474);
    float _504 = fma(_494, _374, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _506 = fma(_490, _426, _480);
    float _508 = fma(_498, _398, _496);
    float _510 = fma(_500, _398, _502);
    float _512 = fma(_504, _398, _506);
    float _514 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].x, _508);
    float _516 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].y, _510);
    float _518 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].z, _512);
    bool _520 = !_306;
    float _536;
    if (!_520)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _170);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_130);
        float _542 = 1.0 / _540;
        float _544 = _170 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _546 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _558 = isnan(_546);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _576 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_546);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = 1.0 / _554;
    float _590 = -_566;
    float _592 = _590 + 1.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    bool _598 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _600 = isnan(_546);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = _586 * _592;
    float _612 = -_586;
    float _614 = _612 + 1.0;
    float _616 = 1.0 / _570;
    bool _618 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _620 = _608 * _614;
    float _622 = -_608;
    float _624 = _622 + 1.0;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _628 = 1.0 / _574;
    float _630 = _596 * _588;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _638 = fma(_630, _550, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _640 = _634 * _616;
    bool _642 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _644 = isnan(_546);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _660 = _546 + _658;
    float _662 = _638 * _620;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _666 = _546 + _664;
    float _668 = -_652;
    float _670 = _668 + 1.0;
    float _672 = fma(_640, _660, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _674 = _656 * _628;
    float _676 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[115].x, _662);
    float _678 = _566 * _670;
    float _680 = fma(_674, _666, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _682 = fma(_672, _610, _676);
    float _684 = fma(_680, _678, _682);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[118].x, _684);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _700 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _712 = in.m_69.x;
    float _714 = in.m_69.y;
    float _716 = in.m_69.z;
    out.m_71.x = _700;
    out.m_71.y = _702;
    out.m_71.z = _704;
    out.m_71.w = _698;
    out.m_73.x = _706;
    out.m_73.y = _636;
    out.m_73.z = _708;
    out.m_73.w = _710;
    float _718 = _518 * _716;
    float _720 = _516 * _714;
    float _722 = _514 * _712;
    bool _724 = !_618;
    float _740;
    if (!_724)
    {
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _170);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_130);
        float _746 = 1.0 / _744;
        float _748 = _170 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _754 = int(_752);
    float _756 = float(_130);
    float _758 = _156 * 2.0;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _762 = _750 + _760;
    float _764 = in.m_65.w;
    float _766 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _768 = int(_766);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _778 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _780 = isnan(_750);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = float(_754);
    float _792 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _794 = int(_792);
    float _796 = -_788;
    float _798 = _796 + 1.0;
    bool _800 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _802 = isnan(_750);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _812;
    float _816 = float(_768);
    float _818 = 1.0 / _790;
    bool _820 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _822 = isnan(_750);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _832;
    bool _836 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _838 = isnan(_750);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _850 = int(_848);
    float _852 = float(uint(_794));
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _856 = float(_794);
    float _858 = 1.0 / _816;
    float _860 = _818 * _170;
    float _862 = float(uint(_850));
    float _864 = 1.0 / _852;
    int _866 = ~_850;
    int _868 = _866 + 1;
    int _870 = ~_850;
    int _872 = _870 + 1;
    float _874 = _858 * _170;
    float _876 = trunc(_860);
    int _878 = int(_876);
    float _880 = 1.0 / _862;
    int _882 = as_type<int>(_864) + (-2);
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _886 = _884 != 0;
    float _888 = trunc(_874);
    int _890 = int(_888);
    float _892 = float(uint(_878));
    float _894 = as_type<float>(_882) * _892;
    int _896 = as_type<int>(_880) + (-2);
    float _898 = 1.0 / _756;
    int _900 = ~_794;
    int _902 = _900 + 1;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_886)
    {
        _904 = 1.0;
    }
    float _906 = _904;
    float _908 = _906;
    if (!_886)
    {
        _908 = 7.345489978790283203125;
    }
    float _910 = _908;
    float _912 = float(uint(_890));
    float _914 = trunc(_894);
    float _916 = precise::max(_914, 0.0);
    uint _919 = uint(_916);
    float _921 = as_type<float>(_896) * _912;
    float _923 = _910 * _152;
    float _925 = _910;
    if (_886)
    {
        _925 = _152;
    }
    float _927 = _925;
    float _929 = trunc(_921);
    float _931 = precise::max(_929, 0.0);
    uint _933 = uint(_931);
    float _935 = _927;
    if (!_886)
    {
        _935 = _154;
    }
    float _937 = _935;
    int _939 = _902 * int(_919);
    int _941 = _939 + _878;
    float _943 = floor(_758);
    float _945 = float(uint(_941));
    int _947 = _868 * int(_933);
    int _949 = _947 + _890;
    float _951 = floor(_923);
    float _953 = as_type<float>(_882) * _945;
    float _955 = _945;
    if (_886)
    {
        _955 = 1.0;
    }
    float _957 = _955;
    float _959 = float(uint(_949));
    float _961 = _957;
    if (!_886)
    {
        _961 = 1.2345600128173828125;
    }
    float _963 = _961;
    float _965 = trunc(_953);
    float _967 = precise::max(_965, 0.0);
    uint _969 = uint(_967);
    float _971 = as_type<float>(_896) * _959;
    float _973 = _937 * _963;
    int _975 = ~_794;
    int _977 = _975 + 1;
    float _979 = float(_878);
    float _981 = trunc(_971);
    float _983 = precise::max(_981, 0.0);
    uint _985 = uint(_983);
    float _987 = floor(_973);
    int _989 = int(_919) + int(_969);
    float _991 = -_951;
    float _993 = _923 + _991;
    int _995 = ~_850;
    int _997 = _995 + 1;
    bool _999 = _979 >= _856;
    bool _1001 = isnan(_979);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(_856);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    int _1011 = _977 * _989;
    int _1013 = _1011 + _878;
    float _1015 = _856 * _993;
    int _1017 = int(_933) + int(_985);
    float _1019 = _898 * _170;
    float _1021 = trunc(_1009);
    int _1023 = int(_1021);
    bool _1025 = uint(_1013) >= uint(_794);
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1029 = _1027 != 0;
    float _1031 = -_987;
    float _1033 = _973 + _1031;
    int _1035 = _997 * _1017;
    int _1037 = _1035 + _890;
    bool _1039 = !_1025;
    int _1041 = _1039 ? 0 : (-1);
    float _1043 = trunc(_1015);
    int _1045 = int(_1043);
    float _1047 = float(_850);
    float _1049 = float(_890);
    bool _1051 = uint(_1037) >= uint(_850);
    float _1053 = _1047 * _1033;
    bool _1055 = _1049 >= _1047;
    bool _1057 = isnan(_1049);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan(_1047);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = _856 * _1019;
    int _1069 = ~_989;
    int _1071 = _1069 + _1041;
    int _1073 = _1071 + 1;
    float _1075 = _1047 * _1019;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1079 = _1077 != 0;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1083 = _1081 != 0;
    float _1085 = trunc(_1065);
    int _1087 = int(_1085);
    bool _1089 = !_1051;
    int _1091 = _1089 ? 0 : (-1);
    int _1093 = _794 * _1073;
    int _1095 = _1093 + _878;
    bool _1097 = !_1029;
    int _1099 = _1097 ? 0 : 1;
    int _1101 = ~_1017;
    int _1103 = _1101 + _1091;
    int _1105 = _1103 + 1;
    int _1107 = abs(_1099);
    float _1109 = trunc(_1053);
    int _1111 = int(_1109);
    bool _1113 = !_1083;
    int _1115 = _1113 ? 0 : 1;
    int _1117 = _850 * _1105;
    int _1119 = _1117 + _890;
    bool _1121 = _794 == 0;
    int _1123 = _1045 * _1107;
    int _1125 = _1123 + _878;
    int _1127 = ~_1023;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    bool _1133 = !_1121;
    int _1135 = _1133 ? _1095 : (-1);
    float _1137 = 1.0 / _772;
    int _1139 = abs(_1115);
    int _1141 = _794 + (-1);
    int _1143 = _1131 * _1135;
    bool _1145 = _850 == 0;
    bool _1147 = !_1079;
    int _1149 = _1147 ? 0 : 1;
    float _1151 = trunc(_1067);
    int _1153 = int(_1151);
    int _1155 = _1023 * _1141;
    int _1157 = _1155 + _1143;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1161 = _1159 != 0;
    int _1163 = ~_1087;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    int _1169 = _1157 * _1139;
    bool _1171 = !_1145;
    int _1173 = _1171 ? _1119 : (-1);
    int _1175 = abs(_1149);
    float _1177 = 1.0 / _776;
    bool _1179 = !_1161;
    int _1181 = _1179 ? 0 : 1;
    int _1183 = _1167 * _1173;
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1187 = _1185 != 0;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1195 = _1193 != 0;
    int _1197 = _850 + (-1);
    int _1199 = _1153 * _1175;
    int _1201 = _1199 + _1169;
    int _1203 = abs(_1181);
    float _1205 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1207 = log2(_1205);
    bool _1209 = !_1191;
    int _1211 = _1209 ? 0 : 1;
    int _1213 = _1087 * _1197;
    int _1215 = _1213 + _1183;
    bool _1217 = !_1195;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = _1125 * _1203;
    int _1223 = _1221 + _1201;
    int _1225 = abs(_1211);
    int _1227 = abs(_1219);
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1231 = _1229 != 0;
    int _1233 = _1215 * _1225;
    float _1235 = trunc(_1075);
    int _1237 = int(_1235);
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1245 = _1243 != 0;
    bool _1247 = !_1231;
    int _1249 = _1247 ? 0 : 1;
    int _1251 = _1045 * _1227;
    int _1253 = _1251 + _1223;
    bool _1255 = !_1187;
    int _1257 = _1255 ? 0 : 1;
    float _1259 = _1207 * _170;
    int _1261 = abs(_1249);
    float _1263 = -_846;
    float _1265 = _1263 + 1.0;
    bool _1267 = !_1241;
    int _1269 = _1267 ? 0 : 1;
    float _1271 = in.m_75.y;
    int _1273 = abs(_1257);
    int _1275 = abs(_1269);
    int _1277 = _1237 * _1273;
    int _1279 = _1277 + _1233;
    float _1281 = float(uint(_1253));
    int _1283 = _1111 * _1261;
    int _1285 = _1283 + _890;
    bool _1287 = !_1245;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = as_type<float>(_882) * _1281;
    int _1293 = abs(_1289);
    int _1295 = ~_850;
    int _1297 = _1295 + 1;
    int _1299 = _1285 * _1275;
    int _1301 = _1299 + _1279;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1305 = _1303 != 0;
    float _1307 = trunc(_1291);
    float _1309 = precise::max(_1307, 0.0);
    uint _1311 = uint(_1309);
    int _1313 = ~_850;
    int _1315 = _1313 + 1;
    int _1317 = _1111 * _1293;
    int _1319 = _1317 + _1301;
    int _1321 = ~_794;
    int _1323 = _1321 + 1;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1327 = _1325 != 0;
    float _1329 = float(uint(_1319));
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1333 = _1331 != 0;
    float _1335 = as_type<float>(_896) * _1329;
    int _1337 = _1275;
    bool _1339 = _1187;
    if (_1305)
    {
        float _1341 = -_192;
        float _1343 = _1341 + 1.0;
        _1337 = as_type<int>(_1343);
    }
    int _1345 = _1337;
    if (_1305)
    {
        bool _1347 = _152 > 0.5;
        _1339 = _1347;
    }
    bool _1349 = _1339;
    int _1351 = _1323 * int(_1311);
    int _1353 = _1351 + _1253;
    float _1355 = trunc(_1335);
    float _1357 = precise::max(_1355, 0.0);
    uint _1359 = uint(_1357);
    float _1361 = float(uint(_1353));
    float _1363 = as_type<float>(_882) * _1361;
    int _1365 = ~_794;
    int _1367 = _1365 + 1;
    float _1369 = trunc(_1363);
    float _1371 = precise::max(_1369, 0.0);
    uint _1373 = uint(_1371);
    int _1375 = _1297 * int(_1359);
    int _1377 = _1375 + _1319;
    float _1379 = float(uint(_1377));
    float _1381 = as_type<float>(_896) * _1379;
    int _1383 = int(_1311) + int(_1373);
    float _1385 = as_type<float>(_1373);
    if (!_1305)
    {
        _1385 = _192;
    }
    float _1387 = _1385;
    float _1389 = trunc(_1381);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    float _1395 = _1387;
    if (_1305)
    {
        float _1397 = _1349 ? as_type<float>(_1345) : _192;
        _1395 = _1397;
    }
    float _1399 = _1395;
    int _1401 = _1367 * _1383;
    int _1403 = _1401 + _1253;
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1407 = _1405 != 0;
    bool _1409 = _154 > 0.5;
    bool _1411 = uint(_1403) >= uint(_794);
    float _1413 = in.m_46.x;
    float _1415 = in.m_46.y;
    float _1417 = in.m_46.z;
    bool _1419 = !_1411;
    int _1421 = _1419 ? 0 : (-1);
    bool _1423 = _156 > 0.5;
    int _1425 = int(_1359) + int(_1393);
    int _1427 = ~_1383;
    int _1429 = _1427 + _1421;
    int _1431 = _1429 + 1;
    float _1433 = -_196;
    float _1435 = _1433 + 1.0;
    float _1437 = in.m_77.w;
    int _1439 = _1315 * _1425;
    int _1441 = _1439 + _1319;
    float _1443 = _152 * 2.0;
    int _1445 = _794 * _1431;
    int _1447 = _1445 + _1253;
    int _1449 = _1409 ? as_type<int>(_1435) : as_type<int>(_196);
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1453 = _1451 != 0;
    float _1455 = _1327 ? as_type<float>(_1449) : _196;
    float _1457 = floor(_1443);
    if (_1407)
    {
        float _1459 = _1423 ? _1435 : _196;
        _242 = _1459;
    }
    float _1461 = _242;
    float _1463 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1465 = uint(_1441) >= uint(_850);
    float _1467 = _212 * _1415;
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1471 = _1469 != 0;
    float _1473 = _1415 + _1271;
    bool _1475 = !_1465;
    int _1477 = _1475 ? 0 : (-1);
    float _1479 = fma(_210, _1413, _1467);
    bool _1481 = _154 > 0.5;
    bool _1483 = _1481 && _1333;
    float _1485 = _218 * _1415;
    int _1487 = ~_1425;
    int _1489 = _1487 + _1477;
    int _1491 = _1489 + 1;
    float _1493 = _154 * 2.0;
    float _1495 = float(uint(_1125));
    float _1497 = fma(_216, _1413, _1485);
    bool _1499 = !_1121;
    int _1501 = _1499 ? _1447 : (-1);
    int _1503 = _850 * _1491;
    int _1505 = _1503 + _1319;
    float _1507 = _1415;
    if (!_1333)
    {
        _1507 = _192;
    }
    float _1509 = _1507;
    float _1511 = as_type<float>(_882) * _1495;
    int _1513 = _1501 & 3;
    out.m_79.w = _1437;
    bool _1515 = !_1145;
    int _1517 = _1515 ? _1505 : (-1);
    float _1519 = _1509;
    if (_1483)
    {
        float _1521 = -_192;
        float _1523 = _1521 + 1.0;
        _244 = _1523;
    }
    float _1525 = _244;
    float _1527 = trunc(_1511);
    float _1529 = precise::max(_1527, 0.0);
    uint _1531 = uint(_1529);
    bool _1533 = _1513 != 3;
    float _1535 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1537 = uint(_1513) >= 2u;
    if (_1333)
    {
        _1519 = _1525;
    }
    float _1539 = _1519;
    int _1541 = ~_794;
    int _1543 = _1541 + 1;
    float _1545 = floor(_1493);
    int _1547 = _1517 & 3;
    int _1549 = _1537 ? 0 : 1;
    bool _1551 = uint(_1547) >= 2u;
    bool _1553 = uint(_1513) > 1u;
    int _1555 = _1543 * int(_1531);
    int _1557 = _1555 + _1125;
    int _1559 = _1551 ? 0 : 1;
    bool _1561 = _1547 != 3;
    int _1563 = ~_1549;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = _1567;
    if (_1533)
    {
        int _1571 = ~_1549;
        int _1573 = _1571 + 1;
        _1569 = _1573;
    }
    int _1575 = _1569;
    int _1577 = _1501 & 3;
    bool _1579 = _1577 != 0;
    float _1581 = float(uint(_1557));
    int _1583 = ~_1559;
    int _1585 = _1583 + 1;
    int _1587 = _1585 + 1;
    int _1589 = _1579 ? 0 : 1;
    float _1591 = as_type<float>(_882) * _1581;
    int _1593 = _1587;
    if (_1561)
    {
        int _1595 = ~_1559;
        int _1597 = _1595 + 1;
        _1593 = _1597;
    }
    int _1599 = _1593;
    float _1601 = _152 + _154;
    float _1603 = float(uint(_1285));
    float _1605 = trunc(_1591);
    float _1607 = precise::max(_1605, 0.0);
    uint _1609 = uint(_1607);
    int _1611 = ~_1589;
    int _1613 = _1611 + 1;
    int _1615 = _1613 + 1;
    float _1617 = _1601 + (-1.0);
    int _1619 = _1615;
    if (!_1553)
    {
        int _1621 = ~_1589;
        int _1623 = _1621 + 1;
        _1619 = _1623;
    }
    int _1625 = _1619;
    float _1627 = as_type<float>(_896) * _1603;
    float _1629 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1631 = trunc(_1627);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    bool _1637 = uint(_1547) > 1u;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1641 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1645 = _1517 & 3;
    bool _1647 = _1645 != 0;
    float _1649 = -_1639;
    float _1651 = fma(_1463, 2.0, _1649);
    float _1653 = fma(_1641, -2.0, _1643);
    int _1655 = _1647 ? 0 : 1;
    float _1657 = _154 + _156;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1659;
    int _1663 = ~_1655;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    float _1669 = _1657 + (-1.0);
    int _1671 = _1667;
    if (!_1637)
    {
        int _1673 = ~_1655;
        int _1675 = _1673 + 1;
        _1671 = _1675;
    }
    int _1677 = _1671;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1683 = int(_1531) + int(_1609);
    float _1685 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1687 = ~_794;
    int _1689 = _1687 + 1;
    int _1691 = _872 * int(_1635);
    int _1693 = _1691 + _1285;
    bool _1695 = !_1453;
    int _1697 = _1695 ? 0 : 1;
    float _1699 = 1.0 / _1661;
    bool _1701 = _1457 > 0.0;
    int _1703 = _1689 * _1683;
    int _1705 = _1703 + _1125;
    bool _1707 = _1457 >= 0.0;
    bool _1709 = isnan(_1457);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan(0.0);
    bool _1715 = _1711 || _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1717;
    float _1721 = float(uint(_1693));
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1727 = !_1471;
    int _1729 = _1727 ? 0 : 1;
    float _1731 = 1.0 / _1681;
    int _1733 = _1715 ? 0 : 1;
    float _1735 = as_type<float>(_896) * _1721;
    bool _1737 = uint(_1705) >= uint(_794);
    float _1739 = fma(_220, _1417, _1497);
    bool _1741 = _1545 >= 0.0;
    bool _1743 = isnan(_1545);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan(0.0);
    bool _1749 = _1745 || _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1753 = _750 + _1751;
    int _1755 = ~_1733;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = 1.0 / _1719;
    bool _1763 = !_1737;
    int _1765 = _1763 ? 0 : (-1);
    float _1767 = -_170;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1651);
    bool _1771 = _1545 > 0.0;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1775 = _750 + _1773;
    int _1777 = _1759;
    if (!_1701)
    {
        int _1779 = ~_1733;
        int _1781 = _1779 + 1;
        _1777 = _1781;
    }
    int _1783 = _1777;
    float _1785 = fma(_214, _1417, _1479);
    int _1787 = _1749 ? 0 : 1;
    float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1789;
    bool _1793 = _943 > 0.0;
    float _1795 = _1775 * _1699;
    bool _1797 = _943 >= 0.0;
    bool _1799 = isnan(_943);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1809 = _750 + _1807;
    float _1811 = trunc(_1735);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1819 = _750 + _1817;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1823 = _750 + _1821;
    float _1825 = _1809 * _1731;
    float _1827 = _1753 * _1761;
    float _1829 = _1819 * _1137;
    int _1831 = ~_850;
    int _1833 = _1831 + 1;
    float _1835 = _1823 * _1177;
    float _1837 = 1.0 / _1791;
    int _1839 = ~_1787;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = _1739 + _764;
    int _1847 = _1843;
    if (!_1771)
    {
        int _1849 = ~_1787;
        int _1851 = _1849 + 1;
        _1847 = _1851;
    }
    int _1853 = _1847;
    float _1855 = 1.0 / _1725;
    int _1857 = int(_1635) + int(_1815);
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1863 = _750 + _1861;
    int _1865 = _1833 * _1857;
    int _1867 = _1865 + _1285;
    float _1869 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1859);
    float _1871 = _762 * _1837;
    bool _1873 = uint(_1867) >= uint(_850);
    float _1875 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1869);
    float _1877 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1653);
    float _1879 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1881 = _1805 ? 0 : 1;
    float _1883 = _1863 * _1855;
    float _1885 = -_1877;
    float _1887 = fma(_1875, _1879, _1885);
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1891 = _1889 != 0;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1895 = _1893 != 0;
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1899 = _1897 != 0;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1905;
    float _1909 = fma(_1903, _1795, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1915;
    float _1919 = fma(_1907, _1795, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1925;
    float _1929 = fma(_1917, _1829, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1935 = fma(_1913, _1825, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1937 = fma(_1923, _1825, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1939 = fma(_1927, _1829, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1943 = _1941 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1945 = fma(_1933, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1947 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1955 = fma(_1943, _1835, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1957;
    bool _1961 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1963 = isnan(_750);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1969 = _1965 || _1967;
    float _1971 = float(_1969);
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _1977 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1979 = isnan(_750);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = fma(_1949, _1827, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1991 = fma(_1959, _1827, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1993 = fma(_1953, _1883, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1995 = fma(_1975, _1883, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1997 = -_1971;
    float _1999 = _1997 + 1.0;
    bool _2001 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2003 = isnan(_750);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1987;
    float _2015 = _2013 + 1.0;
    bool _2017 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2019 = isnan(_750);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    float _2029 = _1987 * _1999;
    int _2031 = abs(_1625);
    float _2033 = _2011 * _2015;
    float _2035 = -_2011;
    float _2037 = _2035 + 1.0;
    bool _2039 = !_1579;
    int _2041 = _2039 ? 0 : 1;
    float _2043 = in.m_63.w;
    int _2045 = abs(_1575);
    float _2047 = _788 * _2037;
    float _2049 = _810 * _798;
    float _2051 = -_810;
    float _2053 = _2051 + 1.0;
    float _2055 = fma(_814, _1871, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2057 = fma(_834, _1871, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2059 = -_830;
    float _2061 = _2059 + 1.0;
    float _2063 = _830 * _2053;
    float _2065 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _854);
    int _2067 = abs(_1599);
    float _2069 = _846 * _2061;
    float _2071 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2073 = _2027 * _1265;
    float _2075 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2065);
    float _2077 = -_2027;
    float _2079 = _2077 + 1.0;
    float _2081 = exp2(_1259);
    float _2083 = _1909 * _2073;
    float _2085 = _1919 * _2073;
    int _2087 = _1501 >> 31;
    float _2089 = fma(_2075, _2071, _1769);
    int _2091 = _2087 & 3;
    float _2093 = _1785 + _2043;
    int _2095 = ~_1881;
    int _2097 = _2095 + 1;
    int _2099 = _2097 + 1;
    float _2101 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2083);
    int _2103 = _2099;
    float _2105 = _2049;
    float _2107 = _2055;
    if (!_1793)
    {
        int _2109 = ~_1881;
        int _2111 = _2109 + 1;
        _2103 = _2111;
    }
    int _2113 = _2103;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2117 = 1.0 + _2115;
    int _2119 = _1517 >> 31;
    float _2121 = fma(_1935, _2069, _2101);
    int _2123 = _1501 + _2091;
    float _2125 = _1887 + 0.5;
    int _2127 = _2119 & 3;
    float _2129 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2085);
    float _2131 = _2089 + 0.5;
    float _2133 = -_2081;
    float _2135 = _2133 + 1.0;
    int _2137 = _1517 + _2127;
    float _2139 = fma(_1937, _2069, _2129);
    int _2141 = _2123 >> 2;
    out.m_81.x = _2131;
    out.m_81.y = _2125;
    int _2143 = _2137 >> 2;
    float _2145 = fma(_1939, _2063, _2139);
    int _2147 = _2141 << 4;
    int _2149 = _2147 + 368;
    float _2151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2153 = _2143 << 4;
    int _2155 = _2153 + 512;
    float _2157 = fma(_1929, _2063, _2121);
    uint _2159 = uint(int(uint(_2149) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[int(_2169)][_2171];
    bool _2175 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2177 = isnan(0.0);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2183 = _2179 || _2181;
    float _2185 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2187 = fma(_1945, _2049, _2157);
    bool _2189 = !_1647;
    int _2191 = _2189 ? 0 : 1;
    float _2193 = 1.0 / _2117;
    float _2195 = _2183 ? _2135 : 0.0;
    float _2197 = fma(_1989, _2047, _2187);
    uint _2199 = uint(int(uint(_2155) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[int(_2209)][_2211];
    bool _2215 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2217 = isnan(1.0);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2223 = _2219 || _2221;
    float _2225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2227 = _1473 + _2225;
    bool _2229 = _1513 != 3;
    float _2231 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2233 = _1845 + _2231;
    float _2235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2237 = _2185 * _2151;
    int _2239 = abs(_2191);
    int _2241 = _2149 + 8;
    uint _2243 = uint(int(uint(_2241) >> uint(2)));
    uint _2245 = uint(int(uint(int(_2243)) >> uint(2)));
    int _2247 = int(_2243) & 3;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[int(_2245)][_2247];
    int _2251 = int(_2243) + 1;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    int _2255 = _2251 & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    bool _2259 = !_1873;
    int _2261 = _2259 ? 0 : (-1);
    float _2263 = fma(_1993, _2033, _2197);
    int _2265 = abs(_1729);
    int _2267 = ~_1857;
    int _2269 = _2267 + _2261;
    int _2271 = _2269 + 1;
    if (_2223)
    {
        float _2273 = _2195 * _2193;
        _172 = _2273;
    }
    float _2275 = _172;
    float _2277 = fma(_1955, _2049, _2145);
    int _2279 = _2155 + 8;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    uint _2283 = uint(int(uint(int(_2281)) >> uint(2)));
    int _2285 = int(_2281) & 3;
    float _2287 = (*spvDescriptorSet0.vp_c9)._m0[int(_2283)][_2285];
    int _2289 = int(_2281) + 1;
    uint _2291 = uint(int(uint(_2289) >> uint(2)));
    int _2293 = _2289 & 3;
    float _2295 = (*spvDescriptorSet0.vp_c9)._m0[int(_2291)][_2293];
    bool _2297 = !_2229;
    int _2299 = _2297 ? 0 : (-1);
    bool _2301 = _1547 != 3;
    float _2303 = fma(_1991, _2047, _2277);
    float _2305 = _1535 * _2235;
    int _2307 = ~_1683;
    int _2309 = _2307 + _1765;
    int _2311 = _2309 + 1;
    float _2313 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2315 = abs(_1677);
    float _2317 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2319 = _2093 + _2317;
    out.m_83.x = _2237;
    out.m_83.y = _2305;
    int _2321 = abs(_2041);
    int _2323 = _794 * _2311;
    int _2325 = _2323 + _1125;
    int _2327 = ~_2315;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    float _2333 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2313);
    int _2335 = ~_2321;
    int _2337 = _2335 + 1;
    int _2339 = _2337 + 1;
    float _2341 = fma(_1995, _2033, _2303);
    bool _2343 = !_2301;
    int _2345 = _2343 ? 0 : (-1);
    float _2347 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2333);
    bool _2349 = _794 == 0;
    float _2351 = fma(_2057, _2029, _2341);
    int _2353 = ~_2031;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    bool _2359 = _850 == 0;
    bool _2361 = _2347 >= 0.0;
    int _2363 = _2357 * as_type<int>(_2173);
    int _2365 = ~_2239;
    int _2367 = _2365 + 1;
    int _2369 = _2367 + 1;
    int _2371 = _2331 * as_type<int>(_2213);
    int _2373 = ~_2045;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    int _2379 = _2339 * as_type<int>(_2165);
    int _2381 = _2379 + _2363;
    int _2383 = abs(_1697);
    int _2385 = _2369 * as_type<int>(_2205);
    int _2387 = _2385 + _2371;
    int _2389 = abs(_2299);
    int _2391 = _2377 * as_type<int>(_2249);
    int _2393 = _2391 + _2381;
    int _2395 = ~_2067;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    float _2401 = fma(_2055, _2029, _2263);
    int _2403 = ~_2389;
    int _2405 = _2403 + 1;
    int _2407 = _2405 + 1;
    if (_2361)
    {
        out.m_49.x = 0.0;
    }
    int _2409 = abs(_2345);
    float _2411 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2401);
    int _2413 = ~_2383;
    int _2415 = _2413 + 1;
    int _2417 = _2415 + 1;
    int _2419 = _2399 * as_type<int>(_2287);
    int _2421 = _2419 + _2387;
    int _2423 = _2407 * as_type<int>(_2257);
    int _2425 = _2423 + _2393;
    int _2427 = ~_2409;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    int _2433 = _850 * _2271;
    int _2435 = _2433 + _1285;
    int _2437 = ~_2265;
    int _2439 = _2437 + 1;
    int _2441 = _2439 + 1;
    int _2443 = _2417 * _2425;
    bool _2445 = !_2349;
    int _2447 = _2445 ? _2325 : (-1);
    int _2449 = _2431 * as_type<int>(_2295);
    int _2451 = _2449 + _2421;
    bool _2453 = !_2359;
    int _2455 = _2453 ? _2435 : (-1);
    float _2457 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2351);
    bool _2459 = !_1891;
    int _2461 = _2459 ? 0 : 1;
    int _2463 = _2441 * _2451;
    bool _2465 = !_1899;
    int _2467 = _2465 ? 0 : 1;
    int _2469 = _2447 * _2383;
    int _2471 = _2469 + _2443;
    float _2473 = _2227 * _2227;
    bool _2475 = !_1895;
    int _2477 = _2475 ? 0 : 1;
    int _2479 = _2455 * _2265;
    int _2481 = _2479 + _2463;
    float _2483 = as_type<float>(_2463);
    if (_2361)
    {
        _2483 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2485 = _2483;
    float _2487 = fma(_2319, _2319, _2473);
    int _2489 = abs(_2477);
    out.m_85.x = _2411;
    out.m_85.y = _2457;
    float _2491 = float(_2471);
    float _2493 = fma(_2233, _2233, _2487);
    float _2495 = float(_1783);
    float _2497 = float(_2489);
    float _2499 = rsqrt(_2493);
    float _2501 = float(_2481);
    int _2503 = as_type<int>(_2485);
    if (_2361)
    {
        float _2505 = _2485 * 5.0;
        _2503 = as_type<int>(_2505);
    }
    int _2507 = _2503;
    int _2509 = abs(_2461);
    float _2511 = _2497 * _2495;
    float _2513 = float(_2113);
    float _2515 = in.m_87.x;
    float _2517 = in.m_87.y;
    float _2519 = in.m_87.z;
    float _2521 = float(_2509);
    if (_2361)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7802 = as_type<float>(_2507);
        out.gl_Position.z = _7802;
    }
    out.m_89.x = _2491;
    out.m_89.y = _2501;
    float _2523 = _2227 * _2499;
    float _2525 = _2319 * _2499;
    float _2527 = _2523;
    if (_2361)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2529 = -_2523;
    float _2531 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    float _2533 = _2233 * _2499;
    float _2535 = -_2525;
    float _2537 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2093);
    float _2539 = _2521 * _2513;
    float _2541 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2543 = _2531 + _2541;
    float _2545 = -_2533;
    float _2547 = fma(_2545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1845);
    float _2549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2551 = _2537 + _2549;
    float _2553 = _2539 * (-2.0);
    float _2555 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2559 = _2547 + _2557;
    float _2561 = _152 + (-0.5);
    float _2563 = -_2523;
    float _2565 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2227);
    float _2567 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2555);
    float _2569 = fma(_2553, _2515, _2515);
    float _2571 = -_2525;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2319);
    float _2575 = _2565 * _2565;
    float _2577 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2567);
    float _2579 = fma(_1629, _2553, _1629);
    float _2581 = fma(_2561, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2569);
    float _2583 = _2511 * (-2.0);
    float _2585 = fma(_2573, _2573, _2575);
    bool _2587 = _2577 >= 0.0;
    float _2589 = -_2533;
    float _2591 = fma(_2589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2233);
    float _2593 = fma(_2579, _2275, _2581);
    float _2595 = _154 + (-0.5);
    float _2597 = fma(_2583, _2517, _2517);
    float _2599 = fma(_2591, _2591, _2585);
    float _2601 = _2593 * 0.15915493667125701904296875;
    int _2603 = abs(_2467);
    float _2605 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2597);
    float _2607 = sqrt(_2599);
    float _2609 = fma(_1685, _2583, _1685);
    float _2611 = float(_1853);
    float _2613 = _2597;
    float _2615 = _2565;
    if (_2587)
    {
        _2613 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2617 = _2613;
    int _2619 = as_type<int>(_2617);
    if (_2587)
    {
        out.m_49.x = 0.0;
    }
    float _2621 = float(_2603);
    float _2623 = fma(_2609, _2275, _2605);
    float _2625 = _2601 * 6.283185482025146484375;
    float _2627 = sin(_2625);
    if (_2587)
    {
        float _2629 = _2617 * 5.0;
        _2619 = as_type<int>(_2629);
    }
    int _2631 = _2619;
    float _2633 = _152 + _156;
    float _2635 = _2621 * _2611;
    if (_2587)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8005 = as_type<float>(_2631);
        out.gl_Position.z = _8005;
    }
    float _2637 = _2601 * 6.283185482025146484375;
    float _2639 = cos(_2637);
    if (_2587)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2641 = -_1473;
    float _2643 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2645 = -_2093;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2649 = _2623 * 0.15915493667125701904296875;
    float _2651 = _2643 * _2643;
    float _2653 = _2633 + (-1.0);
    float _2655 = -_1845;
    float _2657 = _2655 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2659 = _2635 * (-2.0);
    float _2661 = fma(_2647, _2647, _2651);
    float _2663 = fma(_2653, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2665 = _156 + (-0.5);
    float _2667 = _2499 * _2607;
    float _2669 = fma(_2657, _2657, _2661);
    float _2671 = fma(_2659, _2519, _2519);
    float _2673 = fma(_2663, _2659, _2663);
    float _2675 = _2649 * 6.283185482025146484375;
    float _2677 = sin(_2675);
    float _2679 = in.m_91.x;
    float _2681 = in.m_91.y;
    float _2683 = in.m_91.z;
    float _2685 = fma(_2665, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2671);
    float _2687 = fma(_2673, _2275, _2685);
    float _2689 = rsqrt(_2669);
    float _2691 = _2687 * 0.15915493667125701904296875;
    float _2693 = _2649 * 6.283185482025146484375;
    float _2695 = cos(_2693);
    float _2697 = _2627 * _2677;
    float _2699 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2701 = _2639 * _2677;
    float _2703 = _2647 * _2689;
    float _2705 = _2657 * _2689;
    float _2707 = _2643 * _2689;
    float _2709 = _2691 * 6.283185482025146484375;
    float _2711 = sin(_2709);
    float _2713 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2715 = _2703 * _2713;
    float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2719 = _2705 * _2717;
    float _2721 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2723 = -_2715;
    float _2725 = fma(_2705, _2721, _2723);
    float _2727 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2729 = -_2719;
    float _2731 = fma(_2707, _2727, _2729);
    float _2733 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2735 = _2707 * _2733;
    float _2737 = _2639 * _2695;
    float _2739 = _2725 * _2725;
    float _2741 = _2691 * 6.283185482025146484375;
    float _2743 = cos(_2741);
    float _2745 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2747 = -_2735;
    float _2749 = fma(_2703, _2745, _2747);
    float _2751 = _2667 * _2699;
    float _2753 = fma(_2731, _2731, _2739);
    float _2755 = fma(_2711, _2737, _2697);
    float _2757 = fma(_2749, _2749, _2753);
    float _2759 = fma(_2711, _2697, _2737);
    float _2761 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2763 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2765 = _2627 * _2695;
    float _2767 = rsqrt(_2757);
    float _2769 = _2667 * _2763;
    float _2771 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2681);
    float _2773 = _2677 * _2743;
    float _2775 = _2639 * _2743;
    float _2777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2679);
    float _2779 = _2771 * _2769;
    float _2781 = _2667 * _2761;
    float _2783 = -_2701;
    float _2785 = fma(_2711, _2765, _2783);
    float _2787 = -_2765;
    float _2789 = fma(_2711, _2701, _2787);
    float _2791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2683);
    float _2793 = _2777 * _2781;
    float _2795 = _2775 * _2779;
    float _2797 = _2627 * _2743;
    float _2799 = _2695 * _2743;
    float _2801 = _2791 * _2751;
    float _2803 = _2731 * _2767;
    float _2805 = _2725 * _2767;
    float _2807 = -_2779;
    float _2809 = _2711 * _2807;
    float _2811 = fma(_2755, _2793, _2795);
    float _2813 = _2707 * _2803;
    float _2815 = _2797 * _2779;
    float _2817 = _2749 * _2767;
    float _2819 = fma(_2799, _2793, _2809);
    float _2821 = fma(_2789, _2801, _2811);
    float _2823 = _2705 * _2805;
    float _2825 = -_2813;
    float _2827 = fma(_2703, _2805, _2825);
    float _2829 = fma(_2785, _2793, _2815);
    float _2831 = fma(_2773, _2801, _2819);
    float _2833 = -_2823;
    float _2835 = fma(_2707, _2817, _2833);
    float _2837 = _2827 * _2821;
    float _2839 = fma(_2759, _2801, _2829);
    float _2841 = _2703 * _2817;
    float _2843 = _2835 * _2821;
    float _2845 = fma(_2817, _2831, _2837);
    float _2847 = -_2841;
    float _2849 = fma(_2705, _2803, _2847);
    float _2851 = fma(_2803, _2831, _2843);
    float _2853 = fma(_2705, _2839, _2845);
    float _2855 = fma(_2703, _2839, _2851);
    float _2857 = _1845 + _2853;
    float _2859 = _2849 * _2821;
    float _2861 = _2093 + _2855;
    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2865 = _2857 + _2863;
    float _2867 = fma(_2805, _2831, _2859);
    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2871 = _2861 + _2869;
    float _2873 = _2865 * _2865;
    float _2875 = fma(_2707, _2839, _2867);
    float _2877 = fma(_2871, _2871, _2873);
    float _2879 = _1473 + _2875;
    float _2881 = sqrt(_2877);
    bool _2883 = _2881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2885 = _2821;
    float _2887 = _2873;
    float _2889 = _2861;
    float _2891 = _2839;
    if (!_2883)
    {
        _2885 = _2857;
    }
    float _2893 = _2885;
    float _2895 = _2893;
    if (!_2883)
    {
        _2887 = _2879;
    }
    float _2897 = _2887;
    bool _2899 = !_2883;
    float _2901 = _2897;
    if (!_2899)
    {
        float _2903 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2905 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2907 = _2881 + _2905;
        float _2909 = rsqrt(_2877);
        float _2911 = _2907 * _2903;
        float _2913 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2915 = _2911 * 0.15915493667125701904296875;
        float _2917 = _2915 * 6.283185482025146484375;
        float _2919 = cos(_2917);
        float _2921 = _2915 * 6.283185482025146484375;
        float _2923 = sin(_2921);
        float _2925 = _2919 + (-1.0);
        float _2927 = fma(_2923, _2913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2929 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2931 = _2909 * _2927;
        float _2933 = fma(_2879, _2919, _2929);
        float _2935 = fma(_2871, _2931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2937 = fma(_2865, _2931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2901 = _2933;
        _2889 = _2935;
        _2895 = _2937;
        _2891 = _2931;
    }
    float _2939 = _2901;
    float _2941 = _2889;
    float _2943 = _2895;
    float _2945 = _2891;
    float _2947 = -_1473;
    float _2949 = _2947 + _2939;
    float _2951 = -_2093;
    float _2953 = _2951 + _2941;
    float _2955 = -_1845;
    float _2957 = _2955 + _2943;
    float _2959 = _2949 * _2949;
    bool _2961 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2963 = isnan(0.5);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2969 = _2965 || _2967;
    bool _2971 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2973 = isnan(0.5);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2979 = _2975 || _2977;
    float _2981 = fma(_2953, _2953, _2959);
    float _2983 = fma(_2957, _2957, _2981);
    float _2985 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2987 = sqrt(_2983);
    float _2989 = fma(_2537, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2985);
    float _2991 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2993 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2989);
    float _2995 = fma(_2537, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2991);
    float _2997 = _2993 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2999 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2995);
    float _3001 = 1.0 / _2997;
    float _3003 = _2999 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3005 = _2987 > 0.0;
    float _3007 = _3003 + _2997;
    float _3009 = _2945;
    float _3011 = _2987;
    float _3013 = _2939;
    if (!_3005)
    {
        _3009 = _2941;
    }
    float _3015 = _3009;
    float _3017 = _3015;
    float _3019 = _3015;
    if (!_3005)
    {
        _3011 = _2943;
    }
    float _3021 = _3011;
    bool _3023 = !_3005;
    float _3025 = _3021;
    float _3027 = _3001;
    if (!_3023)
    {
        float _3029 = _232 * _232;
        float _3031 = fma(_236, _236, _3029);
        float _3033 = fma(_238, _238, _3031);
        float _3035 = rsqrt(_2983);
        float _3037 = sqrt(_3033);
        float _3039 = _2953 * _3035;
        float _3041 = _2949 * _3035;
        float _3043 = _2957 * _3035;
        bool _3045 = _3037 > 0.0;
        float _3047 = _3037;
        if (!_3045)
        {
            _3017 = _2941;
        }
        float _3049 = _3017;
        _3019 = _3049;
        if (!_3045)
        {
            _3047 = _2943;
        }
        float _3051 = _3047;
        bool _3053 = !_3045;
        _3025 = _3051;
        if (!_3053)
        {
            float _3055 = rsqrt(_3033);
            float _3057 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3059 = _232 * _3055;
            float _3061 = _236 * _3055;
            float _3063 = _3041 * _3059;
            float _3065 = _238 * _3055;
            float _3067 = fma(_3039, _3061, _3063);
            float _3069 = _3057 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3071 = fma(_3043, _3065, _3067);
            float _3073 = _3071 * _3069;
            float _3075 = fma(_232, _3073, _2939);
            float _3077 = fma(_236, _3073, _2941);
            float _3079 = fma(_238, _3073, _2943);
            _3013 = _3075;
            _3019 = _3077;
            _3025 = _3079;
        }
    }
    float _3081 = _3013;
    float _3083 = _3019;
    float _3085 = _3025;
    float _3087 = -_2523;
    float _3089 = fma(_3087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3081);
    float _3091 = -_2525;
    float _3093 = fma(_3091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3083);
    float _3095 = -_2533;
    float _3097 = fma(_3095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3085);
    float _3099 = _3007 * _3001;
    float _3101 = _3099 * 0.5;
    float _3103 = _3089;
    float _3105 = _3093;
    float _3107 = _3097;
    if (_2979)
    {
        _2527 = 1.0;
    }
    float _3109 = _2527;
    float _3111 = _3109;
    if (!_2969)
    {
        float _3113 = _2543 * _2543;
        float _3115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3117 = -_1845;
        float _3119 = _3117 + _3085;
        float _3121 = -_2093;
        float _3123 = _3121 + _3083;
        float _3125 = fma(_2551, _2551, _3113);
        float _3127 = -_1473;
        float _3129 = _3127 + _3081;
        float _3131 = fma(_2559, _2559, _3125);
        float _3133 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3135 = sqrt(_3131);
        float _3137 = 1.0 / _2667;
        float _3139 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3141 = precise::min(_3135, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3143 = _3141 * _3115;
        float _3145 = _3143 * _3137;
        float _3147 = _3139 * _3145;
        float _3149 = _3119 * _3145;
        float _3151 = fma(_3123, _3147, _2537);
        float _3153 = fma(_3129, _3147, _2531);
        float _3155 = fma(_3139, _3149, _2547);
        _3103 = _3153;
        _3105 = _3151;
        _3107 = _3155;
        _246 = _3145;
    }
    float _3157 = _3103;
    float _3159 = _3105;
    float _3161 = _3107;
    float _3163 = _246;
    float _3165 = _3163;
    if (!_2979)
    {
        float _3167 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3169 = _3167 * 0.15915493667125701904296875;
        float _3171 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3173 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3175 = fma(_3101, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3173);
        float _3177 = _3169 * 6.283185482025146484375;
        float _3179 = cos(_3177);
        float _3181 = _3171 * 0.15915493667125701904296875;
        float _3183 = _3169 * 6.283185482025146484375;
        float _3185 = sin(_3183);
        float _3187 = 1.0 / _3179;
        float _3189 = _3181 * 6.283185482025146484375;
        float _3191 = cos(_3189);
        float _3193 = _3185 * _3187;
        float _3195 = _3181 * 6.283185482025146484375;
        float _3197 = sin(_3195);
        float _3199 = _3191 * _3193;
        float _3201 = 1.0 / _3175;
        float _3203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3205 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3203;
        float _3207 = 1.0 / _3199;
        float _3209 = 1.0 / _3205;
        float _3211 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3213 = _3201 * _3211;
        float _3215 = _3197 * _3207;
        float _3217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3219 = fma(_3215, _3213, _3217);
        float _3221 = _3219 * _3209;
        float _3223 = precise::clamp(_3221, 0.0, 1.0);
        _3111 = _3223;
    }
    float _3225 = _3111;
    float _3227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3229 = _3157 + _3227;
    float _3231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3233 = _3159 + _3231;
    float _3235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3237 = _3161 + _3235;
    float _3239 = fma(_2943, 6.2500002968590706586837768554688e-05, 0.5);
    float _3241 = _3229 * _3229;
    float _3243 = fma(_3233, _3233, _3241);
    float _3245 = fma(_3237, _3237, _3243);
    float _3247 = rsqrt(_3245);
    float _3249 = sqrt(_3245);
    float _3251 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3253 = _3233 * _3251;
    float _3255 = _3237 * _3251;
    float _3257 = _3253 * _3253;
    float _3259 = _3255 * _3255;
    float _3261 = _3257 + _3259;
    float _3263 = sqrt(_3261);
    bool _3265 = _3263 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3269 = _3263 + _3267;
    float _3271 = _3237;
    float _3273 = _3241;
    float _3275 = _3269;
    float _3277 = _3251;
    if (_3265)
    {
        float _3279 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3271 = _3279;
    }
    float _3281 = _3271;
    if (_3265)
    {
        float _3283 = rsqrt(_3261);
        _3273 = _3283;
    }
    float _3285 = _3273;
    float _3287 = _3285;
    if (_3265)
    {
        float _3289 = _3269 * _3281;
        _3275 = _3289;
    }
    float _3291 = _3275;
    if (_3265)
    {
        float _3293 = _3291 * 0.15915493667125701904296875;
        _3165 = _3293;
    }
    float _3295 = _3165;
    float _3297 = _3281;
    if (_3265)
    {
        float _3299 = _3295 * 6.283185482025146484375;
        float _3301 = sin(_3299);
        _3297 = _3301;
    }
    float _3303 = _3297;
    float _3305 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3307 = precise::max(0.0, _3305);
    float _3309 = _3247;
    float _3311 = _3307;
    if (_3265)
    {
        float _3313 = _3295 * 6.283185482025146484375;
        float _3315 = cos(_3313);
        _3309 = _3315;
    }
    float _3317 = _3309;
    float _3319 = -_3251;
    float _3321 = -_3307;
    float _3323 = fma(_3229, _3319, _3321);
    float _3325 = _3323;
    if (_3265)
    {
        float _3327 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3311 = _3327;
    }
    float _3329 = _3311;
    float _3331 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3333 = _3303;
    float _3335 = _3329;
    if (_3265)
    {
        float _3337 = fma(_3303, _3329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3277 = _3337;
    }
    float _3339 = _3277;
    if (!_3265)
    {
        _3333 = _3253;
    }
    float _3341 = _3333;
    float _3343 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3331);
    float _3345 = _3341;
    float _3347 = _3317;
    if (_3265)
    {
        float _3349 = _3317 + (-1.0);
        _3335 = _3349;
    }
    float _3351 = _3335;
    float _3353 = _3351;
    if (_3265)
    {
        float _3355 = _3285 * _3339;
        _3027 = _3355;
    }
    float _3357 = _3027;
    float _3359 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3361 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3343);
    if (_3265)
    {
        float _3363 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3287 = _3363;
    }
    float _3365 = _3287;
    float _3367 = _3365;
    if (_3265)
    {
        float _3369 = _3253 * _3357;
        _3345 = _3369;
    }
    float _3371 = _3345;
    if (!_3265)
    {
        _3353 = _3255;
    }
    float _3373 = _3353;
    float _3375 = _3373;
    if (_3265)
    {
        float _3377 = _3255 * _3357;
        _3375 = _3377;
    }
    float _3379 = _3375;
    if (_3265)
    {
        float _3381 = fma(_3323, _3317, _3365);
        _3325 = _3381;
    }
    float _3383 = _3325;
    if (!_3265)
    {
        _3347 = _3257;
    }
    float _3385 = _3347;
    float _3387 = _3385;
    if (_3265)
    {
        float _3389 = _3371 * _3371;
        _3387 = _3389;
    }
    float _3391 = _3387;
    if (!_3265)
    {
        _3367 = _3259;
    }
    float _3393 = _3367;
    float _3395 = _3393;
    if (_3265)
    {
        float _3397 = _3379 * _3379;
        _3395 = _3397;
    }
    float _3399 = _3395;
    float _3401 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3359);
    float _3403 = fma(_3383, _3383, _3391);
    float _3405 = _3361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3407 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3401);
    float _3409 = _3403 + _3399;
    float _3411 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3413 = _3407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3415 = rsqrt(_3409);
    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3419 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3417);
    float _3421 = precise::clamp(_3419, 0.0, 1.0);
    float _3423 = _3413 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3425 = -_3421;
    float _3427 = _3425 + 1.0;
    float _3429 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3431 = -_3423;
    float _3433 = fma(_3431, _3411, 1.0);
    float _3435 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3437 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3429);
    float _3439 = abs(_3427);
    float _3441 = log2(_3439);
    float _3443 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3435);
    float _3445 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3437);
    float _3447 = _3415 * _3371;
    float _3449 = _3415 * _3383;
    float _3451 = _3415 * _3379;
    float _3453 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3443);
    float _3455 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3457 = _3445 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3459 = log2(_3433);
    float _3461 = _3453 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3463 = -_3455;
    float _3465 = fma(_3449, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3463);
    float _3467 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3469 = _3449 + 1.0;
    float _3471 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3473 = -_3451;
    float _3475 = fma(_3473, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3465);
    float _3477 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3467);
    float _3479 = exp2(_3471);
    float _3481 = fma(_3475, -0.5, 0.5);
    float _3483 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3477);
    float _3485 = fma(_3475, 0.5, 0.5);
    float _3487 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3483);
    float _3489 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3491 = sqrt(_3481);
    float _3493 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3495 = fma(_3485, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3497 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3489);
    float _3499 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3493);
    float _3501 = fma(_3485, _3495, -0.212114393711090087890625);
    float _3503 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3497);
    float _3505 = 1.0 / _3487;
    float _3507 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3499);
    float _3509 = -_3449;
    float _3511 = fma(_3479, _3469, _3509);
    float _3513 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3503);
    float _3515 = fma(_3485, _3501, 1.570728778839111328125);
    float _3517 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3507);
    float _3519 = _3459 * 0.693147182464599609375;
    float _3521 = fma(_3511, 0.5, 0.5);
    float _3523 = _3491 * 0.636619746685028076171875;
    float _3525 = fma(_2941, 6.2500002968590706586837768554688e-05, 0.5);
    float _3527 = _3519 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3529 = -_3515;
    float _3531 = fma(_3523, _3529, 1.0);
    float _3533 = _3513 * _3505;
    float _3535 = _3517 * _3505;
    float _3537 = fma(_3533, 0.5, 0.5);
    float _3539 = fma(_3535, -0.5, 0.5);
    float3 _9429 = float3(_3537, _3539, _3527);
    float _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9429, float3(0.0), isnan(_9429)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9429, float3(0.0), isnan(_9429)), level(0.0)).x;
    float3 _9440 = float3(_3537, _3539, _3527);
    float4 _3544 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9440, float3(0.0), isnan(_9440)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9440, float3(0.0), isnan(_9440)), level(0.0)).xyzw;
    float _3546 = _3544.x;
    float _3548 = _3544.y;
    float _3550 = _3544.z;
    float _3552 = _3544.w;
    float2 _9457 = float2(_3531, _3521);
    float3 _3556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9457, float2(0.0), isnan(_9457)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9457, float2(0.0), isnan(_9457)), level(0.0)).xyz;
    float _3558 = _3556.x;
    float _3560 = _3556.y;
    float _3562 = _3556.z;
    float2 _9473 = float2(_3525, _3239);
    float3 _3564 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_9473, float2(0.0), isnan(_9473)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_9473, float2(0.0), isnan(_9473)), level(0.0)).xyz;
    float _3566 = _3564.x;
    float _3568 = _3564.y;
    float _3570 = _3564.z;
    float _3572 = in.m_93.x;
    float _3574 = in.m_93.y;
    float _3576 = in.m_93.z;
    bool _3578 = _2681 != 0.0;
    bool _3580 = isnan(_2681);
    bool _3582 = _3578 || _3580;
    bool _3584 = isnan(0.0);
    bool _3586 = _3582 || _3584;
    float _3588 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3590 = _3457 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3592 = in.m_95.x;
    float _3594 = in.m_95.y;
    float _3596 = in.m_95.z;
    float _3598 = in.m_95.w;
    bool _3600 = _2679 == 0.0;
    bool _3602 = !_3586;
    bool _3604 = _3600 && _3602;
    float _3606 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3590);
    float _3608 = exp2(_3588);
    bool _3610 = _2683 == 0.0;
    bool _3612 = _3610 && _3604;
    float _3614 = _3537;
    float _3616 = _3527;
    float _3618 = _3572;
    float _3620 = _3487;
    float _3622 = _3513;
    float _3624 = _3517;
    if (_3612)
    {
        _2105 = _3572;
    }
    float _3626 = _2105;
    float _3628 = -_3608;
    float _3630 = _3628 + 1.0;
    float _3632 = _3626;
    if (_3612)
    {
        _2107 = _3576;
    }
    float _3634 = _2107;
    float _3636 = _3634;
    if (_3612)
    {
        _2615 = _3574;
    }
    float _3638 = _2615;
    float _3640 = _3638;
    if (_3612)
    {
        _3614 = _3626;
    }
    float _3642 = _3614;
    float _3644 = _3642;
    if (!_3612)
    {
        _3632 = _3572;
    }
    float _3646 = _3632;
    if (_3612)
    {
        _3616 = _3634;
    }
    float _3648 = _3616;
    float _3650 = _3648;
    if (!_3612)
    {
        _3636 = _3576;
    }
    float _3652 = _3636;
    if (!_3612)
    {
        float _3654 = fma(_2679, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3646);
        _3644 = _3654;
    }
    float _3656 = _3644;
    if (_3612)
    {
        _3618 = _3638;
    }
    float _3658 = _3618;
    float _3660 = _3596 * _3646;
    float _3662 = _3658;
    if (!_3612)
    {
        _3640 = _3574;
    }
    float _3664 = _3640;
    float _3666 = _3594 * _3652;
    if (!_3612)
    {
        float _3668 = fma(_2683, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3652);
        _3650 = _3668;
    }
    float _3670 = _3650;
    float _3672 = -_3660;
    float _3674 = fma(_3592, _3652, _3672);
    float _3676 = _2789 * _2835;
    float _3678 = _3592 * _3664;
    if (!_3612)
    {
        float _3680 = fma(_2681, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3664);
        _3662 = _3680;
    }
    float _3682 = _3662;
    float _3684 = -_3666;
    float _3686 = fma(_3596, _3664, _3684);
    float _3688 = _2755 * _2835;
    float _3690 = -_3678;
    float _3692 = fma(_3594, _3646, _3690);
    float _3694 = _3674 * _3598;
    float _3696 = _3686 * _3598;
    float _3698 = _2755 * _2849;
    float _3700 = _3692 * _3598;
    float _3702 = _2755 * _2827;
    float _3704 = _2775 * _2835;
    float _3706 = _2775 * _2849;
    float _3708 = _2775 * _2827;
    float _3710 = _2789 * _2849;
    float _3712 = _2789 * _2827;
    float _3714 = fma(_2799, _2803, _3688);
    float _3716 = fma(_2799, _2805, _3698);
    float _3718 = fma(_2799, _2817, _3702);
    float _3720 = -_2711;
    float _3722 = fma(_3720, _2803, _3704);
    float _3724 = -_2711;
    float _3726 = fma(_3724, _2805, _3706);
    float _3728 = -_2711;
    float _3730 = fma(_3728, _2817, _3708);
    float _3732 = fma(_2773, _2803, _3676);
    float _3734 = fma(_2773, _2805, _3710);
    float _3736 = fma(_2773, _2817, _3712);
    float _3738 = fma(_2797, _2703, _3722);
    float _3740 = fma(_2797, _2707, _3726);
    float _3742 = fma(_2797, _2705, _3730);
    float _3744 = fma(_2785, _2707, _3716);
    float _3746 = fma(_2785, _2703, _3714);
    float _3748 = _3738 * _3594;
    float _3750 = _3740 * _3594;
    float _3752 = _3742 * _3594;
    float _3754 = fma(_2759, _2707, _3734);
    float _3756 = _3738 * _3682;
    float _3758 = _3694 * _3738;
    float _3760 = fma(_2759, _2703, _3732);
    float _3762 = fma(_2759, _2705, _3736);
    float _3764 = fma(_2785, _2705, _3718);
    float _3766 = _3740 * _3682;
    float _3768 = _3742 * _3682;
    float _3770 = _3694 * _3740;
    float _3772 = _3694 * _3742;
    float _3774 = fma(_3746, _3592, _3748);
    float _3776 = fma(_3746, _3656, _3756);
    float _3778 = fma(_3696, _3746, _3758);
    float _3780 = fma(_3744, _3592, _3750);
    float _3782 = fma(_3764, _3592, _3752);
    float _3784 = fma(_3760, _3596, _3774);
    float _3786 = fma(_3700, _3760, _3778);
    float _3788 = fma(_3744, _3656, _3766);
    float _3790 = _3630 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3792 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3606);
    float _3794 = fma(_3754, _3596, _3780);
    float _3796 = fma(_3762, _3596, _3782);
    float _3798 = fma(_3696, _3744, _3770);
    float _3800 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3792);
    float _3802 = _3487 * 0.5;
    float _3804 = fma(_3760, _3670, _3776);
    float _3806 = fma(_3764, _3656, _3768);
    out.m_97.x = _3784;
    out.m_97.y = _3794;
    out.m_97.z = _3796;
    float _3808 = _3800 + _3487;
    float _3810 = _3513 + _3487;
    float _3812 = fma(_3696, _3764, _3772);
    float _3814 = fma(_3700, _3754, _3798);
    float _3816 = fma(_3517, -0.5, _3802);
    float _3818 = fma(_3754, _3670, _3788);
    float _3820 = _3808 * 0.5;
    float _3822 = _3810 * 0.5;
    float _3824 = fma(_3762, _3670, _3806);
    bool _3826 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3828 = isnan(_3249);
    bool _3830 = _3826 || _3828;
    bool _3832 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3834 = _3830 || _3832;
    float _3836 = -_3790;
    float _3838 = _3836 + 1.0;
    float _3840 = fma(_3700, _3762, _3812);
    out.m_99.x = _3822;
    out.m_99.y = _3816;
    out.m_99.z = _3820;
    out.m_99.w = _3487;
    out.m_101.x = _3804;
    out.m_101.y = _3818;
    out.m_101.z = _3824;
    out.m_103.x = _3786;
    out.m_103.y = _3814;
    out.m_103.z = _3840;
    out.gl_Position.x = _3513;
    out.gl_Position.y = _3517;
    out.gl_Position.z = _3800;
    out.gl_Position.w = _3487;
    float _3842 = _3840;
    float _3844 = _3814;
    float _3846 = _3786;
    if (!_3834)
    {
        _3842 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3848 = _3842;
    float _3850 = _3848;
    float _3852 = _3848;
    if (!_3834)
    {
        _3844 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3854 = _3844;
    float _3856 = _3854;
    float _3858 = _3854;
    if (!_3834)
    {
        _3846 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3860 = _3846;
    float _3862 = _3860;
    float _3864 = _3860;
    if (!_3834)
    {
        _3620 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3866 = _3620;
    float _3868 = _3866;
    float _3870 = _3866;
    if (!_3834)
    {
        _3622 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3872 = _3622;
    float _3874 = _3872;
    float _3876 = _3872;
    if (!_3834)
    {
        _3624 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3878 = _3624;
    float _3880 = _3790 * _3541;
    float _3882 = _3552 * _3838;
    float _3884 = _3552 * _3880;
    float _3886 = _3562 * _3880;
    float _3888 = fma(_3558, _3884, _3546);
    float _3890 = fma(_3560, _3884, _3548);
    float _3892 = fma(_3552, _3886, _3550);
    out.m_105.x = _3566;
    out.m_105.y = _3568;
    out.m_105.z = _3570;
    float _3894 = _3225 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_107.x = _3888;
    out.m_107.y = _3890;
    out.m_107.z = _3892;
    out.m_107.w = _3882;
    bool _3896 = !_3834;
    float _3898 = _3878;
    float _3900 = _3878;
    if (!_3896)
    {
        bool _3902 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3904 = isnan(_3249);
        bool _3906 = _3902 || _3904;
        bool _3908 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3910 = _3906 || _3908;
        if (!_3910)
        {
            float _3912 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3914 = _3249 + _3912;
            float _3916 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3918 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3916;
            float _3920 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3922 = _3920 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3924 = 1.0 / _3918;
            float _3926 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3928 = _3926 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3930 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3932 = _3930 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3934 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3936 = _3934 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3940 = _3938 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3942 = _3914 * _3924;
            float _3944 = precise::clamp(_3942, 0.0, 1.0);
            float _3946 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3948 = _3946 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3950 = fma(_3944, _3922, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3952 = fma(_3944, _3948, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3954 = fma(_3944, _3928, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3956 = fma(_3944, _3932, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3958 = fma(_3944, _3936, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3960 = fma(_3944, _3940, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3876 = _3954;
            _3858 = _3958;
            _3870 = _3950;
            _3852 = _3956;
            _3900 = _3952;
            _3864 = _3960;
            _3962 = true;
        }
        else
        {
            bool _3964 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3966 = isnan(_3249);
            bool _3968 = _3964 || _3966;
            bool _3970 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3972 = _3968 || _3970;
            if (!_3972)
            {
                _3868 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3974 = _3868;
            _3870 = _3974;
            if (!_3972)
            {
                _3874 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3976 = _3874;
            _3876 = _3976;
            if (!_3972)
            {
                _3898 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3978 = _3898;
            _3900 = _3978;
            if (!_3972)
            {
                _3850 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3980 = _3850;
            _3852 = _3980;
            if (!_3972)
            {
                _3856 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3982 = _3856;
            _3858 = _3982;
            if (!_3972)
            {
                _3862 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3984 = _3862;
            bool _3986 = !_3972;
            _3864 = _3984;
            if (!_3986)
            {
                bool _3988 = _3249 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3990 = isnan(_3249);
                bool _3992 = _3988 || _3990;
                bool _3994 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3996 = _3992 || _3994;
                if (!_3996)
                {
                    float _3998 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4000 = _3249 + _3998;
                    float _4002 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4004 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4002;
                    float _4006 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4008 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4010 = 1.0 / _4004;
                    float _4012 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4014 = _4012 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4016 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4018 = _4016 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4022 = _4020 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4024 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4026 = _4024 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4028 = _4000 * _4010;
                    float _4030 = precise::clamp(_4028, 0.0, 1.0);
                    float _4032 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4034 = _4032 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4036 = fma(_4030, _4008, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4038 = fma(_4030, _4034, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4040 = fma(_4030, _4014, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4042 = fma(_4030, _4018, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4044 = fma(_4030, _4022, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4046 = fma(_4030, _4026, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3876 = _4040;
                    _3858 = _4044;
                    _3870 = _4036;
                    _3852 = _4042;
                    _3900 = _4038;
                    _3864 = _4046;
                    _3962 = true;
                }
                else
                {
                    _3876 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3858 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3870 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3852 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3900 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3864 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3962 = false;
    float _4048 = _3876;
    float _4050 = _3858;
    float _4052 = _3870;
    float _4054 = _3852;
    float _4056 = _3900;
    float _4058 = _3864;
    float _4060 = fma(_3818, -0.5, 0.5);
    float _4062 = precise::clamp(_4060, 0.0, 1.0);
    float _4064 = -_4048;
    float _4066 = _4064 + _4050;
    float _4068 = -_4052;
    float _4070 = _4068 + _4054;
    out.m_109.x = 0.0;
    float _4072 = fma(_4062, _4066, _4048);
    float _4074 = -_4056;
    float _4076 = _4074 + _4058;
    float _4078 = fma(_4062, _4070, _4052);
    float _4080 = _4072 * 0.586610972881317138671875;
    bool _4082 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4084 = fma(_4062, _4076, _4056);
    float _4086 = _3894 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4088 = fma(_4078, 0.298911988735198974609375, _4080);
    bool _4090 = _3225 > 0.0;
    bool _4092 = isnan(_3225);
    bool _4094 = _4090 || _4092;
    bool _4096 = isnan(0.0);
    bool _4098 = _4094 || _4096;
    float _4100 = fma(_4084, 0.114477999508380889892578125, _4088);
    out.m_49.x = _4086;
    float _4102 = -_4100;
    float _4104 = _4078 + _4102;
    float _4106 = -_4100;
    float _4108 = _4072 + _4106;
    float _4110 = -_4100;
    float _4112 = _4084 + _4110;
    float _4114 = fma(_4104, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4100);
    float _4116 = fma(_4108, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4100);
    float _4118 = fma(_4112, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4100);
    bool _4120 = !_4082;
    if (!_4120)
    {
        float _4122 = -_3157;
        float _4124 = _4122 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4126 = -_3159;
        float _4128 = _4126 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4130 = -_3161;
        float _4132 = _4130 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4134 = _4124 * _4124;
        float _4136 = fma(_4128, _4128, _4134);
        float _4138 = fma(_4132, _4132, _4136);
        float _4140 = sqrt(_4138);
        float _4142 = rsqrt(_4138);
        float _4144 = -_4140;
        float _4146 = _4144 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4148 = _4146 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4150 = precise::clamp(_4148, 0.0, 1.0);
        float _4152 = _4128 * _4142;
        float _4154 = _4124 * _4142;
        float _4156 = abs(_4150);
        float _4158 = log2(_4156);
        float _4160 = _4132 * _4142;
        float _4162 = _4152 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4164 = _3818 * _4154;
        float _4166 = -_4154;
        float _4168 = -_4162;
        float _4170 = fma(_4166, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4168);
        float _4172 = fma(_3804, _4152, _4164);
        float _4174 = -_4160;
        float _4176 = fma(_4174, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4170);
        float _4178 = fma(_3824, _4160, _4172);
        float _4180 = precise::clamp(_4178, 0.0, 1.0);
        float _4182 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4184 = _4176 + _4182;
        float _4186 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4188 = _4184 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4190 = precise::clamp(_4188, 0.0, 1.0);
        float _4192 = exp2(_4186);
        float _4194 = _4192 * _4190;
        float _4196 = _4180 * _4194;
        float _4198 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4200 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4202 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _4198;
        out.m_109.y = _4200;
        out.m_109.z = _4202;
    }
    out.m_111.x = _4114;
    out.m_111.y = _4116;
    out.m_111.z = _4118;
    if (_4098)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _4204 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4204;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

