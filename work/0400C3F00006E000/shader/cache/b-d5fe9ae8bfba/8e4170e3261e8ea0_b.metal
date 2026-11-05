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
    float4 m_61 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2844 = false;
    bool _378 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = _107;
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3160 = as_type<float>(_134);
        out.gl_Position.z = _3160;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3215 = as_type<float>(_160);
        out.gl_Position.z = _3215;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _218 + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _260 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _262 = isnan(_218);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_234;
    float _274 = _272 + 1.0;
    float _276 = 1.0 / _254;
    float _278 = _270 * _274;
    float _280 = -_270;
    float _282 = _280 + 1.0;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _258;
    float _292 = _250 * _282;
    float _294 = -_250;
    float _296 = _294 + 1.0;
    float _298 = _222 * _276;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = fma(_286, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = fma(_306, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _314 = _238 * _290;
    float _316 = _308 * _292;
    float _318 = _310 * _292;
    float _320 = _312 * _292;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[143].x, _316);
    float _336 = fma(_324, _314, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_328, _314, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _340 = fma(_332, _314, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _342 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[143].y, _318);
    float _344 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[143].z, _320);
    float _346 = fma(_336, _278, _334);
    float _348 = fma(_338, _278, _342);
    float _350 = fma(_340, _278, _344);
    float _352 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[145].x, _346);
    float _354 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[145].y, _348);
    float _356 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[145].z, _350);
    bool _358 = !_288;
    float _376;
    if (!_358)
    {
        float _360 = in.m_57.x;
        float _362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _364 = _360 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _368 = _366 * _362;
        float _370 = floor(_368);
        float _372 = -_370;
        float _374 = _368 + _372;
        _376 = _374;
        _378 = true;
    }
    else
    {
        _376 = _172;
    }
    _378 = false;
    float _380 = _376;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _380 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _390 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _392 = isnan(_380);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _406 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _408 = isnan(_380);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _418;
    bool _422 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _424 = isnan(_380);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = 1.0 / _388;
    float _436 = -_400;
    float _438 = _436 + 1.0;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _442 = 1.0 / _404;
    float _444 = _420 * _434;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _450 = -_432;
    float _452 = _450 + 1.0;
    float _454 = fma(_444, _384, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _456 = _416 * _438;
    float _458 = -_416;
    float _460 = _458 + 1.0;
    float _462 = _400 * _452;
    float _464 = _448 * _442;
    float _466 = _454 * _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _470 = _380 + _468;
    float _472 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[115].x, _466);
    float _474 = fma(_464, _470, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _478 = fma(_474, _462, _472);
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _482 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[117].x, _478);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _484 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _492 = in.m_59.x;
    float _494 = in.m_59.y;
    float _496 = in.m_59.z;
    float _498 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _482;
    out.m_61.y = _488;
    out.m_61.z = _498;
    out.m_61.w = _490;
    float _500 = _356 * _496;
    float _502 = _354 * _494;
    float _504 = _352 * _492;
    bool _506 = !_440;
    if (!_506)
    {
        float _508 = in.m_57.x;
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _516 = _514 * _510;
        float _518 = floor(_516);
        float _520 = -_518;
        float _522 = _516 + _520;
        _194 = _522;
    }
    float _524 = _194;
    float _526 = in.m_57.z;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    float _532 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = in.m_57.x;
    float _536 = in.m_57.y;
    float _538 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _540 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _542 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _544 = int(_542);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _550 = _530 * _116;
    float _552 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _554 = int(_552);
    float _556 = _526 * 2.0;
    float _558 = exp2(_550);
    float _560 = _534 * 2.0;
    float _562 = _536 * 2.0;
    float _564 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _566 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _568 = floor(_556);
    float _570 = -_546;
    float _572 = fma(_564, 2.0, _570);
    float _574 = _536 + _534;
    float _576 = fma(_566, -2.0, _548);
    float _578 = _574 + (-1.0);
    float _580 = float(_544);
    float _582 = floor(_560);
    float _584 = -_558;
    float _586 = _584 + 1.0;
    float _588 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _590 = float(_554);
    float _592 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _576);
    bool _594 = _568 >= 0.0;
    bool _596 = isnan(_568);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = floor(_562);
    float _606 = _590 * _116;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _618 = _616 != 0;
    int _620 = _602 ? 0 : 1;
    bool _622 = _582 > 0.0;
    float _624 = 1.0 / _580;
    bool _626 = !_614;
    int _628 = _626 ? 0 : 1;
    bool _630 = _568 > 0.0;
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    bool _636 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    bool _646 = _582 >= 0.0;
    bool _648 = isnan(_582);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    bool _656 = _604 > 0.0;
    bool _658 = _604 >= 0.0;
    bool _660 = isnan(_604);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    int _668 = ~_620;
    int _670 = _668 + 1;
    int _672 = _670 + 1;
    float _674 = _624 * _116;
    int _676 = _672;
    float _678 = _592;
    if (!_630)
    {
        int _680 = ~_620;
        int _682 = _680 + 1;
        _676 = _682;
    }
    int _684 = _676;
    bool _686 = !_618;
    int _688 = _686 ? 0 : 1;
    float _690 = in.m_63.x;
    float _692 = in.m_63.y;
    float _694 = in.m_63.z;
    float _696 = _644 ? _586 : 0.0;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _710 = _708 != 0;
    float _712 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].w, _698);
    bool _714 = !_702;
    int _716 = _714 ? 0 : 1;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _720 = _654 ? 0 : 1;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _724 = 1.0 + _722;
    int _726 = abs(_716);
    float _728 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].z, _718);
    float _730 = -_116;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[76].x, _572);
    float _734 = float(_684);
    float _736 = 1.0 / _724;
    float _738 = float(_726);
    float _740 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _712);
    bool _742 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _744 = isnan(1.0);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _750 = _746 || _748;
    float _752 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _728);
    bool _754 = !_706;
    int _756 = _754 ? 0 : 1;
    float _758 = _738 * _734;
    float _760 = _534 + (-0.5);
    int _762 = ~_720;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = _758 * (-2.0);
    int _770 = _766;
    if (!_622)
    {
        int _772 = ~_720;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    int _778 = abs(_756);
    float _780 = fma(_768, _690, _690);
    bool _782 = !_710;
    int _784 = _782 ? 0 : 1;
    if (_750)
    {
        float _786 = _696 * _736;
        _126 = _786;
    }
    float _788 = _126;
    int _790 = _666 ? 0 : 1;
    float _792 = fma(_588, _768, _588);
    float _794 = float(_776);
    float _796 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].x, _780);
    float _798 = float(_778);
    int _800 = abs(_784);
    float _802 = fma(_792, _788, _796);
    int _804 = ~_790;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = _798 * _794;
    int _812 = _808;
    if (!_656)
    {
        int _814 = ~_790;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = _536 + _526;
    float _822 = _810 * (-2.0);
    float _824 = _820 + (-1.0);
    float _826 = float(_818);
    float _828 = fma(_822, _692, _692);
    float _830 = float(_800);
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _834 = _526 + _534;
    float _836 = _802 * 0.15915493667125701904296875;
    float _838 = _526 + (-0.5);
    float _840 = _830 * _826;
    float _842 = _536 + (-0.5);
    float _844 = fma(_832, _822, _832);
    float _846 = _834 + (-1.0);
    float _848 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _850 = _840 * (-2.0);
    float _852 = _836 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _858 = fma(_844, _788, _848);
    float _860 = fma(_850, _694, _694);
    float _862 = in.m_65.x;
    float _864 = in.m_65.y;
    float _866 = in.m_65.z;
    float _868 = fma(_856, _850, _856);
    float _870 = _858 * 0.15915493667125701904296875;
    float _872 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].z, _860);
    float _874 = _836 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(_868, _788, _872);
    float _880 = _878 * 0.15915493667125701904296875;
    float _882 = _870 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = in.m_46.x;
    float _888 = in.m_46.y;
    float _890 = in.m_46.z;
    float _892 = _870 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _862);
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _864);
    float _900 = _880 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _866);
    float _906 = _532 * _896;
    float _908 = _538 * _898;
    float _910 = _854 * _884;
    float _912 = _876 * _884;
    float _914 = _540 * _904;
    float _916 = _880 * 6.283185482025146484375;
    float _918 = sin(_916);
    float _920 = _854 * _894;
    float _922 = _876 * _894;
    float _924 = _854 * _902;
    float _926 = _876 * _902;
    float _928 = _894 * _902;
    float _930 = _884 * _902;
    float _932 = _924 * _908;
    float _934 = _926 * _908;
    float _936 = fma(_918, _920, _912);
    float _938 = -_910;
    float _940 = fma(_918, _922, _938);
    float _942 = -_922;
    float _944 = fma(_918, _910, _942);
    float _946 = -_908;
    float _948 = _918 * _946;
    float _950 = fma(_936, _906, _932);
    float _952 = fma(_918, _912, _920);
    float _954 = fma(_940, _906, _934);
    float _956 = fma(_928, _906, _948);
    float _958 = fma(_944, _914, _950);
    float _960 = _888 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _962 = _888 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _964 = fma(_930, _914, _956);
    float _966 = _958 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _968 = _958 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = fma(_952, _914, _954);
    float _972 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[6].x, _960);
    float _974 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _966);
    float _976 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[4].x, _962);
    float _978 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _980 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[6].z, _972);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[26].z, _974);
    float _984 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[4].z, _976);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _990 = _982 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _994 = _986 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _888 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _998 = _988 + _990;
    float _1000 = _958 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = _992 + _994;
    float _1004 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[5].x, _996);
    float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1008 = _998 + _1006;
    float _1010 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1002 + _1012;
    float _1016 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1004);
    float _1018 = _1008 * _1008;
    float _1020 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1022 = _1016 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1024 = fma(_1014, _1014, _1018);
    float _1026 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1030 = sqrt(_1024);
    float _1032 = _1022 + _1026;
    float _1034 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1028);
    float _1036 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1034);
    bool _1038 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1026;
    float _1042 = _1004;
    float _1044 = _1034;
    if (!_1038)
    {
        _1040 = _1002;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    if (!_1038)
    {
        _1042 = _998;
    }
    float _1050 = _1042;
    float _1052 = _1050;
    if (!_1038)
    {
        _1044 = _1032;
    }
    float _1054 = _1044;
    bool _1056 = !_1038;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _1030 + _1062;
        float _1066 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = rsqrt(_1024);
        float _1070 = _1064 * _1060;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1032, _1076, _1084);
        float _1090 = _1068 * _1086;
        float _1092 = fma(_1014, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_1008, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1058 = _1088;
        _1048 = _1092;
        _1052 = _1094;
    }
    float _1096 = _1058;
    float _1098 = _1048;
    float _1100 = _1052;
    float _1102 = -_1022;
    float _1104 = _1102 + _1096;
    float _1106 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1108 = -_992;
    float _1110 = _1108 + _1098;
    float _1112 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1114 = _1104 * _1104;
    float _1116 = -_988;
    float _1118 = _1116 + _1100;
    float _1120 = 1.0 / _1106;
    float _1122 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1112);
    float _1124 = fma(_1110, _1110, _1114);
    float _1126 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1122);
    float _1128 = fma(_1118, _1118, _1124);
    bool _1130 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1132 = isnan(0.5);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1138 = _1134 || _1136;
    float _1140 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1142 = sqrt(_1128);
    bool _1144 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1146 = isnan(0.5);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1152 = _1148 || _1150;
    float _1154 = _1140 + _1106;
    float _1156 = _1154 * _1120;
    float _1158 = _1156 * 0.5;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1162 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1160);
    float _1164 = 1.0 / _1162;
    bool _1166 = _1142 > 0.0;
    bool _1168 = !_1166;
    float _1170 = _1098;
    float _1172 = _1096;
    float _1174 = _1100;
    float _1176 = _1104;
    float _1178 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1180 = _1162;
    float _1182 = _1118;
    float _1184 = _1110;
    float _1186 = _1142;
    float _1188 = _1106;
    float _1190 = _1128;
    if (!_1168)
    {
        float _1192 = _188 * _188;
        float _1194 = fma(_186, _186, _1192);
        float _1196 = fma(_190, _190, _1194);
        float _1198 = rsqrt(_1128);
        float _1200 = sqrt(_1196);
        float _1202 = _1110 * _1198;
        float _1204 = _1104 * _1198;
        float _1206 = _1118 * _1198;
        bool _1208 = _1200 > 0.0;
        bool _1210 = !_1208;
        _1178 = _1198;
        _1180 = _1200;
        _1186 = _1196;
        _1188 = _1204;
        if (!_1210)
        {
            float _1212 = rsqrt(_1196);
            float _1214 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1216 = _188 * _1212;
            float _1218 = _186 * _1212;
            float _1220 = _190 * _1212;
            float _1222 = _1204 * _1216;
            float _1224 = fma(_1202, _1218, _1222);
            float _1226 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1228 = fma(_1206, _1220, _1224);
            float _1230 = _1228 * _1226;
            float _1232 = fma(_186, _1230, _1098);
            float _1234 = fma(_188, _1230, _1096);
            float _1236 = fma(_190, _1230, _1100);
            _1170 = _1232;
            _1172 = _1234;
            _1174 = _1236;
            _1176 = _1230;
            _1178 = _1226;
            _1180 = _1214;
            _1182 = _1220;
            _1184 = _1216;
        }
    }
    float _1238 = _1170;
    float _1240 = _1172;
    float _1242 = _1174;
    float _1244 = _1176;
    float _1246 = _1178;
    float _1248 = _1180;
    float _1250 = _1182;
    float _1252 = _1184;
    float _1254 = _1186;
    float _1256 = _1188;
    float _1258 = _1254;
    float _1260 = _1248;
    float _1262 = _1246;
    float _1264 = _1250;
    float _1266 = _1244;
    float _1268 = _1256;
    float _1270 = _1252;
    if (_1152)
    {
        _1258 = 1.0;
    }
    float _1272 = _1258;
    float _1274 = _1272;
    if (_1138)
    {
        _1260 = _1238;
    }
    float _1276 = _1260;
    float _1278 = _1276;
    if (_1138)
    {
        _1262 = _1240;
    }
    float _1280 = _1262;
    float _1282 = _1280;
    if (_1138)
    {
        _1190 = _1242;
    }
    float _1284 = _1190;
    float _1286 = _1284;
    if (!_1138)
    {
        float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1290 = _1022 + _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1294 = _992 + _1292;
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1298 = -_1022;
        float _1300 = _1298 + _1240;
        float _1302 = _1290 * _1290;
        float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1306 = _988 + _1304;
        float _1308 = -_992;
        float _1310 = _1308 + _1238;
        float _1312 = -_988;
        float _1314 = _1312 + _1242;
        float _1316 = fma(_1294, _1294, _1302);
        float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1320 = fma(_1306, _1306, _1316);
        float _1322 = sqrt(_1320);
        float _1324 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1326 = precise::min(_1322, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1328 = _1326 * _1318;
        float _1330 = _1324 * _1328;
        float _1332 = fma(_1300, _1330, _1022);
        float _1334 = fma(_1310, _1330, _992);
        float _1336 = fma(_1314, _1330, _988);
        _196 = _1328;
        _1282 = _1332;
        _1278 = _1334;
        _1286 = _1336;
        _1264 = _1318;
        _1266 = _1296;
    }
    float _1338 = _196;
    float _1340 = _1282;
    float _1342 = _1278;
    float _1344 = _1286;
    float _1346 = _1264;
    float _1348 = _1266;
    float _1350 = _1338;
    float _1352 = _1348;
    if (_1152)
    {
        _1268 = 1.0;
    }
    float _1354 = _1268;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1358 = _1164 * _1356;
    float _1360 = _1354;
    if (!_1152)
    {
        float _1362 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1364 = _1362 * 0.15915493667125701904296875;
        float _1366 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1368 = _1364 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 0.15915493667125701904296875;
        float _1374 = _1364 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        float _1378 = 1.0 / _1370;
        float _1380 = _1372 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = _1376 * _1378;
        float _1386 = _1372 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1382 * _1384;
        float _1392 = 1.0 / _1390;
        float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1394;
        float _1398 = 1.0 / _1396;
        float _1400 = _1388 * _1392;
        float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1404 = fma(_1358, _1400, _1402);
        float _1406 = _1404 * _1398;
        float _1408 = precise::clamp(_1406, 0.0, 1.0);
        _1350 = _1372;
        _1352 = _1364;
        _1274 = _1408;
    }
    float _1410 = _1350;
    float _1412 = _1352;
    float _1414 = _1274;
    float _1416 = _1412;
    float _1418 = _1410;
    if (!_1152)
    {
        float _1420 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = _1420 * 0.15915493667125701904296875;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 0.15915493667125701904296875;
        float _1432 = _1422 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = 1.0 / _1428;
        float _1438 = _1430 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = _1434 * _1436;
        float _1444 = _1430 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = _1440 * _1442;
        float _1450 = 1.0 / _1448;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1454 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1452;
        float _1456 = 1.0 / _1454;
        float _1458 = _1446 * _1450;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1462 = fma(_1358, _1458, _1460);
        float _1464 = _1462 * _1456;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        float _1468 = -_1466;
        float _1470 = _1468 + 1.0;
        _1416 = _1448;
        _1418 = _1436;
        _1360 = _1470;
    }
    float _1472 = _1416;
    float _1474 = _1418;
    float _1476 = _1360;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1480 = _1340 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1484 = _1342 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1488 = _1344 + _1486;
    float _1490 = _1480 * _1480;
    float _1492 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1494 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1496 = fma(_1484, _1484, _1490);
    float _1498 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1492);
    float _1500 = fma(_1488, _1488, _1496);
    float _1502 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1498);
    float _1504 = rsqrt(_1500);
    float _1506 = sqrt(_1500);
    float _1508 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1510 = _1484 * _1508;
    float _1512 = _1488 * _1508;
    float _1514 = _1510 * _1510;
    float _1516 = _1512 * _1512;
    float _1518 = _1514 + _1516;
    float _1520 = sqrt(_1518);
    bool _1522 = _1520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1526 = _1520 + _1524;
    float _1528 = _1346;
    float _1530 = _1526;
    float _1532 = _1510;
    float _1534 = _1512;
    float _1536 = _1514;
    float _1538 = _1516;
    if (_1522)
    {
        float _1540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1528 = _1540;
    }
    float _1542 = _1528;
    if (_1522)
    {
        float _1544 = _1526 * _1542;
        _1530 = _1544;
    }
    float _1546 = _1530;
    if (_1522)
    {
        float _1548 = _1546 * 0.15915493667125701904296875;
        _1270 = _1548;
    }
    float _1550 = _1270;
    float _1552 = _1472;
    float _1554 = _1550;
    if (_1522)
    {
        float _1556 = _1550 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1552 = _1558;
    }
    float _1560 = _1552;
    float _1562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1564 = precise::max(0.0, _1562);
    float _1566 = _1474;
    float _1568 = _1564;
    if (_1522)
    {
        float _1570 = _1550 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        _1566 = _1572;
    }
    float _1574 = _1566;
    float _1576 = -_1508;
    float _1578 = -_1564;
    float _1580 = fma(_1480, _1576, _1578);
    float _1582 = _1562;
    if (_1522)
    {
        float _1584 = rsqrt(_1518);
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (_1522)
    {
        float _1588 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1588;
    }
    float _1590 = _1568;
    float _1592 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1594 = _1590;
    float _1596 = _1560;
    if (_1522)
    {
        float _1598 = fma(_1560, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1594 = _1598;
    }
    float _1600 = _1594;
    float _1602 = _1600;
    if (_1522)
    {
        float _1604 = _1574 + (-1.0);
        _1596 = _1604;
    }
    float _1606 = _1596;
    float _1608 = floor(_1592);
    float _1610 = _1586;
    if (_1522)
    {
        float _1612 = _1586 * _1600;
        _1554 = _1612;
    }
    float _1614 = _1554;
    if (_1522)
    {
        float _1616 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1602 = _1616;
    }
    float _1618 = _1602;
    if (!_1522)
    {
        _1610 = _1580;
    }
    float _1620 = _1610;
    float _1622 = _1620;
    if (_1522)
    {
        float _1624 = _1510 * _1614;
        _1532 = _1624;
    }
    float _1626 = _1532;
    if (_1522)
    {
        float _1628 = fma(_1580, _1574, _1618);
        _1622 = _1628;
    }
    float _1630 = _1622;
    if (_1522)
    {
        float _1632 = _1512 * _1614;
        _1534 = _1632;
    }
    float _1634 = _1534;
    if (_1522)
    {
        float _1636 = _1626 * _1626;
        _1536 = _1636;
    }
    float _1638 = _1536;
    float _1640 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1522)
    {
        float _1642 = _1634 * _1634;
        _1538 = _1642;
    }
    float _1644 = _1538;
    float _1646 = fma(_1630, _1630, _1638);
    float _1648 = fma(_988, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1650 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1652 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1640);
    float _1654 = _1646 + _1644;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1658 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1650);
    float _1660 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1652);
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1664 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1662);
    float _1666 = precise::clamp(_1664, 0.0, 1.0);
    float _1668 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1494);
    float _1670 = rsqrt(_1654);
    float _1672 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1658);
    float _1674 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1676 = -_1666;
    float _1678 = _1676 + 1.0;
    float _1680 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1684 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1686 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1668);
    float _1688 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1690 = abs(_1678);
    float _1692 = log2(_1690);
    float _1694 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1684);
    float _1696 = -_1688;
    float _1698 = fma(_1696, _1656, 1.0);
    float _1700 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1694);
    float _1704 = _1670 * _1626;
    float _1706 = _1670 * _1630;
    float _1708 = _1670 * _1634;
    float _1710 = floor(_1648);
    float _1712 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1714 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1702);
    float _1716 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = -_1712;
    float _1720 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1718);
    float _1722 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1724 = log2(_1698);
    float _1726 = -_1708;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1720);
    float _1730 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1732 = 1.0 / _1714;
    float _1734 = -_1608;
    float _1736 = _1592 + _1734;
    float _1738 = fma(_1728, -0.5, 0.5);
    float _1740 = fma(_1728, 0.5, 0.5);
    float _1742 = -_1710;
    float _1744 = _1648 + _1742;
    float _1746 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1730);
    float _1748 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1750 = _1706 + 1.0;
    float _1752 = exp2(_1722);
    float _1754 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1746);
    float _1756 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1748);
    float _1758 = _1724 * 0.693147182464599609375;
    float _1760 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1754);
    float _1762 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1756);
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1766 = sqrt(_1738);
    float _1768 = fma(_1740, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1770 = fma(_1740, _1768, -0.212114393711090087890625);
    float _1772 = -_1706;
    float _1774 = fma(_1752, _1750, _1772);
    float _1776 = fma(_1740, _1770, 1.570728778839111328125);
    float _1778 = _1760 * _1732;
    float _1780 = _1762 * _1732;
    float _1782 = fma(_1774, 0.5, 0.5);
    float _1784 = fma(_1778, 0.5, 0.5);
    float _1786 = fma(_1780, -0.5, 0.5);
    float _1788 = _1766 * 0.636619746685028076171875;
    float2 _5731 = float2(_1736, _1744);
    float _1790 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5731, float2(0.0), isnan(_5731)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5731, float2(0.0), isnan(_5731)), level(0.0)).x;
    float _1792 = -_1776;
    float _1794 = fma(_1788, _1792, 1.0);
    float3 _5747 = float3(_1784, _1786, _1764);
    float _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5747, float3(0.0), isnan(_5747)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5747, float3(0.0), isnan(_5747)), level(0.0)).x;
    float3 _5758 = float3(_1784, _1786, _1764);
    float4 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5758, float3(0.0), isnan(_5758)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5758, float3(0.0), isnan(_5758)), level(0.0)).xyzw;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = _1799.w;
    float2 _5774 = float2(_1794, _1782);
    float3 _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5774, float2(0.0), isnan(_5774)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5774, float2(0.0), isnan(_5774)), level(0.0)).xyz;
    float _1813 = _1811.x;
    float _1815 = _1811.y;
    float _1817 = _1811.z;
    float _1819 = float(uint(_554));
    float _1821 = trunc(_674);
    int _1823 = int(_1821);
    bool _1825 = _554 == 0;
    float _1827 = _606 * _168;
    int _1829 = ~_554;
    int _1831 = _1829 + 1;
    float _1833 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1835 = _554 + (-1);
    int _1837 = abs(_628);
    float _1839 = 1.0 / _1819;
    int _1841 = abs(_634);
    int _1843 = abs(_688);
    float _1845 = float(uint(_1823));
    float _1847 = exp2(_1833);
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1851 = _1849 != 0;
    int _1853 = as_type<int>(_1839) + (-2);
    bool _1855 = !_1851;
    float _1857 = _1855 ? 7.345489978790283203125 : 1.0;
    int _1859 = ~_554;
    int _1861 = _1859 + 1;
    float _1863 = as_type<float>(_1853) * _1845;
    float _1865 = _1857 * _534;
    float _1867 = -_1847;
    float _1869 = _1867 + 1.0;
    float _1871 = trunc(_1863);
    float _1873 = precise::max(_1871, 0.0);
    uint _1876 = uint(_1873);
    float _1878 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1880 = floor(_1865);
    int _1882 = _1831 * int(_1876);
    int _1884 = _1882 + _1823;
    float _1886 = float(uint(_1884));
    float _1888 = -_1880;
    float _1890 = _1865 + _1888;
    float _1892 = as_type<float>(_1853) * _1886;
    float _1894 = float(_1823);
    float _1896 = _1890 * _590;
    float _1898 = trunc(_1892);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    float _1904 = trunc(_1896);
    int _1906 = int(_1904);
    int _1908 = int(_1876) + int(_1902);
    bool _1910 = _1894 >= _590;
    bool _1912 = isnan(_1894);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(_590);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    int _1922 = _1861 * _1908;
    int _1924 = _1922 + _1823;
    float _1926 = trunc(_1827);
    int _1928 = int(_1926);
    int _1930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1932 = _1930 != 0;
    bool _1934 = uint(_1924) >= uint(_554);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1938 = _1936 != 0;
    float _1940 = trunc(_1920);
    int _1942 = int(_1940);
    bool _1944 = !_1934;
    int _1946 = _1944 ? 0 : (-1);
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1950 = _1948 != 0;
    int _1952 = ~_1908;
    int _1954 = _1952 + _1946;
    int _1956 = _1954 + 1;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1960 = _1958 != 0;
    int _1962 = _554 * _1956;
    int _1964 = _1962 + _1823;
    bool _1966 = !_1950;
    int _1968 = _1966 ? 0 : 1;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1972 = _1970 != 0;
    bool _1974 = !_1825;
    int _1976 = _1974 ? _1964 : (-1);
    int _1978 = ~_1942;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = abs(_1968);
    int _1986 = _1976 * _1982;
    float _1988 = in.m_67.y;
    int _1990 = _1942 * _1835;
    int _1992 = _1990 + _1986;
    int _1994 = _1992 * _1837;
    int _1996 = _1906 * _1984;
    int _1998 = _1996 + _1823;
    int _2000 = _1928 * _1841;
    int _2002 = _2000 + _1994;
    bool _2004 = !_1972;
    int _2006 = _2004 ? 0 : 1;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2010 = _2008 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2016 = abs(_2006);
    float _2018 = 1.0 / _2010;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2024 = as_type<float>(_2016);
    float _2026 = _1714;
    float _2028 = _1762;
    if (_1932)
    {
        float _2030 = in.m_57.x;
        _2024 = _2030;
    }
    float _2032 = _2024;
    int _2034 = _1998 * _1843;
    int _2036 = _2034 + _2002;
    bool _2038 = _536 > 0.5;
    int _2040 = _1906 * _2016;
    int _2042 = _2040 + _2036;
    float _2044 = 1.0 / _2014;
    float _2046 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2046;
    float _2050 = -_1988;
    float _2052 = _2050 + 1.0;
    float _2054 = float(uint(_2042));
    int _2056 = ~_554;
    int _2058 = _2056 + 1;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2060 = 1.0 / _2022;
    float _2062 = as_type<float>(_1853) * _2054;
    float _2064 = _1988;
    if (_1938)
    {
        float _2066 = _2038 ? _2052 : _1988;
        _2064 = _2066;
    }
    float _2068 = _2064;
    float _2070 = in.m_67.x;
    bool _2072 = _864 != 0.0;
    bool _2074 = isnan(_864);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = trunc(_2062);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    bool _2088 = _2032 > 0.5;
    bool _2090 = _2088 && _1932;
    float _2092 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2094 = _2092 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2096 = _2048 * _2044;
    bool _2098 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2100 = isnan(_524);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_2106);
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2110;
    float _2114 = _2094 * _2018;
    bool _2116 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2118 = isnan(_524);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2130 = _524 + _2128;
    float _2132 = -_2108;
    float _2134 = _2132 + 1.0;
    bool _2136 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2138 = isnan(_524);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2144 = _2140 || _2142;
    float _2146 = float(_2144);
    float _2148 = _2112 * _2060;
    bool _2150 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2152 = isnan(_524);
    bool _2154 = _2150 || _2152;
    bool _2156 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2158 = _2154 || _2156;
    float _2160 = float(_2158);
    float _2162 = _2126 * _2134;
    float _2164 = -_2126;
    float _2166 = _2164 + 1.0;
    int _2168 = _2058 * int(_2086);
    int _2170 = _2168 + _2042;
    float _2172 = fma(_2096, _2130, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2174 = _862 == 0.0;
    bool _2176 = !_2080;
    bool _2178 = _2174 && _2176;
    float _2180 = _2146 * _2166;
    float _2182 = -_2146;
    float _2184 = _2182 + 1.0;
    float _2186 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2188 = float(uint(_2170));
    float _2190 = _2160 * _2184;
    float _2192 = -_592;
    float _2194 = fma(_740, _2186, _2192);
    float _2196 = _2070;
    if (_1932)
    {
        _678 = _2070;
    }
    float _2198 = _678;
    float _2200 = in.m_71.x;
    float _2202 = in.m_71.y;
    float _2204 = in.m_71.z;
    float _2206 = as_type<float>(_1853) * _2188;
    float _2208 = _2172 * _2190;
    float _2210 = float(uint(_1998));
    float _2212 = _2198;
    if (_2090)
    {
        float _2214 = -_2198;
        float _2216 = _2214 + 1.0;
        _2212 = _2216;
    }
    float _2218 = _2212;
    bool _2220 = _866 == 0.0;
    bool _2222 = _2220 && _2178;
    float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2226 = _524 + _2224;
    float _2228 = trunc(_2206);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    float _2234 = as_type<float>(_1853) * _2210;
    float _2236 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2238 = _524 + _2236;
    if (_1932)
    {
        _2196 = _2218;
    }
    float _2240 = _2196;
    float _2242 = -_2160;
    float _2244 = _2242 + 1.0;
    int _2246 = ~_554;
    int _2248 = _2246 + 1;
    float _2250 = fma(_2114, _2226, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2252 = fma(_2148, _2238, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2254 = trunc(_2234);
    float _2256 = precise::max(_2254, 0.0);
    uint _2258 = uint(_2256);
    float _2260 = fma(_2244, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2208);
    int _2262 = ~_554;
    int _2264 = _2262 + 1;
    float _2266 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2268 = _944 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2270 = fma(_2250, _2180, _2260);
    float _2272 = _944 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2274 = int(_2086) + int(_2232);
    float _2276 = _2202;
    float _2278 = _2200;
    float _2280 = _2204;
    if (!_2222)
    {
        float _2282 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2202);
        _2276 = _2282;
    }
    float _2284 = _2276;
    if (!_2222)
    {
        float _2286 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2200);
        _2278 = _2286;
    }
    float _2288 = _2278;
    if (!_2222)
    {
        float _2290 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2204);
        _2280 = _2290;
    }
    float _2292 = _2280;
    float _2294 = fma(_2252, _2162, _2270);
    float _2296 = fma(_752, _2266, _732);
    int _2298 = _2248 * _2274;
    int _2300 = _2298 + _2042;
    float _2302 = abs(_1358);
    float _2304 = log2(_2302);
    int _2306 = _2264 * int(_2258);
    int _2308 = _2306 + _1998;
    float _2310 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2294);
    bool _2312 = uint(_2300) >= uint(_554);
    float _2314 = _2296 + 0.5;
    float _2316 = float(uint(_2308));
    float _2318 = _2310 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2320 = !_2312;
    int _2322 = _2320 ? 0 : (-1);
    float _2324 = _924 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2326 = as_type<float>(_1853) * _2316;
    int _2328 = ~_2274;
    int _2330 = _2328 + _2322;
    int _2332 = _2330 + 1;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2336 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2338 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2340 = _554 * _2332;
    int _2342 = _2340 + _2042;
    float _2344 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2348 = _2194 + 0.5;
    float _2350 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2352 = !_1825;
    int _2354 = _2352 ? _2342 : (-1);
    float _2356 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2358 = exp2(_2338);
    out.m_73.x = _2314;
    out.m_73.y = _2348;
    float _2360 = _924 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2362 = _924 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2344;
    out.m_75.y = _2356;
    out.m_75.z = _2350;
    out.m_75.w = _2318;
    float _2364 = _944 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2366 = ~_554;
    int _2368 = _2366 + 1;
    float _2370 = trunc(_2326);
    float _2372 = precise::max(_2370, 0.0);
    uint _2374 = uint(_2372);
    float _2376 = -_918;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2324);
    float _2380 = _936 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2382 = _2354 >> 31;
    float _2384 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2386 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2268);
    float _2388 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2364);
    int _2390 = _2354 & 3;
    bool _2392 = _2390 != 0;
    float _2394 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2380);
    int _2396 = _2354 & 3;
    bool _2398 = _2396 != 0;
    int _2400 = _2382 & 3;
    float _2402 = -_918;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2360);
    float _2406 = -_918;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2362);
    float _2410 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    int _2414 = _2354 + _2400;
    float _2416 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2404);
    float _2418 = _936 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2420 = _936 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2422 = _2414 >> 2;
    float _2424 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2378);
    float _2426 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2418);
    int _2428 = int(_2258) + int(_2374);
    float _2430 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2408);
    int _2432 = _2422 << 4;
    int _2434 = _2432 + 368;
    float _2436 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2420);
    bool _2438 = uint(_2390) > 1u;
    int _2440 = _2368 * _2428;
    int _2442 = _2440 + _1998;
    uint _2444 = uint(int(uint(_2434) >> uint(2)));
    uint _2446 = uint(int(uint(int(_2444)) >> uint(2)));
    int _2448 = int(_2444) & 3;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[int(_2446)][_2448];
    int _2452 = int(_2444) + 1;
    uint _2454 = uint(int(uint(_2452) >> uint(2)));
    int _2456 = _2452 & 3;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[int(_2454)][_2456];
    float _2460 = _2424 * _2284;
    float _2462 = _2416 * _2284;
    float _2464 = _2430 * _2284;
    float _2466 = _2412 * _2412;
    float _2468 = fma(_2412, -2.0, 3.0);
    bool _2470 = uint(_2442) >= uint(_554);
    int _2472 = _2434 + 8;
    uint _2474 = uint(int(uint(_2472) >> uint(2)));
    uint _2476 = uint(int(uint(int(_2474)) >> uint(2)));
    int _2478 = int(_2474) & 3;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[int(_2476)][_2478];
    int _2482 = int(_2474) + 1;
    uint _2484 = uint(int(uint(_2482) >> uint(2)));
    int _2486 = _2482 & 3;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[int(_2484)][_2486];
    int _2490 = _2398 ? 0 : 1;
    float _2492 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2426);
    bool _2494 = _2390 != 3;
    float _2496 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2394);
    bool _2498 = !_2470;
    int _2500 = _2498 ? 0 : (-1);
    float _2502 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2436);
    bool _2504 = uint(_2390) >= 2u;
    float _2506 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2386);
    int _2508 = ~_2490;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = fma(_2496, _2288, _2462);
    int _2516 = _2512;
    if (!_2438)
    {
        int _2518 = ~_2490;
        int _2520 = _2518 + 1;
        _2516 = _2520;
    }
    int _2522 = _2516;
    float _2524 = fma(_2492, _2288, _2460);
    int _2526 = _2504 ? 0 : 1;
    float _2528 = _2466 * _2468;
    bool _2530 = !_2392;
    int _2532 = _2530 ? 0 : 1;
    float _2534 = fma(_2502, _2288, _2464);
    int _2536 = abs(_2522);
    float _2538 = fma(_2506, _2292, _2514);
    int _2540 = ~_2526;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    float _2546 = in.m_77.x;
    bool _2548 = _2390 != 3;
    float _2550 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2384);
    int _2552 = abs(_2532);
    float _2554 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2388);
    int _2556 = _2544;
    if (_2494)
    {
        int _2558 = ~_2526;
        int _2560 = _2558 + 1;
        _2556 = _2560;
    }
    int _2562 = _2556;
    float _2564 = fma(_2550, _2292, _2524);
    float _2566 = fma(_2554, _2292, _2534);
    bool _2568 = !_2548;
    int _2570 = _2568 ? 0 : (-1);
    float _2572 = -_1790;
    float _2574 = _2572 + 1.0;
    int _2576 = abs(_2562);
    float _2578 = _1878 * _1796;
    int _2580 = ~_2536;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    out.m_79.x = _2564;
    out.m_79.y = _2538;
    out.m_79.z = _2566;
    int _2586 = abs(_2570);
    bool _2588 = !_1960;
    int _2590 = _2588 ? 0 : 1;
    int _2592 = ~_2552;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = _2584 * as_type<int>(_2458);
    int _2600 = abs(_2590);
    int _2602 = _2596 * as_type<int>(_2450);
    int _2604 = _2602 + _2598;
    int _2606 = ~_2576;
    int _2608 = _2606 + 1;
    int _2610 = _2608 + 1;
    int _2612 = ~_2586;
    int _2614 = _2612 + 1;
    int _2616 = _2614 + 1;
    float _2618 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2620 = ~_2428;
    int _2622 = _2620 + _2500;
    int _2624 = _2622 + 1;
    int _2626 = _2610 * as_type<int>(_2480);
    int _2628 = _2626 + _2604;
    bool _2630 = _1358 <= 8000.0;
    bool _2632 = isnan(_1358);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan(8000.0);
    bool _2638 = _2634 || _2636;
    float _2640 = float(_2638);
    float _2642 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2618);
    int _2644 = _2616 * as_type<int>(_2488);
    int _2646 = _2644 + _2628;
    float _2648 = -_2528;
    float _2650 = _2648 + 1.0;
    int _2652 = _554 * _2624;
    int _2654 = _2652 + _1998;
    int _2656 = ~_2600;
    int _2658 = _2656 + 1;
    int _2660 = _2658 + 1;
    float _2662 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2642);
    float _2664 = fma(_2650, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2528);
    float _2666 = _1817 * _2578;
    bool _2668 = !_1825;
    int _2670 = _2668 ? _2654 : (-1);
    float _2672 = _2640 * _2664;
    int _2674 = _2646 * _2660;
    float _2676 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2662);
    float _2678 = fma(_1807, _2666, _1805);
    float _2680 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2682 = _2670 * _2600;
    int _2684 = _2682 + _2674;
    float _2686 = _1807 * _2578;
    out.gl_Position.x = _1760;
    out.gl_Position.y = _1762;
    out.gl_Position.z = _2676;
    out.gl_Position.w = _1714;
    float _2688 = _2574 * _2680;
    float _2690 = precise::clamp(_2688, 0.0, 1.0);
    bool _2692 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2694 = isnan(_1506);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2700 = _2696 || _2698;
    float _2702 = fma(_1813, _2686, _1801);
    float _2704 = float(_2684);
    float _2706 = -_2690;
    float _2708 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2710 = _1760 + _1714;
    float _2712 = fma(_1815, _2686, _1803);
    float _2714 = _2676 + _1714;
    float _2716 = _2708 * _2546;
    out.m_81.x = _2704;
    float _2718 = _1714 * 0.5;
    float _2720 = _2716 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2722 = -_1878;
    float _2724 = _2722 + 1.0;
    float _2726 = _2714 * 0.5;
    float _2728 = _2710 * 0.5;
    float _2730 = fma(_1762, -0.5, _2718);
    float _2732 = _1807 * _2724;
    out.m_83.x = _2720;
    float _2734 = _1414 * _1476;
    float _2736 = _2676;
    float _2738 = _2734;
    float _2740 = _2730;
    float _2742 = _2728;
    if (!_2700)
    {
        _2026 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2744 = _2026;
    out.m_85.x = _2702;
    out.m_85.y = _2712;
    out.m_85.z = _2678;
    out.m_85.w = _2732;
    float _2746 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2748 = _2744;
    float _2750 = _2744;
    if (!_2700)
    {
        _2736 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2752 = _2736;
    out.m_87.x = _2728;
    out.m_87.y = _2730;
    out.m_87.z = _2726;
    out.m_87.w = _1714;
    float _2754 = _2752;
    float _2756 = _2752;
    if (!_2700)
    {
        _2028 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2758 = _2028;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2700)
    {
        _2738 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2764 = _2738;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2700)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2770 = _2740;
    float _2772 = _2770;
    float _2774 = _2770;
    if (!_2700)
    {
        _2742 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2776 = _2742;
    bool _2778 = !_2700;
    float _2780 = _2776;
    float _2782 = _2776;
    if (!_2778)
    {
        bool _2784 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2786 = isnan(_1506);
        bool _2788 = _2784 || _2786;
        bool _2790 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2792 = _2788 || _2790;
        if (!_2792)
        {
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2796 = _1506 + _2794;
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2800 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2798;
            float _2802 = 1.0 / _2800;
            float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2824 = _2796 * _2802;
            float _2826 = precise::clamp(_2824, 0.0, 1.0);
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2832 = fma(_2826, _2806, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2834 = fma(_2826, _2830, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2836 = fma(_2826, _2810, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2838 = fma(_2826, _2814, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2840 = fma(_2826, _2818, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2842 = fma(_2826, _2822, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2782 = _2834;
            _2762 = _2840;
            _2774 = _2832;
            _2756 = _2838;
            _2750 = _2836;
            _2768 = _2842;
            _2844 = true;
        }
        else
        {
            bool _2846 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2848 = isnan(_1506);
            bool _2850 = _2846 || _2848;
            bool _2852 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2854 = _2850 || _2852;
            if (!_2854)
            {
                _2772 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2856 = _2772;
            _2774 = _2856;
            if (!_2854)
            {
                _2780 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2858 = _2780;
            _2782 = _2858;
            if (!_2854)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2860 = _2748;
            _2750 = _2860;
            if (!_2854)
            {
                _2754 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2862 = _2754;
            _2756 = _2862;
            if (!_2854)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2864 = _2760;
            _2762 = _2864;
            if (!_2854)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2866 = _2766;
            bool _2868 = !_2854;
            _2768 = _2866;
            if (!_2868)
            {
                bool _2870 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2872 = isnan(_1506);
                bool _2874 = _2870 || _2872;
                bool _2876 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2878 = _2874 || _2876;
                if (!_2878)
                {
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2882 = _1506 + _2880;
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2886 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2884;
                    float _2888 = 1.0 / _2886;
                    float _2890 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2892 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2896 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2900 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2910 = _2882 * _2888;
                    float _2912 = precise::clamp(_2910, 0.0, 1.0);
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2918 = fma(_2912, _2892, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2920 = fma(_2912, _2916, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2922 = fma(_2912, _2896, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2924 = fma(_2912, _2900, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2926 = fma(_2912, _2904, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2928 = fma(_2912, _2908, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2782 = _2920;
                    _2762 = _2926;
                    _2774 = _2918;
                    _2756 = _2924;
                    _2750 = _2922;
                    _2768 = _2928;
                    _2844 = true;
                }
                else
                {
                    _2782 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2774 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2756 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2844 = false;
    float _2930 = _2782;
    float _2932 = _2762;
    float _2934 = _2774;
    float _2936 = _2756;
    float _2938 = _2750;
    float _2940 = _2768;
    float _2942 = fma(_2538, -0.5, 0.5);
    float _2944 = precise::clamp(_2942, 0.0, 1.0);
    float _2946 = -_2930;
    float _2948 = _2946 + _2932;
    float _2950 = _2746 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2952 = -_2934;
    float _2954 = _2952 + _2936;
    float _2956 = fma(_2944, _2948, _2930);
    out.m_89.x = 0.0;
    float _2958 = -_2938;
    float _2960 = _2958 + _2940;
    float _2962 = fma(_2944, _2954, _2934);
    float _2964 = _2956 * 0.586610972881317138671875;
    out.m_53.x = _2950;
    bool _2966 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2968 = fma(_2944, _2960, _2938);
    float _2970 = fma(_2962, 0.298911988735198974609375, _2964);
    bool _2972 = _1414 > 0.0;
    bool _2974 = isnan(_1414);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan(0.0);
    bool _2980 = _2976 || _2978;
    float _2982 = fma(_2968, 0.114477999508380889892578125, _2970);
    bool _2984 = _1476 <= 0.0;
    bool _2986 = !_2980;
    bool _2988 = _2984 || _2986;
    float _2990 = -_2982;
    float _2992 = _2962 + _2990;
    float _2994 = -_2982;
    float _2996 = _2956 + _2994;
    float _2998 = -_2982;
    float _3000 = _2968 + _2998;
    float _3002 = fma(_2992, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3004 = fma(_2996, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3006 = fma(_3000, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    bool _3008 = !_2966;
    if (!_3008)
    {
        float _3010 = -_1340;
        float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3014 = -_1342;
        float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3018 = -_1344;
        float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3022 = _3012 * _3012;
        float _3024 = fma(_3016, _3016, _3022);
        float _3026 = fma(_3020, _3020, _3024);
        float _3028 = sqrt(_3026);
        float _3030 = rsqrt(_3026);
        float _3032 = -_3028;
        float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3036 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3038 = precise::clamp(_3036, 0.0, 1.0);
        float _3040 = _3016 * _3030;
        float _3042 = _3012 * _3030;
        float _3044 = abs(_3038);
        float _3046 = log2(_3044);
        float _3048 = _3020 * _3030;
        float _3050 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3052 = _2538 * _3042;
        float _3054 = -_3042;
        float _3056 = -_3050;
        float _3058 = fma(_3054, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3056);
        float _3060 = fma(_2564, _3040, _3052);
        float _3062 = -_3048;
        float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3058);
        float _3066 = fma(_2566, _3048, _3060);
        float _3068 = precise::clamp(_3066, 0.0, 1.0);
        float _3070 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3072 = _3064 + _3070;
        float _3074 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3076 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        float _3080 = exp2(_3074);
        float _3082 = _3080 * _3078;
        float _3084 = _3068 * _3082;
        float _3086 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3088 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3090 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3086;
        out.m_89.y = _3088;
        out.m_89.z = _3090;
    }
    out.m_91.x = _3002;
    out.m_91.y = _3004;
    out.m_91.z = _3006;
    if (!_2988)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3092 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3092;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2844 = false;
    bool _378 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = _107;
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3160 = as_type<float>(_134);
        out.gl_Position.z = _3160;
    }
    if (!_120)
    {
        return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3215 = as_type<float>(_160);
        out.gl_Position.z = _3215;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _218 + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _260 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _262 = isnan(_218);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_234;
    float _274 = _272 + 1.0;
    float _276 = 1.0 / _254;
    float _278 = _270 * _274;
    float _280 = -_270;
    float _282 = _280 + 1.0;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _258;
    float _292 = _250 * _282;
    float _294 = -_250;
    float _296 = _294 + 1.0;
    float _298 = _222 * _276;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = fma(_286, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = fma(_306, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _314 = _238 * _290;
    float _316 = _308 * _292;
    float _318 = _310 * _292;
    float _320 = _312 * _292;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[143].x, _316);
    float _336 = fma(_324, _314, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_328, _314, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _340 = fma(_332, _314, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _342 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[143].y, _318);
    float _344 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[143].z, _320);
    float _346 = fma(_336, _278, _334);
    float _348 = fma(_338, _278, _342);
    float _350 = fma(_340, _278, _344);
    float _352 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[145].x, _346);
    float _354 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[145].y, _348);
    float _356 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[145].z, _350);
    bool _358 = !_288;
    float _376;
    if (!_358)
    {
        float _360 = in.m_57.x;
        float _362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _364 = _360 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _368 = _366 * _362;
        float _370 = floor(_368);
        float _372 = -_370;
        float _374 = _368 + _372;
        _376 = _374;
        _378 = true;
    }
    else
    {
        _376 = _172;
    }
    _378 = false;
    float _380 = _376;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _380 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _390 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _392 = isnan(_380);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _406 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _408 = isnan(_380);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _418;
    bool _422 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _424 = isnan(_380);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = 1.0 / _388;
    float _436 = -_400;
    float _438 = _436 + 1.0;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _442 = 1.0 / _404;
    float _444 = _420 * _434;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _450 = -_432;
    float _452 = _450 + 1.0;
    float _454 = fma(_444, _384, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _456 = _416 * _438;
    float _458 = -_416;
    float _460 = _458 + 1.0;
    float _462 = _400 * _452;
    float _464 = _448 * _442;
    float _466 = _454 * _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _470 = _380 + _468;
    float _472 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[115].x, _466);
    float _474 = fma(_464, _470, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _478 = fma(_474, _462, _472);
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _482 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[117].x, _478);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _484 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _492 = in.m_59.x;
    float _494 = in.m_59.y;
    float _496 = in.m_59.z;
    float _498 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _482;
    out.m_61.y = _488;
    out.m_61.z = _498;
    out.m_61.w = _490;
    float _500 = _356 * _496;
    float _502 = _354 * _494;
    float _504 = _352 * _492;
    bool _506 = !_440;
    if (!_506)
    {
        float _508 = in.m_57.x;
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _516 = _514 * _510;
        float _518 = floor(_516);
        float _520 = -_518;
        float _522 = _516 + _520;
        _194 = _522;
    }
    float _524 = _194;
    float _526 = in.m_57.z;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    float _532 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = in.m_57.x;
    float _536 = in.m_57.y;
    float _538 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _540 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _542 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _544 = int(_542);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _550 = _530 * _116;
    float _552 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _554 = int(_552);
    float _556 = _526 * 2.0;
    float _558 = exp2(_550);
    float _560 = _534 * 2.0;
    float _562 = _536 * 2.0;
    float _564 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _566 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _568 = floor(_556);
    float _570 = -_546;
    float _572 = fma(_564, 2.0, _570);
    float _574 = _536 + _534;
    float _576 = fma(_566, -2.0, _548);
    float _578 = _574 + (-1.0);
    float _580 = float(_544);
    float _582 = floor(_560);
    float _584 = -_558;
    float _586 = _584 + 1.0;
    float _588 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _590 = float(_554);
    float _592 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _576);
    bool _594 = _568 >= 0.0;
    bool _596 = isnan(_568);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = floor(_562);
    float _606 = _590 * _116;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _618 = _616 != 0;
    int _620 = _602 ? 0 : 1;
    bool _622 = _582 > 0.0;
    float _624 = 1.0 / _580;
    bool _626 = !_614;
    int _628 = _626 ? 0 : 1;
    bool _630 = _568 > 0.0;
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    bool _636 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    bool _646 = _582 >= 0.0;
    bool _648 = isnan(_582);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    bool _656 = _604 > 0.0;
    bool _658 = _604 >= 0.0;
    bool _660 = isnan(_604);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    int _668 = ~_620;
    int _670 = _668 + 1;
    int _672 = _670 + 1;
    float _674 = _624 * _116;
    int _676 = _672;
    float _678 = _592;
    if (!_630)
    {
        int _680 = ~_620;
        int _682 = _680 + 1;
        _676 = _682;
    }
    int _684 = _676;
    bool _686 = !_618;
    int _688 = _686 ? 0 : 1;
    float _690 = in.m_63.x;
    float _692 = in.m_63.y;
    float _694 = in.m_63.z;
    float _696 = _644 ? _586 : 0.0;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _710 = _708 != 0;
    float _712 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].w, _698);
    bool _714 = !_702;
    int _716 = _714 ? 0 : 1;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _720 = _654 ? 0 : 1;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _724 = 1.0 + _722;
    int _726 = abs(_716);
    float _728 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].z, _718);
    float _730 = -_116;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[76].x, _572);
    float _734 = float(_684);
    float _736 = 1.0 / _724;
    float _738 = float(_726);
    float _740 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _712);
    bool _742 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _744 = isnan(1.0);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _750 = _746 || _748;
    float _752 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _728);
    bool _754 = !_706;
    int _756 = _754 ? 0 : 1;
    float _758 = _738 * _734;
    float _760 = _534 + (-0.5);
    int _762 = ~_720;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = _758 * (-2.0);
    int _770 = _766;
    if (!_622)
    {
        int _772 = ~_720;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    int _778 = abs(_756);
    float _780 = fma(_768, _690, _690);
    bool _782 = !_710;
    int _784 = _782 ? 0 : 1;
    if (_750)
    {
        float _786 = _696 * _736;
        _126 = _786;
    }
    float _788 = _126;
    int _790 = _666 ? 0 : 1;
    float _792 = fma(_588, _768, _588);
    float _794 = float(_776);
    float _796 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].x, _780);
    float _798 = float(_778);
    int _800 = abs(_784);
    float _802 = fma(_792, _788, _796);
    int _804 = ~_790;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = _798 * _794;
    int _812 = _808;
    if (!_656)
    {
        int _814 = ~_790;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = _536 + _526;
    float _822 = _810 * (-2.0);
    float _824 = _820 + (-1.0);
    float _826 = float(_818);
    float _828 = fma(_822, _692, _692);
    float _830 = float(_800);
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _834 = _526 + _534;
    float _836 = _802 * 0.15915493667125701904296875;
    float _838 = _526 + (-0.5);
    float _840 = _830 * _826;
    float _842 = _536 + (-0.5);
    float _844 = fma(_832, _822, _832);
    float _846 = _834 + (-1.0);
    float _848 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _850 = _840 * (-2.0);
    float _852 = _836 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _858 = fma(_844, _788, _848);
    float _860 = fma(_850, _694, _694);
    float _862 = in.m_65.x;
    float _864 = in.m_65.y;
    float _866 = in.m_65.z;
    float _868 = fma(_856, _850, _856);
    float _870 = _858 * 0.15915493667125701904296875;
    float _872 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].z, _860);
    float _874 = _836 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(_868, _788, _872);
    float _880 = _878 * 0.15915493667125701904296875;
    float _882 = _870 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = in.m_46.x;
    float _888 = in.m_46.y;
    float _890 = in.m_46.z;
    float _892 = _870 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _862);
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _864);
    float _900 = _880 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _866);
    float _906 = _532 * _896;
    float _908 = _538 * _898;
    float _910 = _854 * _884;
    float _912 = _876 * _884;
    float _914 = _540 * _904;
    float _916 = _880 * 6.283185482025146484375;
    float _918 = sin(_916);
    float _920 = _854 * _894;
    float _922 = _876 * _894;
    float _924 = _854 * _902;
    float _926 = _876 * _902;
    float _928 = _894 * _902;
    float _930 = _884 * _902;
    float _932 = _924 * _908;
    float _934 = _926 * _908;
    float _936 = fma(_918, _920, _912);
    float _938 = -_910;
    float _940 = fma(_918, _922, _938);
    float _942 = -_922;
    float _944 = fma(_918, _910, _942);
    float _946 = -_908;
    float _948 = _918 * _946;
    float _950 = fma(_936, _906, _932);
    float _952 = fma(_918, _912, _920);
    float _954 = fma(_940, _906, _934);
    float _956 = fma(_928, _906, _948);
    float _958 = fma(_944, _914, _950);
    float _960 = _888 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _962 = _888 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _964 = fma(_930, _914, _956);
    float _966 = _958 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _968 = _958 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = fma(_952, _914, _954);
    float _972 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[6].x, _960);
    float _974 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _966);
    float _976 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[4].x, _962);
    float _978 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _980 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[6].z, _972);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[26].z, _974);
    float _984 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[4].z, _976);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _990 = _982 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _994 = _986 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _888 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _998 = _988 + _990;
    float _1000 = _958 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = _992 + _994;
    float _1004 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[5].x, _996);
    float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1008 = _998 + _1006;
    float _1010 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1002 + _1012;
    float _1016 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1004);
    float _1018 = _1008 * _1008;
    float _1020 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1022 = _1016 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1024 = fma(_1014, _1014, _1018);
    float _1026 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1030 = sqrt(_1024);
    float _1032 = _1022 + _1026;
    float _1034 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1028);
    float _1036 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1034);
    bool _1038 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1026;
    float _1042 = _1004;
    float _1044 = _1034;
    if (!_1038)
    {
        _1040 = _1002;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    if (!_1038)
    {
        _1042 = _998;
    }
    float _1050 = _1042;
    float _1052 = _1050;
    if (!_1038)
    {
        _1044 = _1032;
    }
    float _1054 = _1044;
    bool _1056 = !_1038;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _1030 + _1062;
        float _1066 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = rsqrt(_1024);
        float _1070 = _1064 * _1060;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1032, _1076, _1084);
        float _1090 = _1068 * _1086;
        float _1092 = fma(_1014, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_1008, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1058 = _1088;
        _1048 = _1092;
        _1052 = _1094;
    }
    float _1096 = _1058;
    float _1098 = _1048;
    float _1100 = _1052;
    float _1102 = -_1022;
    float _1104 = _1102 + _1096;
    float _1106 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1108 = -_992;
    float _1110 = _1108 + _1098;
    float _1112 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1114 = _1104 * _1104;
    float _1116 = -_988;
    float _1118 = _1116 + _1100;
    float _1120 = 1.0 / _1106;
    float _1122 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1112);
    float _1124 = fma(_1110, _1110, _1114);
    float _1126 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1122);
    float _1128 = fma(_1118, _1118, _1124);
    bool _1130 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1132 = isnan(0.5);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1138 = _1134 || _1136;
    float _1140 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1142 = sqrt(_1128);
    bool _1144 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1146 = isnan(0.5);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1152 = _1148 || _1150;
    float _1154 = _1140 + _1106;
    float _1156 = _1154 * _1120;
    float _1158 = _1156 * 0.5;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1162 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1160);
    float _1164 = 1.0 / _1162;
    bool _1166 = _1142 > 0.0;
    bool _1168 = !_1166;
    float _1170 = _1098;
    float _1172 = _1096;
    float _1174 = _1100;
    float _1176 = _1104;
    float _1178 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1180 = _1162;
    float _1182 = _1118;
    float _1184 = _1110;
    float _1186 = _1142;
    float _1188 = _1106;
    float _1190 = _1128;
    if (!_1168)
    {
        float _1192 = _188 * _188;
        float _1194 = fma(_186, _186, _1192);
        float _1196 = fma(_190, _190, _1194);
        float _1198 = rsqrt(_1128);
        float _1200 = sqrt(_1196);
        float _1202 = _1110 * _1198;
        float _1204 = _1104 * _1198;
        float _1206 = _1118 * _1198;
        bool _1208 = _1200 > 0.0;
        bool _1210 = !_1208;
        _1178 = _1198;
        _1180 = _1200;
        _1186 = _1196;
        _1188 = _1204;
        if (!_1210)
        {
            float _1212 = rsqrt(_1196);
            float _1214 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1216 = _188 * _1212;
            float _1218 = _186 * _1212;
            float _1220 = _190 * _1212;
            float _1222 = _1204 * _1216;
            float _1224 = fma(_1202, _1218, _1222);
            float _1226 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1228 = fma(_1206, _1220, _1224);
            float _1230 = _1228 * _1226;
            float _1232 = fma(_186, _1230, _1098);
            float _1234 = fma(_188, _1230, _1096);
            float _1236 = fma(_190, _1230, _1100);
            _1170 = _1232;
            _1172 = _1234;
            _1174 = _1236;
            _1176 = _1230;
            _1178 = _1226;
            _1180 = _1214;
            _1182 = _1220;
            _1184 = _1216;
        }
    }
    float _1238 = _1170;
    float _1240 = _1172;
    float _1242 = _1174;
    float _1244 = _1176;
    float _1246 = _1178;
    float _1248 = _1180;
    float _1250 = _1182;
    float _1252 = _1184;
    float _1254 = _1186;
    float _1256 = _1188;
    float _1258 = _1254;
    float _1260 = _1248;
    float _1262 = _1246;
    float _1264 = _1250;
    float _1266 = _1244;
    float _1268 = _1256;
    float _1270 = _1252;
    if (_1152)
    {
        _1258 = 1.0;
    }
    float _1272 = _1258;
    float _1274 = _1272;
    if (_1138)
    {
        _1260 = _1238;
    }
    float _1276 = _1260;
    float _1278 = _1276;
    if (_1138)
    {
        _1262 = _1240;
    }
    float _1280 = _1262;
    float _1282 = _1280;
    if (_1138)
    {
        _1190 = _1242;
    }
    float _1284 = _1190;
    float _1286 = _1284;
    if (!_1138)
    {
        float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1290 = _1022 + _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1294 = _992 + _1292;
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1298 = -_1022;
        float _1300 = _1298 + _1240;
        float _1302 = _1290 * _1290;
        float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1306 = _988 + _1304;
        float _1308 = -_992;
        float _1310 = _1308 + _1238;
        float _1312 = -_988;
        float _1314 = _1312 + _1242;
        float _1316 = fma(_1294, _1294, _1302);
        float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1320 = fma(_1306, _1306, _1316);
        float _1322 = sqrt(_1320);
        float _1324 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1326 = precise::min(_1322, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1328 = _1326 * _1318;
        float _1330 = _1324 * _1328;
        float _1332 = fma(_1300, _1330, _1022);
        float _1334 = fma(_1310, _1330, _992);
        float _1336 = fma(_1314, _1330, _988);
        _196 = _1328;
        _1282 = _1332;
        _1278 = _1334;
        _1286 = _1336;
        _1264 = _1318;
        _1266 = _1296;
    }
    float _1338 = _196;
    float _1340 = _1282;
    float _1342 = _1278;
    float _1344 = _1286;
    float _1346 = _1264;
    float _1348 = _1266;
    float _1350 = _1338;
    float _1352 = _1348;
    if (_1152)
    {
        _1268 = 1.0;
    }
    float _1354 = _1268;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1358 = _1164 * _1356;
    float _1360 = _1354;
    if (!_1152)
    {
        float _1362 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1364 = _1362 * 0.15915493667125701904296875;
        float _1366 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1368 = _1364 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 0.15915493667125701904296875;
        float _1374 = _1364 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        float _1378 = 1.0 / _1370;
        float _1380 = _1372 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = _1376 * _1378;
        float _1386 = _1372 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1382 * _1384;
        float _1392 = 1.0 / _1390;
        float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1394;
        float _1398 = 1.0 / _1396;
        float _1400 = _1388 * _1392;
        float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1404 = fma(_1358, _1400, _1402);
        float _1406 = _1404 * _1398;
        float _1408 = precise::clamp(_1406, 0.0, 1.0);
        _1350 = _1372;
        _1352 = _1364;
        _1274 = _1408;
    }
    float _1410 = _1350;
    float _1412 = _1352;
    float _1414 = _1274;
    float _1416 = _1412;
    float _1418 = _1410;
    if (!_1152)
    {
        float _1420 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = _1420 * 0.15915493667125701904296875;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 0.15915493667125701904296875;
        float _1432 = _1422 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = 1.0 / _1428;
        float _1438 = _1430 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = _1434 * _1436;
        float _1444 = _1430 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = _1440 * _1442;
        float _1450 = 1.0 / _1448;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1454 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1452;
        float _1456 = 1.0 / _1454;
        float _1458 = _1446 * _1450;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1462 = fma(_1358, _1458, _1460);
        float _1464 = _1462 * _1456;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        float _1468 = -_1466;
        float _1470 = _1468 + 1.0;
        _1416 = _1448;
        _1418 = _1436;
        _1360 = _1470;
    }
    float _1472 = _1416;
    float _1474 = _1418;
    float _1476 = _1360;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1480 = _1340 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1484 = _1342 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1488 = _1344 + _1486;
    float _1490 = _1480 * _1480;
    float _1492 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1494 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1496 = fma(_1484, _1484, _1490);
    float _1498 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1492);
    float _1500 = fma(_1488, _1488, _1496);
    float _1502 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1498);
    float _1504 = rsqrt(_1500);
    float _1506 = sqrt(_1500);
    float _1508 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1510 = _1484 * _1508;
    float _1512 = _1488 * _1508;
    float _1514 = _1510 * _1510;
    float _1516 = _1512 * _1512;
    float _1518 = _1514 + _1516;
    float _1520 = sqrt(_1518);
    bool _1522 = _1520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1526 = _1520 + _1524;
    float _1528 = _1346;
    float _1530 = _1526;
    float _1532 = _1510;
    float _1534 = _1512;
    float _1536 = _1514;
    float _1538 = _1516;
    if (_1522)
    {
        float _1540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1528 = _1540;
    }
    float _1542 = _1528;
    if (_1522)
    {
        float _1544 = _1526 * _1542;
        _1530 = _1544;
    }
    float _1546 = _1530;
    if (_1522)
    {
        float _1548 = _1546 * 0.15915493667125701904296875;
        _1270 = _1548;
    }
    float _1550 = _1270;
    float _1552 = _1472;
    float _1554 = _1550;
    if (_1522)
    {
        float _1556 = _1550 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1552 = _1558;
    }
    float _1560 = _1552;
    float _1562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1564 = precise::max(0.0, _1562);
    float _1566 = _1474;
    float _1568 = _1564;
    if (_1522)
    {
        float _1570 = _1550 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        _1566 = _1572;
    }
    float _1574 = _1566;
    float _1576 = -_1508;
    float _1578 = -_1564;
    float _1580 = fma(_1480, _1576, _1578);
    float _1582 = _1562;
    if (_1522)
    {
        float _1584 = rsqrt(_1518);
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (_1522)
    {
        float _1588 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1588;
    }
    float _1590 = _1568;
    float _1592 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1594 = _1590;
    float _1596 = _1560;
    if (_1522)
    {
        float _1598 = fma(_1560, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1594 = _1598;
    }
    float _1600 = _1594;
    float _1602 = _1600;
    if (_1522)
    {
        float _1604 = _1574 + (-1.0);
        _1596 = _1604;
    }
    float _1606 = _1596;
    float _1608 = floor(_1592);
    float _1610 = _1586;
    if (_1522)
    {
        float _1612 = _1586 * _1600;
        _1554 = _1612;
    }
    float _1614 = _1554;
    if (_1522)
    {
        float _1616 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1602 = _1616;
    }
    float _1618 = _1602;
    if (!_1522)
    {
        _1610 = _1580;
    }
    float _1620 = _1610;
    float _1622 = _1620;
    if (_1522)
    {
        float _1624 = _1510 * _1614;
        _1532 = _1624;
    }
    float _1626 = _1532;
    if (_1522)
    {
        float _1628 = fma(_1580, _1574, _1618);
        _1622 = _1628;
    }
    float _1630 = _1622;
    if (_1522)
    {
        float _1632 = _1512 * _1614;
        _1534 = _1632;
    }
    float _1634 = _1534;
    if (_1522)
    {
        float _1636 = _1626 * _1626;
        _1536 = _1636;
    }
    float _1638 = _1536;
    float _1640 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1522)
    {
        float _1642 = _1634 * _1634;
        _1538 = _1642;
    }
    float _1644 = _1538;
    float _1646 = fma(_1630, _1630, _1638);
    float _1648 = fma(_988, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1650 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1652 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1640);
    float _1654 = _1646 + _1644;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1658 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1650);
    float _1660 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1652);
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1664 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1662);
    float _1666 = precise::clamp(_1664, 0.0, 1.0);
    float _1668 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1494);
    float _1670 = rsqrt(_1654);
    float _1672 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1658);
    float _1674 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1676 = -_1666;
    float _1678 = _1676 + 1.0;
    float _1680 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1684 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1686 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1668);
    float _1688 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1690 = abs(_1678);
    float _1692 = log2(_1690);
    float _1694 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1684);
    float _1696 = -_1688;
    float _1698 = fma(_1696, _1656, 1.0);
    float _1700 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1694);
    float _1704 = _1670 * _1626;
    float _1706 = _1670 * _1630;
    float _1708 = _1670 * _1634;
    float _1710 = floor(_1648);
    float _1712 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1714 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1702);
    float _1716 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = -_1712;
    float _1720 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1718);
    float _1722 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1724 = log2(_1698);
    float _1726 = -_1708;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1720);
    float _1730 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1732 = 1.0 / _1714;
    float _1734 = -_1608;
    float _1736 = _1592 + _1734;
    float _1738 = fma(_1728, -0.5, 0.5);
    float _1740 = fma(_1728, 0.5, 0.5);
    float _1742 = -_1710;
    float _1744 = _1648 + _1742;
    float _1746 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1730);
    float _1748 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1750 = _1706 + 1.0;
    float _1752 = exp2(_1722);
    float _1754 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1746);
    float _1756 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1748);
    float _1758 = _1724 * 0.693147182464599609375;
    float _1760 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1754);
    float _1762 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1756);
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1766 = sqrt(_1738);
    float _1768 = fma(_1740, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1770 = fma(_1740, _1768, -0.212114393711090087890625);
    float _1772 = -_1706;
    float _1774 = fma(_1752, _1750, _1772);
    float _1776 = fma(_1740, _1770, 1.570728778839111328125);
    float _1778 = _1760 * _1732;
    float _1780 = _1762 * _1732;
    float _1782 = fma(_1774, 0.5, 0.5);
    float _1784 = fma(_1778, 0.5, 0.5);
    float _1786 = fma(_1780, -0.5, 0.5);
    float _1788 = _1766 * 0.636619746685028076171875;
    float2 _5731 = float2(_1736, _1744);
    float _1790 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5731, float2(0.0), isnan(_5731)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5731, float2(0.0), isnan(_5731)), level(0.0)).x;
    float _1792 = -_1776;
    float _1794 = fma(_1788, _1792, 1.0);
    float3 _5747 = float3(_1784, _1786, _1764);
    float _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5747, float3(0.0), isnan(_5747)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5747, float3(0.0), isnan(_5747)), level(0.0)).x;
    float3 _5758 = float3(_1784, _1786, _1764);
    float4 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5758, float3(0.0), isnan(_5758)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5758, float3(0.0), isnan(_5758)), level(0.0)).xyzw;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = _1799.w;
    float2 _5774 = float2(_1794, _1782);
    float3 _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5774, float2(0.0), isnan(_5774)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5774, float2(0.0), isnan(_5774)), level(0.0)).xyz;
    float _1813 = _1811.x;
    float _1815 = _1811.y;
    float _1817 = _1811.z;
    float _1819 = float(uint(_554));
    float _1821 = trunc(_674);
    int _1823 = int(_1821);
    bool _1825 = _554 == 0;
    float _1827 = _606 * _168;
    int _1829 = ~_554;
    int _1831 = _1829 + 1;
    float _1833 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1835 = _554 + (-1);
    int _1837 = abs(_628);
    float _1839 = 1.0 / _1819;
    int _1841 = abs(_634);
    int _1843 = abs(_688);
    float _1845 = float(uint(_1823));
    float _1847 = exp2(_1833);
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1851 = _1849 != 0;
    int _1853 = as_type<int>(_1839) + (-2);
    bool _1855 = !_1851;
    float _1857 = _1855 ? 7.345489978790283203125 : 1.0;
    int _1859 = ~_554;
    int _1861 = _1859 + 1;
    float _1863 = as_type<float>(_1853) * _1845;
    float _1865 = _1857 * _534;
    float _1867 = -_1847;
    float _1869 = _1867 + 1.0;
    float _1871 = trunc(_1863);
    float _1873 = precise::max(_1871, 0.0);
    uint _1876 = uint(_1873);
    float _1878 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1880 = floor(_1865);
    int _1882 = _1831 * int(_1876);
    int _1884 = _1882 + _1823;
    float _1886 = float(uint(_1884));
    float _1888 = -_1880;
    float _1890 = _1865 + _1888;
    float _1892 = as_type<float>(_1853) * _1886;
    float _1894 = float(_1823);
    float _1896 = _1890 * _590;
    float _1898 = trunc(_1892);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    float _1904 = trunc(_1896);
    int _1906 = int(_1904);
    int _1908 = int(_1876) + int(_1902);
    bool _1910 = _1894 >= _590;
    bool _1912 = isnan(_1894);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(_590);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    int _1922 = _1861 * _1908;
    int _1924 = _1922 + _1823;
    float _1926 = trunc(_1827);
    int _1928 = int(_1926);
    int _1930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1932 = _1930 != 0;
    bool _1934 = uint(_1924) >= uint(_554);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1938 = _1936 != 0;
    float _1940 = trunc(_1920);
    int _1942 = int(_1940);
    bool _1944 = !_1934;
    int _1946 = _1944 ? 0 : (-1);
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1950 = _1948 != 0;
    int _1952 = ~_1908;
    int _1954 = _1952 + _1946;
    int _1956 = _1954 + 1;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1960 = _1958 != 0;
    int _1962 = _554 * _1956;
    int _1964 = _1962 + _1823;
    bool _1966 = !_1950;
    int _1968 = _1966 ? 0 : 1;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1972 = _1970 != 0;
    bool _1974 = !_1825;
    int _1976 = _1974 ? _1964 : (-1);
    int _1978 = ~_1942;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = abs(_1968);
    int _1986 = _1976 * _1982;
    float _1988 = in.m_67.y;
    int _1990 = _1942 * _1835;
    int _1992 = _1990 + _1986;
    int _1994 = _1992 * _1837;
    int _1996 = _1906 * _1984;
    int _1998 = _1996 + _1823;
    int _2000 = _1928 * _1841;
    int _2002 = _2000 + _1994;
    bool _2004 = !_1972;
    int _2006 = _2004 ? 0 : 1;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2010 = _2008 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2016 = abs(_2006);
    float _2018 = 1.0 / _2010;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2024 = as_type<float>(_2016);
    float _2026 = _1714;
    float _2028 = _1762;
    if (_1932)
    {
        float _2030 = in.m_57.x;
        _2024 = _2030;
    }
    float _2032 = _2024;
    int _2034 = _1998 * _1843;
    int _2036 = _2034 + _2002;
    bool _2038 = _536 > 0.5;
    int _2040 = _1906 * _2016;
    int _2042 = _2040 + _2036;
    float _2044 = 1.0 / _2014;
    float _2046 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2046;
    float _2050 = -_1988;
    float _2052 = _2050 + 1.0;
    float _2054 = float(uint(_2042));
    int _2056 = ~_554;
    int _2058 = _2056 + 1;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2060 = 1.0 / _2022;
    float _2062 = as_type<float>(_1853) * _2054;
    float _2064 = _1988;
    if (_1938)
    {
        float _2066 = _2038 ? _2052 : _1988;
        _2064 = _2066;
    }
    float _2068 = _2064;
    float _2070 = in.m_67.x;
    bool _2072 = _864 != 0.0;
    bool _2074 = isnan(_864);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = trunc(_2062);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    bool _2088 = _2032 > 0.5;
    bool _2090 = _2088 && _1932;
    float _2092 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2094 = _2092 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2096 = _2048 * _2044;
    bool _2098 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2100 = isnan(_524);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_2106);
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2110;
    float _2114 = _2094 * _2018;
    bool _2116 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2118 = isnan(_524);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2130 = _524 + _2128;
    float _2132 = -_2108;
    float _2134 = _2132 + 1.0;
    bool _2136 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2138 = isnan(_524);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2144 = _2140 || _2142;
    float _2146 = float(_2144);
    float _2148 = _2112 * _2060;
    bool _2150 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2152 = isnan(_524);
    bool _2154 = _2150 || _2152;
    bool _2156 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2158 = _2154 || _2156;
    float _2160 = float(_2158);
    float _2162 = _2126 * _2134;
    float _2164 = -_2126;
    float _2166 = _2164 + 1.0;
    int _2168 = _2058 * int(_2086);
    int _2170 = _2168 + _2042;
    float _2172 = fma(_2096, _2130, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2174 = _862 == 0.0;
    bool _2176 = !_2080;
    bool _2178 = _2174 && _2176;
    float _2180 = _2146 * _2166;
    float _2182 = -_2146;
    float _2184 = _2182 + 1.0;
    float _2186 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2188 = float(uint(_2170));
    float _2190 = _2160 * _2184;
    float _2192 = -_592;
    float _2194 = fma(_740, _2186, _2192);
    float _2196 = _2070;
    if (_1932)
    {
        _678 = _2070;
    }
    float _2198 = _678;
    float _2200 = in.m_71.x;
    float _2202 = in.m_71.y;
    float _2204 = in.m_71.z;
    float _2206 = as_type<float>(_1853) * _2188;
    float _2208 = _2172 * _2190;
    float _2210 = float(uint(_1998));
    float _2212 = _2198;
    if (_2090)
    {
        float _2214 = -_2198;
        float _2216 = _2214 + 1.0;
        _2212 = _2216;
    }
    float _2218 = _2212;
    bool _2220 = _866 == 0.0;
    bool _2222 = _2220 && _2178;
    float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2226 = _524 + _2224;
    float _2228 = trunc(_2206);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    float _2234 = as_type<float>(_1853) * _2210;
    float _2236 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2238 = _524 + _2236;
    if (_1932)
    {
        _2196 = _2218;
    }
    float _2240 = _2196;
    float _2242 = -_2160;
    float _2244 = _2242 + 1.0;
    int _2246 = ~_554;
    int _2248 = _2246 + 1;
    float _2250 = fma(_2114, _2226, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2252 = fma(_2148, _2238, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2254 = trunc(_2234);
    float _2256 = precise::max(_2254, 0.0);
    uint _2258 = uint(_2256);
    float _2260 = fma(_2244, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2208);
    int _2262 = ~_554;
    int _2264 = _2262 + 1;
    float _2266 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2268 = _944 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2270 = fma(_2250, _2180, _2260);
    float _2272 = _944 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2274 = int(_2086) + int(_2232);
    float _2276 = _2202;
    float _2278 = _2200;
    float _2280 = _2204;
    if (!_2222)
    {
        float _2282 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2202);
        _2276 = _2282;
    }
    float _2284 = _2276;
    if (!_2222)
    {
        float _2286 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2200);
        _2278 = _2286;
    }
    float _2288 = _2278;
    if (!_2222)
    {
        float _2290 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2204);
        _2280 = _2290;
    }
    float _2292 = _2280;
    float _2294 = fma(_2252, _2162, _2270);
    float _2296 = fma(_752, _2266, _732);
    int _2298 = _2248 * _2274;
    int _2300 = _2298 + _2042;
    float _2302 = abs(_1358);
    float _2304 = log2(_2302);
    int _2306 = _2264 * int(_2258);
    int _2308 = _2306 + _1998;
    float _2310 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2294);
    bool _2312 = uint(_2300) >= uint(_554);
    float _2314 = _2296 + 0.5;
    float _2316 = float(uint(_2308));
    float _2318 = _2310 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2320 = !_2312;
    int _2322 = _2320 ? 0 : (-1);
    float _2324 = _924 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2326 = as_type<float>(_1853) * _2316;
    int _2328 = ~_2274;
    int _2330 = _2328 + _2322;
    int _2332 = _2330 + 1;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2336 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2338 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2340 = _554 * _2332;
    int _2342 = _2340 + _2042;
    float _2344 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2348 = _2194 + 0.5;
    float _2350 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2352 = !_1825;
    int _2354 = _2352 ? _2342 : (-1);
    float _2356 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2358 = exp2(_2338);
    out.m_73.x = _2314;
    out.m_73.y = _2348;
    float _2360 = _924 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2362 = _924 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2344;
    out.m_75.y = _2356;
    out.m_75.z = _2350;
    out.m_75.w = _2318;
    float _2364 = _944 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2366 = ~_554;
    int _2368 = _2366 + 1;
    float _2370 = trunc(_2326);
    float _2372 = precise::max(_2370, 0.0);
    uint _2374 = uint(_2372);
    float _2376 = -_918;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2324);
    float _2380 = _936 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2382 = _2354 >> 31;
    float _2384 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2386 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2268);
    float _2388 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2364);
    int _2390 = _2354 & 3;
    bool _2392 = _2390 != 0;
    float _2394 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2380);
    int _2396 = _2354 & 3;
    bool _2398 = _2396 != 0;
    int _2400 = _2382 & 3;
    float _2402 = -_918;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2360);
    float _2406 = -_918;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2362);
    float _2410 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    int _2414 = _2354 + _2400;
    float _2416 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2404);
    float _2418 = _936 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2420 = _936 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2422 = _2414 >> 2;
    float _2424 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2378);
    float _2426 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2418);
    int _2428 = int(_2258) + int(_2374);
    float _2430 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2408);
    int _2432 = _2422 << 4;
    int _2434 = _2432 + 368;
    float _2436 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2420);
    bool _2438 = uint(_2390) > 1u;
    int _2440 = _2368 * _2428;
    int _2442 = _2440 + _1998;
    uint _2444 = uint(int(uint(_2434) >> uint(2)));
    uint _2446 = uint(int(uint(int(_2444)) >> uint(2)));
    int _2448 = int(_2444) & 3;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[int(_2446)][_2448];
    int _2452 = int(_2444) + 1;
    uint _2454 = uint(int(uint(_2452) >> uint(2)));
    int _2456 = _2452 & 3;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[int(_2454)][_2456];
    float _2460 = _2424 * _2284;
    float _2462 = _2416 * _2284;
    float _2464 = _2430 * _2284;
    float _2466 = _2412 * _2412;
    float _2468 = fma(_2412, -2.0, 3.0);
    bool _2470 = uint(_2442) >= uint(_554);
    int _2472 = _2434 + 8;
    uint _2474 = uint(int(uint(_2472) >> uint(2)));
    uint _2476 = uint(int(uint(int(_2474)) >> uint(2)));
    int _2478 = int(_2474) & 3;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[int(_2476)][_2478];
    int _2482 = int(_2474) + 1;
    uint _2484 = uint(int(uint(_2482) >> uint(2)));
    int _2486 = _2482 & 3;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[int(_2484)][_2486];
    int _2490 = _2398 ? 0 : 1;
    float _2492 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2426);
    bool _2494 = _2390 != 3;
    float _2496 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2394);
    bool _2498 = !_2470;
    int _2500 = _2498 ? 0 : (-1);
    float _2502 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2436);
    bool _2504 = uint(_2390) >= 2u;
    float _2506 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2386);
    int _2508 = ~_2490;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = fma(_2496, _2288, _2462);
    int _2516 = _2512;
    if (!_2438)
    {
        int _2518 = ~_2490;
        int _2520 = _2518 + 1;
        _2516 = _2520;
    }
    int _2522 = _2516;
    float _2524 = fma(_2492, _2288, _2460);
    int _2526 = _2504 ? 0 : 1;
    float _2528 = _2466 * _2468;
    bool _2530 = !_2392;
    int _2532 = _2530 ? 0 : 1;
    float _2534 = fma(_2502, _2288, _2464);
    int _2536 = abs(_2522);
    float _2538 = fma(_2506, _2292, _2514);
    int _2540 = ~_2526;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    float _2546 = in.m_77.x;
    bool _2548 = _2390 != 3;
    float _2550 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2384);
    int _2552 = abs(_2532);
    float _2554 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2388);
    int _2556 = _2544;
    if (_2494)
    {
        int _2558 = ~_2526;
        int _2560 = _2558 + 1;
        _2556 = _2560;
    }
    int _2562 = _2556;
    float _2564 = fma(_2550, _2292, _2524);
    float _2566 = fma(_2554, _2292, _2534);
    bool _2568 = !_2548;
    int _2570 = _2568 ? 0 : (-1);
    float _2572 = -_1790;
    float _2574 = _2572 + 1.0;
    int _2576 = abs(_2562);
    float _2578 = _1878 * _1796;
    int _2580 = ~_2536;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    out.m_79.x = _2564;
    out.m_79.y = _2538;
    out.m_79.z = _2566;
    int _2586 = abs(_2570);
    bool _2588 = !_1960;
    int _2590 = _2588 ? 0 : 1;
    int _2592 = ~_2552;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = _2584 * as_type<int>(_2458);
    int _2600 = abs(_2590);
    int _2602 = _2596 * as_type<int>(_2450);
    int _2604 = _2602 + _2598;
    int _2606 = ~_2576;
    int _2608 = _2606 + 1;
    int _2610 = _2608 + 1;
    int _2612 = ~_2586;
    int _2614 = _2612 + 1;
    int _2616 = _2614 + 1;
    float _2618 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2620 = ~_2428;
    int _2622 = _2620 + _2500;
    int _2624 = _2622 + 1;
    int _2626 = _2610 * as_type<int>(_2480);
    int _2628 = _2626 + _2604;
    bool _2630 = _1358 <= 8000.0;
    bool _2632 = isnan(_1358);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan(8000.0);
    bool _2638 = _2634 || _2636;
    float _2640 = float(_2638);
    float _2642 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2618);
    int _2644 = _2616 * as_type<int>(_2488);
    int _2646 = _2644 + _2628;
    float _2648 = -_2528;
    float _2650 = _2648 + 1.0;
    int _2652 = _554 * _2624;
    int _2654 = _2652 + _1998;
    int _2656 = ~_2600;
    int _2658 = _2656 + 1;
    int _2660 = _2658 + 1;
    float _2662 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2642);
    float _2664 = fma(_2650, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2528);
    float _2666 = _1817 * _2578;
    bool _2668 = !_1825;
    int _2670 = _2668 ? _2654 : (-1);
    float _2672 = _2640 * _2664;
    int _2674 = _2646 * _2660;
    float _2676 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2662);
    float _2678 = fma(_1807, _2666, _1805);
    float _2680 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2682 = _2670 * _2600;
    int _2684 = _2682 + _2674;
    float _2686 = _1807 * _2578;
    out.gl_Position.x = _1760;
    out.gl_Position.y = _1762;
    out.gl_Position.z = _2676;
    out.gl_Position.w = _1714;
    float _2688 = _2574 * _2680;
    float _2690 = precise::clamp(_2688, 0.0, 1.0);
    bool _2692 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2694 = isnan(_1506);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2700 = _2696 || _2698;
    float _2702 = fma(_1813, _2686, _1801);
    float _2704 = float(_2684);
    float _2706 = -_2690;
    float _2708 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2710 = _1760 + _1714;
    float _2712 = fma(_1815, _2686, _1803);
    float _2714 = _2676 + _1714;
    float _2716 = _2708 * _2546;
    out.m_81.x = _2704;
    float _2718 = _1714 * 0.5;
    float _2720 = _2716 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2722 = -_1878;
    float _2724 = _2722 + 1.0;
    float _2726 = _2714 * 0.5;
    float _2728 = _2710 * 0.5;
    float _2730 = fma(_1762, -0.5, _2718);
    float _2732 = _1807 * _2724;
    out.m_83.x = _2720;
    float _2734 = _1414 * _1476;
    float _2736 = _2676;
    float _2738 = _2734;
    float _2740 = _2730;
    float _2742 = _2728;
    if (!_2700)
    {
        _2026 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2744 = _2026;
    out.m_85.x = _2702;
    out.m_85.y = _2712;
    out.m_85.z = _2678;
    out.m_85.w = _2732;
    float _2746 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2748 = _2744;
    float _2750 = _2744;
    if (!_2700)
    {
        _2736 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2752 = _2736;
    out.m_87.x = _2728;
    out.m_87.y = _2730;
    out.m_87.z = _2726;
    out.m_87.w = _1714;
    float _2754 = _2752;
    float _2756 = _2752;
    if (!_2700)
    {
        _2028 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2758 = _2028;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2700)
    {
        _2738 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2764 = _2738;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2700)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2770 = _2740;
    float _2772 = _2770;
    float _2774 = _2770;
    if (!_2700)
    {
        _2742 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2776 = _2742;
    bool _2778 = !_2700;
    float _2780 = _2776;
    float _2782 = _2776;
    if (!_2778)
    {
        bool _2784 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2786 = isnan(_1506);
        bool _2788 = _2784 || _2786;
        bool _2790 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2792 = _2788 || _2790;
        if (!_2792)
        {
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2796 = _1506 + _2794;
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2800 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2798;
            float _2802 = 1.0 / _2800;
            float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2824 = _2796 * _2802;
            float _2826 = precise::clamp(_2824, 0.0, 1.0);
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2832 = fma(_2826, _2806, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2834 = fma(_2826, _2830, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2836 = fma(_2826, _2810, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2838 = fma(_2826, _2814, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2840 = fma(_2826, _2818, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2842 = fma(_2826, _2822, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2782 = _2834;
            _2762 = _2840;
            _2774 = _2832;
            _2756 = _2838;
            _2750 = _2836;
            _2768 = _2842;
            _2844 = true;
        }
        else
        {
            bool _2846 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2848 = isnan(_1506);
            bool _2850 = _2846 || _2848;
            bool _2852 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2854 = _2850 || _2852;
            if (!_2854)
            {
                _2772 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2856 = _2772;
            _2774 = _2856;
            if (!_2854)
            {
                _2780 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2858 = _2780;
            _2782 = _2858;
            if (!_2854)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2860 = _2748;
            _2750 = _2860;
            if (!_2854)
            {
                _2754 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2862 = _2754;
            _2756 = _2862;
            if (!_2854)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2864 = _2760;
            _2762 = _2864;
            if (!_2854)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2866 = _2766;
            bool _2868 = !_2854;
            _2768 = _2866;
            if (!_2868)
            {
                bool _2870 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2872 = isnan(_1506);
                bool _2874 = _2870 || _2872;
                bool _2876 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2878 = _2874 || _2876;
                if (!_2878)
                {
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2882 = _1506 + _2880;
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2886 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2884;
                    float _2888 = 1.0 / _2886;
                    float _2890 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2892 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2896 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2900 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2910 = _2882 * _2888;
                    float _2912 = precise::clamp(_2910, 0.0, 1.0);
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2918 = fma(_2912, _2892, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2920 = fma(_2912, _2916, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2922 = fma(_2912, _2896, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2924 = fma(_2912, _2900, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2926 = fma(_2912, _2904, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2928 = fma(_2912, _2908, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2782 = _2920;
                    _2762 = _2926;
                    _2774 = _2918;
                    _2756 = _2924;
                    _2750 = _2922;
                    _2768 = _2928;
                    _2844 = true;
                }
                else
                {
                    _2782 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2774 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2756 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2844 = false;
    float _2930 = _2782;
    float _2932 = _2762;
    float _2934 = _2774;
    float _2936 = _2756;
    float _2938 = _2750;
    float _2940 = _2768;
    float _2942 = fma(_2538, -0.5, 0.5);
    float _2944 = precise::clamp(_2942, 0.0, 1.0);
    float _2946 = -_2930;
    float _2948 = _2946 + _2932;
    float _2950 = _2746 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2952 = -_2934;
    float _2954 = _2952 + _2936;
    float _2956 = fma(_2944, _2948, _2930);
    out.m_89.x = 0.0;
    float _2958 = -_2938;
    float _2960 = _2958 + _2940;
    float _2962 = fma(_2944, _2954, _2934);
    float _2964 = _2956 * 0.586610972881317138671875;
    out.m_53.x = _2950;
    bool _2966 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2968 = fma(_2944, _2960, _2938);
    float _2970 = fma(_2962, 0.298911988735198974609375, _2964);
    bool _2972 = _1414 > 0.0;
    bool _2974 = isnan(_1414);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan(0.0);
    bool _2980 = _2976 || _2978;
    float _2982 = fma(_2968, 0.114477999508380889892578125, _2970);
    bool _2984 = _1476 <= 0.0;
    bool _2986 = !_2980;
    bool _2988 = _2984 || _2986;
    float _2990 = -_2982;
    float _2992 = _2962 + _2990;
    float _2994 = -_2982;
    float _2996 = _2956 + _2994;
    float _2998 = -_2982;
    float _3000 = _2968 + _2998;
    float _3002 = fma(_2992, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3004 = fma(_2996, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3006 = fma(_3000, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    bool _3008 = !_2966;
    if (!_3008)
    {
        float _3010 = -_1340;
        float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3014 = -_1342;
        float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3018 = -_1344;
        float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3022 = _3012 * _3012;
        float _3024 = fma(_3016, _3016, _3022);
        float _3026 = fma(_3020, _3020, _3024);
        float _3028 = sqrt(_3026);
        float _3030 = rsqrt(_3026);
        float _3032 = -_3028;
        float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3036 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3038 = precise::clamp(_3036, 0.0, 1.0);
        float _3040 = _3016 * _3030;
        float _3042 = _3012 * _3030;
        float _3044 = abs(_3038);
        float _3046 = log2(_3044);
        float _3048 = _3020 * _3030;
        float _3050 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3052 = _2538 * _3042;
        float _3054 = -_3042;
        float _3056 = -_3050;
        float _3058 = fma(_3054, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3056);
        float _3060 = fma(_2564, _3040, _3052);
        float _3062 = -_3048;
        float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3058);
        float _3066 = fma(_2566, _3048, _3060);
        float _3068 = precise::clamp(_3066, 0.0, 1.0);
        float _3070 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3072 = _3064 + _3070;
        float _3074 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3076 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        float _3080 = exp2(_3074);
        float _3082 = _3080 * _3078;
        float _3084 = _3068 * _3082;
        float _3086 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3088 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3090 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3086;
        out.m_89.y = _3088;
        out.m_89.z = _3090;
    }
    out.m_91.x = _3002;
    out.m_91.y = _3004;
    out.m_91.z = _3006;
    if (!_2988)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3092 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3092;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2844 = false;
    bool _378 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = _107;
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3160 = as_type<float>(_134);
        out.gl_Position.z = _3160;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3215 = as_type<float>(_160);
        out.gl_Position.z = _3215;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _218 + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _260 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _262 = isnan(_218);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_234;
    float _274 = _272 + 1.0;
    float _276 = 1.0 / _254;
    float _278 = _270 * _274;
    float _280 = -_270;
    float _282 = _280 + 1.0;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _258;
    float _292 = _250 * _282;
    float _294 = -_250;
    float _296 = _294 + 1.0;
    float _298 = _222 * _276;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = fma(_286, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = fma(_306, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _314 = _238 * _290;
    float _316 = _308 * _292;
    float _318 = _310 * _292;
    float _320 = _312 * _292;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[143].x, _316);
    float _336 = fma(_324, _314, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_328, _314, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _340 = fma(_332, _314, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _342 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[143].y, _318);
    float _344 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[143].z, _320);
    float _346 = fma(_336, _278, _334);
    float _348 = fma(_338, _278, _342);
    float _350 = fma(_340, _278, _344);
    float _352 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[145].x, _346);
    float _354 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[145].y, _348);
    float _356 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[145].z, _350);
    bool _358 = !_288;
    float _376;
    if (!_358)
    {
        float _360 = in.m_57.x;
        float _362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _364 = _360 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _368 = _366 * _362;
        float _370 = floor(_368);
        float _372 = -_370;
        float _374 = _368 + _372;
        _376 = _374;
        _378 = true;
    }
    else
    {
        _376 = _172;
    }
    _378 = false;
    float _380 = _376;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _380 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _390 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _392 = isnan(_380);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _406 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _408 = isnan(_380);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _418;
    bool _422 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _424 = isnan(_380);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = 1.0 / _388;
    float _436 = -_400;
    float _438 = _436 + 1.0;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _442 = 1.0 / _404;
    float _444 = _420 * _434;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _450 = -_432;
    float _452 = _450 + 1.0;
    float _454 = fma(_444, _384, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _456 = _416 * _438;
    float _458 = -_416;
    float _460 = _458 + 1.0;
    float _462 = _400 * _452;
    float _464 = _448 * _442;
    float _466 = _454 * _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _470 = _380 + _468;
    float _472 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[115].x, _466);
    float _474 = fma(_464, _470, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _478 = fma(_474, _462, _472);
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _482 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[117].x, _478);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _484 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _492 = in.m_59.x;
    float _494 = in.m_59.y;
    float _496 = in.m_59.z;
    float _498 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _482;
    out.m_61.y = _488;
    out.m_61.z = _498;
    out.m_61.w = _490;
    float _500 = _356 * _496;
    float _502 = _354 * _494;
    float _504 = _352 * _492;
    bool _506 = !_440;
    if (!_506)
    {
        float _508 = in.m_57.x;
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _516 = _514 * _510;
        float _518 = floor(_516);
        float _520 = -_518;
        float _522 = _516 + _520;
        _194 = _522;
    }
    float _524 = _194;
    float _526 = in.m_57.z;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    float _532 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = in.m_57.x;
    float _536 = in.m_57.y;
    float _538 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _540 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _542 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _544 = int(_542);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _550 = _530 * _116;
    float _552 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _554 = int(_552);
    float _556 = _526 * 2.0;
    float _558 = exp2(_550);
    float _560 = _534 * 2.0;
    float _562 = _536 * 2.0;
    float _564 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _566 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _568 = floor(_556);
    float _570 = -_546;
    float _572 = fma(_564, 2.0, _570);
    float _574 = _536 + _534;
    float _576 = fma(_566, -2.0, _548);
    float _578 = _574 + (-1.0);
    float _580 = float(_544);
    float _582 = floor(_560);
    float _584 = -_558;
    float _586 = _584 + 1.0;
    float _588 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _590 = float(_554);
    float _592 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _576);
    bool _594 = _568 >= 0.0;
    bool _596 = isnan(_568);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = floor(_562);
    float _606 = _590 * _116;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _618 = _616 != 0;
    int _620 = _602 ? 0 : 1;
    bool _622 = _582 > 0.0;
    float _624 = 1.0 / _580;
    bool _626 = !_614;
    int _628 = _626 ? 0 : 1;
    bool _630 = _568 > 0.0;
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    bool _636 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    bool _646 = _582 >= 0.0;
    bool _648 = isnan(_582);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    bool _656 = _604 > 0.0;
    bool _658 = _604 >= 0.0;
    bool _660 = isnan(_604);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    int _668 = ~_620;
    int _670 = _668 + 1;
    int _672 = _670 + 1;
    float _674 = _624 * _116;
    int _676 = _672;
    float _678 = _592;
    if (!_630)
    {
        int _680 = ~_620;
        int _682 = _680 + 1;
        _676 = _682;
    }
    int _684 = _676;
    bool _686 = !_618;
    int _688 = _686 ? 0 : 1;
    float _690 = in.m_63.x;
    float _692 = in.m_63.y;
    float _694 = in.m_63.z;
    float _696 = _644 ? _586 : 0.0;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _710 = _708 != 0;
    float _712 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].w, _698);
    bool _714 = !_702;
    int _716 = _714 ? 0 : 1;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _720 = _654 ? 0 : 1;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _724 = 1.0 + _722;
    int _726 = abs(_716);
    float _728 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].z, _718);
    float _730 = -_116;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[76].x, _572);
    float _734 = float(_684);
    float _736 = 1.0 / _724;
    float _738 = float(_726);
    float _740 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _712);
    bool _742 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _744 = isnan(1.0);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _750 = _746 || _748;
    float _752 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _728);
    bool _754 = !_706;
    int _756 = _754 ? 0 : 1;
    float _758 = _738 * _734;
    float _760 = _534 + (-0.5);
    int _762 = ~_720;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = _758 * (-2.0);
    int _770 = _766;
    if (!_622)
    {
        int _772 = ~_720;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    int _778 = abs(_756);
    float _780 = fma(_768, _690, _690);
    bool _782 = !_710;
    int _784 = _782 ? 0 : 1;
    if (_750)
    {
        float _786 = _696 * _736;
        _126 = _786;
    }
    float _788 = _126;
    int _790 = _666 ? 0 : 1;
    float _792 = fma(_588, _768, _588);
    float _794 = float(_776);
    float _796 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].x, _780);
    float _798 = float(_778);
    int _800 = abs(_784);
    float _802 = fma(_792, _788, _796);
    int _804 = ~_790;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = _798 * _794;
    int _812 = _808;
    if (!_656)
    {
        int _814 = ~_790;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = _536 + _526;
    float _822 = _810 * (-2.0);
    float _824 = _820 + (-1.0);
    float _826 = float(_818);
    float _828 = fma(_822, _692, _692);
    float _830 = float(_800);
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _834 = _526 + _534;
    float _836 = _802 * 0.15915493667125701904296875;
    float _838 = _526 + (-0.5);
    float _840 = _830 * _826;
    float _842 = _536 + (-0.5);
    float _844 = fma(_832, _822, _832);
    float _846 = _834 + (-1.0);
    float _848 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _850 = _840 * (-2.0);
    float _852 = _836 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _858 = fma(_844, _788, _848);
    float _860 = fma(_850, _694, _694);
    float _862 = in.m_65.x;
    float _864 = in.m_65.y;
    float _866 = in.m_65.z;
    float _868 = fma(_856, _850, _856);
    float _870 = _858 * 0.15915493667125701904296875;
    float _872 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].z, _860);
    float _874 = _836 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(_868, _788, _872);
    float _880 = _878 * 0.15915493667125701904296875;
    float _882 = _870 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = in.m_46.x;
    float _888 = in.m_46.y;
    float _890 = in.m_46.z;
    float _892 = _870 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _862);
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _864);
    float _900 = _880 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _866);
    float _906 = _532 * _896;
    float _908 = _538 * _898;
    float _910 = _854 * _884;
    float _912 = _876 * _884;
    float _914 = _540 * _904;
    float _916 = _880 * 6.283185482025146484375;
    float _918 = sin(_916);
    float _920 = _854 * _894;
    float _922 = _876 * _894;
    float _924 = _854 * _902;
    float _926 = _876 * _902;
    float _928 = _894 * _902;
    float _930 = _884 * _902;
    float _932 = _924 * _908;
    float _934 = _926 * _908;
    float _936 = fma(_918, _920, _912);
    float _938 = -_910;
    float _940 = fma(_918, _922, _938);
    float _942 = -_922;
    float _944 = fma(_918, _910, _942);
    float _946 = -_908;
    float _948 = _918 * _946;
    float _950 = fma(_936, _906, _932);
    float _952 = fma(_918, _912, _920);
    float _954 = fma(_940, _906, _934);
    float _956 = fma(_928, _906, _948);
    float _958 = fma(_944, _914, _950);
    float _960 = _888 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _962 = _888 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _964 = fma(_930, _914, _956);
    float _966 = _958 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _968 = _958 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = fma(_952, _914, _954);
    float _972 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[6].x, _960);
    float _974 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _966);
    float _976 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[4].x, _962);
    float _978 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _980 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[6].z, _972);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[26].z, _974);
    float _984 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[4].z, _976);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _990 = _982 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _994 = _986 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _888 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _998 = _988 + _990;
    float _1000 = _958 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = _992 + _994;
    float _1004 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[5].x, _996);
    float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1008 = _998 + _1006;
    float _1010 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1002 + _1012;
    float _1016 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1004);
    float _1018 = _1008 * _1008;
    float _1020 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1022 = _1016 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1024 = fma(_1014, _1014, _1018);
    float _1026 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1030 = sqrt(_1024);
    float _1032 = _1022 + _1026;
    float _1034 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1028);
    float _1036 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1034);
    bool _1038 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1026;
    float _1042 = _1004;
    float _1044 = _1034;
    if (!_1038)
    {
        _1040 = _1002;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    if (!_1038)
    {
        _1042 = _998;
    }
    float _1050 = _1042;
    float _1052 = _1050;
    if (!_1038)
    {
        _1044 = _1032;
    }
    float _1054 = _1044;
    bool _1056 = !_1038;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _1030 + _1062;
        float _1066 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = rsqrt(_1024);
        float _1070 = _1064 * _1060;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1032, _1076, _1084);
        float _1090 = _1068 * _1086;
        float _1092 = fma(_1014, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_1008, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1058 = _1088;
        _1048 = _1092;
        _1052 = _1094;
    }
    float _1096 = _1058;
    float _1098 = _1048;
    float _1100 = _1052;
    float _1102 = -_1022;
    float _1104 = _1102 + _1096;
    float _1106 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1108 = -_992;
    float _1110 = _1108 + _1098;
    float _1112 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1114 = _1104 * _1104;
    float _1116 = -_988;
    float _1118 = _1116 + _1100;
    float _1120 = 1.0 / _1106;
    float _1122 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1112);
    float _1124 = fma(_1110, _1110, _1114);
    float _1126 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1122);
    float _1128 = fma(_1118, _1118, _1124);
    bool _1130 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1132 = isnan(0.5);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1138 = _1134 || _1136;
    float _1140 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1142 = sqrt(_1128);
    bool _1144 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1146 = isnan(0.5);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1152 = _1148 || _1150;
    float _1154 = _1140 + _1106;
    float _1156 = _1154 * _1120;
    float _1158 = _1156 * 0.5;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1162 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1160);
    float _1164 = 1.0 / _1162;
    bool _1166 = _1142 > 0.0;
    bool _1168 = !_1166;
    float _1170 = _1098;
    float _1172 = _1096;
    float _1174 = _1100;
    float _1176 = _1104;
    float _1178 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1180 = _1162;
    float _1182 = _1118;
    float _1184 = _1110;
    float _1186 = _1142;
    float _1188 = _1106;
    float _1190 = _1128;
    if (!_1168)
    {
        float _1192 = _188 * _188;
        float _1194 = fma(_186, _186, _1192);
        float _1196 = fma(_190, _190, _1194);
        float _1198 = rsqrt(_1128);
        float _1200 = sqrt(_1196);
        float _1202 = _1110 * _1198;
        float _1204 = _1104 * _1198;
        float _1206 = _1118 * _1198;
        bool _1208 = _1200 > 0.0;
        bool _1210 = !_1208;
        _1178 = _1198;
        _1180 = _1200;
        _1186 = _1196;
        _1188 = _1204;
        if (!_1210)
        {
            float _1212 = rsqrt(_1196);
            float _1214 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1216 = _188 * _1212;
            float _1218 = _186 * _1212;
            float _1220 = _190 * _1212;
            float _1222 = _1204 * _1216;
            float _1224 = fma(_1202, _1218, _1222);
            float _1226 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1228 = fma(_1206, _1220, _1224);
            float _1230 = _1228 * _1226;
            float _1232 = fma(_186, _1230, _1098);
            float _1234 = fma(_188, _1230, _1096);
            float _1236 = fma(_190, _1230, _1100);
            _1170 = _1232;
            _1172 = _1234;
            _1174 = _1236;
            _1176 = _1230;
            _1178 = _1226;
            _1180 = _1214;
            _1182 = _1220;
            _1184 = _1216;
        }
    }
    float _1238 = _1170;
    float _1240 = _1172;
    float _1242 = _1174;
    float _1244 = _1176;
    float _1246 = _1178;
    float _1248 = _1180;
    float _1250 = _1182;
    float _1252 = _1184;
    float _1254 = _1186;
    float _1256 = _1188;
    float _1258 = _1254;
    float _1260 = _1248;
    float _1262 = _1246;
    float _1264 = _1250;
    float _1266 = _1244;
    float _1268 = _1256;
    float _1270 = _1252;
    if (_1152)
    {
        _1258 = 1.0;
    }
    float _1272 = _1258;
    float _1274 = _1272;
    if (_1138)
    {
        _1260 = _1238;
    }
    float _1276 = _1260;
    float _1278 = _1276;
    if (_1138)
    {
        _1262 = _1240;
    }
    float _1280 = _1262;
    float _1282 = _1280;
    if (_1138)
    {
        _1190 = _1242;
    }
    float _1284 = _1190;
    float _1286 = _1284;
    if (!_1138)
    {
        float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1290 = _1022 + _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1294 = _992 + _1292;
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1298 = -_1022;
        float _1300 = _1298 + _1240;
        float _1302 = _1290 * _1290;
        float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1306 = _988 + _1304;
        float _1308 = -_992;
        float _1310 = _1308 + _1238;
        float _1312 = -_988;
        float _1314 = _1312 + _1242;
        float _1316 = fma(_1294, _1294, _1302);
        float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1320 = fma(_1306, _1306, _1316);
        float _1322 = sqrt(_1320);
        float _1324 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1326 = precise::min(_1322, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1328 = _1326 * _1318;
        float _1330 = _1324 * _1328;
        float _1332 = fma(_1300, _1330, _1022);
        float _1334 = fma(_1310, _1330, _992);
        float _1336 = fma(_1314, _1330, _988);
        _196 = _1328;
        _1282 = _1332;
        _1278 = _1334;
        _1286 = _1336;
        _1264 = _1318;
        _1266 = _1296;
    }
    float _1338 = _196;
    float _1340 = _1282;
    float _1342 = _1278;
    float _1344 = _1286;
    float _1346 = _1264;
    float _1348 = _1266;
    float _1350 = _1338;
    float _1352 = _1348;
    if (_1152)
    {
        _1268 = 1.0;
    }
    float _1354 = _1268;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1358 = _1164 * _1356;
    float _1360 = _1354;
    if (!_1152)
    {
        float _1362 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1364 = _1362 * 0.15915493667125701904296875;
        float _1366 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1368 = _1364 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 0.15915493667125701904296875;
        float _1374 = _1364 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        float _1378 = 1.0 / _1370;
        float _1380 = _1372 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = _1376 * _1378;
        float _1386 = _1372 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1382 * _1384;
        float _1392 = 1.0 / _1390;
        float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1394;
        float _1398 = 1.0 / _1396;
        float _1400 = _1388 * _1392;
        float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1404 = fma(_1358, _1400, _1402);
        float _1406 = _1404 * _1398;
        float _1408 = precise::clamp(_1406, 0.0, 1.0);
        _1350 = _1372;
        _1352 = _1364;
        _1274 = _1408;
    }
    float _1410 = _1350;
    float _1412 = _1352;
    float _1414 = _1274;
    float _1416 = _1412;
    float _1418 = _1410;
    if (!_1152)
    {
        float _1420 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = _1420 * 0.15915493667125701904296875;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 0.15915493667125701904296875;
        float _1432 = _1422 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = 1.0 / _1428;
        float _1438 = _1430 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = _1434 * _1436;
        float _1444 = _1430 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = _1440 * _1442;
        float _1450 = 1.0 / _1448;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1454 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1452;
        float _1456 = 1.0 / _1454;
        float _1458 = _1446 * _1450;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1462 = fma(_1358, _1458, _1460);
        float _1464 = _1462 * _1456;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        float _1468 = -_1466;
        float _1470 = _1468 + 1.0;
        _1416 = _1448;
        _1418 = _1436;
        _1360 = _1470;
    }
    float _1472 = _1416;
    float _1474 = _1418;
    float _1476 = _1360;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1480 = _1340 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1484 = _1342 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1488 = _1344 + _1486;
    float _1490 = _1480 * _1480;
    float _1492 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1494 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1496 = fma(_1484, _1484, _1490);
    float _1498 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1492);
    float _1500 = fma(_1488, _1488, _1496);
    float _1502 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1498);
    float _1504 = rsqrt(_1500);
    float _1506 = sqrt(_1500);
    float _1508 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1510 = _1484 * _1508;
    float _1512 = _1488 * _1508;
    float _1514 = _1510 * _1510;
    float _1516 = _1512 * _1512;
    float _1518 = _1514 + _1516;
    float _1520 = sqrt(_1518);
    bool _1522 = _1520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1526 = _1520 + _1524;
    float _1528 = _1346;
    float _1530 = _1526;
    float _1532 = _1510;
    float _1534 = _1512;
    float _1536 = _1514;
    float _1538 = _1516;
    if (_1522)
    {
        float _1540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1528 = _1540;
    }
    float _1542 = _1528;
    if (_1522)
    {
        float _1544 = _1526 * _1542;
        _1530 = _1544;
    }
    float _1546 = _1530;
    if (_1522)
    {
        float _1548 = _1546 * 0.15915493667125701904296875;
        _1270 = _1548;
    }
    float _1550 = _1270;
    float _1552 = _1472;
    float _1554 = _1550;
    if (_1522)
    {
        float _1556 = _1550 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1552 = _1558;
    }
    float _1560 = _1552;
    float _1562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1564 = precise::max(0.0, _1562);
    float _1566 = _1474;
    float _1568 = _1564;
    if (_1522)
    {
        float _1570 = _1550 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        _1566 = _1572;
    }
    float _1574 = _1566;
    float _1576 = -_1508;
    float _1578 = -_1564;
    float _1580 = fma(_1480, _1576, _1578);
    float _1582 = _1562;
    if (_1522)
    {
        float _1584 = rsqrt(_1518);
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (_1522)
    {
        float _1588 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1588;
    }
    float _1590 = _1568;
    float _1592 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1594 = _1590;
    float _1596 = _1560;
    if (_1522)
    {
        float _1598 = fma(_1560, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1594 = _1598;
    }
    float _1600 = _1594;
    float _1602 = _1600;
    if (_1522)
    {
        float _1604 = _1574 + (-1.0);
        _1596 = _1604;
    }
    float _1606 = _1596;
    float _1608 = floor(_1592);
    float _1610 = _1586;
    if (_1522)
    {
        float _1612 = _1586 * _1600;
        _1554 = _1612;
    }
    float _1614 = _1554;
    if (_1522)
    {
        float _1616 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1602 = _1616;
    }
    float _1618 = _1602;
    if (!_1522)
    {
        _1610 = _1580;
    }
    float _1620 = _1610;
    float _1622 = _1620;
    if (_1522)
    {
        float _1624 = _1510 * _1614;
        _1532 = _1624;
    }
    float _1626 = _1532;
    if (_1522)
    {
        float _1628 = fma(_1580, _1574, _1618);
        _1622 = _1628;
    }
    float _1630 = _1622;
    if (_1522)
    {
        float _1632 = _1512 * _1614;
        _1534 = _1632;
    }
    float _1634 = _1534;
    if (_1522)
    {
        float _1636 = _1626 * _1626;
        _1536 = _1636;
    }
    float _1638 = _1536;
    float _1640 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1522)
    {
        float _1642 = _1634 * _1634;
        _1538 = _1642;
    }
    float _1644 = _1538;
    float _1646 = fma(_1630, _1630, _1638);
    float _1648 = fma(_988, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1650 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1652 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1640);
    float _1654 = _1646 + _1644;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1658 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1650);
    float _1660 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1652);
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1664 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1662);
    float _1666 = precise::clamp(_1664, 0.0, 1.0);
    float _1668 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1494);
    float _1670 = rsqrt(_1654);
    float _1672 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1658);
    float _1674 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1676 = -_1666;
    float _1678 = _1676 + 1.0;
    float _1680 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1684 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1686 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1668);
    float _1688 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1690 = abs(_1678);
    float _1692 = log2(_1690);
    float _1694 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1684);
    float _1696 = -_1688;
    float _1698 = fma(_1696, _1656, 1.0);
    float _1700 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1694);
    float _1704 = _1670 * _1626;
    float _1706 = _1670 * _1630;
    float _1708 = _1670 * _1634;
    float _1710 = floor(_1648);
    float _1712 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1714 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1702);
    float _1716 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = -_1712;
    float _1720 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1718);
    float _1722 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1724 = log2(_1698);
    float _1726 = -_1708;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1720);
    float _1730 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1732 = 1.0 / _1714;
    float _1734 = -_1608;
    float _1736 = _1592 + _1734;
    float _1738 = fma(_1728, -0.5, 0.5);
    float _1740 = fma(_1728, 0.5, 0.5);
    float _1742 = -_1710;
    float _1744 = _1648 + _1742;
    float _1746 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1730);
    float _1748 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1750 = _1706 + 1.0;
    float _1752 = exp2(_1722);
    float _1754 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1746);
    float _1756 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1748);
    float _1758 = _1724 * 0.693147182464599609375;
    float _1760 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1754);
    float _1762 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1756);
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1766 = sqrt(_1738);
    float _1768 = fma(_1740, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1770 = fma(_1740, _1768, -0.212114393711090087890625);
    float _1772 = -_1706;
    float _1774 = fma(_1752, _1750, _1772);
    float _1776 = fma(_1740, _1770, 1.570728778839111328125);
    float _1778 = _1760 * _1732;
    float _1780 = _1762 * _1732;
    float _1782 = fma(_1774, 0.5, 0.5);
    float _1784 = fma(_1778, 0.5, 0.5);
    float _1786 = fma(_1780, -0.5, 0.5);
    float _1788 = _1766 * 0.636619746685028076171875;
    float2 _5731 = float2(_1736, _1744);
    float _1790 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5731, float2(0.0), isnan(_5731)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5731, float2(0.0), isnan(_5731)), level(0.0)).x;
    float _1792 = -_1776;
    float _1794 = fma(_1788, _1792, 1.0);
    float3 _5747 = float3(_1784, _1786, _1764);
    float _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5747, float3(0.0), isnan(_5747)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5747, float3(0.0), isnan(_5747)), level(0.0)).x;
    float3 _5758 = float3(_1784, _1786, _1764);
    float4 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5758, float3(0.0), isnan(_5758)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5758, float3(0.0), isnan(_5758)), level(0.0)).xyzw;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = _1799.w;
    float2 _5774 = float2(_1794, _1782);
    float3 _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5774, float2(0.0), isnan(_5774)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5774, float2(0.0), isnan(_5774)), level(0.0)).xyz;
    float _1813 = _1811.x;
    float _1815 = _1811.y;
    float _1817 = _1811.z;
    float _1819 = float(uint(_554));
    float _1821 = trunc(_674);
    int _1823 = int(_1821);
    bool _1825 = _554 == 0;
    float _1827 = _606 * _168;
    int _1829 = ~_554;
    int _1831 = _1829 + 1;
    float _1833 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1835 = _554 + (-1);
    int _1837 = abs(_628);
    float _1839 = 1.0 / _1819;
    int _1841 = abs(_634);
    int _1843 = abs(_688);
    float _1845 = float(uint(_1823));
    float _1847 = exp2(_1833);
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1851 = _1849 != 0;
    int _1853 = as_type<int>(_1839) + (-2);
    bool _1855 = !_1851;
    float _1857 = _1855 ? 7.345489978790283203125 : 1.0;
    int _1859 = ~_554;
    int _1861 = _1859 + 1;
    float _1863 = as_type<float>(_1853) * _1845;
    float _1865 = _1857 * _534;
    float _1867 = -_1847;
    float _1869 = _1867 + 1.0;
    float _1871 = trunc(_1863);
    float _1873 = precise::max(_1871, 0.0);
    uint _1876 = uint(_1873);
    float _1878 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1880 = floor(_1865);
    int _1882 = _1831 * int(_1876);
    int _1884 = _1882 + _1823;
    float _1886 = float(uint(_1884));
    float _1888 = -_1880;
    float _1890 = _1865 + _1888;
    float _1892 = as_type<float>(_1853) * _1886;
    float _1894 = float(_1823);
    float _1896 = _1890 * _590;
    float _1898 = trunc(_1892);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    float _1904 = trunc(_1896);
    int _1906 = int(_1904);
    int _1908 = int(_1876) + int(_1902);
    bool _1910 = _1894 >= _590;
    bool _1912 = isnan(_1894);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(_590);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    int _1922 = _1861 * _1908;
    int _1924 = _1922 + _1823;
    float _1926 = trunc(_1827);
    int _1928 = int(_1926);
    int _1930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1932 = _1930 != 0;
    bool _1934 = uint(_1924) >= uint(_554);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1938 = _1936 != 0;
    float _1940 = trunc(_1920);
    int _1942 = int(_1940);
    bool _1944 = !_1934;
    int _1946 = _1944 ? 0 : (-1);
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1950 = _1948 != 0;
    int _1952 = ~_1908;
    int _1954 = _1952 + _1946;
    int _1956 = _1954 + 1;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1960 = _1958 != 0;
    int _1962 = _554 * _1956;
    int _1964 = _1962 + _1823;
    bool _1966 = !_1950;
    int _1968 = _1966 ? 0 : 1;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1972 = _1970 != 0;
    bool _1974 = !_1825;
    int _1976 = _1974 ? _1964 : (-1);
    int _1978 = ~_1942;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = abs(_1968);
    int _1986 = _1976 * _1982;
    float _1988 = in.m_67.y;
    int _1990 = _1942 * _1835;
    int _1992 = _1990 + _1986;
    int _1994 = _1992 * _1837;
    int _1996 = _1906 * _1984;
    int _1998 = _1996 + _1823;
    int _2000 = _1928 * _1841;
    int _2002 = _2000 + _1994;
    bool _2004 = !_1972;
    int _2006 = _2004 ? 0 : 1;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2010 = _2008 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2016 = abs(_2006);
    float _2018 = 1.0 / _2010;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2024 = as_type<float>(_2016);
    float _2026 = _1714;
    float _2028 = _1762;
    if (_1932)
    {
        float _2030 = in.m_57.x;
        _2024 = _2030;
    }
    float _2032 = _2024;
    int _2034 = _1998 * _1843;
    int _2036 = _2034 + _2002;
    bool _2038 = _536 > 0.5;
    int _2040 = _1906 * _2016;
    int _2042 = _2040 + _2036;
    float _2044 = 1.0 / _2014;
    float _2046 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2046;
    float _2050 = -_1988;
    float _2052 = _2050 + 1.0;
    float _2054 = float(uint(_2042));
    int _2056 = ~_554;
    int _2058 = _2056 + 1;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2060 = 1.0 / _2022;
    float _2062 = as_type<float>(_1853) * _2054;
    float _2064 = _1988;
    if (_1938)
    {
        float _2066 = _2038 ? _2052 : _1988;
        _2064 = _2066;
    }
    float _2068 = _2064;
    float _2070 = in.m_67.x;
    bool _2072 = _864 != 0.0;
    bool _2074 = isnan(_864);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = trunc(_2062);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    bool _2088 = _2032 > 0.5;
    bool _2090 = _2088 && _1932;
    float _2092 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2094 = _2092 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2096 = _2048 * _2044;
    bool _2098 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2100 = isnan(_524);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_2106);
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2110;
    float _2114 = _2094 * _2018;
    bool _2116 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2118 = isnan(_524);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2130 = _524 + _2128;
    float _2132 = -_2108;
    float _2134 = _2132 + 1.0;
    bool _2136 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2138 = isnan(_524);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2144 = _2140 || _2142;
    float _2146 = float(_2144);
    float _2148 = _2112 * _2060;
    bool _2150 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2152 = isnan(_524);
    bool _2154 = _2150 || _2152;
    bool _2156 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2158 = _2154 || _2156;
    float _2160 = float(_2158);
    float _2162 = _2126 * _2134;
    float _2164 = -_2126;
    float _2166 = _2164 + 1.0;
    int _2168 = _2058 * int(_2086);
    int _2170 = _2168 + _2042;
    float _2172 = fma(_2096, _2130, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2174 = _862 == 0.0;
    bool _2176 = !_2080;
    bool _2178 = _2174 && _2176;
    float _2180 = _2146 * _2166;
    float _2182 = -_2146;
    float _2184 = _2182 + 1.0;
    float _2186 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2188 = float(uint(_2170));
    float _2190 = _2160 * _2184;
    float _2192 = -_592;
    float _2194 = fma(_740, _2186, _2192);
    float _2196 = _2070;
    if (_1932)
    {
        _678 = _2070;
    }
    float _2198 = _678;
    float _2200 = in.m_71.x;
    float _2202 = in.m_71.y;
    float _2204 = in.m_71.z;
    float _2206 = as_type<float>(_1853) * _2188;
    float _2208 = _2172 * _2190;
    float _2210 = float(uint(_1998));
    float _2212 = _2198;
    if (_2090)
    {
        float _2214 = -_2198;
        float _2216 = _2214 + 1.0;
        _2212 = _2216;
    }
    float _2218 = _2212;
    bool _2220 = _866 == 0.0;
    bool _2222 = _2220 && _2178;
    float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2226 = _524 + _2224;
    float _2228 = trunc(_2206);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    float _2234 = as_type<float>(_1853) * _2210;
    float _2236 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2238 = _524 + _2236;
    if (_1932)
    {
        _2196 = _2218;
    }
    float _2240 = _2196;
    float _2242 = -_2160;
    float _2244 = _2242 + 1.0;
    int _2246 = ~_554;
    int _2248 = _2246 + 1;
    float _2250 = fma(_2114, _2226, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2252 = fma(_2148, _2238, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2254 = trunc(_2234);
    float _2256 = precise::max(_2254, 0.0);
    uint _2258 = uint(_2256);
    float _2260 = fma(_2244, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2208);
    int _2262 = ~_554;
    int _2264 = _2262 + 1;
    float _2266 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2268 = _944 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2270 = fma(_2250, _2180, _2260);
    float _2272 = _944 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2274 = int(_2086) + int(_2232);
    float _2276 = _2202;
    float _2278 = _2200;
    float _2280 = _2204;
    if (!_2222)
    {
        float _2282 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2202);
        _2276 = _2282;
    }
    float _2284 = _2276;
    if (!_2222)
    {
        float _2286 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2200);
        _2278 = _2286;
    }
    float _2288 = _2278;
    if (!_2222)
    {
        float _2290 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2204);
        _2280 = _2290;
    }
    float _2292 = _2280;
    float _2294 = fma(_2252, _2162, _2270);
    float _2296 = fma(_752, _2266, _732);
    int _2298 = _2248 * _2274;
    int _2300 = _2298 + _2042;
    float _2302 = abs(_1358);
    float _2304 = log2(_2302);
    int _2306 = _2264 * int(_2258);
    int _2308 = _2306 + _1998;
    float _2310 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2294);
    bool _2312 = uint(_2300) >= uint(_554);
    float _2314 = _2296 + 0.5;
    float _2316 = float(uint(_2308));
    float _2318 = _2310 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2320 = !_2312;
    int _2322 = _2320 ? 0 : (-1);
    float _2324 = _924 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2326 = as_type<float>(_1853) * _2316;
    int _2328 = ~_2274;
    int _2330 = _2328 + _2322;
    int _2332 = _2330 + 1;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2336 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2338 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2340 = _554 * _2332;
    int _2342 = _2340 + _2042;
    float _2344 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2348 = _2194 + 0.5;
    float _2350 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2352 = !_1825;
    int _2354 = _2352 ? _2342 : (-1);
    float _2356 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2358 = exp2(_2338);
    out.m_73.x = _2314;
    out.m_73.y = _2348;
    float _2360 = _924 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2362 = _924 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2344;
    out.m_75.y = _2356;
    out.m_75.z = _2350;
    out.m_75.w = _2318;
    float _2364 = _944 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2366 = ~_554;
    int _2368 = _2366 + 1;
    float _2370 = trunc(_2326);
    float _2372 = precise::max(_2370, 0.0);
    uint _2374 = uint(_2372);
    float _2376 = -_918;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2324);
    float _2380 = _936 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2382 = _2354 >> 31;
    float _2384 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2386 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2268);
    float _2388 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2364);
    int _2390 = _2354 & 3;
    bool _2392 = _2390 != 0;
    float _2394 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2380);
    int _2396 = _2354 & 3;
    bool _2398 = _2396 != 0;
    int _2400 = _2382 & 3;
    float _2402 = -_918;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2360);
    float _2406 = -_918;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2362);
    float _2410 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    int _2414 = _2354 + _2400;
    float _2416 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2404);
    float _2418 = _936 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2420 = _936 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2422 = _2414 >> 2;
    float _2424 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2378);
    float _2426 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2418);
    int _2428 = int(_2258) + int(_2374);
    float _2430 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2408);
    int _2432 = _2422 << 4;
    int _2434 = _2432 + 368;
    float _2436 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2420);
    bool _2438 = uint(_2390) > 1u;
    int _2440 = _2368 * _2428;
    int _2442 = _2440 + _1998;
    uint _2444 = uint(int(uint(_2434) >> uint(2)));
    uint _2446 = uint(int(uint(int(_2444)) >> uint(2)));
    int _2448 = int(_2444) & 3;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[int(_2446)][_2448];
    int _2452 = int(_2444) + 1;
    uint _2454 = uint(int(uint(_2452) >> uint(2)));
    int _2456 = _2452 & 3;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[int(_2454)][_2456];
    float _2460 = _2424 * _2284;
    float _2462 = _2416 * _2284;
    float _2464 = _2430 * _2284;
    float _2466 = _2412 * _2412;
    float _2468 = fma(_2412, -2.0, 3.0);
    bool _2470 = uint(_2442) >= uint(_554);
    int _2472 = _2434 + 8;
    uint _2474 = uint(int(uint(_2472) >> uint(2)));
    uint _2476 = uint(int(uint(int(_2474)) >> uint(2)));
    int _2478 = int(_2474) & 3;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[int(_2476)][_2478];
    int _2482 = int(_2474) + 1;
    uint _2484 = uint(int(uint(_2482) >> uint(2)));
    int _2486 = _2482 & 3;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[int(_2484)][_2486];
    int _2490 = _2398 ? 0 : 1;
    float _2492 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2426);
    bool _2494 = _2390 != 3;
    float _2496 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2394);
    bool _2498 = !_2470;
    int _2500 = _2498 ? 0 : (-1);
    float _2502 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2436);
    bool _2504 = uint(_2390) >= 2u;
    float _2506 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2386);
    int _2508 = ~_2490;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = fma(_2496, _2288, _2462);
    int _2516 = _2512;
    if (!_2438)
    {
        int _2518 = ~_2490;
        int _2520 = _2518 + 1;
        _2516 = _2520;
    }
    int _2522 = _2516;
    float _2524 = fma(_2492, _2288, _2460);
    int _2526 = _2504 ? 0 : 1;
    float _2528 = _2466 * _2468;
    bool _2530 = !_2392;
    int _2532 = _2530 ? 0 : 1;
    float _2534 = fma(_2502, _2288, _2464);
    int _2536 = abs(_2522);
    float _2538 = fma(_2506, _2292, _2514);
    int _2540 = ~_2526;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    float _2546 = in.m_77.x;
    bool _2548 = _2390 != 3;
    float _2550 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2384);
    int _2552 = abs(_2532);
    float _2554 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2388);
    int _2556 = _2544;
    if (_2494)
    {
        int _2558 = ~_2526;
        int _2560 = _2558 + 1;
        _2556 = _2560;
    }
    int _2562 = _2556;
    float _2564 = fma(_2550, _2292, _2524);
    float _2566 = fma(_2554, _2292, _2534);
    bool _2568 = !_2548;
    int _2570 = _2568 ? 0 : (-1);
    float _2572 = -_1790;
    float _2574 = _2572 + 1.0;
    int _2576 = abs(_2562);
    float _2578 = _1878 * _1796;
    int _2580 = ~_2536;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    out.m_79.x = _2564;
    out.m_79.y = _2538;
    out.m_79.z = _2566;
    int _2586 = abs(_2570);
    bool _2588 = !_1960;
    int _2590 = _2588 ? 0 : 1;
    int _2592 = ~_2552;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = _2584 * as_type<int>(_2458);
    int _2600 = abs(_2590);
    int _2602 = _2596 * as_type<int>(_2450);
    int _2604 = _2602 + _2598;
    int _2606 = ~_2576;
    int _2608 = _2606 + 1;
    int _2610 = _2608 + 1;
    int _2612 = ~_2586;
    int _2614 = _2612 + 1;
    int _2616 = _2614 + 1;
    float _2618 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2620 = ~_2428;
    int _2622 = _2620 + _2500;
    int _2624 = _2622 + 1;
    int _2626 = _2610 * as_type<int>(_2480);
    int _2628 = _2626 + _2604;
    bool _2630 = _1358 <= 8000.0;
    bool _2632 = isnan(_1358);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan(8000.0);
    bool _2638 = _2634 || _2636;
    float _2640 = float(_2638);
    float _2642 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2618);
    int _2644 = _2616 * as_type<int>(_2488);
    int _2646 = _2644 + _2628;
    float _2648 = -_2528;
    float _2650 = _2648 + 1.0;
    int _2652 = _554 * _2624;
    int _2654 = _2652 + _1998;
    int _2656 = ~_2600;
    int _2658 = _2656 + 1;
    int _2660 = _2658 + 1;
    float _2662 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2642);
    float _2664 = fma(_2650, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2528);
    float _2666 = _1817 * _2578;
    bool _2668 = !_1825;
    int _2670 = _2668 ? _2654 : (-1);
    float _2672 = _2640 * _2664;
    int _2674 = _2646 * _2660;
    float _2676 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2662);
    float _2678 = fma(_1807, _2666, _1805);
    float _2680 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2682 = _2670 * _2600;
    int _2684 = _2682 + _2674;
    float _2686 = _1807 * _2578;
    out.gl_Position.x = _1760;
    out.gl_Position.y = _1762;
    out.gl_Position.z = _2676;
    out.gl_Position.w = _1714;
    float _2688 = _2574 * _2680;
    float _2690 = precise::clamp(_2688, 0.0, 1.0);
    bool _2692 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2694 = isnan(_1506);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2700 = _2696 || _2698;
    float _2702 = fma(_1813, _2686, _1801);
    float _2704 = float(_2684);
    float _2706 = -_2690;
    float _2708 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2710 = _1760 + _1714;
    float _2712 = fma(_1815, _2686, _1803);
    float _2714 = _2676 + _1714;
    float _2716 = _2708 * _2546;
    out.m_81.x = _2704;
    float _2718 = _1714 * 0.5;
    float _2720 = _2716 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2722 = -_1878;
    float _2724 = _2722 + 1.0;
    float _2726 = _2714 * 0.5;
    float _2728 = _2710 * 0.5;
    float _2730 = fma(_1762, -0.5, _2718);
    float _2732 = _1807 * _2724;
    out.m_83.x = _2720;
    float _2734 = _1414 * _1476;
    float _2736 = _2676;
    float _2738 = _2734;
    float _2740 = _2730;
    float _2742 = _2728;
    if (!_2700)
    {
        _2026 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2744 = _2026;
    out.m_85.x = _2702;
    out.m_85.y = _2712;
    out.m_85.z = _2678;
    out.m_85.w = _2732;
    float _2746 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2748 = _2744;
    float _2750 = _2744;
    if (!_2700)
    {
        _2736 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2752 = _2736;
    out.m_87.x = _2728;
    out.m_87.y = _2730;
    out.m_87.z = _2726;
    out.m_87.w = _1714;
    float _2754 = _2752;
    float _2756 = _2752;
    if (!_2700)
    {
        _2028 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2758 = _2028;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2700)
    {
        _2738 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2764 = _2738;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2700)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2770 = _2740;
    float _2772 = _2770;
    float _2774 = _2770;
    if (!_2700)
    {
        _2742 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2776 = _2742;
    bool _2778 = !_2700;
    float _2780 = _2776;
    float _2782 = _2776;
    if (!_2778)
    {
        bool _2784 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2786 = isnan(_1506);
        bool _2788 = _2784 || _2786;
        bool _2790 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2792 = _2788 || _2790;
        if (!_2792)
        {
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2796 = _1506 + _2794;
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2800 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2798;
            float _2802 = 1.0 / _2800;
            float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2824 = _2796 * _2802;
            float _2826 = precise::clamp(_2824, 0.0, 1.0);
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2832 = fma(_2826, _2806, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2834 = fma(_2826, _2830, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2836 = fma(_2826, _2810, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2838 = fma(_2826, _2814, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2840 = fma(_2826, _2818, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2842 = fma(_2826, _2822, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2782 = _2834;
            _2762 = _2840;
            _2774 = _2832;
            _2756 = _2838;
            _2750 = _2836;
            _2768 = _2842;
            _2844 = true;
        }
        else
        {
            bool _2846 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2848 = isnan(_1506);
            bool _2850 = _2846 || _2848;
            bool _2852 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2854 = _2850 || _2852;
            if (!_2854)
            {
                _2772 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2856 = _2772;
            _2774 = _2856;
            if (!_2854)
            {
                _2780 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2858 = _2780;
            _2782 = _2858;
            if (!_2854)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2860 = _2748;
            _2750 = _2860;
            if (!_2854)
            {
                _2754 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2862 = _2754;
            _2756 = _2862;
            if (!_2854)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2864 = _2760;
            _2762 = _2864;
            if (!_2854)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2866 = _2766;
            bool _2868 = !_2854;
            _2768 = _2866;
            if (!_2868)
            {
                bool _2870 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2872 = isnan(_1506);
                bool _2874 = _2870 || _2872;
                bool _2876 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2878 = _2874 || _2876;
                if (!_2878)
                {
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2882 = _1506 + _2880;
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2886 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2884;
                    float _2888 = 1.0 / _2886;
                    float _2890 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2892 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2896 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2900 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2910 = _2882 * _2888;
                    float _2912 = precise::clamp(_2910, 0.0, 1.0);
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2918 = fma(_2912, _2892, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2920 = fma(_2912, _2916, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2922 = fma(_2912, _2896, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2924 = fma(_2912, _2900, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2926 = fma(_2912, _2904, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2928 = fma(_2912, _2908, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2782 = _2920;
                    _2762 = _2926;
                    _2774 = _2918;
                    _2756 = _2924;
                    _2750 = _2922;
                    _2768 = _2928;
                    _2844 = true;
                }
                else
                {
                    _2782 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2774 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2756 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2844 = false;
    float _2930 = _2782;
    float _2932 = _2762;
    float _2934 = _2774;
    float _2936 = _2756;
    float _2938 = _2750;
    float _2940 = _2768;
    float _2942 = fma(_2538, -0.5, 0.5);
    float _2944 = precise::clamp(_2942, 0.0, 1.0);
    float _2946 = -_2930;
    float _2948 = _2946 + _2932;
    float _2950 = _2746 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2952 = -_2934;
    float _2954 = _2952 + _2936;
    float _2956 = fma(_2944, _2948, _2930);
    out.m_89.x = 0.0;
    float _2958 = -_2938;
    float _2960 = _2958 + _2940;
    float _2962 = fma(_2944, _2954, _2934);
    float _2964 = _2956 * 0.586610972881317138671875;
    out.m_53.x = _2950;
    bool _2966 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2968 = fma(_2944, _2960, _2938);
    float _2970 = fma(_2962, 0.298911988735198974609375, _2964);
    bool _2972 = _1414 > 0.0;
    bool _2974 = isnan(_1414);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan(0.0);
    bool _2980 = _2976 || _2978;
    float _2982 = fma(_2968, 0.114477999508380889892578125, _2970);
    bool _2984 = _1476 <= 0.0;
    bool _2986 = !_2980;
    bool _2988 = _2984 || _2986;
    float _2990 = -_2982;
    float _2992 = _2962 + _2990;
    float _2994 = -_2982;
    float _2996 = _2956 + _2994;
    float _2998 = -_2982;
    float _3000 = _2968 + _2998;
    float _3002 = fma(_2992, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3004 = fma(_2996, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3006 = fma(_3000, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    bool _3008 = !_2966;
    if (!_3008)
    {
        float _3010 = -_1340;
        float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3014 = -_1342;
        float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3018 = -_1344;
        float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3022 = _3012 * _3012;
        float _3024 = fma(_3016, _3016, _3022);
        float _3026 = fma(_3020, _3020, _3024);
        float _3028 = sqrt(_3026);
        float _3030 = rsqrt(_3026);
        float _3032 = -_3028;
        float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3036 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3038 = precise::clamp(_3036, 0.0, 1.0);
        float _3040 = _3016 * _3030;
        float _3042 = _3012 * _3030;
        float _3044 = abs(_3038);
        float _3046 = log2(_3044);
        float _3048 = _3020 * _3030;
        float _3050 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3052 = _2538 * _3042;
        float _3054 = -_3042;
        float _3056 = -_3050;
        float _3058 = fma(_3054, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3056);
        float _3060 = fma(_2564, _3040, _3052);
        float _3062 = -_3048;
        float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3058);
        float _3066 = fma(_2566, _3048, _3060);
        float _3068 = precise::clamp(_3066, 0.0, 1.0);
        float _3070 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3072 = _3064 + _3070;
        float _3074 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3076 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        float _3080 = exp2(_3074);
        float _3082 = _3080 * _3078;
        float _3084 = _3068 * _3082;
        float _3086 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3088 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3090 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3086;
        out.m_89.y = _3088;
        out.m_89.z = _3090;
    }
    out.m_91.x = _3002;
    out.m_91.y = _3004;
    out.m_91.z = _3006;
    if (!_2988)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3092 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3092;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

