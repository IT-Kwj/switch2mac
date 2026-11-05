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
    float4 m_59 [[user(locn0)]];
    float4 m_91 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_101 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_73 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_99 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_87 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_85 [[attribute(12)]];
    float4 m_81 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3066 = false;
    bool _322 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = in.m_48.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    float _138 = _128;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _134;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _142 = 0;
    if (!_132)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3383 = as_type<float>(_146);
        out.gl_Position.z = _3383;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _150 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_119);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = float(_124);
    bool _162 = _128 >= _160;
    bool _164 = !_158;
    bool _166 = _162 || _164;
    if (_166)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _136;
    if (_166)
    {
        out.m_53.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _148 = as_type<int>(_170);
    }
    int _172 = _148;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3438 = as_type<float>(_172);
        out.gl_Position.z = _3438;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = 1.0 / _160;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _128 * _174;
    bool _180 = !_176;
    float _182 = _178;
    float _200;
    if (!_180)
    {
        float _184 = in.m_55.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _178;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = 1.0 / _224;
    bool _228 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_204);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_220;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _248;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _254 = _238 * _242;
    float _256 = -_238;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = _208 * _226;
    float _266 = in.m_57.x;
    float _268 = in.m_57.y;
    float _270 = in.m_57.z;
    float _272 = fma(_246, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _274 = fma(_262, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _276 = fma(_250, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _278 = _272 * _254;
    float _280 = _274 * _254;
    float _282 = _276 * _254;
    float _284 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[143].x, _278);
    float _286 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[143].y, _280);
    float _288 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[143].z, _282);
    float _290 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _284);
    float _292 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _286);
    float _294 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].z, _288);
    float _296 = _290 * _266;
    float _298 = _292 * _268;
    float _300 = _294 * _270;
    bool _302 = !_252;
    float _320;
    if (!_302)
    {
        float _304 = in.m_55.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _178;
    }
    _322 = false;
    float _324 = _320;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _328 = _324 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _334 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _336 = isnan(_324);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _350 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _352 = isnan(_324);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _362;
    bool _366 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _368 = isnan(_324);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = 1.0 / _332;
    float _380 = -_344;
    float _382 = _380 + 1.0;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _386 = _360 * _382;
    float _388 = -_360;
    float _390 = _388 + 1.0;
    float _392 = 1.0 / _348;
    float _394 = _364 * _378;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _400 = fma(_394, _328, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _402 = -_376;
    float _404 = _402 + 1.0;
    float _406 = _400 * _386;
    float _408 = _398 * _392;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _412 = _324 + _410;
    float _414 = _344 * _404;
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[115].x, _406);
    float _418 = fma(_408, _412, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _420 = fma(_418, _414, _416);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _428 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[117].x, _420);
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _430;
    out.m_59.y = _432;
    out.m_59.z = _434;
    out.m_59.w = _436;
    bool _438 = !_384;
    if (!_438)
    {
        float _440 = in.m_55.x;
        float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _444 = _440 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _448 = _446 * _442;
        float _450 = floor(_448);
        float _452 = -_450;
        float _454 = _448 + _452;
        _182 = _454;
    }
    float _456 = _182;
    float _458 = in.m_46.x;
    float _460 = in.m_46.y;
    float _462 = in.m_46.z;
    float _464 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _466 = in.m_61.x;
    float _468 = in.m_61.y;
    float _470 = in.m_61.z;
    float _472 = in.m_61.w;
    float _474 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _476 = in.m_63.x;
    float _478 = in.m_63.y;
    float _480 = in.m_63.z;
    float _482 = in.m_63.w;
    float _484 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _486 = in.m_65.x;
    float _488 = in.m_65.y;
    float _490 = in.m_65.z;
    float _492 = in.m_65.w;
    float _494 = in.m_67.y;
    float _496 = in.m_55.x;
    float _498 = in.m_55.y;
    float _500 = in.m_55.z;
    float _502 = _460 * _468;
    float _504 = _460 * _478;
    float _506 = fma(_458, _466, _502);
    float _508 = _460 * _488;
    float _510 = fma(_458, _476, _504);
    float _512 = fma(_462, _470, _506);
    float _514 = _460 + _494;
    float _516 = fma(_458, _486, _508);
    float _518 = fma(_462, _480, _510);
    float _520 = _512 + _472;
    float _522 = -_514;
    float _524 = _522 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _528 = _518 + _482;
    float _530 = -_520;
    float _532 = _530 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _534 = _524 * _524;
    float _536 = -_528;
    float _538 = _536 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _540 = fma(_532, _532, _534);
    float _542 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _544 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _546 = fma(_538, _538, _540);
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _550 = -_542;
    float _552 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _550);
    float _554 = -_544;
    float _556 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _554);
    float _558 = rsqrt(_546);
    float _560 = -_548;
    float _562 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _560);
    float _564 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _566 = _498 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _568 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _570 = -_564;
    float _572 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _570);
    float _574 = fma(_566, -2.0, _526);
    float _576 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _578 = log2(_576);
    float _580 = _496 * 2.0;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _584 = fma(_462, _490, _516);
    float _586 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _588 = -_582;
    float _590 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[77].x, _588);
    float _592 = _498 + _496;
    float _594 = _532 * _558;
    float _596 = floor(_580);
    float _598 = _538 * _558;
    float _600 = -_586;
    float _602 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _600);
    float _604 = _594 * _594;
    float _606 = -_568;
    float _608 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _606);
    float _610 = _498 * 2.0;
    float _612 = _592 + (-1.0);
    float _614 = fma(_598, _598, _604);
    float _616 = _578 * _128;
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _620 = int(_618);
    float _622 = _562 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _624 = _498 + _500;
    float _626 = _584 + _492;
    float _628 = -_622;
    float _630 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[1].x, _628);
    float _632 = _624 + (-1.0);
    bool _634 = _596 > 0.0;
    float _636 = rsqrt(_614);
    bool _638 = _596 >= 0.0;
    bool _640 = isnan(_596);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _650 = _556 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _652 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[1].w, _630);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _664 = _662 != 0;
    float _666 = -_650;
    float _668 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[1].y, _666);
    float _670 = floor(_610);
    float _672 = float(_620);
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _676 = _626 + _674;
    float _678 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[1].w, _668);
    bool _680 = !_660;
    int _682 = _680 ? 0 : 1;
    bool _684 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _692 = _688 || _690;
    float _694 = exp2(_616);
    float _696 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _698 = _652 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _700 = _598 * _636;
    float _702 = -_698;
    float _704 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[0].x, _702);
    float _706 = _524 * _558;
    bool _708 = _670 > 0.0;
    float _710 = 1.0 / _672;
    bool _712 = _670 >= 0.0;
    bool _714 = isnan(_670);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.0);
    bool _720 = _716 || _718;
    float _722 = _594 * _636;
    float _724 = -_700;
    float _726 = _598 * _724;
    float _728 = -_700;
    float _730 = _706 * _728;
    bool _732 = !_656;
    int _734 = _732 ? 0 : 1;
    float _736 = -_694;
    float _738 = _736 + 1.0;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = -_726;
    float _746 = fma(_594, _722, _744);
    bool _748 = !_664;
    int _750 = _748 ? 0 : 1;
    float _752 = _692 ? _738 : 0.0;
    float _754 = _706 * _722;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _758 = 1.0 + _756;
    float _760 = _746 * _746;
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = _710 * _128;
    float _774 = 1.0 / _758;
    float _776 = fma(_754, _754, _760);
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _782 = _500 * 2.0;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _786 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[79].z, _778);
    float _788 = _562 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = float(_742);
    float _792 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[78].z, _780);
    float _794 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[78].w, _784);
    float _796 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _574);
    float _798 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _786);
    float _800 = -_788;
    float _802 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[1].x, _800);
    float _804 = _602 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _806 = floor(_782);
    float _808 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _792);
    float _810 = _790 * _128;
    float _812 = -_128;
    float _814 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    float _816 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _794);
    float _818 = _528;
    if (_770)
    {
        float _820 = _752 * _774;
        _138 = _820;
    }
    float _822 = _138;
    float _824 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[1].w, _802);
    float _826 = -_804;
    float _828 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[1].x, _826);
    float _830 = fma(_730, _730, _776);
    float _832 = _556 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _704);
    float _836 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[1].z, _828);
    float _838 = rsqrt(_830);
    float _840 = _562 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _842 = -_832;
    float _844 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[0].y, _842);
    float _846 = -_836;
    float _848 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[0].w, _834);
    bool _850 = _806 >= 0.0;
    bool _852 = isnan(_806);
    bool _854 = _850 || _852;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    float _860 = -_840;
    float _862 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[0].x, _860);
    float _864 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[0].w, _844);
    int _866 = _646 ? 0 : 1;
    float _868 = _562 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _870 = 1.0 / _848;
    int _872 = _858 ? 0 : 1;
    float _874 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[0].w, _862);
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _886 = _884 != 0;
    float _888 = -_868;
    float _890 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[0].x, _888);
    bool _892 = _806 > 0.0;
    float _894 = _676 * _676;
    float _896 = _746 * _838;
    float _898 = precise::clamp(_896, 0.0, 1.0);
    int _900 = ~_866;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    float _906 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[0].w, _890);
    int _908 = ~_872;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = -_898;
    float _916 = _914 + 1.0;
    int _918 = _904;
    int _920 = _912;
    if (!_634)
    {
        int _922 = ~_866;
        int _924 = _922 + 1;
        _918 = _924;
    }
    int _926 = _918;
    int _928 = _720 ? 0 : 1;
    float _930 = fma(_874, _870, -1.0);
    float _932 = _916 * _870;
    if (!_892)
    {
        int _934 = ~_872;
        int _936 = _934 + 1;
        _920 = _936;
    }
    int _938 = _920;
    bool _940 = !_878;
    int _942 = _940 ? 0 : 1;
    float _944 = fma(_916, _930, 1.0);
    float _946 = _906 * _932;
    float _948 = _864 * _932;
    int _950 = abs(_942);
    float _952 = _944 * _944;
    float _954 = in.m_69.x;
    float _956 = in.m_69.y;
    float _958 = in.m_69.z;
    float _960 = float(_938);
    float _962 = fma(_948, _948, _952);
    float _964 = float(_950);
    int _966 = ~_928;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = fma(_946, _946, _962);
    int _974 = _970;
    if (!_708)
    {
        int _976 = ~_928;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = _964 * _960;
    bool _984 = !_882;
    int _986 = _984 ? 0 : 1;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _990 = _520 + _988;
    float _992 = float(_926);
    float _994 = rsqrt(_972);
    float _996 = _982 * (-2.0);
    float _998 = _496 + (-0.5);
    int _1000 = abs(_986);
    float _1002 = fma(_990, _990, _894);
    float _1004 = float(_1000);
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1008 = _528 + _1006;
    float _1010 = fma(_996, _954, _954);
    float _1012 = fma(_648, _996, _648);
    float _1014 = _1004 * _992;
    float _1016 = fma(_1008, _1008, _1002);
    float _1018 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1010);
    float _1020 = _946 * _994;
    float _1022 = _944 * _994;
    float _1024 = _948 * _994;
    float _1026 = fma(_1012, _822, _1018);
    float _1028 = -_1020;
    float _1030 = _594 * _1028;
    float _1032 = _598 * _1022;
    float _1034 = -_1024;
    float _1036 = _706 * _1034;
    float _1038 = sqrt(_1016);
    float _1040 = -_1024;
    float _1042 = -_1030;
    float _1044 = fma(_598, _1040, _1042);
    float _1046 = -_1020;
    float _1048 = -_1032;
    float _1050 = fma(_706, _1046, _1048);
    float _1052 = -_1036;
    float _1054 = fma(_594, _1022, _1052);
    bool _1056 = !_886;
    int _1058 = _1056 ? 0 : 1;
    float _1060 = _1044 * _1044;
    float _1062 = _1014 * (-2.0);
    float _1064 = _464 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1066 = abs(_1058);
    float _1068 = fma(_1050, _1050, _1060);
    float _1070 = fma(_696, _1062, _696);
    float _1072 = fma(_1062, _956, _956);
    float _1074 = fma(_1054, _1054, _1068);
    float _1076 = _498 + (-0.5);
    float _1078 = float(_980);
    float _1080 = rsqrt(_1016);
    float _1082 = float(_1066);
    float _1084 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1072);
    float _1086 = _500 + _496;
    float _1088 = _1038 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1090 = _500 + (-0.5);
    float _1092 = _1082 * _1078;
    float _1094 = rsqrt(_1074);
    float _1096 = _1086 + (-1.0);
    float _1098 = _1092 * (-2.0);
    float _1100 = _1026 * 0.15915493667125701904296875;
    float _1102 = precise::min(_1064, _1088);
    float _1104 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1106 = fma(_1098, _958, _958);
    float _1108 = fma(_1070, _822, _1084);
    float _1110 = _1100 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = fma(_1104, _1098, _1104);
    float _1116 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1106);
    float _1118 = _1108 * 0.15915493667125701904296875;
    float _1120 = fma(_1114, _822, _1116);
    float _1122 = _1050 * _1094;
    float _1124 = _1054 * _1094;
    float _1126 = _1044 * _1094;
    float _1128 = _1100 * 6.283185482025146484375;
    float _1130 = cos(_1128);
    float _1132 = _598 * _1122;
    float _1134 = _1120 * 0.15915493667125701904296875;
    float _1136 = _594 * _1126;
    float _1138 = -_1132;
    float _1140 = fma(_594, _1124, _1138);
    float _1142 = _706 * _1124;
    float _1144 = -_1136;
    float _1146 = fma(_706, _1122, _1144);
    float _1148 = _1118 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1080 * _1102;
    float _1154 = -_1142;
    float _1156 = fma(_598, _1126, _1154);
    float _1158 = _1140 * _1140;
    float _1160 = _676 * _1152;
    float _1162 = _990 * _1152;
    float _1164 = fma(_1156, _1156, _1158);
    float _1166 = _1118 * 6.283185482025146484375;
    float _1168 = cos(_1166);
    float _1170 = -_1160;
    float _1172 = _676 + _1170;
    float _1174 = -_1162;
    float _1176 = _990 + _1174;
    float _1178 = fma(_1146, _1146, _1164);
    float _1180 = _1172 * _1172;
    float _1182 = _1008 * _1152;
    float _1184 = _1134 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = fma(_1176, _1176, _1180);
    float _1190 = -_1182;
    float _1192 = _1008 + _1190;
    float _1194 = _1112 * _1150;
    float _1196 = _1130 * _1150;
    float _1198 = fma(_1192, _1192, _1188);
    float _1200 = rsqrt(_1178);
    float _1202 = in.m_71.x;
    float _1204 = in.m_71.y;
    float _1206 = in.m_71.z;
    float _1208 = _1112 * _1168;
    float _1210 = sqrt(_1198);
    float _1212 = _1112 * _1186;
    float _1214 = _1150 * _1186;
    float _1216 = _1146 * _1200;
    float _1218 = _1140 * _1200;
    float _1220 = _1156 * _1200;
    float _1222 = _1134 * 6.283185482025146484375;
    float _1224 = sin(_1222);
    float _1226 = _594 * _1216;
    float _1228 = _1080 * _1210;
    float _1230 = _598 * _1218;
    float _1232 = -_1226;
    float _1234 = fma(_598, _1220, _1232);
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1204);
    float _1238 = _1130 * _1168;
    float _1240 = _1168 * _1186;
    float _1242 = _1130 * _1186;
    float _1244 = -_1230;
    float _1246 = fma(_706, _1216, _1244);
    float _1248 = _706 * _1220;
    float _1250 = _1234 * _1234;
    float _1252 = _474 * _1228;
    float _1254 = -_1196;
    float _1256 = fma(_1224, _1208, _1254);
    float _1258 = -_1248;
    float _1260 = fma(_594, _1218, _1258);
    float _1262 = fma(_1246, _1246, _1250);
    float _1264 = -_1208;
    float _1266 = fma(_1224, _1196, _1264);
    float _1268 = _1252 * _1236;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1202);
    float _1272 = fma(_1260, _1260, _1262);
    float _1274 = _464 * _1228;
    float _1276 = fma(_1224, _1238, _1194);
    float _1278 = fma(_1224, _1194, _1238);
    float _1280 = rsqrt(_1272);
    float _1282 = _484 * _1228;
    float _1284 = _1274 * _1270;
    float _1286 = _1242 * _1268;
    float _1288 = -_1268;
    float _1290 = _1224 * _1288;
    float _1292 = _1212 * _1268;
    float _1294 = _1282 * _1206;
    float _1296 = fma(_1276, _1284, _1286);
    float _1298 = fma(_1240, _1284, _1290);
    float _1300 = fma(_1256, _1284, _1292);
    float _1302 = -_1162;
    float _1304 = _520 + _1302;
    float _1306 = fma(_1266, _1294, _1296);
    float _1308 = fma(_1214, _1294, _1298);
    float _1310 = -_1160;
    float _1312 = _1310 + _514;
    float _1314 = fma(_1278, _1294, _1300);
    float _1316 = _1216 * _1306;
    float _1318 = _1260 * _1280;
    float _1320 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1322 = _1220 * _1306;
    float _1324 = _1246 * _1280;
    float _1326 = fma(_1318, _1308, _1316);
    float _1328 = -_1182;
    float _1330 = _528 + _1328;
    float _1332 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1320);
    float _1334 = fma(_1324, _1308, _1322);
    float _1336 = fma(_598, _1314, _1326);
    float _1338 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1340 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1332);
    float _1342 = fma(_594, _1314, _1334);
    float _1344 = _528 + _1336;
    float _1346 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1338);
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1350 = _520 + _1342;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1354 = _1344 + _1352;
    float _1356 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1346);
    float _1358 = 1.0 / _1348;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1362 = _1350 + _1360;
    float _1364 = _1354 * _1354;
    float _1366 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1368 = _1234 * _1280;
    float _1370 = _1218 * _1306;
    float _1372 = fma(_1362, _1362, _1364);
    float _1374 = _1366 + _1348;
    float _1376 = fma(_1368, _1308, _1370);
    float _1378 = sqrt(_1372);
    float _1380 = fma(_706, _1314, _1376);
    bool _1382 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(0.5);
    bool _1390 = _1386 || _1388;
    float _1392 = _1374 * _1358;
    float _1394 = _1392 * 0.5;
    float _1396 = _514 + _1380;
    bool _1398 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.5);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1410 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1408);
    float _1412 = 1.0 / _1410;
    bool _1414 = _1378 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1418 = _1314;
    float _1420 = _1344;
    float _1422 = _1372;
    float _1424 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1426 = _1378;
    float _1428 = _1348;
    if (!_1414)
    {
        _1416 = _1350;
    }
    float _1430 = _1416;
    float _1432 = _1430;
    if (!_1414)
    {
        _1418 = _1396;
    }
    float _1434 = _1418;
    bool _1436 = !_1414;
    float _1438 = _1434;
    if (!_1436)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1378 + _1442;
        float _1446 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = rsqrt(_1372);
        float _1450 = _1444 * _1440;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 + (-1.0);
        float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = fma(_1460, _1446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = fma(_1396, _1456, _1464);
        float _1470 = _1448 * _1466;
        float _1472 = fma(_1362, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1354, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1438 = _1468;
        _1432 = _1472;
        _1420 = _1474;
        _1422 = _1448;
        _1424 = _1470;
        _1426 = _1452;
    }
    float _1476 = _1438;
    float _1478 = _1432;
    float _1480 = _1420;
    float _1482 = _1422;
    float _1484 = _1424;
    float _1486 = _1426;
    float _1488 = -_1160;
    float _1490 = _1488 + _1476;
    float _1492 = -_1162;
    float _1494 = _1492 + _1478;
    float _1496 = -_1182;
    float _1498 = _1496 + _1480;
    float _1500 = _1486;
    float _1502 = _1490;
    float _1504 = _1494;
    float _1506 = _1498;
    float _1508 = _1482;
    float _1510 = _1484;
    float _1512 = _1476;
    if (_1390)
    {
        _1500 = 1.0;
    }
    float _1514 = _1500;
    float _1516 = _1514;
    if (!_1406)
    {
        float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1520 = _1312 + _1518;
        float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1524 = _1304 + _1522;
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1528 = -_528;
        float _1530 = _1528 + _1480;
        float _1532 = _1520 * _1520;
        float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1536 = _1330 + _1534;
        float _1538 = fma(_1524, _1524, _1532);
        float _1540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1542 = fma(_1536, _1536, _1538);
        float _1544 = sqrt(_1542);
        float _1546 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1548 = precise::min(_1544, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1550 = _1548 * _1540;
        float _1552 = -_520;
        float _1554 = _1552 + _1478;
        float _1556 = -_514;
        float _1558 = _1556 + _1476;
        float _1560 = _1546 * _1550;
        float _1562 = fma(_1554, _1560, _1304);
        float _1564 = fma(_1558, _1560, _1312);
        float _1566 = fma(_1530, _1560, _1330);
        _1502 = _1564;
        _1504 = _1562;
        _1506 = _1566;
        _1508 = _1540;
        _818 = _1530;
    }
    float _1568 = _1502;
    float _1570 = _1504;
    float _1572 = _1506;
    float _1574 = _1508;
    float _1576 = _818;
    float _1578 = _1574;
    float _1580 = _1576;
    if (_1390)
    {
        _1428 = 1.0;
    }
    float _1582 = _1428;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1586 = _1412 * _1584;
    float _1588 = _1582;
    if (!_1390)
    {
        float _1590 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1592;
        float _1596 = _1590 * 0.15915493667125701904296875;
        float _1598 = _1596 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = _1596 * 6.283185482025146484375;
        float _1608 = sin(_1606);
        float _1610 = 1.0 / _1600;
        float _1612 = _1604 * 6.283185482025146484375;
        float _1614 = cos(_1612);
        float _1616 = _1608 * _1610;
        float _1618 = _1604 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        float _1622 = _1614 * _1616;
        float _1624 = 1.0 / _1594;
        float _1626 = 1.0 / _1622;
        float _1628 = _1620 * _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1632 = fma(_1586, _1628, _1630);
        float _1634 = _1632 * _1624;
        float _1636 = precise::clamp(_1634, 0.0, 1.0);
        _1578 = _1596;
        _1580 = _1594;
        _1516 = _1636;
    }
    float _1638 = _1578;
    float _1640 = _1580;
    float _1642 = _1516;
    float _1644 = _1638;
    float _1646 = _1640;
    if (!_1390)
    {
        float _1648 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1650 = _1648 * 0.15915493667125701904296875;
        float _1652 = _1650 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1658 = _1656 * 0.15915493667125701904296875;
        float _1660 = _1650 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        float _1664 = 1.0 / _1654;
        float _1666 = _1658 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        float _1670 = _1662 * _1664;
        float _1672 = _1658 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        float _1676 = _1668 * _1670;
        float _1678 = 1.0 / _1676;
        float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1682 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1680;
        float _1684 = 1.0 / _1682;
        float _1686 = _1674 * _1678;
        float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1690 = fma(_1586, _1686, _1688);
        float _1692 = _1690 * _1684;
        float _1694 = precise::clamp(_1692, 0.0, 1.0);
        float _1696 = -_1694;
        float _1698 = _1696 + 1.0;
        _1644 = _1676;
        _1646 = _1686;
        _1588 = _1698;
    }
    float _1700 = _1644;
    float _1702 = _1646;
    float _1704 = _1588;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1708 = _1568 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1570 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1572 + _1714;
    float _1718 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = _1708 * _1708;
    float _1722 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1726 = fma(_1712, _1712, _1720);
    float _1728 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1730 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1724);
    float _1732 = fma(_1716, _1716, _1726);
    float _1734 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1728);
    float _1736 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1738 = rsqrt(_1732);
    float _1740 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1742 = sqrt(_1732);
    float _1744 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1746 = _1712 * _1744;
    float _1748 = _1716 * _1744;
    float _1750 = _1746 * _1746;
    float _1752 = _1748 * _1748;
    float _1754 = _1750 + _1752;
    float _1756 = sqrt(_1754);
    bool _1758 = _1756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = _1756 + _1760;
    float _1764 = _1700;
    float _1766 = _1754;
    float _1768 = _1762;
    float _1770 = _1708;
    float _1772 = _1746;
    float _1774 = _1748;
    float _1776 = _1750;
    if (_1758)
    {
        float _1778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1778;
    }
    float _1780 = _1764;
    if (_1758)
    {
        float _1782 = rsqrt(_1754);
        _1766 = _1782;
    }
    float _1784 = _1766;
    if (_1758)
    {
        float _1786 = _1762 * _1780;
        _1768 = _1786;
    }
    float _1788 = _1768;
    if (_1758)
    {
        float _1790 = _1788 * 0.15915493667125701904296875;
        _1510 = _1790;
    }
    float _1792 = _1510;
    float _1794 = _1702;
    float _1796 = _1792;
    if (_1758)
    {
        float _1798 = _1792 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        _1794 = _1800;
    }
    float _1802 = _1794;
    float _1804 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1806 = precise::max(0.0, _1804);
    float _1808 = _1780;
    if (_1758)
    {
        float _1810 = _1792 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = -_1744;
    float _1818 = -_1806;
    float _1820 = fma(_1708, _1816, _1818);
    if (_1758)
    {
        float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _1822;
    }
    float _1824 = _1770;
    float _1826 = fma(_1304, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1828 = _1802;
    if (_1758)
    {
        float _1830 = fma(_1802, _1824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1828 = _1830;
    }
    float _1832 = _1828;
    float _1834 = floor(_1826);
    float _1836 = _1832;
    float _1838 = _1814;
    if (_1758)
    {
        float _1840 = _1814 + (-1.0);
        _1512 = _1840;
    }
    float _1842 = _1512;
    float _1844 = _1842;
    if (_1758)
    {
        float _1846 = _1784 * _1832;
        _1796 = _1846;
    }
    float _1848 = _1796;
    if (!_1758)
    {
        _1836 = _1820;
    }
    float _1850 = _1836;
    float _1852 = _1850;
    if (_1758)
    {
        float _1854 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1844 = _1854;
    }
    float _1856 = _1844;
    if (_1758)
    {
        float _1858 = _1746 * _1848;
        _1772 = _1858;
    }
    float _1860 = _1772;
    if (_1758)
    {
        float _1862 = _1748 * _1848;
        _1774 = _1862;
    }
    float _1864 = _1774;
    if (_1758)
    {
        float _1866 = fma(_1820, _1814, _1856);
        _1852 = _1866;
    }
    float _1868 = _1852;
    if (_1758)
    {
        float _1870 = _1860 * _1860;
        _1776 = _1870;
    }
    float _1872 = _1776;
    if (!_1758)
    {
        _1838 = _1752;
    }
    float _1874 = _1838;
    float _1876 = _1874;
    if (_1758)
    {
        float _1878 = _1864 * _1864;
        _1876 = _1878;
    }
    float _1880 = _1876;
    float _1882 = fma(_1868, _1868, _1872);
    float _1884 = -_1834;
    float _1886 = _1826 + _1884;
    float _1888 = _1882 + _1880;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1892 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1894 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1896 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1900 = fma(_1742, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1898);
    float _1902 = precise::clamp(_1900, 0.0, 1.0);
    float _1904 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1892);
    float _1906 = rsqrt(_1888);
    float _1908 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1896);
    float _1910 = -_1902;
    float _1912 = _1910 + 1.0;
    float _1914 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1904);
    float _1916 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1918 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1920 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = abs(_1912);
    float _1926 = log2(_1924);
    float _1928 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1930 = -_1920;
    float _1932 = fma(_1930, _1890, 1.0);
    float _1934 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1936 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1928);
    float _1938 = _1906 * _1860;
    float _1940 = _1906 * _1864;
    float _1942 = floor(_1894);
    float _1944 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1936);
    float _1946 = _1906 * _1868;
    float _1948 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1934);
    float _1950 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1944);
    float _1952 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1954 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1948);
    float _1956 = log2(_1932);
    float _1958 = -_1952;
    float _1960 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1958);
    float _1962 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1964 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1954);
    float _1966 = -_1940;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1960);
    float _1970 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1972 = 1.0 / _1950;
    float _1974 = -_1942;
    float _1976 = _1894 + _1974;
    float _1978 = fma(_1968, -0.5, 0.5);
    float _1980 = fma(_1968, 0.5, 0.5);
    float _1982 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1970);
    float _1984 = _1946 + 1.0;
    float _1986 = fma(_1980, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1988 = exp2(_1962);
    float _1990 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1982);
    float _1992 = _1956 * 0.693147182464599609375;
    float _1994 = fma(_1980, _1986, -0.212114393711090087890625);
    float _1996 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1990);
    float _1998 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1980, _1994, 1.570728778839111328125);
    float _2002 = sqrt(_1978);
    float _2004 = -_1946;
    float _2006 = fma(_1988, _1984, _2004);
    float _2008 = _1964 * _1972;
    float _2010 = _1996 * _1972;
    float _2012 = fma(_2006, 0.5, 0.5);
    float _2014 = fma(_2010, -0.5, 0.5);
    float _2016 = _2002 * 0.636619746685028076171875;
    float _2018 = fma(_2008, 0.5, 0.5);
    float _2020 = -_2000;
    float _2022 = fma(_2016, _2020, 1.0);
    float2 _6295 = float2(_1886, _1976);
    float _2024 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6295, float2(0.0), isnan(_6295)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6295, float2(0.0), isnan(_6295)), level(0.0)).x;
    float3 _6306 = float3(_2018, _2014, _1998);
    float _2026 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6306, float3(0.0), isnan(_6306)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6306, float3(0.0), isnan(_6306)), level(0.0)).x;
    float3 _6317 = float3(_2018, _2014, _1998);
    float4 _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6317, float3(0.0), isnan(_6317)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6317, float3(0.0), isnan(_6317)), level(0.0)).xyzw;
    float _2031 = _2029.x;
    float _2033 = _2029.y;
    float _2035 = _2029.z;
    float _2037 = _2029.w;
    float2 _6333 = float2(_2022, _2012);
    float3 _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6333, float2(0.0), isnan(_6333)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6333, float2(0.0), isnan(_6333)), level(0.0)).xyz;
    float _2043 = _2041.x;
    float _2045 = _2041.y;
    float _2047 = _2041.z;
    float _2049 = float(uint(_742));
    float _2051 = trunc(_772);
    int _2053 = int(_2051);
    bool _2055 = _742 == 0;
    float _2057 = _810 * _174;
    int _2059 = abs(_750);
    out.m_73.x = _1304;
    out.m_73.y = _1312;
    out.m_73.z = _1330;
    int _2061 = ~_742;
    int _2063 = _2061 + 1;
    float _2065 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2067 = 1.0 / _2049;
    out.m_75.x = _1274;
    out.m_77.w = _1102;
    float _2069 = float(uint(_2053));
    float _2071 = trunc(_2057);
    int _2073 = int(_2071);
    int _2075 = ~_742;
    int _2077 = _2075 + 1;
    float _2079 = _1242 * _1216;
    out.m_79.x = _1570;
    out.m_79.y = _1568;
    out.m_79.z = _1572;
    int _2081 = as_type<int>(_2067) + (-2);
    float _2083 = exp2(_2065);
    float _2085 = as_type<float>(_2081) * _2069;
    float _2087 = trunc(_2085);
    float _2089 = precise::max(_2087, 0.0);
    uint _2092 = uint(_2089);
    int _2094 = ~_742;
    int _2096 = _2094 + 1;
    float _2098 = -_2083;
    float _2100 = _2098 + 1.0;
    int _2102 = _2077 * int(_2092);
    int _2104 = _2102 + _2053;
    float _2106 = float(uint(_2104));
    float _2108 = as_type<float>(_2081) * _2106;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2112 = _2110 != 0;
    float _2114 = float(_2053);
    float _2116 = trunc(_2108);
    float _2118 = precise::max(_2116, 0.0);
    uint _2120 = uint(_2118);
    bool _2122 = !_2112;
    float _2124 = _2122 ? 7.345489978790283203125 : 1.0;
    bool _2126 = _2114 >= _790;
    bool _2128 = isnan(_2114);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan(_790);
    bool _2134 = _2130 || _2132;
    float _2136 = float(_2134);
    float _2138 = _2124 * _496;
    float _2140 = trunc(_2136);
    int _2142 = int(_2140);
    int _2144 = int(_2092) + int(_2120);
    float _2146 = floor(_2138);
    int _2148 = _2096 * _2144;
    int _2150 = _2148 + _2053;
    bool _2152 = uint(_2150) >= uint(_742);
    bool _2154 = !_2152;
    int _2156 = _2154 ? 0 : (-1);
    float _2158 = -_2146;
    float _2160 = _2138 + _2158;
    int _2162 = ~_2144;
    int _2164 = _2162 + _2156;
    int _2166 = _2164 + 1;
    float _2168 = _2160 * _790;
    int _2170 = _742 * _2166;
    int _2172 = _2170 + _2053;
    int _2174 = ~_2142;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = trunc(_2168);
    int _2182 = int(_2180);
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2186 = _2184 != 0;
    bool _2188 = !_2055;
    int _2190 = _2188 ? _2172 : (-1);
    int _2192 = _742 + (-1);
    bool _2194 = !_2186;
    int _2196 = _2194 ? 0 : 1;
    int _2198 = _2190 * _2178;
    int _2200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2202 = _2200 != 0;
    float _2204 = in.m_81.y;
    int _2206 = abs(_682);
    int _2208 = _2142 * _2192;
    int _2210 = _2208 + _2198;
    int _2212 = abs(_734);
    float _2214 = in.m_81.w;
    bool _2216 = !_2202;
    int _2218 = _2216 ? 0 : 1;
    int _2220 = abs(_2196);
    int _2222 = _2210 * _2206;
    float _2224 = in.m_81.z;
    int _2226 = abs(_2218);
    int _2228 = _2182 * _2220;
    int _2230 = _2228 + _2053;
    int _2232 = _2073 * _2212;
    int _2234 = _2232 + _2222;
    float _2236 = in.m_81.x;
    int _2238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2240 = _2238 != 0;
    int _2242 = _2230 * _2059;
    int _2244 = _2242 + _2234;
    int _2246 = ~_742;
    int _2248 = _2246 + 1;
    int _2250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2252 = _2250 != 0;
    int _2254 = _2182 * _2226;
    int _2256 = _2254 + _2244;
    out.m_83.y = _2204;
    int _2258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2260 = _2258 != 0;
    float _2262 = float(uint(_2256));
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2266 = _2264 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2268 = _498 > 0.5;
    float _2270 = as_type<float>(_2234);
    float _2272 = _1964;
    if (_2240)
    {
        float _2274 = in.m_55.x;
        _2270 = _2274;
    }
    float _2276 = _2270;
    float _2278 = as_type<float>(_2081) * _2262;
    float _2280 = float(uint(_2230));
    float _2282 = in.m_85.y;
    float _2284 = 1.0 / _2266;
    out.m_83.w = _2214;
    out.m_83.x = _2236;
    float _2286 = trunc(_2278);
    float _2288 = precise::max(_2286, 0.0);
    uint _2290 = uint(_2288);
    float _2292 = in.m_85.x;
    out.m_83.z = _2224;
    float _2294 = -_2282;
    float _2296 = _2294 + 1.0;
    int _2298 = _2248 * int(_2290);
    int _2300 = _2298 + _2256;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2306 = _2282;
    float _2308 = _2292;
    if (_2252)
    {
        float _2310 = _2268 ? _2296 : _2282;
        _2306 = _2310;
    }
    float _2312 = _2306;
    float _2314 = _2304 * _2284;
    float _2316 = float(uint(_2300));
    float _2318 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2320 = _456 + _2318;
    float _2322 = in.m_87.x;
    float _2324 = in.m_87.y;
    float _2326 = in.m_87.z;
    bool _2328 = _1204 != 0.0;
    bool _2330 = isnan(_1204);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan(0.0);
    bool _2336 = _2332 || _2334;
    float _2338 = as_type<float>(_2081) * _2316;
    bool _2340 = _1202 == 0.0;
    bool _2342 = !_2336;
    bool _2344 = _2340 && _2342;
    float _2346 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2348 = _2346 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2350 = trunc(_2338);
    float _2352 = precise::max(_2350, 0.0);
    uint _2354 = uint(_2352);
    bool _2356 = _1206 == 0.0;
    bool _2358 = _2356 && _2344;
    float _2360 = 1.0 / _2348;
    float _2362 = _2324;
    float _2364 = _2322;
    float _2366 = _2326;
    if (!_2358)
    {
        float _2368 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2324);
        _2362 = _2368;
    }
    float _2370 = _2362;
    if (!_2358)
    {
        float _2372 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2322);
        _2364 = _2372;
    }
    float _2374 = _2364;
    int _2376 = int(_2290) + int(_2354);
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2378;
    int _2382 = ~_742;
    int _2384 = _2382 + 1;
    float _2386 = as_type<float>(_2376);
    if (!_2358)
    {
        float _2388 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2326);
        _2366 = _2388;
    }
    float _2390 = _2366;
    bool _2392 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2394 = isnan(_456);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2400 = _2396 || _2398;
    float _2402 = float(_2400);
    int _2404 = _2063 * _2376;
    int _2406 = _2404 + _2256;
    float _2408 = _2380 * _2360;
    float _2410 = as_type<float>(_2081) * _2280;
    bool _2412 = uint(_2406) >= uint(_742);
    float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2416 = _456 + _2414;
    float _2418 = fma(_2408, _2320, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2420 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2422 = isnan(_456);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = trunc(_2410);
    float _2434 = precise::max(_2432, 0.0);
    uint _2436 = uint(_2434);
    bool _2438 = !_2412;
    int _2440 = _2438 ? 0 : (-1);
    bool _2442 = _2276 > 0.5;
    bool _2444 = _2442 && _2240;
    float _2446 = fma(_2314, _2416, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2448 = _798 * (-0.15915493667125701904296875);
    int _2450 = ~_2376;
    int _2452 = _2450 + _2440;
    int _2454 = _2452 + 1;
    float _2456 = -_2402;
    float _2458 = _2456 + 1.0;
    if (_2240)
    {
        _2386 = _2292;
    }
    float _2460 = _2386;
    float _2462 = _2448 * 6.283185482025146484375;
    float _2464 = sin(_2462);
    bool _2466 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2468 = isnan(_456);
    bool _2470 = _2466 || _2468;
    bool _2472 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2474 = _2470 || _2472;
    float _2476 = float(_2474);
    float _2478 = _2430 * _2458;
    int _2480 = _2384 * int(_2436);
    int _2482 = _2480 + _2230;
    float _2484 = _2448 * 6.283185482025146484375;
    float _2486 = cos(_2484);
    float _2488 = _2460;
    if (_2444)
    {
        float _2490 = -_2460;
        float _2492 = _2490 + 1.0;
        _2488 = _2492;
    }
    float _2494 = _2488;
    float _2496 = float(uint(_2482));
    float _2498 = -_2430;
    float _2500 = _2498 + 1.0;
    if (_2240)
    {
        _2308 = _2494;
    }
    float _2502 = _2308;
    int _2504 = _742 * _2454;
    int _2506 = _2504 + _2256;
    float _2508 = fma(_2312, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2510 = as_type<float>(_2081) * _2496;
    float _2512 = _2476 * _2500;
    float _2514 = -_2476;
    float _2516 = _2514 + 1.0;
    float _2518 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2520 = _2464 * _2508;
    float _2522 = _2418 * _2512;
    float _2524 = trunc(_2510);
    float _2526 = precise::max(_2524, 0.0);
    uint _2528 = uint(_2526);
    bool _2530 = !_2055;
    int _2532 = _2530 ? _2506 : (-1);
    float _2534 = _2486 * _2508;
    float _2536 = fma(_2516, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2522);
    float _2538 = -_2520;
    float _2540 = fma(_2486, _2518, _2538);
    int _2542 = _2532 >> 31;
    float _2544 = fma(_2464, _2518, _2534);
    float _2546 = fma(_2446, _2478, _2536);
    float _2548 = fma(_808, _2540, _814);
    int _2550 = _2542 & 3;
    float _2552 = -_796;
    float _2554 = fma(_816, _2544, _2552);
    int _2556 = ~_742;
    int _2558 = _2556 + 1;
    float _2560 = abs(_1586);
    float _2562 = log2(_2560);
    int _2564 = _2532 + _2550;
    float _2566 = fma(_2402, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2546);
    float _2568 = _2548 + 0.5;
    int _2570 = int(_2436) + int(_2528);
    float _2572 = _2566 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2574 = _2564 >> 2;
    float _2576 = _2554 + 0.5;
    int _2578 = _2558 * _2570;
    int _2580 = _2578 + _2230;
    int _2582 = _2574 << 4;
    int _2584 = _2582 + 368;
    int _2586 = _2532 & 3;
    bool _2588 = _2586 != 0;
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2592 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2594 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    uint _2596 = uint(int(uint(_2584) >> uint(2)));
    uint _2598 = uint(int(uint(int(_2596)) >> uint(2)));
    int _2600 = int(_2596) & 3;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[int(_2598)][_2600];
    int _2604 = int(_2596) + 1;
    uint _2606 = uint(int(uint(_2604) >> uint(2)));
    int _2608 = _2604 & 3;
    float _2610 = (*spvDescriptorSet0.vp_c9)._m0[int(_2606)][_2608];
    bool _2612 = uint(_2580) >= uint(_742);
    float _2614 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2616 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2618 = exp2(_2594);
    bool _2620 = !_2612;
    int _2622 = _2620 ? 0 : (-1);
    out.m_89.x = _2568;
    out.m_89.y = _2576;
    int _2624 = _2584 + 8;
    uint _2626 = uint(int(uint(_2624) >> uint(2)));
    uint _2628 = uint(int(uint(int(_2626)) >> uint(2)));
    int _2630 = int(_2626) & 3;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[int(_2628)][_2630];
    int _2634 = int(_2626) + 1;
    uint _2636 = uint(int(uint(_2634) >> uint(2)));
    int _2638 = _2634 & 3;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[int(_2636)][_2638];
    bool _2642 = uint(_2586) > 1u;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2646 = _2532 & 3;
    bool _2648 = _2646 != 0;
    float _2650 = -_2024;
    float _2652 = _2650 + 1.0;
    float _2654 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2656 = _2648 ? 0 : 1;
    bool _2658 = _2586 != 3;
    out.m_91.x = _2654;
    out.m_91.y = _2614;
    out.m_91.z = _2616;
    out.m_91.w = _2572;
    float _2660 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2662 = precise::clamp(_2660, 0.0, 1.0);
    bool _2664 = uint(_2586) >= 2u;
    bool _2666 = !_2588;
    int _2668 = _2666 ? 0 : 1;
    float _2670 = fma(_2662, -2.0, 3.0);
    float _2672 = _2662 * _2662;
    bool _2674 = _2586 != 3;
    bool _2676 = _1586 <= 8000.0;
    bool _2678 = isnan(_1586);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan(8000.0);
    bool _2684 = _2680 || _2682;
    float _2686 = float(_2684);
    float _2688 = _2672 * _2670;
    int _2690 = ~_2570;
    int _2692 = _2690 + _2622;
    int _2694 = _2692 + 1;
    int _2696 = ~_2656;
    int _2698 = _2696 + 1;
    int _2700 = _2698 + 1;
    float _2702 = _1266 * _1220;
    int _2704 = _2700;
    if (!_2642)
    {
        int _2706 = ~_2656;
        int _2708 = _2706 + 1;
        _2704 = _2708;
    }
    int _2710 = _2704;
    int _2712 = _742 * _2694;
    int _2714 = _2712 + _2230;
    int _2716 = _2664 ? 0 : 1;
    int _2718 = abs(_2710);
    int _2720 = abs(_2668);
    float _2722 = -_2688;
    float _2724 = _2722 + 1.0;
    int _2726 = ~_2716;
    int _2728 = _2726 + 1;
    int _2730 = _2728 + 1;
    int _2732 = _2730;
    if (_2658)
    {
        int _2734 = ~_2716;
        int _2736 = _2734 + 1;
        _2732 = _2736;
    }
    int _2738 = _2732;
    float _2740 = fma(_2724, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2688);
    int _2742 = ~_2718;
    int _2744 = _2742 + 1;
    int _2746 = _2744 + 1;
    int _2748 = abs(_2738);
    int _2750 = ~_2720;
    int _2752 = _2750 + 1;
    int _2754 = _2752 + 1;
    int _2756 = _2746 * as_type<int>(_2610);
    float _2758 = _1242 * _1218;
    bool _2760 = !_2674;
    int _2762 = _2760 ? 0 : (-1);
    int _2764 = _2754 * as_type<int>(_2602);
    int _2766 = _2764 + _2756;
    int _2768 = ~_2748;
    int _2770 = _2768 + 1;
    int _2772 = _2770 + 1;
    float _2774 = _2686 * _2740;
    bool _2776 = !_2260;
    int _2778 = _2776 ? 0 : 1;
    float _2780 = _1276 * _1218;
    int _2782 = abs(_2762);
    int _2784 = _2772 * as_type<int>(_2632);
    int _2786 = _2784 + _2766;
    int _2788 = abs(_2778);
    float _2790 = _1242 * _1220;
    int _2792 = ~_2782;
    int _2794 = _2792 + 1;
    int _2796 = _2794 + 1;
    float _2798 = -_1224;
    float _2800 = fma(_2798, _1368, _2758);
    float _2802 = _1276 * _1220;
    float _2804 = _1276 * _1216;
    float _2806 = -_1224;
    float _2808 = fma(_2806, _1324, _2790);
    int _2810 = _2796 * as_type<int>(_2640);
    int _2812 = _2810 + _2786;
    float _2814 = -_1224;
    float _2816 = fma(_2814, _1318, _2079);
    int _2818 = ~_2788;
    int _2820 = _2818 + 1;
    int _2822 = _2820 + 1;
    float _2824 = _1266 * _1218;
    float _2826 = fma(_1240, _1368, _2780);
    float _2828 = fma(_1212, _706, _2800);
    float _2830 = fma(_1240, _1324, _2802);
    float _2832 = fma(_1240, _1318, _2804);
    float _2834 = _1266 * _1216;
    float _2836 = fma(_1214, _1324, _2702);
    float _2838 = fma(_1212, _594, _2808);
    float _2840 = fma(_1212, _598, _2816);
    bool _2842 = !_2055;
    int _2844 = _2842 ? _2714 : (-1);
    float _2846 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2848 = fma(_1214, _1368, _2824);
    int _2850 = _2812 * _2822;
    float _2852 = fma(_1256, _706, _2826);
    float _2854 = _2828 * _2370;
    float _2856 = fma(_1214, _1318, _2834);
    float _2858 = fma(_1256, _594, _2830);
    float _2860 = _2838 * _2370;
    float _2862 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2846);
    float _2864 = fma(_1278, _706, _2848);
    int _2866 = _2844 * _2788;
    int _2868 = _2866 + _2850;
    float _2870 = fma(_2852, _2374, _2854);
    float _2872 = fma(_1256, _598, _2832);
    float _2874 = fma(_1278, _598, _2856);
    float _2876 = fma(_2858, _2374, _2860);
    float _2878 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2880 = _2840 * _2370;
    float _2882 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2862);
    float _2884 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2886 = fma(_2864, _2390, _2870);
    float _2888 = float(_2868);
    float _2890 = in.m_67.x;
    float _2892 = _2652 * _2878;
    float _2894 = precise::clamp(_2892, 0.0, 1.0);
    float _2896 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2882);
    float _2898 = _2884 * _2026;
    float _2900 = fma(_1278, _594, _2836);
    float _2902 = _1950 * 0.5;
    out.m_93.x = _2888;
    float _2904 = -_2894;
    float _2906 = fma(_2904, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2908 = fma(_2872, _2374, _2880);
    float _2910 = _2896 + _1950;
    float _2912 = _1964 + _1950;
    float _2914 = _2037 * _2898;
    float _2916 = _2047 * _2898;
    float _2918 = fma(_2900, _2390, _2876);
    float _2920 = -_2884;
    float _2922 = _2920 + 1.0;
    float _2924 = fma(_1996, -0.5, _2902);
    float _2926 = _2910 * 0.5;
    float _2928 = _2912 * 0.5;
    float _2930 = fma(_2874, _2390, _2908);
    float _2932 = fma(_2043, _2914, _2031);
    float _2934 = fma(_2045, _2914, _2033);
    float _2936 = _2037 * _2922;
    float _2938 = fma(_2037, _2916, _2035);
    out.m_95.x = _2928;
    out.m_95.y = _2924;
    out.m_95.z = _2926;
    out.m_95.w = _1950;
    bool _2940 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2942 = isnan(_1742);
    bool _2944 = _2940 || _2942;
    bool _2946 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2948 = _2944 || _2946;
    float _2950 = _2906 * _2890;
    out.m_97.x = _2932;
    out.m_97.y = _2934;
    out.m_97.z = _2938;
    out.m_97.w = _2936;
    float _2952 = _2950 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2954 = _1642 * _1704;
    out.m_99.x = _2918;
    out.m_99.y = _2886;
    out.m_99.z = _2930;
    out.gl_Position.x = _1964;
    out.gl_Position.y = _1996;
    out.gl_Position.z = _2896;
    out.gl_Position.w = _1950;
    float _2956 = _2914;
    float _2958 = _2890;
    float _2960 = _2922;
    float _2962 = _2952;
    float _2964 = _2954;
    if (!_2948)
    {
        _2956 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2966 = _2956;
    out.m_101.x = _2952;
    float _2968 = _2966;
    float _2970 = _2966;
    if (!_2948)
    {
        _2958 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2972 = _2958;
    float _2974 = _2972;
    float _2976 = _2972;
    if (!_2948)
    {
        _2960 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2978 = _2960;
    float _2980 = _2978;
    float _2982 = _2978;
    if (!_2948)
    {
        _2962 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2984 = _2962;
    float _2986 = _2954 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2988 = _2984;
    float _2990 = _2984;
    if (!_2948)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2992 = _2272;
    float _2994 = _2992;
    float _2996 = _2992;
    if (!_2948)
    {
        _2964 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2998 = _2964;
    bool _3000 = !_2948;
    float _3002 = _2998;
    float _3004 = _2998;
    if (!_3000)
    {
        bool _3006 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3008 = isnan(_1742);
        bool _3010 = _3006 || _3008;
        bool _3012 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3014 = _3010 || _3012;
        if (!_3014)
        {
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3018 = _1742 + _3016;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3022 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3020;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3028 = 1.0 / _3022;
            float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3044 = _3042 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3046 = _3018 * _3028;
            float _3048 = precise::clamp(_3046, 0.0, 1.0);
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3054 = fma(_3048, _3026, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3056 = fma(_3048, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3058 = fma(_3048, _3032, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3060 = fma(_3048, _3036, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3062 = fma(_3048, _3040, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3064 = fma(_3048, _3044, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2996 = _3058;
            _2990 = _3062;
            _2970 = _3054;
            _2982 = _3060;
            _2976 = _3056;
            _3004 = _3064;
            _3066 = true;
        }
        else
        {
            bool _3068 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3070 = isnan(_1742);
            bool _3072 = _3068 || _3070;
            bool _3074 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3076 = _3072 || _3074;
            if (!_3076)
            {
                _2968 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3078 = _2968;
            _2970 = _3078;
            if (!_3076)
            {
                _2994 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3080 = _2994;
            _2996 = _3080;
            if (!_3076)
            {
                _2974 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3082 = _2974;
            _2976 = _3082;
            if (!_3076)
            {
                _2980 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3084 = _2980;
            _2982 = _3084;
            if (!_3076)
            {
                _2988 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3086 = _2988;
            _2990 = _3086;
            if (!_3076)
            {
                _3002 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3088 = _3002;
            bool _3090 = !_3076;
            _3004 = _3088;
            if (!_3090)
            {
                bool _3092 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3094 = isnan(_1742);
                bool _3096 = _3092 || _3094;
                bool _3098 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3100 = _3096 || _3098;
                if (!_3100)
                {
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3104 = _1742 + _3102;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3108 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3106;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3114 = 1.0 / _3108;
                    float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3122 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3130 = _3128 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3132 = _3104 * _3114;
                    float _3134 = precise::clamp(_3132, 0.0, 1.0);
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3140 = fma(_3134, _3112, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3142 = fma(_3134, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3144 = fma(_3134, _3118, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3146 = fma(_3134, _3122, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3148 = fma(_3134, _3126, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3150 = fma(_3134, _3130, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2996 = _3144;
                    _2990 = _3148;
                    _2970 = _3140;
                    _2982 = _3146;
                    _2976 = _3142;
                    _3004 = _3150;
                    _3066 = true;
                }
                else
                {
                    _2996 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2990 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2970 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2982 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2976 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3004 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3066 = false;
    float _3152 = _2996;
    float _3154 = _2990;
    float _3156 = _2970;
    float _3158 = _2982;
    float _3160 = _2976;
    float _3162 = _3004;
    float _3164 = fma(_2886, -0.5, 0.5);
    float _3166 = precise::clamp(_3164, 0.0, 1.0);
    float _3168 = -_3152;
    float _3170 = _3168 + _3154;
    float _3172 = _2986 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3174 = -_3156;
    float _3176 = _3174 + _3158;
    float _3178 = fma(_3166, _3170, _3152);
    out.m_103.x = 0.0;
    float _3180 = -_3160;
    float _3182 = _3180 + _3162;
    float _3184 = fma(_3166, _3176, _3156);
    float _3186 = _3178 * 0.586610972881317138671875;
    out.m_53.x = _3172;
    bool _3188 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3190 = fma(_3166, _3182, _3160);
    float _3192 = fma(_3184, 0.298911988735198974609375, _3186);
    bool _3194 = _1642 > 0.0;
    bool _3196 = isnan(_1642);
    bool _3198 = _3194 || _3196;
    bool _3200 = isnan(0.0);
    bool _3202 = _3198 || _3200;
    float _3204 = fma(_3190, 0.114477999508380889892578125, _3192);
    bool _3206 = _1704 <= 0.0;
    bool _3208 = !_3202;
    bool _3210 = _3206 || _3208;
    float _3212 = -_3204;
    float _3214 = _3184 + _3212;
    float _3216 = -_3204;
    float _3218 = _3178 + _3216;
    float _3220 = -_3204;
    float _3222 = _3190 + _3220;
    float _3224 = fma(_3214, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3204);
    float _3226 = fma(_3218, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3204);
    float _3228 = fma(_3222, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3204);
    bool _3230 = !_3188;
    if (!_3230)
    {
        float _3232 = -_1568;
        float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3236 = -_1570;
        float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3240 = -_1572;
        float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3244 = _3234 * _3234;
        float _3246 = fma(_3238, _3238, _3244);
        float _3248 = fma(_3242, _3242, _3246);
        float _3250 = sqrt(_3248);
        float _3252 = rsqrt(_3248);
        float _3254 = -_3250;
        float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3258 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3260 = precise::clamp(_3258, 0.0, 1.0);
        float _3262 = _3238 * _3252;
        float _3264 = _3234 * _3252;
        float _3266 = abs(_3260);
        float _3268 = log2(_3266);
        float _3270 = _3242 * _3252;
        float _3272 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3274 = _2886 * _3264;
        float _3276 = -_3264;
        float _3278 = -_3272;
        float _3280 = fma(_3276, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3278);
        float _3282 = fma(_2918, _3262, _3274);
        float _3284 = -_3270;
        float _3286 = fma(_3284, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3280);
        float _3288 = fma(_2930, _3270, _3282);
        float _3290 = precise::clamp(_3288, 0.0, 1.0);
        float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3294 = _3286 + _3292;
        float _3296 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3298 = _3294 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3300 = precise::clamp(_3298, 0.0, 1.0);
        float _3302 = exp2(_3296);
        float _3304 = _3302 * _3300;
        float _3306 = _3290 * _3304;
        float _3308 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3310 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3312 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3308;
        out.m_103.y = _3310;
        out.m_103.z = _3312;
    }
    out.m_77.x = _3224;
    out.m_77.y = _3226;
    out.m_77.z = _3228;
    if (!_3210)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3314 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3314;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3066 = false;
    bool _322 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = in.m_48.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    float _138 = _128;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _134;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _142 = 0;
    if (!_132)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3383 = as_type<float>(_146);
        out.gl_Position.z = _3383;
    }
    if (!_132)
    {
        return out;
    }
    bool _150 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_119);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = float(_124);
    bool _162 = _128 >= _160;
    bool _164 = !_158;
    bool _166 = _162 || _164;
    if (_166)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _136;
    if (_166)
    {
        out.m_53.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _148 = as_type<int>(_170);
    }
    int _172 = _148;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3438 = as_type<float>(_172);
        out.gl_Position.z = _3438;
    }
    if (_166)
    {
        return out;
    }
    float _174 = 1.0 / _160;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _128 * _174;
    bool _180 = !_176;
    float _182 = _178;
    float _200;
    if (!_180)
    {
        float _184 = in.m_55.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _178;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = 1.0 / _224;
    bool _228 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_204);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_220;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _248;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _254 = _238 * _242;
    float _256 = -_238;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = _208 * _226;
    float _266 = in.m_57.x;
    float _268 = in.m_57.y;
    float _270 = in.m_57.z;
    float _272 = fma(_246, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _274 = fma(_262, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _276 = fma(_250, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _278 = _272 * _254;
    float _280 = _274 * _254;
    float _282 = _276 * _254;
    float _284 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[143].x, _278);
    float _286 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[143].y, _280);
    float _288 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[143].z, _282);
    float _290 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _284);
    float _292 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _286);
    float _294 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].z, _288);
    float _296 = _290 * _266;
    float _298 = _292 * _268;
    float _300 = _294 * _270;
    bool _302 = !_252;
    float _320;
    if (!_302)
    {
        float _304 = in.m_55.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _178;
    }
    _322 = false;
    float _324 = _320;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _328 = _324 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _334 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _336 = isnan(_324);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _350 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _352 = isnan(_324);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _362;
    bool _366 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _368 = isnan(_324);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = 1.0 / _332;
    float _380 = -_344;
    float _382 = _380 + 1.0;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _386 = _360 * _382;
    float _388 = -_360;
    float _390 = _388 + 1.0;
    float _392 = 1.0 / _348;
    float _394 = _364 * _378;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _400 = fma(_394, _328, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _402 = -_376;
    float _404 = _402 + 1.0;
    float _406 = _400 * _386;
    float _408 = _398 * _392;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _412 = _324 + _410;
    float _414 = _344 * _404;
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[115].x, _406);
    float _418 = fma(_408, _412, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _420 = fma(_418, _414, _416);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _428 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[117].x, _420);
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _430;
    out.m_59.y = _432;
    out.m_59.z = _434;
    out.m_59.w = _436;
    bool _438 = !_384;
    if (!_438)
    {
        float _440 = in.m_55.x;
        float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _444 = _440 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _448 = _446 * _442;
        float _450 = floor(_448);
        float _452 = -_450;
        float _454 = _448 + _452;
        _182 = _454;
    }
    float _456 = _182;
    float _458 = in.m_46.x;
    float _460 = in.m_46.y;
    float _462 = in.m_46.z;
    float _464 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _466 = in.m_61.x;
    float _468 = in.m_61.y;
    float _470 = in.m_61.z;
    float _472 = in.m_61.w;
    float _474 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _476 = in.m_63.x;
    float _478 = in.m_63.y;
    float _480 = in.m_63.z;
    float _482 = in.m_63.w;
    float _484 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _486 = in.m_65.x;
    float _488 = in.m_65.y;
    float _490 = in.m_65.z;
    float _492 = in.m_65.w;
    float _494 = in.m_67.y;
    float _496 = in.m_55.x;
    float _498 = in.m_55.y;
    float _500 = in.m_55.z;
    float _502 = _460 * _468;
    float _504 = _460 * _478;
    float _506 = fma(_458, _466, _502);
    float _508 = _460 * _488;
    float _510 = fma(_458, _476, _504);
    float _512 = fma(_462, _470, _506);
    float _514 = _460 + _494;
    float _516 = fma(_458, _486, _508);
    float _518 = fma(_462, _480, _510);
    float _520 = _512 + _472;
    float _522 = -_514;
    float _524 = _522 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _528 = _518 + _482;
    float _530 = -_520;
    float _532 = _530 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _534 = _524 * _524;
    float _536 = -_528;
    float _538 = _536 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _540 = fma(_532, _532, _534);
    float _542 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _544 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _546 = fma(_538, _538, _540);
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _550 = -_542;
    float _552 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _550);
    float _554 = -_544;
    float _556 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _554);
    float _558 = rsqrt(_546);
    float _560 = -_548;
    float _562 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _560);
    float _564 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _566 = _498 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _568 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _570 = -_564;
    float _572 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _570);
    float _574 = fma(_566, -2.0, _526);
    float _576 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _578 = log2(_576);
    float _580 = _496 * 2.0;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _584 = fma(_462, _490, _516);
    float _586 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _588 = -_582;
    float _590 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[77].x, _588);
    float _592 = _498 + _496;
    float _594 = _532 * _558;
    float _596 = floor(_580);
    float _598 = _538 * _558;
    float _600 = -_586;
    float _602 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _600);
    float _604 = _594 * _594;
    float _606 = -_568;
    float _608 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _606);
    float _610 = _498 * 2.0;
    float _612 = _592 + (-1.0);
    float _614 = fma(_598, _598, _604);
    float _616 = _578 * _128;
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _620 = int(_618);
    float _622 = _562 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _624 = _498 + _500;
    float _626 = _584 + _492;
    float _628 = -_622;
    float _630 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[1].x, _628);
    float _632 = _624 + (-1.0);
    bool _634 = _596 > 0.0;
    float _636 = rsqrt(_614);
    bool _638 = _596 >= 0.0;
    bool _640 = isnan(_596);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _650 = _556 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _652 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[1].w, _630);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _664 = _662 != 0;
    float _666 = -_650;
    float _668 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[1].y, _666);
    float _670 = floor(_610);
    float _672 = float(_620);
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _676 = _626 + _674;
    float _678 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[1].w, _668);
    bool _680 = !_660;
    int _682 = _680 ? 0 : 1;
    bool _684 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _692 = _688 || _690;
    float _694 = exp2(_616);
    float _696 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _698 = _652 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _700 = _598 * _636;
    float _702 = -_698;
    float _704 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[0].x, _702);
    float _706 = _524 * _558;
    bool _708 = _670 > 0.0;
    float _710 = 1.0 / _672;
    bool _712 = _670 >= 0.0;
    bool _714 = isnan(_670);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.0);
    bool _720 = _716 || _718;
    float _722 = _594 * _636;
    float _724 = -_700;
    float _726 = _598 * _724;
    float _728 = -_700;
    float _730 = _706 * _728;
    bool _732 = !_656;
    int _734 = _732 ? 0 : 1;
    float _736 = -_694;
    float _738 = _736 + 1.0;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = -_726;
    float _746 = fma(_594, _722, _744);
    bool _748 = !_664;
    int _750 = _748 ? 0 : 1;
    float _752 = _692 ? _738 : 0.0;
    float _754 = _706 * _722;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _758 = 1.0 + _756;
    float _760 = _746 * _746;
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = _710 * _128;
    float _774 = 1.0 / _758;
    float _776 = fma(_754, _754, _760);
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _782 = _500 * 2.0;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _786 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[79].z, _778);
    float _788 = _562 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = float(_742);
    float _792 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[78].z, _780);
    float _794 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[78].w, _784);
    float _796 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _574);
    float _798 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _786);
    float _800 = -_788;
    float _802 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[1].x, _800);
    float _804 = _602 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _806 = floor(_782);
    float _808 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _792);
    float _810 = _790 * _128;
    float _812 = -_128;
    float _814 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    float _816 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _794);
    float _818 = _528;
    if (_770)
    {
        float _820 = _752 * _774;
        _138 = _820;
    }
    float _822 = _138;
    float _824 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[1].w, _802);
    float _826 = -_804;
    float _828 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[1].x, _826);
    float _830 = fma(_730, _730, _776);
    float _832 = _556 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _704);
    float _836 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[1].z, _828);
    float _838 = rsqrt(_830);
    float _840 = _562 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _842 = -_832;
    float _844 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[0].y, _842);
    float _846 = -_836;
    float _848 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[0].w, _834);
    bool _850 = _806 >= 0.0;
    bool _852 = isnan(_806);
    bool _854 = _850 || _852;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    float _860 = -_840;
    float _862 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[0].x, _860);
    float _864 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[0].w, _844);
    int _866 = _646 ? 0 : 1;
    float _868 = _562 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _870 = 1.0 / _848;
    int _872 = _858 ? 0 : 1;
    float _874 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[0].w, _862);
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _886 = _884 != 0;
    float _888 = -_868;
    float _890 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[0].x, _888);
    bool _892 = _806 > 0.0;
    float _894 = _676 * _676;
    float _896 = _746 * _838;
    float _898 = precise::clamp(_896, 0.0, 1.0);
    int _900 = ~_866;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    float _906 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[0].w, _890);
    int _908 = ~_872;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = -_898;
    float _916 = _914 + 1.0;
    int _918 = _904;
    int _920 = _912;
    if (!_634)
    {
        int _922 = ~_866;
        int _924 = _922 + 1;
        _918 = _924;
    }
    int _926 = _918;
    int _928 = _720 ? 0 : 1;
    float _930 = fma(_874, _870, -1.0);
    float _932 = _916 * _870;
    if (!_892)
    {
        int _934 = ~_872;
        int _936 = _934 + 1;
        _920 = _936;
    }
    int _938 = _920;
    bool _940 = !_878;
    int _942 = _940 ? 0 : 1;
    float _944 = fma(_916, _930, 1.0);
    float _946 = _906 * _932;
    float _948 = _864 * _932;
    int _950 = abs(_942);
    float _952 = _944 * _944;
    float _954 = in.m_69.x;
    float _956 = in.m_69.y;
    float _958 = in.m_69.z;
    float _960 = float(_938);
    float _962 = fma(_948, _948, _952);
    float _964 = float(_950);
    int _966 = ~_928;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = fma(_946, _946, _962);
    int _974 = _970;
    if (!_708)
    {
        int _976 = ~_928;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = _964 * _960;
    bool _984 = !_882;
    int _986 = _984 ? 0 : 1;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _990 = _520 + _988;
    float _992 = float(_926);
    float _994 = rsqrt(_972);
    float _996 = _982 * (-2.0);
    float _998 = _496 + (-0.5);
    int _1000 = abs(_986);
    float _1002 = fma(_990, _990, _894);
    float _1004 = float(_1000);
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1008 = _528 + _1006;
    float _1010 = fma(_996, _954, _954);
    float _1012 = fma(_648, _996, _648);
    float _1014 = _1004 * _992;
    float _1016 = fma(_1008, _1008, _1002);
    float _1018 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1010);
    float _1020 = _946 * _994;
    float _1022 = _944 * _994;
    float _1024 = _948 * _994;
    float _1026 = fma(_1012, _822, _1018);
    float _1028 = -_1020;
    float _1030 = _594 * _1028;
    float _1032 = _598 * _1022;
    float _1034 = -_1024;
    float _1036 = _706 * _1034;
    float _1038 = sqrt(_1016);
    float _1040 = -_1024;
    float _1042 = -_1030;
    float _1044 = fma(_598, _1040, _1042);
    float _1046 = -_1020;
    float _1048 = -_1032;
    float _1050 = fma(_706, _1046, _1048);
    float _1052 = -_1036;
    float _1054 = fma(_594, _1022, _1052);
    bool _1056 = !_886;
    int _1058 = _1056 ? 0 : 1;
    float _1060 = _1044 * _1044;
    float _1062 = _1014 * (-2.0);
    float _1064 = _464 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1066 = abs(_1058);
    float _1068 = fma(_1050, _1050, _1060);
    float _1070 = fma(_696, _1062, _696);
    float _1072 = fma(_1062, _956, _956);
    float _1074 = fma(_1054, _1054, _1068);
    float _1076 = _498 + (-0.5);
    float _1078 = float(_980);
    float _1080 = rsqrt(_1016);
    float _1082 = float(_1066);
    float _1084 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1072);
    float _1086 = _500 + _496;
    float _1088 = _1038 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1090 = _500 + (-0.5);
    float _1092 = _1082 * _1078;
    float _1094 = rsqrt(_1074);
    float _1096 = _1086 + (-1.0);
    float _1098 = _1092 * (-2.0);
    float _1100 = _1026 * 0.15915493667125701904296875;
    float _1102 = precise::min(_1064, _1088);
    float _1104 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1106 = fma(_1098, _958, _958);
    float _1108 = fma(_1070, _822, _1084);
    float _1110 = _1100 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = fma(_1104, _1098, _1104);
    float _1116 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1106);
    float _1118 = _1108 * 0.15915493667125701904296875;
    float _1120 = fma(_1114, _822, _1116);
    float _1122 = _1050 * _1094;
    float _1124 = _1054 * _1094;
    float _1126 = _1044 * _1094;
    float _1128 = _1100 * 6.283185482025146484375;
    float _1130 = cos(_1128);
    float _1132 = _598 * _1122;
    float _1134 = _1120 * 0.15915493667125701904296875;
    float _1136 = _594 * _1126;
    float _1138 = -_1132;
    float _1140 = fma(_594, _1124, _1138);
    float _1142 = _706 * _1124;
    float _1144 = -_1136;
    float _1146 = fma(_706, _1122, _1144);
    float _1148 = _1118 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1080 * _1102;
    float _1154 = -_1142;
    float _1156 = fma(_598, _1126, _1154);
    float _1158 = _1140 * _1140;
    float _1160 = _676 * _1152;
    float _1162 = _990 * _1152;
    float _1164 = fma(_1156, _1156, _1158);
    float _1166 = _1118 * 6.283185482025146484375;
    float _1168 = cos(_1166);
    float _1170 = -_1160;
    float _1172 = _676 + _1170;
    float _1174 = -_1162;
    float _1176 = _990 + _1174;
    float _1178 = fma(_1146, _1146, _1164);
    float _1180 = _1172 * _1172;
    float _1182 = _1008 * _1152;
    float _1184 = _1134 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = fma(_1176, _1176, _1180);
    float _1190 = -_1182;
    float _1192 = _1008 + _1190;
    float _1194 = _1112 * _1150;
    float _1196 = _1130 * _1150;
    float _1198 = fma(_1192, _1192, _1188);
    float _1200 = rsqrt(_1178);
    float _1202 = in.m_71.x;
    float _1204 = in.m_71.y;
    float _1206 = in.m_71.z;
    float _1208 = _1112 * _1168;
    float _1210 = sqrt(_1198);
    float _1212 = _1112 * _1186;
    float _1214 = _1150 * _1186;
    float _1216 = _1146 * _1200;
    float _1218 = _1140 * _1200;
    float _1220 = _1156 * _1200;
    float _1222 = _1134 * 6.283185482025146484375;
    float _1224 = sin(_1222);
    float _1226 = _594 * _1216;
    float _1228 = _1080 * _1210;
    float _1230 = _598 * _1218;
    float _1232 = -_1226;
    float _1234 = fma(_598, _1220, _1232);
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1204);
    float _1238 = _1130 * _1168;
    float _1240 = _1168 * _1186;
    float _1242 = _1130 * _1186;
    float _1244 = -_1230;
    float _1246 = fma(_706, _1216, _1244);
    float _1248 = _706 * _1220;
    float _1250 = _1234 * _1234;
    float _1252 = _474 * _1228;
    float _1254 = -_1196;
    float _1256 = fma(_1224, _1208, _1254);
    float _1258 = -_1248;
    float _1260 = fma(_594, _1218, _1258);
    float _1262 = fma(_1246, _1246, _1250);
    float _1264 = -_1208;
    float _1266 = fma(_1224, _1196, _1264);
    float _1268 = _1252 * _1236;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1202);
    float _1272 = fma(_1260, _1260, _1262);
    float _1274 = _464 * _1228;
    float _1276 = fma(_1224, _1238, _1194);
    float _1278 = fma(_1224, _1194, _1238);
    float _1280 = rsqrt(_1272);
    float _1282 = _484 * _1228;
    float _1284 = _1274 * _1270;
    float _1286 = _1242 * _1268;
    float _1288 = -_1268;
    float _1290 = _1224 * _1288;
    float _1292 = _1212 * _1268;
    float _1294 = _1282 * _1206;
    float _1296 = fma(_1276, _1284, _1286);
    float _1298 = fma(_1240, _1284, _1290);
    float _1300 = fma(_1256, _1284, _1292);
    float _1302 = -_1162;
    float _1304 = _520 + _1302;
    float _1306 = fma(_1266, _1294, _1296);
    float _1308 = fma(_1214, _1294, _1298);
    float _1310 = -_1160;
    float _1312 = _1310 + _514;
    float _1314 = fma(_1278, _1294, _1300);
    float _1316 = _1216 * _1306;
    float _1318 = _1260 * _1280;
    float _1320 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1322 = _1220 * _1306;
    float _1324 = _1246 * _1280;
    float _1326 = fma(_1318, _1308, _1316);
    float _1328 = -_1182;
    float _1330 = _528 + _1328;
    float _1332 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1320);
    float _1334 = fma(_1324, _1308, _1322);
    float _1336 = fma(_598, _1314, _1326);
    float _1338 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1340 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1332);
    float _1342 = fma(_594, _1314, _1334);
    float _1344 = _528 + _1336;
    float _1346 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1338);
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1350 = _520 + _1342;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1354 = _1344 + _1352;
    float _1356 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1346);
    float _1358 = 1.0 / _1348;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1362 = _1350 + _1360;
    float _1364 = _1354 * _1354;
    float _1366 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1368 = _1234 * _1280;
    float _1370 = _1218 * _1306;
    float _1372 = fma(_1362, _1362, _1364);
    float _1374 = _1366 + _1348;
    float _1376 = fma(_1368, _1308, _1370);
    float _1378 = sqrt(_1372);
    float _1380 = fma(_706, _1314, _1376);
    bool _1382 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(0.5);
    bool _1390 = _1386 || _1388;
    float _1392 = _1374 * _1358;
    float _1394 = _1392 * 0.5;
    float _1396 = _514 + _1380;
    bool _1398 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.5);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1410 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1408);
    float _1412 = 1.0 / _1410;
    bool _1414 = _1378 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1418 = _1314;
    float _1420 = _1344;
    float _1422 = _1372;
    float _1424 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1426 = _1378;
    float _1428 = _1348;
    if (!_1414)
    {
        _1416 = _1350;
    }
    float _1430 = _1416;
    float _1432 = _1430;
    if (!_1414)
    {
        _1418 = _1396;
    }
    float _1434 = _1418;
    bool _1436 = !_1414;
    float _1438 = _1434;
    if (!_1436)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1378 + _1442;
        float _1446 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = rsqrt(_1372);
        float _1450 = _1444 * _1440;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 + (-1.0);
        float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = fma(_1460, _1446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = fma(_1396, _1456, _1464);
        float _1470 = _1448 * _1466;
        float _1472 = fma(_1362, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1354, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1438 = _1468;
        _1432 = _1472;
        _1420 = _1474;
        _1422 = _1448;
        _1424 = _1470;
        _1426 = _1452;
    }
    float _1476 = _1438;
    float _1478 = _1432;
    float _1480 = _1420;
    float _1482 = _1422;
    float _1484 = _1424;
    float _1486 = _1426;
    float _1488 = -_1160;
    float _1490 = _1488 + _1476;
    float _1492 = -_1162;
    float _1494 = _1492 + _1478;
    float _1496 = -_1182;
    float _1498 = _1496 + _1480;
    float _1500 = _1486;
    float _1502 = _1490;
    float _1504 = _1494;
    float _1506 = _1498;
    float _1508 = _1482;
    float _1510 = _1484;
    float _1512 = _1476;
    if (_1390)
    {
        _1500 = 1.0;
    }
    float _1514 = _1500;
    float _1516 = _1514;
    if (!_1406)
    {
        float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1520 = _1312 + _1518;
        float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1524 = _1304 + _1522;
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1528 = -_528;
        float _1530 = _1528 + _1480;
        float _1532 = _1520 * _1520;
        float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1536 = _1330 + _1534;
        float _1538 = fma(_1524, _1524, _1532);
        float _1540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1542 = fma(_1536, _1536, _1538);
        float _1544 = sqrt(_1542);
        float _1546 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1548 = precise::min(_1544, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1550 = _1548 * _1540;
        float _1552 = -_520;
        float _1554 = _1552 + _1478;
        float _1556 = -_514;
        float _1558 = _1556 + _1476;
        float _1560 = _1546 * _1550;
        float _1562 = fma(_1554, _1560, _1304);
        float _1564 = fma(_1558, _1560, _1312);
        float _1566 = fma(_1530, _1560, _1330);
        _1502 = _1564;
        _1504 = _1562;
        _1506 = _1566;
        _1508 = _1540;
        _818 = _1530;
    }
    float _1568 = _1502;
    float _1570 = _1504;
    float _1572 = _1506;
    float _1574 = _1508;
    float _1576 = _818;
    float _1578 = _1574;
    float _1580 = _1576;
    if (_1390)
    {
        _1428 = 1.0;
    }
    float _1582 = _1428;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1586 = _1412 * _1584;
    float _1588 = _1582;
    if (!_1390)
    {
        float _1590 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1592;
        float _1596 = _1590 * 0.15915493667125701904296875;
        float _1598 = _1596 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = _1596 * 6.283185482025146484375;
        float _1608 = sin(_1606);
        float _1610 = 1.0 / _1600;
        float _1612 = _1604 * 6.283185482025146484375;
        float _1614 = cos(_1612);
        float _1616 = _1608 * _1610;
        float _1618 = _1604 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        float _1622 = _1614 * _1616;
        float _1624 = 1.0 / _1594;
        float _1626 = 1.0 / _1622;
        float _1628 = _1620 * _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1632 = fma(_1586, _1628, _1630);
        float _1634 = _1632 * _1624;
        float _1636 = precise::clamp(_1634, 0.0, 1.0);
        _1578 = _1596;
        _1580 = _1594;
        _1516 = _1636;
    }
    float _1638 = _1578;
    float _1640 = _1580;
    float _1642 = _1516;
    float _1644 = _1638;
    float _1646 = _1640;
    if (!_1390)
    {
        float _1648 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1650 = _1648 * 0.15915493667125701904296875;
        float _1652 = _1650 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1658 = _1656 * 0.15915493667125701904296875;
        float _1660 = _1650 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        float _1664 = 1.0 / _1654;
        float _1666 = _1658 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        float _1670 = _1662 * _1664;
        float _1672 = _1658 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        float _1676 = _1668 * _1670;
        float _1678 = 1.0 / _1676;
        float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1682 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1680;
        float _1684 = 1.0 / _1682;
        float _1686 = _1674 * _1678;
        float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1690 = fma(_1586, _1686, _1688);
        float _1692 = _1690 * _1684;
        float _1694 = precise::clamp(_1692, 0.0, 1.0);
        float _1696 = -_1694;
        float _1698 = _1696 + 1.0;
        _1644 = _1676;
        _1646 = _1686;
        _1588 = _1698;
    }
    float _1700 = _1644;
    float _1702 = _1646;
    float _1704 = _1588;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1708 = _1568 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1570 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1572 + _1714;
    float _1718 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = _1708 * _1708;
    float _1722 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1726 = fma(_1712, _1712, _1720);
    float _1728 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1730 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1724);
    float _1732 = fma(_1716, _1716, _1726);
    float _1734 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1728);
    float _1736 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1738 = rsqrt(_1732);
    float _1740 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1742 = sqrt(_1732);
    float _1744 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1746 = _1712 * _1744;
    float _1748 = _1716 * _1744;
    float _1750 = _1746 * _1746;
    float _1752 = _1748 * _1748;
    float _1754 = _1750 + _1752;
    float _1756 = sqrt(_1754);
    bool _1758 = _1756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = _1756 + _1760;
    float _1764 = _1700;
    float _1766 = _1754;
    float _1768 = _1762;
    float _1770 = _1708;
    float _1772 = _1746;
    float _1774 = _1748;
    float _1776 = _1750;
    if (_1758)
    {
        float _1778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1778;
    }
    float _1780 = _1764;
    if (_1758)
    {
        float _1782 = rsqrt(_1754);
        _1766 = _1782;
    }
    float _1784 = _1766;
    if (_1758)
    {
        float _1786 = _1762 * _1780;
        _1768 = _1786;
    }
    float _1788 = _1768;
    if (_1758)
    {
        float _1790 = _1788 * 0.15915493667125701904296875;
        _1510 = _1790;
    }
    float _1792 = _1510;
    float _1794 = _1702;
    float _1796 = _1792;
    if (_1758)
    {
        float _1798 = _1792 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        _1794 = _1800;
    }
    float _1802 = _1794;
    float _1804 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1806 = precise::max(0.0, _1804);
    float _1808 = _1780;
    if (_1758)
    {
        float _1810 = _1792 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = -_1744;
    float _1818 = -_1806;
    float _1820 = fma(_1708, _1816, _1818);
    if (_1758)
    {
        float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _1822;
    }
    float _1824 = _1770;
    float _1826 = fma(_1304, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1828 = _1802;
    if (_1758)
    {
        float _1830 = fma(_1802, _1824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1828 = _1830;
    }
    float _1832 = _1828;
    float _1834 = floor(_1826);
    float _1836 = _1832;
    float _1838 = _1814;
    if (_1758)
    {
        float _1840 = _1814 + (-1.0);
        _1512 = _1840;
    }
    float _1842 = _1512;
    float _1844 = _1842;
    if (_1758)
    {
        float _1846 = _1784 * _1832;
        _1796 = _1846;
    }
    float _1848 = _1796;
    if (!_1758)
    {
        _1836 = _1820;
    }
    float _1850 = _1836;
    float _1852 = _1850;
    if (_1758)
    {
        float _1854 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1844 = _1854;
    }
    float _1856 = _1844;
    if (_1758)
    {
        float _1858 = _1746 * _1848;
        _1772 = _1858;
    }
    float _1860 = _1772;
    if (_1758)
    {
        float _1862 = _1748 * _1848;
        _1774 = _1862;
    }
    float _1864 = _1774;
    if (_1758)
    {
        float _1866 = fma(_1820, _1814, _1856);
        _1852 = _1866;
    }
    float _1868 = _1852;
    if (_1758)
    {
        float _1870 = _1860 * _1860;
        _1776 = _1870;
    }
    float _1872 = _1776;
    if (!_1758)
    {
        _1838 = _1752;
    }
    float _1874 = _1838;
    float _1876 = _1874;
    if (_1758)
    {
        float _1878 = _1864 * _1864;
        _1876 = _1878;
    }
    float _1880 = _1876;
    float _1882 = fma(_1868, _1868, _1872);
    float _1884 = -_1834;
    float _1886 = _1826 + _1884;
    float _1888 = _1882 + _1880;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1892 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1894 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1896 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1900 = fma(_1742, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1898);
    float _1902 = precise::clamp(_1900, 0.0, 1.0);
    float _1904 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1892);
    float _1906 = rsqrt(_1888);
    float _1908 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1896);
    float _1910 = -_1902;
    float _1912 = _1910 + 1.0;
    float _1914 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1904);
    float _1916 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1918 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1920 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = abs(_1912);
    float _1926 = log2(_1924);
    float _1928 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1930 = -_1920;
    float _1932 = fma(_1930, _1890, 1.0);
    float _1934 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1936 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1928);
    float _1938 = _1906 * _1860;
    float _1940 = _1906 * _1864;
    float _1942 = floor(_1894);
    float _1944 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1936);
    float _1946 = _1906 * _1868;
    float _1948 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1934);
    float _1950 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1944);
    float _1952 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1954 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1948);
    float _1956 = log2(_1932);
    float _1958 = -_1952;
    float _1960 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1958);
    float _1962 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1964 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1954);
    float _1966 = -_1940;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1960);
    float _1970 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1972 = 1.0 / _1950;
    float _1974 = -_1942;
    float _1976 = _1894 + _1974;
    float _1978 = fma(_1968, -0.5, 0.5);
    float _1980 = fma(_1968, 0.5, 0.5);
    float _1982 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1970);
    float _1984 = _1946 + 1.0;
    float _1986 = fma(_1980, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1988 = exp2(_1962);
    float _1990 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1982);
    float _1992 = _1956 * 0.693147182464599609375;
    float _1994 = fma(_1980, _1986, -0.212114393711090087890625);
    float _1996 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1990);
    float _1998 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1980, _1994, 1.570728778839111328125);
    float _2002 = sqrt(_1978);
    float _2004 = -_1946;
    float _2006 = fma(_1988, _1984, _2004);
    float _2008 = _1964 * _1972;
    float _2010 = _1996 * _1972;
    float _2012 = fma(_2006, 0.5, 0.5);
    float _2014 = fma(_2010, -0.5, 0.5);
    float _2016 = _2002 * 0.636619746685028076171875;
    float _2018 = fma(_2008, 0.5, 0.5);
    float _2020 = -_2000;
    float _2022 = fma(_2016, _2020, 1.0);
    float2 _6295 = float2(_1886, _1976);
    float _2024 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6295, float2(0.0), isnan(_6295)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6295, float2(0.0), isnan(_6295)), level(0.0)).x;
    float3 _6306 = float3(_2018, _2014, _1998);
    float _2026 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6306, float3(0.0), isnan(_6306)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6306, float3(0.0), isnan(_6306)), level(0.0)).x;
    float3 _6317 = float3(_2018, _2014, _1998);
    float4 _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6317, float3(0.0), isnan(_6317)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6317, float3(0.0), isnan(_6317)), level(0.0)).xyzw;
    float _2031 = _2029.x;
    float _2033 = _2029.y;
    float _2035 = _2029.z;
    float _2037 = _2029.w;
    float2 _6333 = float2(_2022, _2012);
    float3 _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6333, float2(0.0), isnan(_6333)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6333, float2(0.0), isnan(_6333)), level(0.0)).xyz;
    float _2043 = _2041.x;
    float _2045 = _2041.y;
    float _2047 = _2041.z;
    float _2049 = float(uint(_742));
    float _2051 = trunc(_772);
    int _2053 = int(_2051);
    bool _2055 = _742 == 0;
    float _2057 = _810 * _174;
    int _2059 = abs(_750);
    out.m_73.x = _1304;
    out.m_73.y = _1312;
    out.m_73.z = _1330;
    int _2061 = ~_742;
    int _2063 = _2061 + 1;
    float _2065 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2067 = 1.0 / _2049;
    out.m_75.x = _1274;
    out.m_77.w = _1102;
    float _2069 = float(uint(_2053));
    float _2071 = trunc(_2057);
    int _2073 = int(_2071);
    int _2075 = ~_742;
    int _2077 = _2075 + 1;
    float _2079 = _1242 * _1216;
    out.m_79.x = _1570;
    out.m_79.y = _1568;
    out.m_79.z = _1572;
    int _2081 = as_type<int>(_2067) + (-2);
    float _2083 = exp2(_2065);
    float _2085 = as_type<float>(_2081) * _2069;
    float _2087 = trunc(_2085);
    float _2089 = precise::max(_2087, 0.0);
    uint _2092 = uint(_2089);
    int _2094 = ~_742;
    int _2096 = _2094 + 1;
    float _2098 = -_2083;
    float _2100 = _2098 + 1.0;
    int _2102 = _2077 * int(_2092);
    int _2104 = _2102 + _2053;
    float _2106 = float(uint(_2104));
    float _2108 = as_type<float>(_2081) * _2106;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2112 = _2110 != 0;
    float _2114 = float(_2053);
    float _2116 = trunc(_2108);
    float _2118 = precise::max(_2116, 0.0);
    uint _2120 = uint(_2118);
    bool _2122 = !_2112;
    float _2124 = _2122 ? 7.345489978790283203125 : 1.0;
    bool _2126 = _2114 >= _790;
    bool _2128 = isnan(_2114);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan(_790);
    bool _2134 = _2130 || _2132;
    float _2136 = float(_2134);
    float _2138 = _2124 * _496;
    float _2140 = trunc(_2136);
    int _2142 = int(_2140);
    int _2144 = int(_2092) + int(_2120);
    float _2146 = floor(_2138);
    int _2148 = _2096 * _2144;
    int _2150 = _2148 + _2053;
    bool _2152 = uint(_2150) >= uint(_742);
    bool _2154 = !_2152;
    int _2156 = _2154 ? 0 : (-1);
    float _2158 = -_2146;
    float _2160 = _2138 + _2158;
    int _2162 = ~_2144;
    int _2164 = _2162 + _2156;
    int _2166 = _2164 + 1;
    float _2168 = _2160 * _790;
    int _2170 = _742 * _2166;
    int _2172 = _2170 + _2053;
    int _2174 = ~_2142;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = trunc(_2168);
    int _2182 = int(_2180);
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2186 = _2184 != 0;
    bool _2188 = !_2055;
    int _2190 = _2188 ? _2172 : (-1);
    int _2192 = _742 + (-1);
    bool _2194 = !_2186;
    int _2196 = _2194 ? 0 : 1;
    int _2198 = _2190 * _2178;
    int _2200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2202 = _2200 != 0;
    float _2204 = in.m_81.y;
    int _2206 = abs(_682);
    int _2208 = _2142 * _2192;
    int _2210 = _2208 + _2198;
    int _2212 = abs(_734);
    float _2214 = in.m_81.w;
    bool _2216 = !_2202;
    int _2218 = _2216 ? 0 : 1;
    int _2220 = abs(_2196);
    int _2222 = _2210 * _2206;
    float _2224 = in.m_81.z;
    int _2226 = abs(_2218);
    int _2228 = _2182 * _2220;
    int _2230 = _2228 + _2053;
    int _2232 = _2073 * _2212;
    int _2234 = _2232 + _2222;
    float _2236 = in.m_81.x;
    int _2238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2240 = _2238 != 0;
    int _2242 = _2230 * _2059;
    int _2244 = _2242 + _2234;
    int _2246 = ~_742;
    int _2248 = _2246 + 1;
    int _2250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2252 = _2250 != 0;
    int _2254 = _2182 * _2226;
    int _2256 = _2254 + _2244;
    out.m_83.y = _2204;
    int _2258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2260 = _2258 != 0;
    float _2262 = float(uint(_2256));
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2266 = _2264 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2268 = _498 > 0.5;
    float _2270 = as_type<float>(_2234);
    float _2272 = _1964;
    if (_2240)
    {
        float _2274 = in.m_55.x;
        _2270 = _2274;
    }
    float _2276 = _2270;
    float _2278 = as_type<float>(_2081) * _2262;
    float _2280 = float(uint(_2230));
    float _2282 = in.m_85.y;
    float _2284 = 1.0 / _2266;
    out.m_83.w = _2214;
    out.m_83.x = _2236;
    float _2286 = trunc(_2278);
    float _2288 = precise::max(_2286, 0.0);
    uint _2290 = uint(_2288);
    float _2292 = in.m_85.x;
    out.m_83.z = _2224;
    float _2294 = -_2282;
    float _2296 = _2294 + 1.0;
    int _2298 = _2248 * int(_2290);
    int _2300 = _2298 + _2256;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2306 = _2282;
    float _2308 = _2292;
    if (_2252)
    {
        float _2310 = _2268 ? _2296 : _2282;
        _2306 = _2310;
    }
    float _2312 = _2306;
    float _2314 = _2304 * _2284;
    float _2316 = float(uint(_2300));
    float _2318 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2320 = _456 + _2318;
    float _2322 = in.m_87.x;
    float _2324 = in.m_87.y;
    float _2326 = in.m_87.z;
    bool _2328 = _1204 != 0.0;
    bool _2330 = isnan(_1204);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan(0.0);
    bool _2336 = _2332 || _2334;
    float _2338 = as_type<float>(_2081) * _2316;
    bool _2340 = _1202 == 0.0;
    bool _2342 = !_2336;
    bool _2344 = _2340 && _2342;
    float _2346 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2348 = _2346 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2350 = trunc(_2338);
    float _2352 = precise::max(_2350, 0.0);
    uint _2354 = uint(_2352);
    bool _2356 = _1206 == 0.0;
    bool _2358 = _2356 && _2344;
    float _2360 = 1.0 / _2348;
    float _2362 = _2324;
    float _2364 = _2322;
    float _2366 = _2326;
    if (!_2358)
    {
        float _2368 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2324);
        _2362 = _2368;
    }
    float _2370 = _2362;
    if (!_2358)
    {
        float _2372 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2322);
        _2364 = _2372;
    }
    float _2374 = _2364;
    int _2376 = int(_2290) + int(_2354);
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2378;
    int _2382 = ~_742;
    int _2384 = _2382 + 1;
    float _2386 = as_type<float>(_2376);
    if (!_2358)
    {
        float _2388 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2326);
        _2366 = _2388;
    }
    float _2390 = _2366;
    bool _2392 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2394 = isnan(_456);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2400 = _2396 || _2398;
    float _2402 = float(_2400);
    int _2404 = _2063 * _2376;
    int _2406 = _2404 + _2256;
    float _2408 = _2380 * _2360;
    float _2410 = as_type<float>(_2081) * _2280;
    bool _2412 = uint(_2406) >= uint(_742);
    float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2416 = _456 + _2414;
    float _2418 = fma(_2408, _2320, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2420 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2422 = isnan(_456);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = trunc(_2410);
    float _2434 = precise::max(_2432, 0.0);
    uint _2436 = uint(_2434);
    bool _2438 = !_2412;
    int _2440 = _2438 ? 0 : (-1);
    bool _2442 = _2276 > 0.5;
    bool _2444 = _2442 && _2240;
    float _2446 = fma(_2314, _2416, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2448 = _798 * (-0.15915493667125701904296875);
    int _2450 = ~_2376;
    int _2452 = _2450 + _2440;
    int _2454 = _2452 + 1;
    float _2456 = -_2402;
    float _2458 = _2456 + 1.0;
    if (_2240)
    {
        _2386 = _2292;
    }
    float _2460 = _2386;
    float _2462 = _2448 * 6.283185482025146484375;
    float _2464 = sin(_2462);
    bool _2466 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2468 = isnan(_456);
    bool _2470 = _2466 || _2468;
    bool _2472 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2474 = _2470 || _2472;
    float _2476 = float(_2474);
    float _2478 = _2430 * _2458;
    int _2480 = _2384 * int(_2436);
    int _2482 = _2480 + _2230;
    float _2484 = _2448 * 6.283185482025146484375;
    float _2486 = cos(_2484);
    float _2488 = _2460;
    if (_2444)
    {
        float _2490 = -_2460;
        float _2492 = _2490 + 1.0;
        _2488 = _2492;
    }
    float _2494 = _2488;
    float _2496 = float(uint(_2482));
    float _2498 = -_2430;
    float _2500 = _2498 + 1.0;
    if (_2240)
    {
        _2308 = _2494;
    }
    float _2502 = _2308;
    int _2504 = _742 * _2454;
    int _2506 = _2504 + _2256;
    float _2508 = fma(_2312, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2510 = as_type<float>(_2081) * _2496;
    float _2512 = _2476 * _2500;
    float _2514 = -_2476;
    float _2516 = _2514 + 1.0;
    float _2518 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2520 = _2464 * _2508;
    float _2522 = _2418 * _2512;
    float _2524 = trunc(_2510);
    float _2526 = precise::max(_2524, 0.0);
    uint _2528 = uint(_2526);
    bool _2530 = !_2055;
    int _2532 = _2530 ? _2506 : (-1);
    float _2534 = _2486 * _2508;
    float _2536 = fma(_2516, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2522);
    float _2538 = -_2520;
    float _2540 = fma(_2486, _2518, _2538);
    int _2542 = _2532 >> 31;
    float _2544 = fma(_2464, _2518, _2534);
    float _2546 = fma(_2446, _2478, _2536);
    float _2548 = fma(_808, _2540, _814);
    int _2550 = _2542 & 3;
    float _2552 = -_796;
    float _2554 = fma(_816, _2544, _2552);
    int _2556 = ~_742;
    int _2558 = _2556 + 1;
    float _2560 = abs(_1586);
    float _2562 = log2(_2560);
    int _2564 = _2532 + _2550;
    float _2566 = fma(_2402, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2546);
    float _2568 = _2548 + 0.5;
    int _2570 = int(_2436) + int(_2528);
    float _2572 = _2566 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2574 = _2564 >> 2;
    float _2576 = _2554 + 0.5;
    int _2578 = _2558 * _2570;
    int _2580 = _2578 + _2230;
    int _2582 = _2574 << 4;
    int _2584 = _2582 + 368;
    int _2586 = _2532 & 3;
    bool _2588 = _2586 != 0;
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2592 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2594 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    uint _2596 = uint(int(uint(_2584) >> uint(2)));
    uint _2598 = uint(int(uint(int(_2596)) >> uint(2)));
    int _2600 = int(_2596) & 3;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[int(_2598)][_2600];
    int _2604 = int(_2596) + 1;
    uint _2606 = uint(int(uint(_2604) >> uint(2)));
    int _2608 = _2604 & 3;
    float _2610 = (*spvDescriptorSet0.vp_c9)._m0[int(_2606)][_2608];
    bool _2612 = uint(_2580) >= uint(_742);
    float _2614 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2616 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2618 = exp2(_2594);
    bool _2620 = !_2612;
    int _2622 = _2620 ? 0 : (-1);
    out.m_89.x = _2568;
    out.m_89.y = _2576;
    int _2624 = _2584 + 8;
    uint _2626 = uint(int(uint(_2624) >> uint(2)));
    uint _2628 = uint(int(uint(int(_2626)) >> uint(2)));
    int _2630 = int(_2626) & 3;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[int(_2628)][_2630];
    int _2634 = int(_2626) + 1;
    uint _2636 = uint(int(uint(_2634) >> uint(2)));
    int _2638 = _2634 & 3;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[int(_2636)][_2638];
    bool _2642 = uint(_2586) > 1u;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2646 = _2532 & 3;
    bool _2648 = _2646 != 0;
    float _2650 = -_2024;
    float _2652 = _2650 + 1.0;
    float _2654 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2656 = _2648 ? 0 : 1;
    bool _2658 = _2586 != 3;
    out.m_91.x = _2654;
    out.m_91.y = _2614;
    out.m_91.z = _2616;
    out.m_91.w = _2572;
    float _2660 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2662 = precise::clamp(_2660, 0.0, 1.0);
    bool _2664 = uint(_2586) >= 2u;
    bool _2666 = !_2588;
    int _2668 = _2666 ? 0 : 1;
    float _2670 = fma(_2662, -2.0, 3.0);
    float _2672 = _2662 * _2662;
    bool _2674 = _2586 != 3;
    bool _2676 = _1586 <= 8000.0;
    bool _2678 = isnan(_1586);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan(8000.0);
    bool _2684 = _2680 || _2682;
    float _2686 = float(_2684);
    float _2688 = _2672 * _2670;
    int _2690 = ~_2570;
    int _2692 = _2690 + _2622;
    int _2694 = _2692 + 1;
    int _2696 = ~_2656;
    int _2698 = _2696 + 1;
    int _2700 = _2698 + 1;
    float _2702 = _1266 * _1220;
    int _2704 = _2700;
    if (!_2642)
    {
        int _2706 = ~_2656;
        int _2708 = _2706 + 1;
        _2704 = _2708;
    }
    int _2710 = _2704;
    int _2712 = _742 * _2694;
    int _2714 = _2712 + _2230;
    int _2716 = _2664 ? 0 : 1;
    int _2718 = abs(_2710);
    int _2720 = abs(_2668);
    float _2722 = -_2688;
    float _2724 = _2722 + 1.0;
    int _2726 = ~_2716;
    int _2728 = _2726 + 1;
    int _2730 = _2728 + 1;
    int _2732 = _2730;
    if (_2658)
    {
        int _2734 = ~_2716;
        int _2736 = _2734 + 1;
        _2732 = _2736;
    }
    int _2738 = _2732;
    float _2740 = fma(_2724, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2688);
    int _2742 = ~_2718;
    int _2744 = _2742 + 1;
    int _2746 = _2744 + 1;
    int _2748 = abs(_2738);
    int _2750 = ~_2720;
    int _2752 = _2750 + 1;
    int _2754 = _2752 + 1;
    int _2756 = _2746 * as_type<int>(_2610);
    float _2758 = _1242 * _1218;
    bool _2760 = !_2674;
    int _2762 = _2760 ? 0 : (-1);
    int _2764 = _2754 * as_type<int>(_2602);
    int _2766 = _2764 + _2756;
    int _2768 = ~_2748;
    int _2770 = _2768 + 1;
    int _2772 = _2770 + 1;
    float _2774 = _2686 * _2740;
    bool _2776 = !_2260;
    int _2778 = _2776 ? 0 : 1;
    float _2780 = _1276 * _1218;
    int _2782 = abs(_2762);
    int _2784 = _2772 * as_type<int>(_2632);
    int _2786 = _2784 + _2766;
    int _2788 = abs(_2778);
    float _2790 = _1242 * _1220;
    int _2792 = ~_2782;
    int _2794 = _2792 + 1;
    int _2796 = _2794 + 1;
    float _2798 = -_1224;
    float _2800 = fma(_2798, _1368, _2758);
    float _2802 = _1276 * _1220;
    float _2804 = _1276 * _1216;
    float _2806 = -_1224;
    float _2808 = fma(_2806, _1324, _2790);
    int _2810 = _2796 * as_type<int>(_2640);
    int _2812 = _2810 + _2786;
    float _2814 = -_1224;
    float _2816 = fma(_2814, _1318, _2079);
    int _2818 = ~_2788;
    int _2820 = _2818 + 1;
    int _2822 = _2820 + 1;
    float _2824 = _1266 * _1218;
    float _2826 = fma(_1240, _1368, _2780);
    float _2828 = fma(_1212, _706, _2800);
    float _2830 = fma(_1240, _1324, _2802);
    float _2832 = fma(_1240, _1318, _2804);
    float _2834 = _1266 * _1216;
    float _2836 = fma(_1214, _1324, _2702);
    float _2838 = fma(_1212, _594, _2808);
    float _2840 = fma(_1212, _598, _2816);
    bool _2842 = !_2055;
    int _2844 = _2842 ? _2714 : (-1);
    float _2846 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2848 = fma(_1214, _1368, _2824);
    int _2850 = _2812 * _2822;
    float _2852 = fma(_1256, _706, _2826);
    float _2854 = _2828 * _2370;
    float _2856 = fma(_1214, _1318, _2834);
    float _2858 = fma(_1256, _594, _2830);
    float _2860 = _2838 * _2370;
    float _2862 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2846);
    float _2864 = fma(_1278, _706, _2848);
    int _2866 = _2844 * _2788;
    int _2868 = _2866 + _2850;
    float _2870 = fma(_2852, _2374, _2854);
    float _2872 = fma(_1256, _598, _2832);
    float _2874 = fma(_1278, _598, _2856);
    float _2876 = fma(_2858, _2374, _2860);
    float _2878 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2880 = _2840 * _2370;
    float _2882 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2862);
    float _2884 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2886 = fma(_2864, _2390, _2870);
    float _2888 = float(_2868);
    float _2890 = in.m_67.x;
    float _2892 = _2652 * _2878;
    float _2894 = precise::clamp(_2892, 0.0, 1.0);
    float _2896 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2882);
    float _2898 = _2884 * _2026;
    float _2900 = fma(_1278, _594, _2836);
    float _2902 = _1950 * 0.5;
    out.m_93.x = _2888;
    float _2904 = -_2894;
    float _2906 = fma(_2904, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2908 = fma(_2872, _2374, _2880);
    float _2910 = _2896 + _1950;
    float _2912 = _1964 + _1950;
    float _2914 = _2037 * _2898;
    float _2916 = _2047 * _2898;
    float _2918 = fma(_2900, _2390, _2876);
    float _2920 = -_2884;
    float _2922 = _2920 + 1.0;
    float _2924 = fma(_1996, -0.5, _2902);
    float _2926 = _2910 * 0.5;
    float _2928 = _2912 * 0.5;
    float _2930 = fma(_2874, _2390, _2908);
    float _2932 = fma(_2043, _2914, _2031);
    float _2934 = fma(_2045, _2914, _2033);
    float _2936 = _2037 * _2922;
    float _2938 = fma(_2037, _2916, _2035);
    out.m_95.x = _2928;
    out.m_95.y = _2924;
    out.m_95.z = _2926;
    out.m_95.w = _1950;
    bool _2940 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2942 = isnan(_1742);
    bool _2944 = _2940 || _2942;
    bool _2946 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2948 = _2944 || _2946;
    float _2950 = _2906 * _2890;
    out.m_97.x = _2932;
    out.m_97.y = _2934;
    out.m_97.z = _2938;
    out.m_97.w = _2936;
    float _2952 = _2950 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2954 = _1642 * _1704;
    out.m_99.x = _2918;
    out.m_99.y = _2886;
    out.m_99.z = _2930;
    out.gl_Position.x = _1964;
    out.gl_Position.y = _1996;
    out.gl_Position.z = _2896;
    out.gl_Position.w = _1950;
    float _2956 = _2914;
    float _2958 = _2890;
    float _2960 = _2922;
    float _2962 = _2952;
    float _2964 = _2954;
    if (!_2948)
    {
        _2956 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2966 = _2956;
    out.m_101.x = _2952;
    float _2968 = _2966;
    float _2970 = _2966;
    if (!_2948)
    {
        _2958 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2972 = _2958;
    float _2974 = _2972;
    float _2976 = _2972;
    if (!_2948)
    {
        _2960 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2978 = _2960;
    float _2980 = _2978;
    float _2982 = _2978;
    if (!_2948)
    {
        _2962 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2984 = _2962;
    float _2986 = _2954 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2988 = _2984;
    float _2990 = _2984;
    if (!_2948)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2992 = _2272;
    float _2994 = _2992;
    float _2996 = _2992;
    if (!_2948)
    {
        _2964 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2998 = _2964;
    bool _3000 = !_2948;
    float _3002 = _2998;
    float _3004 = _2998;
    if (!_3000)
    {
        bool _3006 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3008 = isnan(_1742);
        bool _3010 = _3006 || _3008;
        bool _3012 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3014 = _3010 || _3012;
        if (!_3014)
        {
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3018 = _1742 + _3016;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3022 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3020;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3028 = 1.0 / _3022;
            float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3044 = _3042 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3046 = _3018 * _3028;
            float _3048 = precise::clamp(_3046, 0.0, 1.0);
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3054 = fma(_3048, _3026, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3056 = fma(_3048, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3058 = fma(_3048, _3032, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3060 = fma(_3048, _3036, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3062 = fma(_3048, _3040, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3064 = fma(_3048, _3044, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2996 = _3058;
            _2990 = _3062;
            _2970 = _3054;
            _2982 = _3060;
            _2976 = _3056;
            _3004 = _3064;
            _3066 = true;
        }
        else
        {
            bool _3068 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3070 = isnan(_1742);
            bool _3072 = _3068 || _3070;
            bool _3074 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3076 = _3072 || _3074;
            if (!_3076)
            {
                _2968 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3078 = _2968;
            _2970 = _3078;
            if (!_3076)
            {
                _2994 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3080 = _2994;
            _2996 = _3080;
            if (!_3076)
            {
                _2974 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3082 = _2974;
            _2976 = _3082;
            if (!_3076)
            {
                _2980 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3084 = _2980;
            _2982 = _3084;
            if (!_3076)
            {
                _2988 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3086 = _2988;
            _2990 = _3086;
            if (!_3076)
            {
                _3002 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3088 = _3002;
            bool _3090 = !_3076;
            _3004 = _3088;
            if (!_3090)
            {
                bool _3092 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3094 = isnan(_1742);
                bool _3096 = _3092 || _3094;
                bool _3098 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3100 = _3096 || _3098;
                if (!_3100)
                {
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3104 = _1742 + _3102;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3108 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3106;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3114 = 1.0 / _3108;
                    float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3122 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3130 = _3128 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3132 = _3104 * _3114;
                    float _3134 = precise::clamp(_3132, 0.0, 1.0);
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3140 = fma(_3134, _3112, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3142 = fma(_3134, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3144 = fma(_3134, _3118, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3146 = fma(_3134, _3122, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3148 = fma(_3134, _3126, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3150 = fma(_3134, _3130, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2996 = _3144;
                    _2990 = _3148;
                    _2970 = _3140;
                    _2982 = _3146;
                    _2976 = _3142;
                    _3004 = _3150;
                    _3066 = true;
                }
                else
                {
                    _2996 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2990 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2970 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2982 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2976 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3004 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3066 = false;
    float _3152 = _2996;
    float _3154 = _2990;
    float _3156 = _2970;
    float _3158 = _2982;
    float _3160 = _2976;
    float _3162 = _3004;
    float _3164 = fma(_2886, -0.5, 0.5);
    float _3166 = precise::clamp(_3164, 0.0, 1.0);
    float _3168 = -_3152;
    float _3170 = _3168 + _3154;
    float _3172 = _2986 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3174 = -_3156;
    float _3176 = _3174 + _3158;
    float _3178 = fma(_3166, _3170, _3152);
    out.m_103.x = 0.0;
    float _3180 = -_3160;
    float _3182 = _3180 + _3162;
    float _3184 = fma(_3166, _3176, _3156);
    float _3186 = _3178 * 0.586610972881317138671875;
    out.m_53.x = _3172;
    bool _3188 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3190 = fma(_3166, _3182, _3160);
    float _3192 = fma(_3184, 0.298911988735198974609375, _3186);
    bool _3194 = _1642 > 0.0;
    bool _3196 = isnan(_1642);
    bool _3198 = _3194 || _3196;
    bool _3200 = isnan(0.0);
    bool _3202 = _3198 || _3200;
    float _3204 = fma(_3190, 0.114477999508380889892578125, _3192);
    bool _3206 = _1704 <= 0.0;
    bool _3208 = !_3202;
    bool _3210 = _3206 || _3208;
    float _3212 = -_3204;
    float _3214 = _3184 + _3212;
    float _3216 = -_3204;
    float _3218 = _3178 + _3216;
    float _3220 = -_3204;
    float _3222 = _3190 + _3220;
    float _3224 = fma(_3214, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3204);
    float _3226 = fma(_3218, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3204);
    float _3228 = fma(_3222, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3204);
    bool _3230 = !_3188;
    if (!_3230)
    {
        float _3232 = -_1568;
        float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3236 = -_1570;
        float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3240 = -_1572;
        float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3244 = _3234 * _3234;
        float _3246 = fma(_3238, _3238, _3244);
        float _3248 = fma(_3242, _3242, _3246);
        float _3250 = sqrt(_3248);
        float _3252 = rsqrt(_3248);
        float _3254 = -_3250;
        float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3258 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3260 = precise::clamp(_3258, 0.0, 1.0);
        float _3262 = _3238 * _3252;
        float _3264 = _3234 * _3252;
        float _3266 = abs(_3260);
        float _3268 = log2(_3266);
        float _3270 = _3242 * _3252;
        float _3272 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3274 = _2886 * _3264;
        float _3276 = -_3264;
        float _3278 = -_3272;
        float _3280 = fma(_3276, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3278);
        float _3282 = fma(_2918, _3262, _3274);
        float _3284 = -_3270;
        float _3286 = fma(_3284, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3280);
        float _3288 = fma(_2930, _3270, _3282);
        float _3290 = precise::clamp(_3288, 0.0, 1.0);
        float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3294 = _3286 + _3292;
        float _3296 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3298 = _3294 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3300 = precise::clamp(_3298, 0.0, 1.0);
        float _3302 = exp2(_3296);
        float _3304 = _3302 * _3300;
        float _3306 = _3290 * _3304;
        float _3308 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3310 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3312 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3308;
        out.m_103.y = _3310;
        out.m_103.z = _3312;
    }
    out.m_77.x = _3224;
    out.m_77.y = _3226;
    out.m_77.z = _3228;
    if (!_3210)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3314 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3314;
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
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3066 = false;
    bool _322 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = in.m_48.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    float _138 = _128;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _134;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _142 = 0;
    if (!_132)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3383 = as_type<float>(_146);
        out.gl_Position.z = _3383;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _150 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_119);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = float(_124);
    bool _162 = _128 >= _160;
    bool _164 = !_158;
    bool _166 = _162 || _164;
    if (_166)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _136;
    if (_166)
    {
        out.m_53.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _148 = as_type<int>(_170);
    }
    int _172 = _148;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3438 = as_type<float>(_172);
        out.gl_Position.z = _3438;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = 1.0 / _160;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _128 * _174;
    bool _180 = !_176;
    float _182 = _178;
    float _200;
    if (!_180)
    {
        float _184 = in.m_55.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _178;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = 1.0 / _224;
    bool _228 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_204);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_220;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _248;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _254 = _238 * _242;
    float _256 = -_238;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = _208 * _226;
    float _266 = in.m_57.x;
    float _268 = in.m_57.y;
    float _270 = in.m_57.z;
    float _272 = fma(_246, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _274 = fma(_262, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _276 = fma(_250, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _278 = _272 * _254;
    float _280 = _274 * _254;
    float _282 = _276 * _254;
    float _284 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[143].x, _278);
    float _286 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[143].y, _280);
    float _288 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[143].z, _282);
    float _290 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _284);
    float _292 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _286);
    float _294 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].z, _288);
    float _296 = _290 * _266;
    float _298 = _292 * _268;
    float _300 = _294 * _270;
    bool _302 = !_252;
    float _320;
    if (!_302)
    {
        float _304 = in.m_55.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _178;
    }
    _322 = false;
    float _324 = _320;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _328 = _324 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _334 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _336 = isnan(_324);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _350 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _352 = isnan(_324);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _362;
    bool _366 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _368 = isnan(_324);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = 1.0 / _332;
    float _380 = -_344;
    float _382 = _380 + 1.0;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _386 = _360 * _382;
    float _388 = -_360;
    float _390 = _388 + 1.0;
    float _392 = 1.0 / _348;
    float _394 = _364 * _378;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _400 = fma(_394, _328, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _402 = -_376;
    float _404 = _402 + 1.0;
    float _406 = _400 * _386;
    float _408 = _398 * _392;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _412 = _324 + _410;
    float _414 = _344 * _404;
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[115].x, _406);
    float _418 = fma(_408, _412, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _420 = fma(_418, _414, _416);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _428 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[117].x, _420);
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _430;
    out.m_59.y = _432;
    out.m_59.z = _434;
    out.m_59.w = _436;
    bool _438 = !_384;
    if (!_438)
    {
        float _440 = in.m_55.x;
        float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _444 = _440 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _448 = _446 * _442;
        float _450 = floor(_448);
        float _452 = -_450;
        float _454 = _448 + _452;
        _182 = _454;
    }
    float _456 = _182;
    float _458 = in.m_46.x;
    float _460 = in.m_46.y;
    float _462 = in.m_46.z;
    float _464 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _466 = in.m_61.x;
    float _468 = in.m_61.y;
    float _470 = in.m_61.z;
    float _472 = in.m_61.w;
    float _474 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _476 = in.m_63.x;
    float _478 = in.m_63.y;
    float _480 = in.m_63.z;
    float _482 = in.m_63.w;
    float _484 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _486 = in.m_65.x;
    float _488 = in.m_65.y;
    float _490 = in.m_65.z;
    float _492 = in.m_65.w;
    float _494 = in.m_67.y;
    float _496 = in.m_55.x;
    float _498 = in.m_55.y;
    float _500 = in.m_55.z;
    float _502 = _460 * _468;
    float _504 = _460 * _478;
    float _506 = fma(_458, _466, _502);
    float _508 = _460 * _488;
    float _510 = fma(_458, _476, _504);
    float _512 = fma(_462, _470, _506);
    float _514 = _460 + _494;
    float _516 = fma(_458, _486, _508);
    float _518 = fma(_462, _480, _510);
    float _520 = _512 + _472;
    float _522 = -_514;
    float _524 = _522 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _528 = _518 + _482;
    float _530 = -_520;
    float _532 = _530 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _534 = _524 * _524;
    float _536 = -_528;
    float _538 = _536 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _540 = fma(_532, _532, _534);
    float _542 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _544 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _546 = fma(_538, _538, _540);
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _550 = -_542;
    float _552 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _550);
    float _554 = -_544;
    float _556 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _554);
    float _558 = rsqrt(_546);
    float _560 = -_548;
    float _562 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _560);
    float _564 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _566 = _498 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _568 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _570 = -_564;
    float _572 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _570);
    float _574 = fma(_566, -2.0, _526);
    float _576 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _578 = log2(_576);
    float _580 = _496 * 2.0;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _584 = fma(_462, _490, _516);
    float _586 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _588 = -_582;
    float _590 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[77].x, _588);
    float _592 = _498 + _496;
    float _594 = _532 * _558;
    float _596 = floor(_580);
    float _598 = _538 * _558;
    float _600 = -_586;
    float _602 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _600);
    float _604 = _594 * _594;
    float _606 = -_568;
    float _608 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _606);
    float _610 = _498 * 2.0;
    float _612 = _592 + (-1.0);
    float _614 = fma(_598, _598, _604);
    float _616 = _578 * _128;
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _620 = int(_618);
    float _622 = _562 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _624 = _498 + _500;
    float _626 = _584 + _492;
    float _628 = -_622;
    float _630 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[1].x, _628);
    float _632 = _624 + (-1.0);
    bool _634 = _596 > 0.0;
    float _636 = rsqrt(_614);
    bool _638 = _596 >= 0.0;
    bool _640 = isnan(_596);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _650 = _556 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _652 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[1].w, _630);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _664 = _662 != 0;
    float _666 = -_650;
    float _668 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[1].y, _666);
    float _670 = floor(_610);
    float _672 = float(_620);
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _676 = _626 + _674;
    float _678 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[1].w, _668);
    bool _680 = !_660;
    int _682 = _680 ? 0 : 1;
    bool _684 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _692 = _688 || _690;
    float _694 = exp2(_616);
    float _696 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _698 = _652 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _700 = _598 * _636;
    float _702 = -_698;
    float _704 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[0].x, _702);
    float _706 = _524 * _558;
    bool _708 = _670 > 0.0;
    float _710 = 1.0 / _672;
    bool _712 = _670 >= 0.0;
    bool _714 = isnan(_670);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.0);
    bool _720 = _716 || _718;
    float _722 = _594 * _636;
    float _724 = -_700;
    float _726 = _598 * _724;
    float _728 = -_700;
    float _730 = _706 * _728;
    bool _732 = !_656;
    int _734 = _732 ? 0 : 1;
    float _736 = -_694;
    float _738 = _736 + 1.0;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = -_726;
    float _746 = fma(_594, _722, _744);
    bool _748 = !_664;
    int _750 = _748 ? 0 : 1;
    float _752 = _692 ? _738 : 0.0;
    float _754 = _706 * _722;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _758 = 1.0 + _756;
    float _760 = _746 * _746;
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = _710 * _128;
    float _774 = 1.0 / _758;
    float _776 = fma(_754, _754, _760);
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _782 = _500 * 2.0;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _786 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[79].z, _778);
    float _788 = _562 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = float(_742);
    float _792 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[78].z, _780);
    float _794 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[78].w, _784);
    float _796 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _574);
    float _798 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _786);
    float _800 = -_788;
    float _802 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[1].x, _800);
    float _804 = _602 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _806 = floor(_782);
    float _808 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _792);
    float _810 = _790 * _128;
    float _812 = -_128;
    float _814 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    float _816 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _794);
    float _818 = _528;
    if (_770)
    {
        float _820 = _752 * _774;
        _138 = _820;
    }
    float _822 = _138;
    float _824 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[1].w, _802);
    float _826 = -_804;
    float _828 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[1].x, _826);
    float _830 = fma(_730, _730, _776);
    float _832 = _556 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _704);
    float _836 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[1].z, _828);
    float _838 = rsqrt(_830);
    float _840 = _562 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _842 = -_832;
    float _844 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[0].y, _842);
    float _846 = -_836;
    float _848 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[0].w, _834);
    bool _850 = _806 >= 0.0;
    bool _852 = isnan(_806);
    bool _854 = _850 || _852;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    float _860 = -_840;
    float _862 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[0].x, _860);
    float _864 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[0].w, _844);
    int _866 = _646 ? 0 : 1;
    float _868 = _562 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _870 = 1.0 / _848;
    int _872 = _858 ? 0 : 1;
    float _874 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[0].w, _862);
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _886 = _884 != 0;
    float _888 = -_868;
    float _890 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[0].x, _888);
    bool _892 = _806 > 0.0;
    float _894 = _676 * _676;
    float _896 = _746 * _838;
    float _898 = precise::clamp(_896, 0.0, 1.0);
    int _900 = ~_866;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    float _906 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[0].w, _890);
    int _908 = ~_872;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = -_898;
    float _916 = _914 + 1.0;
    int _918 = _904;
    int _920 = _912;
    if (!_634)
    {
        int _922 = ~_866;
        int _924 = _922 + 1;
        _918 = _924;
    }
    int _926 = _918;
    int _928 = _720 ? 0 : 1;
    float _930 = fma(_874, _870, -1.0);
    float _932 = _916 * _870;
    if (!_892)
    {
        int _934 = ~_872;
        int _936 = _934 + 1;
        _920 = _936;
    }
    int _938 = _920;
    bool _940 = !_878;
    int _942 = _940 ? 0 : 1;
    float _944 = fma(_916, _930, 1.0);
    float _946 = _906 * _932;
    float _948 = _864 * _932;
    int _950 = abs(_942);
    float _952 = _944 * _944;
    float _954 = in.m_69.x;
    float _956 = in.m_69.y;
    float _958 = in.m_69.z;
    float _960 = float(_938);
    float _962 = fma(_948, _948, _952);
    float _964 = float(_950);
    int _966 = ~_928;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = fma(_946, _946, _962);
    int _974 = _970;
    if (!_708)
    {
        int _976 = ~_928;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = _964 * _960;
    bool _984 = !_882;
    int _986 = _984 ? 0 : 1;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _990 = _520 + _988;
    float _992 = float(_926);
    float _994 = rsqrt(_972);
    float _996 = _982 * (-2.0);
    float _998 = _496 + (-0.5);
    int _1000 = abs(_986);
    float _1002 = fma(_990, _990, _894);
    float _1004 = float(_1000);
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1008 = _528 + _1006;
    float _1010 = fma(_996, _954, _954);
    float _1012 = fma(_648, _996, _648);
    float _1014 = _1004 * _992;
    float _1016 = fma(_1008, _1008, _1002);
    float _1018 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1010);
    float _1020 = _946 * _994;
    float _1022 = _944 * _994;
    float _1024 = _948 * _994;
    float _1026 = fma(_1012, _822, _1018);
    float _1028 = -_1020;
    float _1030 = _594 * _1028;
    float _1032 = _598 * _1022;
    float _1034 = -_1024;
    float _1036 = _706 * _1034;
    float _1038 = sqrt(_1016);
    float _1040 = -_1024;
    float _1042 = -_1030;
    float _1044 = fma(_598, _1040, _1042);
    float _1046 = -_1020;
    float _1048 = -_1032;
    float _1050 = fma(_706, _1046, _1048);
    float _1052 = -_1036;
    float _1054 = fma(_594, _1022, _1052);
    bool _1056 = !_886;
    int _1058 = _1056 ? 0 : 1;
    float _1060 = _1044 * _1044;
    float _1062 = _1014 * (-2.0);
    float _1064 = _464 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1066 = abs(_1058);
    float _1068 = fma(_1050, _1050, _1060);
    float _1070 = fma(_696, _1062, _696);
    float _1072 = fma(_1062, _956, _956);
    float _1074 = fma(_1054, _1054, _1068);
    float _1076 = _498 + (-0.5);
    float _1078 = float(_980);
    float _1080 = rsqrt(_1016);
    float _1082 = float(_1066);
    float _1084 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1072);
    float _1086 = _500 + _496;
    float _1088 = _1038 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1090 = _500 + (-0.5);
    float _1092 = _1082 * _1078;
    float _1094 = rsqrt(_1074);
    float _1096 = _1086 + (-1.0);
    float _1098 = _1092 * (-2.0);
    float _1100 = _1026 * 0.15915493667125701904296875;
    float _1102 = precise::min(_1064, _1088);
    float _1104 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1106 = fma(_1098, _958, _958);
    float _1108 = fma(_1070, _822, _1084);
    float _1110 = _1100 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = fma(_1104, _1098, _1104);
    float _1116 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1106);
    float _1118 = _1108 * 0.15915493667125701904296875;
    float _1120 = fma(_1114, _822, _1116);
    float _1122 = _1050 * _1094;
    float _1124 = _1054 * _1094;
    float _1126 = _1044 * _1094;
    float _1128 = _1100 * 6.283185482025146484375;
    float _1130 = cos(_1128);
    float _1132 = _598 * _1122;
    float _1134 = _1120 * 0.15915493667125701904296875;
    float _1136 = _594 * _1126;
    float _1138 = -_1132;
    float _1140 = fma(_594, _1124, _1138);
    float _1142 = _706 * _1124;
    float _1144 = -_1136;
    float _1146 = fma(_706, _1122, _1144);
    float _1148 = _1118 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1080 * _1102;
    float _1154 = -_1142;
    float _1156 = fma(_598, _1126, _1154);
    float _1158 = _1140 * _1140;
    float _1160 = _676 * _1152;
    float _1162 = _990 * _1152;
    float _1164 = fma(_1156, _1156, _1158);
    float _1166 = _1118 * 6.283185482025146484375;
    float _1168 = cos(_1166);
    float _1170 = -_1160;
    float _1172 = _676 + _1170;
    float _1174 = -_1162;
    float _1176 = _990 + _1174;
    float _1178 = fma(_1146, _1146, _1164);
    float _1180 = _1172 * _1172;
    float _1182 = _1008 * _1152;
    float _1184 = _1134 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = fma(_1176, _1176, _1180);
    float _1190 = -_1182;
    float _1192 = _1008 + _1190;
    float _1194 = _1112 * _1150;
    float _1196 = _1130 * _1150;
    float _1198 = fma(_1192, _1192, _1188);
    float _1200 = rsqrt(_1178);
    float _1202 = in.m_71.x;
    float _1204 = in.m_71.y;
    float _1206 = in.m_71.z;
    float _1208 = _1112 * _1168;
    float _1210 = sqrt(_1198);
    float _1212 = _1112 * _1186;
    float _1214 = _1150 * _1186;
    float _1216 = _1146 * _1200;
    float _1218 = _1140 * _1200;
    float _1220 = _1156 * _1200;
    float _1222 = _1134 * 6.283185482025146484375;
    float _1224 = sin(_1222);
    float _1226 = _594 * _1216;
    float _1228 = _1080 * _1210;
    float _1230 = _598 * _1218;
    float _1232 = -_1226;
    float _1234 = fma(_598, _1220, _1232);
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1204);
    float _1238 = _1130 * _1168;
    float _1240 = _1168 * _1186;
    float _1242 = _1130 * _1186;
    float _1244 = -_1230;
    float _1246 = fma(_706, _1216, _1244);
    float _1248 = _706 * _1220;
    float _1250 = _1234 * _1234;
    float _1252 = _474 * _1228;
    float _1254 = -_1196;
    float _1256 = fma(_1224, _1208, _1254);
    float _1258 = -_1248;
    float _1260 = fma(_594, _1218, _1258);
    float _1262 = fma(_1246, _1246, _1250);
    float _1264 = -_1208;
    float _1266 = fma(_1224, _1196, _1264);
    float _1268 = _1252 * _1236;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1202);
    float _1272 = fma(_1260, _1260, _1262);
    float _1274 = _464 * _1228;
    float _1276 = fma(_1224, _1238, _1194);
    float _1278 = fma(_1224, _1194, _1238);
    float _1280 = rsqrt(_1272);
    float _1282 = _484 * _1228;
    float _1284 = _1274 * _1270;
    float _1286 = _1242 * _1268;
    float _1288 = -_1268;
    float _1290 = _1224 * _1288;
    float _1292 = _1212 * _1268;
    float _1294 = _1282 * _1206;
    float _1296 = fma(_1276, _1284, _1286);
    float _1298 = fma(_1240, _1284, _1290);
    float _1300 = fma(_1256, _1284, _1292);
    float _1302 = -_1162;
    float _1304 = _520 + _1302;
    float _1306 = fma(_1266, _1294, _1296);
    float _1308 = fma(_1214, _1294, _1298);
    float _1310 = -_1160;
    float _1312 = _1310 + _514;
    float _1314 = fma(_1278, _1294, _1300);
    float _1316 = _1216 * _1306;
    float _1318 = _1260 * _1280;
    float _1320 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1322 = _1220 * _1306;
    float _1324 = _1246 * _1280;
    float _1326 = fma(_1318, _1308, _1316);
    float _1328 = -_1182;
    float _1330 = _528 + _1328;
    float _1332 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1320);
    float _1334 = fma(_1324, _1308, _1322);
    float _1336 = fma(_598, _1314, _1326);
    float _1338 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1340 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1332);
    float _1342 = fma(_594, _1314, _1334);
    float _1344 = _528 + _1336;
    float _1346 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1338);
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1350 = _520 + _1342;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1354 = _1344 + _1352;
    float _1356 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1346);
    float _1358 = 1.0 / _1348;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1362 = _1350 + _1360;
    float _1364 = _1354 * _1354;
    float _1366 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1368 = _1234 * _1280;
    float _1370 = _1218 * _1306;
    float _1372 = fma(_1362, _1362, _1364);
    float _1374 = _1366 + _1348;
    float _1376 = fma(_1368, _1308, _1370);
    float _1378 = sqrt(_1372);
    float _1380 = fma(_706, _1314, _1376);
    bool _1382 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(0.5);
    bool _1390 = _1386 || _1388;
    float _1392 = _1374 * _1358;
    float _1394 = _1392 * 0.5;
    float _1396 = _514 + _1380;
    bool _1398 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.5);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1410 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1408);
    float _1412 = 1.0 / _1410;
    bool _1414 = _1378 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1418 = _1314;
    float _1420 = _1344;
    float _1422 = _1372;
    float _1424 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1426 = _1378;
    float _1428 = _1348;
    if (!_1414)
    {
        _1416 = _1350;
    }
    float _1430 = _1416;
    float _1432 = _1430;
    if (!_1414)
    {
        _1418 = _1396;
    }
    float _1434 = _1418;
    bool _1436 = !_1414;
    float _1438 = _1434;
    if (!_1436)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1378 + _1442;
        float _1446 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = rsqrt(_1372);
        float _1450 = _1444 * _1440;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 + (-1.0);
        float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = fma(_1460, _1446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = fma(_1396, _1456, _1464);
        float _1470 = _1448 * _1466;
        float _1472 = fma(_1362, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1354, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1438 = _1468;
        _1432 = _1472;
        _1420 = _1474;
        _1422 = _1448;
        _1424 = _1470;
        _1426 = _1452;
    }
    float _1476 = _1438;
    float _1478 = _1432;
    float _1480 = _1420;
    float _1482 = _1422;
    float _1484 = _1424;
    float _1486 = _1426;
    float _1488 = -_1160;
    float _1490 = _1488 + _1476;
    float _1492 = -_1162;
    float _1494 = _1492 + _1478;
    float _1496 = -_1182;
    float _1498 = _1496 + _1480;
    float _1500 = _1486;
    float _1502 = _1490;
    float _1504 = _1494;
    float _1506 = _1498;
    float _1508 = _1482;
    float _1510 = _1484;
    float _1512 = _1476;
    if (_1390)
    {
        _1500 = 1.0;
    }
    float _1514 = _1500;
    float _1516 = _1514;
    if (!_1406)
    {
        float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1520 = _1312 + _1518;
        float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1524 = _1304 + _1522;
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1528 = -_528;
        float _1530 = _1528 + _1480;
        float _1532 = _1520 * _1520;
        float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1536 = _1330 + _1534;
        float _1538 = fma(_1524, _1524, _1532);
        float _1540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1542 = fma(_1536, _1536, _1538);
        float _1544 = sqrt(_1542);
        float _1546 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1548 = precise::min(_1544, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1550 = _1548 * _1540;
        float _1552 = -_520;
        float _1554 = _1552 + _1478;
        float _1556 = -_514;
        float _1558 = _1556 + _1476;
        float _1560 = _1546 * _1550;
        float _1562 = fma(_1554, _1560, _1304);
        float _1564 = fma(_1558, _1560, _1312);
        float _1566 = fma(_1530, _1560, _1330);
        _1502 = _1564;
        _1504 = _1562;
        _1506 = _1566;
        _1508 = _1540;
        _818 = _1530;
    }
    float _1568 = _1502;
    float _1570 = _1504;
    float _1572 = _1506;
    float _1574 = _1508;
    float _1576 = _818;
    float _1578 = _1574;
    float _1580 = _1576;
    if (_1390)
    {
        _1428 = 1.0;
    }
    float _1582 = _1428;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1586 = _1412 * _1584;
    float _1588 = _1582;
    if (!_1390)
    {
        float _1590 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1592;
        float _1596 = _1590 * 0.15915493667125701904296875;
        float _1598 = _1596 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = _1596 * 6.283185482025146484375;
        float _1608 = sin(_1606);
        float _1610 = 1.0 / _1600;
        float _1612 = _1604 * 6.283185482025146484375;
        float _1614 = cos(_1612);
        float _1616 = _1608 * _1610;
        float _1618 = _1604 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        float _1622 = _1614 * _1616;
        float _1624 = 1.0 / _1594;
        float _1626 = 1.0 / _1622;
        float _1628 = _1620 * _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1632 = fma(_1586, _1628, _1630);
        float _1634 = _1632 * _1624;
        float _1636 = precise::clamp(_1634, 0.0, 1.0);
        _1578 = _1596;
        _1580 = _1594;
        _1516 = _1636;
    }
    float _1638 = _1578;
    float _1640 = _1580;
    float _1642 = _1516;
    float _1644 = _1638;
    float _1646 = _1640;
    if (!_1390)
    {
        float _1648 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1650 = _1648 * 0.15915493667125701904296875;
        float _1652 = _1650 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1658 = _1656 * 0.15915493667125701904296875;
        float _1660 = _1650 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        float _1664 = 1.0 / _1654;
        float _1666 = _1658 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        float _1670 = _1662 * _1664;
        float _1672 = _1658 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        float _1676 = _1668 * _1670;
        float _1678 = 1.0 / _1676;
        float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1682 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1680;
        float _1684 = 1.0 / _1682;
        float _1686 = _1674 * _1678;
        float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1690 = fma(_1586, _1686, _1688);
        float _1692 = _1690 * _1684;
        float _1694 = precise::clamp(_1692, 0.0, 1.0);
        float _1696 = -_1694;
        float _1698 = _1696 + 1.0;
        _1644 = _1676;
        _1646 = _1686;
        _1588 = _1698;
    }
    float _1700 = _1644;
    float _1702 = _1646;
    float _1704 = _1588;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1708 = _1568 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1570 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1572 + _1714;
    float _1718 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = _1708 * _1708;
    float _1722 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1726 = fma(_1712, _1712, _1720);
    float _1728 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1730 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1724);
    float _1732 = fma(_1716, _1716, _1726);
    float _1734 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1728);
    float _1736 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1738 = rsqrt(_1732);
    float _1740 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1742 = sqrt(_1732);
    float _1744 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1746 = _1712 * _1744;
    float _1748 = _1716 * _1744;
    float _1750 = _1746 * _1746;
    float _1752 = _1748 * _1748;
    float _1754 = _1750 + _1752;
    float _1756 = sqrt(_1754);
    bool _1758 = _1756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = _1756 + _1760;
    float _1764 = _1700;
    float _1766 = _1754;
    float _1768 = _1762;
    float _1770 = _1708;
    float _1772 = _1746;
    float _1774 = _1748;
    float _1776 = _1750;
    if (_1758)
    {
        float _1778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1778;
    }
    float _1780 = _1764;
    if (_1758)
    {
        float _1782 = rsqrt(_1754);
        _1766 = _1782;
    }
    float _1784 = _1766;
    if (_1758)
    {
        float _1786 = _1762 * _1780;
        _1768 = _1786;
    }
    float _1788 = _1768;
    if (_1758)
    {
        float _1790 = _1788 * 0.15915493667125701904296875;
        _1510 = _1790;
    }
    float _1792 = _1510;
    float _1794 = _1702;
    float _1796 = _1792;
    if (_1758)
    {
        float _1798 = _1792 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        _1794 = _1800;
    }
    float _1802 = _1794;
    float _1804 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1806 = precise::max(0.0, _1804);
    float _1808 = _1780;
    if (_1758)
    {
        float _1810 = _1792 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = -_1744;
    float _1818 = -_1806;
    float _1820 = fma(_1708, _1816, _1818);
    if (_1758)
    {
        float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _1822;
    }
    float _1824 = _1770;
    float _1826 = fma(_1304, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1828 = _1802;
    if (_1758)
    {
        float _1830 = fma(_1802, _1824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1828 = _1830;
    }
    float _1832 = _1828;
    float _1834 = floor(_1826);
    float _1836 = _1832;
    float _1838 = _1814;
    if (_1758)
    {
        float _1840 = _1814 + (-1.0);
        _1512 = _1840;
    }
    float _1842 = _1512;
    float _1844 = _1842;
    if (_1758)
    {
        float _1846 = _1784 * _1832;
        _1796 = _1846;
    }
    float _1848 = _1796;
    if (!_1758)
    {
        _1836 = _1820;
    }
    float _1850 = _1836;
    float _1852 = _1850;
    if (_1758)
    {
        float _1854 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1844 = _1854;
    }
    float _1856 = _1844;
    if (_1758)
    {
        float _1858 = _1746 * _1848;
        _1772 = _1858;
    }
    float _1860 = _1772;
    if (_1758)
    {
        float _1862 = _1748 * _1848;
        _1774 = _1862;
    }
    float _1864 = _1774;
    if (_1758)
    {
        float _1866 = fma(_1820, _1814, _1856);
        _1852 = _1866;
    }
    float _1868 = _1852;
    if (_1758)
    {
        float _1870 = _1860 * _1860;
        _1776 = _1870;
    }
    float _1872 = _1776;
    if (!_1758)
    {
        _1838 = _1752;
    }
    float _1874 = _1838;
    float _1876 = _1874;
    if (_1758)
    {
        float _1878 = _1864 * _1864;
        _1876 = _1878;
    }
    float _1880 = _1876;
    float _1882 = fma(_1868, _1868, _1872);
    float _1884 = -_1834;
    float _1886 = _1826 + _1884;
    float _1888 = _1882 + _1880;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1892 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1894 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1896 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1900 = fma(_1742, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1898);
    float _1902 = precise::clamp(_1900, 0.0, 1.0);
    float _1904 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1892);
    float _1906 = rsqrt(_1888);
    float _1908 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1896);
    float _1910 = -_1902;
    float _1912 = _1910 + 1.0;
    float _1914 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1904);
    float _1916 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1918 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1920 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = abs(_1912);
    float _1926 = log2(_1924);
    float _1928 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1930 = -_1920;
    float _1932 = fma(_1930, _1890, 1.0);
    float _1934 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1936 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1928);
    float _1938 = _1906 * _1860;
    float _1940 = _1906 * _1864;
    float _1942 = floor(_1894);
    float _1944 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1936);
    float _1946 = _1906 * _1868;
    float _1948 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1934);
    float _1950 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1944);
    float _1952 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1954 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1948);
    float _1956 = log2(_1932);
    float _1958 = -_1952;
    float _1960 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1958);
    float _1962 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1964 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1954);
    float _1966 = -_1940;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1960);
    float _1970 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1972 = 1.0 / _1950;
    float _1974 = -_1942;
    float _1976 = _1894 + _1974;
    float _1978 = fma(_1968, -0.5, 0.5);
    float _1980 = fma(_1968, 0.5, 0.5);
    float _1982 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1970);
    float _1984 = _1946 + 1.0;
    float _1986 = fma(_1980, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1988 = exp2(_1962);
    float _1990 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1982);
    float _1992 = _1956 * 0.693147182464599609375;
    float _1994 = fma(_1980, _1986, -0.212114393711090087890625);
    float _1996 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1990);
    float _1998 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1980, _1994, 1.570728778839111328125);
    float _2002 = sqrt(_1978);
    float _2004 = -_1946;
    float _2006 = fma(_1988, _1984, _2004);
    float _2008 = _1964 * _1972;
    float _2010 = _1996 * _1972;
    float _2012 = fma(_2006, 0.5, 0.5);
    float _2014 = fma(_2010, -0.5, 0.5);
    float _2016 = _2002 * 0.636619746685028076171875;
    float _2018 = fma(_2008, 0.5, 0.5);
    float _2020 = -_2000;
    float _2022 = fma(_2016, _2020, 1.0);
    float2 _6295 = float2(_1886, _1976);
    float _2024 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6295, float2(0.0), isnan(_6295)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6295, float2(0.0), isnan(_6295)), level(0.0)).x;
    float3 _6306 = float3(_2018, _2014, _1998);
    float _2026 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6306, float3(0.0), isnan(_6306)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6306, float3(0.0), isnan(_6306)), level(0.0)).x;
    float3 _6317 = float3(_2018, _2014, _1998);
    float4 _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6317, float3(0.0), isnan(_6317)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6317, float3(0.0), isnan(_6317)), level(0.0)).xyzw;
    float _2031 = _2029.x;
    float _2033 = _2029.y;
    float _2035 = _2029.z;
    float _2037 = _2029.w;
    float2 _6333 = float2(_2022, _2012);
    float3 _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6333, float2(0.0), isnan(_6333)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6333, float2(0.0), isnan(_6333)), level(0.0)).xyz;
    float _2043 = _2041.x;
    float _2045 = _2041.y;
    float _2047 = _2041.z;
    float _2049 = float(uint(_742));
    float _2051 = trunc(_772);
    int _2053 = int(_2051);
    bool _2055 = _742 == 0;
    float _2057 = _810 * _174;
    int _2059 = abs(_750);
    out.m_73.x = _1304;
    out.m_73.y = _1312;
    out.m_73.z = _1330;
    int _2061 = ~_742;
    int _2063 = _2061 + 1;
    float _2065 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2067 = 1.0 / _2049;
    out.m_75.x = _1274;
    out.m_77.w = _1102;
    float _2069 = float(uint(_2053));
    float _2071 = trunc(_2057);
    int _2073 = int(_2071);
    int _2075 = ~_742;
    int _2077 = _2075 + 1;
    float _2079 = _1242 * _1216;
    out.m_79.x = _1570;
    out.m_79.y = _1568;
    out.m_79.z = _1572;
    int _2081 = as_type<int>(_2067) + (-2);
    float _2083 = exp2(_2065);
    float _2085 = as_type<float>(_2081) * _2069;
    float _2087 = trunc(_2085);
    float _2089 = precise::max(_2087, 0.0);
    uint _2092 = uint(_2089);
    int _2094 = ~_742;
    int _2096 = _2094 + 1;
    float _2098 = -_2083;
    float _2100 = _2098 + 1.0;
    int _2102 = _2077 * int(_2092);
    int _2104 = _2102 + _2053;
    float _2106 = float(uint(_2104));
    float _2108 = as_type<float>(_2081) * _2106;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2112 = _2110 != 0;
    float _2114 = float(_2053);
    float _2116 = trunc(_2108);
    float _2118 = precise::max(_2116, 0.0);
    uint _2120 = uint(_2118);
    bool _2122 = !_2112;
    float _2124 = _2122 ? 7.345489978790283203125 : 1.0;
    bool _2126 = _2114 >= _790;
    bool _2128 = isnan(_2114);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan(_790);
    bool _2134 = _2130 || _2132;
    float _2136 = float(_2134);
    float _2138 = _2124 * _496;
    float _2140 = trunc(_2136);
    int _2142 = int(_2140);
    int _2144 = int(_2092) + int(_2120);
    float _2146 = floor(_2138);
    int _2148 = _2096 * _2144;
    int _2150 = _2148 + _2053;
    bool _2152 = uint(_2150) >= uint(_742);
    bool _2154 = !_2152;
    int _2156 = _2154 ? 0 : (-1);
    float _2158 = -_2146;
    float _2160 = _2138 + _2158;
    int _2162 = ~_2144;
    int _2164 = _2162 + _2156;
    int _2166 = _2164 + 1;
    float _2168 = _2160 * _790;
    int _2170 = _742 * _2166;
    int _2172 = _2170 + _2053;
    int _2174 = ~_2142;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = trunc(_2168);
    int _2182 = int(_2180);
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2186 = _2184 != 0;
    bool _2188 = !_2055;
    int _2190 = _2188 ? _2172 : (-1);
    int _2192 = _742 + (-1);
    bool _2194 = !_2186;
    int _2196 = _2194 ? 0 : 1;
    int _2198 = _2190 * _2178;
    int _2200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2202 = _2200 != 0;
    float _2204 = in.m_81.y;
    int _2206 = abs(_682);
    int _2208 = _2142 * _2192;
    int _2210 = _2208 + _2198;
    int _2212 = abs(_734);
    float _2214 = in.m_81.w;
    bool _2216 = !_2202;
    int _2218 = _2216 ? 0 : 1;
    int _2220 = abs(_2196);
    int _2222 = _2210 * _2206;
    float _2224 = in.m_81.z;
    int _2226 = abs(_2218);
    int _2228 = _2182 * _2220;
    int _2230 = _2228 + _2053;
    int _2232 = _2073 * _2212;
    int _2234 = _2232 + _2222;
    float _2236 = in.m_81.x;
    int _2238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2240 = _2238 != 0;
    int _2242 = _2230 * _2059;
    int _2244 = _2242 + _2234;
    int _2246 = ~_742;
    int _2248 = _2246 + 1;
    int _2250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2252 = _2250 != 0;
    int _2254 = _2182 * _2226;
    int _2256 = _2254 + _2244;
    out.m_83.y = _2204;
    int _2258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2260 = _2258 != 0;
    float _2262 = float(uint(_2256));
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2266 = _2264 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2268 = _498 > 0.5;
    float _2270 = as_type<float>(_2234);
    float _2272 = _1964;
    if (_2240)
    {
        float _2274 = in.m_55.x;
        _2270 = _2274;
    }
    float _2276 = _2270;
    float _2278 = as_type<float>(_2081) * _2262;
    float _2280 = float(uint(_2230));
    float _2282 = in.m_85.y;
    float _2284 = 1.0 / _2266;
    out.m_83.w = _2214;
    out.m_83.x = _2236;
    float _2286 = trunc(_2278);
    float _2288 = precise::max(_2286, 0.0);
    uint _2290 = uint(_2288);
    float _2292 = in.m_85.x;
    out.m_83.z = _2224;
    float _2294 = -_2282;
    float _2296 = _2294 + 1.0;
    int _2298 = _2248 * int(_2290);
    int _2300 = _2298 + _2256;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2306 = _2282;
    float _2308 = _2292;
    if (_2252)
    {
        float _2310 = _2268 ? _2296 : _2282;
        _2306 = _2310;
    }
    float _2312 = _2306;
    float _2314 = _2304 * _2284;
    float _2316 = float(uint(_2300));
    float _2318 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2320 = _456 + _2318;
    float _2322 = in.m_87.x;
    float _2324 = in.m_87.y;
    float _2326 = in.m_87.z;
    bool _2328 = _1204 != 0.0;
    bool _2330 = isnan(_1204);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan(0.0);
    bool _2336 = _2332 || _2334;
    float _2338 = as_type<float>(_2081) * _2316;
    bool _2340 = _1202 == 0.0;
    bool _2342 = !_2336;
    bool _2344 = _2340 && _2342;
    float _2346 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2348 = _2346 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2350 = trunc(_2338);
    float _2352 = precise::max(_2350, 0.0);
    uint _2354 = uint(_2352);
    bool _2356 = _1206 == 0.0;
    bool _2358 = _2356 && _2344;
    float _2360 = 1.0 / _2348;
    float _2362 = _2324;
    float _2364 = _2322;
    float _2366 = _2326;
    if (!_2358)
    {
        float _2368 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2324);
        _2362 = _2368;
    }
    float _2370 = _2362;
    if (!_2358)
    {
        float _2372 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2322);
        _2364 = _2372;
    }
    float _2374 = _2364;
    int _2376 = int(_2290) + int(_2354);
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2378;
    int _2382 = ~_742;
    int _2384 = _2382 + 1;
    float _2386 = as_type<float>(_2376);
    if (!_2358)
    {
        float _2388 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2326);
        _2366 = _2388;
    }
    float _2390 = _2366;
    bool _2392 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2394 = isnan(_456);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2400 = _2396 || _2398;
    float _2402 = float(_2400);
    int _2404 = _2063 * _2376;
    int _2406 = _2404 + _2256;
    float _2408 = _2380 * _2360;
    float _2410 = as_type<float>(_2081) * _2280;
    bool _2412 = uint(_2406) >= uint(_742);
    float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2416 = _456 + _2414;
    float _2418 = fma(_2408, _2320, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2420 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2422 = isnan(_456);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = trunc(_2410);
    float _2434 = precise::max(_2432, 0.0);
    uint _2436 = uint(_2434);
    bool _2438 = !_2412;
    int _2440 = _2438 ? 0 : (-1);
    bool _2442 = _2276 > 0.5;
    bool _2444 = _2442 && _2240;
    float _2446 = fma(_2314, _2416, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2448 = _798 * (-0.15915493667125701904296875);
    int _2450 = ~_2376;
    int _2452 = _2450 + _2440;
    int _2454 = _2452 + 1;
    float _2456 = -_2402;
    float _2458 = _2456 + 1.0;
    if (_2240)
    {
        _2386 = _2292;
    }
    float _2460 = _2386;
    float _2462 = _2448 * 6.283185482025146484375;
    float _2464 = sin(_2462);
    bool _2466 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2468 = isnan(_456);
    bool _2470 = _2466 || _2468;
    bool _2472 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2474 = _2470 || _2472;
    float _2476 = float(_2474);
    float _2478 = _2430 * _2458;
    int _2480 = _2384 * int(_2436);
    int _2482 = _2480 + _2230;
    float _2484 = _2448 * 6.283185482025146484375;
    float _2486 = cos(_2484);
    float _2488 = _2460;
    if (_2444)
    {
        float _2490 = -_2460;
        float _2492 = _2490 + 1.0;
        _2488 = _2492;
    }
    float _2494 = _2488;
    float _2496 = float(uint(_2482));
    float _2498 = -_2430;
    float _2500 = _2498 + 1.0;
    if (_2240)
    {
        _2308 = _2494;
    }
    float _2502 = _2308;
    int _2504 = _742 * _2454;
    int _2506 = _2504 + _2256;
    float _2508 = fma(_2312, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2510 = as_type<float>(_2081) * _2496;
    float _2512 = _2476 * _2500;
    float _2514 = -_2476;
    float _2516 = _2514 + 1.0;
    float _2518 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2520 = _2464 * _2508;
    float _2522 = _2418 * _2512;
    float _2524 = trunc(_2510);
    float _2526 = precise::max(_2524, 0.0);
    uint _2528 = uint(_2526);
    bool _2530 = !_2055;
    int _2532 = _2530 ? _2506 : (-1);
    float _2534 = _2486 * _2508;
    float _2536 = fma(_2516, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2522);
    float _2538 = -_2520;
    float _2540 = fma(_2486, _2518, _2538);
    int _2542 = _2532 >> 31;
    float _2544 = fma(_2464, _2518, _2534);
    float _2546 = fma(_2446, _2478, _2536);
    float _2548 = fma(_808, _2540, _814);
    int _2550 = _2542 & 3;
    float _2552 = -_796;
    float _2554 = fma(_816, _2544, _2552);
    int _2556 = ~_742;
    int _2558 = _2556 + 1;
    float _2560 = abs(_1586);
    float _2562 = log2(_2560);
    int _2564 = _2532 + _2550;
    float _2566 = fma(_2402, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2546);
    float _2568 = _2548 + 0.5;
    int _2570 = int(_2436) + int(_2528);
    float _2572 = _2566 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2574 = _2564 >> 2;
    float _2576 = _2554 + 0.5;
    int _2578 = _2558 * _2570;
    int _2580 = _2578 + _2230;
    int _2582 = _2574 << 4;
    int _2584 = _2582 + 368;
    int _2586 = _2532 & 3;
    bool _2588 = _2586 != 0;
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2592 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2594 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    uint _2596 = uint(int(uint(_2584) >> uint(2)));
    uint _2598 = uint(int(uint(int(_2596)) >> uint(2)));
    int _2600 = int(_2596) & 3;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[int(_2598)][_2600];
    int _2604 = int(_2596) + 1;
    uint _2606 = uint(int(uint(_2604) >> uint(2)));
    int _2608 = _2604 & 3;
    float _2610 = (*spvDescriptorSet0.vp_c9)._m0[int(_2606)][_2608];
    bool _2612 = uint(_2580) >= uint(_742);
    float _2614 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2616 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2618 = exp2(_2594);
    bool _2620 = !_2612;
    int _2622 = _2620 ? 0 : (-1);
    out.m_89.x = _2568;
    out.m_89.y = _2576;
    int _2624 = _2584 + 8;
    uint _2626 = uint(int(uint(_2624) >> uint(2)));
    uint _2628 = uint(int(uint(int(_2626)) >> uint(2)));
    int _2630 = int(_2626) & 3;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[int(_2628)][_2630];
    int _2634 = int(_2626) + 1;
    uint _2636 = uint(int(uint(_2634) >> uint(2)));
    int _2638 = _2634 & 3;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[int(_2636)][_2638];
    bool _2642 = uint(_2586) > 1u;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2646 = _2532 & 3;
    bool _2648 = _2646 != 0;
    float _2650 = -_2024;
    float _2652 = _2650 + 1.0;
    float _2654 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2656 = _2648 ? 0 : 1;
    bool _2658 = _2586 != 3;
    out.m_91.x = _2654;
    out.m_91.y = _2614;
    out.m_91.z = _2616;
    out.m_91.w = _2572;
    float _2660 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2662 = precise::clamp(_2660, 0.0, 1.0);
    bool _2664 = uint(_2586) >= 2u;
    bool _2666 = !_2588;
    int _2668 = _2666 ? 0 : 1;
    float _2670 = fma(_2662, -2.0, 3.0);
    float _2672 = _2662 * _2662;
    bool _2674 = _2586 != 3;
    bool _2676 = _1586 <= 8000.0;
    bool _2678 = isnan(_1586);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan(8000.0);
    bool _2684 = _2680 || _2682;
    float _2686 = float(_2684);
    float _2688 = _2672 * _2670;
    int _2690 = ~_2570;
    int _2692 = _2690 + _2622;
    int _2694 = _2692 + 1;
    int _2696 = ~_2656;
    int _2698 = _2696 + 1;
    int _2700 = _2698 + 1;
    float _2702 = _1266 * _1220;
    int _2704 = _2700;
    if (!_2642)
    {
        int _2706 = ~_2656;
        int _2708 = _2706 + 1;
        _2704 = _2708;
    }
    int _2710 = _2704;
    int _2712 = _742 * _2694;
    int _2714 = _2712 + _2230;
    int _2716 = _2664 ? 0 : 1;
    int _2718 = abs(_2710);
    int _2720 = abs(_2668);
    float _2722 = -_2688;
    float _2724 = _2722 + 1.0;
    int _2726 = ~_2716;
    int _2728 = _2726 + 1;
    int _2730 = _2728 + 1;
    int _2732 = _2730;
    if (_2658)
    {
        int _2734 = ~_2716;
        int _2736 = _2734 + 1;
        _2732 = _2736;
    }
    int _2738 = _2732;
    float _2740 = fma(_2724, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2688);
    int _2742 = ~_2718;
    int _2744 = _2742 + 1;
    int _2746 = _2744 + 1;
    int _2748 = abs(_2738);
    int _2750 = ~_2720;
    int _2752 = _2750 + 1;
    int _2754 = _2752 + 1;
    int _2756 = _2746 * as_type<int>(_2610);
    float _2758 = _1242 * _1218;
    bool _2760 = !_2674;
    int _2762 = _2760 ? 0 : (-1);
    int _2764 = _2754 * as_type<int>(_2602);
    int _2766 = _2764 + _2756;
    int _2768 = ~_2748;
    int _2770 = _2768 + 1;
    int _2772 = _2770 + 1;
    float _2774 = _2686 * _2740;
    bool _2776 = !_2260;
    int _2778 = _2776 ? 0 : 1;
    float _2780 = _1276 * _1218;
    int _2782 = abs(_2762);
    int _2784 = _2772 * as_type<int>(_2632);
    int _2786 = _2784 + _2766;
    int _2788 = abs(_2778);
    float _2790 = _1242 * _1220;
    int _2792 = ~_2782;
    int _2794 = _2792 + 1;
    int _2796 = _2794 + 1;
    float _2798 = -_1224;
    float _2800 = fma(_2798, _1368, _2758);
    float _2802 = _1276 * _1220;
    float _2804 = _1276 * _1216;
    float _2806 = -_1224;
    float _2808 = fma(_2806, _1324, _2790);
    int _2810 = _2796 * as_type<int>(_2640);
    int _2812 = _2810 + _2786;
    float _2814 = -_1224;
    float _2816 = fma(_2814, _1318, _2079);
    int _2818 = ~_2788;
    int _2820 = _2818 + 1;
    int _2822 = _2820 + 1;
    float _2824 = _1266 * _1218;
    float _2826 = fma(_1240, _1368, _2780);
    float _2828 = fma(_1212, _706, _2800);
    float _2830 = fma(_1240, _1324, _2802);
    float _2832 = fma(_1240, _1318, _2804);
    float _2834 = _1266 * _1216;
    float _2836 = fma(_1214, _1324, _2702);
    float _2838 = fma(_1212, _594, _2808);
    float _2840 = fma(_1212, _598, _2816);
    bool _2842 = !_2055;
    int _2844 = _2842 ? _2714 : (-1);
    float _2846 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2848 = fma(_1214, _1368, _2824);
    int _2850 = _2812 * _2822;
    float _2852 = fma(_1256, _706, _2826);
    float _2854 = _2828 * _2370;
    float _2856 = fma(_1214, _1318, _2834);
    float _2858 = fma(_1256, _594, _2830);
    float _2860 = _2838 * _2370;
    float _2862 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2846);
    float _2864 = fma(_1278, _706, _2848);
    int _2866 = _2844 * _2788;
    int _2868 = _2866 + _2850;
    float _2870 = fma(_2852, _2374, _2854);
    float _2872 = fma(_1256, _598, _2832);
    float _2874 = fma(_1278, _598, _2856);
    float _2876 = fma(_2858, _2374, _2860);
    float _2878 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2880 = _2840 * _2370;
    float _2882 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2862);
    float _2884 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2886 = fma(_2864, _2390, _2870);
    float _2888 = float(_2868);
    float _2890 = in.m_67.x;
    float _2892 = _2652 * _2878;
    float _2894 = precise::clamp(_2892, 0.0, 1.0);
    float _2896 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2882);
    float _2898 = _2884 * _2026;
    float _2900 = fma(_1278, _594, _2836);
    float _2902 = _1950 * 0.5;
    out.m_93.x = _2888;
    float _2904 = -_2894;
    float _2906 = fma(_2904, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2908 = fma(_2872, _2374, _2880);
    float _2910 = _2896 + _1950;
    float _2912 = _1964 + _1950;
    float _2914 = _2037 * _2898;
    float _2916 = _2047 * _2898;
    float _2918 = fma(_2900, _2390, _2876);
    float _2920 = -_2884;
    float _2922 = _2920 + 1.0;
    float _2924 = fma(_1996, -0.5, _2902);
    float _2926 = _2910 * 0.5;
    float _2928 = _2912 * 0.5;
    float _2930 = fma(_2874, _2390, _2908);
    float _2932 = fma(_2043, _2914, _2031);
    float _2934 = fma(_2045, _2914, _2033);
    float _2936 = _2037 * _2922;
    float _2938 = fma(_2037, _2916, _2035);
    out.m_95.x = _2928;
    out.m_95.y = _2924;
    out.m_95.z = _2926;
    out.m_95.w = _1950;
    bool _2940 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2942 = isnan(_1742);
    bool _2944 = _2940 || _2942;
    bool _2946 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2948 = _2944 || _2946;
    float _2950 = _2906 * _2890;
    out.m_97.x = _2932;
    out.m_97.y = _2934;
    out.m_97.z = _2938;
    out.m_97.w = _2936;
    float _2952 = _2950 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2954 = _1642 * _1704;
    out.m_99.x = _2918;
    out.m_99.y = _2886;
    out.m_99.z = _2930;
    out.gl_Position.x = _1964;
    out.gl_Position.y = _1996;
    out.gl_Position.z = _2896;
    out.gl_Position.w = _1950;
    float _2956 = _2914;
    float _2958 = _2890;
    float _2960 = _2922;
    float _2962 = _2952;
    float _2964 = _2954;
    if (!_2948)
    {
        _2956 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2966 = _2956;
    out.m_101.x = _2952;
    float _2968 = _2966;
    float _2970 = _2966;
    if (!_2948)
    {
        _2958 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2972 = _2958;
    float _2974 = _2972;
    float _2976 = _2972;
    if (!_2948)
    {
        _2960 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2978 = _2960;
    float _2980 = _2978;
    float _2982 = _2978;
    if (!_2948)
    {
        _2962 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2984 = _2962;
    float _2986 = _2954 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2988 = _2984;
    float _2990 = _2984;
    if (!_2948)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2992 = _2272;
    float _2994 = _2992;
    float _2996 = _2992;
    if (!_2948)
    {
        _2964 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2998 = _2964;
    bool _3000 = !_2948;
    float _3002 = _2998;
    float _3004 = _2998;
    if (!_3000)
    {
        bool _3006 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3008 = isnan(_1742);
        bool _3010 = _3006 || _3008;
        bool _3012 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3014 = _3010 || _3012;
        if (!_3014)
        {
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3018 = _1742 + _3016;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3022 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3020;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3028 = 1.0 / _3022;
            float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3044 = _3042 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3046 = _3018 * _3028;
            float _3048 = precise::clamp(_3046, 0.0, 1.0);
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3054 = fma(_3048, _3026, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3056 = fma(_3048, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3058 = fma(_3048, _3032, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3060 = fma(_3048, _3036, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3062 = fma(_3048, _3040, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3064 = fma(_3048, _3044, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2996 = _3058;
            _2990 = _3062;
            _2970 = _3054;
            _2982 = _3060;
            _2976 = _3056;
            _3004 = _3064;
            _3066 = true;
        }
        else
        {
            bool _3068 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3070 = isnan(_1742);
            bool _3072 = _3068 || _3070;
            bool _3074 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3076 = _3072 || _3074;
            if (!_3076)
            {
                _2968 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3078 = _2968;
            _2970 = _3078;
            if (!_3076)
            {
                _2994 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3080 = _2994;
            _2996 = _3080;
            if (!_3076)
            {
                _2974 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3082 = _2974;
            _2976 = _3082;
            if (!_3076)
            {
                _2980 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3084 = _2980;
            _2982 = _3084;
            if (!_3076)
            {
                _2988 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3086 = _2988;
            _2990 = _3086;
            if (!_3076)
            {
                _3002 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3088 = _3002;
            bool _3090 = !_3076;
            _3004 = _3088;
            if (!_3090)
            {
                bool _3092 = _1742 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3094 = isnan(_1742);
                bool _3096 = _3092 || _3094;
                bool _3098 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3100 = _3096 || _3098;
                if (!_3100)
                {
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3104 = _1742 + _3102;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3108 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3106;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3114 = 1.0 / _3108;
                    float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3122 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3130 = _3128 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3132 = _3104 * _3114;
                    float _3134 = precise::clamp(_3132, 0.0, 1.0);
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3140 = fma(_3134, _3112, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3142 = fma(_3134, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3144 = fma(_3134, _3118, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3146 = fma(_3134, _3122, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3148 = fma(_3134, _3126, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3150 = fma(_3134, _3130, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2996 = _3144;
                    _2990 = _3148;
                    _2970 = _3140;
                    _2982 = _3146;
                    _2976 = _3142;
                    _3004 = _3150;
                    _3066 = true;
                }
                else
                {
                    _2996 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2990 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2970 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2982 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2976 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3004 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3066 = false;
    float _3152 = _2996;
    float _3154 = _2990;
    float _3156 = _2970;
    float _3158 = _2982;
    float _3160 = _2976;
    float _3162 = _3004;
    float _3164 = fma(_2886, -0.5, 0.5);
    float _3166 = precise::clamp(_3164, 0.0, 1.0);
    float _3168 = -_3152;
    float _3170 = _3168 + _3154;
    float _3172 = _2986 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3174 = -_3156;
    float _3176 = _3174 + _3158;
    float _3178 = fma(_3166, _3170, _3152);
    out.m_103.x = 0.0;
    float _3180 = -_3160;
    float _3182 = _3180 + _3162;
    float _3184 = fma(_3166, _3176, _3156);
    float _3186 = _3178 * 0.586610972881317138671875;
    out.m_53.x = _3172;
    bool _3188 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3190 = fma(_3166, _3182, _3160);
    float _3192 = fma(_3184, 0.298911988735198974609375, _3186);
    bool _3194 = _1642 > 0.0;
    bool _3196 = isnan(_1642);
    bool _3198 = _3194 || _3196;
    bool _3200 = isnan(0.0);
    bool _3202 = _3198 || _3200;
    float _3204 = fma(_3190, 0.114477999508380889892578125, _3192);
    bool _3206 = _1704 <= 0.0;
    bool _3208 = !_3202;
    bool _3210 = _3206 || _3208;
    float _3212 = -_3204;
    float _3214 = _3184 + _3212;
    float _3216 = -_3204;
    float _3218 = _3178 + _3216;
    float _3220 = -_3204;
    float _3222 = _3190 + _3220;
    float _3224 = fma(_3214, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3204);
    float _3226 = fma(_3218, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3204);
    float _3228 = fma(_3222, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3204);
    bool _3230 = !_3188;
    if (!_3230)
    {
        float _3232 = -_1568;
        float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3236 = -_1570;
        float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3240 = -_1572;
        float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3244 = _3234 * _3234;
        float _3246 = fma(_3238, _3238, _3244);
        float _3248 = fma(_3242, _3242, _3246);
        float _3250 = sqrt(_3248);
        float _3252 = rsqrt(_3248);
        float _3254 = -_3250;
        float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3258 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3260 = precise::clamp(_3258, 0.0, 1.0);
        float _3262 = _3238 * _3252;
        float _3264 = _3234 * _3252;
        float _3266 = abs(_3260);
        float _3268 = log2(_3266);
        float _3270 = _3242 * _3252;
        float _3272 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3274 = _2886 * _3264;
        float _3276 = -_3264;
        float _3278 = -_3272;
        float _3280 = fma(_3276, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3278);
        float _3282 = fma(_2918, _3262, _3274);
        float _3284 = -_3270;
        float _3286 = fma(_3284, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3280);
        float _3288 = fma(_2930, _3270, _3282);
        float _3290 = precise::clamp(_3288, 0.0, 1.0);
        float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3294 = _3286 + _3292;
        float _3296 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3298 = _3294 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3300 = precise::clamp(_3298, 0.0, 1.0);
        float _3302 = exp2(_3296);
        float _3304 = _3302 * _3300;
        float _3306 = _3290 * _3304;
        float _3308 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3310 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3312 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3308;
        out.m_103.y = _3310;
        out.m_103.z = _3312;
    }
    out.m_77.x = _3224;
    out.m_77.y = _3226;
    out.m_77.z = _3228;
    if (!_3210)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3314 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3314;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

