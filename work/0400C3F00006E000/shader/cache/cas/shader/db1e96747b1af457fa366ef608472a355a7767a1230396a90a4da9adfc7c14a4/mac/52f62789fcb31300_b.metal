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
    float4 m_59 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_107 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 m_71 [[user(locn15)]];
    float4 m_75 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_97 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_79 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_73 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2297 = false;
    bool _1564 = false;
    bool _634 = false;
    bool _492 = false;
    bool _204 = false;
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
        float _2596 = as_type<float>(_142);
        out.gl_Position.z = _2596;
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
    float _162 = 0.0;
    float _164 = _160;
    if (_156)
    {
        float _166 = float(_126);
        _162 = _166;
    }
    float _168 = _162;
    bool _170 = _160 >= _168;
    bool _172 = !_156;
    bool _174 = _170 || _172;
    if (_174)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _136;
    if (_174)
    {
        out.m_51.x = 0.0;
    }
    if (_174)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_174)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2665 = as_type<float>(_180);
        out.gl_Position.z = _2665;
    }
    if (_174)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _184 = !_182;
    float _202;
    if (!_184)
    {
        float _186 = in.m_55.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        float _206 = float(_126);
        float _208 = 1.0 / _206;
        float _210 = _160 * _208;
        _202 = _210;
    }
    _204 = false;
    float _212 = _202;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = _212 + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _212 + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _212 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _242 = 1.0 / _228;
    float _244 = 1.0 / _232;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _248 = 1.0 / _240;
    float _250 = _216 * _242;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _254 = _212 + _252;
    float _256 = 1.0 / _236;
    float _258 = _220 * _244;
    bool _260 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _262 = isnan(_212);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_270;
    float _274 = _272 + 1.0;
    float _276 = _254 * _248;
    bool _278 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _280 = isnan(_212);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    bool _290 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_212);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = _288 * _274;
    float _304 = -_288;
    float _306 = _304 + 1.0;
    float _308 = _224 * _256;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    bool _322 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _324 = isnan(_212);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = _300 * _306;
    float _336 = -_300;
    float _338 = _336 + 1.0;
    float _340 = fma(_312, _250, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = fma(_316, _250, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_320, _250, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _346 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _348 = isnan(_212);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_332;
    float _360 = _358 + 1.0;
    float _362 = _332 * _338;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _376 = _356 * _360;
    float _378 = fma(_366, _258, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _380 = fma(_370, _258, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _382 = fma(_374, _258, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _384 = _340 * _376;
    float _386 = _342 * _376;
    float _388 = -_356;
    float _390 = _388 + 1.0;
    float _392 = _344 * _376;
    float _394 = in.m_57.x;
    float _396 = in.m_57.y;
    float _398 = in.m_57.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _400;
    float _404 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _384);
    float _406 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _386);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _412;
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _392);
    float _418 = fma(_378, _362, _404);
    float _420 = fma(_380, _362, _406);
    float _422 = fma(_402, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _424 = fma(_410, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _426 = fma(_414, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _440 = fma(_382, _362, _416);
    float _442 = fma(_430, _276, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _444 = fma(_434, _276, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _446 = fma(_438, _276, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _448 = fma(_422, _334, _418);
    float _450 = fma(_424, _334, _420);
    float _452 = fma(_426, _334, _440);
    float _454 = fma(_442, _302, _448);
    float _456 = fma(_444, _302, _450);
    float _458 = fma(_446, _302, _452);
    float _460 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[147].x, _454);
    float _462 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[147].y, _456);
    float _464 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[147].z, _458);
    float _466 = _460 * _394;
    float _468 = _462 * _396;
    float _470 = _464 * _398;
    bool _472 = !_246;
    float _490;
    if (!_472)
    {
        float _474 = in.m_55.x;
        float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _478 = _474 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _482 = _480 * _476;
        float _484 = floor(_482);
        float _486 = -_484;
        float _488 = _482 + _486;
        _490 = _488;
        _492 = true;
    }
    else
    {
        float _494 = float(_126);
        float _496 = 1.0 / _494;
        float _498 = _160 * _496;
        _490 = _498;
    }
    _492 = false;
    float _500 = _490;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _500 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _512 = isnan(_500);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _528 = isnan(_500);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _538;
    bool _542 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_500);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = 1.0 / _508;
    float _556 = -_520;
    float _558 = _556 + 1.0;
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _562 = 1.0 / _524;
    float _564 = _540 * _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _570 = -_552;
    float _572 = _570 + 1.0;
    float _574 = fma(_564, _504, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _536 * _558;
    float _578 = -_536;
    float _580 = _578 + 1.0;
    float _582 = _520 * _572;
    float _584 = _568 * _562;
    float _586 = _574 * _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _590 = _500 + _588;
    float _592 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _594 = fma(_584, _590, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _598 = fma(_594, _582, _592);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _598);
    float _606 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _606;
    out.m_59.y = _608;
    out.m_59.z = _610;
    out.m_59.w = _612;
    bool _614 = !_560;
    float _632;
    if (!_614)
    {
        float _616 = in.m_55.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_126);
        float _638 = 1.0 / _636;
        float _640 = _160 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = in.m_48.x;
    float _646 = in.m_48.y;
    float _648 = in.m_48.z;
    float _650 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _652 = in.m_61.x;
    float _654 = in.m_61.y;
    float _656 = in.m_61.z;
    float _658 = in.m_61.w;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _662 = _660 != 0;
    float _664 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _666 = in.m_63.y;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _674 = _672 != 0;
    float _676 = in.m_55.w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _682 = _680 != 0;
    float _684 = in.m_65.x;
    float _686 = in.m_65.y;
    float _688 = in.m_65.z;
    float _690 = in.m_65.w;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _694 = _692 != 0;
    bool _696 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _698 = isnan(_642);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = in.m_55.x;
    float _710 = in.m_67.x;
    float _712 = in.m_67.y;
    float _714 = in.m_67.z;
    float _716 = in.m_67.w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _720 = in.m_69.z;
    float _722 = _646 * _654;
    float _724 = in.m_55.z;
    float _726 = -_666;
    float _728 = _726 + 1.0;
    float _730 = fma(_644, _652, _722);
    float _732 = in.m_55.y;
    bool _734 = _676 > 0.5;
    float _736 = fma(_648, _656, _730);
    float _738 = in.m_69.x;
    float _740 = _646 * _686;
    int _742 = _734 ? as_type<int>(_728) : as_type<int>(_666);
    float _744 = in.m_69.y;
    float _746 = _708 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _748 = fma(_644, _684, _740);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _754 = in.m_69.w;
    float _756 = _646 * _712;
    float _758 = _670 ? as_type<float>(_742) : _666;
    float _760 = -_678;
    float _762 = fma(_746, 2.0, _760);
    out.m_71.z = _720;
    float _764 = 1.0 / _752;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _768 = _766 != 0;
    float _770 = in.m_63.x;
    bool _772 = _724 > 0.5;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _778 = 0.0;
    float _780 = _724;
    float _782 = _666;
    float _784 = _690;
    float _786 = _762;
    if (!_662)
    {
        _778 = _724;
    }
    float _788 = _778;
    float _790 = 0.0;
    float _792 = _788;
    if (!_662)
    {
        _790 = _732;
    }
    float _794 = _790;
    bool _796 = _732 > 0.5;
    out.m_71.x = _738;
    float _798 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _800 = _794;
    if (_662)
    {
        _800 = _708;
    }
    float _802 = _800;
    out.m_71.y = _744;
    if (_662)
    {
        _780 = _732;
    }
    float _804 = _780;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _808 = as_type<int>(_804);
    if (_662)
    {
        _792 = _732;
    }
    float _810 = _792;
    float _812 = in.m_73.x;
    float _814 = in.m_73.y;
    float _816 = in.m_73.z;
    float _818 = in.m_73.w;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _822 = _820 != 0;
    float _824 = fma(_644, _710, _756);
    int _826 = _796 ? as_type<int>(_728) : as_type<int>(_666);
    float _828 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[78].z, _806);
    out.m_71.w = _754;
    float _830 = _822 ? as_type<float>(_826) : _666;
    float _832 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].z, _718);
    bool _834 = _822;
    if (_674)
    {
        bool _836 = _708 > 0.5;
        _834 = _836;
    }
    bool _838 = _834;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _842 = 1.0 / _776;
    float _844 = fma(_798, -2.0, _840);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    if (_768)
    {
        float _850 = _772 ? _728 : _666;
        _782 = _850;
    }
    float _852 = _782;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _854;
    float _858 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _844);
    float _860 = 1.0 / _848;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _866 = _856 * _764;
    float _868 = fma(_648, _714, _824);
    float _870 = fma(_648, _688, _748);
    float _872 = _814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _874 = _814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _876 = _864 * _842;
    float _878 = _814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _882;
    float _886 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _872);
    float _888 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _878);
    float _890 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _874);
    float _892 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _880);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _896 = _642 + _894;
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _900 = _884 * _860;
    float _902 = _868 + _716;
    float _904 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[24].z, _888);
    float _906 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[25].z, _886);
    float _908 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _912 = _642 + _910;
    float _914 = fma(_866, _896, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _916 = _736 + _658;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _920 = _902 + _918;
    out.m_75.x = _904;
    out.m_75.y = _906;
    out.m_75.z = _908;
    float _922 = fma(_876, _912, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _924 = _870 + _690;
    float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _930 = _916 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _934 = _642 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = _924 + _936;
    bool _940 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _942 = isnan(_642);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _954 = fma(_900, _934, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _956 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _828);
    float _958 = _920 * _920;
    float _960 = _898 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _962 = _818;
    float _964 = _924;
    float _966 = _916;
    if (!_674)
    {
        _784 = _770;
    }
    float _968 = _784;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _972 = fma(_930, _930, _958);
    float _974 = fma(_960, _830, -0.5);
    float _976 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _892);
    float _978 = _926 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _980 = fma(_938, _938, _972);
    float _982 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[83].w, _970);
    float _984 = -_858;
    float _986 = fma(_976, _974, _984);
    float _988 = fma(_758, _978, -0.5);
    float _990 = sqrt(_980);
    bool _992 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _994 = isnan(_642);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -_950;
    float _1006 = _1004 + 1.0;
    bool _1008 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1010 = isnan(_642);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1022 = in.m_77.x;
    float _1024 = in.m_77.y;
    float _1026 = in.m_77.z;
    float _1028 = -_1002;
    float _1030 = _1028 + 1.0;
    float _1032 = _852 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1034 = rsqrt(_980);
    float _1036 = _1018 * _1006;
    float _1038 = -_1018;
    float _1040 = _1038 + 1.0;
    float _1042 = _1020 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1044 = _1002 * _1040;
    float _1046 = _706 * _1030;
    float _1048 = _990 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1050 = -_706;
    float _1052 = _1050 + 1.0;
    float _1054 = _914 * _1046;
    float _1056 = precise::min(_1042, _1048);
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1060 = in.m_79.x;
    float _1062 = in.m_79.y;
    float _1064 = in.m_79.z;
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1054);
    float _1068 = _1034 * _1056;
    float _1070 = -_1058;
    float _1072 = fma(_952, 2.0, _1070);
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1076 = _1024 != 0.0;
    bool _1078 = isnan(_1024);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = _920 * _1068;
    float _1088 = _930 * _1068;
    float _1090 = -_160;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1072);
    bool _1094 = _1022 == 0.0;
    bool _1096 = !_1084;
    bool _1098 = _1094 && _1096;
    float _1100 = -_1086;
    float _1102 = _920 + _1100;
    float _1104 = -_1088;
    float _1106 = _930 + _1104;
    float _1108 = _804 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1110 = _1026 == 0.0;
    bool _1112 = _1110 && _1098;
    float _1114 = _1102 * _1102;
    float _1116 = _1108;
    float _1118 = _968;
    int _1120 = as_type<int>(_1114);
    float _1122 = _1074;
    float _1124 = _982;
    if (_674)
    {
        float _1126 = -_770;
        float _1128 = _1126 + 1.0;
        _808 = as_type<int>(_1128);
    }
    int _1130 = _808;
    float _1132 = fma(_1108, -2.0, _1074);
    int _1134 = _1130;
    if (!_682)
    {
        _1116 = _770;
    }
    float _1136 = _1116;
    float _1138 = fma(_1106, _1106, _1114);
    float _1140 = _938 * _1068;
    float _1142 = _1136;
    float _1144 = _1138;
    if (_674)
    {
        float _1146 = _838 ? as_type<float>(_1130) : _770;
        _1118 = _1146;
    }
    float _1148 = _1118;
    if (_682)
    {
        float _1150 = -_770;
        float _1152 = _1150 + 1.0;
        _1134 = as_type<int>(_1152);
    }
    int _1154 = _1134;
    float _1156 = as_type<float>(_1154);
    if (_694)
    {
        float _1158 = -_770;
        float _1160 = _1158 + 1.0;
        _1120 = as_type<int>(_1160);
    }
    int _1162 = _1120;
    float _1164 = -_1140;
    float _1166 = _938 + _1164;
    if (!_694)
    {
        _1122 = _770;
    }
    float _1168 = _1122;
    float _1170 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1132);
    float _1172 = _1168;
    if (_682)
    {
        float _1174 = _772 ? as_type<float>(_1154) : _770;
        _1142 = _1174;
    }
    float _1176 = _1142;
    float _1178 = fma(_1166, _1166, _1138);
    float _1180 = _1062;
    if (_1112)
    {
        _1156 = _1060;
    }
    float _1182 = _1156;
    float _1184 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _832);
    float _1186 = _1182;
    if (_694)
    {
        float _1188 = _796 ? as_type<float>(_1162) : _770;
        _1172 = _1188;
    }
    float _1190 = _1172;
    float _1192 = sqrt(_1178);
    float _1194 = -_160;
    float _1196 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[76].x, _762);
    float _1198 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _982);
    if (_1112)
    {
        _164 = _1182;
    }
    float _1200 = _164;
    float _1202 = fma(_922, _1044, _1066);
    float _1204 = _1200;
    if (!_1112)
    {
        _1186 = _1060;
    }
    float _1206 = _1186;
    float _1208 = -_1170;
    float _1210 = fma(_1198, _988, _1208);
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1112)
    {
        _1144 = _1062;
    }
    float _1214 = _1144;
    float _1216 = fma(_954, _1036, _1202);
    float _1218 = _1214;
    if (_1112)
    {
        _1124 = _1064;
    }
    float _1220 = _1124;
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1024);
    float _1224 = _1220;
    if (_1112)
    {
        _786 = _1214;
    }
    float _1226 = _786;
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1022);
    float _1230 = _1226;
    if (!_1112)
    {
        _1218 = _1062;
    }
    float _1232 = _1218;
    float _1234 = _1034 * _1192;
    if (_1112)
    {
        _1180 = _1220;
    }
    float _1236 = _1180;
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1240 = _1236;
    if (!_1112)
    {
        _1224 = _1064;
    }
    float _1242 = _1224;
    float _1244 = _650 * _1234;
    float _1246 = _1020 * _1234;
    float _1248 = _664 * _1234;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1026);
    float _1252 = _1244 * _1222;
    float _1254 = _1246 * _1228;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1258 = _1248 * _1250;
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1262 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1112)
    {
        float _1264 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1232);
        _1230 = _1264;
    }
    float _1266 = _1230;
    if (!_1112)
    {
        float _1268 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1206);
        _1204 = _1268;
    }
    float _1270 = _1204;
    float _1272 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1260);
    float _1274 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1262);
    float _1276 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1278 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1272);
    float _1282 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1274);
    float _1284 = fma(_1276, _1176, -0.5);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1290 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1292 = fma(_1278, _1148, -0.5);
    float _1294 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1296 = _924 + _1288;
    float _1298 = _916 + _1290;
    float _1300 = fma(_956, _1292, _1196);
    float _1302 = _816 * _1206;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1306 = _1296 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1310 = _1298 + _1308;
    float _1312 = _1298;
    float _1314 = _1296;
    if (!_1112)
    {
        float _1316 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1242);
        _1240 = _1316;
    }
    float _1318 = _1240;
    float _1320 = fma(_1184, _1284, _1092);
    float _1322 = _1306 * _1306;
    float _1324 = -_1302;
    float _1326 = fma(_812, _1242, _1324);
    float _1328 = _814 * _1242;
    float _1330 = _1032 * _1286;
    float _1332 = fma(_1310, _1310, _1322);
    float _1334 = _1294 * _1256;
    float _1336 = _986 + 0.5;
    float _1338 = _1210 + 0.5;
    float _1340 = sqrt(_1332);
    float _1342 = _1320 + 0.5;
    float _1344 = _1300 + 0.5;
    float _1346 = _812 * _1232;
    float _1348 = -_1328;
    float _1350 = fma(_816, _1232, _1348);
    float _1352 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_81.x = _1334;
    out.m_81.y = _1330;
    float _1354 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1356 = -_1346;
    float _1358 = fma(_814, _1206, _1356);
    float _1360 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1352);
    out.m_83.x = _1344;
    out.m_83.y = _1336;
    out.m_83.z = _1342;
    out.m_83.w = _1338;
    float _1362 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1364 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1360);
    float _1368 = _1326 * _818;
    float _1370 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1362);
    bool _1372 = _1340 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1376 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1354);
    float _1378 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1364);
    float _1380 = _1350 * _818;
    float _1382 = _902 + _1374;
    float _1384 = _1358 * _818;
    float _1386 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1216);
    float _1388 = _1318;
    if (!_1372)
    {
        _962 = _1382;
    }
    float _1390 = _962;
    bool _1392 = !_1372;
    float _1394 = _1390;
    if (!_1392)
    {
        float _1396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1400 = _1340 + _1398;
        float _1402 = _1382 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = rsqrt(_1332);
        float _1406 = _1400 * _1396;
        float _1408 = _1406 * 0.15915493667125701904296875;
        float _1410 = _1408 * 6.283185482025146484375;
        float _1412 = cos(_1410);
        float _1414 = _1408 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        float _1418 = _1412 + (-1.0);
        float _1420 = fma(_1416, _1402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1422 = _1418 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1424 = _1404 * _1420;
        float _1426 = fma(_1382, _1412, _1422);
        float _1428 = fma(_1310, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1430 = fma(_1306, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1394 = _1426;
        _1312 = _1428;
        _1314 = _1430;
    }
    float _1432 = _1394;
    float _1434 = _1312;
    float _1436 = _1314;
    float _1438 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1440 = -_1086;
    float _1442 = _1440 + _1432;
    float _1444 = -_1088;
    float _1446 = _1444 + _1434;
    float _1448 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1450 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1438);
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1454 = _1442 + _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1458 = _1446 + _1456;
    float _1460 = -_1140;
    float _1462 = _1460 + _1436;
    float _1464 = _1454 * _1454;
    float _1466 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1448);
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1470 = _1462 + _1468;
    float _1472 = fma(_1458, _1458, _1464);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1476 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1478 = fma(_1470, _1470, _1472);
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1484 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1476);
    float _1486 = sqrt(_1478);
    float _1488 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1450);
    float _1490 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1492 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1484);
    float _1494 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1376);
    float _1496 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1386 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1502 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1504 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1370);
    float _1506 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1378);
    out.m_85.w = _1056;
    float _1508 = -_1088;
    float _1510 = _916 + _1508;
    float _1512 = -_1086;
    float _1514 = _902 + _1512;
    out.m_87.x = _1490;
    out.m_87.y = _1496;
    out.m_87.z = _1498;
    out.m_87.w = _1500;
    bool _1516 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1518 = isnan(_1486);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1524 = _1520 || _1522;
    float _1526 = -_1140;
    float _1528 = _924 + _1526;
    out.m_89.x = _1492;
    out.m_89.y = _1488;
    out.m_89.z = _1502;
    out.m_91.x = _1246;
    out.m_93.x = _1504;
    out.m_93.y = _1494;
    out.m_93.z = _1506;
    if (!_1524)
    {
        _1388 = 1.0;
    }
    float _1530 = _1388;
    bool _1532 = !_1524;
    float _1534 = _1530;
    if (!_1532)
    {
        bool _1536 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1538 = isnan(_1486);
        bool _1540 = _1536 || _1538;
        bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1544 = _1540 || _1542;
        if (!_1544)
        {
            float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1548 = _1486 + _1546;
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1552 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1550;
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1558 = 1.0 / _1552;
            float _1560 = _1548 * _1558;
            float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1534 = _1562;
            _1564 = true;
        }
        else
        {
            bool _1566 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1568 = isnan(_1486);
            bool _1570 = _1566 || _1568;
            bool _1572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1574 = _1570 || _1572;
            if (!_1574)
            {
                float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1578 = _1486 + _1576;
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1582 = _1580 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1586 = _1584 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1588 = 1.0 / _1582;
                float _1590 = _1578 * _1588;
                float _1592 = fma(_1590, _1586, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1534 = _1592;
                _1564 = true;
            }
            else
            {
                _1534 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1564 = false;
    float _1594 = _1534;
    float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1598 = _1442 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1602 = _1446 + _1600;
    float _1604 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1608 = _1462 + _1606;
    float _1610 = fma(_1602, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1614 = _1604 + _1612;
    float _1616 = fma(_1608, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1620 = _1610 + _1618;
    float _1622 = _1614 * _1614;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1626 = _1616 + _1624;
    float _1628 = fma(_1620, _1620, _1622);
    float _1630 = fma(_1626, _1626, _1628);
    float _1632 = rsqrt(_1630);
    float _1634 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1636 = _1620 * _1634;
    float _1638 = _1626 * _1634;
    float _1640 = _1636 * _1636;
    float _1642 = _1638 * _1638;
    float _1644 = _1640 + _1642;
    float _1646 = sqrt(_1644);
    bool _1648 = _1646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1646 + _1650;
    float _1654 = _1632;
    float _1656 = _1652;
    float _1658 = _1614;
    if (_1648)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1660;
    }
    float _1662 = _1654;
    if (_1648)
    {
        float _1664 = rsqrt(_1644);
        _964 = _1664;
    }
    float _1666 = _964;
    float _1668 = _1666;
    if (_1648)
    {
        float _1670 = _1652 * _1662;
        _1656 = _1670;
    }
    float _1672 = _1656;
    float _1674 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1648)
    {
        float _1676 = _1672 * 0.15915493667125701904296875;
        _966 = _1676;
    }
    float _1678 = _966;
    float _1680 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1674);
    float _1682 = _1626;
    float _1684 = _1678;
    if (_1648)
    {
        float _1686 = _1678 * 6.283185482025146484375;
        float _1688 = sin(_1686);
        _1682 = _1688;
    }
    float _1690 = _1682;
    float _1692 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1694 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1680);
    float _1696 = precise::max(0.0, _1692);
    float _1698 = _1086;
    float _1700 = _1696;
    float _1702 = _1692;
    if (_1648)
    {
        float _1704 = _1678 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        _1698 = _1706;
    }
    float _1708 = _1698;
    float _1710 = -_1634;
    float _1712 = -_1696;
    float _1714 = fma(_1614, _1710, _1712);
    if (_1648)
    {
        float _1716 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1700 = _1716;
    }
    float _1718 = _1700;
    float _1720 = _1718;
    if (!_1648)
    {
        _1684 = _1636;
    }
    float _1722 = _1684;
    float _1724 = _1690;
    float _1726 = _1722;
    if (_1648)
    {
        float _1728 = fma(_1690, _1718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1720 = _1728;
    }
    float _1730 = _1720;
    float _1732 = _1730;
    if (!_1648)
    {
        _1724 = _1714;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (_1648)
    {
        float _1738 = _1708 + (-1.0);
        _1702 = _1738;
    }
    float _1740 = _1702;
    float _1742 = _1740;
    if (_1648)
    {
        float _1744 = _1666 * _1730;
        _1658 = _1744;
    }
    float _1746 = _1658;
    float _1748 = _1746;
    if (!_1648)
    {
        _1668 = _1638;
    }
    float _1750 = _1668;
    float _1752 = _1750;
    if (_1648)
    {
        float _1754 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1742 = _1754;
    }
    float _1756 = _1742;
    if (_1648)
    {
        float _1758 = _1636 * _1746;
        _1726 = _1758;
    }
    float _1760 = _1726;
    if (_1648)
    {
        float _1762 = _1638 * _1746;
        _1752 = _1762;
    }
    float _1764 = _1752;
    if (!_1648)
    {
        _1732 = _1640;
    }
    float _1766 = _1732;
    float _1768 = _1766;
    if (_1648)
    {
        float _1770 = fma(_1714, _1708, _1756);
        _1736 = _1770;
    }
    float _1772 = _1736;
    if (_1648)
    {
        float _1774 = _1760 * _1760;
        _1768 = _1774;
    }
    float _1776 = _1768;
    if (!_1648)
    {
        _1748 = _1642;
    }
    float _1778 = _1748;
    float _1780 = sqrt(_1630);
    float _1782 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1784 = _1778;
    if (_1648)
    {
        float _1786 = _1764 * _1764;
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = fma(_1772, _1772, _1776);
    float _1792 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = _1790 + _1788;
    float _1796 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1798 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1800 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1802 = rsqrt(_1794);
    float _1804 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1806 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1798);
    float _1808 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1800);
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1812 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1810);
    float _1814 = precise::clamp(_1812, 0.0, 1.0);
    float _1816 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1804);
    float _1818 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1806);
    float _1820 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1808);
    float _1822 = -_1814;
    float _1824 = _1822 + 1.0;
    float _1826 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1828 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1830 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1832 = floor(_1782);
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1838 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1840 = _1802 * _1760;
    float _1842 = _1802 * _1764;
    float _1844 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1836);
    float _1846 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1848 = abs(_1824);
    float _1850 = log2(_1848);
    float _1852 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1854 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1856 = _1802 * _1772;
    float _1858 = -_1838;
    float _1860 = fma(_1858, _1834, 1.0);
    float _1862 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1854);
    float _1864 = -_1852;
    float _1866 = fma(_1856, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1864);
    float _1868 = floor(_1796);
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1872 = -_1832;
    float _1874 = _1782 + _1872;
    float _1876 = -_1842;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1866);
    float _1880 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1882 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1870);
    float _1884 = fma(_1878, -0.5, 0.5);
    float _1886 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1888 = log2(_1860);
    float _1890 = fma(_1878, 0.5, 0.5);
    float _1892 = _1856 + 1.0;
    float _1894 = -_1868;
    float _1896 = _1796 + _1894;
    float _1898 = exp2(_1886);
    float _1900 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1880);
    float _1902 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1882);
    float _1904 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1900);
    float _1906 = sqrt(_1884);
    float _1908 = fma(_1890, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1910 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1904);
    float _1912 = _1888 * 0.693147182464599609375;
    float _1914 = fma(_1890, _1908, -0.212114393711090087890625);
    float _1916 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1918 = 1.0 / _1862;
    float _1920 = -_1856;
    float _1922 = fma(_1898, _1892, _1920);
    float _1924 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1902);
    float _1926 = fma(_1890, _1914, 1.570728778839111328125);
    float _1928 = _1906 * 0.636619746685028076171875;
    float _1930 = -_1926;
    float _1932 = fma(_1928, _1930, 1.0);
    float _1934 = fma(_1922, 0.5, 0.5);
    float _1936 = _1910 * _1918;
    float _1938 = _1924 * _1918;
    float _1940 = fma(_1936, 0.5, 0.5);
    float _1942 = fma(_1938, -0.5, 0.5);
    float2 _5643 = float2(_1874, _1896);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5643, float2(0.0), isnan(_5643)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5643, float2(0.0), isnan(_5643)), level(0.0)).x;
    float3 _5654 = float3(_1940, _1942, _1916);
    float _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5654, float3(0.0), isnan(_5654)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5654, float3(0.0), isnan(_5654)), level(0.0)).x;
    float3 _5665 = float3(_1940, _1942, _1916);
    float4 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5665, float3(0.0), isnan(_5665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5665, float3(0.0), isnan(_5665)), level(0.0)).xyzw;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _1949.w;
    float2 _5681 = float2(_1932, _1934);
    float3 _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5681, float2(0.0), isnan(_5681)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5681, float2(0.0), isnan(_5681)), level(0.0)).xyz;
    float _1963 = _1961.x;
    float _1965 = _1961.y;
    float _1967 = _1961.z;
    float _1969 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1971 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_95.x = _1510;
    out.m_95.y = _1514;
    out.m_95.z = _1528;
    float _1973 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1969);
    float _1975 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1971);
    float _1977 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1973);
    float _1979 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1981 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1975);
    float _1983 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1985 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1979);
    float _1987 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1989 = 1.0 / _1983;
    float _1991 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1985);
    float _1993 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1995 = _1862 * 0.5;
    out.gl_Position.x = _1910;
    out.gl_Position.y = _1924;
    out.gl_Position.z = _1987;
    out.gl_Position.w = _1862;
    float _1997 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1999 = exp2(_1993);
    float _2001 = _1997 + _1983;
    float _2003 = _2001 * _1989;
    float _2005 = _2003 * 0.5;
    float _2007 = _1910 + _1862;
    float _2009 = fma(_1924, -0.5, _1995);
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2013 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2011);
    float _2015 = _2007 * 0.5;
    float _2017 = 1.0 / _2013;
    bool _2019 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan(0.5);
    bool _2027 = _2023 || _2025;
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2031 = _2017 * _2029;
    float _2033 = abs(_2031);
    float _2035 = log2(_2033);
    bool _2037 = _2031 <= 8000.0;
    bool _2039 = isnan(_2031);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(8000.0);
    bool _2045 = _2041 || _2043;
    float _2047 = float(_2045);
    float _2049 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2051 = exp2(_2049);
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2055 = precise::clamp(_2053, 0.0, 1.0);
    float _2057 = fma(_2055, -2.0, 3.0);
    float _2059 = _2055 * _2055;
    float _2061 = _2059 * _2057;
    float _2063 = in.m_97.x;
    float _2065 = -_2061;
    float _2067 = _2065 + 1.0;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2061);
    float _2071 = _2047 * _2069;
    float _2073 = _1987 + _1862;
    float _2075 = _2073 * 0.5;
    float _2077 = _2073;
    float _2079 = _2075;
    float _2081 = _2015;
    if (_2027)
    {
        _2077 = 1.0;
    }
    float _2083 = _2077;
    float _2085 = _2083;
    float _2087 = _1953;
    float _2089 = _1951;
    if (!_2027)
    {
        float _2091 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = _2093 * 6.283185482025146484375;
        float _2097 = cos(_2095);
        float _2099 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2101 = _2099 * 0.15915493667125701904296875;
        float _2103 = _2093 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = 1.0 / _2097;
        float _2109 = _2101 * 6.283185482025146484375;
        float _2111 = cos(_2109);
        float _2113 = _2105 * _2107;
        float _2115 = _2101 * 6.283185482025146484375;
        float _2117 = sin(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = 1.0 / _2119;
        float _2123 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2125 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2123;
        float _2127 = 1.0 / _2125;
        float _2129 = _2117 * _2121;
        float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2133 = fma(_2031, _2129, _2131);
        float _2135 = _2133 * _2127;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        _2085 = _2137;
    }
    float _2139 = _2085;
    float _2141 = -_1999;
    float _2143 = _2141 + 1.0;
    float _2145 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2147 = -_1944;
    float _2149 = _2147 + 1.0;
    float _2151 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_99.x = _2015;
    out.m_99.y = _2009;
    out.m_99.z = _2075;
    out.m_99.w = _1862;
    float _2153 = _2149 * _2145;
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    bool _2157 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2159 = isnan(_1780);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2165 = _2161 || _2163;
    float _2167 = _2151 * _1946;
    float _2169 = -_2151;
    float _2171 = _2169 + 1.0;
    float _2173 = -_2155;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_101.x = _1610;
    out.m_101.y = _1604;
    out.m_101.z = _1616;
    float _2177 = _1957 * _2167;
    float _2179 = _1967 * _2167;
    float _2181 = _2175 * _2063;
    float _2183 = _1957 * _2171;
    float _2185 = fma(_1963, _2177, _1951);
    float _2187 = fma(_1965, _2177, _1953);
    float _2189 = fma(_1957, _2179, _1955);
    float _2191 = _2181 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2193 = _2167;
    float _2195 = _2181;
    if (!_2165)
    {
        _2087 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2197 = _2087;
    float _2199 = _2139 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2185;
    out.m_103.y = _2187;
    out.m_103.z = _2189;
    out.m_103.w = _2183;
    float _2201 = _2197;
    float _2203 = _2197;
    if (!_2165)
    {
        _2079 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2205 = _2079;
    float _2207 = _2205;
    float _2209 = _2205;
    if (!_2165)
    {
        _2081 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2211 = _2081;
    out.m_105.x = _2191;
    float _2213 = _2211;
    float _2215 = _2211;
    if (!_2165)
    {
        _2089 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2217 = _2089;
    float _2219 = _2217;
    float _2221 = _2217;
    if (!_2165)
    {
        _2193 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2223 = _2193;
    float _2225 = _2223;
    float _2227 = _2223;
    if (!_2165)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2229 = _2195;
    bool _2231 = !_2165;
    float _2233 = _2229;
    float _2235 = _2229;
    if (!_2231)
    {
        bool _2237 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2239 = isnan(_1780);
        bool _2241 = _2237 || _2239;
        bool _2243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2245 = _2241 || _2243;
        if (!_2245)
        {
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2249 = _1780 + _2247;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2253 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2251;
            float _2255 = 1.0 / _2253;
            float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2277 = _2249 * _2255;
            float _2279 = precise::clamp(_2277, 0.0, 1.0);
            float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2285 = fma(_2279, _2259, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2287 = fma(_2279, _2283, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2289 = fma(_2279, _2263, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2291 = fma(_2279, _2267, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2293 = fma(_2279, _2271, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2295 = fma(_2279, _2275, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2209 = _2285;
            _2227 = _2293;
            _2203 = _2287;
            _2221 = _2291;
            _2215 = _2289;
            _2235 = _2295;
            _2297 = true;
        }
        else
        {
            bool _2299 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2301 = isnan(_1780);
            bool _2303 = _2299 || _2301;
            bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2307 = _2303 || _2305;
            if (!_2307)
            {
                _2201 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2309 = _2201;
            _2203 = _2309;
            if (!_2307)
            {
                _2207 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2311 = _2207;
            _2209 = _2311;
            if (!_2307)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2313 = _2213;
            _2215 = _2313;
            if (!_2307)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2315 = _2219;
            _2221 = _2315;
            if (!_2307)
            {
                _2225 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2317 = _2225;
            _2227 = _2317;
            if (!_2307)
            {
                _2233 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2319 = _2233;
            bool _2321 = !_2307;
            _2235 = _2319;
            if (!_2321)
            {
                bool _2323 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2325 = isnan(_1780);
                bool _2327 = _2323 || _2325;
                bool _2329 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2331 = _2327 || _2329;
                if (!_2331)
                {
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2335 = _1780 + _2333;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2337;
                    float _2341 = 1.0 / _2339;
                    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2357 = _2355 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2363 = _2335 * _2341;
                    float _2365 = precise::clamp(_2363, 0.0, 1.0);
                    float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2371 = fma(_2365, _2345, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2373 = fma(_2365, _2369, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2375 = fma(_2365, _2349, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2377 = fma(_2365, _2353, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2379 = fma(_2365, _2357, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2381 = fma(_2365, _2361, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2209 = _2371;
                    _2227 = _2379;
                    _2203 = _2373;
                    _2221 = _2377;
                    _2215 = _2375;
                    _2235 = _2381;
                    _2297 = true;
                }
                else
                {
                    _2209 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2227 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2203 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2235 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2297 = false;
    float _2383 = _2209;
    float _2385 = _2227;
    float _2387 = _2203;
    float _2389 = _2221;
    float _2391 = _2215;
    float _2393 = _2235;
    float _2395 = fma(_1494, -0.5, 0.5);
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = -_2383;
    float _2401 = _2399 + _2385;
    float _2403 = _2199 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2405 = -_2387;
    float _2407 = _2405 + _2389;
    out.m_107.x = 0.0;
    float _2409 = fma(_2397, _2401, _2383);
    float _2411 = fma(_2397, _2407, _2387);
    out.m_51.x = _2403;
    float _2413 = -_2391;
    float _2415 = _2413 + _2393;
    float _2417 = _2409 * 0.586610972881317138671875;
    bool _2419 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2421 = fma(_2397, _2415, _2391);
    float _2423 = fma(_2411, 0.298911988735198974609375, _2417);
    bool _2425 = _2139 > 0.0;
    bool _2427 = isnan(_2139);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = fma(_2421, 0.114477999508380889892578125, _2423);
    float _2437 = -_2435;
    float _2439 = _2411 + _2437;
    float _2441 = -_2435;
    float _2443 = _2409 + _2441;
    float _2445 = -_2435;
    float _2447 = _2421 + _2445;
    float _2449 = fma(_2439, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2435);
    float _2451 = fma(_2443, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2435);
    float _2453 = fma(_2447, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2435);
    bool _2455 = !_2419;
    if (!_2455)
    {
        float _2457 = -_1604;
        float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2461 = -_1610;
        float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2465 = -_1616;
        float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2469 = _2459 * _2459;
        float _2471 = fma(_2463, _2463, _2469);
        float _2473 = fma(_2467, _2467, _2471);
        float _2475 = sqrt(_2473);
        float _2477 = rsqrt(_2473);
        float _2479 = -_2475;
        float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2483 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2485 = precise::clamp(_2483, 0.0, 1.0);
        float _2487 = _2463 * _2477;
        float _2489 = _2459 * _2477;
        float _2491 = abs(_2485);
        float _2493 = log2(_2491);
        float _2495 = _2467 * _2477;
        float _2497 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2499 = _1494 * _2489;
        float _2501 = -_2489;
        float _2503 = -_2497;
        float _2505 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2503);
        float _2507 = fma(_1504, _2487, _2499);
        float _2509 = -_2495;
        float _2511 = fma(_2509, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2505);
        float _2513 = fma(_1506, _2495, _2507);
        float _2515 = precise::clamp(_2513, 0.0, 1.0);
        float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2519 = _2511 + _2517;
        float _2521 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2523 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2525 = precise::clamp(_2523, 0.0, 1.0);
        float _2527 = exp2(_2521);
        float _2529 = _2527 * _2525;
        float _2531 = _2515 * _2529;
        float _2533 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2535 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2537 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2533;
        out.m_107.y = _2535;
        out.m_107.z = _2537;
    }
    out.m_85.x = _2449;
    out.m_85.y = _2451;
    out.m_85.z = _2453;
    if (_2433)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2539;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2297 = false;
    bool _1564 = false;
    bool _634 = false;
    bool _492 = false;
    bool _204 = false;
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
        float _2596 = as_type<float>(_142);
        out.gl_Position.z = _2596;
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
    float _162 = 0.0;
    float _164 = _160;
    if (_156)
    {
        float _166 = float(_126);
        _162 = _166;
    }
    float _168 = _162;
    bool _170 = _160 >= _168;
    bool _172 = !_156;
    bool _174 = _170 || _172;
    if (_174)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _136;
    if (_174)
    {
        out.m_51.x = 0.0;
    }
    if (_174)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_174)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2665 = as_type<float>(_180);
        out.gl_Position.z = _2665;
    }
    if (_174)
    {
        return out;
    }
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _184 = !_182;
    float _202;
    if (!_184)
    {
        float _186 = in.m_55.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        float _206 = float(_126);
        float _208 = 1.0 / _206;
        float _210 = _160 * _208;
        _202 = _210;
    }
    _204 = false;
    float _212 = _202;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = _212 + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _212 + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _212 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _242 = 1.0 / _228;
    float _244 = 1.0 / _232;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _248 = 1.0 / _240;
    float _250 = _216 * _242;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _254 = _212 + _252;
    float _256 = 1.0 / _236;
    float _258 = _220 * _244;
    bool _260 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _262 = isnan(_212);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_270;
    float _274 = _272 + 1.0;
    float _276 = _254 * _248;
    bool _278 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _280 = isnan(_212);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    bool _290 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_212);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = _288 * _274;
    float _304 = -_288;
    float _306 = _304 + 1.0;
    float _308 = _224 * _256;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    bool _322 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _324 = isnan(_212);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = _300 * _306;
    float _336 = -_300;
    float _338 = _336 + 1.0;
    float _340 = fma(_312, _250, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = fma(_316, _250, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_320, _250, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _346 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _348 = isnan(_212);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_332;
    float _360 = _358 + 1.0;
    float _362 = _332 * _338;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _376 = _356 * _360;
    float _378 = fma(_366, _258, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _380 = fma(_370, _258, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _382 = fma(_374, _258, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _384 = _340 * _376;
    float _386 = _342 * _376;
    float _388 = -_356;
    float _390 = _388 + 1.0;
    float _392 = _344 * _376;
    float _394 = in.m_57.x;
    float _396 = in.m_57.y;
    float _398 = in.m_57.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _400;
    float _404 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _384);
    float _406 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _386);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _412;
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _392);
    float _418 = fma(_378, _362, _404);
    float _420 = fma(_380, _362, _406);
    float _422 = fma(_402, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _424 = fma(_410, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _426 = fma(_414, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _440 = fma(_382, _362, _416);
    float _442 = fma(_430, _276, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _444 = fma(_434, _276, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _446 = fma(_438, _276, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _448 = fma(_422, _334, _418);
    float _450 = fma(_424, _334, _420);
    float _452 = fma(_426, _334, _440);
    float _454 = fma(_442, _302, _448);
    float _456 = fma(_444, _302, _450);
    float _458 = fma(_446, _302, _452);
    float _460 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[147].x, _454);
    float _462 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[147].y, _456);
    float _464 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[147].z, _458);
    float _466 = _460 * _394;
    float _468 = _462 * _396;
    float _470 = _464 * _398;
    bool _472 = !_246;
    float _490;
    if (!_472)
    {
        float _474 = in.m_55.x;
        float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _478 = _474 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _482 = _480 * _476;
        float _484 = floor(_482);
        float _486 = -_484;
        float _488 = _482 + _486;
        _490 = _488;
        _492 = true;
    }
    else
    {
        float _494 = float(_126);
        float _496 = 1.0 / _494;
        float _498 = _160 * _496;
        _490 = _498;
    }
    _492 = false;
    float _500 = _490;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _500 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _512 = isnan(_500);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _528 = isnan(_500);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _538;
    bool _542 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_500);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = 1.0 / _508;
    float _556 = -_520;
    float _558 = _556 + 1.0;
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _562 = 1.0 / _524;
    float _564 = _540 * _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _570 = -_552;
    float _572 = _570 + 1.0;
    float _574 = fma(_564, _504, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _536 * _558;
    float _578 = -_536;
    float _580 = _578 + 1.0;
    float _582 = _520 * _572;
    float _584 = _568 * _562;
    float _586 = _574 * _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _590 = _500 + _588;
    float _592 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _594 = fma(_584, _590, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _598 = fma(_594, _582, _592);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _598);
    float _606 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _606;
    out.m_59.y = _608;
    out.m_59.z = _610;
    out.m_59.w = _612;
    bool _614 = !_560;
    float _632;
    if (!_614)
    {
        float _616 = in.m_55.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_126);
        float _638 = 1.0 / _636;
        float _640 = _160 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = in.m_48.x;
    float _646 = in.m_48.y;
    float _648 = in.m_48.z;
    float _650 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _652 = in.m_61.x;
    float _654 = in.m_61.y;
    float _656 = in.m_61.z;
    float _658 = in.m_61.w;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _662 = _660 != 0;
    float _664 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _666 = in.m_63.y;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _674 = _672 != 0;
    float _676 = in.m_55.w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _682 = _680 != 0;
    float _684 = in.m_65.x;
    float _686 = in.m_65.y;
    float _688 = in.m_65.z;
    float _690 = in.m_65.w;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _694 = _692 != 0;
    bool _696 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _698 = isnan(_642);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = in.m_55.x;
    float _710 = in.m_67.x;
    float _712 = in.m_67.y;
    float _714 = in.m_67.z;
    float _716 = in.m_67.w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _720 = in.m_69.z;
    float _722 = _646 * _654;
    float _724 = in.m_55.z;
    float _726 = -_666;
    float _728 = _726 + 1.0;
    float _730 = fma(_644, _652, _722);
    float _732 = in.m_55.y;
    bool _734 = _676 > 0.5;
    float _736 = fma(_648, _656, _730);
    float _738 = in.m_69.x;
    float _740 = _646 * _686;
    int _742 = _734 ? as_type<int>(_728) : as_type<int>(_666);
    float _744 = in.m_69.y;
    float _746 = _708 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _748 = fma(_644, _684, _740);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _754 = in.m_69.w;
    float _756 = _646 * _712;
    float _758 = _670 ? as_type<float>(_742) : _666;
    float _760 = -_678;
    float _762 = fma(_746, 2.0, _760);
    out.m_71.z = _720;
    float _764 = 1.0 / _752;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _768 = _766 != 0;
    float _770 = in.m_63.x;
    bool _772 = _724 > 0.5;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _778 = 0.0;
    float _780 = _724;
    float _782 = _666;
    float _784 = _690;
    float _786 = _762;
    if (!_662)
    {
        _778 = _724;
    }
    float _788 = _778;
    float _790 = 0.0;
    float _792 = _788;
    if (!_662)
    {
        _790 = _732;
    }
    float _794 = _790;
    bool _796 = _732 > 0.5;
    out.m_71.x = _738;
    float _798 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _800 = _794;
    if (_662)
    {
        _800 = _708;
    }
    float _802 = _800;
    out.m_71.y = _744;
    if (_662)
    {
        _780 = _732;
    }
    float _804 = _780;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _808 = as_type<int>(_804);
    if (_662)
    {
        _792 = _732;
    }
    float _810 = _792;
    float _812 = in.m_73.x;
    float _814 = in.m_73.y;
    float _816 = in.m_73.z;
    float _818 = in.m_73.w;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _822 = _820 != 0;
    float _824 = fma(_644, _710, _756);
    int _826 = _796 ? as_type<int>(_728) : as_type<int>(_666);
    float _828 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[78].z, _806);
    out.m_71.w = _754;
    float _830 = _822 ? as_type<float>(_826) : _666;
    float _832 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].z, _718);
    bool _834 = _822;
    if (_674)
    {
        bool _836 = _708 > 0.5;
        _834 = _836;
    }
    bool _838 = _834;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _842 = 1.0 / _776;
    float _844 = fma(_798, -2.0, _840);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    if (_768)
    {
        float _850 = _772 ? _728 : _666;
        _782 = _850;
    }
    float _852 = _782;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _854;
    float _858 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _844);
    float _860 = 1.0 / _848;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _866 = _856 * _764;
    float _868 = fma(_648, _714, _824);
    float _870 = fma(_648, _688, _748);
    float _872 = _814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _874 = _814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _876 = _864 * _842;
    float _878 = _814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _882;
    float _886 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _872);
    float _888 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _878);
    float _890 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _874);
    float _892 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _880);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _896 = _642 + _894;
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _900 = _884 * _860;
    float _902 = _868 + _716;
    float _904 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[24].z, _888);
    float _906 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[25].z, _886);
    float _908 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _912 = _642 + _910;
    float _914 = fma(_866, _896, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _916 = _736 + _658;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _920 = _902 + _918;
    out.m_75.x = _904;
    out.m_75.y = _906;
    out.m_75.z = _908;
    float _922 = fma(_876, _912, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _924 = _870 + _690;
    float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _930 = _916 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _934 = _642 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = _924 + _936;
    bool _940 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _942 = isnan(_642);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _954 = fma(_900, _934, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _956 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _828);
    float _958 = _920 * _920;
    float _960 = _898 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _962 = _818;
    float _964 = _924;
    float _966 = _916;
    if (!_674)
    {
        _784 = _770;
    }
    float _968 = _784;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _972 = fma(_930, _930, _958);
    float _974 = fma(_960, _830, -0.5);
    float _976 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _892);
    float _978 = _926 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _980 = fma(_938, _938, _972);
    float _982 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[83].w, _970);
    float _984 = -_858;
    float _986 = fma(_976, _974, _984);
    float _988 = fma(_758, _978, -0.5);
    float _990 = sqrt(_980);
    bool _992 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _994 = isnan(_642);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -_950;
    float _1006 = _1004 + 1.0;
    bool _1008 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1010 = isnan(_642);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1022 = in.m_77.x;
    float _1024 = in.m_77.y;
    float _1026 = in.m_77.z;
    float _1028 = -_1002;
    float _1030 = _1028 + 1.0;
    float _1032 = _852 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1034 = rsqrt(_980);
    float _1036 = _1018 * _1006;
    float _1038 = -_1018;
    float _1040 = _1038 + 1.0;
    float _1042 = _1020 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1044 = _1002 * _1040;
    float _1046 = _706 * _1030;
    float _1048 = _990 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1050 = -_706;
    float _1052 = _1050 + 1.0;
    float _1054 = _914 * _1046;
    float _1056 = precise::min(_1042, _1048);
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1060 = in.m_79.x;
    float _1062 = in.m_79.y;
    float _1064 = in.m_79.z;
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1054);
    float _1068 = _1034 * _1056;
    float _1070 = -_1058;
    float _1072 = fma(_952, 2.0, _1070);
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1076 = _1024 != 0.0;
    bool _1078 = isnan(_1024);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = _920 * _1068;
    float _1088 = _930 * _1068;
    float _1090 = -_160;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1072);
    bool _1094 = _1022 == 0.0;
    bool _1096 = !_1084;
    bool _1098 = _1094 && _1096;
    float _1100 = -_1086;
    float _1102 = _920 + _1100;
    float _1104 = -_1088;
    float _1106 = _930 + _1104;
    float _1108 = _804 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1110 = _1026 == 0.0;
    bool _1112 = _1110 && _1098;
    float _1114 = _1102 * _1102;
    float _1116 = _1108;
    float _1118 = _968;
    int _1120 = as_type<int>(_1114);
    float _1122 = _1074;
    float _1124 = _982;
    if (_674)
    {
        float _1126 = -_770;
        float _1128 = _1126 + 1.0;
        _808 = as_type<int>(_1128);
    }
    int _1130 = _808;
    float _1132 = fma(_1108, -2.0, _1074);
    int _1134 = _1130;
    if (!_682)
    {
        _1116 = _770;
    }
    float _1136 = _1116;
    float _1138 = fma(_1106, _1106, _1114);
    float _1140 = _938 * _1068;
    float _1142 = _1136;
    float _1144 = _1138;
    if (_674)
    {
        float _1146 = _838 ? as_type<float>(_1130) : _770;
        _1118 = _1146;
    }
    float _1148 = _1118;
    if (_682)
    {
        float _1150 = -_770;
        float _1152 = _1150 + 1.0;
        _1134 = as_type<int>(_1152);
    }
    int _1154 = _1134;
    float _1156 = as_type<float>(_1154);
    if (_694)
    {
        float _1158 = -_770;
        float _1160 = _1158 + 1.0;
        _1120 = as_type<int>(_1160);
    }
    int _1162 = _1120;
    float _1164 = -_1140;
    float _1166 = _938 + _1164;
    if (!_694)
    {
        _1122 = _770;
    }
    float _1168 = _1122;
    float _1170 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1132);
    float _1172 = _1168;
    if (_682)
    {
        float _1174 = _772 ? as_type<float>(_1154) : _770;
        _1142 = _1174;
    }
    float _1176 = _1142;
    float _1178 = fma(_1166, _1166, _1138);
    float _1180 = _1062;
    if (_1112)
    {
        _1156 = _1060;
    }
    float _1182 = _1156;
    float _1184 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _832);
    float _1186 = _1182;
    if (_694)
    {
        float _1188 = _796 ? as_type<float>(_1162) : _770;
        _1172 = _1188;
    }
    float _1190 = _1172;
    float _1192 = sqrt(_1178);
    float _1194 = -_160;
    float _1196 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[76].x, _762);
    float _1198 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _982);
    if (_1112)
    {
        _164 = _1182;
    }
    float _1200 = _164;
    float _1202 = fma(_922, _1044, _1066);
    float _1204 = _1200;
    if (!_1112)
    {
        _1186 = _1060;
    }
    float _1206 = _1186;
    float _1208 = -_1170;
    float _1210 = fma(_1198, _988, _1208);
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1112)
    {
        _1144 = _1062;
    }
    float _1214 = _1144;
    float _1216 = fma(_954, _1036, _1202);
    float _1218 = _1214;
    if (_1112)
    {
        _1124 = _1064;
    }
    float _1220 = _1124;
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1024);
    float _1224 = _1220;
    if (_1112)
    {
        _786 = _1214;
    }
    float _1226 = _786;
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1022);
    float _1230 = _1226;
    if (!_1112)
    {
        _1218 = _1062;
    }
    float _1232 = _1218;
    float _1234 = _1034 * _1192;
    if (_1112)
    {
        _1180 = _1220;
    }
    float _1236 = _1180;
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1240 = _1236;
    if (!_1112)
    {
        _1224 = _1064;
    }
    float _1242 = _1224;
    float _1244 = _650 * _1234;
    float _1246 = _1020 * _1234;
    float _1248 = _664 * _1234;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1026);
    float _1252 = _1244 * _1222;
    float _1254 = _1246 * _1228;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1258 = _1248 * _1250;
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1262 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1112)
    {
        float _1264 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1232);
        _1230 = _1264;
    }
    float _1266 = _1230;
    if (!_1112)
    {
        float _1268 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1206);
        _1204 = _1268;
    }
    float _1270 = _1204;
    float _1272 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1260);
    float _1274 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1262);
    float _1276 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1278 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1272);
    float _1282 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1274);
    float _1284 = fma(_1276, _1176, -0.5);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1290 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1292 = fma(_1278, _1148, -0.5);
    float _1294 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1296 = _924 + _1288;
    float _1298 = _916 + _1290;
    float _1300 = fma(_956, _1292, _1196);
    float _1302 = _816 * _1206;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1306 = _1296 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1310 = _1298 + _1308;
    float _1312 = _1298;
    float _1314 = _1296;
    if (!_1112)
    {
        float _1316 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1242);
        _1240 = _1316;
    }
    float _1318 = _1240;
    float _1320 = fma(_1184, _1284, _1092);
    float _1322 = _1306 * _1306;
    float _1324 = -_1302;
    float _1326 = fma(_812, _1242, _1324);
    float _1328 = _814 * _1242;
    float _1330 = _1032 * _1286;
    float _1332 = fma(_1310, _1310, _1322);
    float _1334 = _1294 * _1256;
    float _1336 = _986 + 0.5;
    float _1338 = _1210 + 0.5;
    float _1340 = sqrt(_1332);
    float _1342 = _1320 + 0.5;
    float _1344 = _1300 + 0.5;
    float _1346 = _812 * _1232;
    float _1348 = -_1328;
    float _1350 = fma(_816, _1232, _1348);
    float _1352 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_81.x = _1334;
    out.m_81.y = _1330;
    float _1354 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1356 = -_1346;
    float _1358 = fma(_814, _1206, _1356);
    float _1360 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1352);
    out.m_83.x = _1344;
    out.m_83.y = _1336;
    out.m_83.z = _1342;
    out.m_83.w = _1338;
    float _1362 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1364 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1360);
    float _1368 = _1326 * _818;
    float _1370 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1362);
    bool _1372 = _1340 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1376 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1354);
    float _1378 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1364);
    float _1380 = _1350 * _818;
    float _1382 = _902 + _1374;
    float _1384 = _1358 * _818;
    float _1386 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1216);
    float _1388 = _1318;
    if (!_1372)
    {
        _962 = _1382;
    }
    float _1390 = _962;
    bool _1392 = !_1372;
    float _1394 = _1390;
    if (!_1392)
    {
        float _1396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1400 = _1340 + _1398;
        float _1402 = _1382 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = rsqrt(_1332);
        float _1406 = _1400 * _1396;
        float _1408 = _1406 * 0.15915493667125701904296875;
        float _1410 = _1408 * 6.283185482025146484375;
        float _1412 = cos(_1410);
        float _1414 = _1408 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        float _1418 = _1412 + (-1.0);
        float _1420 = fma(_1416, _1402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1422 = _1418 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1424 = _1404 * _1420;
        float _1426 = fma(_1382, _1412, _1422);
        float _1428 = fma(_1310, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1430 = fma(_1306, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1394 = _1426;
        _1312 = _1428;
        _1314 = _1430;
    }
    float _1432 = _1394;
    float _1434 = _1312;
    float _1436 = _1314;
    float _1438 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1440 = -_1086;
    float _1442 = _1440 + _1432;
    float _1444 = -_1088;
    float _1446 = _1444 + _1434;
    float _1448 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1450 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1438);
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1454 = _1442 + _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1458 = _1446 + _1456;
    float _1460 = -_1140;
    float _1462 = _1460 + _1436;
    float _1464 = _1454 * _1454;
    float _1466 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1448);
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1470 = _1462 + _1468;
    float _1472 = fma(_1458, _1458, _1464);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1476 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1478 = fma(_1470, _1470, _1472);
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1484 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1476);
    float _1486 = sqrt(_1478);
    float _1488 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1450);
    float _1490 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1492 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1484);
    float _1494 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1376);
    float _1496 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1386 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1502 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1504 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1370);
    float _1506 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1378);
    out.m_85.w = _1056;
    float _1508 = -_1088;
    float _1510 = _916 + _1508;
    float _1512 = -_1086;
    float _1514 = _902 + _1512;
    out.m_87.x = _1490;
    out.m_87.y = _1496;
    out.m_87.z = _1498;
    out.m_87.w = _1500;
    bool _1516 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1518 = isnan(_1486);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1524 = _1520 || _1522;
    float _1526 = -_1140;
    float _1528 = _924 + _1526;
    out.m_89.x = _1492;
    out.m_89.y = _1488;
    out.m_89.z = _1502;
    out.m_91.x = _1246;
    out.m_93.x = _1504;
    out.m_93.y = _1494;
    out.m_93.z = _1506;
    if (!_1524)
    {
        _1388 = 1.0;
    }
    float _1530 = _1388;
    bool _1532 = !_1524;
    float _1534 = _1530;
    if (!_1532)
    {
        bool _1536 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1538 = isnan(_1486);
        bool _1540 = _1536 || _1538;
        bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1544 = _1540 || _1542;
        if (!_1544)
        {
            float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1548 = _1486 + _1546;
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1552 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1550;
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1558 = 1.0 / _1552;
            float _1560 = _1548 * _1558;
            float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1534 = _1562;
            _1564 = true;
        }
        else
        {
            bool _1566 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1568 = isnan(_1486);
            bool _1570 = _1566 || _1568;
            bool _1572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1574 = _1570 || _1572;
            if (!_1574)
            {
                float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1578 = _1486 + _1576;
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1582 = _1580 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1586 = _1584 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1588 = 1.0 / _1582;
                float _1590 = _1578 * _1588;
                float _1592 = fma(_1590, _1586, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1534 = _1592;
                _1564 = true;
            }
            else
            {
                _1534 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1564 = false;
    float _1594 = _1534;
    float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1598 = _1442 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1602 = _1446 + _1600;
    float _1604 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1608 = _1462 + _1606;
    float _1610 = fma(_1602, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1614 = _1604 + _1612;
    float _1616 = fma(_1608, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1620 = _1610 + _1618;
    float _1622 = _1614 * _1614;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1626 = _1616 + _1624;
    float _1628 = fma(_1620, _1620, _1622);
    float _1630 = fma(_1626, _1626, _1628);
    float _1632 = rsqrt(_1630);
    float _1634 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1636 = _1620 * _1634;
    float _1638 = _1626 * _1634;
    float _1640 = _1636 * _1636;
    float _1642 = _1638 * _1638;
    float _1644 = _1640 + _1642;
    float _1646 = sqrt(_1644);
    bool _1648 = _1646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1646 + _1650;
    float _1654 = _1632;
    float _1656 = _1652;
    float _1658 = _1614;
    if (_1648)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1660;
    }
    float _1662 = _1654;
    if (_1648)
    {
        float _1664 = rsqrt(_1644);
        _964 = _1664;
    }
    float _1666 = _964;
    float _1668 = _1666;
    if (_1648)
    {
        float _1670 = _1652 * _1662;
        _1656 = _1670;
    }
    float _1672 = _1656;
    float _1674 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1648)
    {
        float _1676 = _1672 * 0.15915493667125701904296875;
        _966 = _1676;
    }
    float _1678 = _966;
    float _1680 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1674);
    float _1682 = _1626;
    float _1684 = _1678;
    if (_1648)
    {
        float _1686 = _1678 * 6.283185482025146484375;
        float _1688 = sin(_1686);
        _1682 = _1688;
    }
    float _1690 = _1682;
    float _1692 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1694 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1680);
    float _1696 = precise::max(0.0, _1692);
    float _1698 = _1086;
    float _1700 = _1696;
    float _1702 = _1692;
    if (_1648)
    {
        float _1704 = _1678 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        _1698 = _1706;
    }
    float _1708 = _1698;
    float _1710 = -_1634;
    float _1712 = -_1696;
    float _1714 = fma(_1614, _1710, _1712);
    if (_1648)
    {
        float _1716 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1700 = _1716;
    }
    float _1718 = _1700;
    float _1720 = _1718;
    if (!_1648)
    {
        _1684 = _1636;
    }
    float _1722 = _1684;
    float _1724 = _1690;
    float _1726 = _1722;
    if (_1648)
    {
        float _1728 = fma(_1690, _1718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1720 = _1728;
    }
    float _1730 = _1720;
    float _1732 = _1730;
    if (!_1648)
    {
        _1724 = _1714;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (_1648)
    {
        float _1738 = _1708 + (-1.0);
        _1702 = _1738;
    }
    float _1740 = _1702;
    float _1742 = _1740;
    if (_1648)
    {
        float _1744 = _1666 * _1730;
        _1658 = _1744;
    }
    float _1746 = _1658;
    float _1748 = _1746;
    if (!_1648)
    {
        _1668 = _1638;
    }
    float _1750 = _1668;
    float _1752 = _1750;
    if (_1648)
    {
        float _1754 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1742 = _1754;
    }
    float _1756 = _1742;
    if (_1648)
    {
        float _1758 = _1636 * _1746;
        _1726 = _1758;
    }
    float _1760 = _1726;
    if (_1648)
    {
        float _1762 = _1638 * _1746;
        _1752 = _1762;
    }
    float _1764 = _1752;
    if (!_1648)
    {
        _1732 = _1640;
    }
    float _1766 = _1732;
    float _1768 = _1766;
    if (_1648)
    {
        float _1770 = fma(_1714, _1708, _1756);
        _1736 = _1770;
    }
    float _1772 = _1736;
    if (_1648)
    {
        float _1774 = _1760 * _1760;
        _1768 = _1774;
    }
    float _1776 = _1768;
    if (!_1648)
    {
        _1748 = _1642;
    }
    float _1778 = _1748;
    float _1780 = sqrt(_1630);
    float _1782 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1784 = _1778;
    if (_1648)
    {
        float _1786 = _1764 * _1764;
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = fma(_1772, _1772, _1776);
    float _1792 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = _1790 + _1788;
    float _1796 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1798 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1800 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1802 = rsqrt(_1794);
    float _1804 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1806 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1798);
    float _1808 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1800);
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1812 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1810);
    float _1814 = precise::clamp(_1812, 0.0, 1.0);
    float _1816 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1804);
    float _1818 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1806);
    float _1820 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1808);
    float _1822 = -_1814;
    float _1824 = _1822 + 1.0;
    float _1826 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1828 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1830 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1832 = floor(_1782);
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1838 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1840 = _1802 * _1760;
    float _1842 = _1802 * _1764;
    float _1844 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1836);
    float _1846 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1848 = abs(_1824);
    float _1850 = log2(_1848);
    float _1852 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1854 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1856 = _1802 * _1772;
    float _1858 = -_1838;
    float _1860 = fma(_1858, _1834, 1.0);
    float _1862 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1854);
    float _1864 = -_1852;
    float _1866 = fma(_1856, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1864);
    float _1868 = floor(_1796);
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1872 = -_1832;
    float _1874 = _1782 + _1872;
    float _1876 = -_1842;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1866);
    float _1880 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1882 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1870);
    float _1884 = fma(_1878, -0.5, 0.5);
    float _1886 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1888 = log2(_1860);
    float _1890 = fma(_1878, 0.5, 0.5);
    float _1892 = _1856 + 1.0;
    float _1894 = -_1868;
    float _1896 = _1796 + _1894;
    float _1898 = exp2(_1886);
    float _1900 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1880);
    float _1902 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1882);
    float _1904 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1900);
    float _1906 = sqrt(_1884);
    float _1908 = fma(_1890, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1910 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1904);
    float _1912 = _1888 * 0.693147182464599609375;
    float _1914 = fma(_1890, _1908, -0.212114393711090087890625);
    float _1916 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1918 = 1.0 / _1862;
    float _1920 = -_1856;
    float _1922 = fma(_1898, _1892, _1920);
    float _1924 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1902);
    float _1926 = fma(_1890, _1914, 1.570728778839111328125);
    float _1928 = _1906 * 0.636619746685028076171875;
    float _1930 = -_1926;
    float _1932 = fma(_1928, _1930, 1.0);
    float _1934 = fma(_1922, 0.5, 0.5);
    float _1936 = _1910 * _1918;
    float _1938 = _1924 * _1918;
    float _1940 = fma(_1936, 0.5, 0.5);
    float _1942 = fma(_1938, -0.5, 0.5);
    float2 _5643 = float2(_1874, _1896);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5643, float2(0.0), isnan(_5643)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5643, float2(0.0), isnan(_5643)), level(0.0)).x;
    float3 _5654 = float3(_1940, _1942, _1916);
    float _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5654, float3(0.0), isnan(_5654)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5654, float3(0.0), isnan(_5654)), level(0.0)).x;
    float3 _5665 = float3(_1940, _1942, _1916);
    float4 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5665, float3(0.0), isnan(_5665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5665, float3(0.0), isnan(_5665)), level(0.0)).xyzw;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _1949.w;
    float2 _5681 = float2(_1932, _1934);
    float3 _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5681, float2(0.0), isnan(_5681)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5681, float2(0.0), isnan(_5681)), level(0.0)).xyz;
    float _1963 = _1961.x;
    float _1965 = _1961.y;
    float _1967 = _1961.z;
    float _1969 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1971 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_95.x = _1510;
    out.m_95.y = _1514;
    out.m_95.z = _1528;
    float _1973 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1969);
    float _1975 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1971);
    float _1977 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1973);
    float _1979 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1981 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1975);
    float _1983 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1985 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1979);
    float _1987 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1989 = 1.0 / _1983;
    float _1991 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1985);
    float _1993 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1995 = _1862 * 0.5;
    out.gl_Position.x = _1910;
    out.gl_Position.y = _1924;
    out.gl_Position.z = _1987;
    out.gl_Position.w = _1862;
    float _1997 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1999 = exp2(_1993);
    float _2001 = _1997 + _1983;
    float _2003 = _2001 * _1989;
    float _2005 = _2003 * 0.5;
    float _2007 = _1910 + _1862;
    float _2009 = fma(_1924, -0.5, _1995);
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2013 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2011);
    float _2015 = _2007 * 0.5;
    float _2017 = 1.0 / _2013;
    bool _2019 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan(0.5);
    bool _2027 = _2023 || _2025;
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2031 = _2017 * _2029;
    float _2033 = abs(_2031);
    float _2035 = log2(_2033);
    bool _2037 = _2031 <= 8000.0;
    bool _2039 = isnan(_2031);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(8000.0);
    bool _2045 = _2041 || _2043;
    float _2047 = float(_2045);
    float _2049 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2051 = exp2(_2049);
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2055 = precise::clamp(_2053, 0.0, 1.0);
    float _2057 = fma(_2055, -2.0, 3.0);
    float _2059 = _2055 * _2055;
    float _2061 = _2059 * _2057;
    float _2063 = in.m_97.x;
    float _2065 = -_2061;
    float _2067 = _2065 + 1.0;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2061);
    float _2071 = _2047 * _2069;
    float _2073 = _1987 + _1862;
    float _2075 = _2073 * 0.5;
    float _2077 = _2073;
    float _2079 = _2075;
    float _2081 = _2015;
    if (_2027)
    {
        _2077 = 1.0;
    }
    float _2083 = _2077;
    float _2085 = _2083;
    float _2087 = _1953;
    float _2089 = _1951;
    if (!_2027)
    {
        float _2091 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = _2093 * 6.283185482025146484375;
        float _2097 = cos(_2095);
        float _2099 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2101 = _2099 * 0.15915493667125701904296875;
        float _2103 = _2093 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = 1.0 / _2097;
        float _2109 = _2101 * 6.283185482025146484375;
        float _2111 = cos(_2109);
        float _2113 = _2105 * _2107;
        float _2115 = _2101 * 6.283185482025146484375;
        float _2117 = sin(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = 1.0 / _2119;
        float _2123 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2125 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2123;
        float _2127 = 1.0 / _2125;
        float _2129 = _2117 * _2121;
        float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2133 = fma(_2031, _2129, _2131);
        float _2135 = _2133 * _2127;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        _2085 = _2137;
    }
    float _2139 = _2085;
    float _2141 = -_1999;
    float _2143 = _2141 + 1.0;
    float _2145 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2147 = -_1944;
    float _2149 = _2147 + 1.0;
    float _2151 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_99.x = _2015;
    out.m_99.y = _2009;
    out.m_99.z = _2075;
    out.m_99.w = _1862;
    float _2153 = _2149 * _2145;
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    bool _2157 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2159 = isnan(_1780);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2165 = _2161 || _2163;
    float _2167 = _2151 * _1946;
    float _2169 = -_2151;
    float _2171 = _2169 + 1.0;
    float _2173 = -_2155;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_101.x = _1610;
    out.m_101.y = _1604;
    out.m_101.z = _1616;
    float _2177 = _1957 * _2167;
    float _2179 = _1967 * _2167;
    float _2181 = _2175 * _2063;
    float _2183 = _1957 * _2171;
    float _2185 = fma(_1963, _2177, _1951);
    float _2187 = fma(_1965, _2177, _1953);
    float _2189 = fma(_1957, _2179, _1955);
    float _2191 = _2181 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2193 = _2167;
    float _2195 = _2181;
    if (!_2165)
    {
        _2087 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2197 = _2087;
    float _2199 = _2139 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2185;
    out.m_103.y = _2187;
    out.m_103.z = _2189;
    out.m_103.w = _2183;
    float _2201 = _2197;
    float _2203 = _2197;
    if (!_2165)
    {
        _2079 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2205 = _2079;
    float _2207 = _2205;
    float _2209 = _2205;
    if (!_2165)
    {
        _2081 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2211 = _2081;
    out.m_105.x = _2191;
    float _2213 = _2211;
    float _2215 = _2211;
    if (!_2165)
    {
        _2089 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2217 = _2089;
    float _2219 = _2217;
    float _2221 = _2217;
    if (!_2165)
    {
        _2193 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2223 = _2193;
    float _2225 = _2223;
    float _2227 = _2223;
    if (!_2165)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2229 = _2195;
    bool _2231 = !_2165;
    float _2233 = _2229;
    float _2235 = _2229;
    if (!_2231)
    {
        bool _2237 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2239 = isnan(_1780);
        bool _2241 = _2237 || _2239;
        bool _2243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2245 = _2241 || _2243;
        if (!_2245)
        {
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2249 = _1780 + _2247;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2253 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2251;
            float _2255 = 1.0 / _2253;
            float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2277 = _2249 * _2255;
            float _2279 = precise::clamp(_2277, 0.0, 1.0);
            float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2285 = fma(_2279, _2259, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2287 = fma(_2279, _2283, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2289 = fma(_2279, _2263, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2291 = fma(_2279, _2267, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2293 = fma(_2279, _2271, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2295 = fma(_2279, _2275, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2209 = _2285;
            _2227 = _2293;
            _2203 = _2287;
            _2221 = _2291;
            _2215 = _2289;
            _2235 = _2295;
            _2297 = true;
        }
        else
        {
            bool _2299 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2301 = isnan(_1780);
            bool _2303 = _2299 || _2301;
            bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2307 = _2303 || _2305;
            if (!_2307)
            {
                _2201 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2309 = _2201;
            _2203 = _2309;
            if (!_2307)
            {
                _2207 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2311 = _2207;
            _2209 = _2311;
            if (!_2307)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2313 = _2213;
            _2215 = _2313;
            if (!_2307)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2315 = _2219;
            _2221 = _2315;
            if (!_2307)
            {
                _2225 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2317 = _2225;
            _2227 = _2317;
            if (!_2307)
            {
                _2233 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2319 = _2233;
            bool _2321 = !_2307;
            _2235 = _2319;
            if (!_2321)
            {
                bool _2323 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2325 = isnan(_1780);
                bool _2327 = _2323 || _2325;
                bool _2329 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2331 = _2327 || _2329;
                if (!_2331)
                {
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2335 = _1780 + _2333;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2337;
                    float _2341 = 1.0 / _2339;
                    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2357 = _2355 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2363 = _2335 * _2341;
                    float _2365 = precise::clamp(_2363, 0.0, 1.0);
                    float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2371 = fma(_2365, _2345, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2373 = fma(_2365, _2369, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2375 = fma(_2365, _2349, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2377 = fma(_2365, _2353, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2379 = fma(_2365, _2357, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2381 = fma(_2365, _2361, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2209 = _2371;
                    _2227 = _2379;
                    _2203 = _2373;
                    _2221 = _2377;
                    _2215 = _2375;
                    _2235 = _2381;
                    _2297 = true;
                }
                else
                {
                    _2209 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2227 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2203 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2235 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2297 = false;
    float _2383 = _2209;
    float _2385 = _2227;
    float _2387 = _2203;
    float _2389 = _2221;
    float _2391 = _2215;
    float _2393 = _2235;
    float _2395 = fma(_1494, -0.5, 0.5);
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = -_2383;
    float _2401 = _2399 + _2385;
    float _2403 = _2199 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2405 = -_2387;
    float _2407 = _2405 + _2389;
    out.m_107.x = 0.0;
    float _2409 = fma(_2397, _2401, _2383);
    float _2411 = fma(_2397, _2407, _2387);
    out.m_51.x = _2403;
    float _2413 = -_2391;
    float _2415 = _2413 + _2393;
    float _2417 = _2409 * 0.586610972881317138671875;
    bool _2419 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2421 = fma(_2397, _2415, _2391);
    float _2423 = fma(_2411, 0.298911988735198974609375, _2417);
    bool _2425 = _2139 > 0.0;
    bool _2427 = isnan(_2139);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = fma(_2421, 0.114477999508380889892578125, _2423);
    float _2437 = -_2435;
    float _2439 = _2411 + _2437;
    float _2441 = -_2435;
    float _2443 = _2409 + _2441;
    float _2445 = -_2435;
    float _2447 = _2421 + _2445;
    float _2449 = fma(_2439, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2435);
    float _2451 = fma(_2443, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2435);
    float _2453 = fma(_2447, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2435);
    bool _2455 = !_2419;
    if (!_2455)
    {
        float _2457 = -_1604;
        float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2461 = -_1610;
        float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2465 = -_1616;
        float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2469 = _2459 * _2459;
        float _2471 = fma(_2463, _2463, _2469);
        float _2473 = fma(_2467, _2467, _2471);
        float _2475 = sqrt(_2473);
        float _2477 = rsqrt(_2473);
        float _2479 = -_2475;
        float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2483 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2485 = precise::clamp(_2483, 0.0, 1.0);
        float _2487 = _2463 * _2477;
        float _2489 = _2459 * _2477;
        float _2491 = abs(_2485);
        float _2493 = log2(_2491);
        float _2495 = _2467 * _2477;
        float _2497 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2499 = _1494 * _2489;
        float _2501 = -_2489;
        float _2503 = -_2497;
        float _2505 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2503);
        float _2507 = fma(_1504, _2487, _2499);
        float _2509 = -_2495;
        float _2511 = fma(_2509, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2505);
        float _2513 = fma(_1506, _2495, _2507);
        float _2515 = precise::clamp(_2513, 0.0, 1.0);
        float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2519 = _2511 + _2517;
        float _2521 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2523 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2525 = precise::clamp(_2523, 0.0, 1.0);
        float _2527 = exp2(_2521);
        float _2529 = _2527 * _2525;
        float _2531 = _2515 * _2529;
        float _2533 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2535 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2537 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2533;
        out.m_107.y = _2535;
        out.m_107.z = _2537;
    }
    out.m_85.x = _2449;
    out.m_85.y = _2451;
    out.m_85.z = _2453;
    if (_2433)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2539;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2297 = false;
    bool _1564 = false;
    bool _634 = false;
    bool _492 = false;
    bool _204 = false;
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
        float _2596 = as_type<float>(_142);
        out.gl_Position.z = _2596;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_53.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = 0.0;
    float _164 = _160;
    if (_156)
    {
        float _166 = float(_126);
        _162 = _166;
    }
    float _168 = _162;
    bool _170 = _160 >= _168;
    bool _172 = !_156;
    bool _174 = _170 || _172;
    if (_174)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _136;
    if (_174)
    {
        out.m_51.x = 0.0;
    }
    if (_174)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_174)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2665 = as_type<float>(_180);
        out.gl_Position.z = _2665;
    }
    if (_174)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _184 = !_182;
    float _202;
    if (!_184)
    {
        float _186 = in.m_55.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        float _206 = float(_126);
        float _208 = 1.0 / _206;
        float _210 = _160 * _208;
        _202 = _210;
    }
    _204 = false;
    float _212 = _202;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = _212 + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _212 + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = _212 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _242 = 1.0 / _228;
    float _244 = 1.0 / _232;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _248 = 1.0 / _240;
    float _250 = _216 * _242;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _254 = _212 + _252;
    float _256 = 1.0 / _236;
    float _258 = _220 * _244;
    bool _260 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _262 = isnan(_212);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_270;
    float _274 = _272 + 1.0;
    float _276 = _254 * _248;
    bool _278 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _280 = isnan(_212);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    bool _290 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_212);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = _288 * _274;
    float _304 = -_288;
    float _306 = _304 + 1.0;
    float _308 = _224 * _256;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    bool _322 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _324 = isnan(_212);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = _300 * _306;
    float _336 = -_300;
    float _338 = _336 + 1.0;
    float _340 = fma(_312, _250, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = fma(_316, _250, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_320, _250, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _346 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _348 = isnan(_212);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_332;
    float _360 = _358 + 1.0;
    float _362 = _332 * _338;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _376 = _356 * _360;
    float _378 = fma(_366, _258, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _380 = fma(_370, _258, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _382 = fma(_374, _258, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _384 = _340 * _376;
    float _386 = _342 * _376;
    float _388 = -_356;
    float _390 = _388 + 1.0;
    float _392 = _344 * _376;
    float _394 = in.m_57.x;
    float _396 = in.m_57.y;
    float _398 = in.m_57.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _400;
    float _404 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _384);
    float _406 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _386);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _412;
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _392);
    float _418 = fma(_378, _362, _404);
    float _420 = fma(_380, _362, _406);
    float _422 = fma(_402, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _424 = fma(_410, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _426 = fma(_414, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _440 = fma(_382, _362, _416);
    float _442 = fma(_430, _276, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _444 = fma(_434, _276, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _446 = fma(_438, _276, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _448 = fma(_422, _334, _418);
    float _450 = fma(_424, _334, _420);
    float _452 = fma(_426, _334, _440);
    float _454 = fma(_442, _302, _448);
    float _456 = fma(_444, _302, _450);
    float _458 = fma(_446, _302, _452);
    float _460 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[147].x, _454);
    float _462 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[147].y, _456);
    float _464 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[147].z, _458);
    float _466 = _460 * _394;
    float _468 = _462 * _396;
    float _470 = _464 * _398;
    bool _472 = !_246;
    float _490;
    if (!_472)
    {
        float _474 = in.m_55.x;
        float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _478 = _474 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _482 = _480 * _476;
        float _484 = floor(_482);
        float _486 = -_484;
        float _488 = _482 + _486;
        _490 = _488;
        _492 = true;
    }
    else
    {
        float _494 = float(_126);
        float _496 = 1.0 / _494;
        float _498 = _160 * _496;
        _490 = _498;
    }
    _492 = false;
    float _500 = _490;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _500 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _512 = isnan(_500);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _528 = isnan(_500);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _538;
    bool _542 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_500);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = 1.0 / _508;
    float _556 = -_520;
    float _558 = _556 + 1.0;
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _562 = 1.0 / _524;
    float _564 = _540 * _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _570 = -_552;
    float _572 = _570 + 1.0;
    float _574 = fma(_564, _504, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _536 * _558;
    float _578 = -_536;
    float _580 = _578 + 1.0;
    float _582 = _520 * _572;
    float _584 = _568 * _562;
    float _586 = _574 * _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _590 = _500 + _588;
    float _592 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _594 = fma(_584, _590, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _598 = fma(_594, _582, _592);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _598);
    float _606 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _606;
    out.m_59.y = _608;
    out.m_59.z = _610;
    out.m_59.w = _612;
    bool _614 = !_560;
    float _632;
    if (!_614)
    {
        float _616 = in.m_55.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_126);
        float _638 = 1.0 / _636;
        float _640 = _160 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = in.m_48.x;
    float _646 = in.m_48.y;
    float _648 = in.m_48.z;
    float _650 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _652 = in.m_61.x;
    float _654 = in.m_61.y;
    float _656 = in.m_61.z;
    float _658 = in.m_61.w;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _662 = _660 != 0;
    float _664 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _666 = in.m_63.y;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _674 = _672 != 0;
    float _676 = in.m_55.w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _682 = _680 != 0;
    float _684 = in.m_65.x;
    float _686 = in.m_65.y;
    float _688 = in.m_65.z;
    float _690 = in.m_65.w;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _694 = _692 != 0;
    bool _696 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _698 = isnan(_642);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = in.m_55.x;
    float _710 = in.m_67.x;
    float _712 = in.m_67.y;
    float _714 = in.m_67.z;
    float _716 = in.m_67.w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _720 = in.m_69.z;
    float _722 = _646 * _654;
    float _724 = in.m_55.z;
    float _726 = -_666;
    float _728 = _726 + 1.0;
    float _730 = fma(_644, _652, _722);
    float _732 = in.m_55.y;
    bool _734 = _676 > 0.5;
    float _736 = fma(_648, _656, _730);
    float _738 = in.m_69.x;
    float _740 = _646 * _686;
    int _742 = _734 ? as_type<int>(_728) : as_type<int>(_666);
    float _744 = in.m_69.y;
    float _746 = _708 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _748 = fma(_644, _684, _740);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _754 = in.m_69.w;
    float _756 = _646 * _712;
    float _758 = _670 ? as_type<float>(_742) : _666;
    float _760 = -_678;
    float _762 = fma(_746, 2.0, _760);
    out.m_71.z = _720;
    float _764 = 1.0 / _752;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _768 = _766 != 0;
    float _770 = in.m_63.x;
    bool _772 = _724 > 0.5;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _778 = 0.0;
    float _780 = _724;
    float _782 = _666;
    float _784 = _690;
    float _786 = _762;
    if (!_662)
    {
        _778 = _724;
    }
    float _788 = _778;
    float _790 = 0.0;
    float _792 = _788;
    if (!_662)
    {
        _790 = _732;
    }
    float _794 = _790;
    bool _796 = _732 > 0.5;
    out.m_71.x = _738;
    float _798 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _800 = _794;
    if (_662)
    {
        _800 = _708;
    }
    float _802 = _800;
    out.m_71.y = _744;
    if (_662)
    {
        _780 = _732;
    }
    float _804 = _780;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _808 = as_type<int>(_804);
    if (_662)
    {
        _792 = _732;
    }
    float _810 = _792;
    float _812 = in.m_73.x;
    float _814 = in.m_73.y;
    float _816 = in.m_73.z;
    float _818 = in.m_73.w;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _822 = _820 != 0;
    float _824 = fma(_644, _710, _756);
    int _826 = _796 ? as_type<int>(_728) : as_type<int>(_666);
    float _828 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[78].z, _806);
    out.m_71.w = _754;
    float _830 = _822 ? as_type<float>(_826) : _666;
    float _832 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].z, _718);
    bool _834 = _822;
    if (_674)
    {
        bool _836 = _708 > 0.5;
        _834 = _836;
    }
    bool _838 = _834;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _842 = 1.0 / _776;
    float _844 = fma(_798, -2.0, _840);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    if (_768)
    {
        float _850 = _772 ? _728 : _666;
        _782 = _850;
    }
    float _852 = _782;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _854;
    float _858 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _844);
    float _860 = 1.0 / _848;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _866 = _856 * _764;
    float _868 = fma(_648, _714, _824);
    float _870 = fma(_648, _688, _748);
    float _872 = _814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _874 = _814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _876 = _864 * _842;
    float _878 = _814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _882;
    float _886 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _872);
    float _888 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _878);
    float _890 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _874);
    float _892 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _880);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _896 = _642 + _894;
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _900 = _884 * _860;
    float _902 = _868 + _716;
    float _904 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[24].z, _888);
    float _906 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[25].z, _886);
    float _908 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _912 = _642 + _910;
    float _914 = fma(_866, _896, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _916 = _736 + _658;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _920 = _902 + _918;
    out.m_75.x = _904;
    out.m_75.y = _906;
    out.m_75.z = _908;
    float _922 = fma(_876, _912, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _924 = _870 + _690;
    float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _930 = _916 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _934 = _642 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = _924 + _936;
    bool _940 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _942 = isnan(_642);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _954 = fma(_900, _934, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _956 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _828);
    float _958 = _920 * _920;
    float _960 = _898 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _962 = _818;
    float _964 = _924;
    float _966 = _916;
    if (!_674)
    {
        _784 = _770;
    }
    float _968 = _784;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _972 = fma(_930, _930, _958);
    float _974 = fma(_960, _830, -0.5);
    float _976 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _892);
    float _978 = _926 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _980 = fma(_938, _938, _972);
    float _982 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[83].w, _970);
    float _984 = -_858;
    float _986 = fma(_976, _974, _984);
    float _988 = fma(_758, _978, -0.5);
    float _990 = sqrt(_980);
    bool _992 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _994 = isnan(_642);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -_950;
    float _1006 = _1004 + 1.0;
    bool _1008 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1010 = isnan(_642);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1022 = in.m_77.x;
    float _1024 = in.m_77.y;
    float _1026 = in.m_77.z;
    float _1028 = -_1002;
    float _1030 = _1028 + 1.0;
    float _1032 = _852 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1034 = rsqrt(_980);
    float _1036 = _1018 * _1006;
    float _1038 = -_1018;
    float _1040 = _1038 + 1.0;
    float _1042 = _1020 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1044 = _1002 * _1040;
    float _1046 = _706 * _1030;
    float _1048 = _990 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1050 = -_706;
    float _1052 = _1050 + 1.0;
    float _1054 = _914 * _1046;
    float _1056 = precise::min(_1042, _1048);
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1060 = in.m_79.x;
    float _1062 = in.m_79.y;
    float _1064 = in.m_79.z;
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1054);
    float _1068 = _1034 * _1056;
    float _1070 = -_1058;
    float _1072 = fma(_952, 2.0, _1070);
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1076 = _1024 != 0.0;
    bool _1078 = isnan(_1024);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = _920 * _1068;
    float _1088 = _930 * _1068;
    float _1090 = -_160;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1072);
    bool _1094 = _1022 == 0.0;
    bool _1096 = !_1084;
    bool _1098 = _1094 && _1096;
    float _1100 = -_1086;
    float _1102 = _920 + _1100;
    float _1104 = -_1088;
    float _1106 = _930 + _1104;
    float _1108 = _804 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1110 = _1026 == 0.0;
    bool _1112 = _1110 && _1098;
    float _1114 = _1102 * _1102;
    float _1116 = _1108;
    float _1118 = _968;
    int _1120 = as_type<int>(_1114);
    float _1122 = _1074;
    float _1124 = _982;
    if (_674)
    {
        float _1126 = -_770;
        float _1128 = _1126 + 1.0;
        _808 = as_type<int>(_1128);
    }
    int _1130 = _808;
    float _1132 = fma(_1108, -2.0, _1074);
    int _1134 = _1130;
    if (!_682)
    {
        _1116 = _770;
    }
    float _1136 = _1116;
    float _1138 = fma(_1106, _1106, _1114);
    float _1140 = _938 * _1068;
    float _1142 = _1136;
    float _1144 = _1138;
    if (_674)
    {
        float _1146 = _838 ? as_type<float>(_1130) : _770;
        _1118 = _1146;
    }
    float _1148 = _1118;
    if (_682)
    {
        float _1150 = -_770;
        float _1152 = _1150 + 1.0;
        _1134 = as_type<int>(_1152);
    }
    int _1154 = _1134;
    float _1156 = as_type<float>(_1154);
    if (_694)
    {
        float _1158 = -_770;
        float _1160 = _1158 + 1.0;
        _1120 = as_type<int>(_1160);
    }
    int _1162 = _1120;
    float _1164 = -_1140;
    float _1166 = _938 + _1164;
    if (!_694)
    {
        _1122 = _770;
    }
    float _1168 = _1122;
    float _1170 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1132);
    float _1172 = _1168;
    if (_682)
    {
        float _1174 = _772 ? as_type<float>(_1154) : _770;
        _1142 = _1174;
    }
    float _1176 = _1142;
    float _1178 = fma(_1166, _1166, _1138);
    float _1180 = _1062;
    if (_1112)
    {
        _1156 = _1060;
    }
    float _1182 = _1156;
    float _1184 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _832);
    float _1186 = _1182;
    if (_694)
    {
        float _1188 = _796 ? as_type<float>(_1162) : _770;
        _1172 = _1188;
    }
    float _1190 = _1172;
    float _1192 = sqrt(_1178);
    float _1194 = -_160;
    float _1196 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[76].x, _762);
    float _1198 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _982);
    if (_1112)
    {
        _164 = _1182;
    }
    float _1200 = _164;
    float _1202 = fma(_922, _1044, _1066);
    float _1204 = _1200;
    if (!_1112)
    {
        _1186 = _1060;
    }
    float _1206 = _1186;
    float _1208 = -_1170;
    float _1210 = fma(_1198, _988, _1208);
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1112)
    {
        _1144 = _1062;
    }
    float _1214 = _1144;
    float _1216 = fma(_954, _1036, _1202);
    float _1218 = _1214;
    if (_1112)
    {
        _1124 = _1064;
    }
    float _1220 = _1124;
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1024);
    float _1224 = _1220;
    if (_1112)
    {
        _786 = _1214;
    }
    float _1226 = _786;
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1022);
    float _1230 = _1226;
    if (!_1112)
    {
        _1218 = _1062;
    }
    float _1232 = _1218;
    float _1234 = _1034 * _1192;
    if (_1112)
    {
        _1180 = _1220;
    }
    float _1236 = _1180;
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1240 = _1236;
    if (!_1112)
    {
        _1224 = _1064;
    }
    float _1242 = _1224;
    float _1244 = _650 * _1234;
    float _1246 = _1020 * _1234;
    float _1248 = _664 * _1234;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1026);
    float _1252 = _1244 * _1222;
    float _1254 = _1246 * _1228;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1258 = _1248 * _1250;
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1262 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1112)
    {
        float _1264 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1232);
        _1230 = _1264;
    }
    float _1266 = _1230;
    if (!_1112)
    {
        float _1268 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1206);
        _1204 = _1268;
    }
    float _1270 = _1204;
    float _1272 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1260);
    float _1274 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1262);
    float _1276 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1278 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1272);
    float _1282 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1274);
    float _1284 = fma(_1276, _1176, -0.5);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1290 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1292 = fma(_1278, _1148, -0.5);
    float _1294 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1296 = _924 + _1288;
    float _1298 = _916 + _1290;
    float _1300 = fma(_956, _1292, _1196);
    float _1302 = _816 * _1206;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1306 = _1296 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1310 = _1298 + _1308;
    float _1312 = _1298;
    float _1314 = _1296;
    if (!_1112)
    {
        float _1316 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1242);
        _1240 = _1316;
    }
    float _1318 = _1240;
    float _1320 = fma(_1184, _1284, _1092);
    float _1322 = _1306 * _1306;
    float _1324 = -_1302;
    float _1326 = fma(_812, _1242, _1324);
    float _1328 = _814 * _1242;
    float _1330 = _1032 * _1286;
    float _1332 = fma(_1310, _1310, _1322);
    float _1334 = _1294 * _1256;
    float _1336 = _986 + 0.5;
    float _1338 = _1210 + 0.5;
    float _1340 = sqrt(_1332);
    float _1342 = _1320 + 0.5;
    float _1344 = _1300 + 0.5;
    float _1346 = _812 * _1232;
    float _1348 = -_1328;
    float _1350 = fma(_816, _1232, _1348);
    float _1352 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_81.x = _1334;
    out.m_81.y = _1330;
    float _1354 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1356 = -_1346;
    float _1358 = fma(_814, _1206, _1356);
    float _1360 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1352);
    out.m_83.x = _1344;
    out.m_83.y = _1336;
    out.m_83.z = _1342;
    out.m_83.w = _1338;
    float _1362 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1364 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1360);
    float _1368 = _1326 * _818;
    float _1370 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1362);
    bool _1372 = _1340 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1376 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1354);
    float _1378 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1364);
    float _1380 = _1350 * _818;
    float _1382 = _902 + _1374;
    float _1384 = _1358 * _818;
    float _1386 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1216);
    float _1388 = _1318;
    if (!_1372)
    {
        _962 = _1382;
    }
    float _1390 = _962;
    bool _1392 = !_1372;
    float _1394 = _1390;
    if (!_1392)
    {
        float _1396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1400 = _1340 + _1398;
        float _1402 = _1382 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = rsqrt(_1332);
        float _1406 = _1400 * _1396;
        float _1408 = _1406 * 0.15915493667125701904296875;
        float _1410 = _1408 * 6.283185482025146484375;
        float _1412 = cos(_1410);
        float _1414 = _1408 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        float _1418 = _1412 + (-1.0);
        float _1420 = fma(_1416, _1402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1422 = _1418 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1424 = _1404 * _1420;
        float _1426 = fma(_1382, _1412, _1422);
        float _1428 = fma(_1310, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1430 = fma(_1306, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1394 = _1426;
        _1312 = _1428;
        _1314 = _1430;
    }
    float _1432 = _1394;
    float _1434 = _1312;
    float _1436 = _1314;
    float _1438 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1440 = -_1086;
    float _1442 = _1440 + _1432;
    float _1444 = -_1088;
    float _1446 = _1444 + _1434;
    float _1448 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1450 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1438);
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1454 = _1442 + _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1458 = _1446 + _1456;
    float _1460 = -_1140;
    float _1462 = _1460 + _1436;
    float _1464 = _1454 * _1454;
    float _1466 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1448);
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1470 = _1462 + _1468;
    float _1472 = fma(_1458, _1458, _1464);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1476 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1478 = fma(_1470, _1470, _1472);
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1484 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1476);
    float _1486 = sqrt(_1478);
    float _1488 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1450);
    float _1490 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1492 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1484);
    float _1494 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1376);
    float _1496 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1386 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1502 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1504 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1370);
    float _1506 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1378);
    out.m_85.w = _1056;
    float _1508 = -_1088;
    float _1510 = _916 + _1508;
    float _1512 = -_1086;
    float _1514 = _902 + _1512;
    out.m_87.x = _1490;
    out.m_87.y = _1496;
    out.m_87.z = _1498;
    out.m_87.w = _1500;
    bool _1516 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1518 = isnan(_1486);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1524 = _1520 || _1522;
    float _1526 = -_1140;
    float _1528 = _924 + _1526;
    out.m_89.x = _1492;
    out.m_89.y = _1488;
    out.m_89.z = _1502;
    out.m_91.x = _1246;
    out.m_93.x = _1504;
    out.m_93.y = _1494;
    out.m_93.z = _1506;
    if (!_1524)
    {
        _1388 = 1.0;
    }
    float _1530 = _1388;
    bool _1532 = !_1524;
    float _1534 = _1530;
    if (!_1532)
    {
        bool _1536 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1538 = isnan(_1486);
        bool _1540 = _1536 || _1538;
        bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1544 = _1540 || _1542;
        if (!_1544)
        {
            float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1548 = _1486 + _1546;
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1552 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1550;
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1558 = 1.0 / _1552;
            float _1560 = _1548 * _1558;
            float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1534 = _1562;
            _1564 = true;
        }
        else
        {
            bool _1566 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1568 = isnan(_1486);
            bool _1570 = _1566 || _1568;
            bool _1572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1574 = _1570 || _1572;
            if (!_1574)
            {
                float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1578 = _1486 + _1576;
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1582 = _1580 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1586 = _1584 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1588 = 1.0 / _1582;
                float _1590 = _1578 * _1588;
                float _1592 = fma(_1590, _1586, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1534 = _1592;
                _1564 = true;
            }
            else
            {
                _1534 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1564 = false;
    float _1594 = _1534;
    float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1598 = _1442 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1602 = _1446 + _1600;
    float _1604 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1608 = _1462 + _1606;
    float _1610 = fma(_1602, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1614 = _1604 + _1612;
    float _1616 = fma(_1608, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1620 = _1610 + _1618;
    float _1622 = _1614 * _1614;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1626 = _1616 + _1624;
    float _1628 = fma(_1620, _1620, _1622);
    float _1630 = fma(_1626, _1626, _1628);
    float _1632 = rsqrt(_1630);
    float _1634 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1636 = _1620 * _1634;
    float _1638 = _1626 * _1634;
    float _1640 = _1636 * _1636;
    float _1642 = _1638 * _1638;
    float _1644 = _1640 + _1642;
    float _1646 = sqrt(_1644);
    bool _1648 = _1646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1646 + _1650;
    float _1654 = _1632;
    float _1656 = _1652;
    float _1658 = _1614;
    if (_1648)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1660;
    }
    float _1662 = _1654;
    if (_1648)
    {
        float _1664 = rsqrt(_1644);
        _964 = _1664;
    }
    float _1666 = _964;
    float _1668 = _1666;
    if (_1648)
    {
        float _1670 = _1652 * _1662;
        _1656 = _1670;
    }
    float _1672 = _1656;
    float _1674 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1648)
    {
        float _1676 = _1672 * 0.15915493667125701904296875;
        _966 = _1676;
    }
    float _1678 = _966;
    float _1680 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1674);
    float _1682 = _1626;
    float _1684 = _1678;
    if (_1648)
    {
        float _1686 = _1678 * 6.283185482025146484375;
        float _1688 = sin(_1686);
        _1682 = _1688;
    }
    float _1690 = _1682;
    float _1692 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1694 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1680);
    float _1696 = precise::max(0.0, _1692);
    float _1698 = _1086;
    float _1700 = _1696;
    float _1702 = _1692;
    if (_1648)
    {
        float _1704 = _1678 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        _1698 = _1706;
    }
    float _1708 = _1698;
    float _1710 = -_1634;
    float _1712 = -_1696;
    float _1714 = fma(_1614, _1710, _1712);
    if (_1648)
    {
        float _1716 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1700 = _1716;
    }
    float _1718 = _1700;
    float _1720 = _1718;
    if (!_1648)
    {
        _1684 = _1636;
    }
    float _1722 = _1684;
    float _1724 = _1690;
    float _1726 = _1722;
    if (_1648)
    {
        float _1728 = fma(_1690, _1718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1720 = _1728;
    }
    float _1730 = _1720;
    float _1732 = _1730;
    if (!_1648)
    {
        _1724 = _1714;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (_1648)
    {
        float _1738 = _1708 + (-1.0);
        _1702 = _1738;
    }
    float _1740 = _1702;
    float _1742 = _1740;
    if (_1648)
    {
        float _1744 = _1666 * _1730;
        _1658 = _1744;
    }
    float _1746 = _1658;
    float _1748 = _1746;
    if (!_1648)
    {
        _1668 = _1638;
    }
    float _1750 = _1668;
    float _1752 = _1750;
    if (_1648)
    {
        float _1754 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1742 = _1754;
    }
    float _1756 = _1742;
    if (_1648)
    {
        float _1758 = _1636 * _1746;
        _1726 = _1758;
    }
    float _1760 = _1726;
    if (_1648)
    {
        float _1762 = _1638 * _1746;
        _1752 = _1762;
    }
    float _1764 = _1752;
    if (!_1648)
    {
        _1732 = _1640;
    }
    float _1766 = _1732;
    float _1768 = _1766;
    if (_1648)
    {
        float _1770 = fma(_1714, _1708, _1756);
        _1736 = _1770;
    }
    float _1772 = _1736;
    if (_1648)
    {
        float _1774 = _1760 * _1760;
        _1768 = _1774;
    }
    float _1776 = _1768;
    if (!_1648)
    {
        _1748 = _1642;
    }
    float _1778 = _1748;
    float _1780 = sqrt(_1630);
    float _1782 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1784 = _1778;
    if (_1648)
    {
        float _1786 = _1764 * _1764;
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = fma(_1772, _1772, _1776);
    float _1792 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = _1790 + _1788;
    float _1796 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1798 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1800 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1802 = rsqrt(_1794);
    float _1804 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1806 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1798);
    float _1808 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1800);
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1812 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1810);
    float _1814 = precise::clamp(_1812, 0.0, 1.0);
    float _1816 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1804);
    float _1818 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1806);
    float _1820 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1808);
    float _1822 = -_1814;
    float _1824 = _1822 + 1.0;
    float _1826 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1828 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1830 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1832 = floor(_1782);
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1838 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1840 = _1802 * _1760;
    float _1842 = _1802 * _1764;
    float _1844 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1836);
    float _1846 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1848 = abs(_1824);
    float _1850 = log2(_1848);
    float _1852 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1854 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1856 = _1802 * _1772;
    float _1858 = -_1838;
    float _1860 = fma(_1858, _1834, 1.0);
    float _1862 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1854);
    float _1864 = -_1852;
    float _1866 = fma(_1856, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1864);
    float _1868 = floor(_1796);
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1872 = -_1832;
    float _1874 = _1782 + _1872;
    float _1876 = -_1842;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1866);
    float _1880 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1882 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1870);
    float _1884 = fma(_1878, -0.5, 0.5);
    float _1886 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1888 = log2(_1860);
    float _1890 = fma(_1878, 0.5, 0.5);
    float _1892 = _1856 + 1.0;
    float _1894 = -_1868;
    float _1896 = _1796 + _1894;
    float _1898 = exp2(_1886);
    float _1900 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1880);
    float _1902 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1882);
    float _1904 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1900);
    float _1906 = sqrt(_1884);
    float _1908 = fma(_1890, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1910 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1904);
    float _1912 = _1888 * 0.693147182464599609375;
    float _1914 = fma(_1890, _1908, -0.212114393711090087890625);
    float _1916 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1918 = 1.0 / _1862;
    float _1920 = -_1856;
    float _1922 = fma(_1898, _1892, _1920);
    float _1924 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1902);
    float _1926 = fma(_1890, _1914, 1.570728778839111328125);
    float _1928 = _1906 * 0.636619746685028076171875;
    float _1930 = -_1926;
    float _1932 = fma(_1928, _1930, 1.0);
    float _1934 = fma(_1922, 0.5, 0.5);
    float _1936 = _1910 * _1918;
    float _1938 = _1924 * _1918;
    float _1940 = fma(_1936, 0.5, 0.5);
    float _1942 = fma(_1938, -0.5, 0.5);
    float2 _5643 = float2(_1874, _1896);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5643, float2(0.0), isnan(_5643)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5643, float2(0.0), isnan(_5643)), level(0.0)).x;
    float3 _5654 = float3(_1940, _1942, _1916);
    float _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5654, float3(0.0), isnan(_5654)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5654, float3(0.0), isnan(_5654)), level(0.0)).x;
    float3 _5665 = float3(_1940, _1942, _1916);
    float4 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5665, float3(0.0), isnan(_5665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5665, float3(0.0), isnan(_5665)), level(0.0)).xyzw;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _1949.w;
    float2 _5681 = float2(_1932, _1934);
    float3 _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5681, float2(0.0), isnan(_5681)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5681, float2(0.0), isnan(_5681)), level(0.0)).xyz;
    float _1963 = _1961.x;
    float _1965 = _1961.y;
    float _1967 = _1961.z;
    float _1969 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1971 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_95.x = _1510;
    out.m_95.y = _1514;
    out.m_95.z = _1528;
    float _1973 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1969);
    float _1975 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1971);
    float _1977 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1973);
    float _1979 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1981 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1975);
    float _1983 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1985 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1979);
    float _1987 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1989 = 1.0 / _1983;
    float _1991 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1985);
    float _1993 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1995 = _1862 * 0.5;
    out.gl_Position.x = _1910;
    out.gl_Position.y = _1924;
    out.gl_Position.z = _1987;
    out.gl_Position.w = _1862;
    float _1997 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1999 = exp2(_1993);
    float _2001 = _1997 + _1983;
    float _2003 = _2001 * _1989;
    float _2005 = _2003 * 0.5;
    float _2007 = _1910 + _1862;
    float _2009 = fma(_1924, -0.5, _1995);
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2013 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2011);
    float _2015 = _2007 * 0.5;
    float _2017 = 1.0 / _2013;
    bool _2019 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan(0.5);
    bool _2027 = _2023 || _2025;
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2031 = _2017 * _2029;
    float _2033 = abs(_2031);
    float _2035 = log2(_2033);
    bool _2037 = _2031 <= 8000.0;
    bool _2039 = isnan(_2031);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(8000.0);
    bool _2045 = _2041 || _2043;
    float _2047 = float(_2045);
    float _2049 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2051 = exp2(_2049);
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2055 = precise::clamp(_2053, 0.0, 1.0);
    float _2057 = fma(_2055, -2.0, 3.0);
    float _2059 = _2055 * _2055;
    float _2061 = _2059 * _2057;
    float _2063 = in.m_97.x;
    float _2065 = -_2061;
    float _2067 = _2065 + 1.0;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2061);
    float _2071 = _2047 * _2069;
    float _2073 = _1987 + _1862;
    float _2075 = _2073 * 0.5;
    float _2077 = _2073;
    float _2079 = _2075;
    float _2081 = _2015;
    if (_2027)
    {
        _2077 = 1.0;
    }
    float _2083 = _2077;
    float _2085 = _2083;
    float _2087 = _1953;
    float _2089 = _1951;
    if (!_2027)
    {
        float _2091 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = _2093 * 6.283185482025146484375;
        float _2097 = cos(_2095);
        float _2099 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2101 = _2099 * 0.15915493667125701904296875;
        float _2103 = _2093 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = 1.0 / _2097;
        float _2109 = _2101 * 6.283185482025146484375;
        float _2111 = cos(_2109);
        float _2113 = _2105 * _2107;
        float _2115 = _2101 * 6.283185482025146484375;
        float _2117 = sin(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = 1.0 / _2119;
        float _2123 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2125 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2123;
        float _2127 = 1.0 / _2125;
        float _2129 = _2117 * _2121;
        float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2133 = fma(_2031, _2129, _2131);
        float _2135 = _2133 * _2127;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        _2085 = _2137;
    }
    float _2139 = _2085;
    float _2141 = -_1999;
    float _2143 = _2141 + 1.0;
    float _2145 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2147 = -_1944;
    float _2149 = _2147 + 1.0;
    float _2151 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_99.x = _2015;
    out.m_99.y = _2009;
    out.m_99.z = _2075;
    out.m_99.w = _1862;
    float _2153 = _2149 * _2145;
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    bool _2157 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2159 = isnan(_1780);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2165 = _2161 || _2163;
    float _2167 = _2151 * _1946;
    float _2169 = -_2151;
    float _2171 = _2169 + 1.0;
    float _2173 = -_2155;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_101.x = _1610;
    out.m_101.y = _1604;
    out.m_101.z = _1616;
    float _2177 = _1957 * _2167;
    float _2179 = _1967 * _2167;
    float _2181 = _2175 * _2063;
    float _2183 = _1957 * _2171;
    float _2185 = fma(_1963, _2177, _1951);
    float _2187 = fma(_1965, _2177, _1953);
    float _2189 = fma(_1957, _2179, _1955);
    float _2191 = _2181 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2193 = _2167;
    float _2195 = _2181;
    if (!_2165)
    {
        _2087 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2197 = _2087;
    float _2199 = _2139 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2185;
    out.m_103.y = _2187;
    out.m_103.z = _2189;
    out.m_103.w = _2183;
    float _2201 = _2197;
    float _2203 = _2197;
    if (!_2165)
    {
        _2079 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2205 = _2079;
    float _2207 = _2205;
    float _2209 = _2205;
    if (!_2165)
    {
        _2081 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2211 = _2081;
    out.m_105.x = _2191;
    float _2213 = _2211;
    float _2215 = _2211;
    if (!_2165)
    {
        _2089 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2217 = _2089;
    float _2219 = _2217;
    float _2221 = _2217;
    if (!_2165)
    {
        _2193 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2223 = _2193;
    float _2225 = _2223;
    float _2227 = _2223;
    if (!_2165)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2229 = _2195;
    bool _2231 = !_2165;
    float _2233 = _2229;
    float _2235 = _2229;
    if (!_2231)
    {
        bool _2237 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2239 = isnan(_1780);
        bool _2241 = _2237 || _2239;
        bool _2243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2245 = _2241 || _2243;
        if (!_2245)
        {
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2249 = _1780 + _2247;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2253 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2251;
            float _2255 = 1.0 / _2253;
            float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2277 = _2249 * _2255;
            float _2279 = precise::clamp(_2277, 0.0, 1.0);
            float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2285 = fma(_2279, _2259, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2287 = fma(_2279, _2283, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2289 = fma(_2279, _2263, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2291 = fma(_2279, _2267, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2293 = fma(_2279, _2271, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2295 = fma(_2279, _2275, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2209 = _2285;
            _2227 = _2293;
            _2203 = _2287;
            _2221 = _2291;
            _2215 = _2289;
            _2235 = _2295;
            _2297 = true;
        }
        else
        {
            bool _2299 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2301 = isnan(_1780);
            bool _2303 = _2299 || _2301;
            bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2307 = _2303 || _2305;
            if (!_2307)
            {
                _2201 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2309 = _2201;
            _2203 = _2309;
            if (!_2307)
            {
                _2207 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2311 = _2207;
            _2209 = _2311;
            if (!_2307)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2313 = _2213;
            _2215 = _2313;
            if (!_2307)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2315 = _2219;
            _2221 = _2315;
            if (!_2307)
            {
                _2225 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2317 = _2225;
            _2227 = _2317;
            if (!_2307)
            {
                _2233 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2319 = _2233;
            bool _2321 = !_2307;
            _2235 = _2319;
            if (!_2321)
            {
                bool _2323 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2325 = isnan(_1780);
                bool _2327 = _2323 || _2325;
                bool _2329 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2331 = _2327 || _2329;
                if (!_2331)
                {
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2335 = _1780 + _2333;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2337;
                    float _2341 = 1.0 / _2339;
                    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2357 = _2355 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2363 = _2335 * _2341;
                    float _2365 = precise::clamp(_2363, 0.0, 1.0);
                    float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2371 = fma(_2365, _2345, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2373 = fma(_2365, _2369, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2375 = fma(_2365, _2349, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2377 = fma(_2365, _2353, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2379 = fma(_2365, _2357, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2381 = fma(_2365, _2361, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2209 = _2371;
                    _2227 = _2379;
                    _2203 = _2373;
                    _2221 = _2377;
                    _2215 = _2375;
                    _2235 = _2381;
                    _2297 = true;
                }
                else
                {
                    _2209 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2227 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2203 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2235 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2297 = false;
    float _2383 = _2209;
    float _2385 = _2227;
    float _2387 = _2203;
    float _2389 = _2221;
    float _2391 = _2215;
    float _2393 = _2235;
    float _2395 = fma(_1494, -0.5, 0.5);
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = -_2383;
    float _2401 = _2399 + _2385;
    float _2403 = _2199 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2405 = -_2387;
    float _2407 = _2405 + _2389;
    out.m_107.x = 0.0;
    float _2409 = fma(_2397, _2401, _2383);
    float _2411 = fma(_2397, _2407, _2387);
    out.m_51.x = _2403;
    float _2413 = -_2391;
    float _2415 = _2413 + _2393;
    float _2417 = _2409 * 0.586610972881317138671875;
    bool _2419 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2421 = fma(_2397, _2415, _2391);
    float _2423 = fma(_2411, 0.298911988735198974609375, _2417);
    bool _2425 = _2139 > 0.0;
    bool _2427 = isnan(_2139);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = fma(_2421, 0.114477999508380889892578125, _2423);
    float _2437 = -_2435;
    float _2439 = _2411 + _2437;
    float _2441 = -_2435;
    float _2443 = _2409 + _2441;
    float _2445 = -_2435;
    float _2447 = _2421 + _2445;
    float _2449 = fma(_2439, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2435);
    float _2451 = fma(_2443, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2435);
    float _2453 = fma(_2447, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2435);
    bool _2455 = !_2419;
    if (!_2455)
    {
        float _2457 = -_1604;
        float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2461 = -_1610;
        float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2465 = -_1616;
        float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2469 = _2459 * _2459;
        float _2471 = fma(_2463, _2463, _2469);
        float _2473 = fma(_2467, _2467, _2471);
        float _2475 = sqrt(_2473);
        float _2477 = rsqrt(_2473);
        float _2479 = -_2475;
        float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2483 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2485 = precise::clamp(_2483, 0.0, 1.0);
        float _2487 = _2463 * _2477;
        float _2489 = _2459 * _2477;
        float _2491 = abs(_2485);
        float _2493 = log2(_2491);
        float _2495 = _2467 * _2477;
        float _2497 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2499 = _1494 * _2489;
        float _2501 = -_2489;
        float _2503 = -_2497;
        float _2505 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2503);
        float _2507 = fma(_1504, _2487, _2499);
        float _2509 = -_2495;
        float _2511 = fma(_2509, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2505);
        float _2513 = fma(_1506, _2495, _2507);
        float _2515 = precise::clamp(_2513, 0.0, 1.0);
        float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2519 = _2511 + _2517;
        float _2521 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2523 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2525 = precise::clamp(_2523, 0.0, 1.0);
        float _2527 = exp2(_2521);
        float _2529 = _2527 * _2525;
        float _2531 = _2515 * _2529;
        float _2533 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2535 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2537 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2533;
        out.m_107.y = _2535;
        out.m_107.z = _2537;
    }
    out.m_85.x = _2449;
    out.m_85.y = _2451;
    out.m_85.z = _2453;
    if (_2433)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2539;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

