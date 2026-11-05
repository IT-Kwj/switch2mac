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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_2C [[id(7)]];
    sampler vp_t_tcb_2CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_28 [[id(9)]];
    sampler vp_t_tcb_28Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_24 [[id(11)]];
    sampler vp_t_tcb_24Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_2CSmplr_w [[id(19)]];
    sampler vp_t_tcb_28Smplr_w [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_73 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_69 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2241 = false;
    bool _1530 = false;
    bool _508 = false;
    bool _354 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_52.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_55.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2540 = as_type<float>(_124);
        out.gl_Position.z = _2540;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_57.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_55.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2609 = as_type<float>(_162);
        out.gl_Position.z = _2609;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_59.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _214 = _194 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = 1.0 / _218;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _222;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _230;
    float _234 = _198 * _224;
    bool _236 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_194);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_210;
    float _250 = _248 + 1.0;
    bool _252 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_194);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = fma(_232, _234, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _266 = _262 * _250;
    float _268 = -_262;
    float _270 = _268 + 1.0;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _276;
    float _280 = _214 * _228;
    float _282 = _246 * _270;
    float _284 = fma(_274, _234, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _234, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _288 = -_246;
    float _290 = _288 + 1.0;
    float _292 = _264 * _282;
    float _294 = _284 * _282;
    float _296 = _286 * _282;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _310 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _312 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _314 = fma(_300, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_304, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_308, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _320 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].z, _296);
    float _322 = fma(_314, _266, _310);
    float _324 = fma(_316, _266, _312);
    float _326 = fma(_318, _266, _320);
    float _328 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].x, _322);
    float _330 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].y, _324);
    float _332 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].z, _326);
    bool _334 = !_226;
    float _352;
    if (!_334)
    {
        float _336 = in.m_59.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_108);
        float _358 = 1.0 / _356;
        float _360 = _142 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _368 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _370 = isnan(_362);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _384 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _386 = isnan(_362);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _366;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _398;
    float _402 = -_378;
    float _404 = _402 + 1.0;
    bool _406 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _408 = isnan(_362);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _420 = 1.0 / _382;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _426 = in.m_61.x;
    float _428 = in.m_61.y;
    float _430 = in.m_61.z;
    float _432 = _400 * _396;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _362 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _440 = _362 + _438;
    float _442 = fma(_432, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _444 = _394 * _404;
    float _446 = -_394;
    float _448 = _446 + 1.0;
    float _450 = _424 * _420;
    float _452 = -_416;
    float _454 = _452 + 1.0;
    float _456 = _442 * _444;
    float _458 = fma(_450, _440, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _460 = _378 * _454;
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _464 = fma(_458, _460, _462);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _470 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[117].x, _464);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _474 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _478 = _470 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _480 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _332 * _430;
    float _484 = _330 * _428;
    float _486 = _328 * _426;
    out.m_63.x = _474;
    out.m_63.y = _476;
    out.m_63.z = _480;
    out.m_63.w = _478;
    bool _488 = !_418;
    float _506;
    if (!_488)
    {
        float _490 = in.m_59.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_108);
        float _512 = 1.0 / _510;
        float _514 = _142 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    float _518 = in.m_59.z;
    float _520 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _522 = log2(_520);
    float _524 = in.m_59.x;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _528 = _526 != 0;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _536 = _534 != 0;
    float _538 = in.m_59.y;
    float _540 = _522 * _142;
    float _542 = _518 * 2.0;
    float _544 = _524 * 2.0;
    float _546 = floor(_542);
    float _548 = _538 * 2.0;
    float _550 = _524 + _538;
    float _552 = _550 + (-1.0);
    float _554 = floor(_544);
    bool _556 = _546 > 0.0;
    float _558 = floor(_548);
    bool _560 = _546 >= 0.0;
    bool _562 = isnan(_546);
    bool _564 = _560 || _562;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _576 = _568 ? 0 : 1;
    float _578 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _580 = _554 >= 0.0;
    bool _582 = isnan(_554);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = -_570;
    float _592 = fma(_574, 2.0, _590);
    int _594 = ~_576;
    int _596 = _594 + 1;
    int _598 = _596 + 1;
    float _600 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _602 = fma(_578, -2.0, _572);
    int _604 = _598;
    if (!_556)
    {
        int _606 = ~_576;
        int _608 = _606 + 1;
        _604 = _608;
    }
    int _610 = _604;
    float _612 = in.m_65.x;
    float _614 = in.m_65.y;
    float _616 = in.m_65.z;
    float _618 = exp2(_540);
    bool _620 = _558 > 0.0;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _624 = _558 >= 0.0;
    bool _626 = isnan(_558);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _602);
    int _636 = _588 ? 0 : 1;
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _650 = 1.0 + _648;
    bool _652 = !_528;
    int _654 = _652 ? 0 : 1;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _658 = _554 > 0.0;
    float _660 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _622);
    float _662 = 1.0 / _650;
    int _664 = abs(_654);
    float _666 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].z, _656);
    float _668 = -_618;
    float _670 = _668 + 1.0;
    float _672 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _660);
    float _674 = float(_664);
    float _676 = -_142;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[76].x, _592);
    float _680 = float(_610);
    float _682 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _666);
    bool _684 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _692 = _688 || _690;
    bool _694 = !_532;
    int _696 = _694 ? 0 : 1;
    float _698 = _674 * _680;
    int _700 = ~_636;
    int _702 = _700 + 1;
    int _704 = _702 + 1;
    float _706 = _692 ? _670 : 0.0;
    float _708 = _698 * (-2.0);
    int _710 = _704;
    if (!_658)
    {
        int _712 = ~_636;
        int _714 = _712 + 1;
        _710 = _714;
    }
    int _716 = _710;
    int _718 = abs(_696);
    if (_646)
    {
        float _720 = _706 * _662;
        _146 = _720;
    }
    float _722 = _146;
    bool _724 = !_536;
    int _726 = _724 ? 0 : 1;
    float _728 = _524 + (-0.5);
    float _730 = float(_718);
    float _732 = fma(_708, _612, _612);
    float _734 = float(_716);
    float _736 = fma(_600, _708, _600);
    int _738 = _632 ? 0 : 1;
    float _740 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[196].x, _732);
    int _742 = abs(_726);
    float _744 = _730 * _734;
    int _746 = ~_738;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = _538 + _518;
    int _754 = _750;
    if (!_620)
    {
        int _756 = ~_738;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = fma(_736, _722, _740);
    float _764 = _752 + (-1.0);
    float _766 = float(_760);
    float _768 = _744 * (-2.0);
    float _770 = float(_742);
    float _772 = _762 * 0.15915493667125701904296875;
    float _774 = fma(_768, _614, _614);
    float _776 = _770 * _766;
    float _778 = _538 + (-0.5);
    float _780 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _782 = _524 + _518;
    float _784 = _776 * (-2.0);
    float _786 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].y, _774);
    float _788 = fma(_780, _768, _780);
    float _790 = _782 + (-1.0);
    float _792 = fma(_784, _616, _616);
    float _794 = _772 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = fma(_788, _722, _786);
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _802 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _804 = in.m_67.x;
    float _806 = in.m_67.y;
    float _808 = in.m_67.z;
    float _810 = _798 * 0.15915493667125701904296875;
    float _812 = _518 + (-0.5);
    float _814 = fma(_800, _784, _800);
    float _816 = _772 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _792);
    float _822 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _824 = fma(_814, _722, _820);
    float _826 = _810 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _832 = _824 * 0.15915493667125701904296875;
    float _834 = in.m_52.x;
    float _836 = in.m_52.y;
    float _838 = in.m_52.z;
    float _840 = _810 * 6.283185482025146484375;
    float _842 = cos(_840);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _806);
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _804);
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _850 = _832 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _844 * _830;
    float _856 = _796 * _828;
    float _858 = _818 * _828;
    float _860 = _846 * _822;
    float _862 = _848 * _802;
    float _864 = _832 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _796 * _842;
    float _870 = _818 * _842;
    float _872 = _836 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _874 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[4].x, _872);
    float _876 = _796 * _852;
    float _878 = _818 * _852;
    float _880 = _842 * _852;
    float _882 = _828 * _852;
    float _884 = _876 * _854;
    float _886 = _878 * _854;
    float _888 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[4].z, _874);
    float _890 = fma(_866, _868, _858);
    float _892 = fma(_866, _858, _868);
    float _894 = -_854;
    float _896 = _866 * _894;
    float _898 = -_856;
    float _900 = fma(_866, _870, _898);
    float _902 = -_870;
    float _904 = fma(_866, _856, _902);
    float _906 = fma(_890, _860, _884);
    float _908 = fma(_880, _860, _896);
    float _910 = fma(_900, _860, _886);
    float _912 = _836 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _914 = fma(_904, _862, _906);
    float _916 = fma(_882, _862, _908);
    float _918 = fma(_892, _862, _910);
    float _920 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[6].x, _912);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = _888 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _928 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[6].z, _920);
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[8].x, _922);
    float _932 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _934 = _836 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _936 = _928 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _938 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _940 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[10].z, _932);
    float _942 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[5].x, _934);
    float _944 = _926 + _938;
    float _946 = _936 + _940;
    float _948 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _952 = _944 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _956 = _946 + _954;
    float _958 = fma(_926, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _960 = _952 * _952;
    float _962 = _956 * _956;
    float _964 = floor(_958);
    float _966 = _960 + _962;
    float _968 = sqrt(_966);
    bool _970 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _974 = _968 + _972;
    float _976 = _930;
    float _978 = _838;
    float _980 = _968;
    float _982 = _944;
    int _984 = as_type<int>(_804);
    float _986 = _960;
    float _988 = _962;
    if (_970)
    {
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _990;
    }
    float _992 = _976;
    if (_970)
    {
        float _994 = rsqrt(_966);
        _978 = _994;
    }
    float _996 = _978;
    float _998 = _992;
    if (_970)
    {
        float _1000 = _974 * _992;
        _980 = _1000;
    }
    float _1002 = _980;
    if (_970)
    {
        float _1004 = _1002 * 0.15915493667125701904296875;
        _998 = _1004;
    }
    float _1006 = _998;
    float _1008 = _914 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1010 = _914;
    if (_970)
    {
        float _1012 = _1006 * 6.283185482025146484375;
        float _1014 = sin(_1012);
        _1010 = _1014;
    }
    float _1016 = _1010;
    float _1018 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1008);
    float _1020 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    float _1022 = _948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1024 = fma(_936, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1026 = _1022 + _1020;
    float _1028 = -_964;
    float _1030 = _958 + _1028;
    float _1032 = floor(_1024);
    float _1034 = _1026;
    if (_970)
    {
        float _1036 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1036;
    }
    float _1038 = _1034;
    float _1040 = _1038;
    float _1042 = _1016;
    if (_970)
    {
        float _1044 = fma(_1016, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1044;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    if (!_970)
    {
        _1042 = _946;
    }
    float _1050 = _1042;
    float _1052 = _1050;
    if (_970)
    {
        float _1054 = _996 * _1046;
        _1048 = _1054;
    }
    float _1056 = _1048;
    if (_970)
    {
        float _1058 = fma(_952, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _982 = _1058;
    }
    float _1060 = _982;
    if (_970)
    {
        float _1062 = fma(_956, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1052 = _1062;
    }
    float _1064 = _1052;
    float _1066 = -_1032;
    float _1068 = _1024 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1072 = _1060 + _1070;
    float _1074 = fma(_1060, 6.2500002968590706586837768554688e-05, 0.5);
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1078 = _1064 + _1076;
    float _1080 = fma(_1064, 6.2500002968590706586837768554688e-05, 0.5);
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1084 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4065 = float2(_1074, _1080);
    float _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_4065, float2(0.0), isnan(_4065)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_4065, float2(0.0), isnan(_4065)), level(0.0)).y;
    float2 _4075 = float2(_1082, _1084);
    float _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4075, float2(0.0), isnan(_4075)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4075, float2(0.0), isnan(_4075)), level(0.0)).x;
    float2 _4083 = float2(_1030, _1068);
    float _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4083, float2(0.0), isnan(_4083)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4083, float2(0.0), isnan(_4083)), level(0.0)).x;
    float _1092 = in.m_69.y;
    float _1094 = in.m_59.w;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1102 = _1100 != 0;
    float _1104 = 1.0 / _1098;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1120 = _1118 != 0;
    float _1122 = 1.0 / _1112;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1126 = _1124 != 0;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1128;
    bool _1132 = _538 > 0.5;
    bool _1134 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1136 = isnan(_516);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -_1092;
    float _1148 = _1146 + 1.0;
    float _1150 = in.m_69.x;
    float _1152 = 1.0 / _1108;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1158 = _1094 > 0.5;
    float _1160 = _1130 * _1104;
    float _1162 = -_1144;
    float _1164 = _1162 + 1.0;
    bool _1166 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1168 = isnan(_516);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    int _1178 = _1158 ? as_type<int>(_1148) : as_type<int>(_1092);
    bool _1180 = _1158;
    bool _1182 = _1126;
    float _1184 = _1092;
    if (_1102)
    {
        bool _1186 = _524 > 0.5;
        _1180 = _1186;
    }
    bool _1188 = _1180;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1192 = _516 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1194;
    float _1198 = _1126 ? as_type<float>(_1178) : _1092;
    float _1200 = _1156 * _1152;
    if (_1116)
    {
        bool _1202 = _518 > 0.5;
        _1182 = _1202;
    }
    bool _1204 = _1182;
    float _1206 = _1196 * _1122;
    bool _1208 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1210 = isnan(_516);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = fma(_1160, _1192, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1120)
    {
        float _1222 = _1132 ? _1148 : _1092;
        _1184 = _1222;
    }
    float _1224 = _1184;
    float _1226 = in.m_71.x;
    float _1228 = in.m_71.y;
    float _1230 = in.m_71.z;
    bool _1232 = _806 != 0.0;
    bool _1234 = isnan(_806);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan(0.0);
    bool _1240 = _1236 || _1238;
    float _1242 = -_1218;
    float _1244 = _1242 + 1.0;
    bool _1246 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1248 = isnan(_516);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1260 = _804 == 0.0;
    bool _1262 = !_1240;
    bool _1264 = _1260 && _1262;
    float _1266 = _1144 * _1244;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1270 = _516 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1274 = _516 + _1272;
    bool _1276 = _808 == 0.0;
    bool _1278 = _1276 && _1264;
    float _1280 = _1256 * _1164;
    float _1282 = fma(_1200, _1270, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1284 = fma(_1206, _1274, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1286 = -_1256;
    float _1288 = _1286 + 1.0;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1292 = _1274;
    if (!_1102)
    {
        _1292 = _1150;
    }
    float _1294 = _1292;
    float _1296 = _1176 * _1288;
    float _1298 = -_1176;
    float _1300 = _1298 + 1.0;
    float _1302 = _1220 * _1296;
    float _1304 = _1228;
    float _1306 = _1226;
    float _1308 = _1230;
    int _1310 = as_type<int>(_1302);
    float _1312 = _1294;
    if (!_1278)
    {
        float _1314 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1228);
        _1304 = _1314;
    }
    float _1316 = _1304;
    float _1318 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1278)
    {
        float _1320 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1226);
        _1306 = _1320;
    }
    float _1322 = _1306;
    if (!_1278)
    {
        float _1324 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1230);
        _1308 = _1324;
    }
    float _1326 = _1308;
    if (_1102)
    {
        float _1328 = -_1150;
        float _1330 = _1328 + 1.0;
        _984 = as_type<int>(_1330);
    }
    int _1332 = _984;
    float _1334 = fma(_1318, _1224, -0.5);
    float _1336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1338 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1340 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1302);
    float _1342 = as_type<float>(_1332);
    if (_1116)
    {
        float _1344 = -_1150;
        float _1346 = _1344 + 1.0;
        _1310 = as_type<int>(_1346);
    }
    int _1348 = _1310;
    if (_1102)
    {
        float _1350 = _1188 ? as_type<float>(_1332) : _1150;
        _1312 = _1350;
    }
    float _1352 = _1312;
    float _1354 = _876 * _1316;
    if (!_1116)
    {
        _1342 = _1150;
    }
    float _1356 = _1342;
    float _1358 = -_1316;
    float _1360 = _866 * _1358;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1364 = _1356;
    if (_1116)
    {
        float _1366 = _1204 ? as_type<float>(_1348) : _1150;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = fma(_1338, _1352, -0.5);
    float _1372 = _878 * _1316;
    float _1374 = fma(_890, _1322, _1354);
    float _1376 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1380 = -_634;
    float _1382 = fma(_672, _1334, _1380);
    float _1384 = fma(_682, _1370, _678);
    float _1386 = fma(_880, _1322, _1360);
    float _1388 = fma(_900, _1322, _1372);
    float _1390 = _1376 * _1336;
    float _1392 = _1382 + 0.5;
    float _1394 = fma(_1282, _1280, _1340);
    float _1396 = fma(_904, _1326, _1374);
    float _1398 = _1378 * _1362;
    float _1400 = _1384 + 0.5;
    float _1402 = fma(_882, _1326, _1386);
    float _1404 = fma(_892, _1326, _1388);
    out.m_73.x = _1400;
    out.m_73.y = _1392;
    out.m_73.z = _1398;
    out.m_73.w = _1390;
    float _1406 = fma(_1284, _1266, _1394);
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1410 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1412 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1414 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1406);
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1422 = fma(_1402, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1408);
    float _1424 = fma(_1402, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1412);
    float _1426 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1400;
    float _1432 = _1398;
    float _1434 = _1422;
    float _1436 = _1410;
    if (_970)
    {
        float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1440 = _1060 + _1438;
        _1430 = _1440;
    }
    float _1442 = _1430;
    if (_970)
    {
        float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1446 = _1064 + _1444;
        _1432 = _1446;
    }
    float _1448 = _1432;
    float _1450 = fma(_1402, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1410);
    float _1452 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_970)
    {
        float _1454 = _1442 * _1442;
        _986 = _1454;
    }
    float _1456 = _986;
    if (_970)
    {
        float _1458 = _1448 * _1448;
        _988 = _1458;
    }
    float _1460 = _988;
    float _1462 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1464 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1422);
    float _1466 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1450);
    float _1468 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1424);
    out.m_75.x = _1426;
    out.m_75.y = _1428;
    out.m_75.z = _1452;
    out.m_75.w = _1462;
    out.m_77.x = _1464;
    out.m_77.y = _1466;
    out.m_77.z = _1468;
    float _1470 = fma(_1086, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1472 = fma(_1088, 100.0, _1470);
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1476 = _1472 + _1474;
    float _1478 = fma(_1476, _1476, _1456);
    float _1480 = _1478 + _1460;
    float _1482 = sqrt(_1480);
    bool _1484 = _1482 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1486 = isnan(_1482);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1492 = _1488 || _1490;
    float _1494 = _1472;
    if (!_1492)
    {
        _1434 = 1.0;
    }
    float _1496 = _1434;
    bool _1498 = !_1492;
    float _1500 = _1496;
    if (!_1498)
    {
        bool _1502 = _1482 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1504 = isnan(_1482);
        bool _1506 = _1502 || _1504;
        bool _1508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1510 = _1506 || _1508;
        if (!_1510)
        {
            float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1514 = _1482 + _1512;
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1522 = _1520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1524 = 1.0 / _1518;
            float _1526 = _1514 * _1524;
            float _1528 = fma(_1526, _1522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1500 = _1528;
            _1530 = true;
        }
        else
        {
            bool _1532 = _1482 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1534 = isnan(_1482);
            bool _1536 = _1532 || _1534;
            bool _1538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1540 = _1536 || _1538;
            if (!_1540)
            {
                float _1542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1544 = _1482 + _1542;
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1554 = 1.0 / _1548;
                float _1556 = _1544 * _1554;
                float _1558 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1500 = _1558;
                _1530 = true;
            }
            else
            {
                _1500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1530 = false;
    float _1560 = _1500;
    float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1564 = _1472 + _1562;
    float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1568 = _1060 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1572 = _1064 + _1570;
    float _1574 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1576 = fma(_1568, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1578 = fma(_1572, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1574 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1576 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1578 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1590;
    float _1622 = _1572;
    float _1624 = _1618;
    float _1626 = _1600;
    if (_1614)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1628;
    }
    float _1630 = _1620;
    if (_1614)
    {
        float _1632 = rsqrt(_1610);
        _1622 = _1632;
    }
    float _1634 = _1622;
    float _1636 = _1634;
    if (_1614)
    {
        float _1638 = _1618 * _1630;
        _1624 = _1638;
    }
    float _1640 = _1624;
    if (_1614)
    {
        float _1642 = _1640 * 0.15915493667125701904296875;
        _1494 = _1642;
    }
    float _1644 = _1494;
    float _1646 = _1592;
    float _1648 = _1644;
    if (_1614)
    {
        float _1650 = _1644 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1646 = _1652;
    }
    float _1654 = _1646;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1598;
    float _1662 = _1656;
    float _1664 = _1658;
    if (_1614)
    {
        float _1666 = _1644 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1660 = _1668;
    }
    float _1670 = _1660;
    float _1672 = -_1600;
    float _1674 = -_1658;
    float _1676 = fma(_1582, _1672, _1674);
    float _1678 = _1676;
    if (_1614)
    {
        float _1680 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1680;
    }
    float _1682 = _1662;
    float _1684 = _1682;
    if (!_1614)
    {
        _1648 = _1606;
    }
    float _1686 = _1648;
    float _1688 = _1654;
    float _1690 = _1686;
    if (_1614)
    {
        float _1692 = fma(_1654, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1664 = _1692;
    }
    float _1694 = _1664;
    float _1696 = _1694;
    if (!_1614)
    {
        _1688 = _1602;
    }
    float _1698 = _1688;
    float _1700 = _1698;
    if (_1614)
    {
        float _1702 = _1670 + (-1.0);
        _1684 = _1702;
    }
    float _1704 = _1684;
    if (_1614)
    {
        float _1706 = _1634 * _1694;
        _1436 = _1706;
    }
    float _1708 = _1436;
    if (!_1614)
    {
        _1636 = _1676;
    }
    float _1710 = _1636;
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1714 = _1710;
    if (_1614)
    {
        float _1716 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1716;
    }
    float _1718 = _1626;
    if (_1614)
    {
        float _1720 = _1602 * _1708;
        _1700 = _1720;
    }
    float _1722 = _1700;
    if (!_1614)
    {
        _1696 = _1604;
    }
    float _1724 = _1696;
    float _1726 = _1724;
    if (_1614)
    {
        float _1728 = _1604 * _1708;
        _1726 = _1728;
    }
    float _1730 = _1726;
    if (_1614)
    {
        float _1732 = fma(_1676, _1670, _1718);
        _1714 = _1732;
    }
    float _1734 = _1714;
    if (_1614)
    {
        float _1736 = _1722 * _1722;
        _1690 = _1736;
    }
    float _1738 = _1690;
    float _1740 = sqrt(_1596);
    if (!_1614)
    {
        _1678 = _1608;
    }
    float _1742 = _1678;
    float _1744 = _1742;
    if (_1614)
    {
        float _1746 = _1730 * _1730;
        _1744 = _1746;
    }
    float _1748 = _1744;
    float _1750 = fma(_1734, _1734, _1738);
    float _1752 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1754 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1756 = _1750 + _1748;
    float _1758 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1760 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1752);
    float _1762 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1754);
    float _1764 = rsqrt(_1756);
    float _1766 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1758);
    float _1768 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1760);
    float _1770 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1762);
    float _1772 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1776 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1774);
    float _1778 = precise::clamp(_1776, 0.0, 1.0);
    float _1780 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1766);
    float _1782 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1784 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1786 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1772);
    float _1788 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1790 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1792 = -_1778;
    float _1794 = _1792 + 1.0;
    float _1796 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1798 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1800 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1790);
    float _1802 = _1764 * _1722;
    float _1804 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = abs(_1794);
    float _1808 = log2(_1806);
    float _1810 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1800);
    float _1812 = _1764 * _1734;
    float _1814 = _1764 * _1730;
    float _1816 = -_1798;
    float _1818 = fma(_1816, _1712, 1.0);
    float _1820 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1810);
    float _1822 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1824 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1826 = 1.0 / _1820;
    float _1828 = -_1822;
    float _1830 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1828);
    float _1832 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1824);
    float _1834 = -_1814;
    float _1836 = fma(_1834, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1830);
    float _1838 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1840 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1842 = log2(_1818);
    float _1844 = fma(_1836, -0.5, 0.5);
    float _1846 = fma(_1836, 0.5, 0.5);
    float _1848 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1838);
    float _1850 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1832);
    float _1852 = _1812 + 1.0;
    float _1854 = fma(_1846, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1856 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1848);
    float _1858 = exp2(_1840);
    float _1860 = fma(_1846, _1854, -0.212114393711090087890625);
    float _1862 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1856);
    float _1864 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1850);
    float _1866 = fma(_1846, _1860, 1.570728778839111328125);
    float _1868 = sqrt(_1844);
    float _1870 = _1842 * 0.693147182464599609375;
    float _1872 = _1864 * _1826;
    float _1874 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1876 = fma(_1872, -0.5, 0.5);
    float _1878 = -_1812;
    float _1880 = fma(_1858, _1852, _1878);
    float _1882 = _1862 * _1826;
    float _1884 = fma(_1880, 0.5, 0.5);
    float _1886 = fma(_1882, 0.5, 0.5);
    float _1888 = _1868 * 0.636619746685028076171875;
    float _1890 = -_1866;
    float _1892 = fma(_1888, _1890, 1.0);
    float3 _5442 = float3(_1886, _1876, _1874);
    float _1894 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5442, float3(0.0), isnan(_5442)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5442, float3(0.0), isnan(_5442)), level(0.0)).x;
    float3 _5453 = float3(_1886, _1876, _1874);
    float4 _1897 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5453, float3(0.0), isnan(_5453)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5453, float3(0.0), isnan(_5453)), level(0.0)).xyzw;
    float _1899 = _1897.x;
    float _1901 = _1897.y;
    float _1903 = _1897.z;
    float _1905 = _1897.w;
    float2 _5469 = float2(_1892, _1884);
    float3 _1909 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5469, float2(0.0), isnan(_5469)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5469, float2(0.0), isnan(_5469)), level(0.0)).xyz;
    float _1911 = _1909.x;
    float _1913 = _1909.y;
    float _1915 = _1909.z;
    float _1917 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1919 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1921 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1923 = -_1090;
    float _1925 = _1923 + 1.0;
    float _1927 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1917);
    float _1929 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1931 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1919);
    float _1933 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1927);
    float _1935 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1929);
    float _1937 = in.m_79.x;
    float _1939 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1941 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1935);
    float _1943 = exp2(_1921);
    float _1945 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1947 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1931);
    bool _1949 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(0.5);
    bool _1957 = _1953 || _1955;
    float _1959 = _1945 + _1939;
    float _1961 = 1.0 / _1939;
    float _1963 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1947);
    float _1965 = _1959 * _1961;
    float _1967 = _1965 * 0.5;
    float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1971 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1969);
    float _1973 = 1.0 / _1971;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1977 = _1973 * _1975;
    float _1979 = abs(_1977);
    float _1981 = log2(_1979);
    float _1983 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1985 = exp2(_1983);
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1989 = precise::clamp(_1987, 0.0, 1.0);
    float _1991 = -_1943;
    float _1993 = _1991 + 1.0;
    float _1995 = fma(_1989, -2.0, 3.0);
    float _1997 = _1989 * _1989;
    float _1999 = _1997 * _1995;
    bool _2001 = _1977 <= 8000.0;
    bool _2003 = isnan(_1977);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(8000.0);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1999;
    float _2015 = _2013 + 1.0;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1999);
    float _2019 = _2011 * _2017;
    float _2021 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2023 = _1963 + _1820;
    float _2025 = _1925 * _2021;
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = _2023 * 0.5;
    float _2031 = -_2027;
    float _2033 = fma(_2031, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2035 = _2033 * _1937;
    float _2037 = _2035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2039 = _2035;
    float _2041 = _1820;
    float _2043 = _1820;
    float _2045 = _2029;
    float _2047 = _1963;
    float _2049 = _1864;
    float _2051 = _1862;
    if (_1957)
    {
        _2039 = 1.0;
    }
    float _2053 = _2039;
    float _2055 = _2053;
    if (!_1957)
    {
        float _2057 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2059 = _2057 * 0.15915493667125701904296875;
        float _2061 = _2059 * 6.283185482025146484375;
        float _2063 = cos(_2061);
        float _2065 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2067 = _2065 * 0.15915493667125701904296875;
        float _2069 = _2059 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        float _2073 = 1.0 / _2063;
        float _2075 = _2067 * 6.283185482025146484375;
        float _2077 = cos(_2075);
        float _2079 = _2071 * _2073;
        float _2081 = _2067 * 6.283185482025146484375;
        float _2083 = sin(_2081);
        float _2085 = _2077 * _2079;
        float _2087 = 1.0 / _2085;
        float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2091 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2089;
        float _2093 = 1.0 / _2091;
        float _2095 = _2083 * _2087;
        float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2099 = fma(_1977, _2095, _2097);
        float _2101 = _2099 * _2093;
        float _2103 = precise::clamp(_2101, 0.0, 1.0);
        float _2105 = -_2103;
        float _2107 = _2105 + 1.0;
        _2055 = _2107;
    }
    float _2109 = _2055;
    float _2111 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2037;
    bool _2113 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2115 = isnan(_1740);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2121 = _2117 || _2119;
    float _2123 = _2111 * _1894;
    float _2125 = -_2111;
    float _2127 = _2125 + 1.0;
    out.gl_Position.x = _1862;
    out.gl_Position.y = _1864;
    out.gl_Position.z = _1963;
    out.gl_Position.w = _1820;
    float _2129 = _1905 * _2123;
    float _2131 = _1915 * _2123;
    float _2133 = _1905 * _2127;
    out.m_83.z = _2029;
    out.m_83.w = _1820;
    float _2135 = fma(_1911, _2129, _1899);
    float _2137 = fma(_1913, _2129, _1901);
    float _2139 = fma(_1905, _2131, _1903);
    float _2141 = _2109 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_85.x = _2135;
    out.m_85.y = _2137;
    out.m_85.z = _2139;
    out.m_85.w = _2133;
    if (!_2121)
    {
        _2041 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2143 = _2041;
    float _2145 = _2143;
    float _2147 = _2143;
    if (!_2121)
    {
        _2043 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2149 = _2043;
    float _2151 = _2149;
    float _2153 = _2149;
    if (!_2121)
    {
        _2045 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2155 = _2045;
    float _2157 = _2155;
    float _2159 = _2155;
    if (!_2121)
    {
        _2047 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2161 = _2047;
    float _2163 = _2161;
    float _2165 = _2161;
    if (!_2121)
    {
        _2049 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2167 = _2049;
    float _2169 = _2167;
    float _2171 = _2167;
    if (!_2121)
    {
        _2051 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2173 = _2051;
    bool _2175 = !_2121;
    float _2177 = _2173;
    float _2179 = _2173;
    if (!_2175)
    {
        bool _2181 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2183 = isnan(_1740);
        bool _2185 = _2181 || _2183;
        bool _2187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2189 = _2185 || _2187;
        if (!_2189)
        {
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2193 = _1740 + _2191;
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2195;
            float _2199 = 1.0 / _2197;
            float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2203 = _2201 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2221 = _2193 * _2199;
            float _2223 = precise::clamp(_2221, 0.0, 1.0);
            float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2227 = _2225 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2229 = fma(_2223, _2203, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2231 = fma(_2223, _2227, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2233 = fma(_2223, _2207, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2235 = fma(_2223, _2211, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2237 = fma(_2223, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2239 = fma(_2223, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2159 = _2231;
            _2171 = _2237;
            _2153 = _2229;
            _2165 = _2235;
            _2147 = _2233;
            _2179 = _2239;
            _2241 = true;
        }
        else
        {
            bool _2243 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2245 = isnan(_1740);
            bool _2247 = _2243 || _2245;
            bool _2249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2251 = _2247 || _2249;
            if (!_2251)
            {
                _2151 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2253 = _2151;
            _2153 = _2253;
            if (!_2251)
            {
                _2157 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2255 = _2157;
            _2159 = _2255;
            if (!_2251)
            {
                _2145 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2257 = _2145;
            _2147 = _2257;
            if (!_2251)
            {
                _2163 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2259 = _2163;
            _2165 = _2259;
            if (!_2251)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2261 = _2169;
            _2171 = _2261;
            if (!_2251)
            {
                _2177 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2263 = _2177;
            bool _2265 = !_2251;
            _2179 = _2263;
            if (!_2265)
            {
                bool _2267 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2269 = isnan(_1740);
                bool _2271 = _2267 || _2269;
                bool _2273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2275 = _2271 || _2273;
                if (!_2275)
                {
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2279 = _1740 + _2277;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2281;
                    float _2285 = 1.0 / _2283;
                    float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2307 = _2279 * _2285;
                    float _2309 = precise::clamp(_2307, 0.0, 1.0);
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2315 = fma(_2309, _2289, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2317 = fma(_2309, _2313, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2319 = fma(_2309, _2293, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2321 = fma(_2309, _2297, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2323 = fma(_2309, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2325 = fma(_2309, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2159 = _2317;
                    _2171 = _2323;
                    _2153 = _2315;
                    _2165 = _2321;
                    _2147 = _2319;
                    _2179 = _2325;
                    _2241 = true;
                }
                else
                {
                    _2159 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2153 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2165 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2147 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2179 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2241 = false;
    float _2327 = _2159;
    float _2329 = _2171;
    float _2331 = _2153;
    float _2333 = _2165;
    float _2335 = _2147;
    float _2337 = _2179;
    float _2339 = _2141 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2341 = fma(_1466, -0.5, 0.5);
    float _2343 = precise::clamp(_2341, 0.0, 1.0);
    float _2345 = -_2327;
    float _2347 = _2345 + _2329;
    float _2349 = -_2331;
    float _2351 = _2349 + _2333;
    out.m_55.x = _2339;
    float _2353 = fma(_2343, _2347, _2327);
    float _2355 = -_2335;
    float _2357 = _2355 + _2337;
    float _2359 = fma(_2343, _2351, _2331);
    float _2361 = _2353 * 0.586610972881317138671875;
    bool _2363 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2365 = fma(_2343, _2357, _2335);
    out.m_87.x = 0.0;
    float _2367 = fma(_2359, 0.298911988735198974609375, _2361);
    bool _2369 = _2109 > 0.0;
    bool _2371 = isnan(_2109);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = fma(_2365, 0.114477999508380889892578125, _2367);
    float _2381 = -_2379;
    float _2383 = _2359 + _2381;
    float _2385 = -_2379;
    float _2387 = _2353 + _2385;
    float _2389 = -_2379;
    float _2391 = _2365 + _2389;
    float _2393 = fma(_2383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2379);
    float _2395 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2379);
    float _2397 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2379);
    bool _2399 = !_2363;
    if (!_2399)
    {
        float _2401 = -_1574;
        float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2405 = -_1576;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2409 = -_1578;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2413 = _2403 * _2403;
        float _2415 = fma(_2407, _2407, _2413);
        float _2417 = fma(_2411, _2411, _2415);
        float _2419 = sqrt(_2417);
        float _2421 = rsqrt(_2417);
        float _2423 = -_2419;
        float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2427 = _2425 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2429 = precise::clamp(_2427, 0.0, 1.0);
        float _2431 = _2407 * _2421;
        float _2433 = _2403 * _2421;
        float _2435 = abs(_2429);
        float _2437 = log2(_2435);
        float _2439 = _2411 * _2421;
        float _2441 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2443 = _1466 * _2433;
        float _2445 = -_2433;
        float _2447 = -_2441;
        float _2449 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2447);
        float _2451 = fma(_1464, _2431, _2443);
        float _2453 = -_2439;
        float _2455 = fma(_2453, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2449);
        float _2457 = fma(_1468, _2439, _2451);
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2463 = _2455 + _2461;
        float _2465 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2467 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2469 = precise::clamp(_2467, 0.0, 1.0);
        float _2471 = exp2(_2465);
        float _2473 = _2471 * _2469;
        float _2475 = _2459 * _2473;
        float _2477 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2479 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2481 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2477;
        out.m_87.y = _2479;
        out.m_87.z = _2481;
    }
    out.m_89.x = _2393;
    out.m_89.y = _2395;
    out.m_89.z = _2397;
    if (_2377)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _2483 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2483;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2241 = false;
    bool _1530 = false;
    bool _508 = false;
    bool _354 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_52.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_55.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2540 = as_type<float>(_124);
        out.gl_Position.z = _2540;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_57.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_55.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2609 = as_type<float>(_162);
        out.gl_Position.z = _2609;
    }
    if (_156)
    {
        return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_59.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _214 = _194 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = 1.0 / _218;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _222;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _230;
    float _234 = _198 * _224;
    bool _236 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_194);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_210;
    float _250 = _248 + 1.0;
    bool _252 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_194);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = fma(_232, _234, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _266 = _262 * _250;
    float _268 = -_262;
    float _270 = _268 + 1.0;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _276;
    float _280 = _214 * _228;
    float _282 = _246 * _270;
    float _284 = fma(_274, _234, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _234, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _288 = -_246;
    float _290 = _288 + 1.0;
    float _292 = _264 * _282;
    float _294 = _284 * _282;
    float _296 = _286 * _282;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _310 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _312 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _314 = fma(_300, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_304, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_308, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _320 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].z, _296);
    float _322 = fma(_314, _266, _310);
    float _324 = fma(_316, _266, _312);
    float _326 = fma(_318, _266, _320);
    float _328 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].x, _322);
    float _330 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].y, _324);
    float _332 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].z, _326);
    bool _334 = !_226;
    float _352;
    if (!_334)
    {
        float _336 = in.m_59.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_108);
        float _358 = 1.0 / _356;
        float _360 = _142 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _368 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _370 = isnan(_362);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _384 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _386 = isnan(_362);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _366;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _398;
    float _402 = -_378;
    float _404 = _402 + 1.0;
    bool _406 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _408 = isnan(_362);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _420 = 1.0 / _382;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _426 = in.m_61.x;
    float _428 = in.m_61.y;
    float _430 = in.m_61.z;
    float _432 = _400 * _396;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _362 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _440 = _362 + _438;
    float _442 = fma(_432, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _444 = _394 * _404;
    float _446 = -_394;
    float _448 = _446 + 1.0;
    float _450 = _424 * _420;
    float _452 = -_416;
    float _454 = _452 + 1.0;
    float _456 = _442 * _444;
    float _458 = fma(_450, _440, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _460 = _378 * _454;
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _464 = fma(_458, _460, _462);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _470 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[117].x, _464);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _474 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _478 = _470 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _480 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _332 * _430;
    float _484 = _330 * _428;
    float _486 = _328 * _426;
    out.m_63.x = _474;
    out.m_63.y = _476;
    out.m_63.z = _480;
    out.m_63.w = _478;
    bool _488 = !_418;
    float _506;
    if (!_488)
    {
        float _490 = in.m_59.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_108);
        float _512 = 1.0 / _510;
        float _514 = _142 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    float _518 = in.m_59.z;
    float _520 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _522 = log2(_520);
    float _524 = in.m_59.x;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _528 = _526 != 0;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _536 = _534 != 0;
    float _538 = in.m_59.y;
    float _540 = _522 * _142;
    float _542 = _518 * 2.0;
    float _544 = _524 * 2.0;
    float _546 = floor(_542);
    float _548 = _538 * 2.0;
    float _550 = _524 + _538;
    float _552 = _550 + (-1.0);
    float _554 = floor(_544);
    bool _556 = _546 > 0.0;
    float _558 = floor(_548);
    bool _560 = _546 >= 0.0;
    bool _562 = isnan(_546);
    bool _564 = _560 || _562;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _576 = _568 ? 0 : 1;
    float _578 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _580 = _554 >= 0.0;
    bool _582 = isnan(_554);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = -_570;
    float _592 = fma(_574, 2.0, _590);
    int _594 = ~_576;
    int _596 = _594 + 1;
    int _598 = _596 + 1;
    float _600 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _602 = fma(_578, -2.0, _572);
    int _604 = _598;
    if (!_556)
    {
        int _606 = ~_576;
        int _608 = _606 + 1;
        _604 = _608;
    }
    int _610 = _604;
    float _612 = in.m_65.x;
    float _614 = in.m_65.y;
    float _616 = in.m_65.z;
    float _618 = exp2(_540);
    bool _620 = _558 > 0.0;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _624 = _558 >= 0.0;
    bool _626 = isnan(_558);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _602);
    int _636 = _588 ? 0 : 1;
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _650 = 1.0 + _648;
    bool _652 = !_528;
    int _654 = _652 ? 0 : 1;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _658 = _554 > 0.0;
    float _660 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _622);
    float _662 = 1.0 / _650;
    int _664 = abs(_654);
    float _666 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].z, _656);
    float _668 = -_618;
    float _670 = _668 + 1.0;
    float _672 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _660);
    float _674 = float(_664);
    float _676 = -_142;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[76].x, _592);
    float _680 = float(_610);
    float _682 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _666);
    bool _684 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _692 = _688 || _690;
    bool _694 = !_532;
    int _696 = _694 ? 0 : 1;
    float _698 = _674 * _680;
    int _700 = ~_636;
    int _702 = _700 + 1;
    int _704 = _702 + 1;
    float _706 = _692 ? _670 : 0.0;
    float _708 = _698 * (-2.0);
    int _710 = _704;
    if (!_658)
    {
        int _712 = ~_636;
        int _714 = _712 + 1;
        _710 = _714;
    }
    int _716 = _710;
    int _718 = abs(_696);
    if (_646)
    {
        float _720 = _706 * _662;
        _146 = _720;
    }
    float _722 = _146;
    bool _724 = !_536;
    int _726 = _724 ? 0 : 1;
    float _728 = _524 + (-0.5);
    float _730 = float(_718);
    float _732 = fma(_708, _612, _612);
    float _734 = float(_716);
    float _736 = fma(_600, _708, _600);
    int _738 = _632 ? 0 : 1;
    float _740 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[196].x, _732);
    int _742 = abs(_726);
    float _744 = _730 * _734;
    int _746 = ~_738;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = _538 + _518;
    int _754 = _750;
    if (!_620)
    {
        int _756 = ~_738;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = fma(_736, _722, _740);
    float _764 = _752 + (-1.0);
    float _766 = float(_760);
    float _768 = _744 * (-2.0);
    float _770 = float(_742);
    float _772 = _762 * 0.15915493667125701904296875;
    float _774 = fma(_768, _614, _614);
    float _776 = _770 * _766;
    float _778 = _538 + (-0.5);
    float _780 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _782 = _524 + _518;
    float _784 = _776 * (-2.0);
    float _786 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].y, _774);
    float _788 = fma(_780, _768, _780);
    float _790 = _782 + (-1.0);
    float _792 = fma(_784, _616, _616);
    float _794 = _772 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = fma(_788, _722, _786);
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _802 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _804 = in.m_67.x;
    float _806 = in.m_67.y;
    float _808 = in.m_67.z;
    float _810 = _798 * 0.15915493667125701904296875;
    float _812 = _518 + (-0.5);
    float _814 = fma(_800, _784, _800);
    float _816 = _772 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _792);
    float _822 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _824 = fma(_814, _722, _820);
    float _826 = _810 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _832 = _824 * 0.15915493667125701904296875;
    float _834 = in.m_52.x;
    float _836 = in.m_52.y;
    float _838 = in.m_52.z;
    float _840 = _810 * 6.283185482025146484375;
    float _842 = cos(_840);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _806);
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _804);
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _850 = _832 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _844 * _830;
    float _856 = _796 * _828;
    float _858 = _818 * _828;
    float _860 = _846 * _822;
    float _862 = _848 * _802;
    float _864 = _832 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _796 * _842;
    float _870 = _818 * _842;
    float _872 = _836 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _874 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[4].x, _872);
    float _876 = _796 * _852;
    float _878 = _818 * _852;
    float _880 = _842 * _852;
    float _882 = _828 * _852;
    float _884 = _876 * _854;
    float _886 = _878 * _854;
    float _888 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[4].z, _874);
    float _890 = fma(_866, _868, _858);
    float _892 = fma(_866, _858, _868);
    float _894 = -_854;
    float _896 = _866 * _894;
    float _898 = -_856;
    float _900 = fma(_866, _870, _898);
    float _902 = -_870;
    float _904 = fma(_866, _856, _902);
    float _906 = fma(_890, _860, _884);
    float _908 = fma(_880, _860, _896);
    float _910 = fma(_900, _860, _886);
    float _912 = _836 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _914 = fma(_904, _862, _906);
    float _916 = fma(_882, _862, _908);
    float _918 = fma(_892, _862, _910);
    float _920 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[6].x, _912);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = _888 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _928 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[6].z, _920);
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[8].x, _922);
    float _932 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _934 = _836 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _936 = _928 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _938 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _940 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[10].z, _932);
    float _942 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[5].x, _934);
    float _944 = _926 + _938;
    float _946 = _936 + _940;
    float _948 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _952 = _944 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _956 = _946 + _954;
    float _958 = fma(_926, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _960 = _952 * _952;
    float _962 = _956 * _956;
    float _964 = floor(_958);
    float _966 = _960 + _962;
    float _968 = sqrt(_966);
    bool _970 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _974 = _968 + _972;
    float _976 = _930;
    float _978 = _838;
    float _980 = _968;
    float _982 = _944;
    int _984 = as_type<int>(_804);
    float _986 = _960;
    float _988 = _962;
    if (_970)
    {
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _990;
    }
    float _992 = _976;
    if (_970)
    {
        float _994 = rsqrt(_966);
        _978 = _994;
    }
    float _996 = _978;
    float _998 = _992;
    if (_970)
    {
        float _1000 = _974 * _992;
        _980 = _1000;
    }
    float _1002 = _980;
    if (_970)
    {
        float _1004 = _1002 * 0.15915493667125701904296875;
        _998 = _1004;
    }
    float _1006 = _998;
    float _1008 = _914 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1010 = _914;
    if (_970)
    {
        float _1012 = _1006 * 6.283185482025146484375;
        float _1014 = sin(_1012);
        _1010 = _1014;
    }
    float _1016 = _1010;
    float _1018 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1008);
    float _1020 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    float _1022 = _948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1024 = fma(_936, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1026 = _1022 + _1020;
    float _1028 = -_964;
    float _1030 = _958 + _1028;
    float _1032 = floor(_1024);
    float _1034 = _1026;
    if (_970)
    {
        float _1036 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1036;
    }
    float _1038 = _1034;
    float _1040 = _1038;
    float _1042 = _1016;
    if (_970)
    {
        float _1044 = fma(_1016, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1044;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    if (!_970)
    {
        _1042 = _946;
    }
    float _1050 = _1042;
    float _1052 = _1050;
    if (_970)
    {
        float _1054 = _996 * _1046;
        _1048 = _1054;
    }
    float _1056 = _1048;
    if (_970)
    {
        float _1058 = fma(_952, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _982 = _1058;
    }
    float _1060 = _982;
    if (_970)
    {
        float _1062 = fma(_956, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1052 = _1062;
    }
    float _1064 = _1052;
    float _1066 = -_1032;
    float _1068 = _1024 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1072 = _1060 + _1070;
    float _1074 = fma(_1060, 6.2500002968590706586837768554688e-05, 0.5);
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1078 = _1064 + _1076;
    float _1080 = fma(_1064, 6.2500002968590706586837768554688e-05, 0.5);
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1084 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4065 = float2(_1074, _1080);
    float _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_4065, float2(0.0), isnan(_4065)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_4065, float2(0.0), isnan(_4065)), level(0.0)).y;
    float2 _4075 = float2(_1082, _1084);
    float _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4075, float2(0.0), isnan(_4075)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4075, float2(0.0), isnan(_4075)), level(0.0)).x;
    float2 _4083 = float2(_1030, _1068);
    float _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4083, float2(0.0), isnan(_4083)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4083, float2(0.0), isnan(_4083)), level(0.0)).x;
    float _1092 = in.m_69.y;
    float _1094 = in.m_59.w;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1102 = _1100 != 0;
    float _1104 = 1.0 / _1098;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1120 = _1118 != 0;
    float _1122 = 1.0 / _1112;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1126 = _1124 != 0;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1128;
    bool _1132 = _538 > 0.5;
    bool _1134 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1136 = isnan(_516);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -_1092;
    float _1148 = _1146 + 1.0;
    float _1150 = in.m_69.x;
    float _1152 = 1.0 / _1108;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1158 = _1094 > 0.5;
    float _1160 = _1130 * _1104;
    float _1162 = -_1144;
    float _1164 = _1162 + 1.0;
    bool _1166 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1168 = isnan(_516);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    int _1178 = _1158 ? as_type<int>(_1148) : as_type<int>(_1092);
    bool _1180 = _1158;
    bool _1182 = _1126;
    float _1184 = _1092;
    if (_1102)
    {
        bool _1186 = _524 > 0.5;
        _1180 = _1186;
    }
    bool _1188 = _1180;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1192 = _516 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1194;
    float _1198 = _1126 ? as_type<float>(_1178) : _1092;
    float _1200 = _1156 * _1152;
    if (_1116)
    {
        bool _1202 = _518 > 0.5;
        _1182 = _1202;
    }
    bool _1204 = _1182;
    float _1206 = _1196 * _1122;
    bool _1208 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1210 = isnan(_516);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = fma(_1160, _1192, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1120)
    {
        float _1222 = _1132 ? _1148 : _1092;
        _1184 = _1222;
    }
    float _1224 = _1184;
    float _1226 = in.m_71.x;
    float _1228 = in.m_71.y;
    float _1230 = in.m_71.z;
    bool _1232 = _806 != 0.0;
    bool _1234 = isnan(_806);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan(0.0);
    bool _1240 = _1236 || _1238;
    float _1242 = -_1218;
    float _1244 = _1242 + 1.0;
    bool _1246 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1248 = isnan(_516);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1260 = _804 == 0.0;
    bool _1262 = !_1240;
    bool _1264 = _1260 && _1262;
    float _1266 = _1144 * _1244;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1270 = _516 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1274 = _516 + _1272;
    bool _1276 = _808 == 0.0;
    bool _1278 = _1276 && _1264;
    float _1280 = _1256 * _1164;
    float _1282 = fma(_1200, _1270, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1284 = fma(_1206, _1274, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1286 = -_1256;
    float _1288 = _1286 + 1.0;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1292 = _1274;
    if (!_1102)
    {
        _1292 = _1150;
    }
    float _1294 = _1292;
    float _1296 = _1176 * _1288;
    float _1298 = -_1176;
    float _1300 = _1298 + 1.0;
    float _1302 = _1220 * _1296;
    float _1304 = _1228;
    float _1306 = _1226;
    float _1308 = _1230;
    int _1310 = as_type<int>(_1302);
    float _1312 = _1294;
    if (!_1278)
    {
        float _1314 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1228);
        _1304 = _1314;
    }
    float _1316 = _1304;
    float _1318 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1278)
    {
        float _1320 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1226);
        _1306 = _1320;
    }
    float _1322 = _1306;
    if (!_1278)
    {
        float _1324 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1230);
        _1308 = _1324;
    }
    float _1326 = _1308;
    if (_1102)
    {
        float _1328 = -_1150;
        float _1330 = _1328 + 1.0;
        _984 = as_type<int>(_1330);
    }
    int _1332 = _984;
    float _1334 = fma(_1318, _1224, -0.5);
    float _1336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1338 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1340 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1302);
    float _1342 = as_type<float>(_1332);
    if (_1116)
    {
        float _1344 = -_1150;
        float _1346 = _1344 + 1.0;
        _1310 = as_type<int>(_1346);
    }
    int _1348 = _1310;
    if (_1102)
    {
        float _1350 = _1188 ? as_type<float>(_1332) : _1150;
        _1312 = _1350;
    }
    float _1352 = _1312;
    float _1354 = _876 * _1316;
    if (!_1116)
    {
        _1342 = _1150;
    }
    float _1356 = _1342;
    float _1358 = -_1316;
    float _1360 = _866 * _1358;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1364 = _1356;
    if (_1116)
    {
        float _1366 = _1204 ? as_type<float>(_1348) : _1150;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = fma(_1338, _1352, -0.5);
    float _1372 = _878 * _1316;
    float _1374 = fma(_890, _1322, _1354);
    float _1376 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1380 = -_634;
    float _1382 = fma(_672, _1334, _1380);
    float _1384 = fma(_682, _1370, _678);
    float _1386 = fma(_880, _1322, _1360);
    float _1388 = fma(_900, _1322, _1372);
    float _1390 = _1376 * _1336;
    float _1392 = _1382 + 0.5;
    float _1394 = fma(_1282, _1280, _1340);
    float _1396 = fma(_904, _1326, _1374);
    float _1398 = _1378 * _1362;
    float _1400 = _1384 + 0.5;
    float _1402 = fma(_882, _1326, _1386);
    float _1404 = fma(_892, _1326, _1388);
    out.m_73.x = _1400;
    out.m_73.y = _1392;
    out.m_73.z = _1398;
    out.m_73.w = _1390;
    float _1406 = fma(_1284, _1266, _1394);
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1410 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1412 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1414 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1406);
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1422 = fma(_1402, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1408);
    float _1424 = fma(_1402, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1412);
    float _1426 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1400;
    float _1432 = _1398;
    float _1434 = _1422;
    float _1436 = _1410;
    if (_970)
    {
        float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1440 = _1060 + _1438;
        _1430 = _1440;
    }
    float _1442 = _1430;
    if (_970)
    {
        float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1446 = _1064 + _1444;
        _1432 = _1446;
    }
    float _1448 = _1432;
    float _1450 = fma(_1402, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1410);
    float _1452 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_970)
    {
        float _1454 = _1442 * _1442;
        _986 = _1454;
    }
    float _1456 = _986;
    if (_970)
    {
        float _1458 = _1448 * _1448;
        _988 = _1458;
    }
    float _1460 = _988;
    float _1462 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1464 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1422);
    float _1466 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1450);
    float _1468 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1424);
    out.m_75.x = _1426;
    out.m_75.y = _1428;
    out.m_75.z = _1452;
    out.m_75.w = _1462;
    out.m_77.x = _1464;
    out.m_77.y = _1466;
    out.m_77.z = _1468;
    float _1470 = fma(_1086, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1472 = fma(_1088, 100.0, _1470);
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1476 = _1472 + _1474;
    float _1478 = fma(_1476, _1476, _1456);
    float _1480 = _1478 + _1460;
    float _1482 = sqrt(_1480);
    bool _1484 = _1482 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1486 = isnan(_1482);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1492 = _1488 || _1490;
    float _1494 = _1472;
    if (!_1492)
    {
        _1434 = 1.0;
    }
    float _1496 = _1434;
    bool _1498 = !_1492;
    float _1500 = _1496;
    if (!_1498)
    {
        bool _1502 = _1482 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1504 = isnan(_1482);
        bool _1506 = _1502 || _1504;
        bool _1508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1510 = _1506 || _1508;
        if (!_1510)
        {
            float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1514 = _1482 + _1512;
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1522 = _1520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1524 = 1.0 / _1518;
            float _1526 = _1514 * _1524;
            float _1528 = fma(_1526, _1522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1500 = _1528;
            _1530 = true;
        }
        else
        {
            bool _1532 = _1482 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1534 = isnan(_1482);
            bool _1536 = _1532 || _1534;
            bool _1538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1540 = _1536 || _1538;
            if (!_1540)
            {
                float _1542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1544 = _1482 + _1542;
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1554 = 1.0 / _1548;
                float _1556 = _1544 * _1554;
                float _1558 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1500 = _1558;
                _1530 = true;
            }
            else
            {
                _1500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1530 = false;
    float _1560 = _1500;
    float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1564 = _1472 + _1562;
    float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1568 = _1060 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1572 = _1064 + _1570;
    float _1574 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1576 = fma(_1568, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1578 = fma(_1572, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1574 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1576 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1578 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1590;
    float _1622 = _1572;
    float _1624 = _1618;
    float _1626 = _1600;
    if (_1614)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1628;
    }
    float _1630 = _1620;
    if (_1614)
    {
        float _1632 = rsqrt(_1610);
        _1622 = _1632;
    }
    float _1634 = _1622;
    float _1636 = _1634;
    if (_1614)
    {
        float _1638 = _1618 * _1630;
        _1624 = _1638;
    }
    float _1640 = _1624;
    if (_1614)
    {
        float _1642 = _1640 * 0.15915493667125701904296875;
        _1494 = _1642;
    }
    float _1644 = _1494;
    float _1646 = _1592;
    float _1648 = _1644;
    if (_1614)
    {
        float _1650 = _1644 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1646 = _1652;
    }
    float _1654 = _1646;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1598;
    float _1662 = _1656;
    float _1664 = _1658;
    if (_1614)
    {
        float _1666 = _1644 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1660 = _1668;
    }
    float _1670 = _1660;
    float _1672 = -_1600;
    float _1674 = -_1658;
    float _1676 = fma(_1582, _1672, _1674);
    float _1678 = _1676;
    if (_1614)
    {
        float _1680 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1680;
    }
    float _1682 = _1662;
    float _1684 = _1682;
    if (!_1614)
    {
        _1648 = _1606;
    }
    float _1686 = _1648;
    float _1688 = _1654;
    float _1690 = _1686;
    if (_1614)
    {
        float _1692 = fma(_1654, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1664 = _1692;
    }
    float _1694 = _1664;
    float _1696 = _1694;
    if (!_1614)
    {
        _1688 = _1602;
    }
    float _1698 = _1688;
    float _1700 = _1698;
    if (_1614)
    {
        float _1702 = _1670 + (-1.0);
        _1684 = _1702;
    }
    float _1704 = _1684;
    if (_1614)
    {
        float _1706 = _1634 * _1694;
        _1436 = _1706;
    }
    float _1708 = _1436;
    if (!_1614)
    {
        _1636 = _1676;
    }
    float _1710 = _1636;
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1714 = _1710;
    if (_1614)
    {
        float _1716 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1716;
    }
    float _1718 = _1626;
    if (_1614)
    {
        float _1720 = _1602 * _1708;
        _1700 = _1720;
    }
    float _1722 = _1700;
    if (!_1614)
    {
        _1696 = _1604;
    }
    float _1724 = _1696;
    float _1726 = _1724;
    if (_1614)
    {
        float _1728 = _1604 * _1708;
        _1726 = _1728;
    }
    float _1730 = _1726;
    if (_1614)
    {
        float _1732 = fma(_1676, _1670, _1718);
        _1714 = _1732;
    }
    float _1734 = _1714;
    if (_1614)
    {
        float _1736 = _1722 * _1722;
        _1690 = _1736;
    }
    float _1738 = _1690;
    float _1740 = sqrt(_1596);
    if (!_1614)
    {
        _1678 = _1608;
    }
    float _1742 = _1678;
    float _1744 = _1742;
    if (_1614)
    {
        float _1746 = _1730 * _1730;
        _1744 = _1746;
    }
    float _1748 = _1744;
    float _1750 = fma(_1734, _1734, _1738);
    float _1752 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1754 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1756 = _1750 + _1748;
    float _1758 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1760 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1752);
    float _1762 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1754);
    float _1764 = rsqrt(_1756);
    float _1766 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1758);
    float _1768 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1760);
    float _1770 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1762);
    float _1772 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1776 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1774);
    float _1778 = precise::clamp(_1776, 0.0, 1.0);
    float _1780 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1766);
    float _1782 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1784 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1786 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1772);
    float _1788 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1790 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1792 = -_1778;
    float _1794 = _1792 + 1.0;
    float _1796 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1798 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1800 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1790);
    float _1802 = _1764 * _1722;
    float _1804 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = abs(_1794);
    float _1808 = log2(_1806);
    float _1810 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1800);
    float _1812 = _1764 * _1734;
    float _1814 = _1764 * _1730;
    float _1816 = -_1798;
    float _1818 = fma(_1816, _1712, 1.0);
    float _1820 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1810);
    float _1822 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1824 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1826 = 1.0 / _1820;
    float _1828 = -_1822;
    float _1830 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1828);
    float _1832 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1824);
    float _1834 = -_1814;
    float _1836 = fma(_1834, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1830);
    float _1838 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1840 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1842 = log2(_1818);
    float _1844 = fma(_1836, -0.5, 0.5);
    float _1846 = fma(_1836, 0.5, 0.5);
    float _1848 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1838);
    float _1850 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1832);
    float _1852 = _1812 + 1.0;
    float _1854 = fma(_1846, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1856 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1848);
    float _1858 = exp2(_1840);
    float _1860 = fma(_1846, _1854, -0.212114393711090087890625);
    float _1862 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1856);
    float _1864 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1850);
    float _1866 = fma(_1846, _1860, 1.570728778839111328125);
    float _1868 = sqrt(_1844);
    float _1870 = _1842 * 0.693147182464599609375;
    float _1872 = _1864 * _1826;
    float _1874 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1876 = fma(_1872, -0.5, 0.5);
    float _1878 = -_1812;
    float _1880 = fma(_1858, _1852, _1878);
    float _1882 = _1862 * _1826;
    float _1884 = fma(_1880, 0.5, 0.5);
    float _1886 = fma(_1882, 0.5, 0.5);
    float _1888 = _1868 * 0.636619746685028076171875;
    float _1890 = -_1866;
    float _1892 = fma(_1888, _1890, 1.0);
    float3 _5442 = float3(_1886, _1876, _1874);
    float _1894 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5442, float3(0.0), isnan(_5442)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5442, float3(0.0), isnan(_5442)), level(0.0)).x;
    float3 _5453 = float3(_1886, _1876, _1874);
    float4 _1897 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5453, float3(0.0), isnan(_5453)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5453, float3(0.0), isnan(_5453)), level(0.0)).xyzw;
    float _1899 = _1897.x;
    float _1901 = _1897.y;
    float _1903 = _1897.z;
    float _1905 = _1897.w;
    float2 _5469 = float2(_1892, _1884);
    float3 _1909 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5469, float2(0.0), isnan(_5469)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5469, float2(0.0), isnan(_5469)), level(0.0)).xyz;
    float _1911 = _1909.x;
    float _1913 = _1909.y;
    float _1915 = _1909.z;
    float _1917 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1919 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1921 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1923 = -_1090;
    float _1925 = _1923 + 1.0;
    float _1927 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1917);
    float _1929 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1931 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1919);
    float _1933 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1927);
    float _1935 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1929);
    float _1937 = in.m_79.x;
    float _1939 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1941 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1935);
    float _1943 = exp2(_1921);
    float _1945 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1947 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1931);
    bool _1949 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(0.5);
    bool _1957 = _1953 || _1955;
    float _1959 = _1945 + _1939;
    float _1961 = 1.0 / _1939;
    float _1963 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1947);
    float _1965 = _1959 * _1961;
    float _1967 = _1965 * 0.5;
    float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1971 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1969);
    float _1973 = 1.0 / _1971;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1977 = _1973 * _1975;
    float _1979 = abs(_1977);
    float _1981 = log2(_1979);
    float _1983 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1985 = exp2(_1983);
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1989 = precise::clamp(_1987, 0.0, 1.0);
    float _1991 = -_1943;
    float _1993 = _1991 + 1.0;
    float _1995 = fma(_1989, -2.0, 3.0);
    float _1997 = _1989 * _1989;
    float _1999 = _1997 * _1995;
    bool _2001 = _1977 <= 8000.0;
    bool _2003 = isnan(_1977);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(8000.0);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1999;
    float _2015 = _2013 + 1.0;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1999);
    float _2019 = _2011 * _2017;
    float _2021 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2023 = _1963 + _1820;
    float _2025 = _1925 * _2021;
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = _2023 * 0.5;
    float _2031 = -_2027;
    float _2033 = fma(_2031, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2035 = _2033 * _1937;
    float _2037 = _2035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2039 = _2035;
    float _2041 = _1820;
    float _2043 = _1820;
    float _2045 = _2029;
    float _2047 = _1963;
    float _2049 = _1864;
    float _2051 = _1862;
    if (_1957)
    {
        _2039 = 1.0;
    }
    float _2053 = _2039;
    float _2055 = _2053;
    if (!_1957)
    {
        float _2057 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2059 = _2057 * 0.15915493667125701904296875;
        float _2061 = _2059 * 6.283185482025146484375;
        float _2063 = cos(_2061);
        float _2065 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2067 = _2065 * 0.15915493667125701904296875;
        float _2069 = _2059 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        float _2073 = 1.0 / _2063;
        float _2075 = _2067 * 6.283185482025146484375;
        float _2077 = cos(_2075);
        float _2079 = _2071 * _2073;
        float _2081 = _2067 * 6.283185482025146484375;
        float _2083 = sin(_2081);
        float _2085 = _2077 * _2079;
        float _2087 = 1.0 / _2085;
        float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2091 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2089;
        float _2093 = 1.0 / _2091;
        float _2095 = _2083 * _2087;
        float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2099 = fma(_1977, _2095, _2097);
        float _2101 = _2099 * _2093;
        float _2103 = precise::clamp(_2101, 0.0, 1.0);
        float _2105 = -_2103;
        float _2107 = _2105 + 1.0;
        _2055 = _2107;
    }
    float _2109 = _2055;
    float _2111 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2037;
    bool _2113 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2115 = isnan(_1740);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2121 = _2117 || _2119;
    float _2123 = _2111 * _1894;
    float _2125 = -_2111;
    float _2127 = _2125 + 1.0;
    out.gl_Position.x = _1862;
    out.gl_Position.y = _1864;
    out.gl_Position.z = _1963;
    out.gl_Position.w = _1820;
    float _2129 = _1905 * _2123;
    float _2131 = _1915 * _2123;
    float _2133 = _1905 * _2127;
    out.m_83.z = _2029;
    out.m_83.w = _1820;
    float _2135 = fma(_1911, _2129, _1899);
    float _2137 = fma(_1913, _2129, _1901);
    float _2139 = fma(_1905, _2131, _1903);
    float _2141 = _2109 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_85.x = _2135;
    out.m_85.y = _2137;
    out.m_85.z = _2139;
    out.m_85.w = _2133;
    if (!_2121)
    {
        _2041 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2143 = _2041;
    float _2145 = _2143;
    float _2147 = _2143;
    if (!_2121)
    {
        _2043 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2149 = _2043;
    float _2151 = _2149;
    float _2153 = _2149;
    if (!_2121)
    {
        _2045 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2155 = _2045;
    float _2157 = _2155;
    float _2159 = _2155;
    if (!_2121)
    {
        _2047 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2161 = _2047;
    float _2163 = _2161;
    float _2165 = _2161;
    if (!_2121)
    {
        _2049 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2167 = _2049;
    float _2169 = _2167;
    float _2171 = _2167;
    if (!_2121)
    {
        _2051 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2173 = _2051;
    bool _2175 = !_2121;
    float _2177 = _2173;
    float _2179 = _2173;
    if (!_2175)
    {
        bool _2181 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2183 = isnan(_1740);
        bool _2185 = _2181 || _2183;
        bool _2187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2189 = _2185 || _2187;
        if (!_2189)
        {
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2193 = _1740 + _2191;
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2195;
            float _2199 = 1.0 / _2197;
            float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2203 = _2201 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2221 = _2193 * _2199;
            float _2223 = precise::clamp(_2221, 0.0, 1.0);
            float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2227 = _2225 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2229 = fma(_2223, _2203, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2231 = fma(_2223, _2227, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2233 = fma(_2223, _2207, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2235 = fma(_2223, _2211, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2237 = fma(_2223, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2239 = fma(_2223, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2159 = _2231;
            _2171 = _2237;
            _2153 = _2229;
            _2165 = _2235;
            _2147 = _2233;
            _2179 = _2239;
            _2241 = true;
        }
        else
        {
            bool _2243 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2245 = isnan(_1740);
            bool _2247 = _2243 || _2245;
            bool _2249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2251 = _2247 || _2249;
            if (!_2251)
            {
                _2151 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2253 = _2151;
            _2153 = _2253;
            if (!_2251)
            {
                _2157 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2255 = _2157;
            _2159 = _2255;
            if (!_2251)
            {
                _2145 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2257 = _2145;
            _2147 = _2257;
            if (!_2251)
            {
                _2163 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2259 = _2163;
            _2165 = _2259;
            if (!_2251)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2261 = _2169;
            _2171 = _2261;
            if (!_2251)
            {
                _2177 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2263 = _2177;
            bool _2265 = !_2251;
            _2179 = _2263;
            if (!_2265)
            {
                bool _2267 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2269 = isnan(_1740);
                bool _2271 = _2267 || _2269;
                bool _2273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2275 = _2271 || _2273;
                if (!_2275)
                {
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2279 = _1740 + _2277;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2281;
                    float _2285 = 1.0 / _2283;
                    float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2307 = _2279 * _2285;
                    float _2309 = precise::clamp(_2307, 0.0, 1.0);
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2315 = fma(_2309, _2289, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2317 = fma(_2309, _2313, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2319 = fma(_2309, _2293, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2321 = fma(_2309, _2297, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2323 = fma(_2309, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2325 = fma(_2309, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2159 = _2317;
                    _2171 = _2323;
                    _2153 = _2315;
                    _2165 = _2321;
                    _2147 = _2319;
                    _2179 = _2325;
                    _2241 = true;
                }
                else
                {
                    _2159 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2153 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2165 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2147 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2179 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2241 = false;
    float _2327 = _2159;
    float _2329 = _2171;
    float _2331 = _2153;
    float _2333 = _2165;
    float _2335 = _2147;
    float _2337 = _2179;
    float _2339 = _2141 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2341 = fma(_1466, -0.5, 0.5);
    float _2343 = precise::clamp(_2341, 0.0, 1.0);
    float _2345 = -_2327;
    float _2347 = _2345 + _2329;
    float _2349 = -_2331;
    float _2351 = _2349 + _2333;
    out.m_55.x = _2339;
    float _2353 = fma(_2343, _2347, _2327);
    float _2355 = -_2335;
    float _2357 = _2355 + _2337;
    float _2359 = fma(_2343, _2351, _2331);
    float _2361 = _2353 * 0.586610972881317138671875;
    bool _2363 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2365 = fma(_2343, _2357, _2335);
    out.m_87.x = 0.0;
    float _2367 = fma(_2359, 0.298911988735198974609375, _2361);
    bool _2369 = _2109 > 0.0;
    bool _2371 = isnan(_2109);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = fma(_2365, 0.114477999508380889892578125, _2367);
    float _2381 = -_2379;
    float _2383 = _2359 + _2381;
    float _2385 = -_2379;
    float _2387 = _2353 + _2385;
    float _2389 = -_2379;
    float _2391 = _2365 + _2389;
    float _2393 = fma(_2383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2379);
    float _2395 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2379);
    float _2397 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2379);
    bool _2399 = !_2363;
    if (!_2399)
    {
        float _2401 = -_1574;
        float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2405 = -_1576;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2409 = -_1578;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2413 = _2403 * _2403;
        float _2415 = fma(_2407, _2407, _2413);
        float _2417 = fma(_2411, _2411, _2415);
        float _2419 = sqrt(_2417);
        float _2421 = rsqrt(_2417);
        float _2423 = -_2419;
        float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2427 = _2425 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2429 = precise::clamp(_2427, 0.0, 1.0);
        float _2431 = _2407 * _2421;
        float _2433 = _2403 * _2421;
        float _2435 = abs(_2429);
        float _2437 = log2(_2435);
        float _2439 = _2411 * _2421;
        float _2441 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2443 = _1466 * _2433;
        float _2445 = -_2433;
        float _2447 = -_2441;
        float _2449 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2447);
        float _2451 = fma(_1464, _2431, _2443);
        float _2453 = -_2439;
        float _2455 = fma(_2453, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2449);
        float _2457 = fma(_1468, _2439, _2451);
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2463 = _2455 + _2461;
        float _2465 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2467 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2469 = precise::clamp(_2467, 0.0, 1.0);
        float _2471 = exp2(_2465);
        float _2473 = _2471 * _2469;
        float _2475 = _2459 * _2473;
        float _2477 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2479 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2481 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2477;
        out.m_87.y = _2479;
        out.m_87.z = _2481;
    }
    out.m_89.x = _2393;
    out.m_89.y = _2395;
    out.m_89.z = _2397;
    if (_2377)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _2483 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2483;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2241 = false;
    bool _1530 = false;
    bool _508 = false;
    bool _354 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_52.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_55.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2540 = as_type<float>(_124);
        out.gl_Position.z = _2540;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_57.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_55.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2609 = as_type<float>(_162);
        out.gl_Position.z = _2609;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_59.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _214 = _194 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = 1.0 / _218;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _222;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _230;
    float _234 = _198 * _224;
    bool _236 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_194);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_210;
    float _250 = _248 + 1.0;
    bool _252 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_194);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = fma(_232, _234, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _266 = _262 * _250;
    float _268 = -_262;
    float _270 = _268 + 1.0;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _276;
    float _280 = _214 * _228;
    float _282 = _246 * _270;
    float _284 = fma(_274, _234, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _234, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _288 = -_246;
    float _290 = _288 + 1.0;
    float _292 = _264 * _282;
    float _294 = _284 * _282;
    float _296 = _286 * _282;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _310 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _312 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _314 = fma(_300, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_304, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_308, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _320 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].z, _296);
    float _322 = fma(_314, _266, _310);
    float _324 = fma(_316, _266, _312);
    float _326 = fma(_318, _266, _320);
    float _328 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].x, _322);
    float _330 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].y, _324);
    float _332 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].z, _326);
    bool _334 = !_226;
    float _352;
    if (!_334)
    {
        float _336 = in.m_59.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_108);
        float _358 = 1.0 / _356;
        float _360 = _142 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _368 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _370 = isnan(_362);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _384 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _386 = isnan(_362);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _366;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _398;
    float _402 = -_378;
    float _404 = _402 + 1.0;
    bool _406 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _408 = isnan(_362);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _420 = 1.0 / _382;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _426 = in.m_61.x;
    float _428 = in.m_61.y;
    float _430 = in.m_61.z;
    float _432 = _400 * _396;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _362 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _440 = _362 + _438;
    float _442 = fma(_432, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _444 = _394 * _404;
    float _446 = -_394;
    float _448 = _446 + 1.0;
    float _450 = _424 * _420;
    float _452 = -_416;
    float _454 = _452 + 1.0;
    float _456 = _442 * _444;
    float _458 = fma(_450, _440, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _460 = _378 * _454;
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _464 = fma(_458, _460, _462);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _470 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[117].x, _464);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _474 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _478 = _470 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _480 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _332 * _430;
    float _484 = _330 * _428;
    float _486 = _328 * _426;
    out.m_63.x = _474;
    out.m_63.y = _476;
    out.m_63.z = _480;
    out.m_63.w = _478;
    bool _488 = !_418;
    float _506;
    if (!_488)
    {
        float _490 = in.m_59.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_108);
        float _512 = 1.0 / _510;
        float _514 = _142 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    float _518 = in.m_59.z;
    float _520 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _522 = log2(_520);
    float _524 = in.m_59.x;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _528 = _526 != 0;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _536 = _534 != 0;
    float _538 = in.m_59.y;
    float _540 = _522 * _142;
    float _542 = _518 * 2.0;
    float _544 = _524 * 2.0;
    float _546 = floor(_542);
    float _548 = _538 * 2.0;
    float _550 = _524 + _538;
    float _552 = _550 + (-1.0);
    float _554 = floor(_544);
    bool _556 = _546 > 0.0;
    float _558 = floor(_548);
    bool _560 = _546 >= 0.0;
    bool _562 = isnan(_546);
    bool _564 = _560 || _562;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _576 = _568 ? 0 : 1;
    float _578 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _580 = _554 >= 0.0;
    bool _582 = isnan(_554);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = -_570;
    float _592 = fma(_574, 2.0, _590);
    int _594 = ~_576;
    int _596 = _594 + 1;
    int _598 = _596 + 1;
    float _600 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _602 = fma(_578, -2.0, _572);
    int _604 = _598;
    if (!_556)
    {
        int _606 = ~_576;
        int _608 = _606 + 1;
        _604 = _608;
    }
    int _610 = _604;
    float _612 = in.m_65.x;
    float _614 = in.m_65.y;
    float _616 = in.m_65.z;
    float _618 = exp2(_540);
    bool _620 = _558 > 0.0;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _624 = _558 >= 0.0;
    bool _626 = isnan(_558);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _602);
    int _636 = _588 ? 0 : 1;
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _650 = 1.0 + _648;
    bool _652 = !_528;
    int _654 = _652 ? 0 : 1;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _658 = _554 > 0.0;
    float _660 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _622);
    float _662 = 1.0 / _650;
    int _664 = abs(_654);
    float _666 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].z, _656);
    float _668 = -_618;
    float _670 = _668 + 1.0;
    float _672 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _660);
    float _674 = float(_664);
    float _676 = -_142;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[76].x, _592);
    float _680 = float(_610);
    float _682 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _666);
    bool _684 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _692 = _688 || _690;
    bool _694 = !_532;
    int _696 = _694 ? 0 : 1;
    float _698 = _674 * _680;
    int _700 = ~_636;
    int _702 = _700 + 1;
    int _704 = _702 + 1;
    float _706 = _692 ? _670 : 0.0;
    float _708 = _698 * (-2.0);
    int _710 = _704;
    if (!_658)
    {
        int _712 = ~_636;
        int _714 = _712 + 1;
        _710 = _714;
    }
    int _716 = _710;
    int _718 = abs(_696);
    if (_646)
    {
        float _720 = _706 * _662;
        _146 = _720;
    }
    float _722 = _146;
    bool _724 = !_536;
    int _726 = _724 ? 0 : 1;
    float _728 = _524 + (-0.5);
    float _730 = float(_718);
    float _732 = fma(_708, _612, _612);
    float _734 = float(_716);
    float _736 = fma(_600, _708, _600);
    int _738 = _632 ? 0 : 1;
    float _740 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[196].x, _732);
    int _742 = abs(_726);
    float _744 = _730 * _734;
    int _746 = ~_738;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = _538 + _518;
    int _754 = _750;
    if (!_620)
    {
        int _756 = ~_738;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = fma(_736, _722, _740);
    float _764 = _752 + (-1.0);
    float _766 = float(_760);
    float _768 = _744 * (-2.0);
    float _770 = float(_742);
    float _772 = _762 * 0.15915493667125701904296875;
    float _774 = fma(_768, _614, _614);
    float _776 = _770 * _766;
    float _778 = _538 + (-0.5);
    float _780 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _782 = _524 + _518;
    float _784 = _776 * (-2.0);
    float _786 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].y, _774);
    float _788 = fma(_780, _768, _780);
    float _790 = _782 + (-1.0);
    float _792 = fma(_784, _616, _616);
    float _794 = _772 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = fma(_788, _722, _786);
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _802 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _804 = in.m_67.x;
    float _806 = in.m_67.y;
    float _808 = in.m_67.z;
    float _810 = _798 * 0.15915493667125701904296875;
    float _812 = _518 + (-0.5);
    float _814 = fma(_800, _784, _800);
    float _816 = _772 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _792);
    float _822 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _824 = fma(_814, _722, _820);
    float _826 = _810 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _832 = _824 * 0.15915493667125701904296875;
    float _834 = in.m_52.x;
    float _836 = in.m_52.y;
    float _838 = in.m_52.z;
    float _840 = _810 * 6.283185482025146484375;
    float _842 = cos(_840);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _806);
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _804);
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _850 = _832 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _844 * _830;
    float _856 = _796 * _828;
    float _858 = _818 * _828;
    float _860 = _846 * _822;
    float _862 = _848 * _802;
    float _864 = _832 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _796 * _842;
    float _870 = _818 * _842;
    float _872 = _836 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _874 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[4].x, _872);
    float _876 = _796 * _852;
    float _878 = _818 * _852;
    float _880 = _842 * _852;
    float _882 = _828 * _852;
    float _884 = _876 * _854;
    float _886 = _878 * _854;
    float _888 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[4].z, _874);
    float _890 = fma(_866, _868, _858);
    float _892 = fma(_866, _858, _868);
    float _894 = -_854;
    float _896 = _866 * _894;
    float _898 = -_856;
    float _900 = fma(_866, _870, _898);
    float _902 = -_870;
    float _904 = fma(_866, _856, _902);
    float _906 = fma(_890, _860, _884);
    float _908 = fma(_880, _860, _896);
    float _910 = fma(_900, _860, _886);
    float _912 = _836 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _914 = fma(_904, _862, _906);
    float _916 = fma(_882, _862, _908);
    float _918 = fma(_892, _862, _910);
    float _920 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[6].x, _912);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = _888 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _928 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[6].z, _920);
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[8].x, _922);
    float _932 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _934 = _836 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _936 = _928 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _938 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _940 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[10].z, _932);
    float _942 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[5].x, _934);
    float _944 = _926 + _938;
    float _946 = _936 + _940;
    float _948 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _952 = _944 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _956 = _946 + _954;
    float _958 = fma(_926, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _960 = _952 * _952;
    float _962 = _956 * _956;
    float _964 = floor(_958);
    float _966 = _960 + _962;
    float _968 = sqrt(_966);
    bool _970 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _974 = _968 + _972;
    float _976 = _930;
    float _978 = _838;
    float _980 = _968;
    float _982 = _944;
    int _984 = as_type<int>(_804);
    float _986 = _960;
    float _988 = _962;
    if (_970)
    {
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _990;
    }
    float _992 = _976;
    if (_970)
    {
        float _994 = rsqrt(_966);
        _978 = _994;
    }
    float _996 = _978;
    float _998 = _992;
    if (_970)
    {
        float _1000 = _974 * _992;
        _980 = _1000;
    }
    float _1002 = _980;
    if (_970)
    {
        float _1004 = _1002 * 0.15915493667125701904296875;
        _998 = _1004;
    }
    float _1006 = _998;
    float _1008 = _914 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1010 = _914;
    if (_970)
    {
        float _1012 = _1006 * 6.283185482025146484375;
        float _1014 = sin(_1012);
        _1010 = _1014;
    }
    float _1016 = _1010;
    float _1018 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1008);
    float _1020 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    float _1022 = _948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1024 = fma(_936, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1026 = _1022 + _1020;
    float _1028 = -_964;
    float _1030 = _958 + _1028;
    float _1032 = floor(_1024);
    float _1034 = _1026;
    if (_970)
    {
        float _1036 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1036;
    }
    float _1038 = _1034;
    float _1040 = _1038;
    float _1042 = _1016;
    if (_970)
    {
        float _1044 = fma(_1016, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1044;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    if (!_970)
    {
        _1042 = _946;
    }
    float _1050 = _1042;
    float _1052 = _1050;
    if (_970)
    {
        float _1054 = _996 * _1046;
        _1048 = _1054;
    }
    float _1056 = _1048;
    if (_970)
    {
        float _1058 = fma(_952, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _982 = _1058;
    }
    float _1060 = _982;
    if (_970)
    {
        float _1062 = fma(_956, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1052 = _1062;
    }
    float _1064 = _1052;
    float _1066 = -_1032;
    float _1068 = _1024 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1072 = _1060 + _1070;
    float _1074 = fma(_1060, 6.2500002968590706586837768554688e-05, 0.5);
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1078 = _1064 + _1076;
    float _1080 = fma(_1064, 6.2500002968590706586837768554688e-05, 0.5);
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1084 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4065 = float2(_1074, _1080);
    float _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_4065, float2(0.0), isnan(_4065)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_4065, float2(0.0), isnan(_4065)), level(0.0)).y;
    float2 _4075 = float2(_1082, _1084);
    float _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4075, float2(0.0), isnan(_4075)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4075, float2(0.0), isnan(_4075)), level(0.0)).x;
    float2 _4083 = float2(_1030, _1068);
    float _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4083, float2(0.0), isnan(_4083)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4083, float2(0.0), isnan(_4083)), level(0.0)).x;
    float _1092 = in.m_69.y;
    float _1094 = in.m_59.w;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1102 = _1100 != 0;
    float _1104 = 1.0 / _1098;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1120 = _1118 != 0;
    float _1122 = 1.0 / _1112;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1126 = _1124 != 0;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1128;
    bool _1132 = _538 > 0.5;
    bool _1134 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1136 = isnan(_516);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -_1092;
    float _1148 = _1146 + 1.0;
    float _1150 = in.m_69.x;
    float _1152 = 1.0 / _1108;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1158 = _1094 > 0.5;
    float _1160 = _1130 * _1104;
    float _1162 = -_1144;
    float _1164 = _1162 + 1.0;
    bool _1166 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1168 = isnan(_516);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    int _1178 = _1158 ? as_type<int>(_1148) : as_type<int>(_1092);
    bool _1180 = _1158;
    bool _1182 = _1126;
    float _1184 = _1092;
    if (_1102)
    {
        bool _1186 = _524 > 0.5;
        _1180 = _1186;
    }
    bool _1188 = _1180;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1192 = _516 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1194;
    float _1198 = _1126 ? as_type<float>(_1178) : _1092;
    float _1200 = _1156 * _1152;
    if (_1116)
    {
        bool _1202 = _518 > 0.5;
        _1182 = _1202;
    }
    bool _1204 = _1182;
    float _1206 = _1196 * _1122;
    bool _1208 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1210 = isnan(_516);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = fma(_1160, _1192, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1120)
    {
        float _1222 = _1132 ? _1148 : _1092;
        _1184 = _1222;
    }
    float _1224 = _1184;
    float _1226 = in.m_71.x;
    float _1228 = in.m_71.y;
    float _1230 = in.m_71.z;
    bool _1232 = _806 != 0.0;
    bool _1234 = isnan(_806);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan(0.0);
    bool _1240 = _1236 || _1238;
    float _1242 = -_1218;
    float _1244 = _1242 + 1.0;
    bool _1246 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1248 = isnan(_516);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1260 = _804 == 0.0;
    bool _1262 = !_1240;
    bool _1264 = _1260 && _1262;
    float _1266 = _1144 * _1244;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1270 = _516 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1274 = _516 + _1272;
    bool _1276 = _808 == 0.0;
    bool _1278 = _1276 && _1264;
    float _1280 = _1256 * _1164;
    float _1282 = fma(_1200, _1270, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1284 = fma(_1206, _1274, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1286 = -_1256;
    float _1288 = _1286 + 1.0;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1292 = _1274;
    if (!_1102)
    {
        _1292 = _1150;
    }
    float _1294 = _1292;
    float _1296 = _1176 * _1288;
    float _1298 = -_1176;
    float _1300 = _1298 + 1.0;
    float _1302 = _1220 * _1296;
    float _1304 = _1228;
    float _1306 = _1226;
    float _1308 = _1230;
    int _1310 = as_type<int>(_1302);
    float _1312 = _1294;
    if (!_1278)
    {
        float _1314 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1228);
        _1304 = _1314;
    }
    float _1316 = _1304;
    float _1318 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1278)
    {
        float _1320 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1226);
        _1306 = _1320;
    }
    float _1322 = _1306;
    if (!_1278)
    {
        float _1324 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1230);
        _1308 = _1324;
    }
    float _1326 = _1308;
    if (_1102)
    {
        float _1328 = -_1150;
        float _1330 = _1328 + 1.0;
        _984 = as_type<int>(_1330);
    }
    int _1332 = _984;
    float _1334 = fma(_1318, _1224, -0.5);
    float _1336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1338 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1340 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1302);
    float _1342 = as_type<float>(_1332);
    if (_1116)
    {
        float _1344 = -_1150;
        float _1346 = _1344 + 1.0;
        _1310 = as_type<int>(_1346);
    }
    int _1348 = _1310;
    if (_1102)
    {
        float _1350 = _1188 ? as_type<float>(_1332) : _1150;
        _1312 = _1350;
    }
    float _1352 = _1312;
    float _1354 = _876 * _1316;
    if (!_1116)
    {
        _1342 = _1150;
    }
    float _1356 = _1342;
    float _1358 = -_1316;
    float _1360 = _866 * _1358;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1364 = _1356;
    if (_1116)
    {
        float _1366 = _1204 ? as_type<float>(_1348) : _1150;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = fma(_1338, _1352, -0.5);
    float _1372 = _878 * _1316;
    float _1374 = fma(_890, _1322, _1354);
    float _1376 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1380 = -_634;
    float _1382 = fma(_672, _1334, _1380);
    float _1384 = fma(_682, _1370, _678);
    float _1386 = fma(_880, _1322, _1360);
    float _1388 = fma(_900, _1322, _1372);
    float _1390 = _1376 * _1336;
    float _1392 = _1382 + 0.5;
    float _1394 = fma(_1282, _1280, _1340);
    float _1396 = fma(_904, _1326, _1374);
    float _1398 = _1378 * _1362;
    float _1400 = _1384 + 0.5;
    float _1402 = fma(_882, _1326, _1386);
    float _1404 = fma(_892, _1326, _1388);
    out.m_73.x = _1400;
    out.m_73.y = _1392;
    out.m_73.z = _1398;
    out.m_73.w = _1390;
    float _1406 = fma(_1284, _1266, _1394);
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1410 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1412 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1414 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1406);
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1422 = fma(_1402, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1408);
    float _1424 = fma(_1402, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1412);
    float _1426 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1400;
    float _1432 = _1398;
    float _1434 = _1422;
    float _1436 = _1410;
    if (_970)
    {
        float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1440 = _1060 + _1438;
        _1430 = _1440;
    }
    float _1442 = _1430;
    if (_970)
    {
        float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1446 = _1064 + _1444;
        _1432 = _1446;
    }
    float _1448 = _1432;
    float _1450 = fma(_1402, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1410);
    float _1452 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_970)
    {
        float _1454 = _1442 * _1442;
        _986 = _1454;
    }
    float _1456 = _986;
    if (_970)
    {
        float _1458 = _1448 * _1448;
        _988 = _1458;
    }
    float _1460 = _988;
    float _1462 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1464 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1422);
    float _1466 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1450);
    float _1468 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1424);
    out.m_75.x = _1426;
    out.m_75.y = _1428;
    out.m_75.z = _1452;
    out.m_75.w = _1462;
    out.m_77.x = _1464;
    out.m_77.y = _1466;
    out.m_77.z = _1468;
    float _1470 = fma(_1086, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1472 = fma(_1088, 100.0, _1470);
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1476 = _1472 + _1474;
    float _1478 = fma(_1476, _1476, _1456);
    float _1480 = _1478 + _1460;
    float _1482 = sqrt(_1480);
    bool _1484 = _1482 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1486 = isnan(_1482);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1492 = _1488 || _1490;
    float _1494 = _1472;
    if (!_1492)
    {
        _1434 = 1.0;
    }
    float _1496 = _1434;
    bool _1498 = !_1492;
    float _1500 = _1496;
    if (!_1498)
    {
        bool _1502 = _1482 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1504 = isnan(_1482);
        bool _1506 = _1502 || _1504;
        bool _1508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1510 = _1506 || _1508;
        if (!_1510)
        {
            float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1514 = _1482 + _1512;
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1522 = _1520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1524 = 1.0 / _1518;
            float _1526 = _1514 * _1524;
            float _1528 = fma(_1526, _1522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1500 = _1528;
            _1530 = true;
        }
        else
        {
            bool _1532 = _1482 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1534 = isnan(_1482);
            bool _1536 = _1532 || _1534;
            bool _1538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1540 = _1536 || _1538;
            if (!_1540)
            {
                float _1542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1544 = _1482 + _1542;
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1554 = 1.0 / _1548;
                float _1556 = _1544 * _1554;
                float _1558 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1500 = _1558;
                _1530 = true;
            }
            else
            {
                _1500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1530 = false;
    float _1560 = _1500;
    float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1564 = _1472 + _1562;
    float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1568 = _1060 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1572 = _1064 + _1570;
    float _1574 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1576 = fma(_1568, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1578 = fma(_1572, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1574 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1576 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1578 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1590;
    float _1622 = _1572;
    float _1624 = _1618;
    float _1626 = _1600;
    if (_1614)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1628;
    }
    float _1630 = _1620;
    if (_1614)
    {
        float _1632 = rsqrt(_1610);
        _1622 = _1632;
    }
    float _1634 = _1622;
    float _1636 = _1634;
    if (_1614)
    {
        float _1638 = _1618 * _1630;
        _1624 = _1638;
    }
    float _1640 = _1624;
    if (_1614)
    {
        float _1642 = _1640 * 0.15915493667125701904296875;
        _1494 = _1642;
    }
    float _1644 = _1494;
    float _1646 = _1592;
    float _1648 = _1644;
    if (_1614)
    {
        float _1650 = _1644 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1646 = _1652;
    }
    float _1654 = _1646;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1598;
    float _1662 = _1656;
    float _1664 = _1658;
    if (_1614)
    {
        float _1666 = _1644 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1660 = _1668;
    }
    float _1670 = _1660;
    float _1672 = -_1600;
    float _1674 = -_1658;
    float _1676 = fma(_1582, _1672, _1674);
    float _1678 = _1676;
    if (_1614)
    {
        float _1680 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1680;
    }
    float _1682 = _1662;
    float _1684 = _1682;
    if (!_1614)
    {
        _1648 = _1606;
    }
    float _1686 = _1648;
    float _1688 = _1654;
    float _1690 = _1686;
    if (_1614)
    {
        float _1692 = fma(_1654, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1664 = _1692;
    }
    float _1694 = _1664;
    float _1696 = _1694;
    if (!_1614)
    {
        _1688 = _1602;
    }
    float _1698 = _1688;
    float _1700 = _1698;
    if (_1614)
    {
        float _1702 = _1670 + (-1.0);
        _1684 = _1702;
    }
    float _1704 = _1684;
    if (_1614)
    {
        float _1706 = _1634 * _1694;
        _1436 = _1706;
    }
    float _1708 = _1436;
    if (!_1614)
    {
        _1636 = _1676;
    }
    float _1710 = _1636;
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1714 = _1710;
    if (_1614)
    {
        float _1716 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1716;
    }
    float _1718 = _1626;
    if (_1614)
    {
        float _1720 = _1602 * _1708;
        _1700 = _1720;
    }
    float _1722 = _1700;
    if (!_1614)
    {
        _1696 = _1604;
    }
    float _1724 = _1696;
    float _1726 = _1724;
    if (_1614)
    {
        float _1728 = _1604 * _1708;
        _1726 = _1728;
    }
    float _1730 = _1726;
    if (_1614)
    {
        float _1732 = fma(_1676, _1670, _1718);
        _1714 = _1732;
    }
    float _1734 = _1714;
    if (_1614)
    {
        float _1736 = _1722 * _1722;
        _1690 = _1736;
    }
    float _1738 = _1690;
    float _1740 = sqrt(_1596);
    if (!_1614)
    {
        _1678 = _1608;
    }
    float _1742 = _1678;
    float _1744 = _1742;
    if (_1614)
    {
        float _1746 = _1730 * _1730;
        _1744 = _1746;
    }
    float _1748 = _1744;
    float _1750 = fma(_1734, _1734, _1738);
    float _1752 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1754 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1756 = _1750 + _1748;
    float _1758 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1760 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1752);
    float _1762 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1754);
    float _1764 = rsqrt(_1756);
    float _1766 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1758);
    float _1768 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1760);
    float _1770 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1762);
    float _1772 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1776 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1774);
    float _1778 = precise::clamp(_1776, 0.0, 1.0);
    float _1780 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1766);
    float _1782 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1784 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1786 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1772);
    float _1788 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1790 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1792 = -_1778;
    float _1794 = _1792 + 1.0;
    float _1796 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1798 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1800 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1790);
    float _1802 = _1764 * _1722;
    float _1804 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = abs(_1794);
    float _1808 = log2(_1806);
    float _1810 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1800);
    float _1812 = _1764 * _1734;
    float _1814 = _1764 * _1730;
    float _1816 = -_1798;
    float _1818 = fma(_1816, _1712, 1.0);
    float _1820 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1810);
    float _1822 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1824 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1826 = 1.0 / _1820;
    float _1828 = -_1822;
    float _1830 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1828);
    float _1832 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1824);
    float _1834 = -_1814;
    float _1836 = fma(_1834, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1830);
    float _1838 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1840 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1842 = log2(_1818);
    float _1844 = fma(_1836, -0.5, 0.5);
    float _1846 = fma(_1836, 0.5, 0.5);
    float _1848 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1838);
    float _1850 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1832);
    float _1852 = _1812 + 1.0;
    float _1854 = fma(_1846, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1856 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1848);
    float _1858 = exp2(_1840);
    float _1860 = fma(_1846, _1854, -0.212114393711090087890625);
    float _1862 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1856);
    float _1864 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1850);
    float _1866 = fma(_1846, _1860, 1.570728778839111328125);
    float _1868 = sqrt(_1844);
    float _1870 = _1842 * 0.693147182464599609375;
    float _1872 = _1864 * _1826;
    float _1874 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1876 = fma(_1872, -0.5, 0.5);
    float _1878 = -_1812;
    float _1880 = fma(_1858, _1852, _1878);
    float _1882 = _1862 * _1826;
    float _1884 = fma(_1880, 0.5, 0.5);
    float _1886 = fma(_1882, 0.5, 0.5);
    float _1888 = _1868 * 0.636619746685028076171875;
    float _1890 = -_1866;
    float _1892 = fma(_1888, _1890, 1.0);
    float3 _5442 = float3(_1886, _1876, _1874);
    float _1894 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5442, float3(0.0), isnan(_5442)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5442, float3(0.0), isnan(_5442)), level(0.0)).x;
    float3 _5453 = float3(_1886, _1876, _1874);
    float4 _1897 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5453, float3(0.0), isnan(_5453)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5453, float3(0.0), isnan(_5453)), level(0.0)).xyzw;
    float _1899 = _1897.x;
    float _1901 = _1897.y;
    float _1903 = _1897.z;
    float _1905 = _1897.w;
    float2 _5469 = float2(_1892, _1884);
    float3 _1909 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5469, float2(0.0), isnan(_5469)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5469, float2(0.0), isnan(_5469)), level(0.0)).xyz;
    float _1911 = _1909.x;
    float _1913 = _1909.y;
    float _1915 = _1909.z;
    float _1917 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1919 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1921 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1923 = -_1090;
    float _1925 = _1923 + 1.0;
    float _1927 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1917);
    float _1929 = _1022 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1931 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1919);
    float _1933 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1927);
    float _1935 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1929);
    float _1937 = in.m_79.x;
    float _1939 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1941 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1935);
    float _1943 = exp2(_1921);
    float _1945 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1947 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1931);
    bool _1949 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(0.5);
    bool _1957 = _1953 || _1955;
    float _1959 = _1945 + _1939;
    float _1961 = 1.0 / _1939;
    float _1963 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1947);
    float _1965 = _1959 * _1961;
    float _1967 = _1965 * 0.5;
    float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1971 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1969);
    float _1973 = 1.0 / _1971;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1977 = _1973 * _1975;
    float _1979 = abs(_1977);
    float _1981 = log2(_1979);
    float _1983 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1985 = exp2(_1983);
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1989 = precise::clamp(_1987, 0.0, 1.0);
    float _1991 = -_1943;
    float _1993 = _1991 + 1.0;
    float _1995 = fma(_1989, -2.0, 3.0);
    float _1997 = _1989 * _1989;
    float _1999 = _1997 * _1995;
    bool _2001 = _1977 <= 8000.0;
    bool _2003 = isnan(_1977);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(8000.0);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1999;
    float _2015 = _2013 + 1.0;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1999);
    float _2019 = _2011 * _2017;
    float _2021 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2023 = _1963 + _1820;
    float _2025 = _1925 * _2021;
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = _2023 * 0.5;
    float _2031 = -_2027;
    float _2033 = fma(_2031, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2035 = _2033 * _1937;
    float _2037 = _2035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2039 = _2035;
    float _2041 = _1820;
    float _2043 = _1820;
    float _2045 = _2029;
    float _2047 = _1963;
    float _2049 = _1864;
    float _2051 = _1862;
    if (_1957)
    {
        _2039 = 1.0;
    }
    float _2053 = _2039;
    float _2055 = _2053;
    if (!_1957)
    {
        float _2057 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2059 = _2057 * 0.15915493667125701904296875;
        float _2061 = _2059 * 6.283185482025146484375;
        float _2063 = cos(_2061);
        float _2065 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2067 = _2065 * 0.15915493667125701904296875;
        float _2069 = _2059 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        float _2073 = 1.0 / _2063;
        float _2075 = _2067 * 6.283185482025146484375;
        float _2077 = cos(_2075);
        float _2079 = _2071 * _2073;
        float _2081 = _2067 * 6.283185482025146484375;
        float _2083 = sin(_2081);
        float _2085 = _2077 * _2079;
        float _2087 = 1.0 / _2085;
        float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2091 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2089;
        float _2093 = 1.0 / _2091;
        float _2095 = _2083 * _2087;
        float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2099 = fma(_1977, _2095, _2097);
        float _2101 = _2099 * _2093;
        float _2103 = precise::clamp(_2101, 0.0, 1.0);
        float _2105 = -_2103;
        float _2107 = _2105 + 1.0;
        _2055 = _2107;
    }
    float _2109 = _2055;
    float _2111 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2037;
    bool _2113 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2115 = isnan(_1740);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2121 = _2117 || _2119;
    float _2123 = _2111 * _1894;
    float _2125 = -_2111;
    float _2127 = _2125 + 1.0;
    out.gl_Position.x = _1862;
    out.gl_Position.y = _1864;
    out.gl_Position.z = _1963;
    out.gl_Position.w = _1820;
    float _2129 = _1905 * _2123;
    float _2131 = _1915 * _2123;
    float _2133 = _1905 * _2127;
    out.m_83.z = _2029;
    out.m_83.w = _1820;
    float _2135 = fma(_1911, _2129, _1899);
    float _2137 = fma(_1913, _2129, _1901);
    float _2139 = fma(_1905, _2131, _1903);
    float _2141 = _2109 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_85.x = _2135;
    out.m_85.y = _2137;
    out.m_85.z = _2139;
    out.m_85.w = _2133;
    if (!_2121)
    {
        _2041 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2143 = _2041;
    float _2145 = _2143;
    float _2147 = _2143;
    if (!_2121)
    {
        _2043 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2149 = _2043;
    float _2151 = _2149;
    float _2153 = _2149;
    if (!_2121)
    {
        _2045 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2155 = _2045;
    float _2157 = _2155;
    float _2159 = _2155;
    if (!_2121)
    {
        _2047 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2161 = _2047;
    float _2163 = _2161;
    float _2165 = _2161;
    if (!_2121)
    {
        _2049 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2167 = _2049;
    float _2169 = _2167;
    float _2171 = _2167;
    if (!_2121)
    {
        _2051 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2173 = _2051;
    bool _2175 = !_2121;
    float _2177 = _2173;
    float _2179 = _2173;
    if (!_2175)
    {
        bool _2181 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2183 = isnan(_1740);
        bool _2185 = _2181 || _2183;
        bool _2187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2189 = _2185 || _2187;
        if (!_2189)
        {
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2193 = _1740 + _2191;
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2195;
            float _2199 = 1.0 / _2197;
            float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2203 = _2201 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2221 = _2193 * _2199;
            float _2223 = precise::clamp(_2221, 0.0, 1.0);
            float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2227 = _2225 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2229 = fma(_2223, _2203, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2231 = fma(_2223, _2227, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2233 = fma(_2223, _2207, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2235 = fma(_2223, _2211, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2237 = fma(_2223, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2239 = fma(_2223, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2159 = _2231;
            _2171 = _2237;
            _2153 = _2229;
            _2165 = _2235;
            _2147 = _2233;
            _2179 = _2239;
            _2241 = true;
        }
        else
        {
            bool _2243 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2245 = isnan(_1740);
            bool _2247 = _2243 || _2245;
            bool _2249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2251 = _2247 || _2249;
            if (!_2251)
            {
                _2151 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2253 = _2151;
            _2153 = _2253;
            if (!_2251)
            {
                _2157 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2255 = _2157;
            _2159 = _2255;
            if (!_2251)
            {
                _2145 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2257 = _2145;
            _2147 = _2257;
            if (!_2251)
            {
                _2163 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2259 = _2163;
            _2165 = _2259;
            if (!_2251)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2261 = _2169;
            _2171 = _2261;
            if (!_2251)
            {
                _2177 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2263 = _2177;
            bool _2265 = !_2251;
            _2179 = _2263;
            if (!_2265)
            {
                bool _2267 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2269 = isnan(_1740);
                bool _2271 = _2267 || _2269;
                bool _2273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2275 = _2271 || _2273;
                if (!_2275)
                {
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2279 = _1740 + _2277;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2281;
                    float _2285 = 1.0 / _2283;
                    float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2307 = _2279 * _2285;
                    float _2309 = precise::clamp(_2307, 0.0, 1.0);
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2315 = fma(_2309, _2289, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2317 = fma(_2309, _2313, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2319 = fma(_2309, _2293, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2321 = fma(_2309, _2297, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2323 = fma(_2309, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2325 = fma(_2309, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2159 = _2317;
                    _2171 = _2323;
                    _2153 = _2315;
                    _2165 = _2321;
                    _2147 = _2319;
                    _2179 = _2325;
                    _2241 = true;
                }
                else
                {
                    _2159 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2153 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2165 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2147 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2179 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2241 = false;
    float _2327 = _2159;
    float _2329 = _2171;
    float _2331 = _2153;
    float _2333 = _2165;
    float _2335 = _2147;
    float _2337 = _2179;
    float _2339 = _2141 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2341 = fma(_1466, -0.5, 0.5);
    float _2343 = precise::clamp(_2341, 0.0, 1.0);
    float _2345 = -_2327;
    float _2347 = _2345 + _2329;
    float _2349 = -_2331;
    float _2351 = _2349 + _2333;
    out.m_55.x = _2339;
    float _2353 = fma(_2343, _2347, _2327);
    float _2355 = -_2335;
    float _2357 = _2355 + _2337;
    float _2359 = fma(_2343, _2351, _2331);
    float _2361 = _2353 * 0.586610972881317138671875;
    bool _2363 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2365 = fma(_2343, _2357, _2335);
    out.m_87.x = 0.0;
    float _2367 = fma(_2359, 0.298911988735198974609375, _2361);
    bool _2369 = _2109 > 0.0;
    bool _2371 = isnan(_2109);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = fma(_2365, 0.114477999508380889892578125, _2367);
    float _2381 = -_2379;
    float _2383 = _2359 + _2381;
    float _2385 = -_2379;
    float _2387 = _2353 + _2385;
    float _2389 = -_2379;
    float _2391 = _2365 + _2389;
    float _2393 = fma(_2383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2379);
    float _2395 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2379);
    float _2397 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2379);
    bool _2399 = !_2363;
    if (!_2399)
    {
        float _2401 = -_1574;
        float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2405 = -_1576;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2409 = -_1578;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2413 = _2403 * _2403;
        float _2415 = fma(_2407, _2407, _2413);
        float _2417 = fma(_2411, _2411, _2415);
        float _2419 = sqrt(_2417);
        float _2421 = rsqrt(_2417);
        float _2423 = -_2419;
        float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2427 = _2425 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2429 = precise::clamp(_2427, 0.0, 1.0);
        float _2431 = _2407 * _2421;
        float _2433 = _2403 * _2421;
        float _2435 = abs(_2429);
        float _2437 = log2(_2435);
        float _2439 = _2411 * _2421;
        float _2441 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2443 = _1466 * _2433;
        float _2445 = -_2433;
        float _2447 = -_2441;
        float _2449 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2447);
        float _2451 = fma(_1464, _2431, _2443);
        float _2453 = -_2439;
        float _2455 = fma(_2453, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2449);
        float _2457 = fma(_1468, _2439, _2451);
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2463 = _2455 + _2461;
        float _2465 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2467 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2469 = precise::clamp(_2467, 0.0, 1.0);
        float _2471 = exp2(_2465);
        float _2473 = _2471 * _2469;
        float _2475 = _2459 * _2473;
        float _2477 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2479 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2481 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2477;
        out.m_87.y = _2479;
        out.m_87.z = _2481;
    }
    out.m_89.x = _2393;
    out.m_89.y = _2395;
    out.m_89.z = _2397;
    if (_2377)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _2483 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2483;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

