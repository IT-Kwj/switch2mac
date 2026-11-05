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
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_67 [[user(locn13)]];
    float4 m_83 [[user(locn14)]];
    float4 m_89 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2233 = false;
    bool _608 = false;
    bool _472 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_118)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2531 = as_type<float>(_128);
        out.gl_Position.z = _2531;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_51.w;
    float _134 = float(_114);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    float _156 = _132;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _130 = as_type<int>(_160);
    }
    int _162 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2595 = as_type<float>(_162);
        out.gl_Position.z = _2595;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = 1.0 / _134;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _138 * _164;
    bool _170 = !_166;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        _188 = _168;
    }
    _190 = false;
    float _192 = _188;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = _192 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _192 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = 1.0 / _212;
    float _224 = 1.0 / _208;
    bool _226 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _228 = isnan(_192);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _220;
    float _242 = _204 * _222;
    bool _244 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_192);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _256;
    float _260 = 1.0 / _216;
    float _262 = _196 * _224;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _266 = _192 + _264;
    float _268 = -_236;
    float _270 = _268 + 1.0;
    float _272 = fma(_258, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _274 = _266 * _240;
    bool _276 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_192);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_286;
    float _290 = _288 + 1.0;
    float _292 = _286 * _270;
    float _294 = _200 * _260;
    bool _296 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_192);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    bool _312 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_192);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _332 = _306 * _290;
    float _334 = -_306;
    float _336 = _334 + 1.0;
    float _338 = -_322;
    float _340 = _338 + 1.0;
    float _342 = fma(_310, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = fma(_326, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = _322 * _336;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = _254 * _340;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = -_254;
    float _360 = _358 + 1.0;
    float _362 = fma(_330, _242, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = _342 * _352;
    float _366 = _344 * _352;
    float _368 = _272 * _352;
    float _370 = in.m_55.x;
    float _372 = in.m_55.y;
    float _374 = in.m_55.z;
    float _376 = fma(_350, _242, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _378 = fma(_356, _242, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _382 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _392;
    float _396 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _398 = fma(_362, _346, _380);
    float _400 = fma(_376, _346, _382);
    float _402 = fma(_386, _294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _404 = fma(_390, _294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _414 = fma(_394, _294, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _420 = fma(_378, _346, _396);
    float _422 = fma(_408, _274, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _424 = fma(_412, _274, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _426 = fma(_402, _332, _398);
    float _428 = fma(_404, _332, _400);
    float _430 = fma(_418, _274, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _432 = fma(_414, _332, _420);
    float _434 = fma(_422, _292, _426);
    float _436 = fma(_424, _292, _428);
    float _438 = fma(_430, _292, _432);
    float _440 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[147].x, _434);
    float _442 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[147].y, _436);
    float _444 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[147].z, _438);
    float _446 = _440 * _370;
    float _448 = _442 * _372;
    float _450 = _444 * _374;
    bool _452 = !_238;
    float _470;
    if (!_452)
    {
        float _454 = in.m_53.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        _470 = _168;
    }
    _472 = false;
    float _474 = _470;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _474 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _486 = isnan(_474);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _500 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _502 = isnan(_474);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _512;
    bool _516 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _518 = isnan(_474);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _482;
    float _530 = -_494;
    float _532 = _530 + 1.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _536 = _474 + _534;
    bool _538 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _540 = _510 * _532;
    float _542 = -_510;
    float _544 = _542 + 1.0;
    float _546 = 1.0 / _498;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _552 = _514 * _528;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _560 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = fma(_552, _478, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _564 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _556 * _546;
    float _570 = -_526;
    float _572 = _570 + 1.0;
    float _574 = _562 * _540;
    float _576 = fma(_568, _536, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = _494 * _572;
    float _580 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _582 = fma(_576, _578, _580);
    float _584 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[117].x, _582);
    float _586 = _584 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _588 = !_538;
    float _606;
    if (!_588)
    {
        float _590 = in.m_53.x;
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _594 = _590 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        _606 = _168;
    }
    _608 = false;
    float _610 = _606;
    float _612 = in.m_46.x;
    float _614 = in.m_46.y;
    float _616 = in.m_46.z;
    float _618 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _620 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _622 = in.m_57.x;
    float _624 = in.m_57.y;
    float _626 = in.m_57.z;
    float _628 = _618 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _630 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _632 = _168 + 0.20000000298023223876953125;
    float _634 = in.m_59.y;
    float _636 = _614 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _638 = _614 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _640 = _614 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _642 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[5].x, _636);
    float _644 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[4].x, _638);
    float _646 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[6].x, _640);
    float _648 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[5].z, _642);
    float _650 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[4].z, _644);
    float _652 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[6].z, _646);
    float _654 = -_634;
    float _656 = _654 + 1.0;
    float _658 = _648 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = _650 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _662 = _652 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _658 + _664;
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _670 = _660 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _674 = _662 + _672;
    float _676 = _666 * _666;
    float _678 = fma(_670, _670, _676);
    float _680 = fma(_674, _674, _678);
    float _682 = sqrt(_680);
    float _684 = rsqrt(_680);
    float _686 = _682 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _688 = precise::min(_628, _686);
    float _690 = _684 * _688;
    float _692 = _666 * _690;
    float _694 = _670 * _690;
    float _696 = _674 * _690;
    float _698 = -_692;
    float _700 = _666 + _698;
    float _702 = -_694;
    float _704 = _670 + _702;
    float _706 = -_696;
    float _708 = _674 + _706;
    float _710 = _700 * _700;
    float _712 = fma(_704, _704, _710);
    float _714 = fma(_708, _708, _712);
    float _716 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _718 = sqrt(_714);
    float _720 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _716);
    float _722 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _720);
    bool _724 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _726 = isnan(0.5);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _732 = _728 || _730;
    float _734 = rsqrt(_722);
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _624);
    bool _738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _740 = isnan(0.5);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _746 = _742 || _744;
    float _748 = _684 * _718;
    float _750 = _620 * _748;
    float _752 = _618 * _748;
    float _754 = _630 * _748;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _622);
    float _758 = _750 * _736;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _626);
    float _762 = _734 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _764 = _752 * _756;
    float _766 = _758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _768 = _754 * _760;
    float _770 = _762 * _762;
    float _772 = _758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _774 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _766);
    float _776 = _758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _778 = -_770;
    float _780 = fma(_778, _770, 1.0);
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _772);
    float _784 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _774);
    float _786 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _776);
    float _788 = _656 * _780;
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _782);
    float _792 = _784 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _794 = -_692;
    float _796 = _658 + _794;
    float _798 = _788 * 0.800000011920928955078125;
    float _800 = _790 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _802 = _662 + _792;
    float _804 = -_694;
    float _806 = _660 + _804;
    float _808 = _796 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _810 = _660 + _800;
    float _812 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _814 = _802 + _812;
    float _816 = -_696;
    float _818 = _662 + _816;
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[11].x, _808);
    float _822 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _824 = _810 + _822;
    float _826 = _814 * _798;
    float _828 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _786);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[11].z, _820);
    float _832 = _824 * _798;
    float _834 = fma(_826, _632, _802);
    float _836 = _796 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _838 = _830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _840 = fma(_832, _632, _810);
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _844 = _834 + _842;
    float _846 = _828 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _848 = 1.0 / _838;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _852 = _840 + _850;
    float _854 = _844 * _844;
    float _856 = _658 + _846;
    float _858 = fma(_852, _852, _854);
    float _860 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[10].x, _836);
    float _862 = sqrt(_858);
    float _864 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[10].z, _860);
    float _866 = _864 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _868 = _866 + _838;
    float _870 = _868 * _848;
    float _872 = _870 * 0.5;
    bool _874 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _878 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[30].w, _876);
    float _880 = 1.0 / _878;
    float _882 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _884 = _776;
    float _886 = _872;
    float _888 = _692;
    float _890 = _634;
    float _892 = _656;
    float _894 = _818;
    float _896 = _806;
    if (!_874)
    {
        _882 = _840;
    }
    float _898 = _882;
    float _900 = _898;
    if (!_874)
    {
        _884 = _834;
    }
    float _902 = _884;
    float _904 = _902;
    if (!_874)
    {
        _886 = _856;
    }
    float _906 = _886;
    bool _908 = !_874;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _862 + _914;
        float _918 = rsqrt(_858);
        float _920 = _916 * _912;
        float _922 = _856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = _920 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        float _934 = _928 + (-1.0);
        float _936 = _934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = fma(_932, _922, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _940 = fma(_856, _928, _936);
        float _942 = _918 * _938;
        float _944 = fma(_852, _942, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _946 = fma(_844, _942, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _910 = _940;
        _900 = _944;
        _904 = _946;
    }
    float _948 = _910;
    float _950 = _900;
    float _952 = _904;
    float _954 = -_692;
    float _956 = _954 + _948;
    float _958 = -_694;
    float _960 = _958 + _950;
    float _962 = -_696;
    float _964 = _962 + _952;
    float _966 = _956;
    float _968 = _960;
    float _970 = _964;
    float _972 = _950;
    if (_746)
    {
        _888 = 1.0;
    }
    float _974 = _888;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _978 = _880 * _976;
    float _980 = _974;
    if (!_732)
    {
        float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _984 = _796 + _982;
        float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _988 = _806 + _986;
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _992 = -_660;
        float _994 = _992 + _950;
        float _996 = _984 * _984;
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1000 = _818 + _998;
        float _1002 = -_658;
        float _1004 = _1002 + _948;
        float _1006 = fma(_988, _988, _996);
        float _1008 = -_662;
        float _1010 = _1008 + _952;
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1014 = fma(_1000, _1000, _1006);
        float _1016 = sqrt(_1014);
        float _1018 = _990 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1020 = precise::min(_1016, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1022 = _1020 * _1012;
        float _1024 = _1018 * _1022;
        float _1026 = fma(_994, _1024, _806);
        float _1028 = fma(_1004, _1024, _796);
        float _1030 = fma(_1010, _1024, _818);
        _966 = _1028;
        _968 = _1026;
        _970 = _1030;
        _972 = _1024;
    }
    float _1032 = _966;
    float _1034 = _968;
    float _1036 = _970;
    float _1038 = _972;
    float _1040 = _1038;
    if (!_746)
    {
        float _1042 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1048 = _1044 * 6.283185482025146484375;
        float _1050 = cos(_1048);
        float _1052 = _1046 * 0.15915493667125701904296875;
        float _1054 = _1044 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = 1.0 / _1050;
        float _1060 = _1052 * 6.283185482025146484375;
        float _1062 = cos(_1060);
        float _1064 = _1056 * _1058;
        float _1066 = _1052 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        float _1070 = _1062 * _1064;
        float _1072 = 1.0 / _1070;
        float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1076 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1074;
        float _1078 = 1.0 / _1076;
        float _1080 = _1068 * _1072;
        float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1084 = fma(_978, _1080, _1082);
        float _1086 = _1084 * _1078;
        float _1088 = precise::clamp(_1086, 0.0, 1.0);
        _980 = _1088;
    }
    float _1090 = _980;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1032 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1098 = _1034 + _1096;
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1102 = _1036 + _1100;
    float _1104 = _1094 * _1094;
    float _1106 = fma(_1098, _1098, _1104);
    float _1108 = fma(_1102, _1102, _1106);
    float _1110 = rsqrt(_1108);
    float _1112 = sqrt(_1108);
    float _1114 = _1110 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1116 = _1098 * _1114;
    float _1118 = _1102 * _1114;
    float _1120 = _1116 * _1116;
    float _1122 = _1118 * _1118;
    float _1124 = _1120 + _1122;
    float _1126 = sqrt(_1124);
    bool _1128 = _1126 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = _1126 + _1130;
    float _1134 = _1110;
    float _1136 = _1124;
    float _1138 = _1132;
    float _1140 = _1094;
    float _1142 = _1114;
    if (_1128)
    {
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1134 = _1144;
    }
    float _1146 = _1134;
    if (_1128)
    {
        float _1148 = rsqrt(_1124);
        _1136 = _1148;
    }
    float _1150 = _1136;
    float _1152 = _1150;
    if (_1128)
    {
        float _1154 = _1132 * _1146;
        _1138 = _1154;
    }
    float _1156 = _1138;
    if (_1128)
    {
        float _1158 = _1156 * 0.15915493667125701904296875;
        _1040 = _1158;
    }
    float _1160 = _1040;
    float _1162 = _1146;
    float _1164 = _1160;
    if (_1128)
    {
        float _1166 = _1160 * 6.283185482025146484375;
        float _1168 = sin(_1166);
        _1162 = _1168;
    }
    float _1170 = _1162;
    float _1172 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1174 = precise::max(0.0, _1172);
    float _1176 = _1102;
    float _1178 = _1174;
    if (_1128)
    {
        float _1180 = _1160 * 6.283185482025146484375;
        float _1182 = cos(_1180);
        _1176 = _1182;
    }
    float _1184 = _1176;
    float _1186 = -_1114;
    float _1188 = -_1174;
    float _1190 = fma(_1094, _1186, _1188);
    float _1192 = _1190;
    if (_1128)
    {
        float _1194 = _1190 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1194;
    }
    float _1196 = _1178;
    float _1198 = _1196;
    if (!_1128)
    {
        _1164 = _1122;
    }
    float _1200 = _1164;
    float _1202 = _1170;
    float _1204 = _1200;
    if (_1128)
    {
        float _1206 = fma(_1170, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1198 = _1206;
    }
    float _1208 = _1198;
    if (!_1128)
    {
        _1202 = _1116;
    }
    float _1210 = _1202;
    float _1212 = _1210;
    float _1214 = _1184;
    if (_1128)
    {
        float _1216 = _1184 + (-1.0);
        _1140 = _1216;
    }
    float _1218 = _1140;
    float _1220 = _1218;
    if (_1128)
    {
        float _1222 = _1150 * _1208;
        _1142 = _1222;
    }
    float _1224 = _1142;
    if (!_1128)
    {
        _1152 = _1120;
    }
    float _1226 = _1152;
    float _1228 = _1226;
    if (_1128)
    {
        float _1230 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1230;
    }
    float _1232 = _1220;
    if (_1128)
    {
        float _1234 = _1116 * _1224;
        _1212 = _1234;
    }
    float _1236 = _1212;
    if (_1128)
    {
        float _1238 = fma(_1190, _1184, _1232);
        _1192 = _1238;
    }
    float _1240 = _1192;
    if (!_1128)
    {
        _1214 = _1118;
    }
    float _1242 = _1214;
    float _1244 = _1242;
    if (_1128)
    {
        float _1246 = _1236 * _1236;
        _1228 = _1246;
    }
    float _1248 = _1228;
    if (_1128)
    {
        float _1250 = _1118 * _1224;
        _1244 = _1250;
    }
    float _1252 = _1244;
    float _1254 = fma(_1240, _1240, _1248);
    if (_1128)
    {
        float _1256 = _1252 * _1252;
        _1204 = _1256;
    }
    float _1258 = _1204;
    float _1260 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1262 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1264 = _1254 + _1258;
    float _1266 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1260);
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1270 = fma(_1112, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1268);
    float _1272 = precise::clamp(_1270, 0.0, 1.0);
    float _1274 = rsqrt(_1264);
    float _1276 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1266);
    float _1278 = -_1272;
    float _1280 = _1278 + 1.0;
    float _1282 = fma(_806, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1284 = fma(_818, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1286 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1288 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1290 = abs(_1280);
    float _1292 = log2(_1290);
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1296 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1298 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1288);
    float _1300 = -_1294;
    float _1302 = fma(_1300, _1262, 1.0);
    float _1304 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1306 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1296);
    float _1308 = _1274 * _1236;
    float _1310 = _1274 * _1240;
    float _1312 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1304);
    float _1314 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1306);
    float _1316 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1318 = floor(_1282);
    float _1320 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1312);
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1324 = _1274 * _1252;
    float _1326 = -_1316;
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1326);
    float _1330 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1334 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1336 = -_1324;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1328);
    float _1340 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1298);
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1332);
    float _1344 = exp2(_1334);
    float _1346 = fma(_1338, -0.5, 0.5);
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1350 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1342);
    float _1352 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1354 = -_1318;
    float _1356 = _1282 + _1354;
    float _1358 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1350);
    float _1362 = floor(_1284);
    float _1364 = fma(_1338, 0.5, 0.5);
    float _1366 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1368 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1352);
    float _1370 = fma(_1364, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1372 = _1310 + 1.0;
    float _1374 = log2(_1302);
    float _1376 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1378 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1380 = fma(_1364, _1370, -0.212114393711090087890625);
    float _1382 = -_1310;
    float _1384 = fma(_1344, _1372, _1382);
    float _1386 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1376);
    float _1388 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1378);
    float _1390 = fma(_1364, _1380, 1.570728778839111328125);
    float _1392 = 1.0 / _1360;
    float _1394 = -_1362;
    float _1396 = _1284 + _1394;
    float _1398 = sqrt(_1346);
    float _1400 = _1374 * 0.693147182464599609375;
    float2 _4611 = float2(_1356, _1396);
    float _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4611, float2(0.0), isnan(_4611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4611, float2(0.0), isnan(_4611)), level(0.0)).x;
    float _1404 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1406 = _1386 * _1392;
    float _1408 = _1388 * _1392;
    float _1410 = fma(_1406, 0.5, 0.5);
    float _1412 = fma(_1408, -0.5, 0.5);
    float _1414 = _1398 * 0.636619746685028076171875;
    float3 _4639 = float3(_1410, _1412, _1404);
    float _1416 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4639, float3(0.0), isnan(_4639)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4639, float3(0.0), isnan(_4639)), level(0.0)).x;
    float _1418 = -_1390;
    float _1420 = fma(_1414, _1418, 1.0);
    float _1422 = fma(_1384, 0.5, 0.5);
    float3 _4657 = float3(_1410, _1412, _1404);
    float4 _1425 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4657, float3(0.0), isnan(_4657)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4657, float3(0.0), isnan(_4657)), level(0.0)).xyzw;
    float _1427 = _1425.x;
    float _1429 = _1425.y;
    float _1431 = _1425.z;
    float _1433 = _1425.w;
    float2 _4673 = float2(_1420, _1422);
    float3 _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4673, float2(0.0), isnan(_4673)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4673, float2(0.0), isnan(_4673)), level(0.0)).xyz;
    float _1439 = _1437.x;
    float _1441 = _1437.y;
    float _1443 = _1437.z;
    float _1445 = in.m_53.w;
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1449 = in.m_53.y;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1457 = _610 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_61.x = _560;
    out.m_61.y = _564;
    out.m_61.z = _566;
    out.m_61.w = _586;
    float _1463 = 1.0 / _1453;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1467 = _1465 != 0;
    float _1469 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1473 = _1471 != 0;
    float _1475 = in.m_53.z;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1479 = _1477 != 0;
    float _1481 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1485 = _1483 != 0;
    float _1487 = 1.0 / _1461;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1491 = _1489 != 0;
    float _1493 = in.m_59.x;
    float _1495 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1497 = _1445 > 0.5;
    float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1501 = _1499 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1503 = in.m_63.x;
    float _1505 = in.m_63.y;
    float _1507 = in.m_63.z;
    float _1509 = in.m_63.w;
    bool _1511 = _1449 > 0.5;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1513;
    float _1517 = 1.0 / _1501;
    int _1519 = _1511 ? as_type<int>(_656) : as_type<int>(_634);
    float _1521 = in.m_53.x;
    float _1523 = _1497 ? _656 : _634;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1527 = _610 + _1525;
    float _1529 = _1467 ? as_type<float>(_1519) : _634;
    float _1531 = _1515 * _1487;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1535 = _1533 != 0;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1543 = _1541 != 0;
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1547 = _1539 * _1463;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1551 = 0;
    float _1553 = _1517;
    bool _1555 = _1543;
    float _1557 = _1523;
    float _1559 = _1493;
    float _1561 = _1475;
    float _1563 = _1360;
    float _1565 = _1386;
    float _1567 = _1388;
    if (_1485)
    {
        float _1569 = -_1493;
        float _1571 = _1569 + 1.0;
        _1551 = as_type<int>(_1571);
    }
    int _1573 = _1551;
    float _1575 = fma(_1547, _1527, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1579;
    float _1583 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1585 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1587 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1589 = 0.0;
    if (!_1535)
    {
        _1589 = _1449;
    }
    float _1591 = _1589;
    float _1593 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1583);
    float _1595 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1585);
    float _1597 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1587);
    float _1599 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1601 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1593);
    float _1603 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1595);
    float _1605 = _1581 * _1517;
    float _1607 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1597);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1611 = _610 + _1609;
    int _1613 = _1491 ? as_type<int>(_1523) : as_type<int>(_634);
    float _1615 = fma(_1605, _1457, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1617 = _1475 > 0.5;
    float _1619 = fma(_1531, _1611, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_65.x = _1601;
    out.m_65.y = _1603;
    out.m_65.z = _1607;
    bool _1621 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1623 = isnan(_610);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1635 = _1591;
    int _1637 = as_type<int>(_1599);
    int _1639 = _1613;
    float _1641 = _1619;
    if (_1543)
    {
        float _1643 = _1617 ? _656 : _634;
        _890 = _1643;
    }
    float _1645 = _890;
    float _1647 = exp2(_1469);
    if (!_1535)
    {
        _1553 = _1591;
    }
    float _1649 = _1553;
    float _1651 = -_1631;
    float _1653 = _1651 + 1.0;
    float _1655 = _1649;
    if (_1535)
    {
        _1635 = _1449;
    }
    float _1657 = _1635;
    float _1659 = fma(_1599, _1645, -0.5);
    if (_1479)
    {
        float _1661 = -_1493;
        float _1663 = _1661 + 1.0;
        _1637 = as_type<int>(_1663);
    }
    int _1665 = _1637;
    float _1667 = _1521;
    if (_1473)
    {
        bool _1669 = _1521 > 0.5;
        _1555 = _1669;
    }
    bool _1671 = _1555;
    out.m_67.x = _806;
    out.m_67.y = _796;
    out.m_67.z = _818;
    bool _1673 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1675 = isnan(_610);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1681 = _1677 || _1679;
    float _1683 = float(_1681);
    float _1685 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1495);
    bool _1687 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1689 = isnan(_610);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    out.m_69.x = _752;
    float _1699 = -_1683;
    float _1701 = _1699 + 1.0;
    float _1703 = _1683 * _1653;
    bool _1705 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1707 = isnan(_610);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1713 = _1709 || _1711;
    float _1715 = float(_1713);
    float _1717 = -_1647;
    float _1719 = _1717 + 1.0;
    float _1721 = _1697 * _1701;
    float _1723 = -_1697;
    float _1725 = _1723 + 1.0;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_1473)
    {
        _1557 = _1493;
    }
    float _1729 = _1557;
    float _1731 = _1719 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1733 = _1715 * _1725;
    float _1735 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1727);
    float _1737 = fma(as_type<float>(_1613), _1481, -0.5);
    float _1739 = -_1715;
    float _1741 = _1739 + 1.0;
    float _1743 = _1619 * _1733;
    float _1745 = _1729;
    if (_1473)
    {
        float _1747 = -_1493;
        float _1749 = _1747 + 1.0;
        _1639 = as_type<int>(_1749);
    }
    int _1751 = _1639;
    if (!_1479)
    {
        _1641 = _1493;
    }
    float _1753 = _1641;
    out.m_71.w = _688;
    float _1755 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1743);
    float _1757 = _1753;
    if (_1479)
    {
        float _1759 = _1617 ? as_type<float>(_1665) : _1493;
        _1757 = _1759;
    }
    float _1761 = _1757;
    float _1763 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1685);
    float _1765 = in.m_73.x;
    float _1767 = in.m_73.y;
    float _1769 = in.m_73.z;
    if (_1473)
    {
        float _1771 = _1671 ? as_type<float>(_1751) : _1493;
        _1745 = _1771;
    }
    float _1773 = _1745;
    float _1775 = fma(_1575, _1721, _1755);
    if (_1485)
    {
        float _1777 = _1511 ? as_type<float>(_1573) : _1493;
        _1559 = _1777;
    }
    float _1779 = _1559;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1783 = _624 != 0.0;
    bool _1785 = isnan(_624);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan(0.0);
    bool _1791 = _1787 || _1789;
    float _1793 = fma(_1615, _1703, _1775);
    if (_1535)
    {
        _1655 = _1521;
    }
    float _1795 = _1655;
    float _1797 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1799 = _622 == 0.0;
    bool _1801 = !_1791;
    bool _1803 = _1799 && _1801;
    float _1805 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1793);
    float _1807 = _1795;
    if (_1535)
    {
        _892 = _1521;
    }
    float _1809 = _892;
    float _1811 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1813 = _626 == 0.0;
    bool _1815 = _1813 && _1803;
    float _1817 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1549);
    float _1819 = -_1577;
    float _1821 = fma(_1811, 2.0, _1819);
    float _1823 = _1809;
    if (!_1535)
    {
        _1823 = _1475;
    }
    float _1825 = _1823;
    out.m_75.x = _1034;
    out.m_75.y = _1032;
    out.m_75.z = _1036;
    float _1827 = 0.0;
    if (!_1535)
    {
        _1827 = _1475;
    }
    float _1829 = _1827;
    float _1831 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1833 = _1829;
    if (_1535)
    {
        _1561 = _1657;
    }
    float _1835 = _1561;
    float _1837 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1839 = _1837;
    if (_1535)
    {
        _1833 = _1657;
    }
    float _1841 = _1833;
    float _1843 = fma(_1831, _1761, -0.5);
    if (_1535)
    {
        _1807 = _1657;
    }
    float _1845 = _1807;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1849 = -_1633;
    float _1851 = fma(_1837, 2.0, _1849);
    float _1853 = _1835 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1855 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1847);
    float _1857 = _1847;
    float _1859 = _1845;
    if (_1815)
    {
        _1857 = _1767;
    }
    float _1861 = _1857;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1865 = _1861;
    if (_1815)
    {
        _1839 = _1769;
    }
    float _1867 = _1839;
    float _1869 = _1867;
    if (!_1815)
    {
        float _1871 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1767);
        _1865 = _1871;
    }
    float _1873 = _1865;
    if (!_1815)
    {
        float _1875 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1769);
        _1869 = _1875;
    }
    float _1877 = _1869;
    float _1879 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1817);
    float _1881 = -_138;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1821);
    float _1885 = fma(_1853, -2.0, _1863);
    float _1887 = _1507 * _1765;
    if (!_1535)
    {
        _1859 = _1521;
    }
    float _1889 = _1859;
    float _1891 = fma(_1879, _1843, _1883);
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1895 = -_1887;
    float _1897 = fma(_1503, _1769, _1895);
    float _1899 = _1505 * _1769;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1905 = _1503 * _1767;
    float _1907 = fma(_1901, -2.0, _1893);
    float _1909 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1855);
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1913 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1885);
    float _1915 = -_1899;
    float _1917 = fma(_1507, _1767, _1915);
    float _1919 = -_1905;
    float _1921 = fma(_1505, _1765, _1919);
    float _1923 = abs(_978);
    float _1925 = log2(_1923);
    float _1927 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1911);
    if (_1815)
    {
        _1667 = _1765;
    }
    float _1929 = _1667;
    float _1931 = _1929;
    if (!_1815)
    {
        float _1933 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1765);
        _1931 = _1933;
    }
    float _1935 = _1931;
    float _1937 = -_1913;
    float _1939 = fma(_1909, _1737, _1937);
    float _1941 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1943 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1945 = _1897 * _1509;
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1949 = _1917 * _1509;
    float _1951 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1735);
    float _1953 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1907);
    float _1955 = _1921 * _1509;
    float _1957 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1927);
    float _1959 = -_138;
    float _1961 = fma(_1959, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1851);
    float _1963 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1965 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1967 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1941);
    float _1969 = _1943 * _1903;
    float _1971 = -_1953;
    float _1973 = fma(_1951, _1659, _1971);
    float _1975 = exp2(_1963);
    float _1977 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1965);
    float _1979 = _1797 * _1947;
    float _1981 = _1939 + 0.5;
    float _1983 = _1805 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1993 = _1945 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1995 = _1945 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1997 = _1945 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1999 = _1891 + 0.5;
    float _2001 = fma(_1975, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2003 = precise::clamp(_2001, 0.0, 1.0);
    float _2005 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2007 = _1989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2009 = _1991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2011 = fma(_2003, -2.0, 3.0);
    float _2013 = _2003 * _2003;
    float _2015 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1993);
    float _2017 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1995);
    float _2019 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1997);
    float _2021 = _2013 * _2011;
    out.m_77.x = _1979;
    out.m_77.y = _1969;
    out.m_77.z = _1999;
    out.m_77.w = _1981;
    float _2023 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2015);
    float _2025 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2019);
    bool _2027 = _978 <= 8000.0;
    bool _2029 = isnan(_978);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan(8000.0);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    out.m_79.x = _2005;
    out.m_79.y = _2007;
    out.m_79.z = _2009;
    out.m_79.w = _1983;
    float _2039 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2041 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2043 = in.m_81.x;
    float _2045 = fma(_2039, _1779, -0.5);
    bool _2047 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2049 = isnan(_1112);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2055 = _2051 || _2053;
    float _2057 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2041);
    float _2059 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1763);
    float _2061 = fma(_1957, _2045, _1961);
    float _2063 = _1973 + 0.5;
    float _2065 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2017);
    float _2067 = -_2021;
    float _2069 = _2067 + 1.0;
    float _2071 = _2061 + 0.5;
    float _2073 = _1360 * 0.5;
    float _2075 = _2059 + _1360;
    float _2077 = fma(_2069, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2021);
    out.m_83.x = _2023;
    out.m_83.y = _2065;
    out.m_83.z = _2025;
    float _2079 = _2037 * _2077;
    out.m_85.x = _2071;
    out.m_85.y = _2063;
    float _2081 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2055)
    {
        _894 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2083 = _894;
    float _2085 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1386;
    out.gl_Position.y = _1388;
    out.gl_Position.z = _2059;
    out.gl_Position.w = _1360;
    float _2087 = _2083;
    float _2089 = _2083;
    if (!_2055)
    {
        _896 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2091 = _896;
    float _2093 = fma(_1388, -0.5, _2073);
    float _2095 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2057);
    float _2097 = _1386 + _1360;
    float _2099 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1967);
    float _2101 = _2075 * 0.5;
    float _2103 = _2097 * 0.5;
    float _2105 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1977);
    float _2107 = _2091;
    float _2109 = _2091;
    if (!_2055)
    {
        _1563 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2111 = _1563;
    out.m_87.x = _2103;
    out.m_87.y = _2093;
    out.m_87.z = _2101;
    out.m_87.w = _1360;
    float _2113 = _2111;
    float _2115 = _2111;
    if (!_2055)
    {
        _1565 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2117 = _1565;
    float _2119 = _2117;
    float _2121 = _2117;
    if (!_2055)
    {
        _1567 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2123 = _1567;
    out.m_89.x = _2105;
    out.m_89.y = _2099;
    out.m_89.z = _2095;
    float _2125 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2127 = -_1402;
    float _2129 = _2127 + 1.0;
    float _2131 = _2129 * _2085;
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = -_2133;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2139 = _2123;
    float _2141 = _2123;
    if (!_2055)
    {
        _2081 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2143 = _2081;
    float _2145 = _2137 * _2043;
    float _2147 = _1731 * _1416;
    float _2149 = -_1731;
    float _2151 = _2149 + 1.0;
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2155 = _1433 * _2147;
    out.m_91.x = _2153;
    float _2157 = _1443 * _2147;
    float _2159 = fma(_1439, _2155, _1427);
    float _2161 = fma(_1441, _2155, _1429);
    float _2163 = _1433 * _2151;
    float _2165 = fma(_1433, _2157, _1431);
    out.m_93.x = _2159;
    out.m_93.y = _2161;
    out.m_93.z = _2165;
    out.m_93.w = _2163;
    bool _2167 = !_2055;
    float _2169 = _2143;
    float _2171 = _2143;
    if (!_2167)
    {
        bool _2173 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2175 = isnan(_1112);
        bool _2177 = _2173 || _2175;
        bool _2179 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2181 = _2177 || _2179;
        if (!_2181)
        {
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2185 = _1112 + _2183;
            float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2189 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2187;
            float _2191 = 1.0 / _2189;
            float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2203 = _2201 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2213 = _2185 * _2191;
            float _2215 = precise::clamp(_2213, 0.0, 1.0);
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2221 = fma(_2215, _2195, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2223 = fma(_2215, _2219, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2225 = fma(_2215, _2199, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2227 = fma(_2215, _2203, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2229 = fma(_2215, _2207, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2231 = fma(_2215, _2211, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2121 = _2223;
            _2171 = _2229;
            _2115 = _2221;
            _2089 = _2227;
            _2141 = _2225;
            _2109 = _2231;
            _2233 = true;
        }
        else
        {
            bool _2235 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2237 = isnan(_1112);
            bool _2239 = _2235 || _2237;
            bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2243 = _2239 || _2241;
            if (!_2243)
            {
                _2113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2245 = _2113;
            _2115 = _2245;
            if (!_2243)
            {
                _2119 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2247 = _2119;
            _2121 = _2247;
            if (!_2243)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2249 = _2139;
            _2141 = _2249;
            if (!_2243)
            {
                _2087 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2251 = _2087;
            _2089 = _2251;
            if (!_2243)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2253 = _2169;
            _2171 = _2253;
            if (!_2243)
            {
                _2107 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2255 = _2107;
            bool _2257 = !_2243;
            _2109 = _2255;
            if (!_2257)
            {
                bool _2259 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2261 = isnan(_1112);
                bool _2263 = _2259 || _2261;
                bool _2265 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2267 = _2263 || _2265;
                if (!_2267)
                {
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2271 = _1112 + _2269;
                    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2275 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2273;
                    float _2277 = 1.0 / _2275;
                    float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2299 = _2271 * _2277;
                    float _2301 = precise::clamp(_2299, 0.0, 1.0);
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2307 = fma(_2301, _2281, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2309 = fma(_2301, _2305, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2311 = fma(_2301, _2285, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2313 = fma(_2301, _2289, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2315 = fma(_2301, _2293, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2317 = fma(_2301, _2297, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2121 = _2309;
                    _2171 = _2315;
                    _2115 = _2307;
                    _2089 = _2313;
                    _2141 = _2311;
                    _2109 = _2317;
                    _2233 = true;
                }
                else
                {
                    _2121 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2089 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2109 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2233 = false;
    float _2319 = _2121;
    float _2321 = _2171;
    float _2323 = _2115;
    float _2325 = _2089;
    float _2327 = _2141;
    float _2329 = _2109;
    float _2331 = fma(_2099, -0.5, 0.5);
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    float _2335 = -_2319;
    float _2337 = _2335 + _2321;
    float _2339 = _2125 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2341 = -_2323;
    float _2343 = _2341 + _2325;
    float _2345 = fma(_2333, _2337, _2319);
    out.m_95.x = 0.0;
    float _2347 = -_2327;
    float _2349 = _2347 + _2329;
    float _2351 = fma(_2333, _2343, _2323);
    float _2353 = _2345 * 0.586610972881317138671875;
    out.m_49.x = _2339;
    bool _2355 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2357 = fma(_2333, _2349, _2327);
    float _2359 = fma(_2351, 0.298911988735198974609375, _2353);
    bool _2361 = _1090 > 0.0;
    bool _2363 = isnan(_1090);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan(0.0);
    bool _2369 = _2365 || _2367;
    float _2371 = fma(_2357, 0.114477999508380889892578125, _2359);
    float _2373 = -_2371;
    float _2375 = _2351 + _2373;
    float _2377 = -_2371;
    float _2379 = _2345 + _2377;
    float _2381 = -_2371;
    float _2383 = _2357 + _2381;
    float _2385 = fma(_2375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2387 = fma(_2379, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2389 = fma(_2383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    bool _2391 = !_2355;
    if (!_2391)
    {
        float _2393 = -_1032;
        float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2397 = -_1034;
        float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2401 = -_1036;
        float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2405 = _2395 * _2395;
        float _2407 = fma(_2399, _2399, _2405);
        float _2409 = fma(_2403, _2403, _2407);
        float _2411 = sqrt(_2409);
        float _2413 = rsqrt(_2409);
        float _2415 = -_2411;
        float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2419 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2421 = precise::clamp(_2419, 0.0, 1.0);
        float _2423 = _2399 * _2413;
        float _2425 = _2395 * _2413;
        float _2427 = abs(_2421);
        float _2429 = log2(_2427);
        float _2431 = _2403 * _2413;
        float _2433 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2435 = _2099 * _2425;
        float _2437 = -_2425;
        float _2439 = -_2433;
        float _2441 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2439);
        float _2443 = fma(_2105, _2423, _2435);
        float _2445 = -_2431;
        float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2441);
        float _2449 = fma(_2095, _2431, _2443);
        float _2451 = precise::clamp(_2449, 0.0, 1.0);
        float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2455 = _2447 + _2453;
        float _2457 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2459 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2461 = precise::clamp(_2459, 0.0, 1.0);
        float _2463 = exp2(_2457);
        float _2465 = _2463 * _2461;
        float _2467 = _2451 * _2465;
        float _2469 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2473 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2469;
        out.m_95.y = _2471;
        out.m_95.z = _2473;
    }
    out.m_71.x = _2385;
    out.m_71.y = _2387;
    out.m_71.z = _2389;
    if (_2369)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2475 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2475;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2233 = false;
    bool _608 = false;
    bool _472 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_118)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2531 = as_type<float>(_128);
        out.gl_Position.z = _2531;
    }
    if (!_118)
    {
        return out;
    }
    float _132 = in.m_51.w;
    float _134 = float(_114);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    float _156 = _132;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _130 = as_type<int>(_160);
    }
    int _162 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2595 = as_type<float>(_162);
        out.gl_Position.z = _2595;
    }
    if (_154)
    {
        return out;
    }
    float _164 = 1.0 / _134;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _138 * _164;
    bool _170 = !_166;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        _188 = _168;
    }
    _190 = false;
    float _192 = _188;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = _192 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _192 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = 1.0 / _212;
    float _224 = 1.0 / _208;
    bool _226 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _228 = isnan(_192);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _220;
    float _242 = _204 * _222;
    bool _244 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_192);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _256;
    float _260 = 1.0 / _216;
    float _262 = _196 * _224;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _266 = _192 + _264;
    float _268 = -_236;
    float _270 = _268 + 1.0;
    float _272 = fma(_258, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _274 = _266 * _240;
    bool _276 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_192);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_286;
    float _290 = _288 + 1.0;
    float _292 = _286 * _270;
    float _294 = _200 * _260;
    bool _296 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_192);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    bool _312 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_192);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _332 = _306 * _290;
    float _334 = -_306;
    float _336 = _334 + 1.0;
    float _338 = -_322;
    float _340 = _338 + 1.0;
    float _342 = fma(_310, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = fma(_326, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = _322 * _336;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = _254 * _340;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = -_254;
    float _360 = _358 + 1.0;
    float _362 = fma(_330, _242, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = _342 * _352;
    float _366 = _344 * _352;
    float _368 = _272 * _352;
    float _370 = in.m_55.x;
    float _372 = in.m_55.y;
    float _374 = in.m_55.z;
    float _376 = fma(_350, _242, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _378 = fma(_356, _242, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _382 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _392;
    float _396 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _398 = fma(_362, _346, _380);
    float _400 = fma(_376, _346, _382);
    float _402 = fma(_386, _294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _404 = fma(_390, _294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _414 = fma(_394, _294, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _420 = fma(_378, _346, _396);
    float _422 = fma(_408, _274, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _424 = fma(_412, _274, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _426 = fma(_402, _332, _398);
    float _428 = fma(_404, _332, _400);
    float _430 = fma(_418, _274, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _432 = fma(_414, _332, _420);
    float _434 = fma(_422, _292, _426);
    float _436 = fma(_424, _292, _428);
    float _438 = fma(_430, _292, _432);
    float _440 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[147].x, _434);
    float _442 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[147].y, _436);
    float _444 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[147].z, _438);
    float _446 = _440 * _370;
    float _448 = _442 * _372;
    float _450 = _444 * _374;
    bool _452 = !_238;
    float _470;
    if (!_452)
    {
        float _454 = in.m_53.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        _470 = _168;
    }
    _472 = false;
    float _474 = _470;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _474 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _486 = isnan(_474);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _500 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _502 = isnan(_474);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _512;
    bool _516 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _518 = isnan(_474);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _482;
    float _530 = -_494;
    float _532 = _530 + 1.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _536 = _474 + _534;
    bool _538 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _540 = _510 * _532;
    float _542 = -_510;
    float _544 = _542 + 1.0;
    float _546 = 1.0 / _498;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _552 = _514 * _528;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _560 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = fma(_552, _478, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _564 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _556 * _546;
    float _570 = -_526;
    float _572 = _570 + 1.0;
    float _574 = _562 * _540;
    float _576 = fma(_568, _536, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = _494 * _572;
    float _580 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _582 = fma(_576, _578, _580);
    float _584 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[117].x, _582);
    float _586 = _584 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _588 = !_538;
    float _606;
    if (!_588)
    {
        float _590 = in.m_53.x;
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _594 = _590 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        _606 = _168;
    }
    _608 = false;
    float _610 = _606;
    float _612 = in.m_46.x;
    float _614 = in.m_46.y;
    float _616 = in.m_46.z;
    float _618 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _620 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _622 = in.m_57.x;
    float _624 = in.m_57.y;
    float _626 = in.m_57.z;
    float _628 = _618 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _630 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _632 = _168 + 0.20000000298023223876953125;
    float _634 = in.m_59.y;
    float _636 = _614 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _638 = _614 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _640 = _614 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _642 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[5].x, _636);
    float _644 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[4].x, _638);
    float _646 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[6].x, _640);
    float _648 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[5].z, _642);
    float _650 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[4].z, _644);
    float _652 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[6].z, _646);
    float _654 = -_634;
    float _656 = _654 + 1.0;
    float _658 = _648 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = _650 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _662 = _652 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _658 + _664;
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _670 = _660 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _674 = _662 + _672;
    float _676 = _666 * _666;
    float _678 = fma(_670, _670, _676);
    float _680 = fma(_674, _674, _678);
    float _682 = sqrt(_680);
    float _684 = rsqrt(_680);
    float _686 = _682 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _688 = precise::min(_628, _686);
    float _690 = _684 * _688;
    float _692 = _666 * _690;
    float _694 = _670 * _690;
    float _696 = _674 * _690;
    float _698 = -_692;
    float _700 = _666 + _698;
    float _702 = -_694;
    float _704 = _670 + _702;
    float _706 = -_696;
    float _708 = _674 + _706;
    float _710 = _700 * _700;
    float _712 = fma(_704, _704, _710);
    float _714 = fma(_708, _708, _712);
    float _716 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _718 = sqrt(_714);
    float _720 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _716);
    float _722 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _720);
    bool _724 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _726 = isnan(0.5);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _732 = _728 || _730;
    float _734 = rsqrt(_722);
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _624);
    bool _738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _740 = isnan(0.5);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _746 = _742 || _744;
    float _748 = _684 * _718;
    float _750 = _620 * _748;
    float _752 = _618 * _748;
    float _754 = _630 * _748;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _622);
    float _758 = _750 * _736;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _626);
    float _762 = _734 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _764 = _752 * _756;
    float _766 = _758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _768 = _754 * _760;
    float _770 = _762 * _762;
    float _772 = _758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _774 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _766);
    float _776 = _758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _778 = -_770;
    float _780 = fma(_778, _770, 1.0);
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _772);
    float _784 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _774);
    float _786 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _776);
    float _788 = _656 * _780;
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _782);
    float _792 = _784 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _794 = -_692;
    float _796 = _658 + _794;
    float _798 = _788 * 0.800000011920928955078125;
    float _800 = _790 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _802 = _662 + _792;
    float _804 = -_694;
    float _806 = _660 + _804;
    float _808 = _796 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _810 = _660 + _800;
    float _812 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _814 = _802 + _812;
    float _816 = -_696;
    float _818 = _662 + _816;
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[11].x, _808);
    float _822 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _824 = _810 + _822;
    float _826 = _814 * _798;
    float _828 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _786);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[11].z, _820);
    float _832 = _824 * _798;
    float _834 = fma(_826, _632, _802);
    float _836 = _796 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _838 = _830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _840 = fma(_832, _632, _810);
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _844 = _834 + _842;
    float _846 = _828 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _848 = 1.0 / _838;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _852 = _840 + _850;
    float _854 = _844 * _844;
    float _856 = _658 + _846;
    float _858 = fma(_852, _852, _854);
    float _860 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[10].x, _836);
    float _862 = sqrt(_858);
    float _864 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[10].z, _860);
    float _866 = _864 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _868 = _866 + _838;
    float _870 = _868 * _848;
    float _872 = _870 * 0.5;
    bool _874 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _878 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[30].w, _876);
    float _880 = 1.0 / _878;
    float _882 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _884 = _776;
    float _886 = _872;
    float _888 = _692;
    float _890 = _634;
    float _892 = _656;
    float _894 = _818;
    float _896 = _806;
    if (!_874)
    {
        _882 = _840;
    }
    float _898 = _882;
    float _900 = _898;
    if (!_874)
    {
        _884 = _834;
    }
    float _902 = _884;
    float _904 = _902;
    if (!_874)
    {
        _886 = _856;
    }
    float _906 = _886;
    bool _908 = !_874;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _862 + _914;
        float _918 = rsqrt(_858);
        float _920 = _916 * _912;
        float _922 = _856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = _920 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        float _934 = _928 + (-1.0);
        float _936 = _934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = fma(_932, _922, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _940 = fma(_856, _928, _936);
        float _942 = _918 * _938;
        float _944 = fma(_852, _942, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _946 = fma(_844, _942, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _910 = _940;
        _900 = _944;
        _904 = _946;
    }
    float _948 = _910;
    float _950 = _900;
    float _952 = _904;
    float _954 = -_692;
    float _956 = _954 + _948;
    float _958 = -_694;
    float _960 = _958 + _950;
    float _962 = -_696;
    float _964 = _962 + _952;
    float _966 = _956;
    float _968 = _960;
    float _970 = _964;
    float _972 = _950;
    if (_746)
    {
        _888 = 1.0;
    }
    float _974 = _888;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _978 = _880 * _976;
    float _980 = _974;
    if (!_732)
    {
        float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _984 = _796 + _982;
        float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _988 = _806 + _986;
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _992 = -_660;
        float _994 = _992 + _950;
        float _996 = _984 * _984;
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1000 = _818 + _998;
        float _1002 = -_658;
        float _1004 = _1002 + _948;
        float _1006 = fma(_988, _988, _996);
        float _1008 = -_662;
        float _1010 = _1008 + _952;
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1014 = fma(_1000, _1000, _1006);
        float _1016 = sqrt(_1014);
        float _1018 = _990 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1020 = precise::min(_1016, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1022 = _1020 * _1012;
        float _1024 = _1018 * _1022;
        float _1026 = fma(_994, _1024, _806);
        float _1028 = fma(_1004, _1024, _796);
        float _1030 = fma(_1010, _1024, _818);
        _966 = _1028;
        _968 = _1026;
        _970 = _1030;
        _972 = _1024;
    }
    float _1032 = _966;
    float _1034 = _968;
    float _1036 = _970;
    float _1038 = _972;
    float _1040 = _1038;
    if (!_746)
    {
        float _1042 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1048 = _1044 * 6.283185482025146484375;
        float _1050 = cos(_1048);
        float _1052 = _1046 * 0.15915493667125701904296875;
        float _1054 = _1044 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = 1.0 / _1050;
        float _1060 = _1052 * 6.283185482025146484375;
        float _1062 = cos(_1060);
        float _1064 = _1056 * _1058;
        float _1066 = _1052 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        float _1070 = _1062 * _1064;
        float _1072 = 1.0 / _1070;
        float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1076 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1074;
        float _1078 = 1.0 / _1076;
        float _1080 = _1068 * _1072;
        float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1084 = fma(_978, _1080, _1082);
        float _1086 = _1084 * _1078;
        float _1088 = precise::clamp(_1086, 0.0, 1.0);
        _980 = _1088;
    }
    float _1090 = _980;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1032 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1098 = _1034 + _1096;
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1102 = _1036 + _1100;
    float _1104 = _1094 * _1094;
    float _1106 = fma(_1098, _1098, _1104);
    float _1108 = fma(_1102, _1102, _1106);
    float _1110 = rsqrt(_1108);
    float _1112 = sqrt(_1108);
    float _1114 = _1110 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1116 = _1098 * _1114;
    float _1118 = _1102 * _1114;
    float _1120 = _1116 * _1116;
    float _1122 = _1118 * _1118;
    float _1124 = _1120 + _1122;
    float _1126 = sqrt(_1124);
    bool _1128 = _1126 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = _1126 + _1130;
    float _1134 = _1110;
    float _1136 = _1124;
    float _1138 = _1132;
    float _1140 = _1094;
    float _1142 = _1114;
    if (_1128)
    {
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1134 = _1144;
    }
    float _1146 = _1134;
    if (_1128)
    {
        float _1148 = rsqrt(_1124);
        _1136 = _1148;
    }
    float _1150 = _1136;
    float _1152 = _1150;
    if (_1128)
    {
        float _1154 = _1132 * _1146;
        _1138 = _1154;
    }
    float _1156 = _1138;
    if (_1128)
    {
        float _1158 = _1156 * 0.15915493667125701904296875;
        _1040 = _1158;
    }
    float _1160 = _1040;
    float _1162 = _1146;
    float _1164 = _1160;
    if (_1128)
    {
        float _1166 = _1160 * 6.283185482025146484375;
        float _1168 = sin(_1166);
        _1162 = _1168;
    }
    float _1170 = _1162;
    float _1172 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1174 = precise::max(0.0, _1172);
    float _1176 = _1102;
    float _1178 = _1174;
    if (_1128)
    {
        float _1180 = _1160 * 6.283185482025146484375;
        float _1182 = cos(_1180);
        _1176 = _1182;
    }
    float _1184 = _1176;
    float _1186 = -_1114;
    float _1188 = -_1174;
    float _1190 = fma(_1094, _1186, _1188);
    float _1192 = _1190;
    if (_1128)
    {
        float _1194 = _1190 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1194;
    }
    float _1196 = _1178;
    float _1198 = _1196;
    if (!_1128)
    {
        _1164 = _1122;
    }
    float _1200 = _1164;
    float _1202 = _1170;
    float _1204 = _1200;
    if (_1128)
    {
        float _1206 = fma(_1170, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1198 = _1206;
    }
    float _1208 = _1198;
    if (!_1128)
    {
        _1202 = _1116;
    }
    float _1210 = _1202;
    float _1212 = _1210;
    float _1214 = _1184;
    if (_1128)
    {
        float _1216 = _1184 + (-1.0);
        _1140 = _1216;
    }
    float _1218 = _1140;
    float _1220 = _1218;
    if (_1128)
    {
        float _1222 = _1150 * _1208;
        _1142 = _1222;
    }
    float _1224 = _1142;
    if (!_1128)
    {
        _1152 = _1120;
    }
    float _1226 = _1152;
    float _1228 = _1226;
    if (_1128)
    {
        float _1230 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1230;
    }
    float _1232 = _1220;
    if (_1128)
    {
        float _1234 = _1116 * _1224;
        _1212 = _1234;
    }
    float _1236 = _1212;
    if (_1128)
    {
        float _1238 = fma(_1190, _1184, _1232);
        _1192 = _1238;
    }
    float _1240 = _1192;
    if (!_1128)
    {
        _1214 = _1118;
    }
    float _1242 = _1214;
    float _1244 = _1242;
    if (_1128)
    {
        float _1246 = _1236 * _1236;
        _1228 = _1246;
    }
    float _1248 = _1228;
    if (_1128)
    {
        float _1250 = _1118 * _1224;
        _1244 = _1250;
    }
    float _1252 = _1244;
    float _1254 = fma(_1240, _1240, _1248);
    if (_1128)
    {
        float _1256 = _1252 * _1252;
        _1204 = _1256;
    }
    float _1258 = _1204;
    float _1260 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1262 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1264 = _1254 + _1258;
    float _1266 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1260);
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1270 = fma(_1112, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1268);
    float _1272 = precise::clamp(_1270, 0.0, 1.0);
    float _1274 = rsqrt(_1264);
    float _1276 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1266);
    float _1278 = -_1272;
    float _1280 = _1278 + 1.0;
    float _1282 = fma(_806, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1284 = fma(_818, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1286 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1288 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1290 = abs(_1280);
    float _1292 = log2(_1290);
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1296 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1298 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1288);
    float _1300 = -_1294;
    float _1302 = fma(_1300, _1262, 1.0);
    float _1304 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1306 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1296);
    float _1308 = _1274 * _1236;
    float _1310 = _1274 * _1240;
    float _1312 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1304);
    float _1314 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1306);
    float _1316 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1318 = floor(_1282);
    float _1320 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1312);
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1324 = _1274 * _1252;
    float _1326 = -_1316;
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1326);
    float _1330 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1334 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1336 = -_1324;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1328);
    float _1340 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1298);
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1332);
    float _1344 = exp2(_1334);
    float _1346 = fma(_1338, -0.5, 0.5);
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1350 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1342);
    float _1352 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1354 = -_1318;
    float _1356 = _1282 + _1354;
    float _1358 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1350);
    float _1362 = floor(_1284);
    float _1364 = fma(_1338, 0.5, 0.5);
    float _1366 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1368 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1352);
    float _1370 = fma(_1364, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1372 = _1310 + 1.0;
    float _1374 = log2(_1302);
    float _1376 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1378 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1380 = fma(_1364, _1370, -0.212114393711090087890625);
    float _1382 = -_1310;
    float _1384 = fma(_1344, _1372, _1382);
    float _1386 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1376);
    float _1388 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1378);
    float _1390 = fma(_1364, _1380, 1.570728778839111328125);
    float _1392 = 1.0 / _1360;
    float _1394 = -_1362;
    float _1396 = _1284 + _1394;
    float _1398 = sqrt(_1346);
    float _1400 = _1374 * 0.693147182464599609375;
    float2 _4611 = float2(_1356, _1396);
    float _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4611, float2(0.0), isnan(_4611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4611, float2(0.0), isnan(_4611)), level(0.0)).x;
    float _1404 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1406 = _1386 * _1392;
    float _1408 = _1388 * _1392;
    float _1410 = fma(_1406, 0.5, 0.5);
    float _1412 = fma(_1408, -0.5, 0.5);
    float _1414 = _1398 * 0.636619746685028076171875;
    float3 _4639 = float3(_1410, _1412, _1404);
    float _1416 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4639, float3(0.0), isnan(_4639)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4639, float3(0.0), isnan(_4639)), level(0.0)).x;
    float _1418 = -_1390;
    float _1420 = fma(_1414, _1418, 1.0);
    float _1422 = fma(_1384, 0.5, 0.5);
    float3 _4657 = float3(_1410, _1412, _1404);
    float4 _1425 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4657, float3(0.0), isnan(_4657)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4657, float3(0.0), isnan(_4657)), level(0.0)).xyzw;
    float _1427 = _1425.x;
    float _1429 = _1425.y;
    float _1431 = _1425.z;
    float _1433 = _1425.w;
    float2 _4673 = float2(_1420, _1422);
    float3 _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4673, float2(0.0), isnan(_4673)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4673, float2(0.0), isnan(_4673)), level(0.0)).xyz;
    float _1439 = _1437.x;
    float _1441 = _1437.y;
    float _1443 = _1437.z;
    float _1445 = in.m_53.w;
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1449 = in.m_53.y;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1457 = _610 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_61.x = _560;
    out.m_61.y = _564;
    out.m_61.z = _566;
    out.m_61.w = _586;
    float _1463 = 1.0 / _1453;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1467 = _1465 != 0;
    float _1469 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1473 = _1471 != 0;
    float _1475 = in.m_53.z;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1479 = _1477 != 0;
    float _1481 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1485 = _1483 != 0;
    float _1487 = 1.0 / _1461;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1491 = _1489 != 0;
    float _1493 = in.m_59.x;
    float _1495 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1497 = _1445 > 0.5;
    float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1501 = _1499 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1503 = in.m_63.x;
    float _1505 = in.m_63.y;
    float _1507 = in.m_63.z;
    float _1509 = in.m_63.w;
    bool _1511 = _1449 > 0.5;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1513;
    float _1517 = 1.0 / _1501;
    int _1519 = _1511 ? as_type<int>(_656) : as_type<int>(_634);
    float _1521 = in.m_53.x;
    float _1523 = _1497 ? _656 : _634;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1527 = _610 + _1525;
    float _1529 = _1467 ? as_type<float>(_1519) : _634;
    float _1531 = _1515 * _1487;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1535 = _1533 != 0;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1543 = _1541 != 0;
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1547 = _1539 * _1463;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1551 = 0;
    float _1553 = _1517;
    bool _1555 = _1543;
    float _1557 = _1523;
    float _1559 = _1493;
    float _1561 = _1475;
    float _1563 = _1360;
    float _1565 = _1386;
    float _1567 = _1388;
    if (_1485)
    {
        float _1569 = -_1493;
        float _1571 = _1569 + 1.0;
        _1551 = as_type<int>(_1571);
    }
    int _1573 = _1551;
    float _1575 = fma(_1547, _1527, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1579;
    float _1583 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1585 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1587 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1589 = 0.0;
    if (!_1535)
    {
        _1589 = _1449;
    }
    float _1591 = _1589;
    float _1593 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1583);
    float _1595 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1585);
    float _1597 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1587);
    float _1599 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1601 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1593);
    float _1603 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1595);
    float _1605 = _1581 * _1517;
    float _1607 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1597);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1611 = _610 + _1609;
    int _1613 = _1491 ? as_type<int>(_1523) : as_type<int>(_634);
    float _1615 = fma(_1605, _1457, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1617 = _1475 > 0.5;
    float _1619 = fma(_1531, _1611, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_65.x = _1601;
    out.m_65.y = _1603;
    out.m_65.z = _1607;
    bool _1621 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1623 = isnan(_610);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1635 = _1591;
    int _1637 = as_type<int>(_1599);
    int _1639 = _1613;
    float _1641 = _1619;
    if (_1543)
    {
        float _1643 = _1617 ? _656 : _634;
        _890 = _1643;
    }
    float _1645 = _890;
    float _1647 = exp2(_1469);
    if (!_1535)
    {
        _1553 = _1591;
    }
    float _1649 = _1553;
    float _1651 = -_1631;
    float _1653 = _1651 + 1.0;
    float _1655 = _1649;
    if (_1535)
    {
        _1635 = _1449;
    }
    float _1657 = _1635;
    float _1659 = fma(_1599, _1645, -0.5);
    if (_1479)
    {
        float _1661 = -_1493;
        float _1663 = _1661 + 1.0;
        _1637 = as_type<int>(_1663);
    }
    int _1665 = _1637;
    float _1667 = _1521;
    if (_1473)
    {
        bool _1669 = _1521 > 0.5;
        _1555 = _1669;
    }
    bool _1671 = _1555;
    out.m_67.x = _806;
    out.m_67.y = _796;
    out.m_67.z = _818;
    bool _1673 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1675 = isnan(_610);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1681 = _1677 || _1679;
    float _1683 = float(_1681);
    float _1685 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1495);
    bool _1687 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1689 = isnan(_610);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    out.m_69.x = _752;
    float _1699 = -_1683;
    float _1701 = _1699 + 1.0;
    float _1703 = _1683 * _1653;
    bool _1705 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1707 = isnan(_610);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1713 = _1709 || _1711;
    float _1715 = float(_1713);
    float _1717 = -_1647;
    float _1719 = _1717 + 1.0;
    float _1721 = _1697 * _1701;
    float _1723 = -_1697;
    float _1725 = _1723 + 1.0;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_1473)
    {
        _1557 = _1493;
    }
    float _1729 = _1557;
    float _1731 = _1719 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1733 = _1715 * _1725;
    float _1735 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1727);
    float _1737 = fma(as_type<float>(_1613), _1481, -0.5);
    float _1739 = -_1715;
    float _1741 = _1739 + 1.0;
    float _1743 = _1619 * _1733;
    float _1745 = _1729;
    if (_1473)
    {
        float _1747 = -_1493;
        float _1749 = _1747 + 1.0;
        _1639 = as_type<int>(_1749);
    }
    int _1751 = _1639;
    if (!_1479)
    {
        _1641 = _1493;
    }
    float _1753 = _1641;
    out.m_71.w = _688;
    float _1755 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1743);
    float _1757 = _1753;
    if (_1479)
    {
        float _1759 = _1617 ? as_type<float>(_1665) : _1493;
        _1757 = _1759;
    }
    float _1761 = _1757;
    float _1763 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1685);
    float _1765 = in.m_73.x;
    float _1767 = in.m_73.y;
    float _1769 = in.m_73.z;
    if (_1473)
    {
        float _1771 = _1671 ? as_type<float>(_1751) : _1493;
        _1745 = _1771;
    }
    float _1773 = _1745;
    float _1775 = fma(_1575, _1721, _1755);
    if (_1485)
    {
        float _1777 = _1511 ? as_type<float>(_1573) : _1493;
        _1559 = _1777;
    }
    float _1779 = _1559;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1783 = _624 != 0.0;
    bool _1785 = isnan(_624);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan(0.0);
    bool _1791 = _1787 || _1789;
    float _1793 = fma(_1615, _1703, _1775);
    if (_1535)
    {
        _1655 = _1521;
    }
    float _1795 = _1655;
    float _1797 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1799 = _622 == 0.0;
    bool _1801 = !_1791;
    bool _1803 = _1799 && _1801;
    float _1805 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1793);
    float _1807 = _1795;
    if (_1535)
    {
        _892 = _1521;
    }
    float _1809 = _892;
    float _1811 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1813 = _626 == 0.0;
    bool _1815 = _1813 && _1803;
    float _1817 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1549);
    float _1819 = -_1577;
    float _1821 = fma(_1811, 2.0, _1819);
    float _1823 = _1809;
    if (!_1535)
    {
        _1823 = _1475;
    }
    float _1825 = _1823;
    out.m_75.x = _1034;
    out.m_75.y = _1032;
    out.m_75.z = _1036;
    float _1827 = 0.0;
    if (!_1535)
    {
        _1827 = _1475;
    }
    float _1829 = _1827;
    float _1831 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1833 = _1829;
    if (_1535)
    {
        _1561 = _1657;
    }
    float _1835 = _1561;
    float _1837 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1839 = _1837;
    if (_1535)
    {
        _1833 = _1657;
    }
    float _1841 = _1833;
    float _1843 = fma(_1831, _1761, -0.5);
    if (_1535)
    {
        _1807 = _1657;
    }
    float _1845 = _1807;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1849 = -_1633;
    float _1851 = fma(_1837, 2.0, _1849);
    float _1853 = _1835 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1855 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1847);
    float _1857 = _1847;
    float _1859 = _1845;
    if (_1815)
    {
        _1857 = _1767;
    }
    float _1861 = _1857;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1865 = _1861;
    if (_1815)
    {
        _1839 = _1769;
    }
    float _1867 = _1839;
    float _1869 = _1867;
    if (!_1815)
    {
        float _1871 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1767);
        _1865 = _1871;
    }
    float _1873 = _1865;
    if (!_1815)
    {
        float _1875 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1769);
        _1869 = _1875;
    }
    float _1877 = _1869;
    float _1879 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1817);
    float _1881 = -_138;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1821);
    float _1885 = fma(_1853, -2.0, _1863);
    float _1887 = _1507 * _1765;
    if (!_1535)
    {
        _1859 = _1521;
    }
    float _1889 = _1859;
    float _1891 = fma(_1879, _1843, _1883);
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1895 = -_1887;
    float _1897 = fma(_1503, _1769, _1895);
    float _1899 = _1505 * _1769;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1905 = _1503 * _1767;
    float _1907 = fma(_1901, -2.0, _1893);
    float _1909 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1855);
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1913 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1885);
    float _1915 = -_1899;
    float _1917 = fma(_1507, _1767, _1915);
    float _1919 = -_1905;
    float _1921 = fma(_1505, _1765, _1919);
    float _1923 = abs(_978);
    float _1925 = log2(_1923);
    float _1927 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1911);
    if (_1815)
    {
        _1667 = _1765;
    }
    float _1929 = _1667;
    float _1931 = _1929;
    if (!_1815)
    {
        float _1933 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1765);
        _1931 = _1933;
    }
    float _1935 = _1931;
    float _1937 = -_1913;
    float _1939 = fma(_1909, _1737, _1937);
    float _1941 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1943 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1945 = _1897 * _1509;
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1949 = _1917 * _1509;
    float _1951 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1735);
    float _1953 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1907);
    float _1955 = _1921 * _1509;
    float _1957 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1927);
    float _1959 = -_138;
    float _1961 = fma(_1959, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1851);
    float _1963 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1965 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1967 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1941);
    float _1969 = _1943 * _1903;
    float _1971 = -_1953;
    float _1973 = fma(_1951, _1659, _1971);
    float _1975 = exp2(_1963);
    float _1977 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1965);
    float _1979 = _1797 * _1947;
    float _1981 = _1939 + 0.5;
    float _1983 = _1805 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1993 = _1945 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1995 = _1945 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1997 = _1945 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1999 = _1891 + 0.5;
    float _2001 = fma(_1975, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2003 = precise::clamp(_2001, 0.0, 1.0);
    float _2005 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2007 = _1989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2009 = _1991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2011 = fma(_2003, -2.0, 3.0);
    float _2013 = _2003 * _2003;
    float _2015 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1993);
    float _2017 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1995);
    float _2019 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1997);
    float _2021 = _2013 * _2011;
    out.m_77.x = _1979;
    out.m_77.y = _1969;
    out.m_77.z = _1999;
    out.m_77.w = _1981;
    float _2023 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2015);
    float _2025 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2019);
    bool _2027 = _978 <= 8000.0;
    bool _2029 = isnan(_978);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan(8000.0);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    out.m_79.x = _2005;
    out.m_79.y = _2007;
    out.m_79.z = _2009;
    out.m_79.w = _1983;
    float _2039 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2041 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2043 = in.m_81.x;
    float _2045 = fma(_2039, _1779, -0.5);
    bool _2047 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2049 = isnan(_1112);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2055 = _2051 || _2053;
    float _2057 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2041);
    float _2059 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1763);
    float _2061 = fma(_1957, _2045, _1961);
    float _2063 = _1973 + 0.5;
    float _2065 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2017);
    float _2067 = -_2021;
    float _2069 = _2067 + 1.0;
    float _2071 = _2061 + 0.5;
    float _2073 = _1360 * 0.5;
    float _2075 = _2059 + _1360;
    float _2077 = fma(_2069, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2021);
    out.m_83.x = _2023;
    out.m_83.y = _2065;
    out.m_83.z = _2025;
    float _2079 = _2037 * _2077;
    out.m_85.x = _2071;
    out.m_85.y = _2063;
    float _2081 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2055)
    {
        _894 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2083 = _894;
    float _2085 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1386;
    out.gl_Position.y = _1388;
    out.gl_Position.z = _2059;
    out.gl_Position.w = _1360;
    float _2087 = _2083;
    float _2089 = _2083;
    if (!_2055)
    {
        _896 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2091 = _896;
    float _2093 = fma(_1388, -0.5, _2073);
    float _2095 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2057);
    float _2097 = _1386 + _1360;
    float _2099 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1967);
    float _2101 = _2075 * 0.5;
    float _2103 = _2097 * 0.5;
    float _2105 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1977);
    float _2107 = _2091;
    float _2109 = _2091;
    if (!_2055)
    {
        _1563 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2111 = _1563;
    out.m_87.x = _2103;
    out.m_87.y = _2093;
    out.m_87.z = _2101;
    out.m_87.w = _1360;
    float _2113 = _2111;
    float _2115 = _2111;
    if (!_2055)
    {
        _1565 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2117 = _1565;
    float _2119 = _2117;
    float _2121 = _2117;
    if (!_2055)
    {
        _1567 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2123 = _1567;
    out.m_89.x = _2105;
    out.m_89.y = _2099;
    out.m_89.z = _2095;
    float _2125 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2127 = -_1402;
    float _2129 = _2127 + 1.0;
    float _2131 = _2129 * _2085;
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = -_2133;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2139 = _2123;
    float _2141 = _2123;
    if (!_2055)
    {
        _2081 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2143 = _2081;
    float _2145 = _2137 * _2043;
    float _2147 = _1731 * _1416;
    float _2149 = -_1731;
    float _2151 = _2149 + 1.0;
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2155 = _1433 * _2147;
    out.m_91.x = _2153;
    float _2157 = _1443 * _2147;
    float _2159 = fma(_1439, _2155, _1427);
    float _2161 = fma(_1441, _2155, _1429);
    float _2163 = _1433 * _2151;
    float _2165 = fma(_1433, _2157, _1431);
    out.m_93.x = _2159;
    out.m_93.y = _2161;
    out.m_93.z = _2165;
    out.m_93.w = _2163;
    bool _2167 = !_2055;
    float _2169 = _2143;
    float _2171 = _2143;
    if (!_2167)
    {
        bool _2173 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2175 = isnan(_1112);
        bool _2177 = _2173 || _2175;
        bool _2179 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2181 = _2177 || _2179;
        if (!_2181)
        {
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2185 = _1112 + _2183;
            float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2189 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2187;
            float _2191 = 1.0 / _2189;
            float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2203 = _2201 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2213 = _2185 * _2191;
            float _2215 = precise::clamp(_2213, 0.0, 1.0);
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2221 = fma(_2215, _2195, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2223 = fma(_2215, _2219, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2225 = fma(_2215, _2199, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2227 = fma(_2215, _2203, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2229 = fma(_2215, _2207, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2231 = fma(_2215, _2211, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2121 = _2223;
            _2171 = _2229;
            _2115 = _2221;
            _2089 = _2227;
            _2141 = _2225;
            _2109 = _2231;
            _2233 = true;
        }
        else
        {
            bool _2235 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2237 = isnan(_1112);
            bool _2239 = _2235 || _2237;
            bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2243 = _2239 || _2241;
            if (!_2243)
            {
                _2113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2245 = _2113;
            _2115 = _2245;
            if (!_2243)
            {
                _2119 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2247 = _2119;
            _2121 = _2247;
            if (!_2243)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2249 = _2139;
            _2141 = _2249;
            if (!_2243)
            {
                _2087 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2251 = _2087;
            _2089 = _2251;
            if (!_2243)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2253 = _2169;
            _2171 = _2253;
            if (!_2243)
            {
                _2107 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2255 = _2107;
            bool _2257 = !_2243;
            _2109 = _2255;
            if (!_2257)
            {
                bool _2259 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2261 = isnan(_1112);
                bool _2263 = _2259 || _2261;
                bool _2265 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2267 = _2263 || _2265;
                if (!_2267)
                {
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2271 = _1112 + _2269;
                    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2275 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2273;
                    float _2277 = 1.0 / _2275;
                    float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2299 = _2271 * _2277;
                    float _2301 = precise::clamp(_2299, 0.0, 1.0);
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2307 = fma(_2301, _2281, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2309 = fma(_2301, _2305, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2311 = fma(_2301, _2285, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2313 = fma(_2301, _2289, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2315 = fma(_2301, _2293, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2317 = fma(_2301, _2297, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2121 = _2309;
                    _2171 = _2315;
                    _2115 = _2307;
                    _2089 = _2313;
                    _2141 = _2311;
                    _2109 = _2317;
                    _2233 = true;
                }
                else
                {
                    _2121 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2089 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2109 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2233 = false;
    float _2319 = _2121;
    float _2321 = _2171;
    float _2323 = _2115;
    float _2325 = _2089;
    float _2327 = _2141;
    float _2329 = _2109;
    float _2331 = fma(_2099, -0.5, 0.5);
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    float _2335 = -_2319;
    float _2337 = _2335 + _2321;
    float _2339 = _2125 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2341 = -_2323;
    float _2343 = _2341 + _2325;
    float _2345 = fma(_2333, _2337, _2319);
    out.m_95.x = 0.0;
    float _2347 = -_2327;
    float _2349 = _2347 + _2329;
    float _2351 = fma(_2333, _2343, _2323);
    float _2353 = _2345 * 0.586610972881317138671875;
    out.m_49.x = _2339;
    bool _2355 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2357 = fma(_2333, _2349, _2327);
    float _2359 = fma(_2351, 0.298911988735198974609375, _2353);
    bool _2361 = _1090 > 0.0;
    bool _2363 = isnan(_1090);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan(0.0);
    bool _2369 = _2365 || _2367;
    float _2371 = fma(_2357, 0.114477999508380889892578125, _2359);
    float _2373 = -_2371;
    float _2375 = _2351 + _2373;
    float _2377 = -_2371;
    float _2379 = _2345 + _2377;
    float _2381 = -_2371;
    float _2383 = _2357 + _2381;
    float _2385 = fma(_2375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2387 = fma(_2379, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2389 = fma(_2383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    bool _2391 = !_2355;
    if (!_2391)
    {
        float _2393 = -_1032;
        float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2397 = -_1034;
        float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2401 = -_1036;
        float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2405 = _2395 * _2395;
        float _2407 = fma(_2399, _2399, _2405);
        float _2409 = fma(_2403, _2403, _2407);
        float _2411 = sqrt(_2409);
        float _2413 = rsqrt(_2409);
        float _2415 = -_2411;
        float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2419 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2421 = precise::clamp(_2419, 0.0, 1.0);
        float _2423 = _2399 * _2413;
        float _2425 = _2395 * _2413;
        float _2427 = abs(_2421);
        float _2429 = log2(_2427);
        float _2431 = _2403 * _2413;
        float _2433 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2435 = _2099 * _2425;
        float _2437 = -_2425;
        float _2439 = -_2433;
        float _2441 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2439);
        float _2443 = fma(_2105, _2423, _2435);
        float _2445 = -_2431;
        float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2441);
        float _2449 = fma(_2095, _2431, _2443);
        float _2451 = precise::clamp(_2449, 0.0, 1.0);
        float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2455 = _2447 + _2453;
        float _2457 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2459 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2461 = precise::clamp(_2459, 0.0, 1.0);
        float _2463 = exp2(_2457);
        float _2465 = _2463 * _2461;
        float _2467 = _2451 * _2465;
        float _2469 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2473 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2469;
        out.m_95.y = _2471;
        out.m_95.z = _2473;
    }
    out.m_71.x = _2385;
    out.m_71.y = _2387;
    out.m_71.z = _2389;
    if (_2369)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2475 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2475;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2233 = false;
    bool _608 = false;
    bool _472 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_118)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2531 = as_type<float>(_128);
        out.gl_Position.z = _2531;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_51.w;
    float _134 = float(_114);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    float _156 = _132;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _130 = as_type<int>(_160);
    }
    int _162 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2595 = as_type<float>(_162);
        out.gl_Position.z = _2595;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = 1.0 / _134;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _138 * _164;
    bool _170 = !_166;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        _188 = _168;
    }
    _190 = false;
    float _192 = _188;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = _192 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _192 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = 1.0 / _212;
    float _224 = 1.0 / _208;
    bool _226 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _228 = isnan(_192);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _220;
    float _242 = _204 * _222;
    bool _244 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_192);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _256;
    float _260 = 1.0 / _216;
    float _262 = _196 * _224;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _266 = _192 + _264;
    float _268 = -_236;
    float _270 = _268 + 1.0;
    float _272 = fma(_258, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _274 = _266 * _240;
    bool _276 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_192);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_286;
    float _290 = _288 + 1.0;
    float _292 = _286 * _270;
    float _294 = _200 * _260;
    bool _296 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_192);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    bool _312 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_192);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _332 = _306 * _290;
    float _334 = -_306;
    float _336 = _334 + 1.0;
    float _338 = -_322;
    float _340 = _338 + 1.0;
    float _342 = fma(_310, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = fma(_326, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = _322 * _336;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = _254 * _340;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = -_254;
    float _360 = _358 + 1.0;
    float _362 = fma(_330, _242, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = _342 * _352;
    float _366 = _344 * _352;
    float _368 = _272 * _352;
    float _370 = in.m_55.x;
    float _372 = in.m_55.y;
    float _374 = in.m_55.z;
    float _376 = fma(_350, _242, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _378 = fma(_356, _242, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _382 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _392;
    float _396 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _398 = fma(_362, _346, _380);
    float _400 = fma(_376, _346, _382);
    float _402 = fma(_386, _294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _404 = fma(_390, _294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _414 = fma(_394, _294, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _420 = fma(_378, _346, _396);
    float _422 = fma(_408, _274, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _424 = fma(_412, _274, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _426 = fma(_402, _332, _398);
    float _428 = fma(_404, _332, _400);
    float _430 = fma(_418, _274, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _432 = fma(_414, _332, _420);
    float _434 = fma(_422, _292, _426);
    float _436 = fma(_424, _292, _428);
    float _438 = fma(_430, _292, _432);
    float _440 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[147].x, _434);
    float _442 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[147].y, _436);
    float _444 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[147].z, _438);
    float _446 = _440 * _370;
    float _448 = _442 * _372;
    float _450 = _444 * _374;
    bool _452 = !_238;
    float _470;
    if (!_452)
    {
        float _454 = in.m_53.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        _470 = _168;
    }
    _472 = false;
    float _474 = _470;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _474 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _486 = isnan(_474);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _500 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _502 = isnan(_474);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _512;
    bool _516 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _518 = isnan(_474);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _482;
    float _530 = -_494;
    float _532 = _530 + 1.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _536 = _474 + _534;
    bool _538 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _540 = _510 * _532;
    float _542 = -_510;
    float _544 = _542 + 1.0;
    float _546 = 1.0 / _498;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _552 = _514 * _528;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _560 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = fma(_552, _478, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _564 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _556 * _546;
    float _570 = -_526;
    float _572 = _570 + 1.0;
    float _574 = _562 * _540;
    float _576 = fma(_568, _536, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = _494 * _572;
    float _580 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _582 = fma(_576, _578, _580);
    float _584 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[117].x, _582);
    float _586 = _584 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _588 = !_538;
    float _606;
    if (!_588)
    {
        float _590 = in.m_53.x;
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _594 = _590 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        _606 = _168;
    }
    _608 = false;
    float _610 = _606;
    float _612 = in.m_46.x;
    float _614 = in.m_46.y;
    float _616 = in.m_46.z;
    float _618 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _620 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _622 = in.m_57.x;
    float _624 = in.m_57.y;
    float _626 = in.m_57.z;
    float _628 = _618 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _630 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _632 = _168 + 0.20000000298023223876953125;
    float _634 = in.m_59.y;
    float _636 = _614 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _638 = _614 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _640 = _614 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _642 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[5].x, _636);
    float _644 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[4].x, _638);
    float _646 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[6].x, _640);
    float _648 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[5].z, _642);
    float _650 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[4].z, _644);
    float _652 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[6].z, _646);
    float _654 = -_634;
    float _656 = _654 + 1.0;
    float _658 = _648 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = _650 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _662 = _652 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _658 + _664;
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _670 = _660 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _674 = _662 + _672;
    float _676 = _666 * _666;
    float _678 = fma(_670, _670, _676);
    float _680 = fma(_674, _674, _678);
    float _682 = sqrt(_680);
    float _684 = rsqrt(_680);
    float _686 = _682 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _688 = precise::min(_628, _686);
    float _690 = _684 * _688;
    float _692 = _666 * _690;
    float _694 = _670 * _690;
    float _696 = _674 * _690;
    float _698 = -_692;
    float _700 = _666 + _698;
    float _702 = -_694;
    float _704 = _670 + _702;
    float _706 = -_696;
    float _708 = _674 + _706;
    float _710 = _700 * _700;
    float _712 = fma(_704, _704, _710);
    float _714 = fma(_708, _708, _712);
    float _716 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _718 = sqrt(_714);
    float _720 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _716);
    float _722 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _720);
    bool _724 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _726 = isnan(0.5);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _732 = _728 || _730;
    float _734 = rsqrt(_722);
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _624);
    bool _738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _740 = isnan(0.5);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _746 = _742 || _744;
    float _748 = _684 * _718;
    float _750 = _620 * _748;
    float _752 = _618 * _748;
    float _754 = _630 * _748;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _622);
    float _758 = _750 * _736;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _626);
    float _762 = _734 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _764 = _752 * _756;
    float _766 = _758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _768 = _754 * _760;
    float _770 = _762 * _762;
    float _772 = _758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _774 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _766);
    float _776 = _758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _778 = -_770;
    float _780 = fma(_778, _770, 1.0);
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _772);
    float _784 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _774);
    float _786 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _776);
    float _788 = _656 * _780;
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _782);
    float _792 = _784 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _794 = -_692;
    float _796 = _658 + _794;
    float _798 = _788 * 0.800000011920928955078125;
    float _800 = _790 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _802 = _662 + _792;
    float _804 = -_694;
    float _806 = _660 + _804;
    float _808 = _796 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _810 = _660 + _800;
    float _812 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _814 = _802 + _812;
    float _816 = -_696;
    float _818 = _662 + _816;
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[11].x, _808);
    float _822 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _824 = _810 + _822;
    float _826 = _814 * _798;
    float _828 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _786);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[11].z, _820);
    float _832 = _824 * _798;
    float _834 = fma(_826, _632, _802);
    float _836 = _796 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _838 = _830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _840 = fma(_832, _632, _810);
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _844 = _834 + _842;
    float _846 = _828 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _848 = 1.0 / _838;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _852 = _840 + _850;
    float _854 = _844 * _844;
    float _856 = _658 + _846;
    float _858 = fma(_852, _852, _854);
    float _860 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[10].x, _836);
    float _862 = sqrt(_858);
    float _864 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[10].z, _860);
    float _866 = _864 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _868 = _866 + _838;
    float _870 = _868 * _848;
    float _872 = _870 * 0.5;
    bool _874 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _878 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[30].w, _876);
    float _880 = 1.0 / _878;
    float _882 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _884 = _776;
    float _886 = _872;
    float _888 = _692;
    float _890 = _634;
    float _892 = _656;
    float _894 = _818;
    float _896 = _806;
    if (!_874)
    {
        _882 = _840;
    }
    float _898 = _882;
    float _900 = _898;
    if (!_874)
    {
        _884 = _834;
    }
    float _902 = _884;
    float _904 = _902;
    if (!_874)
    {
        _886 = _856;
    }
    float _906 = _886;
    bool _908 = !_874;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _862 + _914;
        float _918 = rsqrt(_858);
        float _920 = _916 * _912;
        float _922 = _856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = _920 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        float _934 = _928 + (-1.0);
        float _936 = _934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = fma(_932, _922, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _940 = fma(_856, _928, _936);
        float _942 = _918 * _938;
        float _944 = fma(_852, _942, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _946 = fma(_844, _942, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _910 = _940;
        _900 = _944;
        _904 = _946;
    }
    float _948 = _910;
    float _950 = _900;
    float _952 = _904;
    float _954 = -_692;
    float _956 = _954 + _948;
    float _958 = -_694;
    float _960 = _958 + _950;
    float _962 = -_696;
    float _964 = _962 + _952;
    float _966 = _956;
    float _968 = _960;
    float _970 = _964;
    float _972 = _950;
    if (_746)
    {
        _888 = 1.0;
    }
    float _974 = _888;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _978 = _880 * _976;
    float _980 = _974;
    if (!_732)
    {
        float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _984 = _796 + _982;
        float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _988 = _806 + _986;
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _992 = -_660;
        float _994 = _992 + _950;
        float _996 = _984 * _984;
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1000 = _818 + _998;
        float _1002 = -_658;
        float _1004 = _1002 + _948;
        float _1006 = fma(_988, _988, _996);
        float _1008 = -_662;
        float _1010 = _1008 + _952;
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1014 = fma(_1000, _1000, _1006);
        float _1016 = sqrt(_1014);
        float _1018 = _990 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1020 = precise::min(_1016, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1022 = _1020 * _1012;
        float _1024 = _1018 * _1022;
        float _1026 = fma(_994, _1024, _806);
        float _1028 = fma(_1004, _1024, _796);
        float _1030 = fma(_1010, _1024, _818);
        _966 = _1028;
        _968 = _1026;
        _970 = _1030;
        _972 = _1024;
    }
    float _1032 = _966;
    float _1034 = _968;
    float _1036 = _970;
    float _1038 = _972;
    float _1040 = _1038;
    if (!_746)
    {
        float _1042 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1048 = _1044 * 6.283185482025146484375;
        float _1050 = cos(_1048);
        float _1052 = _1046 * 0.15915493667125701904296875;
        float _1054 = _1044 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = 1.0 / _1050;
        float _1060 = _1052 * 6.283185482025146484375;
        float _1062 = cos(_1060);
        float _1064 = _1056 * _1058;
        float _1066 = _1052 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        float _1070 = _1062 * _1064;
        float _1072 = 1.0 / _1070;
        float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1076 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1074;
        float _1078 = 1.0 / _1076;
        float _1080 = _1068 * _1072;
        float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1084 = fma(_978, _1080, _1082);
        float _1086 = _1084 * _1078;
        float _1088 = precise::clamp(_1086, 0.0, 1.0);
        _980 = _1088;
    }
    float _1090 = _980;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1032 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1098 = _1034 + _1096;
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1102 = _1036 + _1100;
    float _1104 = _1094 * _1094;
    float _1106 = fma(_1098, _1098, _1104);
    float _1108 = fma(_1102, _1102, _1106);
    float _1110 = rsqrt(_1108);
    float _1112 = sqrt(_1108);
    float _1114 = _1110 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1116 = _1098 * _1114;
    float _1118 = _1102 * _1114;
    float _1120 = _1116 * _1116;
    float _1122 = _1118 * _1118;
    float _1124 = _1120 + _1122;
    float _1126 = sqrt(_1124);
    bool _1128 = _1126 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = _1126 + _1130;
    float _1134 = _1110;
    float _1136 = _1124;
    float _1138 = _1132;
    float _1140 = _1094;
    float _1142 = _1114;
    if (_1128)
    {
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1134 = _1144;
    }
    float _1146 = _1134;
    if (_1128)
    {
        float _1148 = rsqrt(_1124);
        _1136 = _1148;
    }
    float _1150 = _1136;
    float _1152 = _1150;
    if (_1128)
    {
        float _1154 = _1132 * _1146;
        _1138 = _1154;
    }
    float _1156 = _1138;
    if (_1128)
    {
        float _1158 = _1156 * 0.15915493667125701904296875;
        _1040 = _1158;
    }
    float _1160 = _1040;
    float _1162 = _1146;
    float _1164 = _1160;
    if (_1128)
    {
        float _1166 = _1160 * 6.283185482025146484375;
        float _1168 = sin(_1166);
        _1162 = _1168;
    }
    float _1170 = _1162;
    float _1172 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1174 = precise::max(0.0, _1172);
    float _1176 = _1102;
    float _1178 = _1174;
    if (_1128)
    {
        float _1180 = _1160 * 6.283185482025146484375;
        float _1182 = cos(_1180);
        _1176 = _1182;
    }
    float _1184 = _1176;
    float _1186 = -_1114;
    float _1188 = -_1174;
    float _1190 = fma(_1094, _1186, _1188);
    float _1192 = _1190;
    if (_1128)
    {
        float _1194 = _1190 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1194;
    }
    float _1196 = _1178;
    float _1198 = _1196;
    if (!_1128)
    {
        _1164 = _1122;
    }
    float _1200 = _1164;
    float _1202 = _1170;
    float _1204 = _1200;
    if (_1128)
    {
        float _1206 = fma(_1170, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1198 = _1206;
    }
    float _1208 = _1198;
    if (!_1128)
    {
        _1202 = _1116;
    }
    float _1210 = _1202;
    float _1212 = _1210;
    float _1214 = _1184;
    if (_1128)
    {
        float _1216 = _1184 + (-1.0);
        _1140 = _1216;
    }
    float _1218 = _1140;
    float _1220 = _1218;
    if (_1128)
    {
        float _1222 = _1150 * _1208;
        _1142 = _1222;
    }
    float _1224 = _1142;
    if (!_1128)
    {
        _1152 = _1120;
    }
    float _1226 = _1152;
    float _1228 = _1226;
    if (_1128)
    {
        float _1230 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1230;
    }
    float _1232 = _1220;
    if (_1128)
    {
        float _1234 = _1116 * _1224;
        _1212 = _1234;
    }
    float _1236 = _1212;
    if (_1128)
    {
        float _1238 = fma(_1190, _1184, _1232);
        _1192 = _1238;
    }
    float _1240 = _1192;
    if (!_1128)
    {
        _1214 = _1118;
    }
    float _1242 = _1214;
    float _1244 = _1242;
    if (_1128)
    {
        float _1246 = _1236 * _1236;
        _1228 = _1246;
    }
    float _1248 = _1228;
    if (_1128)
    {
        float _1250 = _1118 * _1224;
        _1244 = _1250;
    }
    float _1252 = _1244;
    float _1254 = fma(_1240, _1240, _1248);
    if (_1128)
    {
        float _1256 = _1252 * _1252;
        _1204 = _1256;
    }
    float _1258 = _1204;
    float _1260 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1262 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1264 = _1254 + _1258;
    float _1266 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1260);
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1270 = fma(_1112, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1268);
    float _1272 = precise::clamp(_1270, 0.0, 1.0);
    float _1274 = rsqrt(_1264);
    float _1276 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1266);
    float _1278 = -_1272;
    float _1280 = _1278 + 1.0;
    float _1282 = fma(_806, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1284 = fma(_818, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1286 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1288 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1290 = abs(_1280);
    float _1292 = log2(_1290);
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1296 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1298 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1288);
    float _1300 = -_1294;
    float _1302 = fma(_1300, _1262, 1.0);
    float _1304 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1306 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1296);
    float _1308 = _1274 * _1236;
    float _1310 = _1274 * _1240;
    float _1312 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1304);
    float _1314 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1306);
    float _1316 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1318 = floor(_1282);
    float _1320 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1312);
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1324 = _1274 * _1252;
    float _1326 = -_1316;
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1326);
    float _1330 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1334 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1336 = -_1324;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1328);
    float _1340 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1298);
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1332);
    float _1344 = exp2(_1334);
    float _1346 = fma(_1338, -0.5, 0.5);
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1350 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1342);
    float _1352 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1354 = -_1318;
    float _1356 = _1282 + _1354;
    float _1358 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1350);
    float _1362 = floor(_1284);
    float _1364 = fma(_1338, 0.5, 0.5);
    float _1366 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1368 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1352);
    float _1370 = fma(_1364, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1372 = _1310 + 1.0;
    float _1374 = log2(_1302);
    float _1376 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1378 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1380 = fma(_1364, _1370, -0.212114393711090087890625);
    float _1382 = -_1310;
    float _1384 = fma(_1344, _1372, _1382);
    float _1386 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1376);
    float _1388 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1378);
    float _1390 = fma(_1364, _1380, 1.570728778839111328125);
    float _1392 = 1.0 / _1360;
    float _1394 = -_1362;
    float _1396 = _1284 + _1394;
    float _1398 = sqrt(_1346);
    float _1400 = _1374 * 0.693147182464599609375;
    float2 _4611 = float2(_1356, _1396);
    float _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4611, float2(0.0), isnan(_4611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4611, float2(0.0), isnan(_4611)), level(0.0)).x;
    float _1404 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1406 = _1386 * _1392;
    float _1408 = _1388 * _1392;
    float _1410 = fma(_1406, 0.5, 0.5);
    float _1412 = fma(_1408, -0.5, 0.5);
    float _1414 = _1398 * 0.636619746685028076171875;
    float3 _4639 = float3(_1410, _1412, _1404);
    float _1416 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4639, float3(0.0), isnan(_4639)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4639, float3(0.0), isnan(_4639)), level(0.0)).x;
    float _1418 = -_1390;
    float _1420 = fma(_1414, _1418, 1.0);
    float _1422 = fma(_1384, 0.5, 0.5);
    float3 _4657 = float3(_1410, _1412, _1404);
    float4 _1425 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4657, float3(0.0), isnan(_4657)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4657, float3(0.0), isnan(_4657)), level(0.0)).xyzw;
    float _1427 = _1425.x;
    float _1429 = _1425.y;
    float _1431 = _1425.z;
    float _1433 = _1425.w;
    float2 _4673 = float2(_1420, _1422);
    float3 _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4673, float2(0.0), isnan(_4673)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4673, float2(0.0), isnan(_4673)), level(0.0)).xyz;
    float _1439 = _1437.x;
    float _1441 = _1437.y;
    float _1443 = _1437.z;
    float _1445 = in.m_53.w;
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1449 = in.m_53.y;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1457 = _610 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_61.x = _560;
    out.m_61.y = _564;
    out.m_61.z = _566;
    out.m_61.w = _586;
    float _1463 = 1.0 / _1453;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1467 = _1465 != 0;
    float _1469 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1473 = _1471 != 0;
    float _1475 = in.m_53.z;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1479 = _1477 != 0;
    float _1481 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1485 = _1483 != 0;
    float _1487 = 1.0 / _1461;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1491 = _1489 != 0;
    float _1493 = in.m_59.x;
    float _1495 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1497 = _1445 > 0.5;
    float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1501 = _1499 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1503 = in.m_63.x;
    float _1505 = in.m_63.y;
    float _1507 = in.m_63.z;
    float _1509 = in.m_63.w;
    bool _1511 = _1449 > 0.5;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1513;
    float _1517 = 1.0 / _1501;
    int _1519 = _1511 ? as_type<int>(_656) : as_type<int>(_634);
    float _1521 = in.m_53.x;
    float _1523 = _1497 ? _656 : _634;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1527 = _610 + _1525;
    float _1529 = _1467 ? as_type<float>(_1519) : _634;
    float _1531 = _1515 * _1487;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1535 = _1533 != 0;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1543 = _1541 != 0;
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1547 = _1539 * _1463;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1551 = 0;
    float _1553 = _1517;
    bool _1555 = _1543;
    float _1557 = _1523;
    float _1559 = _1493;
    float _1561 = _1475;
    float _1563 = _1360;
    float _1565 = _1386;
    float _1567 = _1388;
    if (_1485)
    {
        float _1569 = -_1493;
        float _1571 = _1569 + 1.0;
        _1551 = as_type<int>(_1571);
    }
    int _1573 = _1551;
    float _1575 = fma(_1547, _1527, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1579;
    float _1583 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1585 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1587 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1589 = 0.0;
    if (!_1535)
    {
        _1589 = _1449;
    }
    float _1591 = _1589;
    float _1593 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1583);
    float _1595 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1585);
    float _1597 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1587);
    float _1599 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1601 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1593);
    float _1603 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1595);
    float _1605 = _1581 * _1517;
    float _1607 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1597);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1611 = _610 + _1609;
    int _1613 = _1491 ? as_type<int>(_1523) : as_type<int>(_634);
    float _1615 = fma(_1605, _1457, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1617 = _1475 > 0.5;
    float _1619 = fma(_1531, _1611, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_65.x = _1601;
    out.m_65.y = _1603;
    out.m_65.z = _1607;
    bool _1621 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1623 = isnan(_610);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1635 = _1591;
    int _1637 = as_type<int>(_1599);
    int _1639 = _1613;
    float _1641 = _1619;
    if (_1543)
    {
        float _1643 = _1617 ? _656 : _634;
        _890 = _1643;
    }
    float _1645 = _890;
    float _1647 = exp2(_1469);
    if (!_1535)
    {
        _1553 = _1591;
    }
    float _1649 = _1553;
    float _1651 = -_1631;
    float _1653 = _1651 + 1.0;
    float _1655 = _1649;
    if (_1535)
    {
        _1635 = _1449;
    }
    float _1657 = _1635;
    float _1659 = fma(_1599, _1645, -0.5);
    if (_1479)
    {
        float _1661 = -_1493;
        float _1663 = _1661 + 1.0;
        _1637 = as_type<int>(_1663);
    }
    int _1665 = _1637;
    float _1667 = _1521;
    if (_1473)
    {
        bool _1669 = _1521 > 0.5;
        _1555 = _1669;
    }
    bool _1671 = _1555;
    out.m_67.x = _806;
    out.m_67.y = _796;
    out.m_67.z = _818;
    bool _1673 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1675 = isnan(_610);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1681 = _1677 || _1679;
    float _1683 = float(_1681);
    float _1685 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1495);
    bool _1687 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1689 = isnan(_610);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    out.m_69.x = _752;
    float _1699 = -_1683;
    float _1701 = _1699 + 1.0;
    float _1703 = _1683 * _1653;
    bool _1705 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1707 = isnan(_610);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1713 = _1709 || _1711;
    float _1715 = float(_1713);
    float _1717 = -_1647;
    float _1719 = _1717 + 1.0;
    float _1721 = _1697 * _1701;
    float _1723 = -_1697;
    float _1725 = _1723 + 1.0;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_1473)
    {
        _1557 = _1493;
    }
    float _1729 = _1557;
    float _1731 = _1719 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1733 = _1715 * _1725;
    float _1735 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1727);
    float _1737 = fma(as_type<float>(_1613), _1481, -0.5);
    float _1739 = -_1715;
    float _1741 = _1739 + 1.0;
    float _1743 = _1619 * _1733;
    float _1745 = _1729;
    if (_1473)
    {
        float _1747 = -_1493;
        float _1749 = _1747 + 1.0;
        _1639 = as_type<int>(_1749);
    }
    int _1751 = _1639;
    if (!_1479)
    {
        _1641 = _1493;
    }
    float _1753 = _1641;
    out.m_71.w = _688;
    float _1755 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1743);
    float _1757 = _1753;
    if (_1479)
    {
        float _1759 = _1617 ? as_type<float>(_1665) : _1493;
        _1757 = _1759;
    }
    float _1761 = _1757;
    float _1763 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1685);
    float _1765 = in.m_73.x;
    float _1767 = in.m_73.y;
    float _1769 = in.m_73.z;
    if (_1473)
    {
        float _1771 = _1671 ? as_type<float>(_1751) : _1493;
        _1745 = _1771;
    }
    float _1773 = _1745;
    float _1775 = fma(_1575, _1721, _1755);
    if (_1485)
    {
        float _1777 = _1511 ? as_type<float>(_1573) : _1493;
        _1559 = _1777;
    }
    float _1779 = _1559;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1783 = _624 != 0.0;
    bool _1785 = isnan(_624);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan(0.0);
    bool _1791 = _1787 || _1789;
    float _1793 = fma(_1615, _1703, _1775);
    if (_1535)
    {
        _1655 = _1521;
    }
    float _1795 = _1655;
    float _1797 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1799 = _622 == 0.0;
    bool _1801 = !_1791;
    bool _1803 = _1799 && _1801;
    float _1805 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1793);
    float _1807 = _1795;
    if (_1535)
    {
        _892 = _1521;
    }
    float _1809 = _892;
    float _1811 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1813 = _626 == 0.0;
    bool _1815 = _1813 && _1803;
    float _1817 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1549);
    float _1819 = -_1577;
    float _1821 = fma(_1811, 2.0, _1819);
    float _1823 = _1809;
    if (!_1535)
    {
        _1823 = _1475;
    }
    float _1825 = _1823;
    out.m_75.x = _1034;
    out.m_75.y = _1032;
    out.m_75.z = _1036;
    float _1827 = 0.0;
    if (!_1535)
    {
        _1827 = _1475;
    }
    float _1829 = _1827;
    float _1831 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1833 = _1829;
    if (_1535)
    {
        _1561 = _1657;
    }
    float _1835 = _1561;
    float _1837 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1839 = _1837;
    if (_1535)
    {
        _1833 = _1657;
    }
    float _1841 = _1833;
    float _1843 = fma(_1831, _1761, -0.5);
    if (_1535)
    {
        _1807 = _1657;
    }
    float _1845 = _1807;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1849 = -_1633;
    float _1851 = fma(_1837, 2.0, _1849);
    float _1853 = _1835 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1855 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1847);
    float _1857 = _1847;
    float _1859 = _1845;
    if (_1815)
    {
        _1857 = _1767;
    }
    float _1861 = _1857;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1865 = _1861;
    if (_1815)
    {
        _1839 = _1769;
    }
    float _1867 = _1839;
    float _1869 = _1867;
    if (!_1815)
    {
        float _1871 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1767);
        _1865 = _1871;
    }
    float _1873 = _1865;
    if (!_1815)
    {
        float _1875 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1769);
        _1869 = _1875;
    }
    float _1877 = _1869;
    float _1879 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1817);
    float _1881 = -_138;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1821);
    float _1885 = fma(_1853, -2.0, _1863);
    float _1887 = _1507 * _1765;
    if (!_1535)
    {
        _1859 = _1521;
    }
    float _1889 = _1859;
    float _1891 = fma(_1879, _1843, _1883);
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1895 = -_1887;
    float _1897 = fma(_1503, _1769, _1895);
    float _1899 = _1505 * _1769;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1905 = _1503 * _1767;
    float _1907 = fma(_1901, -2.0, _1893);
    float _1909 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1855);
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1913 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1885);
    float _1915 = -_1899;
    float _1917 = fma(_1507, _1767, _1915);
    float _1919 = -_1905;
    float _1921 = fma(_1505, _1765, _1919);
    float _1923 = abs(_978);
    float _1925 = log2(_1923);
    float _1927 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1911);
    if (_1815)
    {
        _1667 = _1765;
    }
    float _1929 = _1667;
    float _1931 = _1929;
    if (!_1815)
    {
        float _1933 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1765);
        _1931 = _1933;
    }
    float _1935 = _1931;
    float _1937 = -_1913;
    float _1939 = fma(_1909, _1737, _1937);
    float _1941 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1943 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1945 = _1897 * _1509;
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1949 = _1917 * _1509;
    float _1951 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1735);
    float _1953 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1907);
    float _1955 = _1921 * _1509;
    float _1957 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1927);
    float _1959 = -_138;
    float _1961 = fma(_1959, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1851);
    float _1963 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1965 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1967 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1941);
    float _1969 = _1943 * _1903;
    float _1971 = -_1953;
    float _1973 = fma(_1951, _1659, _1971);
    float _1975 = exp2(_1963);
    float _1977 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1965);
    float _1979 = _1797 * _1947;
    float _1981 = _1939 + 0.5;
    float _1983 = _1805 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1993 = _1945 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1995 = _1945 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1997 = _1945 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1999 = _1891 + 0.5;
    float _2001 = fma(_1975, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2003 = precise::clamp(_2001, 0.0, 1.0);
    float _2005 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2007 = _1989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2009 = _1991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2011 = fma(_2003, -2.0, 3.0);
    float _2013 = _2003 * _2003;
    float _2015 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1993);
    float _2017 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1995);
    float _2019 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1997);
    float _2021 = _2013 * _2011;
    out.m_77.x = _1979;
    out.m_77.y = _1969;
    out.m_77.z = _1999;
    out.m_77.w = _1981;
    float _2023 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2015);
    float _2025 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2019);
    bool _2027 = _978 <= 8000.0;
    bool _2029 = isnan(_978);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan(8000.0);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    out.m_79.x = _2005;
    out.m_79.y = _2007;
    out.m_79.z = _2009;
    out.m_79.w = _1983;
    float _2039 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2041 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2043 = in.m_81.x;
    float _2045 = fma(_2039, _1779, -0.5);
    bool _2047 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2049 = isnan(_1112);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2055 = _2051 || _2053;
    float _2057 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2041);
    float _2059 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1763);
    float _2061 = fma(_1957, _2045, _1961);
    float _2063 = _1973 + 0.5;
    float _2065 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2017);
    float _2067 = -_2021;
    float _2069 = _2067 + 1.0;
    float _2071 = _2061 + 0.5;
    float _2073 = _1360 * 0.5;
    float _2075 = _2059 + _1360;
    float _2077 = fma(_2069, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2021);
    out.m_83.x = _2023;
    out.m_83.y = _2065;
    out.m_83.z = _2025;
    float _2079 = _2037 * _2077;
    out.m_85.x = _2071;
    out.m_85.y = _2063;
    float _2081 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2055)
    {
        _894 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2083 = _894;
    float _2085 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1386;
    out.gl_Position.y = _1388;
    out.gl_Position.z = _2059;
    out.gl_Position.w = _1360;
    float _2087 = _2083;
    float _2089 = _2083;
    if (!_2055)
    {
        _896 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2091 = _896;
    float _2093 = fma(_1388, -0.5, _2073);
    float _2095 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2057);
    float _2097 = _1386 + _1360;
    float _2099 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1967);
    float _2101 = _2075 * 0.5;
    float _2103 = _2097 * 0.5;
    float _2105 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1977);
    float _2107 = _2091;
    float _2109 = _2091;
    if (!_2055)
    {
        _1563 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2111 = _1563;
    out.m_87.x = _2103;
    out.m_87.y = _2093;
    out.m_87.z = _2101;
    out.m_87.w = _1360;
    float _2113 = _2111;
    float _2115 = _2111;
    if (!_2055)
    {
        _1565 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2117 = _1565;
    float _2119 = _2117;
    float _2121 = _2117;
    if (!_2055)
    {
        _1567 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2123 = _1567;
    out.m_89.x = _2105;
    out.m_89.y = _2099;
    out.m_89.z = _2095;
    float _2125 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2127 = -_1402;
    float _2129 = _2127 + 1.0;
    float _2131 = _2129 * _2085;
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = -_2133;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2139 = _2123;
    float _2141 = _2123;
    if (!_2055)
    {
        _2081 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2143 = _2081;
    float _2145 = _2137 * _2043;
    float _2147 = _1731 * _1416;
    float _2149 = -_1731;
    float _2151 = _2149 + 1.0;
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2155 = _1433 * _2147;
    out.m_91.x = _2153;
    float _2157 = _1443 * _2147;
    float _2159 = fma(_1439, _2155, _1427);
    float _2161 = fma(_1441, _2155, _1429);
    float _2163 = _1433 * _2151;
    float _2165 = fma(_1433, _2157, _1431);
    out.m_93.x = _2159;
    out.m_93.y = _2161;
    out.m_93.z = _2165;
    out.m_93.w = _2163;
    bool _2167 = !_2055;
    float _2169 = _2143;
    float _2171 = _2143;
    if (!_2167)
    {
        bool _2173 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2175 = isnan(_1112);
        bool _2177 = _2173 || _2175;
        bool _2179 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2181 = _2177 || _2179;
        if (!_2181)
        {
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2185 = _1112 + _2183;
            float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2189 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2187;
            float _2191 = 1.0 / _2189;
            float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2203 = _2201 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2213 = _2185 * _2191;
            float _2215 = precise::clamp(_2213, 0.0, 1.0);
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2221 = fma(_2215, _2195, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2223 = fma(_2215, _2219, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2225 = fma(_2215, _2199, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2227 = fma(_2215, _2203, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2229 = fma(_2215, _2207, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2231 = fma(_2215, _2211, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2121 = _2223;
            _2171 = _2229;
            _2115 = _2221;
            _2089 = _2227;
            _2141 = _2225;
            _2109 = _2231;
            _2233 = true;
        }
        else
        {
            bool _2235 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2237 = isnan(_1112);
            bool _2239 = _2235 || _2237;
            bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2243 = _2239 || _2241;
            if (!_2243)
            {
                _2113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2245 = _2113;
            _2115 = _2245;
            if (!_2243)
            {
                _2119 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2247 = _2119;
            _2121 = _2247;
            if (!_2243)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2249 = _2139;
            _2141 = _2249;
            if (!_2243)
            {
                _2087 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2251 = _2087;
            _2089 = _2251;
            if (!_2243)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2253 = _2169;
            _2171 = _2253;
            if (!_2243)
            {
                _2107 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2255 = _2107;
            bool _2257 = !_2243;
            _2109 = _2255;
            if (!_2257)
            {
                bool _2259 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2261 = isnan(_1112);
                bool _2263 = _2259 || _2261;
                bool _2265 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2267 = _2263 || _2265;
                if (!_2267)
                {
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2271 = _1112 + _2269;
                    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2275 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2273;
                    float _2277 = 1.0 / _2275;
                    float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2299 = _2271 * _2277;
                    float _2301 = precise::clamp(_2299, 0.0, 1.0);
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2307 = fma(_2301, _2281, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2309 = fma(_2301, _2305, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2311 = fma(_2301, _2285, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2313 = fma(_2301, _2289, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2315 = fma(_2301, _2293, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2317 = fma(_2301, _2297, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2121 = _2309;
                    _2171 = _2315;
                    _2115 = _2307;
                    _2089 = _2313;
                    _2141 = _2311;
                    _2109 = _2317;
                    _2233 = true;
                }
                else
                {
                    _2121 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2089 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2109 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2233 = false;
    float _2319 = _2121;
    float _2321 = _2171;
    float _2323 = _2115;
    float _2325 = _2089;
    float _2327 = _2141;
    float _2329 = _2109;
    float _2331 = fma(_2099, -0.5, 0.5);
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    float _2335 = -_2319;
    float _2337 = _2335 + _2321;
    float _2339 = _2125 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2341 = -_2323;
    float _2343 = _2341 + _2325;
    float _2345 = fma(_2333, _2337, _2319);
    out.m_95.x = 0.0;
    float _2347 = -_2327;
    float _2349 = _2347 + _2329;
    float _2351 = fma(_2333, _2343, _2323);
    float _2353 = _2345 * 0.586610972881317138671875;
    out.m_49.x = _2339;
    bool _2355 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2357 = fma(_2333, _2349, _2327);
    float _2359 = fma(_2351, 0.298911988735198974609375, _2353);
    bool _2361 = _1090 > 0.0;
    bool _2363 = isnan(_1090);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan(0.0);
    bool _2369 = _2365 || _2367;
    float _2371 = fma(_2357, 0.114477999508380889892578125, _2359);
    float _2373 = -_2371;
    float _2375 = _2351 + _2373;
    float _2377 = -_2371;
    float _2379 = _2345 + _2377;
    float _2381 = -_2371;
    float _2383 = _2357 + _2381;
    float _2385 = fma(_2375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2387 = fma(_2379, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2389 = fma(_2383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    bool _2391 = !_2355;
    if (!_2391)
    {
        float _2393 = -_1032;
        float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2397 = -_1034;
        float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2401 = -_1036;
        float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2405 = _2395 * _2395;
        float _2407 = fma(_2399, _2399, _2405);
        float _2409 = fma(_2403, _2403, _2407);
        float _2411 = sqrt(_2409);
        float _2413 = rsqrt(_2409);
        float _2415 = -_2411;
        float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2419 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2421 = precise::clamp(_2419, 0.0, 1.0);
        float _2423 = _2399 * _2413;
        float _2425 = _2395 * _2413;
        float _2427 = abs(_2421);
        float _2429 = log2(_2427);
        float _2431 = _2403 * _2413;
        float _2433 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2435 = _2099 * _2425;
        float _2437 = -_2425;
        float _2439 = -_2433;
        float _2441 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2439);
        float _2443 = fma(_2105, _2423, _2435);
        float _2445 = -_2431;
        float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2441);
        float _2449 = fma(_2095, _2431, _2443);
        float _2451 = precise::clamp(_2449, 0.0, 1.0);
        float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2455 = _2447 + _2453;
        float _2457 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2459 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2461 = precise::clamp(_2459, 0.0, 1.0);
        float _2463 = exp2(_2457);
        float _2465 = _2463 * _2461;
        float _2467 = _2451 * _2465;
        float _2469 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2473 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2469;
        out.m_95.y = _2471;
        out.m_95.z = _2473;
    }
    out.m_71.x = _2385;
    out.m_71.y = _2387;
    out.m_71.z = _2389;
    if (_2369)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2475 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2475;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

