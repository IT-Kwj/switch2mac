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
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_71 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_73 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3346 = false;
    bool _550 = false;
    bool _434 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3651 = as_type<float>(_122);
        out.gl_Position.z = _3651;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3720 = as_type<float>(_160);
        out.gl_Position.z = _3720;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_53.x;
    float _164 = in.m_53.y;
    float _166 = in.m_53.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_168;
    float _190 = _184;
    float _192 = _182;
    float _210;
    if (!_188)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_106);
        float _216 = 1.0 / _214;
        float _218 = _140 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _220 + _226;
    bool _230 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _232 = isnan(_220);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _220 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = 1.0 / _244;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _256;
    float _264 = 1.0 / _252;
    float _266 = _224 * _258;
    bool _268 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = isnan(_220);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -_240;
    float _282 = _280 + 1.0;
    float _284 = _278 * _282;
    float _286 = _228 * _262;
    bool _288 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_220);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _300;
    bool _304 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_220);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = -_278;
    float _322 = _320 + 1.0;
    float _324 = -_298;
    float _326 = _324 + 1.0;
    float _328 = _248 * _264;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _314 * _326;
    float _340 = fma(_302, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = _298 * _322;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = _342 * _338;
    float _354 = _344 * _338;
    float _356 = _340 * _338;
    float _358 = -_314;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _372;
    float _376 = fma(_318, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_364, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_350, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _386;
    float _390 = fma(_376, _346, _366);
    float _392 = fma(_374, _266, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _394 = fma(_384, _266, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _396 = fma(_388, _266, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_378, _346, _368);
    float _400 = fma(_380, _346, _370);
    float _402 = fma(_392, _284, _390);
    float _404 = fma(_394, _284, _398);
    float _406 = fma(_396, _284, _400);
    float _408 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].x, _402);
    float _410 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].y, _404);
    float _412 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].z, _406);
    bool _414 = !_260;
    float _432;
    if (!_414)
    {
        float _416 = in.m_55.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        float _436 = float(_106);
        float _438 = 1.0 / _436;
        float _440 = _140 * _438;
        _432 = _440;
    }
    _434 = false;
    float _442 = _432;
    float _444 = in.m_57.x;
    float _446 = in.m_57.y;
    float _448 = in.m_57.z;
    bool _450 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _452 = isnan(_442);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _466 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _468 = isnan(_442);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _442 + _482;
    float _486 = -_460;
    float _488 = _486 + 1.0;
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _492 = 1.0 / _464;
    float _494 = _476 * _488;
    float _496 = -_476;
    float _498 = _496 + 1.0;
    float _500 = _412 * _448;
    float _502 = _410 * _446;
    float _504 = _480 * _492;
    float _506 = _408 * _444;
    float _508 = fma(_504, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _510 = _508 * _494;
    float _512 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[115].x, _510);
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _520 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[116].x, _512);
    float _522 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _524 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _526 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _528 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _522;
    out.m_59.y = _524;
    out.m_59.z = _526;
    out.m_59.w = _528;
    bool _530 = !_490;
    float _548;
    if (!_530)
    {
        float _532 = in.m_55.x;
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        float _552 = float(_106);
        float _554 = 1.0 / _552;
        float _556 = _140 * _554;
        _548 = _556;
    }
    _550 = false;
    float _558 = _548;
    float _560 = in.m_46.x;
    float _562 = in.m_46.y;
    float _564 = in.m_46.z;
    float _566 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _568 = int(_566);
    float _570 = in.m_55.z;
    float _572 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _574 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _576 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _578 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _580 = log2(_578);
    float _582 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _584 = -_576;
    float _586 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _584);
    bool _588 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = float(_568);
    float _600 = 1.0 / _598;
    float _602 = _562 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _604 = _562 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _606 = _562 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _608 = _580 * _140;
    float _610 = fma(_560, (*spvDescriptorSet0.vp_c10)._m0[5].x, _602);
    float _612 = fma(_560, (*spvDescriptorSet0.vp_c10)._m0[4].x, _604);
    float _614 = fma(_560, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
    float _616 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[5].z, _610);
    float _618 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    float _620 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[6].z, _614);
    float _622 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _624 = _616 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _626 = _618 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _628 = _620 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _630 = -_622;
    float _632 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _630);
    float _634 = -_624;
    float _636 = _634 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _638 = -_626;
    float _640 = _638 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _642 = -_628;
    float _644 = _642 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _646 = exp2(_608);
    float _648 = _636 * _636;
    float _650 = _600 * _140;
    float _652 = fma(_640, _640, _648);
    float _654 = fma(_644, _644, _652);
    float _656 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _658 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _660 = rsqrt(_654);
    float _662 = -_656;
    float _664 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _662);
    float _666 = -_658;
    float _668 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _666);
    float _670 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _672 = -_646;
    float _674 = _672 + 1.0;
    float _676 = _668 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _678 = -_670;
    float _680 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _678);
    float _682 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _684 = _668 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _686 = -_676;
    float _688 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[1].x, _686);
    float _690 = _668 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _692 = -_682;
    float _694 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _692);
    float _696 = -_684;
    float _698 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _700 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[1].w, _688);
    float _702 = _570 * 2.0;
    float _704 = _640 * _660;
    float _706 = _644 * _660;
    float _708 = _700 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _710 = _636 * _660;
    float _712 = _704 * _704;
    float _714 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].w, _698);
    float _716 = -_690;
    float _718 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[0].x, _716);
    float _720 = _596 ? _674 : 0.0;
    float _722 = fma(_706, _706, _712);
    float _724 = _664 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _726 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[0].w, _718);
    float _728 = -_724;
    float _730 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[1].y, _728);
    float _732 = rsqrt(_722);
    float _734 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[1].w, _730);
    float _736 = -_708;
    float _738 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _738);
    float _746 = _706 * _732;
    float _748 = _704 * _732;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _752 = in.m_55.x;
    float _754 = in.m_55.y;
    float _756 = -_746;
    float _758 = _706 * _756;
    float _760 = _710 * _748;
    float _762 = -_746;
    float _764 = _710 * _762;
    float _766 = -_758;
    float _768 = fma(_704, _748, _766);
    float _770 = _586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _772 = _768 * _768;
    float _774 = float(_742);
    float _776 = fma(_760, _760, _772);
    float _778 = -_770;
    float _780 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _778);
    float _782 = floor(_702);
    float _784 = fma(_764, _764, _776);
    float _786 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _780);
    float _788 = _774 * _140;
    float _790 = -_786;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[0].w, _744);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _796 = rsqrt(_784);
    float _798 = _754 + _752;
    float _800 = _752 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _802 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _804 = _798 + (-1.0);
    float _806 = -_750;
    float _808 = fma(_800, 2.0, _806);
    float _810 = fma(_802, -2.0, _794);
    float _812 = 1.0 / _792;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _816 = _664 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _818 = _668 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _820 = -_140;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[76].x, _808);
    float _824 = -_816;
    float _826 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[0].y, _824);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _830 = 1.0 + _828;
    float _832 = _768 * _796;
    float _834 = precise::clamp(_832, 0.0, 1.0);
    float _836 = -_818;
    float _838 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _836);
    float _840 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[0].w, _826);
    bool _842 = _782 > 0.0;
    float _844 = -_834;
    float _846 = _844 + 1.0;
    bool _848 = _782 >= 0.0;
    bool _850 = isnan(_782);
    bool _852 = _848 || _850;
    bool _854 = isnan(0.0);
    bool _856 = _852 || _854;
    float _858 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[0].w, _838);
    float _860 = 1.0 / _830;
    float _862 = fma(_726, _812, -1.0);
    float _864 = _846 * _812;
    float _866 = _752 * 2.0;
    float _868 = fma(_846, _862, 1.0);
    float _870 = _840 * _864;
    float _872 = _858 * _864;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _876 = _868 * _868;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _880 = _878 != 0;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _888 = _886 != 0;
    float _890 = floor(_866);
    float _892 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].w, _874);
    float _894 = fma(_870, _870, _876);
    bool _896 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _898 = isnan(1.0);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _904 = _900 || _902;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _908 = !_884;
    int _910 = _908 ? 0 : 1;
    float _912 = fma(_872, _872, _894);
    bool _914 = !_880;
    int _916 = _914 ? 0 : 1;
    float _918 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[78].z, _906);
    bool _920 = !_888;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _810);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _932 = _930 != 0;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _936 = _934 != 0;
    float _938 = rsqrt(_912);
    int _940 = _856 ? 0 : 1;
    float _942 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _918);
    float _944 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _892);
    if (_904)
    {
        float _946 = _720 * _860;
        _144 = _946;
    }
    float _948 = _144;
    bool _950 = !_928;
    int _952 = _950 ? 0 : 1;
    float _954 = _754 * 2.0;
    int _956 = ~_940;
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    int _962 = _960;
    if (!_842)
    {
        int _964 = ~_940;
        int _966 = _964 + 1;
        _962 = _966;
    }
    int _968 = _962;
    float _970 = floor(_954);
    int _972 = abs(_952);
    float _974 = float(_968);
    float _976 = float(_972);
    float _978 = _872 * _938;
    float _980 = _868 * _938;
    float _982 = _870 * _938;
    bool _984 = _890 > 0.0;
    float _986 = -_978;
    float _988 = _704 * _986;
    bool _990 = _890 >= 0.0;
    bool _992 = isnan(_890);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.0);
    bool _998 = _994 || _996;
    float _1000 = _706 * _980;
    float _1002 = in.m_61.x;
    float _1004 = in.m_61.y;
    float _1006 = in.m_61.z;
    float _1008 = -_982;
    float _1010 = -_988;
    float _1012 = fma(_706, _1008, _1010);
    float _1014 = _976 * _974;
    float _1016 = -_978;
    float _1018 = -_1000;
    float _1020 = fma(_710, _1016, _1018);
    float _1022 = -_982;
    float _1024 = _710 * _1022;
    float _1026 = _1012 * _1012;
    bool _1028 = _970 > 0.0;
    float _1030 = _1014 * (-2.0);
    float _1032 = -_1024;
    float _1034 = fma(_704, _980, _1032);
    float _1036 = fma(_1020, _1020, _1026);
    int _1038 = _998 ? 0 : 1;
    float _1040 = fma(_814, _1030, _814);
    bool _1042 = _970 >= 0.0;
    bool _1044 = isnan(_970);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = fma(_1034, _1034, _1036);
    int _1054 = ~_1038;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = _752 + (-0.5);
    int _1062 = _1058;
    if (!_984)
    {
        int _1064 = ~_1038;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    int _1070 = _1050 ? 0 : 1;
    float _1072 = rsqrt(_1052);
    bool _1074 = !_936;
    int _1076 = _1074 ? 0 : 1;
    int _1078 = ~_1070;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = fma(_1030, _1002, _1002);
    bool _1086 = !_932;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = _1082;
    if (!_1028)
    {
        int _1092 = ~_1070;
        int _1094 = _1092 + 1;
        _1090 = _1094;
    }
    int _1096 = _1090;
    float _1098 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1084);
    int _1100 = abs(_1088);
    float _1102 = _754 + _570;
    int _1104 = abs(_1076);
    float _1106 = fma(_1040, _948, _1098);
    float _1108 = float(_1068);
    float _1110 = _1102 + (-1.0);
    float _1112 = float(_1100);
    float _1114 = _1020 * _1072;
    float _1116 = float(_1096);
    float _1118 = _1034 * _1072;
    float _1120 = float(_1104);
    float _1122 = _1112 * _1108;
    float _1124 = _706 * _1114;
    float _1126 = _1012 * _1072;
    float _1128 = _1120 * _1116;
    float _1130 = _1122 * (-2.0);
    float _1132 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1134 = -_1124;
    float _1136 = fma(_704, _1118, _1134);
    float _1138 = _710 * _1118;
    float _1140 = fma(_1130, _1004, _1004);
    float _1142 = fma(_1132, _1130, _1132);
    float _1144 = _704 * _1126;
    float _1146 = -_1138;
    float _1148 = fma(_706, _1126, _1146);
    float _1150 = _1136 * _1136;
    float _1152 = _754 + (-0.5);
    float _1154 = -_1144;
    float _1156 = fma(_710, _1114, _1154);
    float _1158 = _570 + _752;
    float _1160 = fma(_1148, _1148, _1150);
    float _1162 = _1106 * 0.15915493667125701904296875;
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1140);
    float _1166 = fma(_1156, _1156, _1160);
    float _1168 = _1158 + (-1.0);
    float _1170 = _1128 * (-2.0);
    float _1172 = _570 + (-0.5);
    float _1174 = in.m_63.x;
    float _1176 = in.m_63.y;
    float _1178 = in.m_63.z;
    float _1180 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1182 = rsqrt(_1166);
    float _1184 = fma(_1170, _1006, _1006);
    float _1186 = fma(_1142, _948, _1164);
    float _1188 = fma(_1180, _1170, _1180);
    float _1190 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1184);
    float _1192 = _1186 * 0.15915493667125701904296875;
    float _1194 = _1162 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = fma(_1188, _948, _1190);
    float _1200 = _1198 * 0.15915493667125701904296875;
    float _1202 = _1162 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = _1148 * _1182;
    float _1208 = _1136 * _1182;
    float _1210 = _710 * _1206;
    float _1212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1176);
    float _1214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1174);
    float _1216 = _1192 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _1156 * _1182;
    float _1222 = _706 * _1208;
    float _1224 = -_1210;
    float _1226 = fma(_704, _1208, _1224);
    float _1228 = _572 * _1212;
    float _1230 = _704 * _1220;
    float _1232 = -_1222;
    float _1234 = fma(_710, _1220, _1232);
    float _1236 = _582 * _1214;
    float _1238 = _1192 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = -_1230;
    float _1244 = fma(_706, _1206, _1242);
    float _1246 = _1244 * _1244;
    float _1248 = _1200 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = fma(_1234, _1234, _1246);
    float _1254 = _1204 * _1218;
    float _1256 = _1196 * _1218;
    float _1258 = fma(_1226, _1226, _1252);
    float _1260 = _1200 * 6.283185482025146484375;
    float _1262 = sin(_1260);
    float _1264 = _1204 * _1240;
    float _1266 = _1196 * _1240;
    float _1268 = _1204 * _1250;
    float _1270 = rsqrt(_1258);
    float _1272 = _1196 * _1250;
    float _1274 = _1240 * _1250;
    float _1276 = _1268 * _1228;
    float _1278 = _1218 * _1250;
    float _1280 = _574 * _1178;
    float _1282 = fma(_1262, _1264, _1256);
    float _1284 = -_1228;
    float _1286 = _1262 * _1284;
    float _1288 = -_1266;
    float _1290 = fma(_1262, _1254, _1288);
    float _1292 = -_1254;
    float _1294 = fma(_1262, _1266, _1292);
    float _1296 = fma(_1282, _1236, _1276);
    float _1298 = _1272 * _1228;
    float _1300 = fma(_1274, _1236, _1286);
    float _1302 = fma(_1262, _1256, _1264);
    float _1304 = fma(_1290, _1280, _1296);
    float _1306 = fma(_1294, _1236, _1298);
    float _1308 = fma(_1278, _1280, _1300);
    float _1310 = _1226 * _1270;
    float _1312 = _1220 * _1304;
    float _1314 = fma(_1302, _1280, _1306);
    float _1316 = _1206 * _1304;
    float _1318 = _1234 * _1270;
    float _1320 = fma(_1310, _1308, _1312);
    float _1322 = _1208 * _1304;
    float _1324 = _1244 * _1270;
    float _1326 = fma(_1318, _1308, _1316);
    float _1328 = fma(_706, _1314, _1320);
    float _1330 = fma(_704, _1314, _1326);
    float _1332 = _628 + _1328;
    float _1334 = _626 + _1330;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1338 = _1332 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1342 = _1334 + _1340;
    float _1344 = _1338 * _1338;
    float _1346 = fma(_1342, _1342, _1344);
    float _1348 = fma(_1324, _1308, _1322);
    float _1350 = _624 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1352 = sqrt(_1346);
    float _1354 = fma(_710, _1314, _1348);
    float _1356 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1350);
    float _1358 = _624 + _1354;
    float _1360 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1356);
    bool _1362 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = _1354;
    float _1366 = _1350;
    float _1368 = _1356;
    if (!_1362)
    {
        _1364 = _1334;
    }
    float _1370 = _1364;
    float _1372 = _1370;
    if (!_1362)
    {
        _1366 = _1332;
    }
    float _1374 = _1366;
    float _1376 = _1374;
    if (!_1362)
    {
        _1368 = _1358;
    }
    float _1378 = _1368;
    bool _1380 = !_1362;
    float _1382 = _1378;
    if (!_1380)
    {
        float _1384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1388 = _1352 + _1386;
        float _1390 = _1358 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = rsqrt(_1346);
        float _1394 = _1388 * _1384;
        float _1396 = _1394 * 0.15915493667125701904296875;
        float _1398 = _1396 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1396 * 6.283185482025146484375;
        float _1404 = sin(_1402);
        float _1406 = _1400 + (-1.0);
        float _1408 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1410 = fma(_1404, _1390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1412 = fma(_1358, _1400, _1408);
        float _1414 = _1392 * _1410;
        float _1416 = fma(_1342, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1418 = fma(_1338, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1382 = _1412;
        _1372 = _1416;
        _1376 = _1418;
    }
    float _1420 = _1382;
    float _1422 = _1372;
    float _1424 = _1376;
    float _1426 = -_624;
    float _1428 = _1426 + _1420;
    float _1430 = -_626;
    float _1432 = _1430 + _1422;
    float _1434 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1436 = _624 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1438 = _1428 * _1428;
    float _1440 = -_628;
    float _1442 = _1440 + _1424;
    float _1444 = 1.0 / _1434;
    float _1446 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1436);
    float _1448 = fma(_1432, _1432, _1438);
    float _1450 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1446);
    float _1452 = fma(_1442, _1442, _1448);
    float _1454 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1456 = sqrt(_1452);
    float _1458 = _1454 + _1434;
    float _1460 = _1458 * _1444;
    float _1462 = _1460 * 0.5;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1466 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1464);
    float _1468 = 1.0 / _1466;
    bool _1470 = _1456 > 0.0;
    bool _1472 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.5);
    bool _1480 = _1476 || _1478;
    bool _1482 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1484 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(0.5);
    bool _1490 = _1486 || _1488;
    bool _1492 = !_1470;
    float _1494 = _1422;
    float _1496 = _1420;
    float _1498 = _1424;
    float _1500 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1502 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1504 = _1432;
    float _1506 = _1434;
    float _1508 = _1444;
    float _1510 = _1466;
    float _1512 = _1428;
    float _1514 = _1442;
    if (!_1492)
    {
        float _1516 = _184 * _184;
        float _1518 = fma(_182, _182, _1516);
        float _1520 = fma(_186, _186, _1518);
        float _1522 = rsqrt(_1452);
        float _1524 = sqrt(_1520);
        float _1526 = _1432 * _1522;
        float _1528 = _1428 * _1522;
        float _1530 = _1442 * _1522;
        bool _1532 = _1524 > 0.0;
        bool _1534 = !_1532;
        _1500 = _1524;
        _1502 = _1522;
        _1504 = _1528;
        _1510 = _1520;
        if (!_1534)
        {
            float _1536 = rsqrt(_1520);
            float _1538 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1540 = _184 * _1536;
            float _1542 = _182 * _1536;
            float _1544 = _186 * _1536;
            float _1546 = _1528 * _1540;
            float _1548 = fma(_1526, _1542, _1546);
            float _1550 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1552 = fma(_1530, _1544, _1548);
            float _1554 = _1552 * _1550;
            float _1556 = fma(_182, _1554, _1422);
            float _1558 = fma(_184, _1554, _1420);
            float _1560 = fma(_186, _1554, _1424);
            _1494 = _1556;
            _1496 = _1558;
            _1498 = _1560;
            _1500 = _1542;
            _1502 = _1554;
            _1504 = _1548;
            _1506 = _1540;
            _1508 = _1538;
            _1512 = _1550;
        }
    }
    float _1562 = _1494;
    float _1564 = _1496;
    float _1566 = _1498;
    float _1568 = _1500;
    float _1570 = _1502;
    float _1572 = _1504;
    float _1574 = _1506;
    float _1576 = _1508;
    float _1578 = _1510;
    float _1580 = _1512;
    float _1582 = _1568;
    float _1584 = _1574;
    float _1586 = _1572;
    float _1588 = _1576;
    float _1590 = _1570;
    float _1592 = _1578;
    float _1594 = _1580;
    if (_1480)
    {
        _1582 = 1.0;
    }
    float _1596 = _1582;
    float _1598 = _1596;
    if (_1490)
    {
        _1584 = _1562;
    }
    float _1600 = _1584;
    float _1602 = _1600;
    if (_1490)
    {
        _1586 = _1564;
    }
    float _1604 = _1586;
    float _1606 = _1604;
    if (_1490)
    {
        _1588 = _1566;
    }
    float _1608 = _1588;
    float _1610 = _1608;
    if (!_1490)
    {
        float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1614 = _624 + _1612;
        float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1618 = _626 + _1616;
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1622 = -_626;
        float _1624 = _1622 + _1562;
        float _1626 = _1614 * _1614;
        float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1630 = _628 + _1628;
        float _1632 = fma(_1618, _1618, _1626);
        float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1636 = fma(_1630, _1630, _1632);
        float _1638 = sqrt(_1636);
        float _1640 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1642 = precise::min(_1638, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1644 = _1642 * _1634;
        float _1646 = -_624;
        float _1648 = _1646 + _1564;
        float _1650 = -_628;
        float _1652 = _1650 + _1566;
        float _1654 = _1640 * _1644;
        float _1656 = fma(_1648, _1654, _624);
        float _1658 = fma(_1624, _1654, _626);
        float _1660 = fma(_1652, _1654, _628);
        _190 = _1648;
        _1590 = _1644;
        _1606 = _1656;
        _1602 = _1658;
        _1610 = _1660;
        _192 = _1654;
        _1592 = _1634;
    }
    float _1662 = _190;
    float _1664 = _1590;
    float _1666 = _1606;
    float _1668 = _1602;
    float _1670 = _1610;
    float _1672 = _192;
    float _1674 = _1592;
    float _1676 = _1662;
    float _1678 = _1664;
    float _1680 = _1674;
    if (_1480)
    {
        _1594 = 1.0;
    }
    float _1682 = _1594;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1686 = _1468 * _1684;
    float _1688 = _1682;
    if (!_1480)
    {
        float _1690 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1692 = _1690 * 0.15915493667125701904296875;
        float _1694 = _1692 * 6.283185482025146484375;
        float _1696 = cos(_1694);
        float _1698 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1692 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = 1.0 / _1696;
        float _1708 = _1700 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = _1704 * _1706;
        float _1714 = _1700 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        float _1718 = _1710 * _1712;
        float _1720 = 1.0 / _1718;
        float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1724 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1722;
        float _1726 = 1.0 / _1724;
        float _1728 = _1716 * _1720;
        float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1732 = fma(_1686, _1728, _1730);
        float _1734 = _1732 * _1726;
        float _1736 = precise::clamp(_1734, 0.0, 1.0);
        _1676 = _1692;
        _1598 = _1736;
    }
    float _1738 = _1676;
    float _1740 = _1598;
    float _1742 = _1738;
    if (!_1480)
    {
        float _1744 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1746 = _1744 * 0.15915493667125701904296875;
        float _1748 = _1746 * 6.283185482025146484375;
        float _1750 = cos(_1748);
        float _1752 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1754 = _1752 * 0.15915493667125701904296875;
        float _1756 = _1746 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        float _1760 = 1.0 / _1750;
        float _1762 = _1754 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = _1758 * _1760;
        float _1768 = _1754 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        float _1772 = _1764 * _1766;
        float _1774 = 1.0 / _1772;
        float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1778 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1776;
        float _1780 = 1.0 / _1778;
        float _1782 = _1770 * _1774;
        float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1786 = fma(_1686, _1782, _1784);
        float _1788 = _1786 * _1780;
        float _1790 = precise::clamp(_1788, 0.0, 1.0);
        float _1792 = -_1790;
        float _1794 = _1792 + 1.0;
        _1678 = _1774;
        _1742 = _1760;
        _1688 = _1794;
    }
    float _1796 = _1678;
    float _1798 = _1742;
    float _1800 = _1688;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1804 = _1666 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1808 = _1668 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1812 = _1670 + _1810;
    float _1814 = _1804 * _1804;
    float _1816 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1818 = fma(_1808, _1808, _1814);
    float _1820 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1816);
    float _1822 = fma(_1812, _1812, _1818);
    float _1824 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1820);
    float _1826 = rsqrt(_1822);
    float _1828 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1830 = sqrt(_1822);
    float _1832 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1834 = _1808 * _1832;
    float _1836 = _1812 * _1832;
    float _1838 = _1834 * _1834;
    float _1840 = _1836 * _1836;
    float _1842 = _1838 + _1840;
    float _1844 = sqrt(_1842);
    bool _1846 = _1844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1850 = _1844 + _1848;
    float _1852 = _1672;
    float _1854 = _1850;
    float _1856 = _1834;
    float _1858 = _1836;
    float _1860 = _1840;
    if (_1846)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1852 = _1862;
    }
    float _1864 = _1852;
    if (_1846)
    {
        float _1866 = _1850 * _1864;
        _1854 = _1866;
    }
    float _1868 = _1854;
    if (_1846)
    {
        float _1870 = _1868 * 0.15915493667125701904296875;
        _1514 = _1870;
    }
    float _1872 = _1514;
    float _1874 = _1796;
    if (_1846)
    {
        float _1876 = _1872 * 6.283185482025146484375;
        float _1878 = sin(_1876);
        _1874 = _1878;
    }
    float _1880 = _1874;
    float _1882 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1884 = precise::max(0.0, _1882);
    float _1886 = _1798;
    float _1888 = _1884;
    if (_1846)
    {
        float _1890 = _1872 * 6.283185482025146484375;
        float _1892 = cos(_1890);
        _1886 = _1892;
    }
    float _1894 = _1886;
    float _1896 = -_1832;
    float _1898 = -_1884;
    float _1900 = fma(_1804, _1896, _1898);
    float _1902 = _1882;
    if (_1846)
    {
        float _1904 = rsqrt(_1842);
        _1902 = _1904;
    }
    float _1906 = _1902;
    if (_1846)
    {
        float _1908 = _1900 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1888 = _1908;
    }
    float _1910 = _1888;
    float _1912 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1914 = fma(_626, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1916 = _1910;
    float _1918 = _1880;
    if (_1846)
    {
        float _1920 = fma(_1880, _1910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1680 = _1920;
    }
    float _1922 = _1680;
    float _1924 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1912);
    float _1926 = _1922;
    if (_1846)
    {
        float _1928 = _1894 + (-1.0);
        _1916 = _1928;
    }
    float _1930 = _1916;
    float _1932 = floor(_1914);
    float _1934 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1924);
    float _1936 = _1934 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1938 = _1906;
    float _1940 = _1930;
    if (_1846)
    {
        float _1942 = _1906 * _1922;
        _1918 = _1942;
    }
    float _1944 = _1918;
    if (_1846)
    {
        float _1946 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1926 = _1946;
    }
    float _1948 = _1926;
    if (!_1846)
    {
        _1938 = _1900;
    }
    float _1950 = _1938;
    float _1952 = _1950;
    if (_1846)
    {
        float _1954 = _1834 * _1944;
        _1856 = _1954;
    }
    float _1956 = _1856;
    if (_1846)
    {
        float _1958 = fma(_1900, _1894, _1948);
        _1952 = _1958;
    }
    float _1960 = _1952;
    if (!_1846)
    {
        _1940 = _1838;
    }
    float _1962 = _1940;
    float _1964 = _1962;
    if (_1846)
    {
        float _1966 = _1836 * _1944;
        _1858 = _1966;
    }
    float _1968 = _1858;
    if (_1846)
    {
        float _1970 = _1956 * _1956;
        _1964 = _1970;
    }
    float _1972 = _1964;
    if (_1846)
    {
        float _1974 = _1968 * _1968;
        _1860 = _1974;
    }
    float _1976 = _1860;
    float _1978 = -_1932;
    float _1980 = _1914 + _1978;
    float _1982 = fma(_1960, _1960, _1972);
    float _1984 = fma(_628, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1986 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1988 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1990 = _1982 + _1976;
    float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1994 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1992);
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    float _1998 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1986);
    float _2000 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1988);
    float _2002 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2004 = -_1996;
    float _2006 = _2004 + 1.0;
    float _2008 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1998);
    float _2010 = rsqrt(_1990);
    float _2012 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2000);
    float _2014 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2016 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2018 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2022 = abs(_2006);
    float _2024 = log2(_2022);
    float _2026 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2020);
    float _2028 = -_2016;
    float _2030 = fma(_2028, _2002, 1.0);
    float _2032 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2026);
    float _2034 = _2010 * _1956;
    float _2036 = _2010 * _1960;
    float _2038 = _2010 * _1968;
    float _2040 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2032);
    float _2042 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2044 = floor(_1984);
    float _2046 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2048 = -_2042;
    float _2050 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2048);
    float _2052 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2054 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2046);
    float _2056 = -_2038;
    float _2058 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2050);
    float _2060 = log2(_2030);
    float _2062 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2064 = fma(_2058, -0.5, 0.5);
    float _2066 = fma(_2058, 0.5, 0.5);
    float _2068 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2062);
    float _2070 = 1.0 / _2040;
    float _2072 = -_2044;
    float _2074 = _1984 + _2072;
    float _2076 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2054);
    float _2078 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2068);
    float _2080 = _2036 + 1.0;
    float _2082 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2076);
    float _2084 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2078);
    float _2086 = exp2(_2052);
    float _2088 = _2060 * 0.693147182464599609375;
    float _2090 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2092 = sqrt(_2064);
    float _2094 = fma(_2066, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2096 = _2082 * _2070;
    float _2098 = _2084 * _2070;
    float _2100 = fma(_2066, _2094, -0.212114393711090087890625);
    float _2102 = fma(_2096, 0.5, 0.5);
    float _2104 = -_2036;
    float _2106 = fma(_2086, _2080, _2104);
    float _2108 = fma(_2066, _2100, 1.570728778839111328125);
    float _2110 = fma(_2098, -0.5, 0.5);
    float _2112 = fma(_2106, 0.5, 0.5);
    float _2114 = _2092 * 0.636619746685028076171875;
    float2 _6769 = float2(_1980, _2074);
    float _2116 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6769, float2(0.0), isnan(_6769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6769, float2(0.0), isnan(_6769)), level(0.0)).x;
    float3 _6780 = float3(_2102, _2110, _2090);
    float _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6780, float3(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6780, float3(0.0), isnan(_6780)), level(0.0)).x;
    float _2120 = -_2108;
    float _2122 = fma(_2114, _2120, 1.0);
    float3 _6796 = float3(_2102, _2110, _2090);
    float4 _2125 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6796, float3(0.0), isnan(_6796)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6796, float3(0.0), isnan(_6796)), level(0.0)).xyzw;
    float _2127 = _2125.x;
    float _2129 = _2125.y;
    float _2131 = _2125.z;
    float _2133 = _2125.w;
    float2 _6812 = float2(_2122, _2112);
    float3 _2137 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6812, float2(0.0), isnan(_6812)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6812, float2(0.0), isnan(_6812)), level(0.0)).xyz;
    float _2139 = _2137.x;
    float _2141 = _2137.y;
    float _2143 = _2137.z;
    float _2145 = float(uint(_742));
    float _2147 = trunc(_650);
    int _2149 = int(_2147);
    bool _2151 = _742 == 0;
    float _2153 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2155 = abs(_910);
    float _2157 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2159 = abs(_922);
    float _2161 = 1.0 / _2145;
    int _2163 = ~_742;
    int _2165 = _2163 + 1;
    float _2167 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2157);
    float _2169 = float(uint(_2149));
    float _2171 = exp2(_2153);
    float _2173 = float(_106);
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2177 = _2175 != 0;
    int _2179 = as_type<int>(_2161) + (-2);
    float _2181 = 1.0 / _2173;
    int _2183 = ~_742;
    int _2185 = _2183 + 1;
    float _2187 = as_type<float>(_2179) * _2169;
    bool _2189 = !_2177;
    float _2191 = _2189 ? 7.345489978790283203125 : 1.0;
    float _2193 = -_2171;
    float _2195 = _2193 + 1.0;
    float _2197 = trunc(_2187);
    float _2199 = precise::max(_2197, 0.0);
    uint _2202 = uint(_2199);
    float _2204 = _2191 * _752;
    int _2206 = ~_742;
    int _2208 = _2206 + 1;
    float _2210 = float(_2149);
    bool _2212 = _2210 >= _774;
    bool _2214 = isnan(_2210);
    bool _2216 = _2212 || _2214;
    bool _2218 = isnan(_774);
    bool _2220 = _2216 || _2218;
    float _2222 = float(_2220);
    int _2224 = _2165 * int(_2202);
    int _2226 = _2224 + _2149;
    float _2228 = trunc(_2222);
    int _2230 = int(_2228);
    float _2232 = float(uint(_2226));
    float _2234 = as_type<float>(_2179) * _2232;
    float _2236 = floor(_2204);
    float _2238 = trunc(_2234);
    float _2240 = precise::max(_2238, 0.0);
    uint _2242 = uint(_2240);
    float _2244 = -_2236;
    float _2246 = _2204 + _2244;
    float _2248 = _2246 * _774;
    float _2250 = _788 * _2181;
    int _2252 = ~_2230;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    int _2258 = int(_2202) + int(_2242);
    float _2260 = trunc(_2248);
    int _2262 = int(_2260);
    int _2264 = _742 + (-1);
    int _2266 = _2208 * _2258;
    int _2268 = _2266 + _2149;
    bool _2270 = uint(_2268) >= uint(_742);
    float _2272 = trunc(_2250);
    int _2274 = int(_2272);
    bool _2276 = !_2270;
    int _2278 = _2276 ? 0 : (-1);
    int _2280 = ~_2258;
    int _2282 = _2280 + _2278;
    int _2284 = _2282 + 1;
    int _2286 = _742 * _2284;
    int _2288 = _2286 + _2149;
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2292 = _2290 != 0;
    int _2294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2296 = _2294 != 0;
    bool _2298 = !_2151;
    int _2300 = _2298 ? _2288 : (-1);
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2304 = _558 + _2302;
    bool _2306 = !_2292;
    int _2308 = _2306 ? 0 : 1;
    int _2310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2312 = _2310 != 0;
    int _2314 = _2300 * _2256;
    int _2316 = abs(_2308);
    bool _2318 = !_2312;
    int _2320 = _2318 ? 0 : 1;
    int _2322 = _2230 * _2264;
    int _2324 = _2322 + _2314;
    int _2326 = abs(_916);
    int _2328 = _2324 * _2155;
    int _2330 = abs(_2320);
    int _2332 = _2262 * _2316;
    int _2334 = _2332 + _2149;
    int _2336 = ~_742;
    int _2338 = _2336 + 1;
    int _2340 = _2274 * _2326;
    int _2342 = _2340 + _2328;
    int _2344 = ~_742;
    int _2346 = _2344 + 1;
    int _2348 = _2334 * _2159;
    int _2350 = _2348 + _2342;
    int _2352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2354 = _2352 != 0;
    int _2356 = _2262 * _2330;
    int _2358 = _2356 + _2350;
    int _2360 = ~_742;
    int _2362 = _2360 + 1;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2370 = _2368 != 0;
    float _2372 = float(uint(_2358));
    float _2374 = 1.0 / _2366;
    float _2376 = as_type<float>(_2179) * _2372;
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2380 = _2378 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2382 = trunc(_2376);
    float _2384 = precise::max(_2382, 0.0);
    uint _2386 = uint(_2384);
    float _2388 = 1.0 / _2380;
    float _2390 = float(uint(_2334));
    int _2392 = _2362 * int(_2386);
    int _2394 = _2392 + _2358;
    float _2396 = float(uint(_2394));
    float _2398 = as_type<float>(_2179) * _2390;
    float _2400 = as_type<float>(_2179) * _2396;
    float _2402 = trunc(_2398);
    float _2404 = precise::max(_2402, 0.0);
    uint _2406 = uint(_2404);
    float _2408 = trunc(_2400);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    int _2414 = _2346 * int(_2406);
    int _2416 = _2414 + _2334;
    float _2418 = float(uint(_2416));
    int _2420 = int(_2386) + int(_2412);
    float _2422 = as_type<float>(_2179) * _2418;
    float _2424 = in.m_65.y;
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2428 = _558 + _2426;
    float _2430 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2430;
    int _2434 = _2338 * _2420;
    int _2436 = _2434 + _2358;
    float _2438 = trunc(_2422);
    float _2440 = precise::max(_2438, 0.0);
    uint _2442 = uint(_2440);
    float _2444 = _2432 * _2388;
    bool _2446 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2448 = isnan(_558);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2454 = _2450 || _2452;
    float _2456 = float(_2454);
    bool _2458 = uint(_2436) >= uint(_742);
    bool _2460 = !_2458;
    int _2462 = _2460 ? 0 : (-1);
    bool _2464 = _754 > 0.5;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2470 = ~_2420;
    int _2472 = _2470 + _2462;
    int _2474 = _2472 + 1;
    int _2476 = _742 * _2474;
    int _2478 = _2476 + _2358;
    float _2480 = 1.0 / _2468;
    float _2482 = as_type<float>(_2474);
    float _2484 = _2040;
    float _2486 = _2084;
    if (_2296)
    {
        float _2488 = in.m_55.x;
        _2482 = _2488;
    }
    float _2490 = _2482;
    int _2492 = int(_2406) + int(_2442);
    bool _2494 = !_2151;
    int _2496 = _2494 ? _2478 : (-1);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _2498 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2500 = isnan(_558);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2506 = _2502 || _2504;
    float _2508 = float(_2506);
    int _2510 = _2185 * _2492;
    int _2512 = _2510 + _2334;
    int _2514 = _2496 >> 31;
    int _2516 = _2496 & 3;
    bool _2518 = _2516 != 0;
    int _2520 = _2514 & 3;
    bool _2522 = uint(_2516) > 1u;
    int _2524 = _2496 + _2520;
    float _2526 = -_2424;
    float _2528 = _2526 + 1.0;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2532 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2530;
    int _2534 = _2524 >> 2;
    float _2536 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2540 = _2424;
    if (_2354)
    {
        float _2542 = _2464 ? _2528 : _2424;
        _2540 = _2542;
    }
    float _2544 = _2540;
    float _2546 = _2532 * _2374;
    int _2548 = _2534 << 4;
    int _2550 = _2548 + 368;
    float _2552 = _2538 * _2480;
    bool _2554 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2556 = isnan(_558);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    float _2566 = fma(_2546, _2428, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    uint _2568 = uint(int(uint(_2550) >> uint(2)));
    uint _2570 = uint(int(uint(int(_2568)) >> uint(2)));
    int _2572 = int(_2568) & 3;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[int(_2570)][_2572];
    int _2576 = int(_2568) + 1;
    uint _2578 = uint(int(uint(_2576) >> uint(2)));
    int _2580 = _2576 & 3;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[int(_2578)][_2580];
    bool _2584 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2586 = isnan(_558);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = fma(_2552, _2304, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2598 = -_2564;
    float _2600 = _2598 + 1.0;
    bool _2602 = _2490 > 0.5;
    bool _2604 = _2602 && _2296;
    float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2608 = _558 + _2606;
    int _2610 = _2496 & 3;
    bool _2612 = _2610 != 0;
    float _2614 = _2594 * _2600;
    float _2616 = -_2594;
    float _2618 = _2616 + 1.0;
    float _2620 = -_2508;
    float _2622 = _2620 + 1.0;
    int _2624 = _2612 ? 0 : 1;
    float _2626 = fma(_2444, _2608, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2628 = _2508 * _2618;
    float _2630 = _2456 * _2622;
    int _2632 = ~_2624;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    int _2638 = _2550 + 8;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    uint _2642 = uint(int(uint(int(_2640)) >> uint(2)));
    int _2644 = int(_2640) & 3;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[int(_2642)][_2644];
    int _2648 = int(_2640) + 1;
    uint _2650 = uint(int(uint(_2648) >> uint(2)));
    int _2652 = _2648 & 3;
    float _2654 = (*spvDescriptorSet0.vp_c9)._m0[int(_2650)][_2652];
    int _2656 = _2636;
    if (!_2522)
    {
        int _2658 = ~_2624;
        int _2660 = _2658 + 1;
        _2656 = _2660;
    }
    int _2662 = _2656;
    float _2664 = _2566 * _2630;
    float _2666 = -_2456;
    float _2668 = _2666 + 1.0;
    bool _2670 = !_2518;
    int _2672 = _2670 ? 0 : 1;
    float _2674 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2676 = int(_2674);
    bool _2678 = _2516 != 3;
    float _2680 = -_2116;
    float _2682 = _2680 + 1.0;
    bool _2684 = uint(_2516) >= 2u;
    bool _2686 = uint(_2512) >= uint(_742);
    int _2688 = abs(_2662);
    int _2690 = _2684 ? 0 : 1;
    float _2692 = abs(_1686);
    float _2694 = log2(_2692);
    int _2696 = abs(_2672);
    float _2698 = fma(_2668, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2664);
    int _2700 = ~_2688;
    int _2702 = _2700 + 1;
    int _2704 = _2702 + 1;
    int _2706 = ~_2690;
    int _2708 = _2706 + 1;
    int _2710 = _2708 + 1;
    float _2712 = fma(_2596, _2628, _2698);
    bool _2714 = _2516 != 3;
    int _2716 = _2710;
    if (_2678)
    {
        int _2718 = ~_2690;
        int _2720 = _2718 + 1;
        _2716 = _2720;
    }
    int _2722 = _2716;
    float _2724 = fma(_2626, _2614, _2712);
    int _2726 = ~_2696;
    int _2728 = _2726 + 1;
    int _2730 = _2728 + 1;
    bool _2732 = !_2714;
    int _2734 = _2732 ? 0 : (-1);
    bool _2736 = !_2686;
    int _2738 = _2736 ? 0 : (-1);
    int _2740 = abs(_2734);
    int _2742 = _2704 * as_type<int>(_2582);
    int _2744 = abs(_2722);
    bool _2746 = !_2370;
    int _2748 = _2746 ? 0 : 1;
    int _2750 = _2730 * as_type<int>(_2574);
    int _2752 = _2750 + _2742;
    float _2754 = in.m_69.x;
    float _2756 = in.m_69.y;
    float _2758 = in.m_69.z;
    int _2760 = ~_2492;
    int _2762 = _2760 + _2738;
    int _2764 = _2762 + 1;
    float _2766 = float(uint(_2676));
    bool _2768 = _1176 != 0.0;
    bool _2770 = isnan(_1176);
    bool _2772 = _2768 || _2770;
    bool _2774 = isnan(0.0);
    bool _2776 = _2772 || _2774;
    int _2778 = _742 * _2764;
    int _2780 = _2778 + _2334;
    int _2782 = abs(_2748);
    float _2784 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2786 = 1.0 / _2766;
    int _2788 = ~_2744;
    int _2790 = _2788 + 1;
    int _2792 = _2790 + 1;
    int _2794 = abs(_2676);
    bool _2796 = _1174 == 0.0;
    bool _2798 = !_2776;
    bool _2800 = _2796 && _2798;
    int _2802 = _2792 * as_type<int>(_2646);
    int _2804 = _2802 + _2752;
    float _2806 = exp2(_2784);
    int _2808 = ~_2740;
    int _2810 = _2808 + 1;
    int _2812 = _2810 + 1;
    bool _2814 = _1178 == 0.0;
    bool _2816 = _2814 && _2800;
    float _2818 = float(uint(_2794));
    int _2820 = _2812 * as_type<int>(_2654);
    int _2822 = _2820 + _2804;
    int _2824 = ~_2782;
    int _2826 = _2824 + 1;
    int _2828 = _2826 + 1;
    float _2830 = 1.0 / _2818;
    bool _2832 = !_2151;
    int _2834 = _2832 ? _2780 : (-1);
    int _2836 = _2822 * _2828;
    int _2838 = as_type<int>(_2786) + (-2);
    int _2840 = _2834 * _2782;
    int _2842 = _2840 + _2836;
    float _2844 = _2758;
    float _2846 = _2756;
    float _2848 = _2754;
    if (!_2816)
    {
        float _2850 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2758);
        _2844 = _2850;
    }
    float _2852 = _2844;
    if (!_2816)
    {
        float _2854 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2756);
        _2846 = _2854;
    }
    float _2856 = _2846;
    if (!_2816)
    {
        float _2858 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2754);
        _2848 = _2858;
    }
    float _2860 = _2848;
    float _2862 = float(uint(_2842));
    float _2864 = in.m_65.x;
    int _2866 = abs(_2842);
    float _2868 = fma(_2806, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2870 = precise::clamp(_2868, 0.0, 1.0);
    int _2872 = as_type<int>(_2830) + (-2);
    float _2874 = as_type<float>(_2838) * _2862;
    float _2876 = float(uint(_2866));
    float _2878 = fma(_2870, -2.0, 3.0);
    float _2880 = _2870 * _2870;
    float _2882 = fma(_2564, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2724);
    float _2884 = trunc(_2874);
    float _2886 = precise::max(_2884, 0.0);
    uint _2888 = uint(_2886);
    float _2890 = as_type<float>(_2872) * _2876;
    float _2892 = _2880 * _2878;
    float _2894 = _2882 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2896 = -_2892;
    float _2898 = _2896 + 1.0;
    int _2900 = ~_2676;
    int _2902 = _2900 + 1;
    float _2904 = trunc(_2890);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    int _2910 = ~_2794;
    int _2912 = _2910 + 1;
    float _2914 = fma(_2898, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2892);
    float _2916 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2918 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2922 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2924 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (_2296)
    {
        _2922 = _2864;
    }
    float _2926 = _2922;
    int _2928 = _2902 * int(_2888);
    int _2930 = _2928 + _2842;
    float _2932 = _2926;
    if (!_2296)
    {
        _2924 = _2864;
    }
    float _2934 = _2924;
    float _2936 = _2916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2938 = _2918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2940 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2942 = float(uint(_2930));
    float _2944 = _2934;
    if (_2604)
    {
        float _2946 = -_2926;
        float _2948 = _2946 + 1.0;
        _2932 = _2948;
    }
    float _2950 = _2932;
    bool _2952 = _1686 <= 8000.0;
    bool _2954 = isnan(_1686);
    bool _2956 = _2952 || _2954;
    bool _2958 = isnan(8000.0);
    bool _2960 = _2956 || _2958;
    float _2962 = float(_2960);
    int _2964 = _2912 * int(_2908);
    int _2966 = _2964 + _2866;
    float _2968 = _1290 * _1206;
    float _2970 = as_type<float>(_2838) * _2942;
    if (_2296)
    {
        _2944 = _2950;
    }
    float _2972 = _2944;
    float _2974 = _2962 * _2914;
    float _2976 = float(uint(_2966));
    float _2978 = trunc(_2970);
    float _2980 = precise::max(_2978, 0.0);
    uint _2982 = uint(_2980);
    float _2984 = _1268 * _1206;
    float _2986 = _1268 * _1208;
    float _2988 = _1282 * _1206;
    float _2990 = as_type<float>(_2872) * _2976;
    float _2992 = _1268 * _1220;
    float _2994 = _1282 * _1208;
    float _2996 = _1282 * _1220;
    float _2998 = _1290 * _1208;
    out.m_71.x = _2936;
    out.m_71.y = _2938;
    out.m_71.z = _2940;
    out.m_71.w = _2894;
    float _3000 = trunc(_2990);
    float _3002 = precise::max(_3000, 0.0);
    uint _3004 = uint(_3002);
    float _3006 = _1290 * _1220;
    float _3008 = fma(_1274, _1310, _2996);
    float _3010 = fma(_1278, _1318, _2968);
    float _3012 = -_1262;
    float _3014 = fma(_3012, _1310, _2992);
    float _3016 = fma(_1278, _1310, _3006);
    int _3018 = int(_2888) + int(_2982);
    float _3020 = fma(_1274, _1318, _2988);
    float _3022 = fma(_1274, _1324, _2994);
    int _3024 = ~_2676;
    int _3026 = _3024 + 1;
    float _3028 = -_1262;
    float _3030 = fma(_3028, _1324, _2986);
    float _3032 = fma(_1278, _1324, _2998);
    int _3034 = ~_2794;
    int _3036 = _3034 + 1;
    float _3038 = -_1262;
    float _3040 = fma(_3038, _1318, _2984);
    int _3042 = int(_2908) + int(_3004);
    int _3044 = _3026 * _3018;
    int _3046 = _3044 + _2842;
    float _3048 = fma(_1272, _706, _3014);
    float _3050 = fma(_1272, _710, _3030);
    float _3052 = fma(_1294, _710, _3022);
    int _3054 = _3036 * _3042;
    int _3056 = _3054 + _2866;
    bool _3058 = uint(_3046) >= uint(_2676);
    float _3060 = fma(_1272, _704, _3040);
    float _3062 = fma(_1294, _704, _3020);
    float _3064 = fma(_1302, _704, _3010);
    float _3066 = fma(_1294, _706, _3008);
    float _3068 = fma(_1302, _710, _3032);
    bool _3070 = uint(_3056) >= uint(_2794);
    float _3072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3074 = !_3058;
    int _3076 = _3074 ? 0 : (-1);
    float _3078 = fma(_1302, _706, _3016);
    int _3080 = _2842 ^ _2676;
    float _3082 = _3060 * _2856;
    bool _3084 = !_3070;
    int _3086 = _3084 ? 0 : (-1);
    float _3088 = _3050 * _2856;
    int _3090 = ~_3018;
    int _3092 = _3090 + _3076;
    int _3094 = _3092 + 1;
    float _3096 = _3048 * _2856;
    uint _3098 = uint(int(uint(_3080) >> uint(31)));
    float _3100 = fma(_3052, _2860, _3088);
    int _3102 = ~_3086;
    int _3104 = _3042 + _3102;
    int _3106 = _3104 + 1;
    float _3108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3110 = ~int(_3098);
    int _3112 = _3110 + 1;
    int _3114 = _2676 * _3094;
    int _3116 = _3114 + _2842;
    bool _3118 = _2676 == 0;
    float _3120 = fma(_3062, _2860, _3082);
    float _3122 = _3072 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3124 = _3106 ^ _3112;
    float _3126 = fma(_3066, _2860, _3096);
    bool _3128 = !_3118;
    int _3130 = _3128 ? _3116 : (-1);
    float _3132 = fma(_3122, _2972, -0.5);
    bool _3134 = _2676 == 0;
    float _3136 = fma(_3064, _2852, _3120);
    float _3138 = float(_3130);
    float _3140 = fma(_3068, _2852, _3100);
    int _3142 = ~_3112;
    int _3144 = _3142 + _3124;
    int _3146 = _3144 + 1;
    float _3148 = fma(_3078, _2852, _3126);
    float _3150 = _3108 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3152 = fma(_3122, _3138, _822);
    bool _3154 = !_3134;
    int _3156 = _3154 ? _3146 : (-1);
    float _3158 = _2040 * 0.5;
    float _3160 = fma(_3150, _2544, -0.5);
    float _3162 = fma(_942, _3132, _3152);
    float _3164 = float(_3156);
    float _3166 = in.m_73.x;
    float _3168 = fma(_2084, -0.5, _3158);
    float _3170 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3172 = -_924;
    float _3174 = fma(_3150, _3164, _3172);
    float _3176 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2167);
    float _3178 = _2682 * _3170;
    float _3180 = precise::clamp(_3178, 0.0, 1.0);
    float _3182 = _2082 + _2040;
    float _3184 = fma(_944, _3160, _3174);
    float _3186 = _3162 + 0.5;
    float _3188 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3190 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3176);
    float _3192 = _3184 + 0.5;
    float _3194 = -_3180;
    float _3196 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3198 = _3188 * _2118;
    out.m_75.x = _3136;
    out.m_75.y = _3140;
    out.m_75.z = _3148;
    bool _3200 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3202 = isnan(_1830);
    bool _3204 = _3200 || _3202;
    bool _3206 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3208 = _3204 || _3206;
    float _3210 = _3190 + _2040;
    out.m_77.x = _3186;
    out.m_77.y = _3192;
    float _3212 = _2143 * _3198;
    float _3214 = _3210 * 0.5;
    float _3216 = _3182 * 0.5;
    out.gl_Position.x = _2082;
    out.gl_Position.y = _2084;
    out.gl_Position.z = _3190;
    out.gl_Position.w = _2040;
    float _3218 = _3196 * _3166;
    float _3220 = fma(_2133, _3212, _2131);
    out.m_79.x = _3216;
    out.m_79.y = _3168;
    out.m_79.z = _3214;
    out.m_79.w = _2040;
    float _3222 = _3218 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3224 = _2133 * _3198;
    float _3226 = fma(_2139, _3224, _2127);
    float _3228 = fma(_2141, _3224, _2129);
    out.m_81.x = _3222;
    float _3230 = -_3188;
    float _3232 = _3230 + 1.0;
    float _3234 = _3190;
    float _3236 = _3168;
    float _3238 = _3216;
    if (!_3208)
    {
        _2484 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3240 = _2484;
    float _3242 = _3240;
    float _3244 = _3240;
    if (!_3208)
    {
        _3234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3246 = _3234;
    float _3248 = _2133 * _3232;
    float _3250 = _1740 * _1800;
    float _3252 = _3250;
    float _3254 = _3246;
    float _3256 = _3246;
    if (!_3208)
    {
        _3236 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3258 = _3236;
    float _3260 = _3258;
    float _3262 = _3258;
    if (!_3208)
    {
        _3238 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3264 = _3238;
    out.m_83.x = _3226;
    out.m_83.y = _3228;
    out.m_83.z = _3220;
    out.m_83.w = _3248;
    float _3266 = _3250 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3268 = _3264;
    float _3270 = _3264;
    if (!_3208)
    {
        _2486 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3272 = _2486;
    float _3274 = _3272;
    float _3276 = _3272;
    if (!_3208)
    {
        _3252 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3278 = _3252;
    bool _3280 = !_3208;
    float _3282 = _3278;
    float _3284 = _3278;
    if (!_3280)
    {
        bool _3286 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3288 = isnan(_1830);
        bool _3290 = _3286 || _3288;
        bool _3292 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3294 = _3290 || _3292;
        if (!_3294)
        {
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3298 = _1830 + _3296;
            float _3300 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3302 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3300;
            float _3304 = 1.0 / _3302;
            float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3326 = _3298 * _3304;
            float _3328 = precise::clamp(_3326, 0.0, 1.0);
            float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3332 = _3330 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3334 = fma(_3328, _3308, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3336 = fma(_3328, _3332, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3338 = fma(_3328, _3312, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3340 = fma(_3328, _3316, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3342 = fma(_3328, _3320, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3344 = fma(_3328, _3324, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3270 = _3336;
            _3276 = _3342;
            _3262 = _3334;
            _3256 = _3340;
            _3244 = _3338;
            _3284 = _3344;
            _3346 = true;
        }
        else
        {
            bool _3348 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3350 = isnan(_1830);
            bool _3352 = _3348 || _3350;
            bool _3354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3356 = _3352 || _3354;
            if (!_3356)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3358 = _3260;
            _3262 = _3358;
            if (!_3356)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3360 = _3268;
            _3270 = _3360;
            if (!_3356)
            {
                _3242 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3362 = _3242;
            _3244 = _3362;
            if (!_3356)
            {
                _3254 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3364 = _3254;
            _3256 = _3364;
            if (!_3356)
            {
                _3274 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3366 = _3274;
            _3276 = _3366;
            if (!_3356)
            {
                _3282 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3368 = _3282;
            bool _3370 = !_3356;
            _3284 = _3368;
            if (!_3370)
            {
                bool _3372 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3374 = isnan(_1830);
                bool _3376 = _3372 || _3374;
                bool _3378 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3380 = _3376 || _3378;
                if (!_3380)
                {
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3384 = _1830 + _3382;
                    float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3388 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3386;
                    float _3390 = 1.0 / _3388;
                    float _3392 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3394 = _3392 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3412 = _3384 * _3390;
                    float _3414 = precise::clamp(_3412, 0.0, 1.0);
                    float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3420 = fma(_3414, _3394, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3422 = fma(_3414, _3418, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3424 = fma(_3414, _3398, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3426 = fma(_3414, _3402, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3428 = fma(_3414, _3406, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3430 = fma(_3414, _3410, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3270 = _3422;
                    _3276 = _3428;
                    _3262 = _3420;
                    _3256 = _3426;
                    _3244 = _3424;
                    _3284 = _3430;
                    _3346 = true;
                }
                else
                {
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3276 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3256 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3244 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3284 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3346 = false;
    float _3432 = _3270;
    float _3434 = _3276;
    float _3436 = _3262;
    float _3438 = _3256;
    float _3440 = _3244;
    float _3442 = _3284;
    float _3444 = fma(_3140, -0.5, 0.5);
    float _3446 = precise::clamp(_3444, 0.0, 1.0);
    float _3448 = -_3432;
    float _3450 = _3448 + _3434;
    float _3452 = _3266 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3454 = -_3436;
    float _3456 = _3454 + _3438;
    float _3458 = fma(_3446, _3450, _3432);
    out.m_85.x = 0.0;
    float _3460 = -_3440;
    float _3462 = _3460 + _3442;
    float _3464 = fma(_3446, _3456, _3436);
    float _3466 = _3458 * 0.586610972881317138671875;
    out.m_49.x = _3452;
    bool _3468 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3470 = fma(_3446, _3462, _3440);
    float _3472 = fma(_3464, 0.298911988735198974609375, _3466);
    bool _3474 = _1740 > 0.0;
    bool _3476 = isnan(_1740);
    bool _3478 = _3474 || _3476;
    bool _3480 = isnan(0.0);
    bool _3482 = _3478 || _3480;
    float _3484 = fma(_3470, 0.114477999508380889892578125, _3472);
    bool _3486 = _1800 <= 0.0;
    bool _3488 = !_3482;
    bool _3490 = _3486 || _3488;
    float _3492 = -_3484;
    float _3494 = _3464 + _3492;
    float _3496 = -_3484;
    float _3498 = _3458 + _3496;
    float _3500 = -_3484;
    float _3502 = _3470 + _3500;
    float _3504 = fma(_3494, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3484);
    float _3506 = fma(_3498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3484);
    float _3508 = fma(_3502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3484);
    bool _3510 = !_3468;
    if (!_3510)
    {
        float _3512 = -_1666;
        float _3514 = _3512 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3516 = -_1668;
        float _3518 = _3516 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3520 = -_1670;
        float _3522 = _3520 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3524 = _3514 * _3514;
        float _3526 = fma(_3518, _3518, _3524);
        float _3528 = fma(_3522, _3522, _3526);
        float _3530 = sqrt(_3528);
        float _3532 = rsqrt(_3528);
        float _3534 = -_3530;
        float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3538 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3540 = precise::clamp(_3538, 0.0, 1.0);
        float _3542 = _3518 * _3532;
        float _3544 = _3514 * _3532;
        float _3546 = abs(_3540);
        float _3548 = log2(_3546);
        float _3550 = _3522 * _3532;
        float _3552 = _3542 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3554 = _3140 * _3544;
        float _3556 = -_3544;
        float _3558 = -_3552;
        float _3560 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3558);
        float _3562 = fma(_3136, _3542, _3554);
        float _3564 = -_3550;
        float _3566 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3560);
        float _3568 = fma(_3148, _3550, _3562);
        float _3570 = precise::clamp(_3568, 0.0, 1.0);
        float _3572 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3574 = _3566 + _3572;
        float _3576 = _3548 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3578 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3580 = precise::clamp(_3578, 0.0, 1.0);
        float _3582 = exp2(_3576);
        float _3584 = _3582 * _3580;
        float _3586 = _3570 * _3584;
        float _3588 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3590 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3592 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _3588;
        out.m_85.y = _3590;
        out.m_85.z = _3592;
    }
    out.m_87.x = _3504;
    out.m_87.y = _3506;
    out.m_87.z = _3508;
    if (!_3490)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3594 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3594;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3346 = false;
    bool _550 = false;
    bool _434 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3651 = as_type<float>(_122);
        out.gl_Position.z = _3651;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3720 = as_type<float>(_160);
        out.gl_Position.z = _3720;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_53.x;
    float _164 = in.m_53.y;
    float _166 = in.m_53.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_168;
    float _190 = _184;
    float _192 = _182;
    float _210;
    if (!_188)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_106);
        float _216 = 1.0 / _214;
        float _218 = _140 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _220 + _226;
    bool _230 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _232 = isnan(_220);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _220 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = 1.0 / _244;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _256;
    float _264 = 1.0 / _252;
    float _266 = _224 * _258;
    bool _268 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = isnan(_220);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -_240;
    float _282 = _280 + 1.0;
    float _284 = _278 * _282;
    float _286 = _228 * _262;
    bool _288 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_220);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _300;
    bool _304 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_220);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = -_278;
    float _322 = _320 + 1.0;
    float _324 = -_298;
    float _326 = _324 + 1.0;
    float _328 = _248 * _264;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _314 * _326;
    float _340 = fma(_302, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = _298 * _322;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = _342 * _338;
    float _354 = _344 * _338;
    float _356 = _340 * _338;
    float _358 = -_314;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _372;
    float _376 = fma(_318, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_364, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_350, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _386;
    float _390 = fma(_376, _346, _366);
    float _392 = fma(_374, _266, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _394 = fma(_384, _266, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _396 = fma(_388, _266, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_378, _346, _368);
    float _400 = fma(_380, _346, _370);
    float _402 = fma(_392, _284, _390);
    float _404 = fma(_394, _284, _398);
    float _406 = fma(_396, _284, _400);
    float _408 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].x, _402);
    float _410 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].y, _404);
    float _412 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].z, _406);
    bool _414 = !_260;
    float _432;
    if (!_414)
    {
        float _416 = in.m_55.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        float _436 = float(_106);
        float _438 = 1.0 / _436;
        float _440 = _140 * _438;
        _432 = _440;
    }
    _434 = false;
    float _442 = _432;
    float _444 = in.m_57.x;
    float _446 = in.m_57.y;
    float _448 = in.m_57.z;
    bool _450 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _452 = isnan(_442);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _466 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _468 = isnan(_442);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _442 + _482;
    float _486 = -_460;
    float _488 = _486 + 1.0;
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _492 = 1.0 / _464;
    float _494 = _476 * _488;
    float _496 = -_476;
    float _498 = _496 + 1.0;
    float _500 = _412 * _448;
    float _502 = _410 * _446;
    float _504 = _480 * _492;
    float _506 = _408 * _444;
    float _508 = fma(_504, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _510 = _508 * _494;
    float _512 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[115].x, _510);
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _520 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[116].x, _512);
    float _522 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _524 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _526 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _528 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _522;
    out.m_59.y = _524;
    out.m_59.z = _526;
    out.m_59.w = _528;
    bool _530 = !_490;
    float _548;
    if (!_530)
    {
        float _532 = in.m_55.x;
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        float _552 = float(_106);
        float _554 = 1.0 / _552;
        float _556 = _140 * _554;
        _548 = _556;
    }
    _550 = false;
    float _558 = _548;
    float _560 = in.m_46.x;
    float _562 = in.m_46.y;
    float _564 = in.m_46.z;
    float _566 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _568 = int(_566);
    float _570 = in.m_55.z;
    float _572 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _574 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _576 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _578 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _580 = log2(_578);
    float _582 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _584 = -_576;
    float _586 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _584);
    bool _588 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = float(_568);
    float _600 = 1.0 / _598;
    float _602 = _562 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _604 = _562 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _606 = _562 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _608 = _580 * _140;
    float _610 = fma(_560, (*spvDescriptorSet0.vp_c10)._m0[5].x, _602);
    float _612 = fma(_560, (*spvDescriptorSet0.vp_c10)._m0[4].x, _604);
    float _614 = fma(_560, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
    float _616 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[5].z, _610);
    float _618 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    float _620 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[6].z, _614);
    float _622 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _624 = _616 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _626 = _618 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _628 = _620 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _630 = -_622;
    float _632 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _630);
    float _634 = -_624;
    float _636 = _634 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _638 = -_626;
    float _640 = _638 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _642 = -_628;
    float _644 = _642 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _646 = exp2(_608);
    float _648 = _636 * _636;
    float _650 = _600 * _140;
    float _652 = fma(_640, _640, _648);
    float _654 = fma(_644, _644, _652);
    float _656 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _658 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _660 = rsqrt(_654);
    float _662 = -_656;
    float _664 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _662);
    float _666 = -_658;
    float _668 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _666);
    float _670 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _672 = -_646;
    float _674 = _672 + 1.0;
    float _676 = _668 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _678 = -_670;
    float _680 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _678);
    float _682 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _684 = _668 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _686 = -_676;
    float _688 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[1].x, _686);
    float _690 = _668 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _692 = -_682;
    float _694 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _692);
    float _696 = -_684;
    float _698 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _700 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[1].w, _688);
    float _702 = _570 * 2.0;
    float _704 = _640 * _660;
    float _706 = _644 * _660;
    float _708 = _700 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _710 = _636 * _660;
    float _712 = _704 * _704;
    float _714 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].w, _698);
    float _716 = -_690;
    float _718 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[0].x, _716);
    float _720 = _596 ? _674 : 0.0;
    float _722 = fma(_706, _706, _712);
    float _724 = _664 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _726 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[0].w, _718);
    float _728 = -_724;
    float _730 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[1].y, _728);
    float _732 = rsqrt(_722);
    float _734 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[1].w, _730);
    float _736 = -_708;
    float _738 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _738);
    float _746 = _706 * _732;
    float _748 = _704 * _732;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _752 = in.m_55.x;
    float _754 = in.m_55.y;
    float _756 = -_746;
    float _758 = _706 * _756;
    float _760 = _710 * _748;
    float _762 = -_746;
    float _764 = _710 * _762;
    float _766 = -_758;
    float _768 = fma(_704, _748, _766);
    float _770 = _586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _772 = _768 * _768;
    float _774 = float(_742);
    float _776 = fma(_760, _760, _772);
    float _778 = -_770;
    float _780 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _778);
    float _782 = floor(_702);
    float _784 = fma(_764, _764, _776);
    float _786 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _780);
    float _788 = _774 * _140;
    float _790 = -_786;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[0].w, _744);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _796 = rsqrt(_784);
    float _798 = _754 + _752;
    float _800 = _752 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _802 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _804 = _798 + (-1.0);
    float _806 = -_750;
    float _808 = fma(_800, 2.0, _806);
    float _810 = fma(_802, -2.0, _794);
    float _812 = 1.0 / _792;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _816 = _664 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _818 = _668 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _820 = -_140;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[76].x, _808);
    float _824 = -_816;
    float _826 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[0].y, _824);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _830 = 1.0 + _828;
    float _832 = _768 * _796;
    float _834 = precise::clamp(_832, 0.0, 1.0);
    float _836 = -_818;
    float _838 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _836);
    float _840 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[0].w, _826);
    bool _842 = _782 > 0.0;
    float _844 = -_834;
    float _846 = _844 + 1.0;
    bool _848 = _782 >= 0.0;
    bool _850 = isnan(_782);
    bool _852 = _848 || _850;
    bool _854 = isnan(0.0);
    bool _856 = _852 || _854;
    float _858 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[0].w, _838);
    float _860 = 1.0 / _830;
    float _862 = fma(_726, _812, -1.0);
    float _864 = _846 * _812;
    float _866 = _752 * 2.0;
    float _868 = fma(_846, _862, 1.0);
    float _870 = _840 * _864;
    float _872 = _858 * _864;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _876 = _868 * _868;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _880 = _878 != 0;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _888 = _886 != 0;
    float _890 = floor(_866);
    float _892 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].w, _874);
    float _894 = fma(_870, _870, _876);
    bool _896 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _898 = isnan(1.0);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _904 = _900 || _902;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _908 = !_884;
    int _910 = _908 ? 0 : 1;
    float _912 = fma(_872, _872, _894);
    bool _914 = !_880;
    int _916 = _914 ? 0 : 1;
    float _918 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[78].z, _906);
    bool _920 = !_888;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _810);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _932 = _930 != 0;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _936 = _934 != 0;
    float _938 = rsqrt(_912);
    int _940 = _856 ? 0 : 1;
    float _942 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _918);
    float _944 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _892);
    if (_904)
    {
        float _946 = _720 * _860;
        _144 = _946;
    }
    float _948 = _144;
    bool _950 = !_928;
    int _952 = _950 ? 0 : 1;
    float _954 = _754 * 2.0;
    int _956 = ~_940;
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    int _962 = _960;
    if (!_842)
    {
        int _964 = ~_940;
        int _966 = _964 + 1;
        _962 = _966;
    }
    int _968 = _962;
    float _970 = floor(_954);
    int _972 = abs(_952);
    float _974 = float(_968);
    float _976 = float(_972);
    float _978 = _872 * _938;
    float _980 = _868 * _938;
    float _982 = _870 * _938;
    bool _984 = _890 > 0.0;
    float _986 = -_978;
    float _988 = _704 * _986;
    bool _990 = _890 >= 0.0;
    bool _992 = isnan(_890);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.0);
    bool _998 = _994 || _996;
    float _1000 = _706 * _980;
    float _1002 = in.m_61.x;
    float _1004 = in.m_61.y;
    float _1006 = in.m_61.z;
    float _1008 = -_982;
    float _1010 = -_988;
    float _1012 = fma(_706, _1008, _1010);
    float _1014 = _976 * _974;
    float _1016 = -_978;
    float _1018 = -_1000;
    float _1020 = fma(_710, _1016, _1018);
    float _1022 = -_982;
    float _1024 = _710 * _1022;
    float _1026 = _1012 * _1012;
    bool _1028 = _970 > 0.0;
    float _1030 = _1014 * (-2.0);
    float _1032 = -_1024;
    float _1034 = fma(_704, _980, _1032);
    float _1036 = fma(_1020, _1020, _1026);
    int _1038 = _998 ? 0 : 1;
    float _1040 = fma(_814, _1030, _814);
    bool _1042 = _970 >= 0.0;
    bool _1044 = isnan(_970);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = fma(_1034, _1034, _1036);
    int _1054 = ~_1038;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = _752 + (-0.5);
    int _1062 = _1058;
    if (!_984)
    {
        int _1064 = ~_1038;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    int _1070 = _1050 ? 0 : 1;
    float _1072 = rsqrt(_1052);
    bool _1074 = !_936;
    int _1076 = _1074 ? 0 : 1;
    int _1078 = ~_1070;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = fma(_1030, _1002, _1002);
    bool _1086 = !_932;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = _1082;
    if (!_1028)
    {
        int _1092 = ~_1070;
        int _1094 = _1092 + 1;
        _1090 = _1094;
    }
    int _1096 = _1090;
    float _1098 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1084);
    int _1100 = abs(_1088);
    float _1102 = _754 + _570;
    int _1104 = abs(_1076);
    float _1106 = fma(_1040, _948, _1098);
    float _1108 = float(_1068);
    float _1110 = _1102 + (-1.0);
    float _1112 = float(_1100);
    float _1114 = _1020 * _1072;
    float _1116 = float(_1096);
    float _1118 = _1034 * _1072;
    float _1120 = float(_1104);
    float _1122 = _1112 * _1108;
    float _1124 = _706 * _1114;
    float _1126 = _1012 * _1072;
    float _1128 = _1120 * _1116;
    float _1130 = _1122 * (-2.0);
    float _1132 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1134 = -_1124;
    float _1136 = fma(_704, _1118, _1134);
    float _1138 = _710 * _1118;
    float _1140 = fma(_1130, _1004, _1004);
    float _1142 = fma(_1132, _1130, _1132);
    float _1144 = _704 * _1126;
    float _1146 = -_1138;
    float _1148 = fma(_706, _1126, _1146);
    float _1150 = _1136 * _1136;
    float _1152 = _754 + (-0.5);
    float _1154 = -_1144;
    float _1156 = fma(_710, _1114, _1154);
    float _1158 = _570 + _752;
    float _1160 = fma(_1148, _1148, _1150);
    float _1162 = _1106 * 0.15915493667125701904296875;
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1140);
    float _1166 = fma(_1156, _1156, _1160);
    float _1168 = _1158 + (-1.0);
    float _1170 = _1128 * (-2.0);
    float _1172 = _570 + (-0.5);
    float _1174 = in.m_63.x;
    float _1176 = in.m_63.y;
    float _1178 = in.m_63.z;
    float _1180 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1182 = rsqrt(_1166);
    float _1184 = fma(_1170, _1006, _1006);
    float _1186 = fma(_1142, _948, _1164);
    float _1188 = fma(_1180, _1170, _1180);
    float _1190 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1184);
    float _1192 = _1186 * 0.15915493667125701904296875;
    float _1194 = _1162 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = fma(_1188, _948, _1190);
    float _1200 = _1198 * 0.15915493667125701904296875;
    float _1202 = _1162 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = _1148 * _1182;
    float _1208 = _1136 * _1182;
    float _1210 = _710 * _1206;
    float _1212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1176);
    float _1214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1174);
    float _1216 = _1192 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _1156 * _1182;
    float _1222 = _706 * _1208;
    float _1224 = -_1210;
    float _1226 = fma(_704, _1208, _1224);
    float _1228 = _572 * _1212;
    float _1230 = _704 * _1220;
    float _1232 = -_1222;
    float _1234 = fma(_710, _1220, _1232);
    float _1236 = _582 * _1214;
    float _1238 = _1192 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = -_1230;
    float _1244 = fma(_706, _1206, _1242);
    float _1246 = _1244 * _1244;
    float _1248 = _1200 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = fma(_1234, _1234, _1246);
    float _1254 = _1204 * _1218;
    float _1256 = _1196 * _1218;
    float _1258 = fma(_1226, _1226, _1252);
    float _1260 = _1200 * 6.283185482025146484375;
    float _1262 = sin(_1260);
    float _1264 = _1204 * _1240;
    float _1266 = _1196 * _1240;
    float _1268 = _1204 * _1250;
    float _1270 = rsqrt(_1258);
    float _1272 = _1196 * _1250;
    float _1274 = _1240 * _1250;
    float _1276 = _1268 * _1228;
    float _1278 = _1218 * _1250;
    float _1280 = _574 * _1178;
    float _1282 = fma(_1262, _1264, _1256);
    float _1284 = -_1228;
    float _1286 = _1262 * _1284;
    float _1288 = -_1266;
    float _1290 = fma(_1262, _1254, _1288);
    float _1292 = -_1254;
    float _1294 = fma(_1262, _1266, _1292);
    float _1296 = fma(_1282, _1236, _1276);
    float _1298 = _1272 * _1228;
    float _1300 = fma(_1274, _1236, _1286);
    float _1302 = fma(_1262, _1256, _1264);
    float _1304 = fma(_1290, _1280, _1296);
    float _1306 = fma(_1294, _1236, _1298);
    float _1308 = fma(_1278, _1280, _1300);
    float _1310 = _1226 * _1270;
    float _1312 = _1220 * _1304;
    float _1314 = fma(_1302, _1280, _1306);
    float _1316 = _1206 * _1304;
    float _1318 = _1234 * _1270;
    float _1320 = fma(_1310, _1308, _1312);
    float _1322 = _1208 * _1304;
    float _1324 = _1244 * _1270;
    float _1326 = fma(_1318, _1308, _1316);
    float _1328 = fma(_706, _1314, _1320);
    float _1330 = fma(_704, _1314, _1326);
    float _1332 = _628 + _1328;
    float _1334 = _626 + _1330;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1338 = _1332 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1342 = _1334 + _1340;
    float _1344 = _1338 * _1338;
    float _1346 = fma(_1342, _1342, _1344);
    float _1348 = fma(_1324, _1308, _1322);
    float _1350 = _624 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1352 = sqrt(_1346);
    float _1354 = fma(_710, _1314, _1348);
    float _1356 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1350);
    float _1358 = _624 + _1354;
    float _1360 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1356);
    bool _1362 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = _1354;
    float _1366 = _1350;
    float _1368 = _1356;
    if (!_1362)
    {
        _1364 = _1334;
    }
    float _1370 = _1364;
    float _1372 = _1370;
    if (!_1362)
    {
        _1366 = _1332;
    }
    float _1374 = _1366;
    float _1376 = _1374;
    if (!_1362)
    {
        _1368 = _1358;
    }
    float _1378 = _1368;
    bool _1380 = !_1362;
    float _1382 = _1378;
    if (!_1380)
    {
        float _1384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1388 = _1352 + _1386;
        float _1390 = _1358 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = rsqrt(_1346);
        float _1394 = _1388 * _1384;
        float _1396 = _1394 * 0.15915493667125701904296875;
        float _1398 = _1396 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1396 * 6.283185482025146484375;
        float _1404 = sin(_1402);
        float _1406 = _1400 + (-1.0);
        float _1408 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1410 = fma(_1404, _1390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1412 = fma(_1358, _1400, _1408);
        float _1414 = _1392 * _1410;
        float _1416 = fma(_1342, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1418 = fma(_1338, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1382 = _1412;
        _1372 = _1416;
        _1376 = _1418;
    }
    float _1420 = _1382;
    float _1422 = _1372;
    float _1424 = _1376;
    float _1426 = -_624;
    float _1428 = _1426 + _1420;
    float _1430 = -_626;
    float _1432 = _1430 + _1422;
    float _1434 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1436 = _624 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1438 = _1428 * _1428;
    float _1440 = -_628;
    float _1442 = _1440 + _1424;
    float _1444 = 1.0 / _1434;
    float _1446 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1436);
    float _1448 = fma(_1432, _1432, _1438);
    float _1450 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1446);
    float _1452 = fma(_1442, _1442, _1448);
    float _1454 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1456 = sqrt(_1452);
    float _1458 = _1454 + _1434;
    float _1460 = _1458 * _1444;
    float _1462 = _1460 * 0.5;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1466 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1464);
    float _1468 = 1.0 / _1466;
    bool _1470 = _1456 > 0.0;
    bool _1472 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.5);
    bool _1480 = _1476 || _1478;
    bool _1482 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1484 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(0.5);
    bool _1490 = _1486 || _1488;
    bool _1492 = !_1470;
    float _1494 = _1422;
    float _1496 = _1420;
    float _1498 = _1424;
    float _1500 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1502 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1504 = _1432;
    float _1506 = _1434;
    float _1508 = _1444;
    float _1510 = _1466;
    float _1512 = _1428;
    float _1514 = _1442;
    if (!_1492)
    {
        float _1516 = _184 * _184;
        float _1518 = fma(_182, _182, _1516);
        float _1520 = fma(_186, _186, _1518);
        float _1522 = rsqrt(_1452);
        float _1524 = sqrt(_1520);
        float _1526 = _1432 * _1522;
        float _1528 = _1428 * _1522;
        float _1530 = _1442 * _1522;
        bool _1532 = _1524 > 0.0;
        bool _1534 = !_1532;
        _1500 = _1524;
        _1502 = _1522;
        _1504 = _1528;
        _1510 = _1520;
        if (!_1534)
        {
            float _1536 = rsqrt(_1520);
            float _1538 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1540 = _184 * _1536;
            float _1542 = _182 * _1536;
            float _1544 = _186 * _1536;
            float _1546 = _1528 * _1540;
            float _1548 = fma(_1526, _1542, _1546);
            float _1550 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1552 = fma(_1530, _1544, _1548);
            float _1554 = _1552 * _1550;
            float _1556 = fma(_182, _1554, _1422);
            float _1558 = fma(_184, _1554, _1420);
            float _1560 = fma(_186, _1554, _1424);
            _1494 = _1556;
            _1496 = _1558;
            _1498 = _1560;
            _1500 = _1542;
            _1502 = _1554;
            _1504 = _1548;
            _1506 = _1540;
            _1508 = _1538;
            _1512 = _1550;
        }
    }
    float _1562 = _1494;
    float _1564 = _1496;
    float _1566 = _1498;
    float _1568 = _1500;
    float _1570 = _1502;
    float _1572 = _1504;
    float _1574 = _1506;
    float _1576 = _1508;
    float _1578 = _1510;
    float _1580 = _1512;
    float _1582 = _1568;
    float _1584 = _1574;
    float _1586 = _1572;
    float _1588 = _1576;
    float _1590 = _1570;
    float _1592 = _1578;
    float _1594 = _1580;
    if (_1480)
    {
        _1582 = 1.0;
    }
    float _1596 = _1582;
    float _1598 = _1596;
    if (_1490)
    {
        _1584 = _1562;
    }
    float _1600 = _1584;
    float _1602 = _1600;
    if (_1490)
    {
        _1586 = _1564;
    }
    float _1604 = _1586;
    float _1606 = _1604;
    if (_1490)
    {
        _1588 = _1566;
    }
    float _1608 = _1588;
    float _1610 = _1608;
    if (!_1490)
    {
        float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1614 = _624 + _1612;
        float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1618 = _626 + _1616;
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1622 = -_626;
        float _1624 = _1622 + _1562;
        float _1626 = _1614 * _1614;
        float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1630 = _628 + _1628;
        float _1632 = fma(_1618, _1618, _1626);
        float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1636 = fma(_1630, _1630, _1632);
        float _1638 = sqrt(_1636);
        float _1640 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1642 = precise::min(_1638, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1644 = _1642 * _1634;
        float _1646 = -_624;
        float _1648 = _1646 + _1564;
        float _1650 = -_628;
        float _1652 = _1650 + _1566;
        float _1654 = _1640 * _1644;
        float _1656 = fma(_1648, _1654, _624);
        float _1658 = fma(_1624, _1654, _626);
        float _1660 = fma(_1652, _1654, _628);
        _190 = _1648;
        _1590 = _1644;
        _1606 = _1656;
        _1602 = _1658;
        _1610 = _1660;
        _192 = _1654;
        _1592 = _1634;
    }
    float _1662 = _190;
    float _1664 = _1590;
    float _1666 = _1606;
    float _1668 = _1602;
    float _1670 = _1610;
    float _1672 = _192;
    float _1674 = _1592;
    float _1676 = _1662;
    float _1678 = _1664;
    float _1680 = _1674;
    if (_1480)
    {
        _1594 = 1.0;
    }
    float _1682 = _1594;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1686 = _1468 * _1684;
    float _1688 = _1682;
    if (!_1480)
    {
        float _1690 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1692 = _1690 * 0.15915493667125701904296875;
        float _1694 = _1692 * 6.283185482025146484375;
        float _1696 = cos(_1694);
        float _1698 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1692 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = 1.0 / _1696;
        float _1708 = _1700 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = _1704 * _1706;
        float _1714 = _1700 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        float _1718 = _1710 * _1712;
        float _1720 = 1.0 / _1718;
        float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1724 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1722;
        float _1726 = 1.0 / _1724;
        float _1728 = _1716 * _1720;
        float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1732 = fma(_1686, _1728, _1730);
        float _1734 = _1732 * _1726;
        float _1736 = precise::clamp(_1734, 0.0, 1.0);
        _1676 = _1692;
        _1598 = _1736;
    }
    float _1738 = _1676;
    float _1740 = _1598;
    float _1742 = _1738;
    if (!_1480)
    {
        float _1744 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1746 = _1744 * 0.15915493667125701904296875;
        float _1748 = _1746 * 6.283185482025146484375;
        float _1750 = cos(_1748);
        float _1752 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1754 = _1752 * 0.15915493667125701904296875;
        float _1756 = _1746 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        float _1760 = 1.0 / _1750;
        float _1762 = _1754 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = _1758 * _1760;
        float _1768 = _1754 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        float _1772 = _1764 * _1766;
        float _1774 = 1.0 / _1772;
        float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1778 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1776;
        float _1780 = 1.0 / _1778;
        float _1782 = _1770 * _1774;
        float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1786 = fma(_1686, _1782, _1784);
        float _1788 = _1786 * _1780;
        float _1790 = precise::clamp(_1788, 0.0, 1.0);
        float _1792 = -_1790;
        float _1794 = _1792 + 1.0;
        _1678 = _1774;
        _1742 = _1760;
        _1688 = _1794;
    }
    float _1796 = _1678;
    float _1798 = _1742;
    float _1800 = _1688;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1804 = _1666 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1808 = _1668 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1812 = _1670 + _1810;
    float _1814 = _1804 * _1804;
    float _1816 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1818 = fma(_1808, _1808, _1814);
    float _1820 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1816);
    float _1822 = fma(_1812, _1812, _1818);
    float _1824 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1820);
    float _1826 = rsqrt(_1822);
    float _1828 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1830 = sqrt(_1822);
    float _1832 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1834 = _1808 * _1832;
    float _1836 = _1812 * _1832;
    float _1838 = _1834 * _1834;
    float _1840 = _1836 * _1836;
    float _1842 = _1838 + _1840;
    float _1844 = sqrt(_1842);
    bool _1846 = _1844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1850 = _1844 + _1848;
    float _1852 = _1672;
    float _1854 = _1850;
    float _1856 = _1834;
    float _1858 = _1836;
    float _1860 = _1840;
    if (_1846)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1852 = _1862;
    }
    float _1864 = _1852;
    if (_1846)
    {
        float _1866 = _1850 * _1864;
        _1854 = _1866;
    }
    float _1868 = _1854;
    if (_1846)
    {
        float _1870 = _1868 * 0.15915493667125701904296875;
        _1514 = _1870;
    }
    float _1872 = _1514;
    float _1874 = _1796;
    if (_1846)
    {
        float _1876 = _1872 * 6.283185482025146484375;
        float _1878 = sin(_1876);
        _1874 = _1878;
    }
    float _1880 = _1874;
    float _1882 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1884 = precise::max(0.0, _1882);
    float _1886 = _1798;
    float _1888 = _1884;
    if (_1846)
    {
        float _1890 = _1872 * 6.283185482025146484375;
        float _1892 = cos(_1890);
        _1886 = _1892;
    }
    float _1894 = _1886;
    float _1896 = -_1832;
    float _1898 = -_1884;
    float _1900 = fma(_1804, _1896, _1898);
    float _1902 = _1882;
    if (_1846)
    {
        float _1904 = rsqrt(_1842);
        _1902 = _1904;
    }
    float _1906 = _1902;
    if (_1846)
    {
        float _1908 = _1900 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1888 = _1908;
    }
    float _1910 = _1888;
    float _1912 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1914 = fma(_626, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1916 = _1910;
    float _1918 = _1880;
    if (_1846)
    {
        float _1920 = fma(_1880, _1910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1680 = _1920;
    }
    float _1922 = _1680;
    float _1924 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1912);
    float _1926 = _1922;
    if (_1846)
    {
        float _1928 = _1894 + (-1.0);
        _1916 = _1928;
    }
    float _1930 = _1916;
    float _1932 = floor(_1914);
    float _1934 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1924);
    float _1936 = _1934 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1938 = _1906;
    float _1940 = _1930;
    if (_1846)
    {
        float _1942 = _1906 * _1922;
        _1918 = _1942;
    }
    float _1944 = _1918;
    if (_1846)
    {
        float _1946 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1926 = _1946;
    }
    float _1948 = _1926;
    if (!_1846)
    {
        _1938 = _1900;
    }
    float _1950 = _1938;
    float _1952 = _1950;
    if (_1846)
    {
        float _1954 = _1834 * _1944;
        _1856 = _1954;
    }
    float _1956 = _1856;
    if (_1846)
    {
        float _1958 = fma(_1900, _1894, _1948);
        _1952 = _1958;
    }
    float _1960 = _1952;
    if (!_1846)
    {
        _1940 = _1838;
    }
    float _1962 = _1940;
    float _1964 = _1962;
    if (_1846)
    {
        float _1966 = _1836 * _1944;
        _1858 = _1966;
    }
    float _1968 = _1858;
    if (_1846)
    {
        float _1970 = _1956 * _1956;
        _1964 = _1970;
    }
    float _1972 = _1964;
    if (_1846)
    {
        float _1974 = _1968 * _1968;
        _1860 = _1974;
    }
    float _1976 = _1860;
    float _1978 = -_1932;
    float _1980 = _1914 + _1978;
    float _1982 = fma(_1960, _1960, _1972);
    float _1984 = fma(_628, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1986 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1988 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1990 = _1982 + _1976;
    float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1994 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1992);
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    float _1998 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1986);
    float _2000 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1988);
    float _2002 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2004 = -_1996;
    float _2006 = _2004 + 1.0;
    float _2008 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1998);
    float _2010 = rsqrt(_1990);
    float _2012 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2000);
    float _2014 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2016 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2018 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2022 = abs(_2006);
    float _2024 = log2(_2022);
    float _2026 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2020);
    float _2028 = -_2016;
    float _2030 = fma(_2028, _2002, 1.0);
    float _2032 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2026);
    float _2034 = _2010 * _1956;
    float _2036 = _2010 * _1960;
    float _2038 = _2010 * _1968;
    float _2040 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2032);
    float _2042 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2044 = floor(_1984);
    float _2046 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2048 = -_2042;
    float _2050 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2048);
    float _2052 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2054 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2046);
    float _2056 = -_2038;
    float _2058 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2050);
    float _2060 = log2(_2030);
    float _2062 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2064 = fma(_2058, -0.5, 0.5);
    float _2066 = fma(_2058, 0.5, 0.5);
    float _2068 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2062);
    float _2070 = 1.0 / _2040;
    float _2072 = -_2044;
    float _2074 = _1984 + _2072;
    float _2076 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2054);
    float _2078 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2068);
    float _2080 = _2036 + 1.0;
    float _2082 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2076);
    float _2084 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2078);
    float _2086 = exp2(_2052);
    float _2088 = _2060 * 0.693147182464599609375;
    float _2090 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2092 = sqrt(_2064);
    float _2094 = fma(_2066, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2096 = _2082 * _2070;
    float _2098 = _2084 * _2070;
    float _2100 = fma(_2066, _2094, -0.212114393711090087890625);
    float _2102 = fma(_2096, 0.5, 0.5);
    float _2104 = -_2036;
    float _2106 = fma(_2086, _2080, _2104);
    float _2108 = fma(_2066, _2100, 1.570728778839111328125);
    float _2110 = fma(_2098, -0.5, 0.5);
    float _2112 = fma(_2106, 0.5, 0.5);
    float _2114 = _2092 * 0.636619746685028076171875;
    float2 _6769 = float2(_1980, _2074);
    float _2116 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6769, float2(0.0), isnan(_6769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6769, float2(0.0), isnan(_6769)), level(0.0)).x;
    float3 _6780 = float3(_2102, _2110, _2090);
    float _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6780, float3(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6780, float3(0.0), isnan(_6780)), level(0.0)).x;
    float _2120 = -_2108;
    float _2122 = fma(_2114, _2120, 1.0);
    float3 _6796 = float3(_2102, _2110, _2090);
    float4 _2125 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6796, float3(0.0), isnan(_6796)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6796, float3(0.0), isnan(_6796)), level(0.0)).xyzw;
    float _2127 = _2125.x;
    float _2129 = _2125.y;
    float _2131 = _2125.z;
    float _2133 = _2125.w;
    float2 _6812 = float2(_2122, _2112);
    float3 _2137 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6812, float2(0.0), isnan(_6812)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6812, float2(0.0), isnan(_6812)), level(0.0)).xyz;
    float _2139 = _2137.x;
    float _2141 = _2137.y;
    float _2143 = _2137.z;
    float _2145 = float(uint(_742));
    float _2147 = trunc(_650);
    int _2149 = int(_2147);
    bool _2151 = _742 == 0;
    float _2153 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2155 = abs(_910);
    float _2157 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2159 = abs(_922);
    float _2161 = 1.0 / _2145;
    int _2163 = ~_742;
    int _2165 = _2163 + 1;
    float _2167 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2157);
    float _2169 = float(uint(_2149));
    float _2171 = exp2(_2153);
    float _2173 = float(_106);
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2177 = _2175 != 0;
    int _2179 = as_type<int>(_2161) + (-2);
    float _2181 = 1.0 / _2173;
    int _2183 = ~_742;
    int _2185 = _2183 + 1;
    float _2187 = as_type<float>(_2179) * _2169;
    bool _2189 = !_2177;
    float _2191 = _2189 ? 7.345489978790283203125 : 1.0;
    float _2193 = -_2171;
    float _2195 = _2193 + 1.0;
    float _2197 = trunc(_2187);
    float _2199 = precise::max(_2197, 0.0);
    uint _2202 = uint(_2199);
    float _2204 = _2191 * _752;
    int _2206 = ~_742;
    int _2208 = _2206 + 1;
    float _2210 = float(_2149);
    bool _2212 = _2210 >= _774;
    bool _2214 = isnan(_2210);
    bool _2216 = _2212 || _2214;
    bool _2218 = isnan(_774);
    bool _2220 = _2216 || _2218;
    float _2222 = float(_2220);
    int _2224 = _2165 * int(_2202);
    int _2226 = _2224 + _2149;
    float _2228 = trunc(_2222);
    int _2230 = int(_2228);
    float _2232 = float(uint(_2226));
    float _2234 = as_type<float>(_2179) * _2232;
    float _2236 = floor(_2204);
    float _2238 = trunc(_2234);
    float _2240 = precise::max(_2238, 0.0);
    uint _2242 = uint(_2240);
    float _2244 = -_2236;
    float _2246 = _2204 + _2244;
    float _2248 = _2246 * _774;
    float _2250 = _788 * _2181;
    int _2252 = ~_2230;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    int _2258 = int(_2202) + int(_2242);
    float _2260 = trunc(_2248);
    int _2262 = int(_2260);
    int _2264 = _742 + (-1);
    int _2266 = _2208 * _2258;
    int _2268 = _2266 + _2149;
    bool _2270 = uint(_2268) >= uint(_742);
    float _2272 = trunc(_2250);
    int _2274 = int(_2272);
    bool _2276 = !_2270;
    int _2278 = _2276 ? 0 : (-1);
    int _2280 = ~_2258;
    int _2282 = _2280 + _2278;
    int _2284 = _2282 + 1;
    int _2286 = _742 * _2284;
    int _2288 = _2286 + _2149;
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2292 = _2290 != 0;
    int _2294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2296 = _2294 != 0;
    bool _2298 = !_2151;
    int _2300 = _2298 ? _2288 : (-1);
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2304 = _558 + _2302;
    bool _2306 = !_2292;
    int _2308 = _2306 ? 0 : 1;
    int _2310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2312 = _2310 != 0;
    int _2314 = _2300 * _2256;
    int _2316 = abs(_2308);
    bool _2318 = !_2312;
    int _2320 = _2318 ? 0 : 1;
    int _2322 = _2230 * _2264;
    int _2324 = _2322 + _2314;
    int _2326 = abs(_916);
    int _2328 = _2324 * _2155;
    int _2330 = abs(_2320);
    int _2332 = _2262 * _2316;
    int _2334 = _2332 + _2149;
    int _2336 = ~_742;
    int _2338 = _2336 + 1;
    int _2340 = _2274 * _2326;
    int _2342 = _2340 + _2328;
    int _2344 = ~_742;
    int _2346 = _2344 + 1;
    int _2348 = _2334 * _2159;
    int _2350 = _2348 + _2342;
    int _2352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2354 = _2352 != 0;
    int _2356 = _2262 * _2330;
    int _2358 = _2356 + _2350;
    int _2360 = ~_742;
    int _2362 = _2360 + 1;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2370 = _2368 != 0;
    float _2372 = float(uint(_2358));
    float _2374 = 1.0 / _2366;
    float _2376 = as_type<float>(_2179) * _2372;
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2380 = _2378 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2382 = trunc(_2376);
    float _2384 = precise::max(_2382, 0.0);
    uint _2386 = uint(_2384);
    float _2388 = 1.0 / _2380;
    float _2390 = float(uint(_2334));
    int _2392 = _2362 * int(_2386);
    int _2394 = _2392 + _2358;
    float _2396 = float(uint(_2394));
    float _2398 = as_type<float>(_2179) * _2390;
    float _2400 = as_type<float>(_2179) * _2396;
    float _2402 = trunc(_2398);
    float _2404 = precise::max(_2402, 0.0);
    uint _2406 = uint(_2404);
    float _2408 = trunc(_2400);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    int _2414 = _2346 * int(_2406);
    int _2416 = _2414 + _2334;
    float _2418 = float(uint(_2416));
    int _2420 = int(_2386) + int(_2412);
    float _2422 = as_type<float>(_2179) * _2418;
    float _2424 = in.m_65.y;
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2428 = _558 + _2426;
    float _2430 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2430;
    int _2434 = _2338 * _2420;
    int _2436 = _2434 + _2358;
    float _2438 = trunc(_2422);
    float _2440 = precise::max(_2438, 0.0);
    uint _2442 = uint(_2440);
    float _2444 = _2432 * _2388;
    bool _2446 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2448 = isnan(_558);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2454 = _2450 || _2452;
    float _2456 = float(_2454);
    bool _2458 = uint(_2436) >= uint(_742);
    bool _2460 = !_2458;
    int _2462 = _2460 ? 0 : (-1);
    bool _2464 = _754 > 0.5;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2470 = ~_2420;
    int _2472 = _2470 + _2462;
    int _2474 = _2472 + 1;
    int _2476 = _742 * _2474;
    int _2478 = _2476 + _2358;
    float _2480 = 1.0 / _2468;
    float _2482 = as_type<float>(_2474);
    float _2484 = _2040;
    float _2486 = _2084;
    if (_2296)
    {
        float _2488 = in.m_55.x;
        _2482 = _2488;
    }
    float _2490 = _2482;
    int _2492 = int(_2406) + int(_2442);
    bool _2494 = !_2151;
    int _2496 = _2494 ? _2478 : (-1);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _2498 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2500 = isnan(_558);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2506 = _2502 || _2504;
    float _2508 = float(_2506);
    int _2510 = _2185 * _2492;
    int _2512 = _2510 + _2334;
    int _2514 = _2496 >> 31;
    int _2516 = _2496 & 3;
    bool _2518 = _2516 != 0;
    int _2520 = _2514 & 3;
    bool _2522 = uint(_2516) > 1u;
    int _2524 = _2496 + _2520;
    float _2526 = -_2424;
    float _2528 = _2526 + 1.0;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2532 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2530;
    int _2534 = _2524 >> 2;
    float _2536 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2540 = _2424;
    if (_2354)
    {
        float _2542 = _2464 ? _2528 : _2424;
        _2540 = _2542;
    }
    float _2544 = _2540;
    float _2546 = _2532 * _2374;
    int _2548 = _2534 << 4;
    int _2550 = _2548 + 368;
    float _2552 = _2538 * _2480;
    bool _2554 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2556 = isnan(_558);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    float _2566 = fma(_2546, _2428, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    uint _2568 = uint(int(uint(_2550) >> uint(2)));
    uint _2570 = uint(int(uint(int(_2568)) >> uint(2)));
    int _2572 = int(_2568) & 3;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[int(_2570)][_2572];
    int _2576 = int(_2568) + 1;
    uint _2578 = uint(int(uint(_2576) >> uint(2)));
    int _2580 = _2576 & 3;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[int(_2578)][_2580];
    bool _2584 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2586 = isnan(_558);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = fma(_2552, _2304, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2598 = -_2564;
    float _2600 = _2598 + 1.0;
    bool _2602 = _2490 > 0.5;
    bool _2604 = _2602 && _2296;
    float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2608 = _558 + _2606;
    int _2610 = _2496 & 3;
    bool _2612 = _2610 != 0;
    float _2614 = _2594 * _2600;
    float _2616 = -_2594;
    float _2618 = _2616 + 1.0;
    float _2620 = -_2508;
    float _2622 = _2620 + 1.0;
    int _2624 = _2612 ? 0 : 1;
    float _2626 = fma(_2444, _2608, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2628 = _2508 * _2618;
    float _2630 = _2456 * _2622;
    int _2632 = ~_2624;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    int _2638 = _2550 + 8;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    uint _2642 = uint(int(uint(int(_2640)) >> uint(2)));
    int _2644 = int(_2640) & 3;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[int(_2642)][_2644];
    int _2648 = int(_2640) + 1;
    uint _2650 = uint(int(uint(_2648) >> uint(2)));
    int _2652 = _2648 & 3;
    float _2654 = (*spvDescriptorSet0.vp_c9)._m0[int(_2650)][_2652];
    int _2656 = _2636;
    if (!_2522)
    {
        int _2658 = ~_2624;
        int _2660 = _2658 + 1;
        _2656 = _2660;
    }
    int _2662 = _2656;
    float _2664 = _2566 * _2630;
    float _2666 = -_2456;
    float _2668 = _2666 + 1.0;
    bool _2670 = !_2518;
    int _2672 = _2670 ? 0 : 1;
    float _2674 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2676 = int(_2674);
    bool _2678 = _2516 != 3;
    float _2680 = -_2116;
    float _2682 = _2680 + 1.0;
    bool _2684 = uint(_2516) >= 2u;
    bool _2686 = uint(_2512) >= uint(_742);
    int _2688 = abs(_2662);
    int _2690 = _2684 ? 0 : 1;
    float _2692 = abs(_1686);
    float _2694 = log2(_2692);
    int _2696 = abs(_2672);
    float _2698 = fma(_2668, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2664);
    int _2700 = ~_2688;
    int _2702 = _2700 + 1;
    int _2704 = _2702 + 1;
    int _2706 = ~_2690;
    int _2708 = _2706 + 1;
    int _2710 = _2708 + 1;
    float _2712 = fma(_2596, _2628, _2698);
    bool _2714 = _2516 != 3;
    int _2716 = _2710;
    if (_2678)
    {
        int _2718 = ~_2690;
        int _2720 = _2718 + 1;
        _2716 = _2720;
    }
    int _2722 = _2716;
    float _2724 = fma(_2626, _2614, _2712);
    int _2726 = ~_2696;
    int _2728 = _2726 + 1;
    int _2730 = _2728 + 1;
    bool _2732 = !_2714;
    int _2734 = _2732 ? 0 : (-1);
    bool _2736 = !_2686;
    int _2738 = _2736 ? 0 : (-1);
    int _2740 = abs(_2734);
    int _2742 = _2704 * as_type<int>(_2582);
    int _2744 = abs(_2722);
    bool _2746 = !_2370;
    int _2748 = _2746 ? 0 : 1;
    int _2750 = _2730 * as_type<int>(_2574);
    int _2752 = _2750 + _2742;
    float _2754 = in.m_69.x;
    float _2756 = in.m_69.y;
    float _2758 = in.m_69.z;
    int _2760 = ~_2492;
    int _2762 = _2760 + _2738;
    int _2764 = _2762 + 1;
    float _2766 = float(uint(_2676));
    bool _2768 = _1176 != 0.0;
    bool _2770 = isnan(_1176);
    bool _2772 = _2768 || _2770;
    bool _2774 = isnan(0.0);
    bool _2776 = _2772 || _2774;
    int _2778 = _742 * _2764;
    int _2780 = _2778 + _2334;
    int _2782 = abs(_2748);
    float _2784 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2786 = 1.0 / _2766;
    int _2788 = ~_2744;
    int _2790 = _2788 + 1;
    int _2792 = _2790 + 1;
    int _2794 = abs(_2676);
    bool _2796 = _1174 == 0.0;
    bool _2798 = !_2776;
    bool _2800 = _2796 && _2798;
    int _2802 = _2792 * as_type<int>(_2646);
    int _2804 = _2802 + _2752;
    float _2806 = exp2(_2784);
    int _2808 = ~_2740;
    int _2810 = _2808 + 1;
    int _2812 = _2810 + 1;
    bool _2814 = _1178 == 0.0;
    bool _2816 = _2814 && _2800;
    float _2818 = float(uint(_2794));
    int _2820 = _2812 * as_type<int>(_2654);
    int _2822 = _2820 + _2804;
    int _2824 = ~_2782;
    int _2826 = _2824 + 1;
    int _2828 = _2826 + 1;
    float _2830 = 1.0 / _2818;
    bool _2832 = !_2151;
    int _2834 = _2832 ? _2780 : (-1);
    int _2836 = _2822 * _2828;
    int _2838 = as_type<int>(_2786) + (-2);
    int _2840 = _2834 * _2782;
    int _2842 = _2840 + _2836;
    float _2844 = _2758;
    float _2846 = _2756;
    float _2848 = _2754;
    if (!_2816)
    {
        float _2850 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2758);
        _2844 = _2850;
    }
    float _2852 = _2844;
    if (!_2816)
    {
        float _2854 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2756);
        _2846 = _2854;
    }
    float _2856 = _2846;
    if (!_2816)
    {
        float _2858 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2754);
        _2848 = _2858;
    }
    float _2860 = _2848;
    float _2862 = float(uint(_2842));
    float _2864 = in.m_65.x;
    int _2866 = abs(_2842);
    float _2868 = fma(_2806, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2870 = precise::clamp(_2868, 0.0, 1.0);
    int _2872 = as_type<int>(_2830) + (-2);
    float _2874 = as_type<float>(_2838) * _2862;
    float _2876 = float(uint(_2866));
    float _2878 = fma(_2870, -2.0, 3.0);
    float _2880 = _2870 * _2870;
    float _2882 = fma(_2564, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2724);
    float _2884 = trunc(_2874);
    float _2886 = precise::max(_2884, 0.0);
    uint _2888 = uint(_2886);
    float _2890 = as_type<float>(_2872) * _2876;
    float _2892 = _2880 * _2878;
    float _2894 = _2882 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2896 = -_2892;
    float _2898 = _2896 + 1.0;
    int _2900 = ~_2676;
    int _2902 = _2900 + 1;
    float _2904 = trunc(_2890);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    int _2910 = ~_2794;
    int _2912 = _2910 + 1;
    float _2914 = fma(_2898, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2892);
    float _2916 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2918 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2922 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2924 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (_2296)
    {
        _2922 = _2864;
    }
    float _2926 = _2922;
    int _2928 = _2902 * int(_2888);
    int _2930 = _2928 + _2842;
    float _2932 = _2926;
    if (!_2296)
    {
        _2924 = _2864;
    }
    float _2934 = _2924;
    float _2936 = _2916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2938 = _2918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2940 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2942 = float(uint(_2930));
    float _2944 = _2934;
    if (_2604)
    {
        float _2946 = -_2926;
        float _2948 = _2946 + 1.0;
        _2932 = _2948;
    }
    float _2950 = _2932;
    bool _2952 = _1686 <= 8000.0;
    bool _2954 = isnan(_1686);
    bool _2956 = _2952 || _2954;
    bool _2958 = isnan(8000.0);
    bool _2960 = _2956 || _2958;
    float _2962 = float(_2960);
    int _2964 = _2912 * int(_2908);
    int _2966 = _2964 + _2866;
    float _2968 = _1290 * _1206;
    float _2970 = as_type<float>(_2838) * _2942;
    if (_2296)
    {
        _2944 = _2950;
    }
    float _2972 = _2944;
    float _2974 = _2962 * _2914;
    float _2976 = float(uint(_2966));
    float _2978 = trunc(_2970);
    float _2980 = precise::max(_2978, 0.0);
    uint _2982 = uint(_2980);
    float _2984 = _1268 * _1206;
    float _2986 = _1268 * _1208;
    float _2988 = _1282 * _1206;
    float _2990 = as_type<float>(_2872) * _2976;
    float _2992 = _1268 * _1220;
    float _2994 = _1282 * _1208;
    float _2996 = _1282 * _1220;
    float _2998 = _1290 * _1208;
    out.m_71.x = _2936;
    out.m_71.y = _2938;
    out.m_71.z = _2940;
    out.m_71.w = _2894;
    float _3000 = trunc(_2990);
    float _3002 = precise::max(_3000, 0.0);
    uint _3004 = uint(_3002);
    float _3006 = _1290 * _1220;
    float _3008 = fma(_1274, _1310, _2996);
    float _3010 = fma(_1278, _1318, _2968);
    float _3012 = -_1262;
    float _3014 = fma(_3012, _1310, _2992);
    float _3016 = fma(_1278, _1310, _3006);
    int _3018 = int(_2888) + int(_2982);
    float _3020 = fma(_1274, _1318, _2988);
    float _3022 = fma(_1274, _1324, _2994);
    int _3024 = ~_2676;
    int _3026 = _3024 + 1;
    float _3028 = -_1262;
    float _3030 = fma(_3028, _1324, _2986);
    float _3032 = fma(_1278, _1324, _2998);
    int _3034 = ~_2794;
    int _3036 = _3034 + 1;
    float _3038 = -_1262;
    float _3040 = fma(_3038, _1318, _2984);
    int _3042 = int(_2908) + int(_3004);
    int _3044 = _3026 * _3018;
    int _3046 = _3044 + _2842;
    float _3048 = fma(_1272, _706, _3014);
    float _3050 = fma(_1272, _710, _3030);
    float _3052 = fma(_1294, _710, _3022);
    int _3054 = _3036 * _3042;
    int _3056 = _3054 + _2866;
    bool _3058 = uint(_3046) >= uint(_2676);
    float _3060 = fma(_1272, _704, _3040);
    float _3062 = fma(_1294, _704, _3020);
    float _3064 = fma(_1302, _704, _3010);
    float _3066 = fma(_1294, _706, _3008);
    float _3068 = fma(_1302, _710, _3032);
    bool _3070 = uint(_3056) >= uint(_2794);
    float _3072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3074 = !_3058;
    int _3076 = _3074 ? 0 : (-1);
    float _3078 = fma(_1302, _706, _3016);
    int _3080 = _2842 ^ _2676;
    float _3082 = _3060 * _2856;
    bool _3084 = !_3070;
    int _3086 = _3084 ? 0 : (-1);
    float _3088 = _3050 * _2856;
    int _3090 = ~_3018;
    int _3092 = _3090 + _3076;
    int _3094 = _3092 + 1;
    float _3096 = _3048 * _2856;
    uint _3098 = uint(int(uint(_3080) >> uint(31)));
    float _3100 = fma(_3052, _2860, _3088);
    int _3102 = ~_3086;
    int _3104 = _3042 + _3102;
    int _3106 = _3104 + 1;
    float _3108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3110 = ~int(_3098);
    int _3112 = _3110 + 1;
    int _3114 = _2676 * _3094;
    int _3116 = _3114 + _2842;
    bool _3118 = _2676 == 0;
    float _3120 = fma(_3062, _2860, _3082);
    float _3122 = _3072 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3124 = _3106 ^ _3112;
    float _3126 = fma(_3066, _2860, _3096);
    bool _3128 = !_3118;
    int _3130 = _3128 ? _3116 : (-1);
    float _3132 = fma(_3122, _2972, -0.5);
    bool _3134 = _2676 == 0;
    float _3136 = fma(_3064, _2852, _3120);
    float _3138 = float(_3130);
    float _3140 = fma(_3068, _2852, _3100);
    int _3142 = ~_3112;
    int _3144 = _3142 + _3124;
    int _3146 = _3144 + 1;
    float _3148 = fma(_3078, _2852, _3126);
    float _3150 = _3108 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3152 = fma(_3122, _3138, _822);
    bool _3154 = !_3134;
    int _3156 = _3154 ? _3146 : (-1);
    float _3158 = _2040 * 0.5;
    float _3160 = fma(_3150, _2544, -0.5);
    float _3162 = fma(_942, _3132, _3152);
    float _3164 = float(_3156);
    float _3166 = in.m_73.x;
    float _3168 = fma(_2084, -0.5, _3158);
    float _3170 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3172 = -_924;
    float _3174 = fma(_3150, _3164, _3172);
    float _3176 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2167);
    float _3178 = _2682 * _3170;
    float _3180 = precise::clamp(_3178, 0.0, 1.0);
    float _3182 = _2082 + _2040;
    float _3184 = fma(_944, _3160, _3174);
    float _3186 = _3162 + 0.5;
    float _3188 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3190 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3176);
    float _3192 = _3184 + 0.5;
    float _3194 = -_3180;
    float _3196 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3198 = _3188 * _2118;
    out.m_75.x = _3136;
    out.m_75.y = _3140;
    out.m_75.z = _3148;
    bool _3200 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3202 = isnan(_1830);
    bool _3204 = _3200 || _3202;
    bool _3206 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3208 = _3204 || _3206;
    float _3210 = _3190 + _2040;
    out.m_77.x = _3186;
    out.m_77.y = _3192;
    float _3212 = _2143 * _3198;
    float _3214 = _3210 * 0.5;
    float _3216 = _3182 * 0.5;
    out.gl_Position.x = _2082;
    out.gl_Position.y = _2084;
    out.gl_Position.z = _3190;
    out.gl_Position.w = _2040;
    float _3218 = _3196 * _3166;
    float _3220 = fma(_2133, _3212, _2131);
    out.m_79.x = _3216;
    out.m_79.y = _3168;
    out.m_79.z = _3214;
    out.m_79.w = _2040;
    float _3222 = _3218 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3224 = _2133 * _3198;
    float _3226 = fma(_2139, _3224, _2127);
    float _3228 = fma(_2141, _3224, _2129);
    out.m_81.x = _3222;
    float _3230 = -_3188;
    float _3232 = _3230 + 1.0;
    float _3234 = _3190;
    float _3236 = _3168;
    float _3238 = _3216;
    if (!_3208)
    {
        _2484 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3240 = _2484;
    float _3242 = _3240;
    float _3244 = _3240;
    if (!_3208)
    {
        _3234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3246 = _3234;
    float _3248 = _2133 * _3232;
    float _3250 = _1740 * _1800;
    float _3252 = _3250;
    float _3254 = _3246;
    float _3256 = _3246;
    if (!_3208)
    {
        _3236 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3258 = _3236;
    float _3260 = _3258;
    float _3262 = _3258;
    if (!_3208)
    {
        _3238 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3264 = _3238;
    out.m_83.x = _3226;
    out.m_83.y = _3228;
    out.m_83.z = _3220;
    out.m_83.w = _3248;
    float _3266 = _3250 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3268 = _3264;
    float _3270 = _3264;
    if (!_3208)
    {
        _2486 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3272 = _2486;
    float _3274 = _3272;
    float _3276 = _3272;
    if (!_3208)
    {
        _3252 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3278 = _3252;
    bool _3280 = !_3208;
    float _3282 = _3278;
    float _3284 = _3278;
    if (!_3280)
    {
        bool _3286 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3288 = isnan(_1830);
        bool _3290 = _3286 || _3288;
        bool _3292 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3294 = _3290 || _3292;
        if (!_3294)
        {
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3298 = _1830 + _3296;
            float _3300 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3302 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3300;
            float _3304 = 1.0 / _3302;
            float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3326 = _3298 * _3304;
            float _3328 = precise::clamp(_3326, 0.0, 1.0);
            float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3332 = _3330 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3334 = fma(_3328, _3308, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3336 = fma(_3328, _3332, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3338 = fma(_3328, _3312, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3340 = fma(_3328, _3316, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3342 = fma(_3328, _3320, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3344 = fma(_3328, _3324, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3270 = _3336;
            _3276 = _3342;
            _3262 = _3334;
            _3256 = _3340;
            _3244 = _3338;
            _3284 = _3344;
            _3346 = true;
        }
        else
        {
            bool _3348 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3350 = isnan(_1830);
            bool _3352 = _3348 || _3350;
            bool _3354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3356 = _3352 || _3354;
            if (!_3356)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3358 = _3260;
            _3262 = _3358;
            if (!_3356)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3360 = _3268;
            _3270 = _3360;
            if (!_3356)
            {
                _3242 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3362 = _3242;
            _3244 = _3362;
            if (!_3356)
            {
                _3254 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3364 = _3254;
            _3256 = _3364;
            if (!_3356)
            {
                _3274 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3366 = _3274;
            _3276 = _3366;
            if (!_3356)
            {
                _3282 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3368 = _3282;
            bool _3370 = !_3356;
            _3284 = _3368;
            if (!_3370)
            {
                bool _3372 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3374 = isnan(_1830);
                bool _3376 = _3372 || _3374;
                bool _3378 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3380 = _3376 || _3378;
                if (!_3380)
                {
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3384 = _1830 + _3382;
                    float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3388 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3386;
                    float _3390 = 1.0 / _3388;
                    float _3392 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3394 = _3392 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3412 = _3384 * _3390;
                    float _3414 = precise::clamp(_3412, 0.0, 1.0);
                    float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3420 = fma(_3414, _3394, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3422 = fma(_3414, _3418, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3424 = fma(_3414, _3398, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3426 = fma(_3414, _3402, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3428 = fma(_3414, _3406, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3430 = fma(_3414, _3410, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3270 = _3422;
                    _3276 = _3428;
                    _3262 = _3420;
                    _3256 = _3426;
                    _3244 = _3424;
                    _3284 = _3430;
                    _3346 = true;
                }
                else
                {
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3276 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3256 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3244 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3284 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3346 = false;
    float _3432 = _3270;
    float _3434 = _3276;
    float _3436 = _3262;
    float _3438 = _3256;
    float _3440 = _3244;
    float _3442 = _3284;
    float _3444 = fma(_3140, -0.5, 0.5);
    float _3446 = precise::clamp(_3444, 0.0, 1.0);
    float _3448 = -_3432;
    float _3450 = _3448 + _3434;
    float _3452 = _3266 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3454 = -_3436;
    float _3456 = _3454 + _3438;
    float _3458 = fma(_3446, _3450, _3432);
    out.m_85.x = 0.0;
    float _3460 = -_3440;
    float _3462 = _3460 + _3442;
    float _3464 = fma(_3446, _3456, _3436);
    float _3466 = _3458 * 0.586610972881317138671875;
    out.m_49.x = _3452;
    bool _3468 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3470 = fma(_3446, _3462, _3440);
    float _3472 = fma(_3464, 0.298911988735198974609375, _3466);
    bool _3474 = _1740 > 0.0;
    bool _3476 = isnan(_1740);
    bool _3478 = _3474 || _3476;
    bool _3480 = isnan(0.0);
    bool _3482 = _3478 || _3480;
    float _3484 = fma(_3470, 0.114477999508380889892578125, _3472);
    bool _3486 = _1800 <= 0.0;
    bool _3488 = !_3482;
    bool _3490 = _3486 || _3488;
    float _3492 = -_3484;
    float _3494 = _3464 + _3492;
    float _3496 = -_3484;
    float _3498 = _3458 + _3496;
    float _3500 = -_3484;
    float _3502 = _3470 + _3500;
    float _3504 = fma(_3494, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3484);
    float _3506 = fma(_3498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3484);
    float _3508 = fma(_3502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3484);
    bool _3510 = !_3468;
    if (!_3510)
    {
        float _3512 = -_1666;
        float _3514 = _3512 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3516 = -_1668;
        float _3518 = _3516 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3520 = -_1670;
        float _3522 = _3520 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3524 = _3514 * _3514;
        float _3526 = fma(_3518, _3518, _3524);
        float _3528 = fma(_3522, _3522, _3526);
        float _3530 = sqrt(_3528);
        float _3532 = rsqrt(_3528);
        float _3534 = -_3530;
        float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3538 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3540 = precise::clamp(_3538, 0.0, 1.0);
        float _3542 = _3518 * _3532;
        float _3544 = _3514 * _3532;
        float _3546 = abs(_3540);
        float _3548 = log2(_3546);
        float _3550 = _3522 * _3532;
        float _3552 = _3542 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3554 = _3140 * _3544;
        float _3556 = -_3544;
        float _3558 = -_3552;
        float _3560 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3558);
        float _3562 = fma(_3136, _3542, _3554);
        float _3564 = -_3550;
        float _3566 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3560);
        float _3568 = fma(_3148, _3550, _3562);
        float _3570 = precise::clamp(_3568, 0.0, 1.0);
        float _3572 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3574 = _3566 + _3572;
        float _3576 = _3548 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3578 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3580 = precise::clamp(_3578, 0.0, 1.0);
        float _3582 = exp2(_3576);
        float _3584 = _3582 * _3580;
        float _3586 = _3570 * _3584;
        float _3588 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3590 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3592 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _3588;
        out.m_85.y = _3590;
        out.m_85.z = _3592;
    }
    out.m_87.x = _3504;
    out.m_87.y = _3506;
    out.m_87.z = _3508;
    if (!_3490)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3594 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3594;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3346 = false;
    bool _550 = false;
    bool _434 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3651 = as_type<float>(_122);
        out.gl_Position.z = _3651;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3720 = as_type<float>(_160);
        out.gl_Position.z = _3720;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_53.x;
    float _164 = in.m_53.y;
    float _166 = in.m_53.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_168;
    float _190 = _184;
    float _192 = _182;
    float _210;
    if (!_188)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_106);
        float _216 = 1.0 / _214;
        float _218 = _140 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _220 + _226;
    bool _230 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _232 = isnan(_220);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _220 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = 1.0 / _244;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _256;
    float _264 = 1.0 / _252;
    float _266 = _224 * _258;
    bool _268 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = isnan(_220);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -_240;
    float _282 = _280 + 1.0;
    float _284 = _278 * _282;
    float _286 = _228 * _262;
    bool _288 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_220);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _300;
    bool _304 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_220);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = -_278;
    float _322 = _320 + 1.0;
    float _324 = -_298;
    float _326 = _324 + 1.0;
    float _328 = _248 * _264;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _314 * _326;
    float _340 = fma(_302, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = _298 * _322;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = _342 * _338;
    float _354 = _344 * _338;
    float _356 = _340 * _338;
    float _358 = -_314;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _372;
    float _376 = fma(_318, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_364, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_350, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _386;
    float _390 = fma(_376, _346, _366);
    float _392 = fma(_374, _266, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _394 = fma(_384, _266, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _396 = fma(_388, _266, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_378, _346, _368);
    float _400 = fma(_380, _346, _370);
    float _402 = fma(_392, _284, _390);
    float _404 = fma(_394, _284, _398);
    float _406 = fma(_396, _284, _400);
    float _408 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].x, _402);
    float _410 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].y, _404);
    float _412 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[146].z, _406);
    bool _414 = !_260;
    float _432;
    if (!_414)
    {
        float _416 = in.m_55.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        float _436 = float(_106);
        float _438 = 1.0 / _436;
        float _440 = _140 * _438;
        _432 = _440;
    }
    _434 = false;
    float _442 = _432;
    float _444 = in.m_57.x;
    float _446 = in.m_57.y;
    float _448 = in.m_57.z;
    bool _450 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _452 = isnan(_442);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _466 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _468 = isnan(_442);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _442 + _482;
    float _486 = -_460;
    float _488 = _486 + 1.0;
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _492 = 1.0 / _464;
    float _494 = _476 * _488;
    float _496 = -_476;
    float _498 = _496 + 1.0;
    float _500 = _412 * _448;
    float _502 = _410 * _446;
    float _504 = _480 * _492;
    float _506 = _408 * _444;
    float _508 = fma(_504, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _510 = _508 * _494;
    float _512 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[115].x, _510);
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _520 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[116].x, _512);
    float _522 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _524 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _526 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _528 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _522;
    out.m_59.y = _524;
    out.m_59.z = _526;
    out.m_59.w = _528;
    bool _530 = !_490;
    float _548;
    if (!_530)
    {
        float _532 = in.m_55.x;
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        float _552 = float(_106);
        float _554 = 1.0 / _552;
        float _556 = _140 * _554;
        _548 = _556;
    }
    _550 = false;
    float _558 = _548;
    float _560 = in.m_46.x;
    float _562 = in.m_46.y;
    float _564 = in.m_46.z;
    float _566 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _568 = int(_566);
    float _570 = in.m_55.z;
    float _572 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _574 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _576 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _578 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _580 = log2(_578);
    float _582 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _584 = -_576;
    float _586 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _584);
    bool _588 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = float(_568);
    float _600 = 1.0 / _598;
    float _602 = _562 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _604 = _562 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _606 = _562 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _608 = _580 * _140;
    float _610 = fma(_560, (*spvDescriptorSet0.vp_c10)._m0[5].x, _602);
    float _612 = fma(_560, (*spvDescriptorSet0.vp_c10)._m0[4].x, _604);
    float _614 = fma(_560, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
    float _616 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[5].z, _610);
    float _618 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    float _620 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[6].z, _614);
    float _622 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _624 = _616 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _626 = _618 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _628 = _620 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _630 = -_622;
    float _632 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _630);
    float _634 = -_624;
    float _636 = _634 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _638 = -_626;
    float _640 = _638 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _642 = -_628;
    float _644 = _642 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _646 = exp2(_608);
    float _648 = _636 * _636;
    float _650 = _600 * _140;
    float _652 = fma(_640, _640, _648);
    float _654 = fma(_644, _644, _652);
    float _656 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _658 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _660 = rsqrt(_654);
    float _662 = -_656;
    float _664 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _662);
    float _666 = -_658;
    float _668 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _666);
    float _670 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _672 = -_646;
    float _674 = _672 + 1.0;
    float _676 = _668 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _678 = -_670;
    float _680 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _678);
    float _682 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _684 = _668 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _686 = -_676;
    float _688 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[1].x, _686);
    float _690 = _668 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _692 = -_682;
    float _694 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _692);
    float _696 = -_684;
    float _698 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _700 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[1].w, _688);
    float _702 = _570 * 2.0;
    float _704 = _640 * _660;
    float _706 = _644 * _660;
    float _708 = _700 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _710 = _636 * _660;
    float _712 = _704 * _704;
    float _714 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].w, _698);
    float _716 = -_690;
    float _718 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[0].x, _716);
    float _720 = _596 ? _674 : 0.0;
    float _722 = fma(_706, _706, _712);
    float _724 = _664 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _726 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[0].w, _718);
    float _728 = -_724;
    float _730 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[1].y, _728);
    float _732 = rsqrt(_722);
    float _734 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[1].w, _730);
    float _736 = -_708;
    float _738 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _738);
    float _746 = _706 * _732;
    float _748 = _704 * _732;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _752 = in.m_55.x;
    float _754 = in.m_55.y;
    float _756 = -_746;
    float _758 = _706 * _756;
    float _760 = _710 * _748;
    float _762 = -_746;
    float _764 = _710 * _762;
    float _766 = -_758;
    float _768 = fma(_704, _748, _766);
    float _770 = _586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _772 = _768 * _768;
    float _774 = float(_742);
    float _776 = fma(_760, _760, _772);
    float _778 = -_770;
    float _780 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _778);
    float _782 = floor(_702);
    float _784 = fma(_764, _764, _776);
    float _786 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _780);
    float _788 = _774 * _140;
    float _790 = -_786;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[0].w, _744);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _796 = rsqrt(_784);
    float _798 = _754 + _752;
    float _800 = _752 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _802 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _804 = _798 + (-1.0);
    float _806 = -_750;
    float _808 = fma(_800, 2.0, _806);
    float _810 = fma(_802, -2.0, _794);
    float _812 = 1.0 / _792;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _816 = _664 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _818 = _668 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _820 = -_140;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[76].x, _808);
    float _824 = -_816;
    float _826 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[0].y, _824);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _830 = 1.0 + _828;
    float _832 = _768 * _796;
    float _834 = precise::clamp(_832, 0.0, 1.0);
    float _836 = -_818;
    float _838 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _836);
    float _840 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[0].w, _826);
    bool _842 = _782 > 0.0;
    float _844 = -_834;
    float _846 = _844 + 1.0;
    bool _848 = _782 >= 0.0;
    bool _850 = isnan(_782);
    bool _852 = _848 || _850;
    bool _854 = isnan(0.0);
    bool _856 = _852 || _854;
    float _858 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[0].w, _838);
    float _860 = 1.0 / _830;
    float _862 = fma(_726, _812, -1.0);
    float _864 = _846 * _812;
    float _866 = _752 * 2.0;
    float _868 = fma(_846, _862, 1.0);
    float _870 = _840 * _864;
    float _872 = _858 * _864;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _876 = _868 * _868;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _880 = _878 != 0;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _888 = _886 != 0;
    float _890 = floor(_866);
    float _892 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].w, _874);
    float _894 = fma(_870, _870, _876);
    bool _896 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _898 = isnan(1.0);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _904 = _900 || _902;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _908 = !_884;
    int _910 = _908 ? 0 : 1;
    float _912 = fma(_872, _872, _894);
    bool _914 = !_880;
    int _916 = _914 ? 0 : 1;
    float _918 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[78].z, _906);
    bool _920 = !_888;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _810);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _932 = _930 != 0;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _936 = _934 != 0;
    float _938 = rsqrt(_912);
    int _940 = _856 ? 0 : 1;
    float _942 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _918);
    float _944 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _892);
    if (_904)
    {
        float _946 = _720 * _860;
        _144 = _946;
    }
    float _948 = _144;
    bool _950 = !_928;
    int _952 = _950 ? 0 : 1;
    float _954 = _754 * 2.0;
    int _956 = ~_940;
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    int _962 = _960;
    if (!_842)
    {
        int _964 = ~_940;
        int _966 = _964 + 1;
        _962 = _966;
    }
    int _968 = _962;
    float _970 = floor(_954);
    int _972 = abs(_952);
    float _974 = float(_968);
    float _976 = float(_972);
    float _978 = _872 * _938;
    float _980 = _868 * _938;
    float _982 = _870 * _938;
    bool _984 = _890 > 0.0;
    float _986 = -_978;
    float _988 = _704 * _986;
    bool _990 = _890 >= 0.0;
    bool _992 = isnan(_890);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.0);
    bool _998 = _994 || _996;
    float _1000 = _706 * _980;
    float _1002 = in.m_61.x;
    float _1004 = in.m_61.y;
    float _1006 = in.m_61.z;
    float _1008 = -_982;
    float _1010 = -_988;
    float _1012 = fma(_706, _1008, _1010);
    float _1014 = _976 * _974;
    float _1016 = -_978;
    float _1018 = -_1000;
    float _1020 = fma(_710, _1016, _1018);
    float _1022 = -_982;
    float _1024 = _710 * _1022;
    float _1026 = _1012 * _1012;
    bool _1028 = _970 > 0.0;
    float _1030 = _1014 * (-2.0);
    float _1032 = -_1024;
    float _1034 = fma(_704, _980, _1032);
    float _1036 = fma(_1020, _1020, _1026);
    int _1038 = _998 ? 0 : 1;
    float _1040 = fma(_814, _1030, _814);
    bool _1042 = _970 >= 0.0;
    bool _1044 = isnan(_970);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = fma(_1034, _1034, _1036);
    int _1054 = ~_1038;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = _752 + (-0.5);
    int _1062 = _1058;
    if (!_984)
    {
        int _1064 = ~_1038;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    int _1070 = _1050 ? 0 : 1;
    float _1072 = rsqrt(_1052);
    bool _1074 = !_936;
    int _1076 = _1074 ? 0 : 1;
    int _1078 = ~_1070;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = fma(_1030, _1002, _1002);
    bool _1086 = !_932;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = _1082;
    if (!_1028)
    {
        int _1092 = ~_1070;
        int _1094 = _1092 + 1;
        _1090 = _1094;
    }
    int _1096 = _1090;
    float _1098 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1084);
    int _1100 = abs(_1088);
    float _1102 = _754 + _570;
    int _1104 = abs(_1076);
    float _1106 = fma(_1040, _948, _1098);
    float _1108 = float(_1068);
    float _1110 = _1102 + (-1.0);
    float _1112 = float(_1100);
    float _1114 = _1020 * _1072;
    float _1116 = float(_1096);
    float _1118 = _1034 * _1072;
    float _1120 = float(_1104);
    float _1122 = _1112 * _1108;
    float _1124 = _706 * _1114;
    float _1126 = _1012 * _1072;
    float _1128 = _1120 * _1116;
    float _1130 = _1122 * (-2.0);
    float _1132 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1134 = -_1124;
    float _1136 = fma(_704, _1118, _1134);
    float _1138 = _710 * _1118;
    float _1140 = fma(_1130, _1004, _1004);
    float _1142 = fma(_1132, _1130, _1132);
    float _1144 = _704 * _1126;
    float _1146 = -_1138;
    float _1148 = fma(_706, _1126, _1146);
    float _1150 = _1136 * _1136;
    float _1152 = _754 + (-0.5);
    float _1154 = -_1144;
    float _1156 = fma(_710, _1114, _1154);
    float _1158 = _570 + _752;
    float _1160 = fma(_1148, _1148, _1150);
    float _1162 = _1106 * 0.15915493667125701904296875;
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1140);
    float _1166 = fma(_1156, _1156, _1160);
    float _1168 = _1158 + (-1.0);
    float _1170 = _1128 * (-2.0);
    float _1172 = _570 + (-0.5);
    float _1174 = in.m_63.x;
    float _1176 = in.m_63.y;
    float _1178 = in.m_63.z;
    float _1180 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1182 = rsqrt(_1166);
    float _1184 = fma(_1170, _1006, _1006);
    float _1186 = fma(_1142, _948, _1164);
    float _1188 = fma(_1180, _1170, _1180);
    float _1190 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1184);
    float _1192 = _1186 * 0.15915493667125701904296875;
    float _1194 = _1162 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = fma(_1188, _948, _1190);
    float _1200 = _1198 * 0.15915493667125701904296875;
    float _1202 = _1162 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = _1148 * _1182;
    float _1208 = _1136 * _1182;
    float _1210 = _710 * _1206;
    float _1212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1176);
    float _1214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1174);
    float _1216 = _1192 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _1156 * _1182;
    float _1222 = _706 * _1208;
    float _1224 = -_1210;
    float _1226 = fma(_704, _1208, _1224);
    float _1228 = _572 * _1212;
    float _1230 = _704 * _1220;
    float _1232 = -_1222;
    float _1234 = fma(_710, _1220, _1232);
    float _1236 = _582 * _1214;
    float _1238 = _1192 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = -_1230;
    float _1244 = fma(_706, _1206, _1242);
    float _1246 = _1244 * _1244;
    float _1248 = _1200 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = fma(_1234, _1234, _1246);
    float _1254 = _1204 * _1218;
    float _1256 = _1196 * _1218;
    float _1258 = fma(_1226, _1226, _1252);
    float _1260 = _1200 * 6.283185482025146484375;
    float _1262 = sin(_1260);
    float _1264 = _1204 * _1240;
    float _1266 = _1196 * _1240;
    float _1268 = _1204 * _1250;
    float _1270 = rsqrt(_1258);
    float _1272 = _1196 * _1250;
    float _1274 = _1240 * _1250;
    float _1276 = _1268 * _1228;
    float _1278 = _1218 * _1250;
    float _1280 = _574 * _1178;
    float _1282 = fma(_1262, _1264, _1256);
    float _1284 = -_1228;
    float _1286 = _1262 * _1284;
    float _1288 = -_1266;
    float _1290 = fma(_1262, _1254, _1288);
    float _1292 = -_1254;
    float _1294 = fma(_1262, _1266, _1292);
    float _1296 = fma(_1282, _1236, _1276);
    float _1298 = _1272 * _1228;
    float _1300 = fma(_1274, _1236, _1286);
    float _1302 = fma(_1262, _1256, _1264);
    float _1304 = fma(_1290, _1280, _1296);
    float _1306 = fma(_1294, _1236, _1298);
    float _1308 = fma(_1278, _1280, _1300);
    float _1310 = _1226 * _1270;
    float _1312 = _1220 * _1304;
    float _1314 = fma(_1302, _1280, _1306);
    float _1316 = _1206 * _1304;
    float _1318 = _1234 * _1270;
    float _1320 = fma(_1310, _1308, _1312);
    float _1322 = _1208 * _1304;
    float _1324 = _1244 * _1270;
    float _1326 = fma(_1318, _1308, _1316);
    float _1328 = fma(_706, _1314, _1320);
    float _1330 = fma(_704, _1314, _1326);
    float _1332 = _628 + _1328;
    float _1334 = _626 + _1330;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1338 = _1332 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1342 = _1334 + _1340;
    float _1344 = _1338 * _1338;
    float _1346 = fma(_1342, _1342, _1344);
    float _1348 = fma(_1324, _1308, _1322);
    float _1350 = _624 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1352 = sqrt(_1346);
    float _1354 = fma(_710, _1314, _1348);
    float _1356 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1350);
    float _1358 = _624 + _1354;
    float _1360 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1356);
    bool _1362 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = _1354;
    float _1366 = _1350;
    float _1368 = _1356;
    if (!_1362)
    {
        _1364 = _1334;
    }
    float _1370 = _1364;
    float _1372 = _1370;
    if (!_1362)
    {
        _1366 = _1332;
    }
    float _1374 = _1366;
    float _1376 = _1374;
    if (!_1362)
    {
        _1368 = _1358;
    }
    float _1378 = _1368;
    bool _1380 = !_1362;
    float _1382 = _1378;
    if (!_1380)
    {
        float _1384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1388 = _1352 + _1386;
        float _1390 = _1358 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = rsqrt(_1346);
        float _1394 = _1388 * _1384;
        float _1396 = _1394 * 0.15915493667125701904296875;
        float _1398 = _1396 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1396 * 6.283185482025146484375;
        float _1404 = sin(_1402);
        float _1406 = _1400 + (-1.0);
        float _1408 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1410 = fma(_1404, _1390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1412 = fma(_1358, _1400, _1408);
        float _1414 = _1392 * _1410;
        float _1416 = fma(_1342, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1418 = fma(_1338, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1382 = _1412;
        _1372 = _1416;
        _1376 = _1418;
    }
    float _1420 = _1382;
    float _1422 = _1372;
    float _1424 = _1376;
    float _1426 = -_624;
    float _1428 = _1426 + _1420;
    float _1430 = -_626;
    float _1432 = _1430 + _1422;
    float _1434 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1436 = _624 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1438 = _1428 * _1428;
    float _1440 = -_628;
    float _1442 = _1440 + _1424;
    float _1444 = 1.0 / _1434;
    float _1446 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1436);
    float _1448 = fma(_1432, _1432, _1438);
    float _1450 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1446);
    float _1452 = fma(_1442, _1442, _1448);
    float _1454 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1456 = sqrt(_1452);
    float _1458 = _1454 + _1434;
    float _1460 = _1458 * _1444;
    float _1462 = _1460 * 0.5;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1466 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1464);
    float _1468 = 1.0 / _1466;
    bool _1470 = _1456 > 0.0;
    bool _1472 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.5);
    bool _1480 = _1476 || _1478;
    bool _1482 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1484 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(0.5);
    bool _1490 = _1486 || _1488;
    bool _1492 = !_1470;
    float _1494 = _1422;
    float _1496 = _1420;
    float _1498 = _1424;
    float _1500 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1502 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1504 = _1432;
    float _1506 = _1434;
    float _1508 = _1444;
    float _1510 = _1466;
    float _1512 = _1428;
    float _1514 = _1442;
    if (!_1492)
    {
        float _1516 = _184 * _184;
        float _1518 = fma(_182, _182, _1516);
        float _1520 = fma(_186, _186, _1518);
        float _1522 = rsqrt(_1452);
        float _1524 = sqrt(_1520);
        float _1526 = _1432 * _1522;
        float _1528 = _1428 * _1522;
        float _1530 = _1442 * _1522;
        bool _1532 = _1524 > 0.0;
        bool _1534 = !_1532;
        _1500 = _1524;
        _1502 = _1522;
        _1504 = _1528;
        _1510 = _1520;
        if (!_1534)
        {
            float _1536 = rsqrt(_1520);
            float _1538 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1540 = _184 * _1536;
            float _1542 = _182 * _1536;
            float _1544 = _186 * _1536;
            float _1546 = _1528 * _1540;
            float _1548 = fma(_1526, _1542, _1546);
            float _1550 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1552 = fma(_1530, _1544, _1548);
            float _1554 = _1552 * _1550;
            float _1556 = fma(_182, _1554, _1422);
            float _1558 = fma(_184, _1554, _1420);
            float _1560 = fma(_186, _1554, _1424);
            _1494 = _1556;
            _1496 = _1558;
            _1498 = _1560;
            _1500 = _1542;
            _1502 = _1554;
            _1504 = _1548;
            _1506 = _1540;
            _1508 = _1538;
            _1512 = _1550;
        }
    }
    float _1562 = _1494;
    float _1564 = _1496;
    float _1566 = _1498;
    float _1568 = _1500;
    float _1570 = _1502;
    float _1572 = _1504;
    float _1574 = _1506;
    float _1576 = _1508;
    float _1578 = _1510;
    float _1580 = _1512;
    float _1582 = _1568;
    float _1584 = _1574;
    float _1586 = _1572;
    float _1588 = _1576;
    float _1590 = _1570;
    float _1592 = _1578;
    float _1594 = _1580;
    if (_1480)
    {
        _1582 = 1.0;
    }
    float _1596 = _1582;
    float _1598 = _1596;
    if (_1490)
    {
        _1584 = _1562;
    }
    float _1600 = _1584;
    float _1602 = _1600;
    if (_1490)
    {
        _1586 = _1564;
    }
    float _1604 = _1586;
    float _1606 = _1604;
    if (_1490)
    {
        _1588 = _1566;
    }
    float _1608 = _1588;
    float _1610 = _1608;
    if (!_1490)
    {
        float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1614 = _624 + _1612;
        float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1618 = _626 + _1616;
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1622 = -_626;
        float _1624 = _1622 + _1562;
        float _1626 = _1614 * _1614;
        float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1630 = _628 + _1628;
        float _1632 = fma(_1618, _1618, _1626);
        float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1636 = fma(_1630, _1630, _1632);
        float _1638 = sqrt(_1636);
        float _1640 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1642 = precise::min(_1638, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1644 = _1642 * _1634;
        float _1646 = -_624;
        float _1648 = _1646 + _1564;
        float _1650 = -_628;
        float _1652 = _1650 + _1566;
        float _1654 = _1640 * _1644;
        float _1656 = fma(_1648, _1654, _624);
        float _1658 = fma(_1624, _1654, _626);
        float _1660 = fma(_1652, _1654, _628);
        _190 = _1648;
        _1590 = _1644;
        _1606 = _1656;
        _1602 = _1658;
        _1610 = _1660;
        _192 = _1654;
        _1592 = _1634;
    }
    float _1662 = _190;
    float _1664 = _1590;
    float _1666 = _1606;
    float _1668 = _1602;
    float _1670 = _1610;
    float _1672 = _192;
    float _1674 = _1592;
    float _1676 = _1662;
    float _1678 = _1664;
    float _1680 = _1674;
    if (_1480)
    {
        _1594 = 1.0;
    }
    float _1682 = _1594;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1686 = _1468 * _1684;
    float _1688 = _1682;
    if (!_1480)
    {
        float _1690 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1692 = _1690 * 0.15915493667125701904296875;
        float _1694 = _1692 * 6.283185482025146484375;
        float _1696 = cos(_1694);
        float _1698 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1692 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = 1.0 / _1696;
        float _1708 = _1700 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = _1704 * _1706;
        float _1714 = _1700 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        float _1718 = _1710 * _1712;
        float _1720 = 1.0 / _1718;
        float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1724 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1722;
        float _1726 = 1.0 / _1724;
        float _1728 = _1716 * _1720;
        float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1732 = fma(_1686, _1728, _1730);
        float _1734 = _1732 * _1726;
        float _1736 = precise::clamp(_1734, 0.0, 1.0);
        _1676 = _1692;
        _1598 = _1736;
    }
    float _1738 = _1676;
    float _1740 = _1598;
    float _1742 = _1738;
    if (!_1480)
    {
        float _1744 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1746 = _1744 * 0.15915493667125701904296875;
        float _1748 = _1746 * 6.283185482025146484375;
        float _1750 = cos(_1748);
        float _1752 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1754 = _1752 * 0.15915493667125701904296875;
        float _1756 = _1746 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        float _1760 = 1.0 / _1750;
        float _1762 = _1754 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = _1758 * _1760;
        float _1768 = _1754 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        float _1772 = _1764 * _1766;
        float _1774 = 1.0 / _1772;
        float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1778 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1776;
        float _1780 = 1.0 / _1778;
        float _1782 = _1770 * _1774;
        float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1786 = fma(_1686, _1782, _1784);
        float _1788 = _1786 * _1780;
        float _1790 = precise::clamp(_1788, 0.0, 1.0);
        float _1792 = -_1790;
        float _1794 = _1792 + 1.0;
        _1678 = _1774;
        _1742 = _1760;
        _1688 = _1794;
    }
    float _1796 = _1678;
    float _1798 = _1742;
    float _1800 = _1688;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1804 = _1666 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1808 = _1668 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1812 = _1670 + _1810;
    float _1814 = _1804 * _1804;
    float _1816 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1818 = fma(_1808, _1808, _1814);
    float _1820 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1816);
    float _1822 = fma(_1812, _1812, _1818);
    float _1824 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1820);
    float _1826 = rsqrt(_1822);
    float _1828 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1830 = sqrt(_1822);
    float _1832 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1834 = _1808 * _1832;
    float _1836 = _1812 * _1832;
    float _1838 = _1834 * _1834;
    float _1840 = _1836 * _1836;
    float _1842 = _1838 + _1840;
    float _1844 = sqrt(_1842);
    bool _1846 = _1844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1850 = _1844 + _1848;
    float _1852 = _1672;
    float _1854 = _1850;
    float _1856 = _1834;
    float _1858 = _1836;
    float _1860 = _1840;
    if (_1846)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1852 = _1862;
    }
    float _1864 = _1852;
    if (_1846)
    {
        float _1866 = _1850 * _1864;
        _1854 = _1866;
    }
    float _1868 = _1854;
    if (_1846)
    {
        float _1870 = _1868 * 0.15915493667125701904296875;
        _1514 = _1870;
    }
    float _1872 = _1514;
    float _1874 = _1796;
    if (_1846)
    {
        float _1876 = _1872 * 6.283185482025146484375;
        float _1878 = sin(_1876);
        _1874 = _1878;
    }
    float _1880 = _1874;
    float _1882 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1884 = precise::max(0.0, _1882);
    float _1886 = _1798;
    float _1888 = _1884;
    if (_1846)
    {
        float _1890 = _1872 * 6.283185482025146484375;
        float _1892 = cos(_1890);
        _1886 = _1892;
    }
    float _1894 = _1886;
    float _1896 = -_1832;
    float _1898 = -_1884;
    float _1900 = fma(_1804, _1896, _1898);
    float _1902 = _1882;
    if (_1846)
    {
        float _1904 = rsqrt(_1842);
        _1902 = _1904;
    }
    float _1906 = _1902;
    if (_1846)
    {
        float _1908 = _1900 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1888 = _1908;
    }
    float _1910 = _1888;
    float _1912 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1914 = fma(_626, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1916 = _1910;
    float _1918 = _1880;
    if (_1846)
    {
        float _1920 = fma(_1880, _1910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1680 = _1920;
    }
    float _1922 = _1680;
    float _1924 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1912);
    float _1926 = _1922;
    if (_1846)
    {
        float _1928 = _1894 + (-1.0);
        _1916 = _1928;
    }
    float _1930 = _1916;
    float _1932 = floor(_1914);
    float _1934 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1924);
    float _1936 = _1934 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1938 = _1906;
    float _1940 = _1930;
    if (_1846)
    {
        float _1942 = _1906 * _1922;
        _1918 = _1942;
    }
    float _1944 = _1918;
    if (_1846)
    {
        float _1946 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1926 = _1946;
    }
    float _1948 = _1926;
    if (!_1846)
    {
        _1938 = _1900;
    }
    float _1950 = _1938;
    float _1952 = _1950;
    if (_1846)
    {
        float _1954 = _1834 * _1944;
        _1856 = _1954;
    }
    float _1956 = _1856;
    if (_1846)
    {
        float _1958 = fma(_1900, _1894, _1948);
        _1952 = _1958;
    }
    float _1960 = _1952;
    if (!_1846)
    {
        _1940 = _1838;
    }
    float _1962 = _1940;
    float _1964 = _1962;
    if (_1846)
    {
        float _1966 = _1836 * _1944;
        _1858 = _1966;
    }
    float _1968 = _1858;
    if (_1846)
    {
        float _1970 = _1956 * _1956;
        _1964 = _1970;
    }
    float _1972 = _1964;
    if (_1846)
    {
        float _1974 = _1968 * _1968;
        _1860 = _1974;
    }
    float _1976 = _1860;
    float _1978 = -_1932;
    float _1980 = _1914 + _1978;
    float _1982 = fma(_1960, _1960, _1972);
    float _1984 = fma(_628, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1986 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1988 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1990 = _1982 + _1976;
    float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1994 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1992);
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    float _1998 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1986);
    float _2000 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1988);
    float _2002 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2004 = -_1996;
    float _2006 = _2004 + 1.0;
    float _2008 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1998);
    float _2010 = rsqrt(_1990);
    float _2012 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2000);
    float _2014 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2016 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2018 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2022 = abs(_2006);
    float _2024 = log2(_2022);
    float _2026 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2020);
    float _2028 = -_2016;
    float _2030 = fma(_2028, _2002, 1.0);
    float _2032 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2026);
    float _2034 = _2010 * _1956;
    float _2036 = _2010 * _1960;
    float _2038 = _2010 * _1968;
    float _2040 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2032);
    float _2042 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2044 = floor(_1984);
    float _2046 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2048 = -_2042;
    float _2050 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2048);
    float _2052 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2054 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2046);
    float _2056 = -_2038;
    float _2058 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2050);
    float _2060 = log2(_2030);
    float _2062 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2064 = fma(_2058, -0.5, 0.5);
    float _2066 = fma(_2058, 0.5, 0.5);
    float _2068 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2062);
    float _2070 = 1.0 / _2040;
    float _2072 = -_2044;
    float _2074 = _1984 + _2072;
    float _2076 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2054);
    float _2078 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2068);
    float _2080 = _2036 + 1.0;
    float _2082 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2076);
    float _2084 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2078);
    float _2086 = exp2(_2052);
    float _2088 = _2060 * 0.693147182464599609375;
    float _2090 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2092 = sqrt(_2064);
    float _2094 = fma(_2066, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2096 = _2082 * _2070;
    float _2098 = _2084 * _2070;
    float _2100 = fma(_2066, _2094, -0.212114393711090087890625);
    float _2102 = fma(_2096, 0.5, 0.5);
    float _2104 = -_2036;
    float _2106 = fma(_2086, _2080, _2104);
    float _2108 = fma(_2066, _2100, 1.570728778839111328125);
    float _2110 = fma(_2098, -0.5, 0.5);
    float _2112 = fma(_2106, 0.5, 0.5);
    float _2114 = _2092 * 0.636619746685028076171875;
    float2 _6769 = float2(_1980, _2074);
    float _2116 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6769, float2(0.0), isnan(_6769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6769, float2(0.0), isnan(_6769)), level(0.0)).x;
    float3 _6780 = float3(_2102, _2110, _2090);
    float _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6780, float3(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6780, float3(0.0), isnan(_6780)), level(0.0)).x;
    float _2120 = -_2108;
    float _2122 = fma(_2114, _2120, 1.0);
    float3 _6796 = float3(_2102, _2110, _2090);
    float4 _2125 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6796, float3(0.0), isnan(_6796)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6796, float3(0.0), isnan(_6796)), level(0.0)).xyzw;
    float _2127 = _2125.x;
    float _2129 = _2125.y;
    float _2131 = _2125.z;
    float _2133 = _2125.w;
    float2 _6812 = float2(_2122, _2112);
    float3 _2137 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6812, float2(0.0), isnan(_6812)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6812, float2(0.0), isnan(_6812)), level(0.0)).xyz;
    float _2139 = _2137.x;
    float _2141 = _2137.y;
    float _2143 = _2137.z;
    float _2145 = float(uint(_742));
    float _2147 = trunc(_650);
    int _2149 = int(_2147);
    bool _2151 = _742 == 0;
    float _2153 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2155 = abs(_910);
    float _2157 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2159 = abs(_922);
    float _2161 = 1.0 / _2145;
    int _2163 = ~_742;
    int _2165 = _2163 + 1;
    float _2167 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2157);
    float _2169 = float(uint(_2149));
    float _2171 = exp2(_2153);
    float _2173 = float(_106);
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2177 = _2175 != 0;
    int _2179 = as_type<int>(_2161) + (-2);
    float _2181 = 1.0 / _2173;
    int _2183 = ~_742;
    int _2185 = _2183 + 1;
    float _2187 = as_type<float>(_2179) * _2169;
    bool _2189 = !_2177;
    float _2191 = _2189 ? 7.345489978790283203125 : 1.0;
    float _2193 = -_2171;
    float _2195 = _2193 + 1.0;
    float _2197 = trunc(_2187);
    float _2199 = precise::max(_2197, 0.0);
    uint _2202 = uint(_2199);
    float _2204 = _2191 * _752;
    int _2206 = ~_742;
    int _2208 = _2206 + 1;
    float _2210 = float(_2149);
    bool _2212 = _2210 >= _774;
    bool _2214 = isnan(_2210);
    bool _2216 = _2212 || _2214;
    bool _2218 = isnan(_774);
    bool _2220 = _2216 || _2218;
    float _2222 = float(_2220);
    int _2224 = _2165 * int(_2202);
    int _2226 = _2224 + _2149;
    float _2228 = trunc(_2222);
    int _2230 = int(_2228);
    float _2232 = float(uint(_2226));
    float _2234 = as_type<float>(_2179) * _2232;
    float _2236 = floor(_2204);
    float _2238 = trunc(_2234);
    float _2240 = precise::max(_2238, 0.0);
    uint _2242 = uint(_2240);
    float _2244 = -_2236;
    float _2246 = _2204 + _2244;
    float _2248 = _2246 * _774;
    float _2250 = _788 * _2181;
    int _2252 = ~_2230;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    int _2258 = int(_2202) + int(_2242);
    float _2260 = trunc(_2248);
    int _2262 = int(_2260);
    int _2264 = _742 + (-1);
    int _2266 = _2208 * _2258;
    int _2268 = _2266 + _2149;
    bool _2270 = uint(_2268) >= uint(_742);
    float _2272 = trunc(_2250);
    int _2274 = int(_2272);
    bool _2276 = !_2270;
    int _2278 = _2276 ? 0 : (-1);
    int _2280 = ~_2258;
    int _2282 = _2280 + _2278;
    int _2284 = _2282 + 1;
    int _2286 = _742 * _2284;
    int _2288 = _2286 + _2149;
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2292 = _2290 != 0;
    int _2294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2296 = _2294 != 0;
    bool _2298 = !_2151;
    int _2300 = _2298 ? _2288 : (-1);
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2304 = _558 + _2302;
    bool _2306 = !_2292;
    int _2308 = _2306 ? 0 : 1;
    int _2310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2312 = _2310 != 0;
    int _2314 = _2300 * _2256;
    int _2316 = abs(_2308);
    bool _2318 = !_2312;
    int _2320 = _2318 ? 0 : 1;
    int _2322 = _2230 * _2264;
    int _2324 = _2322 + _2314;
    int _2326 = abs(_916);
    int _2328 = _2324 * _2155;
    int _2330 = abs(_2320);
    int _2332 = _2262 * _2316;
    int _2334 = _2332 + _2149;
    int _2336 = ~_742;
    int _2338 = _2336 + 1;
    int _2340 = _2274 * _2326;
    int _2342 = _2340 + _2328;
    int _2344 = ~_742;
    int _2346 = _2344 + 1;
    int _2348 = _2334 * _2159;
    int _2350 = _2348 + _2342;
    int _2352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2354 = _2352 != 0;
    int _2356 = _2262 * _2330;
    int _2358 = _2356 + _2350;
    int _2360 = ~_742;
    int _2362 = _2360 + 1;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2370 = _2368 != 0;
    float _2372 = float(uint(_2358));
    float _2374 = 1.0 / _2366;
    float _2376 = as_type<float>(_2179) * _2372;
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2380 = _2378 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2382 = trunc(_2376);
    float _2384 = precise::max(_2382, 0.0);
    uint _2386 = uint(_2384);
    float _2388 = 1.0 / _2380;
    float _2390 = float(uint(_2334));
    int _2392 = _2362 * int(_2386);
    int _2394 = _2392 + _2358;
    float _2396 = float(uint(_2394));
    float _2398 = as_type<float>(_2179) * _2390;
    float _2400 = as_type<float>(_2179) * _2396;
    float _2402 = trunc(_2398);
    float _2404 = precise::max(_2402, 0.0);
    uint _2406 = uint(_2404);
    float _2408 = trunc(_2400);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    int _2414 = _2346 * int(_2406);
    int _2416 = _2414 + _2334;
    float _2418 = float(uint(_2416));
    int _2420 = int(_2386) + int(_2412);
    float _2422 = as_type<float>(_2179) * _2418;
    float _2424 = in.m_65.y;
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2428 = _558 + _2426;
    float _2430 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2430;
    int _2434 = _2338 * _2420;
    int _2436 = _2434 + _2358;
    float _2438 = trunc(_2422);
    float _2440 = precise::max(_2438, 0.0);
    uint _2442 = uint(_2440);
    float _2444 = _2432 * _2388;
    bool _2446 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2448 = isnan(_558);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2454 = _2450 || _2452;
    float _2456 = float(_2454);
    bool _2458 = uint(_2436) >= uint(_742);
    bool _2460 = !_2458;
    int _2462 = _2460 ? 0 : (-1);
    bool _2464 = _754 > 0.5;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2470 = ~_2420;
    int _2472 = _2470 + _2462;
    int _2474 = _2472 + 1;
    int _2476 = _742 * _2474;
    int _2478 = _2476 + _2358;
    float _2480 = 1.0 / _2468;
    float _2482 = as_type<float>(_2474);
    float _2484 = _2040;
    float _2486 = _2084;
    if (_2296)
    {
        float _2488 = in.m_55.x;
        _2482 = _2488;
    }
    float _2490 = _2482;
    int _2492 = int(_2406) + int(_2442);
    bool _2494 = !_2151;
    int _2496 = _2494 ? _2478 : (-1);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _2498 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2500 = isnan(_558);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2506 = _2502 || _2504;
    float _2508 = float(_2506);
    int _2510 = _2185 * _2492;
    int _2512 = _2510 + _2334;
    int _2514 = _2496 >> 31;
    int _2516 = _2496 & 3;
    bool _2518 = _2516 != 0;
    int _2520 = _2514 & 3;
    bool _2522 = uint(_2516) > 1u;
    int _2524 = _2496 + _2520;
    float _2526 = -_2424;
    float _2528 = _2526 + 1.0;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2532 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2530;
    int _2534 = _2524 >> 2;
    float _2536 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2540 = _2424;
    if (_2354)
    {
        float _2542 = _2464 ? _2528 : _2424;
        _2540 = _2542;
    }
    float _2544 = _2540;
    float _2546 = _2532 * _2374;
    int _2548 = _2534 << 4;
    int _2550 = _2548 + 368;
    float _2552 = _2538 * _2480;
    bool _2554 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2556 = isnan(_558);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    float _2566 = fma(_2546, _2428, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    uint _2568 = uint(int(uint(_2550) >> uint(2)));
    uint _2570 = uint(int(uint(int(_2568)) >> uint(2)));
    int _2572 = int(_2568) & 3;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[int(_2570)][_2572];
    int _2576 = int(_2568) + 1;
    uint _2578 = uint(int(uint(_2576) >> uint(2)));
    int _2580 = _2576 & 3;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[int(_2578)][_2580];
    bool _2584 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2586 = isnan(_558);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = fma(_2552, _2304, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2598 = -_2564;
    float _2600 = _2598 + 1.0;
    bool _2602 = _2490 > 0.5;
    bool _2604 = _2602 && _2296;
    float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2608 = _558 + _2606;
    int _2610 = _2496 & 3;
    bool _2612 = _2610 != 0;
    float _2614 = _2594 * _2600;
    float _2616 = -_2594;
    float _2618 = _2616 + 1.0;
    float _2620 = -_2508;
    float _2622 = _2620 + 1.0;
    int _2624 = _2612 ? 0 : 1;
    float _2626 = fma(_2444, _2608, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2628 = _2508 * _2618;
    float _2630 = _2456 * _2622;
    int _2632 = ~_2624;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    int _2638 = _2550 + 8;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    uint _2642 = uint(int(uint(int(_2640)) >> uint(2)));
    int _2644 = int(_2640) & 3;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[int(_2642)][_2644];
    int _2648 = int(_2640) + 1;
    uint _2650 = uint(int(uint(_2648) >> uint(2)));
    int _2652 = _2648 & 3;
    float _2654 = (*spvDescriptorSet0.vp_c9)._m0[int(_2650)][_2652];
    int _2656 = _2636;
    if (!_2522)
    {
        int _2658 = ~_2624;
        int _2660 = _2658 + 1;
        _2656 = _2660;
    }
    int _2662 = _2656;
    float _2664 = _2566 * _2630;
    float _2666 = -_2456;
    float _2668 = _2666 + 1.0;
    bool _2670 = !_2518;
    int _2672 = _2670 ? 0 : 1;
    float _2674 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2676 = int(_2674);
    bool _2678 = _2516 != 3;
    float _2680 = -_2116;
    float _2682 = _2680 + 1.0;
    bool _2684 = uint(_2516) >= 2u;
    bool _2686 = uint(_2512) >= uint(_742);
    int _2688 = abs(_2662);
    int _2690 = _2684 ? 0 : 1;
    float _2692 = abs(_1686);
    float _2694 = log2(_2692);
    int _2696 = abs(_2672);
    float _2698 = fma(_2668, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2664);
    int _2700 = ~_2688;
    int _2702 = _2700 + 1;
    int _2704 = _2702 + 1;
    int _2706 = ~_2690;
    int _2708 = _2706 + 1;
    int _2710 = _2708 + 1;
    float _2712 = fma(_2596, _2628, _2698);
    bool _2714 = _2516 != 3;
    int _2716 = _2710;
    if (_2678)
    {
        int _2718 = ~_2690;
        int _2720 = _2718 + 1;
        _2716 = _2720;
    }
    int _2722 = _2716;
    float _2724 = fma(_2626, _2614, _2712);
    int _2726 = ~_2696;
    int _2728 = _2726 + 1;
    int _2730 = _2728 + 1;
    bool _2732 = !_2714;
    int _2734 = _2732 ? 0 : (-1);
    bool _2736 = !_2686;
    int _2738 = _2736 ? 0 : (-1);
    int _2740 = abs(_2734);
    int _2742 = _2704 * as_type<int>(_2582);
    int _2744 = abs(_2722);
    bool _2746 = !_2370;
    int _2748 = _2746 ? 0 : 1;
    int _2750 = _2730 * as_type<int>(_2574);
    int _2752 = _2750 + _2742;
    float _2754 = in.m_69.x;
    float _2756 = in.m_69.y;
    float _2758 = in.m_69.z;
    int _2760 = ~_2492;
    int _2762 = _2760 + _2738;
    int _2764 = _2762 + 1;
    float _2766 = float(uint(_2676));
    bool _2768 = _1176 != 0.0;
    bool _2770 = isnan(_1176);
    bool _2772 = _2768 || _2770;
    bool _2774 = isnan(0.0);
    bool _2776 = _2772 || _2774;
    int _2778 = _742 * _2764;
    int _2780 = _2778 + _2334;
    int _2782 = abs(_2748);
    float _2784 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2786 = 1.0 / _2766;
    int _2788 = ~_2744;
    int _2790 = _2788 + 1;
    int _2792 = _2790 + 1;
    int _2794 = abs(_2676);
    bool _2796 = _1174 == 0.0;
    bool _2798 = !_2776;
    bool _2800 = _2796 && _2798;
    int _2802 = _2792 * as_type<int>(_2646);
    int _2804 = _2802 + _2752;
    float _2806 = exp2(_2784);
    int _2808 = ~_2740;
    int _2810 = _2808 + 1;
    int _2812 = _2810 + 1;
    bool _2814 = _1178 == 0.0;
    bool _2816 = _2814 && _2800;
    float _2818 = float(uint(_2794));
    int _2820 = _2812 * as_type<int>(_2654);
    int _2822 = _2820 + _2804;
    int _2824 = ~_2782;
    int _2826 = _2824 + 1;
    int _2828 = _2826 + 1;
    float _2830 = 1.0 / _2818;
    bool _2832 = !_2151;
    int _2834 = _2832 ? _2780 : (-1);
    int _2836 = _2822 * _2828;
    int _2838 = as_type<int>(_2786) + (-2);
    int _2840 = _2834 * _2782;
    int _2842 = _2840 + _2836;
    float _2844 = _2758;
    float _2846 = _2756;
    float _2848 = _2754;
    if (!_2816)
    {
        float _2850 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2758);
        _2844 = _2850;
    }
    float _2852 = _2844;
    if (!_2816)
    {
        float _2854 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2756);
        _2846 = _2854;
    }
    float _2856 = _2846;
    if (!_2816)
    {
        float _2858 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2754);
        _2848 = _2858;
    }
    float _2860 = _2848;
    float _2862 = float(uint(_2842));
    float _2864 = in.m_65.x;
    int _2866 = abs(_2842);
    float _2868 = fma(_2806, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2870 = precise::clamp(_2868, 0.0, 1.0);
    int _2872 = as_type<int>(_2830) + (-2);
    float _2874 = as_type<float>(_2838) * _2862;
    float _2876 = float(uint(_2866));
    float _2878 = fma(_2870, -2.0, 3.0);
    float _2880 = _2870 * _2870;
    float _2882 = fma(_2564, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2724);
    float _2884 = trunc(_2874);
    float _2886 = precise::max(_2884, 0.0);
    uint _2888 = uint(_2886);
    float _2890 = as_type<float>(_2872) * _2876;
    float _2892 = _2880 * _2878;
    float _2894 = _2882 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2896 = -_2892;
    float _2898 = _2896 + 1.0;
    int _2900 = ~_2676;
    int _2902 = _2900 + 1;
    float _2904 = trunc(_2890);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    int _2910 = ~_2794;
    int _2912 = _2910 + 1;
    float _2914 = fma(_2898, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2892);
    float _2916 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2918 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2922 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2924 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (_2296)
    {
        _2922 = _2864;
    }
    float _2926 = _2922;
    int _2928 = _2902 * int(_2888);
    int _2930 = _2928 + _2842;
    float _2932 = _2926;
    if (!_2296)
    {
        _2924 = _2864;
    }
    float _2934 = _2924;
    float _2936 = _2916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2938 = _2918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2940 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2942 = float(uint(_2930));
    float _2944 = _2934;
    if (_2604)
    {
        float _2946 = -_2926;
        float _2948 = _2946 + 1.0;
        _2932 = _2948;
    }
    float _2950 = _2932;
    bool _2952 = _1686 <= 8000.0;
    bool _2954 = isnan(_1686);
    bool _2956 = _2952 || _2954;
    bool _2958 = isnan(8000.0);
    bool _2960 = _2956 || _2958;
    float _2962 = float(_2960);
    int _2964 = _2912 * int(_2908);
    int _2966 = _2964 + _2866;
    float _2968 = _1290 * _1206;
    float _2970 = as_type<float>(_2838) * _2942;
    if (_2296)
    {
        _2944 = _2950;
    }
    float _2972 = _2944;
    float _2974 = _2962 * _2914;
    float _2976 = float(uint(_2966));
    float _2978 = trunc(_2970);
    float _2980 = precise::max(_2978, 0.0);
    uint _2982 = uint(_2980);
    float _2984 = _1268 * _1206;
    float _2986 = _1268 * _1208;
    float _2988 = _1282 * _1206;
    float _2990 = as_type<float>(_2872) * _2976;
    float _2992 = _1268 * _1220;
    float _2994 = _1282 * _1208;
    float _2996 = _1282 * _1220;
    float _2998 = _1290 * _1208;
    out.m_71.x = _2936;
    out.m_71.y = _2938;
    out.m_71.z = _2940;
    out.m_71.w = _2894;
    float _3000 = trunc(_2990);
    float _3002 = precise::max(_3000, 0.0);
    uint _3004 = uint(_3002);
    float _3006 = _1290 * _1220;
    float _3008 = fma(_1274, _1310, _2996);
    float _3010 = fma(_1278, _1318, _2968);
    float _3012 = -_1262;
    float _3014 = fma(_3012, _1310, _2992);
    float _3016 = fma(_1278, _1310, _3006);
    int _3018 = int(_2888) + int(_2982);
    float _3020 = fma(_1274, _1318, _2988);
    float _3022 = fma(_1274, _1324, _2994);
    int _3024 = ~_2676;
    int _3026 = _3024 + 1;
    float _3028 = -_1262;
    float _3030 = fma(_3028, _1324, _2986);
    float _3032 = fma(_1278, _1324, _2998);
    int _3034 = ~_2794;
    int _3036 = _3034 + 1;
    float _3038 = -_1262;
    float _3040 = fma(_3038, _1318, _2984);
    int _3042 = int(_2908) + int(_3004);
    int _3044 = _3026 * _3018;
    int _3046 = _3044 + _2842;
    float _3048 = fma(_1272, _706, _3014);
    float _3050 = fma(_1272, _710, _3030);
    float _3052 = fma(_1294, _710, _3022);
    int _3054 = _3036 * _3042;
    int _3056 = _3054 + _2866;
    bool _3058 = uint(_3046) >= uint(_2676);
    float _3060 = fma(_1272, _704, _3040);
    float _3062 = fma(_1294, _704, _3020);
    float _3064 = fma(_1302, _704, _3010);
    float _3066 = fma(_1294, _706, _3008);
    float _3068 = fma(_1302, _710, _3032);
    bool _3070 = uint(_3056) >= uint(_2794);
    float _3072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3074 = !_3058;
    int _3076 = _3074 ? 0 : (-1);
    float _3078 = fma(_1302, _706, _3016);
    int _3080 = _2842 ^ _2676;
    float _3082 = _3060 * _2856;
    bool _3084 = !_3070;
    int _3086 = _3084 ? 0 : (-1);
    float _3088 = _3050 * _2856;
    int _3090 = ~_3018;
    int _3092 = _3090 + _3076;
    int _3094 = _3092 + 1;
    float _3096 = _3048 * _2856;
    uint _3098 = uint(int(uint(_3080) >> uint(31)));
    float _3100 = fma(_3052, _2860, _3088);
    int _3102 = ~_3086;
    int _3104 = _3042 + _3102;
    int _3106 = _3104 + 1;
    float _3108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3110 = ~int(_3098);
    int _3112 = _3110 + 1;
    int _3114 = _2676 * _3094;
    int _3116 = _3114 + _2842;
    bool _3118 = _2676 == 0;
    float _3120 = fma(_3062, _2860, _3082);
    float _3122 = _3072 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3124 = _3106 ^ _3112;
    float _3126 = fma(_3066, _2860, _3096);
    bool _3128 = !_3118;
    int _3130 = _3128 ? _3116 : (-1);
    float _3132 = fma(_3122, _2972, -0.5);
    bool _3134 = _2676 == 0;
    float _3136 = fma(_3064, _2852, _3120);
    float _3138 = float(_3130);
    float _3140 = fma(_3068, _2852, _3100);
    int _3142 = ~_3112;
    int _3144 = _3142 + _3124;
    int _3146 = _3144 + 1;
    float _3148 = fma(_3078, _2852, _3126);
    float _3150 = _3108 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3152 = fma(_3122, _3138, _822);
    bool _3154 = !_3134;
    int _3156 = _3154 ? _3146 : (-1);
    float _3158 = _2040 * 0.5;
    float _3160 = fma(_3150, _2544, -0.5);
    float _3162 = fma(_942, _3132, _3152);
    float _3164 = float(_3156);
    float _3166 = in.m_73.x;
    float _3168 = fma(_2084, -0.5, _3158);
    float _3170 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3172 = -_924;
    float _3174 = fma(_3150, _3164, _3172);
    float _3176 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2167);
    float _3178 = _2682 * _3170;
    float _3180 = precise::clamp(_3178, 0.0, 1.0);
    float _3182 = _2082 + _2040;
    float _3184 = fma(_944, _3160, _3174);
    float _3186 = _3162 + 0.5;
    float _3188 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3190 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3176);
    float _3192 = _3184 + 0.5;
    float _3194 = -_3180;
    float _3196 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3198 = _3188 * _2118;
    out.m_75.x = _3136;
    out.m_75.y = _3140;
    out.m_75.z = _3148;
    bool _3200 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3202 = isnan(_1830);
    bool _3204 = _3200 || _3202;
    bool _3206 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3208 = _3204 || _3206;
    float _3210 = _3190 + _2040;
    out.m_77.x = _3186;
    out.m_77.y = _3192;
    float _3212 = _2143 * _3198;
    float _3214 = _3210 * 0.5;
    float _3216 = _3182 * 0.5;
    out.gl_Position.x = _2082;
    out.gl_Position.y = _2084;
    out.gl_Position.z = _3190;
    out.gl_Position.w = _2040;
    float _3218 = _3196 * _3166;
    float _3220 = fma(_2133, _3212, _2131);
    out.m_79.x = _3216;
    out.m_79.y = _3168;
    out.m_79.z = _3214;
    out.m_79.w = _2040;
    float _3222 = _3218 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3224 = _2133 * _3198;
    float _3226 = fma(_2139, _3224, _2127);
    float _3228 = fma(_2141, _3224, _2129);
    out.m_81.x = _3222;
    float _3230 = -_3188;
    float _3232 = _3230 + 1.0;
    float _3234 = _3190;
    float _3236 = _3168;
    float _3238 = _3216;
    if (!_3208)
    {
        _2484 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3240 = _2484;
    float _3242 = _3240;
    float _3244 = _3240;
    if (!_3208)
    {
        _3234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3246 = _3234;
    float _3248 = _2133 * _3232;
    float _3250 = _1740 * _1800;
    float _3252 = _3250;
    float _3254 = _3246;
    float _3256 = _3246;
    if (!_3208)
    {
        _3236 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3258 = _3236;
    float _3260 = _3258;
    float _3262 = _3258;
    if (!_3208)
    {
        _3238 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3264 = _3238;
    out.m_83.x = _3226;
    out.m_83.y = _3228;
    out.m_83.z = _3220;
    out.m_83.w = _3248;
    float _3266 = _3250 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3268 = _3264;
    float _3270 = _3264;
    if (!_3208)
    {
        _2486 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3272 = _2486;
    float _3274 = _3272;
    float _3276 = _3272;
    if (!_3208)
    {
        _3252 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3278 = _3252;
    bool _3280 = !_3208;
    float _3282 = _3278;
    float _3284 = _3278;
    if (!_3280)
    {
        bool _3286 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3288 = isnan(_1830);
        bool _3290 = _3286 || _3288;
        bool _3292 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3294 = _3290 || _3292;
        if (!_3294)
        {
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3298 = _1830 + _3296;
            float _3300 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3302 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3300;
            float _3304 = 1.0 / _3302;
            float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3326 = _3298 * _3304;
            float _3328 = precise::clamp(_3326, 0.0, 1.0);
            float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3332 = _3330 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3334 = fma(_3328, _3308, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3336 = fma(_3328, _3332, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3338 = fma(_3328, _3312, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3340 = fma(_3328, _3316, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3342 = fma(_3328, _3320, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3344 = fma(_3328, _3324, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3270 = _3336;
            _3276 = _3342;
            _3262 = _3334;
            _3256 = _3340;
            _3244 = _3338;
            _3284 = _3344;
            _3346 = true;
        }
        else
        {
            bool _3348 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3350 = isnan(_1830);
            bool _3352 = _3348 || _3350;
            bool _3354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3356 = _3352 || _3354;
            if (!_3356)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3358 = _3260;
            _3262 = _3358;
            if (!_3356)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3360 = _3268;
            _3270 = _3360;
            if (!_3356)
            {
                _3242 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3362 = _3242;
            _3244 = _3362;
            if (!_3356)
            {
                _3254 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3364 = _3254;
            _3256 = _3364;
            if (!_3356)
            {
                _3274 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3366 = _3274;
            _3276 = _3366;
            if (!_3356)
            {
                _3282 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3368 = _3282;
            bool _3370 = !_3356;
            _3284 = _3368;
            if (!_3370)
            {
                bool _3372 = _1830 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3374 = isnan(_1830);
                bool _3376 = _3372 || _3374;
                bool _3378 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3380 = _3376 || _3378;
                if (!_3380)
                {
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3384 = _1830 + _3382;
                    float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3388 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3386;
                    float _3390 = 1.0 / _3388;
                    float _3392 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3394 = _3392 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3412 = _3384 * _3390;
                    float _3414 = precise::clamp(_3412, 0.0, 1.0);
                    float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3420 = fma(_3414, _3394, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3422 = fma(_3414, _3418, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3424 = fma(_3414, _3398, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3426 = fma(_3414, _3402, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3428 = fma(_3414, _3406, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3430 = fma(_3414, _3410, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3270 = _3422;
                    _3276 = _3428;
                    _3262 = _3420;
                    _3256 = _3426;
                    _3244 = _3424;
                    _3284 = _3430;
                    _3346 = true;
                }
                else
                {
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3276 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3256 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3244 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3284 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3346 = false;
    float _3432 = _3270;
    float _3434 = _3276;
    float _3436 = _3262;
    float _3438 = _3256;
    float _3440 = _3244;
    float _3442 = _3284;
    float _3444 = fma(_3140, -0.5, 0.5);
    float _3446 = precise::clamp(_3444, 0.0, 1.0);
    float _3448 = -_3432;
    float _3450 = _3448 + _3434;
    float _3452 = _3266 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3454 = -_3436;
    float _3456 = _3454 + _3438;
    float _3458 = fma(_3446, _3450, _3432);
    out.m_85.x = 0.0;
    float _3460 = -_3440;
    float _3462 = _3460 + _3442;
    float _3464 = fma(_3446, _3456, _3436);
    float _3466 = _3458 * 0.586610972881317138671875;
    out.m_49.x = _3452;
    bool _3468 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3470 = fma(_3446, _3462, _3440);
    float _3472 = fma(_3464, 0.298911988735198974609375, _3466);
    bool _3474 = _1740 > 0.0;
    bool _3476 = isnan(_1740);
    bool _3478 = _3474 || _3476;
    bool _3480 = isnan(0.0);
    bool _3482 = _3478 || _3480;
    float _3484 = fma(_3470, 0.114477999508380889892578125, _3472);
    bool _3486 = _1800 <= 0.0;
    bool _3488 = !_3482;
    bool _3490 = _3486 || _3488;
    float _3492 = -_3484;
    float _3494 = _3464 + _3492;
    float _3496 = -_3484;
    float _3498 = _3458 + _3496;
    float _3500 = -_3484;
    float _3502 = _3470 + _3500;
    float _3504 = fma(_3494, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3484);
    float _3506 = fma(_3498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3484);
    float _3508 = fma(_3502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3484);
    bool _3510 = !_3468;
    if (!_3510)
    {
        float _3512 = -_1666;
        float _3514 = _3512 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3516 = -_1668;
        float _3518 = _3516 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3520 = -_1670;
        float _3522 = _3520 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3524 = _3514 * _3514;
        float _3526 = fma(_3518, _3518, _3524);
        float _3528 = fma(_3522, _3522, _3526);
        float _3530 = sqrt(_3528);
        float _3532 = rsqrt(_3528);
        float _3534 = -_3530;
        float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3538 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3540 = precise::clamp(_3538, 0.0, 1.0);
        float _3542 = _3518 * _3532;
        float _3544 = _3514 * _3532;
        float _3546 = abs(_3540);
        float _3548 = log2(_3546);
        float _3550 = _3522 * _3532;
        float _3552 = _3542 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3554 = _3140 * _3544;
        float _3556 = -_3544;
        float _3558 = -_3552;
        float _3560 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3558);
        float _3562 = fma(_3136, _3542, _3554);
        float _3564 = -_3550;
        float _3566 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3560);
        float _3568 = fma(_3148, _3550, _3562);
        float _3570 = precise::clamp(_3568, 0.0, 1.0);
        float _3572 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3574 = _3566 + _3572;
        float _3576 = _3548 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3578 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3580 = precise::clamp(_3578, 0.0, 1.0);
        float _3582 = exp2(_3576);
        float _3584 = _3582 * _3580;
        float _3586 = _3570 * _3584;
        float _3588 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3590 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3592 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _3588;
        out.m_85.y = _3590;
        out.m_85.z = _3592;
    }
    out.m_87.x = _3504;
    out.m_87.y = _3506;
    out.m_87.z = _3508;
    if (!_3490)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3594 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3594;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

