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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_28 [[id(7)]];
    sampler vp_t_tcb_28Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_28Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_111 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_103 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_107 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_105 [[user(locn14)]];
    float4 m_97 [[user(locn15)]];
    float4 m_113 [[user(locn16)]];
    float4 m_109 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_93 [[attribute(8)]];
    float4 m_91 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
    float4 m_71 [[attribute(11)]];
    float4 m_95 [[attribute(12)]];
    float4 m_57 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4604 = false;
    bool _3649 = false;
    bool _672 = false;
    bool _530 = false;
    bool _388 = false;
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4903 = as_type<float>(_148);
        out.gl_Position.z = _4903;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4973 = as_type<float>(_186);
        out.gl_Position.z = _4973;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_57.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.y;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = in.m_65.x;
    float _214 = in.m_65.y;
    float _216 = in.m_65.z;
    out.m_67.x = _188;
    out.m_67.y = _192;
    float _218 = _196 * _202;
    float _220 = _196 * _208;
    float _222 = fma(_194, _200, _218);
    float _224 = _196 * _214;
    float _226 = fma(_194, _206, _220);
    float _228 = fma(_194, _212, _224);
    float _230 = fma(_198, _204, _222);
    float _232 = fma(_198, _210, _226);
    float _234 = fma(_198, _216, _228);
    bool _236 = !_190;
    float _238 = _192;
    float _240 = _188;
    float _242 = _234;
    float _260;
    if (!_236)
    {
        float _244 = in.m_69.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_132);
        float _266 = 1.0 / _264;
        float _268 = _166 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _270 + _272;
    bool _276 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _278 = isnan(_270);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = 1.0 / _290;
    bool _294 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _296 = isnan(_270);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -_286;
    float _308 = _306 + 1.0;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _314;
    bool _318 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = _304 * _308;
    float _326 = -_304;
    float _328 = _326 + 1.0;
    float _330 = _274 * _292;
    float _332 = in.m_71.x;
    float _334 = in.m_71.y;
    float _336 = in.m_71.z;
    float _338 = fma(_312, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _340 = fma(_322, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _342 = fma(_316, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _344 = _338 * _324;
    float _346 = _340 * _324;
    float _348 = _342 * _324;
    float _350 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _352 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _354 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].z, _348);
    float _356 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[144].x, _350);
    float _358 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[144].y, _352);
    float _360 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[144].z, _354);
    float _362 = _356 * _332;
    float _364 = _358 * _334;
    float _366 = _360 * _336;
    bool _368 = !_318;
    float _386;
    if (!_368)
    {
        float _370 = in.m_69.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_132);
        float _392 = 1.0 / _390;
        float _394 = _166 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _400 = _396 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _406 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_396);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _422 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _424 = isnan(_396);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _434;
    bool _438 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _440 = isnan(_396);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = 1.0 / _404;
    float _452 = -_416;
    float _454 = _452 + 1.0;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _458 = _432 * _454;
    float _460 = -_432;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _420;
    float _466 = _436 * _450;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _472 = fma(_466, _400, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _474 = -_448;
    float _476 = _474 + 1.0;
    float _478 = _472 * _458;
    float _480 = _470 * _464;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _484 = _396 + _482;
    float _486 = _416 * _476;
    float _488 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _490 = fma(_480, _484, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _492 = fma(_490, _486, _488);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _500 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[117].x, _492);
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _502;
    out.m_73.y = _504;
    out.m_73.z = _506;
    out.m_73.w = _508;
    bool _510 = !_456;
    float _528;
    if (!_510)
    {
        float _512 = in.m_69.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_132);
        float _534 = 1.0 / _532;
        float _536 = _166 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _542 = _538 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _548 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _550 = isnan(_538);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _564 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _566 = isnan(_538);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _576;
    bool _580 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _582 = isnan(_538);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _546;
    float _594 = -_558;
    float _596 = _594 + 1.0;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _600 = _574 * _596;
    float _602 = -_574;
    float _604 = _602 + 1.0;
    float _606 = 1.0 / _562;
    float _608 = _578 * _592;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _614 = fma(_608, _542, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _616 = -_590;
    float _618 = _616 + 1.0;
    float _620 = _614 * _600;
    float _622 = _612 * _606;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _626 = _538 + _624;
    float _628 = _558 * _618;
    float _630 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[131].x, _620);
    float _632 = fma(_622, _626, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _634 = fma(_632, _628, _630);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _642 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[133].x, _634);
    float _644 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _642 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _644;
    out.m_75.y = _646;
    out.m_75.z = _648;
    out.m_75.w = _650;
    bool _652 = !_598;
    float _670;
    if (!_652)
    {
        float _654 = in.m_69.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_132);
        float _676 = 1.0 / _674;
        float _678 = _166 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _684 = int(_682);
    float _686 = in.m_69.x;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _690 = _680 + _688;
    float _692 = float(_132);
    float _694 = in.m_77.y;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _698 = _696 != 0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _702 = _680 + _700;
    float _704 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _706 = int(_704);
    float _708 = in.m_61.w;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _712 = _680 + _710;
    float _714 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _716 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _718 = int(_716);
    float _720 = float(_684);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _726 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _728 = isnan(_680);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    bool _738 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _740 = isnan(_680);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = 1.0 / _720;
    float _752 = float(uint(_706));
    int _754 = ~_706;
    int _756 = _754 + 1;
    bool _758 = _706 == 0;
    float _760 = 1.0 / _752;
    int _762 = ~_706;
    int _764 = _762 + 1;
    float _766 = float(_718);
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _770 = _750 * _166;
    float _772 = 1.0 / _766;
    int _774 = as_type<int>(_760) + (-2);
    float _776 = trunc(_770);
    int _778 = int(_776);
    float _780 = float(_706);
    float _782 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _784 = int(_782);
    float _786 = _772 * _166;
    float _788 = float(uint(_778));
    float _790 = trunc(_786);
    int _792 = int(_790);
    float _794 = as_type<float>(_774) * _788;
    float _796 = float(uint(_784));
    float _798 = 1.0 / _692;
    int _800 = ~_784;
    int _802 = _800 + 1;
    float _804 = trunc(_794);
    float _806 = precise::max(_804, 0.0);
    uint _809 = uint(_806);
    float _811 = 1.0 / _796;
    int _813 = _764 * int(_809);
    int _815 = _813 + _778;
    float _817 = 1.0 / _724;
    float _819 = float(uint(_815));
    int _821 = as_type<int>(_811) + (-2);
    float _823 = as_type<float>(_774) * _819;
    float _825 = _819;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _829 = as_type<float>(_784);
    if (_698)
    {
        _825 = 1.0;
    }
    float _831 = _825;
    float _833 = _831;
    if (!_698)
    {
        _833 = 7.345489978790283203125;
    }
    float _835 = _833;
    float _837 = trunc(_823);
    float _839 = precise::max(_837, 0.0);
    uint _841 = uint(_839);
    float _843 = _835 * _686;
    float _845 = floor(_843);
    int _847 = int(_809) + int(_841);
    float _849 = float(_778);
    float _851 = float(uint(_792));
    int _853 = _756 * _847;
    int _855 = _853 + _778;
    bool _857 = _849 >= _780;
    bool _859 = isnan(_849);
    bool _861 = _857 || _859;
    bool _863 = isnan(_780);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -_845;
    float _871 = _843 + _869;
    float _873 = as_type<float>(_821) * _851;
    bool _875 = uint(_855) >= uint(_706);
    float _877 = trunc(_867);
    int _879 = int(_877);
    bool _881 = !_875;
    int _883 = _881 ? 0 : (-1);
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _891 = _889 != 0;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _895 = _893 != 0;
    int _897 = ~_847;
    int _899 = _897 + _883;
    int _901 = _899 + 1;
    float _903 = trunc(_873);
    float _905 = precise::max(_903, 0.0);
    uint _907 = uint(_905);
    float _909 = in.m_69.y;
    float _911 = _780 * _166;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _915 = _913 != 0;
    int _917 = _706 * _901;
    int _919 = _917 + _778;
    float _921 = _911 * _798;
    int _923 = ~_879;
    int _925 = _923 + 1;
    int _927 = _925 + 1;
    bool _929 = !_758;
    float _931 = _929 ? as_type<float>(_919) : as_type<float>(0xffffffffu /* nan */);
    float _933 = _871 * _780;
    float _935 = _871;
    float _937 = _931;
    if (_698)
    {
        _935 = _686;
    }
    float _939 = _935;
    float _941 = trunc(_921);
    int _943 = int(_941);
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _947 = _945 != 0;
    int _949 = as_type<int>(_931) * _927;
    float _951 = _939;
    if (_698)
    {
        _937 = 1.0;
    }
    float _953 = _937;
    float _955 = _953;
    if (!_698)
    {
        _955 = 1.2345600128173828125;
    }
    float _957 = _955;
    int _959 = _802 * int(_907);
    int _961 = _959 + _792;
    int _963 = _706 + (-1);
    float _965 = trunc(_933);
    int _967 = int(_965);
    if (!_698)
    {
        _951 = _909;
    }
    float _969 = _951;
    float _971 = float(uint(_961));
    int _973 = _879 * _963;
    int _975 = _973 + _949;
    bool _977 = !_915;
    int _979 = _977 ? 0 : 1;
    float _981 = _969 * _957;
    bool _983 = !_891;
    int _985 = _983 ? 0 : 1;
    float _987 = as_type<float>(_821) * _971;
    bool _989 = !_887;
    int _991 = _989 ? 0 : 1;
    int _993 = abs(_979);
    int _995 = abs(_985);
    float _997 = trunc(_987);
    float _999 = precise::max(_997, 0.0);
    uint _1001 = uint(_999);
    bool _1003 = !_895;
    int _1005 = _1003 ? 0 : 1;
    int _1007 = abs(_991);
    int _1009 = _975 * _995;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1013 = _1011 != 0;
    float _1015 = floor(_981);
    int _1017 = abs(_1005);
    int _1019 = _967 * _993;
    int _1021 = _1019 + _778;
    bool _1023 = !_1013;
    int _1025 = _1023 ? 0 : 1;
    bool _1027 = _784 == 0;
    int _1029 = _943 * _1007;
    int _1031 = _1029 + _1009;
    int _1033 = abs(_1025);
    int _1035 = int(_907) + int(_1001);
    int _1037 = _1021 * _1017;
    int _1039 = _1037 + _1031;
    int _1041 = ~_784;
    int _1043 = _1041 + 1;
    float _1045 = -_1015;
    float _1047 = _981 + _1045;
    float _1049 = float(_784);
    int _1051 = _967 * _1033;
    int _1053 = _1051 + _1039;
    float _1055 = float(_792);
    int _1057 = _1043 * _1035;
    int _1059 = _1057 + _792;
    float _1061 = _1049 * _1047;
    bool _1063 = _1055 >= _1049;
    bool _1065 = isnan(_1055);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(_1049);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = float(uint(_1053));
    bool _1077 = uint(_1059) >= uint(_784);
    float _1079 = trunc(_1061);
    int _1081 = int(_1079);
    float _1083 = as_type<float>(_774) * _1075;
    bool _1085 = !_1077;
    int _1087 = _1085 ? 0 : (-1);
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1091 = _1089 != 0;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1095 = _1093 != 0;
    int _1097 = ~_1035;
    int _1099 = _1097 + _1087;
    int _1101 = _1099 + 1;
    float _1103 = trunc(_1073);
    int _1105 = int(_1103);
    int _1107 = ~_706;
    int _1109 = _1107 + 1;
    int _1111 = _784 * _1101;
    int _1113 = _1111 + _792;
    float _1115 = _1049 * _166;
    float _1117 = trunc(_1083);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = _1115 * _798;
    bool _1125 = !_1027;
    int _1127 = _1125 ? _1113 : (-1);
    int _1129 = ~_1105;
    int _1131 = _1129 + 1;
    int _1133 = _1131 + 1;
    float _1135 = trunc(_1123);
    int _1137 = int(_1135);
    bool _1139 = !_1091;
    int _1141 = _1139 ? 0 : 1;
    int _1143 = _1133 * _1127;
    int _1145 = _784 + (-1);
    int _1147 = _1109 * int(_1121);
    int _1149 = _1147 + _1053;
    bool _1151 = !_947;
    int _1153 = _1151 ? 0 : 1;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1161 = _1159 != 0;
    int _1163 = _1105 * _1145;
    int _1165 = _1163 + _1143;
    float _1167 = float(uint(_1149));
    bool _1169 = !_1095;
    int _1171 = _1169 ? 0 : 1;
    bool _1173 = !_1157;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = as_type<float>(_774) * _1167;
    int _1179 = abs(_1171);
    int _1181 = abs(_1153);
    float _1183 = trunc(_1177);
    float _1185 = precise::max(_1183, 0.0);
    uint _1187 = uint(_1185);
    int _1189 = abs(_1141);
    int _1191 = _1165 * _1179;
    int _1193 = abs(_1175);
    bool _1195 = !_1161;
    int _1197 = _1195 ? 0 : 1;
    int _1199 = _1081 * _1181;
    int _1201 = _1199 + _792;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1205 = _1203 != 0;
    int _1207 = _1137 * _1189;
    int _1209 = _1207 + _1191;
    int _1211 = abs(_1197);
    float _1213 = in.m_69.z;
    int _1215 = ~_706;
    int _1217 = _1215 + 1;
    int _1219 = _1201 * _1193;
    int _1221 = _1219 + _1209;
    int _1223 = int(_1121) + int(_1187);
    float _1225 = in.m_69.w;
    int _1227 = _1081 * _1211;
    int _1229 = _1227 + _1221;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1233 = _1231 != 0;
    int _1235 = ~_784;
    int _1237 = _1235 + 1;
    int _1239 = _1217 * _1223;
    int _1241 = _1239 + _1053;
    float _1243 = float(uint(_1229));
    int _1245 = _1211;
    float _1247 = as_type<float>(_1137);
    int _1249 = _1209;
    float _1251 = as_type<float>(_1081);
    if (_1205)
    {
        float _1253 = -_188;
        float _1255 = _1253 + 1.0;
        _1245 = as_type<int>(_1255);
    }
    int _1257 = _1245;
    if (!_1205)
    {
        _1247 = _188;
    }
    float _1259 = _1247;
    bool _1261 = uint(_1241) >= uint(_706);
    float _1263 = as_type<float>(_821) * _1243;
    bool _1265 = _706 == 0;
    bool _1267 = !_1261;
    int _1269 = _1267 ? 0 : (-1);
    float _1271 = trunc(_1263);
    float _1273 = precise::max(_1271, 0.0);
    uint _1275 = uint(_1273);
    bool _1277 = _1261;
    float _1279 = _1259;
    if (_1205)
    {
        bool _1281 = _686 > 0.5;
        _1277 = _1281;
    }
    bool _1283 = _1277;
    if (_1233)
    {
        float _1285 = -_188;
        float _1287 = _1285 + 1.0;
        _1249 = as_type<int>(_1287);
    }
    int _1289 = _1249;
    int _1291 = ~_1223;
    int _1293 = _1291 + _1269;
    int _1295 = _1293 + 1;
    if (_1205)
    {
        float _1297 = _1283 ? as_type<float>(_1257) : _188;
        _1279 = _1297;
    }
    float _1299 = _1279;
    bool _1301 = _909 > 0.5;
    int _1303 = _706 * _1295;
    int _1305 = _1303 + _1053;
    float _1307 = -_192;
    float _1309 = _1307 + 1.0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1313 = _1311 != 0;
    bool _1315 = _1213 > 0.5;
    int _1317 = _1301 ? as_type<int>(_1309) : as_type<int>(_192);
    int _1319 = _1237 * int(_1275);
    int _1321 = _1319 + _1229;
    bool _1323 = _1225 > 0.5;
    bool _1325 = !_1265;
    int _1327 = _1325 ? _1305 : (-1);
    float _1329 = float(uint(_1321));
    if (!_1233)
    {
        _1251 = _188;
    }
    float _1331 = _1251;
    float _1333 = _1331;
    if (_1233)
    {
        float _1335 = _1315 ? as_type<float>(_1289) : _188;
        _1333 = _1335;
    }
    float _1337 = _1333;
    float _1339 = as_type<float>(_821) * _1329;
    float _1341 = _1313 ? as_type<float>(_1317) : _192;
    int _1343 = _1327 & 3;
    bool _1345 = _1343 != 0;
    float _1347 = trunc(_1339);
    float _1349 = precise::max(_1347, 0.0);
    uint _1351 = uint(_1349);
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1355 = _1353 != 0;
    int _1357 = _1323 ? as_type<int>(_1309) : as_type<int>(_192);
    int _1359 = _1327 & 3;
    bool _1361 = _1359 != 0;
    int _1363 = _1345 ? 0 : 1;
    float _1365 = _1355 ? as_type<float>(_1357) : _192;
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1369 = _1367 != 0;
    bool _1371 = uint(_1359) > 1u;
    int _1373 = ~_1363;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    int _1379 = int(_1275) + int(_1351);
    int _1381 = ~_784;
    int _1383 = _1381 + 1;
    int _1385 = _1377;
    if (_1369)
    {
        float _1387 = _1315 ? _1309 : _192;
        _238 = _1387;
    }
    float _1389 = _238;
    int _1391 = _1383 * _1379;
    int _1393 = _1391 + _1229;
    float _1395 = as_type<float>(_1393);
    if (!_1371)
    {
        int _1397 = ~_1363;
        int _1399 = _1397 + 1;
        _1385 = _1399;
    }
    int _1401 = _1385;
    float _1403 = in.m_50.x;
    float _1405 = in.m_50.y;
    float _1407 = in.m_50.z;
    bool _1409 = _1359 != 3;
    bool _1411 = uint(_1359) >= 2u;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1415 = _1413 != 0;
    int _1417 = _1411 ? 0 : 1;
    bool _1419 = _909 > 0.5;
    bool _1421 = _1419 && _1415;
    int _1423 = ~_1417;
    int _1425 = _1423 + 1;
    int _1427 = _1425 + 1;
    int _1429 = _1427;
    if (_1409)
    {
        int _1431 = ~_1417;
        int _1433 = _1431 + 1;
        _1429 = _1433;
    }
    int _1435 = _1429;
    bool _1437 = uint(_1393) >= uint(_784);
    if (!_1415)
    {
        _1395 = _188;
    }
    float _1439 = _1395;
    bool _1441 = !_1437;
    int _1443 = _1441 ? 0 : (-1);
    float _1445 = _1439;
    if (_1421)
    {
        float _1447 = -_188;
        float _1449 = _1447 + 1.0;
        _240 = _1449;
    }
    float _1451 = _240;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1455 = _1453 != 0;
    float _1457 = _214 * _1405;
    float _1459 = _202 * _1405;
    float _1461 = _208 * _1405;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1467 = fma(_200, _1403, _1459);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1473 = fma(_206, _1403, _1461);
    float _1475 = 1.0 / _1465;
    float _1477 = fma(_212, _1403, _1457);
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1481 = _1479 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1483 = fma(_204, _1407, _1467);
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1485;
    float _1489 = float(uint(_1021));
    float _1491 = _1405 + _694;
    float _1493 = 1.0 / _1471;
    float _1495 = _1487 * _817;
    float _1497 = as_type<float>(_774) * _1489;
    int _1499 = ~_1379;
    int _1501 = _1499 + _1443;
    int _1503 = _1501 + 1;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1509 = _1507 != 0;
    float _1511 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1515 = _1513 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1517;
    int _1521 = _784 * _1503;
    int _1523 = _1521 + _1229;
    float _1525 = -_1505;
    float _1527 = fma(_1511, 2.0, _1525);
    float _1529 = trunc(_1497);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1537 = _909 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1539 = _1515 * _1475;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1545 = _1519 * _1493;
    if (_1415)
    {
        _1445 = _1451;
    }
    float _1547 = _1445;
    float _1549 = fma(_1537, -2.0, _1535);
    bool _1551 = !_1027;
    float _1553 = _1551 ? as_type<float>(_1523) : as_type<float>(0xffffffffu /* nan */);
    float _1555 = fma(_210, _1407, _1473);
    float _1557 = float(uint(_1201));
    float _1559 = 1.0 / _1543;
    int _1561 = ~_706;
    int _1563 = _1561 + 1;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1569 = fma(_216, _1407, _1477);
    float _1571 = as_type<float>(_821) * _1557;
    int _1573 = _1563 * int(_1533);
    int _1575 = _1573 + _1021;
    int _1577 = ~_784;
    int _1579 = _1577 + 1;
    float _1581 = 1.0 / _1481;
    int _1583 = as_type<int>(_1553) & 3;
    bool _1585 = _1583 != 0;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1591 = float(uint(_1575));
    float _1593 = _1483 + _708;
    int _1595 = _1585 ? 0 : 1;
    float _1597 = -_166;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1527);
    bool _1601 = uint(_1583) >= 2u;
    float _1603 = trunc(_1571);
    float _1605 = precise::max(_1603, 0.0);
    uint _1607 = uint(_1605);
    float _1609 = as_type<float>(_774) * _1591;
    int _1611 = _1601 ? 0 : 1;
    bool _1613 = _1583 != 3;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1619 = 1.0 / _1589;
    int _1621 = ~_1611;
    int _1623 = _1621 + 1;
    int _1625 = _1623 + 1;
    float _1627 = _1567 * _1581;
    int _1629 = ~_1595;
    int _1631 = _1629 + 1;
    int _1633 = _1631 + 1;
    bool _1635 = !_1455;
    int _1637 = _1635 ? 0 : 1;
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1641 = _1639 != 0;
    float _1643 = trunc(_1609);
    float _1645 = precise::max(_1643, 0.0);
    uint _1647 = uint(_1645);
    int _1649 = _1625;
    int _1651 = _1633;
    float _1653 = _1555;
    float _1655 = _1553;
    float _1657 = _1549;
    if (_1613)
    {
        int _1659 = ~_1611;
        int _1661 = _1659 + 1;
        _1649 = _1661;
    }
    int _1663 = _1649;
    int _1665 = _1579 * int(_1607);
    int _1667 = _1665 + _1201;
    bool _1669 = uint(_1583) > 1u;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1679 = 1.0 / _1617;
    float _1681 = float(uint(_1667));
    float _1683 = _1673 * _1559;
    float _1685 = _686 * 2.0;
    float _1687 = _1677 * _1619;
    float _1689 = _686 + _909;
    float _1691 = as_type<float>(_821) * _1681;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1693;
    float _1697 = floor(_1685);
    int _1699 = int(_1533) + int(_1647);
    float _1701 = _1689 + (-1.0);
    float _1703 = _909 * 2.0;
    int _1705 = ~_706;
    int _1707 = _1705 + 1;
    float _1709 = fma(_1687, _690, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    if (!_1669)
    {
        int _1711 = ~_1595;
        int _1713 = _1711 + 1;
        _1651 = _1713;
    }
    int _1715 = _1651;
    float _1717 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1719 = trunc(_1691);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    float _1725 = _909 + _1213;
    float _1727 = _1695 * _1679;
    int _1729 = _1707 * _1699;
    int _1731 = _1729 + _1021;
    int _1733 = ~_784;
    int _1735 = _1733 + 1;
    float _1737 = _1725 + (-1.0);
    float _1739 = fma(_1727, _712, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1741 = _1697 > 0.0;
    float _1743 = floor(_1703);
    bool _1745 = _1697 >= 0.0;
    bool _1747 = isnan(_1697);
    bool _1749 = _1745 || _1747;
    bool _1751 = isnan(0.0);
    bool _1753 = _1749 || _1751;
    float _1755 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1757 = _1213 * 2.0;
    bool _1759 = !_1509;
    int _1761 = _1759 ? 0 : 1;
    int _1763 = _1753 ? 0 : 1;
    int _1765 = int(_1607) + int(_1723);
    bool _1767 = uint(_1731) >= uint(_706);
    int _1769 = ~_1763;
    int _1771 = _1769 + 1;
    int _1773 = _1771 + 1;
    int _1775 = _1735 * _1765;
    int _1777 = _1775 + _1201;
    int _1779 = _1773;
    if (!_1741)
    {
        int _1781 = ~_1763;
        int _1783 = _1781 + 1;
        _1779 = _1783;
    }
    int _1785 = _1779;
    bool _1787 = !_1767;
    int _1789 = _1787 ? 0 : (-1);
    bool _1791 = uint(_1777) >= uint(_784);
    float _1793 = floor(_1757);
    bool _1795 = _1743 > 0.0;
    bool _1797 = _1743 >= 0.0;
    bool _1799 = isnan(_1743);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    int _1807 = ~_1699;
    int _1809 = _1807 + _1789;
    int _1811 = _1809 + 1;
    int _1813 = as_type<int>(_1743);
    if (_1641)
    {
        _1813 = 0;
    }
    int _1815 = _1813;
    int _1817 = _1815;
    if (_1641)
    {
        _827 = 0;
    }
    int _1819 = _827;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1823 = _680 + _1821;
    int _1825 = _1805 ? 0 : 1;
    int _1827 = _706 * _1811;
    int _1829 = _1827 + _1021;
    int _1831 = _1819;
    if (!_1641)
    {
        _1817 = 1;
    }
    int _1833 = _1817;
    float _1835 = fma(_1539, _1823, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    if (!_1641)
    {
        _1831 = 2;
    }
    int _1837 = _1831;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1841 = _1839 != 0;
    int _1843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1845 = _1843 != 0;
    int _1847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1849 = _1847 != 0;
    bool _1851 = _706 == 0;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1855 = _680 + _1853;
    bool _1857 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1859 = isnan(_680);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1865 = _1861 || _1863;
    float _1867 = float(_1865);
    int _1869 = ~_1825;
    int _1871 = _1869 + 1;
    int _1873 = _1871 + 1;
    float _1875 = fma(_1495, _1855, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1877 = !_1791;
    int _1879 = _1877 ? 0 : (-1);
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1883 = _680 + _1881;
    int _1885 = _1873;
    if (!_1795)
    {
        int _1887 = ~_1825;
        int _1889 = _1887 + 1;
        _1885 = _1889;
    }
    int _1891 = _1885;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1895 = _680 + _1893;
    bool _1897 = _1793 > 0.0;
    bool _1899 = _1793 >= 0.0;
    bool _1901 = isnan(_1793);
    bool _1903 = _1899 || _1901;
    bool _1905 = isnan(0.0);
    bool _1907 = _1903 || _1905;
    float _1909 = -_1867;
    float _1911 = _1909 + 1.0;
    bool _1913 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1915 = isnan(_680);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    bool _1925 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1927 = isnan(_680);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1933 = _1929 || _1931;
    float _1935 = float(_1933);
    bool _1937 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1939 = isnan(_680);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1945 = _1941 || _1943;
    float _1947 = float(_1945);
    float _1949 = _1923 * _1911;
    float _1951 = -_1923;
    float _1953 = _1951 + 1.0;
    float _1955 = fma(_1545, _1883, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1957 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1959 = isnan(_680);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = fma(_1627, _1895, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1971 = -_1935;
    float _1973 = _1971 + 1.0;
    bool _1975 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1977 = isnan(_680);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1983 = _1979 || _1981;
    float _1985 = float(_1983);
    float _1987 = -_1947;
    float _1989 = _1987 + 1.0;
    bool _1991 = !_1851;
    int _1993 = _1991 ? _1829 : (-1);
    float _1995 = _1967 * _1973;
    float _1997 = -_1967;
    float _1999 = _1997 + 1.0;
    float _2001 = -_1985;
    float _2003 = _2001 + 1.0;
    float _2005 = _1935 * _1953;
    bool _2007 = _1833 != 1;
    float _2009 = in.m_63.w;
    float _2011 = _1985 * _1999;
    float _2013 = _1947 * _2003;
    float _2015 = _736 * _1989;
    float _2017 = -_736;
    float _2019 = _2017 + 1.0;
    float _2021 = in.m_65.w;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2025 = _1907 ? 0 : 1;
    float _2027 = _748 * _2019;
    float _2029 = -_748;
    float _2031 = _2029 + 1.0;
    bool _2033 = _1837 != 2;
    float _2035 = fma(_1683, _702, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2037 = _1875 * _2027;
    bool _2039 = !_1841;
    int _2041 = _2039 ? 0 : 1;
    float _2043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2045 = ~_2025;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    float _2051 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2037);
    int _2053 = _2049;
    float _2055 = _2019;
    if (!_1897)
    {
        int _2057 = ~_2025;
        int _2059 = _2057 + 1;
        _2053 = _2059;
    }
    int _2061 = _2053;
    float _2063 = fma(_1835, _2015, _2051);
    int _2065 = as_type<int>(_1553) & 3;
    bool _2067 = _2065 != 0;
    float _2069 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2073 = fma(_1955, _2013, _2063);
    float _2075 = _1555 + _2009;
    float _2077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2079 = _1593 + _2077;
    float _2081 = fma(_2069, _1389, -0.5);
    if (_2033)
    {
        _1653 = _686;
    }
    float _2083 = _1653;
    float _2085 = _1569 + _2021;
    float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2089 = _2075 + _2087;
    float _2091 = _2079 * _2079;
    float _2093 = _2083;
    if (!_2033)
    {
        _2093 = _1213;
    }
    float _2095 = _2093;
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2099 = _2085 + _2097;
    int _2101 = abs(_2041);
    float _2103 = fma(_2089, _2089, _2091);
    float _2105 = float(_2061);
    float _2107 = _2095 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2109 = float(_2101);
    float _2111 = fma(_2099, _2099, _2103);
    bool _2113 = !_2067;
    int _2115 = _2113 ? 0 : 1;
    float _2117 = -_2071;
    float _2119 = fma(_2107, 2.0, _2117);
    bool _2121 = _1359 != 3;
    float _2123 = sqrt(_2111);
    float _2125 = _2109 * _2105;
    int _2127 = _1327 >> 31;
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2131 = _1491 + _2129;
    bool _2133 = !_2121;
    int _2135 = _2133 ? 0 : (-1);
    float _2137 = _714 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _2139 = _1583 != 3;
    float _2141 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2143 = _2127 & 3;
    float _2145 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2147 = as_type<int>(_1553) >> 31;
    float _2149 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2141);
    int _2151 = _1327 + _2143;
    float _2153 = fma(_2145, _1547, -0.5);
    int _2155 = _2147 & 3;
    float _2157 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2149);
    int _2159 = _2151 >> 2;
    float _2161 = _2123 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2163 = as_type<int>(_1553) + _2155;
    float _2165 = rsqrt(_2111);
    int _2167 = _2159 << 4;
    int _2169 = _2167 + 368;
    float _2171 = fma(_1969, _2011, _2073);
    int _2173 = _2163 >> 2;
    float _2175 = -_166;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2119);
    float _2179 = as_type<float>(_2163);
    if (!_2007)
    {
        _2179 = _909;
    }
    float _2181 = _2179;
    float _2183 = fma(_2035, _1995, _2171);
    int _2185 = _2169 + 8;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    float _2203 = precise::min(_2137, _2161);
    int _2205 = _2173 << 4;
    int _2207 = _2205 + 512;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2211 = _2181;
    if (!_2007)
    {
        _2055 = _2181;
    }
    float _2213 = _2055;
    out.m_79.w = _2203;
    bool _2215 = !_2139;
    int _2217 = _2215 ? 0 : (-1);
    uint _2219 = uint(int(uint(_2169) >> uint(2)));
    uint _2221 = uint(int(uint(int(_2219)) >> uint(2)));
    int _2223 = int(_2219) & 3;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[int(_2221)][_2223];
    int _2227 = int(_2219) + 1;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    int _2231 = _2227 & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    float _2235 = _2213;
    if (_2007)
    {
        _2211 = _686;
    }
    float _2237 = _2211;
    float _2239 = _2165 * _2203;
    bool _2241 = _2157 >= 0.0;
    float _2243 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2209);
    if (!_2007)
    {
        _1655 = _1213;
    }
    float _2245 = _1655;
    uint _2247 = uint(int(uint(_2207) >> uint(2)));
    uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
    int _2251 = int(_2247) & 3;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[int(_2249)][_2251];
    int _2255 = int(_2247) + 1;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    int _2259 = _2255 & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    float _2263 = _2245;
    if (_2007)
    {
        _2263 = _909;
    }
    float _2265 = _2263;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2269 = _2089 * _2239;
    float _2271 = _2079 * _2239;
    if (_2007)
    {
        _2235 = _686;
    }
    float _2273 = _2235;
    float _2275 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[83].w, _768);
    float _2277 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2267);
    float _2279 = -_2269;
    float _2281 = _2089 + _2279;
    int _2283 = _2207 + 8;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    uint _2287 = uint(int(uint(int(_2285)) >> uint(2)));
    int _2289 = int(_2285) & 3;
    float _2291 = (*spvDescriptorSet0.vp_c9)._m0[int(_2287)][_2289];
    int _2293 = int(_2285) + 1;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    int _2297 = _2293 & 3;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[int(_2295)][_2297];
    float _2301 = -_2271;
    float _2303 = _2079 + _2301;
    float _2305 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2277);
    float _2307 = _2281 * _2281;
    float _2309 = _2273 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2311 = fma(_2305, _2153, _2177);
    float _2313 = fma(_2303, _2303, _2307);
    float _2315 = _2099 * _2239;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2319 = abs(_1401);
    float _2321 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2275);
    int _2323 = abs(_1715);
    float _2325 = -_2317;
    float _2327 = fma(_2309, 2.0, _2325);
    bool _2329 = !_1361;
    int _2331 = _2329 ? 0 : 1;
    float _2333 = -_2315;
    float _2335 = _2099 + _2333;
    if (_2241)
    {
        out.m_53.x = 0.0;
    }
    int _2337 = ~_2319;
    int _2339 = _2337 + 1;
    int _2341 = _2339 + 1;
    float _2343 = fma(_2335, _2335, _2313);
    int _2345 = abs(_2331);
    float _2347 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2349 = int(_2347);
    int _2351 = ~_2323;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    int _2357 = abs(_2115);
    int _2359 = abs(_1435);
    int _2361 = ~_1765;
    int _2363 = _2361 + _1879;
    int _2365 = _2363 + 1;
    int _2367 = ~_2345;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    int _2373 = _2341 * as_type<int>(_2233);
    int _2375 = abs(_1663);
    int _2377 = _784 * _2365;
    int _2379 = _2377 + _1201;
    int _2381 = ~_2357;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    int _2387 = _2371 * as_type<int>(_2225);
    int _2389 = _2387 + _2373;
    float _2391 = fma(_2131, _2131, _2091);
    int _2393 = _2355 * as_type<int>(_2261);
    int _2395 = abs(_2135);
    float _2397 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2399 = int(_2397);
    int _2401 = ~_2359;
    int _2403 = _2401 + 1;
    int _2405 = _2403 + 1;
    int _2407 = _2385 * as_type<int>(_2253);
    int _2409 = _2407 + _2393;
    int _2411 = ~_2375;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    float _2417 = fma(_2099, _2099, _2391);
    int _2419 = _2405 * as_type<int>(_2193);
    int _2421 = _2419 + _2389;
    int _2423 = abs(_1637);
    int _2425 = _2415 * as_type<int>(_2291);
    int _2427 = _2425 + _2409;
    int _2429 = ~_2395;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = rsqrt(_2417);
    int _2437 = abs(_2217);
    int _2439 = abs(_1761);
    int _2441 = _2433 * as_type<int>(_2201);
    int _2443 = _2441 + _2421;
    int _2445 = ~_2437;
    int _2447 = _2445 + 1;
    int _2449 = _2447 + 1;
    float _2451 = float(uint(_2349));
    int _2453 = ~_2423;
    int _2455 = _2453 + 1;
    int _2457 = _2455 + 1;
    int _2459 = _2449 * as_type<int>(_2299);
    int _2461 = _2459 + _2427;
    float _2463 = 1.0 / _2451;
    int _2465 = abs(_2349);
    int _2467 = _2443 * _2457;
    float _2469 = float(uint(_2399));
    float _2471 = in.m_81.x;
    float _2473 = in.m_81.y;
    float _2475 = in.m_81.z;
    float _2477 = float(uint(_2465));
    int _2479 = _1993 * _2423;
    int _2481 = _2479 + _2467;
    int _2483 = abs(_2399);
    float _2485 = 1.0 / _2469;
    bool _2487 = _784 == 0;
    int _2489 = ~_2439;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    if (!_2007)
    {
        _829 = _1213;
    }
    float _2495 = _829;
    float _2497 = _2495;
    if (_2007)
    {
        _2497 = _909;
    }
    float _2499 = _2497;
    float _2501 = 1.0 / _2477;
    float _2503 = float(uint(_2483));
    int _2505 = _2493 * _2461;
    bool _2507 = !_2487;
    int _2509 = _2507 ? _2379 : (-1);
    int _2511 = as_type<int>(_2463) + (-2);
    float _2513 = _2499 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2515 = float(uint(_2481));
    float _2517 = 1.0 / _2503;
    float _2519 = _2125 * (-2.0);
    int _2521 = _2509 * _2439;
    int _2523 = _2521 + _2505;
    int _2525 = as_type<int>(_2485) + (-2);
    float _2527 = as_type<float>(_2511) * _2515;
    float _2529 = fma(_1717, _2519, _1717);
    float _2531 = fma(_2519, _2471, _2471);
    float _2533 = float(uint(_2523));
    float _2535 = trunc(_2527);
    float _2537 = precise::max(_2535, 0.0);
    uint _2539 = uint(_2537);
    int _2541 = abs(_2481);
    int _2543 = as_type<int>(_2501) + (-2);
    float _2545 = as_type<float>(_2525) * _2533;
    int _2547 = ~_2349;
    int _2549 = _2547 + 1;
    float _2551 = sqrt(_2343);
    float _2553 = float(uint(_2541));
    int _2555 = abs(_2523);
    float _2557 = float(uint(_2555));
    float _2559 = trunc(_2545);
    float _2561 = precise::max(_2559, 0.0);
    uint _2563 = uint(_2561);
    float _2565 = as_type<float>(_2543) * _2553;
    int _2567 = as_type<int>(_2517) + (-2);
    int _2569 = _2549 * int(_2539);
    int _2571 = _2569 + _2481;
    int _2573 = ~_2399;
    int _2575 = _2573 + 1;
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2579 = ~_2465;
    int _2581 = _2579 + 1;
    float _2583 = as_type<float>(_2567) * _2557;
    float _2585 = trunc(_2565);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    float _2591 = _2517;
    float _2593 = as_type<float>(_2511);
    if (_2241)
    {
        _2591 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2595 = _2591;
    float _2597 = fma(_2513, -2.0, _2577);
    float _2599 = float(uint(_2571));
    float _2601 = _2165 * _2551;
    int _2603 = as_type<int>(_2595);
    if (_2241)
    {
        float _2605 = _2595 * 5.0;
        _2603 = as_type<int>(_2605);
    }
    int _2607 = _2603;
    int _2609 = ~_2399;
    int _2611 = _2609 + 1;
    float _2613 = trunc(_2583);
    float _2615 = precise::max(_2613, 0.0);
    uint _2617 = uint(_2615);
    int _2619 = _2575 * int(_2563);
    int _2621 = _2619 + _2523;
    float _2623 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2597);
    if (_2241)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8537 = as_type<float>(_2607);
        out.gl_Position.z = _8537;
    }
    int _2625 = _2581 * int(_2589);
    int _2627 = _2625 + _2541;
    float _2629 = fma(_1709, _2005, _2183);
    int _2631 = ~_2483;
    int _2633 = _2631 + 1;
    float _2635 = as_type<float>(_2511) * _2599;
    float _2637 = float(uint(_2621));
    float _2639 = fma(_1739, _1949, _2629);
    float _2641 = float(uint(_2627));
    float _2643 = _2639;
    if (_2033)
    {
        _2593 = _909;
    }
    float _2645 = _2593;
    float _2647 = as_type<float>(_2525) * _2637;
    float _2649 = as_type<float>(_2543) * _2641;
    float _2651 = _2645;
    if (!_2033)
    {
        _2651 = _686;
    }
    float _2653 = _2651;
    float _2655 = _714 * _2601;
    int _2657 = _2633 * int(_2617);
    int _2659 = _2657 + _2555;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2663 = _2653 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2665 = _2655 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2667 = float(uint(_2659));
    float _2669 = trunc(_2647);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    float _2675 = fma(_2663, -2.0, _2661);
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2679 = _2665 * _2435;
    float _2681 = as_type<float>(_2567) * _2667;
    float _2683 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2675);
    float _2685 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2677);
    float _2687 = _2131 * _2679;
    float _2689 = trunc(_2635);
    float _2691 = precise::max(_2689, 0.0);
    uint _2693 = uint(_2691);
    float _2695 = _2079 * _2679;
    float _2697 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2639);
    float _2699 = -_2687;
    float _2701 = _2131 + _2699;
    float _2703 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2685);
    int _2705 = ~_2483;
    int _2707 = _2705 + 1;
    float _2709 = -_2695;
    float _2711 = _2079 + _2709;
    float _2713 = _2701 * _2701;
    float _2715 = trunc(_2681);
    float _2717 = precise::max(_2715, 0.0);
    uint _2719 = uint(_2717);
    float _2721 = -_2683;
    float _2723 = fma(_2703, _2081, _2721);
    int _2725 = ~_2349;
    int _2727 = _2725 + 1;
    float _2729 = fma(_2711, _2711, _2713);
    int _2731 = int(_2563) + int(_2673);
    out.m_83.x = _2697;
    float _2733 = _2099 * _2679;
    float _2735 = trunc(_2649);
    float _2737 = precise::max(_2735, 0.0);
    uint _2739 = uint(_2737);
    int _2741 = int(_2539) + int(_2693);
    int _2743 = ~_2465;
    int _2745 = _2743 + 1;
    int _2747 = _2727 * _2741;
    int _2749 = _2747 + _2481;
    int _2751 = int(_2617) + int(_2719);
    bool _2753 = uint(_2749) >= uint(_2349);
    int _2755 = _2707 * _2751;
    int _2757 = _2755 + _2555;
    bool _2759 = !_2753;
    int _2761 = _2759 ? 0 : (-1);
    int _2763 = int(_2589) + int(_2739);
    float _2765 = -_2733;
    float _2767 = _2099 + _2765;
    int _2769 = _2611 * _2731;
    int _2771 = _2769 + _2523;
    bool _2773 = uint(_2757) >= uint(_2483);
    int _2775 = _2745 * _2763;
    int _2777 = _2775 + _2541;
    float _2779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2781 = uint(_2771) >= uint(_2399);
    float _2783 = fma(_2767, _2767, _2729);
    int _2785 = ~_2741;
    int _2787 = _2785 + _2761;
    int _2789 = _2787 + 1;
    bool _2791 = uint(_2777) >= uint(_2465);
    bool _2793 = !_2781;
    int _2795 = _2793 ? 0 : (-1);
    int _2797 = _2349 * _2789;
    int _2799 = _2797 + _2481;
    bool _2801 = _2349 == 0;
    float _2803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2805 = ~_2731;
    int _2807 = _2805 + _2795;
    int _2809 = _2807 + 1;
    bool _2811 = !_2791;
    int _2813 = _2811 ? 0 : (-1);
    bool _2815 = _2349 == 0;
    int _2817 = _2399 * _2809;
    int _2819 = _2817 + _2523;
    int _2821 = _2481 ^ _2349;
    bool _2823 = !_2801;
    int _2825 = _2823 ? _2799 : (-1);
    bool _2827 = !_2773;
    int _2829 = _2827 ? 0 : (-1);
    float _2831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2833 = _2399 == 0;
    bool _2835 = _2399 == 0;
    float _2837 = _2803 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2839 = _2523 ^ _2399;
    float _2841 = _2779 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2843 = float(_2825);
    float _2845 = fma(_2837, _1337, -0.5);
    float _2847 = fma(_2841, _1299, -0.5);
    uint _2849 = uint(int(uint(_2821) >> uint(31)));
    float _2851 = fma(_2841, _2843, _1599);
    uint _2853 = uint(int(uint(_2839) >> uint(31)));
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2857 = ~_2813;
    int _2859 = _2763 + _2857;
    int _2861 = _2859 + 1;
    int _2863 = ~int(_2849);
    int _2865 = _2863 + 1;
    float _2867 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2855);
    int _2869 = ~_2829;
    int _2871 = _2751 + _2869;
    int _2873 = _2871 + 1;
    float _2875 = -_166;
    float _2877 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2327);
    int _2879 = ~int(_2853);
    int _2881 = _2879 + 1;
    float _2883 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2867);
    bool _2885 = !_2833;
    int _2887 = _2885 ? _2819 : (-1);
    float _2889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2891 = _2861 ^ _2865;
    int _2893 = _2873 ^ _2881;
    float _2895 = float(_2887);
    int _2897 = ~_2865;
    int _2899 = _2897 + _2891;
    int _2901 = _2899 + 1;
    int _2903 = ~_2881;
    int _2905 = _2903 + _2893;
    int _2907 = _2905 + 1;
    float _2909 = fma(_2883, _2847, _2851);
    float _2911 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2913 = fma(_2837, _2895, _2877);
    bool _2915 = !_2815;
    int _2917 = _2915 ? _2901 : (-1);
    float _2919 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2921 = log2(_2919);
    float _2923 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1549);
    float _2925 = float(_2917);
    float _2927 = fma(_1341, _2911, -0.5);
    bool _2929 = !_2835;
    int _2931 = _2929 ? _2907 : (-1);
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2935 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2937 = -_2923;
    float _2939 = fma(_2911, _2925, _2937);
    float _2941 = sqrt(_2783);
    float _2943 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2933);
    float _2945 = float(_2931);
    float _2947 = fma(_1365, _2935, -0.5);
    float _2949 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2243);
    float _2951 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2943);
    bool _2953 = !_1845;
    int _2955 = _2953 ? 0 : 1;
    float _2957 = _2921 * _166;
    float _2959 = -_2623;
    float _2961 = fma(_2935, _2945, _2959);
    float _2963 = fma(_2951, _2927, _2939);
    float _2965 = fma(_2949, _2845, _2913);
    float _2967 = _2723 + 0.5;
    float _2969 = fma(_2321, _2947, _2961);
    float _2971 = _2963 + 0.5;
    float _2973 = exp2(_2957);
    float _2975 = _2435 * _2941;
    float _2977 = _2965 + 0.5;
    bool _2979 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2981 = isnan(1.0);
    bool _2983 = _2979 || _2981;
    bool _2985 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2987 = _2983 || _2985;
    float _2989 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2991 = 1.0 + _2989;
    float _2993 = _2311 + 0.5;
    float _2995 = _2909 + 0.5;
    float _2997 = _2969 + 0.5;
    float _2999 = _2655 * _2975;
    bool _3001 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3003 = isnan(0.0);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3009 = _3005 || _3007;
    float _3011 = 1.0 / _2991;
    int _3013 = abs(_2955);
    out.m_85.x = _2993;
    out.m_85.y = _2967;
    float _3015 = _686 + (-0.5);
    float _3017 = -_2973;
    float _3019 = _3017 + 1.0;
    out.m_87.x = _2995;
    out.m_87.y = _2971;
    out.m_87.z = _2977;
    out.m_87.w = _2997;
    out.m_89.x = _2999;
    float _3021 = _3009 ? _3019 : 0.0;
    bool _3023 = !_1849;
    int _3025 = _3023 ? 0 : 1;
    float _3027 = _3021;
    float _3029 = _2713;
    float _3031 = _2687;
    if (_2241)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3033 = -_2687;
    float _3035 = _1491 + _3033;
    float _3037 = float(_1785);
    float _3039 = -_2695;
    float _3041 = _1593 + _3039;
    float _3043 = float(_3013);
    float _3045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3047 = _3035 + _3045;
    float _3049 = fma(_3015, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2531);
    float _3051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3053 = _3041 + _3051;
    float _3055 = _909 + (-0.5);
    float _3057 = _3047 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3059 = _3043 * _3037;
    int _3061 = abs(_3025);
    if (_2987)
    {
        float _3063 = _3021 * _3011;
        _168 = _3063;
    }
    float _3065 = _168;
    float _3067 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3057);
    float _3069 = _3059 * (-2.0);
    float _3071 = float(_1891);
    float _3073 = -_2733;
    float _3075 = _2085 + _3073;
    float _3077 = float(_3061);
    float _3079 = fma(_3069, _2473, _2473);
    float _3081 = fma(_1755, _3069, _1755);
    float _3083 = _686 + _1213;
    float _3085 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3087 = _3075 + _3085;
    float _3089 = fma(_3055, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3079);
    float _3091 = _3077 * _3071;
    float _3093 = _3083 + (-1.0);
    float _3095 = fma(_3081, _3065, _3089);
    float _3097 = _3091 * (-2.0);
    float _3099 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3067);
    float _3101 = fma(_3093, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3103 = _1213 + (-0.5);
    float _3105 = fma(_3097, _2475, _2475);
    float _3107 = fma(_2529, _3065, _3049);
    bool _3109 = _3099 >= 0.0;
    float _3111 = fma(_3101, _3097, _3101);
    float _3113 = fma(_3103, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3105);
    float _3115 = _3107 * 0.15915493667125701904296875;
    float _3117 = _3095 * 0.15915493667125701904296875;
    float _3119 = fma(_3111, _3065, _3113);
    float _3121 = _3115 * 6.283185482025146484375;
    float _3123 = sin(_3121);
    float _3125 = _3119 * 0.15915493667125701904296875;
    float _3127 = _3095;
    if (_3109)
    {
        _3127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3129 = _3127;
    int _3131 = as_type<int>(_3129);
    if (_3109)
    {
        out.m_53.x = 0.0;
    }
    float _3133 = _3115 * 6.283185482025146484375;
    float _3135 = cos(_3133);
    if (_3109)
    {
        float _3137 = _3129 * 5.0;
        _3131 = as_type<int>(_3137);
    }
    int _3139 = _3131;
    float _3141 = _3117 * 6.283185482025146484375;
    float _3143 = sin(_3141);
    if (_3109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9337 = as_type<float>(_3139);
        out.gl_Position.z = _9337;
    }
    float _3145 = _3117 * 6.283185482025146484375;
    float _3147 = cos(_3145);
    float _3149 = _3125 * 6.283185482025146484375;
    float _3151 = sin(_3149);
    if (_3109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3153 = in.m_91.x;
    float _3155 = in.m_91.y;
    float _3157 = in.m_91.z;
    float _3159 = _3125 * 6.283185482025146484375;
    float _3161 = cos(_3159);
    float _3163 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3165 = _2601 * _2975;
    float _3167 = _3123 * _3143;
    float _3169 = _3135 * _3147;
    float _3171 = _3135 * _3143;
    float _3173 = _3163 * _3165;
    float _3175 = _3123 * _3147;
    float _3177 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3179 = fma(_3151, _3169, _3167);
    float _3181 = fma(_3151, _3167, _3169);
    float _3183 = -_3171;
    float _3185 = fma(_3151, _3175, _3183);
    float _3187 = _3177 * _3165;
    float _3189 = _3135 * _3161;
    float _3191 = _3147 * _3161;
    float _3193 = _3123 * _3161;
    float _3195 = _3143 * _3161;
    float _3197 = -_3175;
    float _3199 = fma(_3151, _3171, _3197);
    float _3201 = _3179 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3203 = _3179 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3155);
    float _3207 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3157);
    float _3209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3153);
    float _3211 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3203);
    float _3213 = _3173 * _3205;
    float _3215 = _3187 * _3207;
    float _3217 = _3179 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3219 = _2999 * _3209;
    float _3221 = _3189 * _3213;
    float _3223 = -_3213;
    float _3225 = _3151 * _3223;
    float _3227 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3217);
    float _3229 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3201);
    float _3231 = fma(_3179, _3219, _3221);
    float _3233 = fma(_3191, _3219, _3225);
    float _3235 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3237 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3239 = _3193 * _3213;
    float _3241 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3243 = fma(_3199, _3215, _3231);
    float _3245 = fma(_3195, _3215, _3233);
    float _3247 = fma(_3185, _3219, _3239);
    float _3249 = -_3151;
    float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3241);
    float _3253 = _3243 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3255 = _3243 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3257 = fma(_3181, _3215, _3247);
    float _3259 = -_3151;
    float _3261 = fma(_3259, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3237);
    float _3263 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3253);
    float _3265 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3255);
    float _3267 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3211);
    float _3269 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3227);
    float _3271 = fma(_3257, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3263);
    float _3273 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3229);
    float _3275 = -_3151;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3235);
    float _3279 = _3199 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3281 = fma(_3257, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3265);
    float _3283 = _3271 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3285 = in.m_93.x;
    float _3287 = in.m_93.y;
    float _3289 = in.m_93.z;
    float _3291 = fma(_3195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3279);
    bool _3293 = _3155 != 0.0;
    bool _3295 = isnan(_3155);
    bool _3297 = _3293 || _3295;
    bool _3299 = isnan(0.0);
    bool _3301 = _3297 || _3299;
    float _3303 = _3281 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3305 = _2085 + _3283;
    float _3307 = _3199 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3309 = _3199 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3311 = _3153 == 0.0;
    bool _3313 = !_3301;
    bool _3315 = _3311 && _3313;
    float _3317 = _1593 + _3303;
    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3321 = _3305 + _3319;
    float _3323 = fma(_3193, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3277);
    bool _3325 = _3157 == 0.0;
    bool _3327 = _3325 && _3315;
    float _3329 = fma(_3195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3307);
    float _3331 = fma(_3195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3309);
    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3335 = _3317 + _3333;
    float _3337 = _3321 * _3321;
    float _3339 = in.m_95.x;
    float _3341 = in.m_95.y;
    float _3343 = in.m_95.z;
    float _3345 = in.m_95.w;
    float _3347 = fma(_3193, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3261);
    float _3349 = fma(_3193, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3251);
    float _3351 = fma(_3335, _3335, _3337);
    float _3353 = fma(_3181, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3291);
    float _3355 = _3243 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3357 = fma(_3181, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3331);
    float _3359 = sqrt(_3351);
    float _3361 = _3251;
    float _3363 = _3193;
    float _3365 = _3273;
    if (_3327)
    {
        _2643 = _3285;
    }
    float _3367 = _2643;
    float _3369 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3355);
    float _3371 = _3367;
    if (_3327)
    {
        _3027 = _3287;
    }
    float _3373 = _3027;
    float _3375 = _3373;
    if (_3327)
    {
        _3029 = _3289;
    }
    float _3377 = _3029;
    float _3379 = fma(_3257, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3369);
    float _3381 = _3377;
    if (_3327)
    {
        _1657 = _3367;
    }
    float _3383 = _1657;
    float _3385 = _3383;
    if (_3327)
    {
        _3361 = _3373;
    }
    float _3387 = _3361;
    float _3389 = _3387;
    if (_3327)
    {
        _3363 = _3377;
    }
    float _3391 = _3363;
    float _3393 = _3391;
    if (!_3327)
    {
        _3371 = _3285;
    }
    float _3395 = _3371;
    if (!_3327)
    {
        _3375 = _3287;
    }
    float _3397 = _3375;
    float _3399 = fma(_3181, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3329);
    if (!_3327)
    {
        _3381 = _3289;
    }
    float _3401 = _3381;
    if (!_3327)
    {
        float _3403 = fma(_3153, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3395);
        _3385 = _3403;
    }
    float _3405 = _3385;
    float _3407 = _3323 * _3341;
    if (!_3327)
    {
        float _3409 = fma(_3155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3397);
        _3389 = _3409;
    }
    float _3411 = _3389;
    float _3413 = _3343 * _3395;
    float _3415 = _3413;
    if (!_3327)
    {
        float _3417 = fma(_3157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3401);
        _3393 = _3417;
    }
    float _3419 = _3393;
    bool _3421 = _3359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3423 = _3347 * _3341;
    float _3425 = fma(_3273, _3339, _3407);
    float _3427 = _3339 * _3397;
    float _3429 = _3349 * _3341;
    float _3431 = fma(_3267, _3339, _3423);
    float _3433 = _3379 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3435 = -_3413;
    float _3437 = fma(_3339, _3401, _3435);
    float _3439 = -_3427;
    float _3441 = fma(_3341, _3395, _3439);
    float _3443 = fma(_3269, _3339, _3429);
    float _3445 = _1491 + _3433;
    float _3447 = _3341 * _3401;
    float _3449 = _3433;
    float _3451 = _3427;
    if (!_3421)
    {
        _3449 = _3317;
    }
    float _3453 = _3449;
    float _3455 = _3453;
    if (!_3421)
    {
        _3451 = _3305;
    }
    float _3457 = _3451;
    float _3459 = _3457;
    if (!_3421)
    {
        _3415 = _3445;
    }
    float _3461 = _3415;
    bool _3463 = !_3421;
    float _3465 = _3461;
    if (!_3463)
    {
        float _3467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3469 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3471 = _3359 + _3469;
        float _3473 = _3445 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3475 = rsqrt(_3351);
        float _3477 = _3471 * _3467;
        float _3479 = _3477 * 0.15915493667125701904296875;
        float _3481 = _3479 * 6.283185482025146484375;
        float _3483 = cos(_3481);
        float _3485 = _3479 * 6.283185482025146484375;
        float _3487 = sin(_3485);
        float _3489 = _3483 + (-1.0);
        float _3491 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3493 = fma(_3487, _3473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3495 = fma(_3445, _3483, _3491);
        float _3497 = _3475 * _3493;
        float _3499 = fma(_3335, _3497, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3501 = fma(_3321, _3497, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3465 = _3495;
        _3455 = _3499;
        _3459 = _3501;
    }
    float _3503 = _3465;
    float _3505 = _3455;
    float _3507 = _3459;
    float _3509 = -_2269;
    float _3511 = _3509 + _3503;
    float _3513 = -_2271;
    float _3515 = _3513 + _3505;
    float _3517 = -_3447;
    float _3519 = fma(_3343, _3397, _3517);
    float _3521 = _3349 * _3411;
    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3525 = _3511 + _3523;
    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3529 = _3515 + _3527;
    float _3531 = _3519 * _3345;
    float _3533 = _3441 * _3345;
    float _3535 = _3525 * _3525;
    float _3537 = _3437 * _3345;
    float _3539 = _3347 * _3411;
    float _3541 = fma(_3353, _3343, _3425);
    float _3543 = fma(_3529, _3529, _3535);
    float _3545 = -_2315;
    float _3547 = _3545 + _3507;
    float _3549 = _3323 * _3411;
    float _3551 = _3537 * _3323;
    float _3553 = _3537 * _3347;
    float _3555 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3557 = _3547 + _3555;
    float _3559 = _3537 * _3349;
    float _3561 = fma(_3273, _3405, _3549);
    float _3563 = fma(_3267, _3405, _3539);
    float _3565 = fma(_3557, _3557, _3543);
    float _3567 = fma(_3269, _3405, _3521);
    float _3569 = fma(_3531, _3273, _3551);
    float _3571 = fma(_3531, _3267, _3553);
    float _3573 = fma(_3531, _3269, _3559);
    float _3575 = fma(_3399, _3343, _3431);
    float _3577 = sqrt(_3565);
    float _3579 = fma(_3399, _3419, _3563);
    float _3581 = fma(_3357, _3343, _3443);
    float _3583 = fma(_3353, _3419, _3561);
    float _3585 = fma(_3533, _3353, _3569);
    float _3587 = fma(_3533, _3399, _3571);
    float _3589 = fma(_3533, _3357, _3573);
    float _3591 = fma(_3357, _3419, _3567);
    out.m_97.x = _3541;
    out.m_97.y = _3575;
    out.m_97.z = _3581;
    float _3593 = -_2271;
    float _3595 = _1593 + _3593;
    float _3597 = -_2269;
    float _3599 = _3597 + _1491;
    out.m_99.x = _3585;
    out.m_99.y = _3587;
    out.m_99.z = _3589;
    float _3601 = -_2315;
    float _3603 = _2085 + _3601;
    out.m_101.x = _3583;
    out.m_101.y = _3579;
    out.m_101.z = _3591;
    bool _3605 = _3577 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3607 = isnan(_3577);
    bool _3609 = _3605 || _3607;
    bool _3611 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3613 = _3609 || _3611;
    if (!_3613)
    {
        _3365 = 1.0;
    }
    float _3615 = _3365;
    bool _3617 = !_3613;
    float _3619 = _3615;
    if (!_3617)
    {
        bool _3621 = _3577 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3623 = isnan(_3577);
        bool _3625 = _3621 || _3623;
        bool _3627 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3629 = _3625 || _3627;
        if (!_3629)
        {
            float _3631 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3633 = _3577 + _3631;
            float _3635 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3637 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3635;
            float _3639 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3641 = _3639 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3643 = 1.0 / _3637;
            float _3645 = _3633 * _3643;
            float _3647 = fma(_3645, _3641, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3619 = _3647;
            _3649 = true;
        }
        else
        {
            bool _3651 = _3577 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3653 = isnan(_3577);
            bool _3655 = _3651 || _3653;
            bool _3657 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3659 = _3655 || _3657;
            if (!_3659)
            {
                float _3661 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3663 = _3577 + _3661;
                float _3665 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3667 = _3665 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3669 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3671 = _3669 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3673 = 1.0 / _3667;
                float _3675 = _3663 * _3673;
                float _3677 = fma(_3675, _3671, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3619 = _3677;
                _3649 = true;
            }
            else
            {
                _3619 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3649 = false;
    float _3679 = _3619;
    float _3681 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3683 = _3515 + _3681;
    float _3685 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3687 = _3547 + _3685;
    float _3689 = fma(_3683, _3679, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3691 = fma(_3687, _3679, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3693 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _3695 = _3689 + _3693;
    float _3697 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _3699 = _3691 + _3697;
    float _3701 = fma(_3695, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _3703 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _10313 = float2(_3701, _3703);
    float _3705 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_10313, float2(0.0), isnan(_10313)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_10313, float2(0.0), isnan(_10313)), level(0.0)).x;
    float _3707 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3709 = _3511 + _3707;
    float _3711 = -_2695;
    float _3713 = _3711 + _3595;
    float _3715 = -_2733;
    float _3717 = _3715 + _3603;
    float _3719 = -_3595;
    float _3721 = _3719 + _3689;
    float _3723 = fma(_3709, _3679, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3725 = -_3603;
    float _3727 = _3725 + _3691;
    float _3729 = fma(_3705, 100.0, _3599);
    float _3731 = -_3599;
    float _3733 = _3731 + _3723;
    float _3735 = fma(_3705, 100.0, _3723);
    float _3737 = -_2687;
    float _3739 = _3737 + _3729;
    float _3741 = _3733 * _3733;
    float _3743 = _3739 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3745 = fma(_3721, _3721, _3741);
    float _3747 = fma(_3713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3743);
    float _3749 = fma(_3727, _3727, _3745);
    float _3751 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3747);
    float _3753 = sqrt(_3749);
    float _3755 = _3751 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3757 = _3739 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3759 = 1.0 / _3755;
    float _3761 = fma(_3713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3757);
    float _3763 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3761);
    bool _3765 = _3753 > 0.0;
    float _3767 = _3763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3769 = _3767 + _3755;
    bool _3771 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3773 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3775 = _3771 || _3773;
    bool _3777 = isnan(0.5);
    bool _3779 = _3775 || _3777;
    float _3781 = _3769 * _3759;
    float _3783 = _3781 * 0.5;
    bool _3785 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3789 = _3785 || _3787;
    bool _3791 = isnan(0.5);
    bool _3793 = _3789 || _3791;
    float _3795 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3797 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3795);
    float _3799 = _3705;
    float _3801 = _3723;
    float _3803 = _3689;
    float _3805 = _3691;
    float _3807 = _3739;
    float _3809 = _3717;
    if (!_3765)
    {
        _3799 = _3691;
    }
    float _3811 = _3799;
    float _3813 = _3811;
    if (!_3765)
    {
        _3801 = _3735;
    }
    float _3815 = _3801;
    float _3817 = 1.0 / _3797;
    bool _3819 = !_3765;
    float _3821 = _3815;
    float _3823 = _3815;
    float _3825 = _3817;
    if (!_3819)
    {
        float _3827 = _232 * _232;
        float _3829 = rsqrt(_3749);
        float _3831 = fma(_230, _230, _3827);
        float _3833 = fma(_234, _234, _3831);
        float _3835 = sqrt(_3833);
        float _3837 = _3721 * _3829;
        float _3839 = _3733 * _3829;
        float _3841 = _3727 * _3829;
        bool _3843 = _3835 > 0.0;
        float _3845 = _3829;
        if (!_3843)
        {
            _3821 = _3735;
        }
        float _3847 = _3821;
        _3823 = _3847;
        if (!_3843)
        {
            _3845 = _3691;
        }
        float _3849 = _3845;
        bool _3851 = !_3843;
        _3813 = _3849;
        if (!_3851)
        {
            float _3853 = rsqrt(_3833);
            float _3855 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3857 = _232 * _3853;
            float _3859 = _230 * _3853;
            float _3861 = _3839 * _3857;
            float _3863 = _234 * _3853;
            float _3865 = fma(_3837, _3859, _3861);
            float _3867 = _3855 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3869 = fma(_3841, _3863, _3865);
            float _3871 = _3869 * _3867;
            float _3873 = fma(_230, _3871, _3689);
            float _3875 = fma(_232, _3871, _3735);
            float _3877 = fma(_234, _3871, _3691);
            _3823 = _3875;
            _3803 = _3873;
            _3813 = _3877;
        }
    }
    float _3879 = _3823;
    float _3881 = _3803;
    float _3883 = _3813;
    float _3885 = -_2687;
    float _3887 = _3885 + _3879;
    float _3889 = -_2695;
    float _3891 = _3889 + _3881;
    float _3893 = -_2733;
    float _3895 = _3893 + _3883;
    float _3897 = _3887;
    float _3899 = _3891;
    float _3901 = _3895;
    float _3903 = _3881;
    if (_3793)
    {
        _3031 = 1.0;
    }
    float _3905 = _3031;
    float _3907 = _3905;
    if (!_3779)
    {
        float _3909 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3911 = _3739 + _3909;
        float _3913 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3915 = _3713 + _3913;
        float _3917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3919 = -_3603;
        float _3921 = _3919 + _3883;
        float _3923 = _3911 * _3911;
        float _3925 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3927 = _3717 + _3925;
        float _3929 = -_3595;
        float _3931 = _3929 + _3881;
        float _3933 = -_3729;
        float _3935 = _3933 + _3879;
        float _3937 = fma(_3915, _3915, _3923);
        float _3939 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3941 = fma(_3927, _3927, _3937);
        float _3943 = sqrt(_3941);
        float _3945 = 1.0 / _2975;
        float _3947 = _3939 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3949 = precise::min(_3943, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3951 = _3949 * _3917;
        float _3953 = _3951 * _3945;
        float _3955 = _3947 * _3953;
        float _3957 = _3921 * _3953;
        float _3959 = fma(_3931, _3955, _3713);
        float _3961 = fma(_3935, _3955, _3739);
        float _3963 = fma(_3947, _3957, _3717);
        _3897 = _3961;
        _3899 = _3959;
        _3901 = _3963;
        _3903 = _3931;
    }
    float _3965 = _3897;
    float _3967 = _3899;
    float _3969 = _3901;
    float _3971 = _3903;
    float _3973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3975 = _3817 * _3973;
    float _3977 = _3971;
    if (!_3793)
    {
        float _3979 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3981 = _3979 * 0.15915493667125701904296875;
        float _3983 = _3981 * 6.283185482025146484375;
        float _3985 = cos(_3983);
        float _3987 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3989 = _3987 * 0.15915493667125701904296875;
        float _3991 = _3981 * 6.283185482025146484375;
        float _3993 = sin(_3991);
        float _3995 = 1.0 / _3985;
        float _3997 = _3989 * 6.283185482025146484375;
        float _3999 = cos(_3997);
        float _4001 = _3993 * _3995;
        float _4003 = _3989 * 6.283185482025146484375;
        float _4005 = sin(_4003);
        float _4007 = _3999 * _4001;
        float _4009 = 1.0 / _4007;
        float _4011 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4013 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4011;
        float _4015 = 1.0 / _4013;
        float _4017 = _4005 * _4009;
        float _4019 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4021 = fma(_3975, _4017, _4019);
        float _4023 = _4021 * _4015;
        float _4025 = precise::clamp(_4023, 0.0, 1.0);
        _242 = _3989;
        _3907 = _4025;
    }
    float _4027 = _242;
    float _4029 = _3907;
    float _4031 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4033 = _3965 + _4031;
    float _4035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4037 = _3967 + _4035;
    float _4039 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4041 = _3969 + _4039;
    float _4043 = _4033 * _4033;
    float _4045 = fma(_4037, _4037, _4043);
    float _4047 = fma(_4041, _4041, _4045);
    float _4049 = rsqrt(_4047);
    float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4053 = _4037 * _4051;
    float _4055 = _4041 * _4051;
    float _4057 = _4053 * _4053;
    float _4059 = _4055 * _4055;
    float _4061 = _4057 + _4059;
    float _4063 = sqrt(_4061);
    bool _4065 = _4063 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4069 = _4063 + _4067;
    float _4071 = _4041;
    float _4073 = _4027;
    float _4075 = _4069;
    float _4077 = _4033;
    if (_4065)
    {
        float _4079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4071 = _4079;
    }
    float _4081 = _4071;
    if (_4065)
    {
        float _4083 = rsqrt(_4061);
        _4073 = _4083;
    }
    float _4085 = _4073;
    float _4087 = _4085;
    if (_4065)
    {
        float _4089 = _4069 * _4081;
        _4075 = _4089;
    }
    float _4091 = _4075;
    if (_4065)
    {
        float _4093 = _4091 * 0.15915493667125701904296875;
        _3977 = _4093;
    }
    float _4095 = _3977;
    float _4097 = _4081;
    if (_4065)
    {
        float _4099 = _4095 * 6.283185482025146484375;
        float _4101 = cos(_4099);
        _4097 = _4101;
    }
    float _4103 = _4097;
    float _4105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4107 = precise::max(0.0, _4105);
    float _4109 = _4049;
    float _4111 = _4107;
    if (_4065)
    {
        float _4113 = _4095 * 6.283185482025146484375;
        float _4115 = sin(_4113);
        _4109 = _4115;
    }
    float _4117 = _4109;
    float _4119 = -_4051;
    float _4121 = -_4107;
    float _4123 = fma(_4033, _4119, _4121);
    float _4125 = _4123;
    if (_4065)
    {
        float _4127 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4111 = _4127;
    }
    float _4129 = _4111;
    float _4131 = _4129;
    if (_4065)
    {
        float _4133 = _4103 + (-1.0);
        _4077 = _4133;
    }
    float _4135 = _4077;
    float _4137 = _4135;
    float _4139 = _4117;
    if (_4065)
    {
        float _4141 = fma(_4117, _4129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3825 = _4141;
    }
    float _4143 = _3825;
    if (_4065)
    {
        float _4145 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4131 = _4145;
    }
    float _4147 = _4131;
    if (!_4065)
    {
        _4137 = _4057;
    }
    float _4149 = _4137;
    float _4151 = _4149;
    if (_4065)
    {
        float _4153 = _4085 * _4143;
        _3805 = _4153;
    }
    float _4155 = _3805;
    if (!_4065)
    {
        _4087 = _4053;
    }
    float _4157 = _4087;
    float _4159 = _4157;
    if (_4065)
    {
        float _4161 = fma(_4123, _4103, _4147);
        _4125 = _4161;
    }
    float _4163 = _4125;
    float _4165 = sqrt(_4047);
    float _4167 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4065)
    {
        float _4169 = _4053 * _4155;
        _4159 = _4169;
    }
    float _4171 = _4159;
    if (!_4065)
    {
        _4139 = _4055;
    }
    float _4173 = _4139;
    float _4175 = _4173;
    if (_4065)
    {
        float _4177 = _4055 * _4155;
        _4175 = _4177;
    }
    float _4179 = _4175;
    float _4181 = fma(_3713, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4065)
    {
        float _4183 = _4171 * _4171;
        _4151 = _4183;
    }
    float _4185 = _4151;
    if (!_4065)
    {
        _4167 = _4059;
    }
    float _4187 = _4167;
    float _4189 = _4187;
    if (_4065)
    {
        float _4191 = _4179 * _4179;
        _4189 = _4191;
    }
    float _4193 = _4189;
    float _4195 = fma(_4163, _4163, _4185);
    float _4197 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4199 = floor(_4181);
    float _4201 = _4195 + _4193;
    float _4203 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4197);
    float _4205 = fma(_3717, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4207 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4209 = fma(_4165, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4207);
    float _4211 = precise::clamp(_4209, 0.0, 1.0);
    float _4213 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4203);
    float _4215 = rsqrt(_4201);
    float _4217 = -_4211;
    float _4219 = _4217 + 1.0;
    float _4221 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4223 = _4213 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4227 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4221);
    float _4229 = _4223 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4231 = abs(_4219);
    float _4233 = log2(_4231);
    float _4235 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4237 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4227);
    float _4239 = -_4229;
    float _4241 = fma(_4239, _4225, 1.0);
    float _4243 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4245 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4235);
    float _4247 = _4215 * _4171;
    float _4249 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4243);
    float _4251 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4245);
    float _4253 = _4215 * _4163;
    float _4255 = _4215 * _4179;
    float _4257 = _4247 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4259 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4249);
    float _4261 = _4251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4263 = floor(_4205);
    float _4265 = -_4257;
    float _4267 = fma(_4253, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4265);
    float _4269 = _4259 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4271 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4273 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4275 = -_4255;
    float _4277 = fma(_4275, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4267);
    float _4279 = _4237 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4281 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4271);
    float _4283 = -_4199;
    float _4285 = _4181 + _4283;
    float _4287 = fma(_4277, -0.5, 0.5);
    float _4289 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4281);
    float _4291 = exp2(_4273);
    float _4293 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4295 = fma(_4277, 0.5, 0.5);
    float _4297 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4289);
    float _4299 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4301 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4293);
    float _4303 = -_4263;
    float _4305 = _4205 + _4303;
    float _4307 = _4253 + 1.0;
    float _4309 = log2(_4241);
    float _4311 = fma(_4295, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4313 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4299);
    float _4315 = fma(_4295, _4311, -0.212114393711090087890625);
    float _4317 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4313);
    float _4319 = 1.0 / _4297;
    float _4321 = -_4253;
    float _4323 = fma(_4291, _4307, _4321);
    float _4325 = sqrt(_4287);
    float _4327 = _4309 * 0.693147182464599609375;
    float2 _11295 = float2(_4285, _4305);
    float _4329 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11295, float2(0.0), isnan(_11295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11295, float2(0.0), isnan(_11295)), level(0.0)).x;
    float _4331 = fma(_4295, _4315, 1.570728778839111328125);
    float _4333 = _4327 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4335 = fma(_4323, 0.5, 0.5);
    float _4337 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4301);
    float _4339 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4337);
    float _4341 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4317);
    float _4343 = _4325 * 0.636619746685028076171875;
    float _4345 = _4339 * _4319;
    float _4347 = _4341 * _4319;
    float _4349 = -_4331;
    float _4351 = fma(_4343, _4349, 1.0);
    float _4353 = fma(_4345, 0.5, 0.5);
    float _4355 = fma(_4347, -0.5, 0.5);
    float3 _11347 = float3(_4353, _4355, _4333);
    float _4357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11347, float3(0.0), isnan(_11347)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11347, float3(0.0), isnan(_11347)), level(0.0)).x;
    float3 _11358 = float3(_4353, _4355, _4333);
    float4 _4360 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11358, float3(0.0), isnan(_11358)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11358, float3(0.0), isnan(_11358)), level(0.0)).xyzw;
    float _4362 = _4360.x;
    float _4364 = _4360.y;
    float _4366 = _4360.z;
    float _4368 = _4360.w;
    float2 _11374 = float2(_4351, _4335);
    float3 _4372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11374, float2(0.0), isnan(_11374)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11374, float2(0.0), isnan(_11374)), level(0.0)).xyz;
    float _4374 = _4372.x;
    float _4376 = _4372.y;
    float _4378 = _4372.z;
    float _4380 = abs(_3975);
    float _4382 = log2(_4380);
    float _4384 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4386 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_103.x = _3713;
    out.m_103.y = _3739;
    out.m_103.z = _3717;
    float _4388 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4384);
    bool _4390 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4392 = isnan(_4165);
    bool _4394 = _4390 || _4392;
    bool _4396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4398 = _4394 || _4396;
    bool _4400 = _3975 <= 8000.0;
    bool _4402 = isnan(_3975);
    bool _4404 = _4400 || _4402;
    bool _4406 = isnan(8000.0);
    bool _4408 = _4404 || _4406;
    float _4410 = float(_4408);
    float _4412 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4388);
    float _4414 = exp2(_4386);
    out.m_105.x = _3967;
    out.m_105.y = _3965;
    out.m_105.z = _3969;
    float _4416 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4412);
    float _4418 = _4297 * 0.5;
    float _4420 = _4382 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4422 = in.m_77.x;
    float _4424 = _4339 + _4297;
    float _4426 = _4339;
    if (!_4398)
    {
        _3807 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4428 = _3807;
    out.gl_Position.x = _4339;
    out.gl_Position.y = _4341;
    out.gl_Position.z = _4416;
    out.gl_Position.w = _4297;
    float _4430 = exp2(_4420);
    float _4432 = _4424 * 0.5;
    float _4434 = _4428;
    float _4436 = _4428;
    if (!_4398)
    {
        _3809 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4438 = _3809;
    float _4440 = -_4414;
    float _4442 = _4440 + 1.0;
    float _4444 = _4442 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4446 = -_4444;
    float _4448 = _4446 + 1.0;
    float _4450 = _4448;
    float _4452 = _4444;
    float _4454 = _4438;
    float _4456 = _4438;
    if (!_4398)
    {
        _4426 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4458 = _4426;
    float _4460 = fma(_4430, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4462 = precise::clamp(_4460, 0.0, 1.0);
    float _4464 = fma(_4341, -0.5, _4418);
    float _4466 = fma(_4462, -2.0, 3.0);
    float _4468 = _4462 * _4462;
    float _4470 = _4468 * _4466;
    float _4472 = -_4470;
    float _4474 = _4472 + 1.0;
    float _4476 = fma(_4474, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4470);
    float _4478 = _4416 + _4297;
    float _4480 = _4029 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4482 = _4410 * _4476;
    float _4484 = _4478 * 0.5;
    float _4486 = _4482 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.x = _4432;
    out.m_107.y = _4464;
    out.m_107.z = _4484;
    out.m_107.w = _4297;
    float _4488 = -_4329;
    float _4490 = _4488 + 1.0;
    float _4492 = _4490 * _4486;
    float _4494 = precise::clamp(_4492, 0.0, 1.0);
    float _4496 = -_4494;
    float _4498 = fma(_4496, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4500 = _4498 * _4422;
    float _4502 = _4500 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_109.x = _4502;
    float _4504 = _4444 * _4357;
    float _4506 = _4368 * _4448;
    float _4508 = _4458;
    float _4510 = _4458;
    if (!_4398)
    {
        _4450 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4512 = _4450;
    float _4514 = _4368 * _4504;
    float _4516 = _4378 * _4504;
    float _4518 = _4514;
    float _4520 = _4512;
    float _4522 = _4512;
    if (!_4398)
    {
        _4452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4524 = _4452;
    float _4526 = fma(_4374, _4514, _4362);
    float _4528 = fma(_4376, _4514, _4364);
    float _4530 = fma(_4368, _4516, _4366);
    float _4532 = _4524;
    float _4534 = _4524;
    if (!_4398)
    {
        _4518 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4536 = _4518;
    out.m_111.x = _4526;
    out.m_111.y = _4528;
    out.m_111.z = _4530;
    out.m_111.w = _4506;
    bool _4538 = !_4398;
    float _4540 = _4536;
    float _4542 = _4536;
    if (!_4538)
    {
        bool _4544 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4546 = isnan(_4165);
        bool _4548 = _4544 || _4546;
        bool _4550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4552 = _4548 || _4550;
        if (!_4552)
        {
            float _4554 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4556 = _4165 + _4554;
            float _4558 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4560 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4558;
            float _4562 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4564 = _4562 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4566 = 1.0 / _4560;
            float _4568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4570 = _4568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4572 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4574 = _4572 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4578 = _4576 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4580 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4582 = _4580 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4584 = _4556 * _4566;
            float _4586 = precise::clamp(_4584, 0.0, 1.0);
            float _4588 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4590 = _4588 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4592 = fma(_4586, _4564, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4594 = fma(_4586, _4590, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4596 = fma(_4586, _4570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4598 = fma(_4586, _4574, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4600 = fma(_4586, _4578, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4602 = fma(_4586, _4582, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4510 = _4592;
            _4534 = _4600;
            _4436 = _4596;
            _4522 = _4598;
            _4456 = _4594;
            _4542 = _4602;
            _4604 = true;
        }
        else
        {
            bool _4606 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4608 = isnan(_4165);
            bool _4610 = _4606 || _4608;
            bool _4612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4614 = _4610 || _4612;
            if (!_4614)
            {
                _4434 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4616 = _4434;
            _4436 = _4616;
            if (!_4614)
            {
                _4508 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4618 = _4508;
            _4510 = _4618;
            if (!_4614)
            {
                _4454 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4620 = _4454;
            _4456 = _4620;
            if (!_4614)
            {
                _4520 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4622 = _4520;
            _4522 = _4622;
            if (!_4614)
            {
                _4532 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4624 = _4532;
            _4534 = _4624;
            if (!_4614)
            {
                _4540 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4626 = _4540;
            bool _4628 = !_4614;
            _4542 = _4626;
            if (!_4628)
            {
                bool _4630 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4632 = isnan(_4165);
                bool _4634 = _4630 || _4632;
                bool _4636 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4638 = _4634 || _4636;
                if (!_4638)
                {
                    float _4640 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4642 = _4165 + _4640;
                    float _4644 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4646 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4644;
                    float _4648 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4650 = _4648 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4652 = 1.0 / _4646;
                    float _4654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4656 = _4654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4658 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4660 = _4658 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4662 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4664 = _4662 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4666 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4668 = _4666 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4670 = _4642 * _4652;
                    float _4672 = precise::clamp(_4670, 0.0, 1.0);
                    float _4674 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4676 = _4674 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4678 = fma(_4672, _4650, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4680 = fma(_4672, _4676, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4682 = fma(_4672, _4656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4684 = fma(_4672, _4660, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4686 = fma(_4672, _4664, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4688 = fma(_4672, _4668, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4510 = _4678;
                    _4534 = _4686;
                    _4436 = _4682;
                    _4522 = _4684;
                    _4456 = _4680;
                    _4542 = _4688;
                    _4604 = true;
                }
                else
                {
                    _4510 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4534 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4436 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4522 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4456 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4542 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4604 = false;
    float _4690 = _4510;
    float _4692 = _4534;
    float _4694 = _4436;
    float _4696 = _4522;
    float _4698 = _4456;
    float _4700 = _4542;
    float _4702 = fma(_3579, -0.5, 0.5);
    float _4704 = precise::clamp(_4702, 0.0, 1.0);
    float _4706 = -_4690;
    float _4708 = _4706 + _4692;
    float _4710 = _4480 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4712 = -_4694;
    float _4714 = _4712 + _4696;
    float _4716 = fma(_4704, _4708, _4690);
    out.m_113.x = 0.0;
    float _4718 = -_4698;
    float _4720 = _4718 + _4700;
    float _4722 = fma(_4704, _4714, _4694);
    float _4724 = _4716 * 0.586610972881317138671875;
    out.m_53.x = _4710;
    bool _4726 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4728 = fma(_4704, _4720, _4698);
    float _4730 = fma(_4722, 0.298911988735198974609375, _4724);
    bool _4732 = _4029 > 0.0;
    bool _4734 = isnan(_4029);
    bool _4736 = _4732 || _4734;
    bool _4738 = isnan(0.0);
    bool _4740 = _4736 || _4738;
    float _4742 = fma(_4728, 0.114477999508380889892578125, _4730);
    float _4744 = -_4742;
    float _4746 = _4722 + _4744;
    float _4748 = -_4742;
    float _4750 = _4716 + _4748;
    float _4752 = -_4742;
    float _4754 = _4728 + _4752;
    float _4756 = fma(_4746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4742);
    float _4758 = fma(_4750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4742);
    float _4760 = fma(_4754, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4742);
    bool _4762 = !_4726;
    if (!_4762)
    {
        float _4764 = -_3965;
        float _4766 = _4764 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4768 = -_3967;
        float _4770 = _4768 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4772 = -_3969;
        float _4774 = _4772 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4776 = _4766 * _4766;
        float _4778 = fma(_4770, _4770, _4776);
        float _4780 = fma(_4774, _4774, _4778);
        float _4782 = sqrt(_4780);
        float _4784 = rsqrt(_4780);
        float _4786 = -_4782;
        float _4788 = _4786 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4790 = _4788 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4792 = precise::clamp(_4790, 0.0, 1.0);
        float _4794 = _4770 * _4784;
        float _4796 = _4766 * _4784;
        float _4798 = abs(_4792);
        float _4800 = log2(_4798);
        float _4802 = _4774 * _4784;
        float _4804 = _4794 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4806 = _3579 * _4796;
        float _4808 = -_4796;
        float _4810 = -_4804;
        float _4812 = fma(_4808, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4810);
        float _4814 = fma(_3583, _4794, _4806);
        float _4816 = -_4802;
        float _4818 = fma(_4816, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4812);
        float _4820 = fma(_3591, _4802, _4814);
        float _4822 = precise::clamp(_4820, 0.0, 1.0);
        float _4824 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4826 = _4818 + _4824;
        float _4828 = _4800 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4830 = _4826 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4832 = precise::clamp(_4830, 0.0, 1.0);
        float _4834 = exp2(_4828);
        float _4836 = _4834 * _4832;
        float _4838 = _4822 * _4836;
        float _4840 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4842 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4844 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4840;
        out.m_113.y = _4842;
        out.m_113.z = _4844;
    }
    out.m_79.x = _4756;
    out.m_79.y = _4758;
    out.m_79.z = _4760;
    if (_4740)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4846 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4846;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4604 = false;
    bool _3649 = false;
    bool _672 = false;
    bool _530 = false;
    bool _388 = false;
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4903 = as_type<float>(_148);
        out.gl_Position.z = _4903;
    }
    if (!_136)
    {
        return out;
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4973 = as_type<float>(_186);
        out.gl_Position.z = _4973;
    }
    if (_178)
    {
        return out;
    }
    float _188 = in.m_57.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.y;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = in.m_65.x;
    float _214 = in.m_65.y;
    float _216 = in.m_65.z;
    out.m_67.x = _188;
    out.m_67.y = _192;
    float _218 = _196 * _202;
    float _220 = _196 * _208;
    float _222 = fma(_194, _200, _218);
    float _224 = _196 * _214;
    float _226 = fma(_194, _206, _220);
    float _228 = fma(_194, _212, _224);
    float _230 = fma(_198, _204, _222);
    float _232 = fma(_198, _210, _226);
    float _234 = fma(_198, _216, _228);
    bool _236 = !_190;
    float _238 = _192;
    float _240 = _188;
    float _242 = _234;
    float _260;
    if (!_236)
    {
        float _244 = in.m_69.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_132);
        float _266 = 1.0 / _264;
        float _268 = _166 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _270 + _272;
    bool _276 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _278 = isnan(_270);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = 1.0 / _290;
    bool _294 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _296 = isnan(_270);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -_286;
    float _308 = _306 + 1.0;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _314;
    bool _318 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = _304 * _308;
    float _326 = -_304;
    float _328 = _326 + 1.0;
    float _330 = _274 * _292;
    float _332 = in.m_71.x;
    float _334 = in.m_71.y;
    float _336 = in.m_71.z;
    float _338 = fma(_312, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _340 = fma(_322, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _342 = fma(_316, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _344 = _338 * _324;
    float _346 = _340 * _324;
    float _348 = _342 * _324;
    float _350 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _352 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _354 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].z, _348);
    float _356 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[144].x, _350);
    float _358 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[144].y, _352);
    float _360 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[144].z, _354);
    float _362 = _356 * _332;
    float _364 = _358 * _334;
    float _366 = _360 * _336;
    bool _368 = !_318;
    float _386;
    if (!_368)
    {
        float _370 = in.m_69.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_132);
        float _392 = 1.0 / _390;
        float _394 = _166 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _400 = _396 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _406 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_396);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _422 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _424 = isnan(_396);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _434;
    bool _438 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _440 = isnan(_396);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = 1.0 / _404;
    float _452 = -_416;
    float _454 = _452 + 1.0;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _458 = _432 * _454;
    float _460 = -_432;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _420;
    float _466 = _436 * _450;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _472 = fma(_466, _400, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _474 = -_448;
    float _476 = _474 + 1.0;
    float _478 = _472 * _458;
    float _480 = _470 * _464;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _484 = _396 + _482;
    float _486 = _416 * _476;
    float _488 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _490 = fma(_480, _484, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _492 = fma(_490, _486, _488);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _500 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[117].x, _492);
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _502;
    out.m_73.y = _504;
    out.m_73.z = _506;
    out.m_73.w = _508;
    bool _510 = !_456;
    float _528;
    if (!_510)
    {
        float _512 = in.m_69.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_132);
        float _534 = 1.0 / _532;
        float _536 = _166 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _542 = _538 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _548 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _550 = isnan(_538);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _564 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _566 = isnan(_538);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _576;
    bool _580 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _582 = isnan(_538);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _546;
    float _594 = -_558;
    float _596 = _594 + 1.0;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _600 = _574 * _596;
    float _602 = -_574;
    float _604 = _602 + 1.0;
    float _606 = 1.0 / _562;
    float _608 = _578 * _592;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _614 = fma(_608, _542, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _616 = -_590;
    float _618 = _616 + 1.0;
    float _620 = _614 * _600;
    float _622 = _612 * _606;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _626 = _538 + _624;
    float _628 = _558 * _618;
    float _630 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[131].x, _620);
    float _632 = fma(_622, _626, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _634 = fma(_632, _628, _630);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _642 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[133].x, _634);
    float _644 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _642 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _644;
    out.m_75.y = _646;
    out.m_75.z = _648;
    out.m_75.w = _650;
    bool _652 = !_598;
    float _670;
    if (!_652)
    {
        float _654 = in.m_69.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_132);
        float _676 = 1.0 / _674;
        float _678 = _166 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _684 = int(_682);
    float _686 = in.m_69.x;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _690 = _680 + _688;
    float _692 = float(_132);
    float _694 = in.m_77.y;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _698 = _696 != 0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _702 = _680 + _700;
    float _704 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _706 = int(_704);
    float _708 = in.m_61.w;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _712 = _680 + _710;
    float _714 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _716 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _718 = int(_716);
    float _720 = float(_684);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _726 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _728 = isnan(_680);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    bool _738 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _740 = isnan(_680);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = 1.0 / _720;
    float _752 = float(uint(_706));
    int _754 = ~_706;
    int _756 = _754 + 1;
    bool _758 = _706 == 0;
    float _760 = 1.0 / _752;
    int _762 = ~_706;
    int _764 = _762 + 1;
    float _766 = float(_718);
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _770 = _750 * _166;
    float _772 = 1.0 / _766;
    int _774 = as_type<int>(_760) + (-2);
    float _776 = trunc(_770);
    int _778 = int(_776);
    float _780 = float(_706);
    float _782 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _784 = int(_782);
    float _786 = _772 * _166;
    float _788 = float(uint(_778));
    float _790 = trunc(_786);
    int _792 = int(_790);
    float _794 = as_type<float>(_774) * _788;
    float _796 = float(uint(_784));
    float _798 = 1.0 / _692;
    int _800 = ~_784;
    int _802 = _800 + 1;
    float _804 = trunc(_794);
    float _806 = precise::max(_804, 0.0);
    uint _809 = uint(_806);
    float _811 = 1.0 / _796;
    int _813 = _764 * int(_809);
    int _815 = _813 + _778;
    float _817 = 1.0 / _724;
    float _819 = float(uint(_815));
    int _821 = as_type<int>(_811) + (-2);
    float _823 = as_type<float>(_774) * _819;
    float _825 = _819;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _829 = as_type<float>(_784);
    if (_698)
    {
        _825 = 1.0;
    }
    float _831 = _825;
    float _833 = _831;
    if (!_698)
    {
        _833 = 7.345489978790283203125;
    }
    float _835 = _833;
    float _837 = trunc(_823);
    float _839 = precise::max(_837, 0.0);
    uint _841 = uint(_839);
    float _843 = _835 * _686;
    float _845 = floor(_843);
    int _847 = int(_809) + int(_841);
    float _849 = float(_778);
    float _851 = float(uint(_792));
    int _853 = _756 * _847;
    int _855 = _853 + _778;
    bool _857 = _849 >= _780;
    bool _859 = isnan(_849);
    bool _861 = _857 || _859;
    bool _863 = isnan(_780);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -_845;
    float _871 = _843 + _869;
    float _873 = as_type<float>(_821) * _851;
    bool _875 = uint(_855) >= uint(_706);
    float _877 = trunc(_867);
    int _879 = int(_877);
    bool _881 = !_875;
    int _883 = _881 ? 0 : (-1);
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _891 = _889 != 0;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _895 = _893 != 0;
    int _897 = ~_847;
    int _899 = _897 + _883;
    int _901 = _899 + 1;
    float _903 = trunc(_873);
    float _905 = precise::max(_903, 0.0);
    uint _907 = uint(_905);
    float _909 = in.m_69.y;
    float _911 = _780 * _166;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _915 = _913 != 0;
    int _917 = _706 * _901;
    int _919 = _917 + _778;
    float _921 = _911 * _798;
    int _923 = ~_879;
    int _925 = _923 + 1;
    int _927 = _925 + 1;
    bool _929 = !_758;
    float _931 = _929 ? as_type<float>(_919) : as_type<float>(0xffffffffu /* nan */);
    float _933 = _871 * _780;
    float _935 = _871;
    float _937 = _931;
    if (_698)
    {
        _935 = _686;
    }
    float _939 = _935;
    float _941 = trunc(_921);
    int _943 = int(_941);
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _947 = _945 != 0;
    int _949 = as_type<int>(_931) * _927;
    float _951 = _939;
    if (_698)
    {
        _937 = 1.0;
    }
    float _953 = _937;
    float _955 = _953;
    if (!_698)
    {
        _955 = 1.2345600128173828125;
    }
    float _957 = _955;
    int _959 = _802 * int(_907);
    int _961 = _959 + _792;
    int _963 = _706 + (-1);
    float _965 = trunc(_933);
    int _967 = int(_965);
    if (!_698)
    {
        _951 = _909;
    }
    float _969 = _951;
    float _971 = float(uint(_961));
    int _973 = _879 * _963;
    int _975 = _973 + _949;
    bool _977 = !_915;
    int _979 = _977 ? 0 : 1;
    float _981 = _969 * _957;
    bool _983 = !_891;
    int _985 = _983 ? 0 : 1;
    float _987 = as_type<float>(_821) * _971;
    bool _989 = !_887;
    int _991 = _989 ? 0 : 1;
    int _993 = abs(_979);
    int _995 = abs(_985);
    float _997 = trunc(_987);
    float _999 = precise::max(_997, 0.0);
    uint _1001 = uint(_999);
    bool _1003 = !_895;
    int _1005 = _1003 ? 0 : 1;
    int _1007 = abs(_991);
    int _1009 = _975 * _995;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1013 = _1011 != 0;
    float _1015 = floor(_981);
    int _1017 = abs(_1005);
    int _1019 = _967 * _993;
    int _1021 = _1019 + _778;
    bool _1023 = !_1013;
    int _1025 = _1023 ? 0 : 1;
    bool _1027 = _784 == 0;
    int _1029 = _943 * _1007;
    int _1031 = _1029 + _1009;
    int _1033 = abs(_1025);
    int _1035 = int(_907) + int(_1001);
    int _1037 = _1021 * _1017;
    int _1039 = _1037 + _1031;
    int _1041 = ~_784;
    int _1043 = _1041 + 1;
    float _1045 = -_1015;
    float _1047 = _981 + _1045;
    float _1049 = float(_784);
    int _1051 = _967 * _1033;
    int _1053 = _1051 + _1039;
    float _1055 = float(_792);
    int _1057 = _1043 * _1035;
    int _1059 = _1057 + _792;
    float _1061 = _1049 * _1047;
    bool _1063 = _1055 >= _1049;
    bool _1065 = isnan(_1055);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(_1049);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = float(uint(_1053));
    bool _1077 = uint(_1059) >= uint(_784);
    float _1079 = trunc(_1061);
    int _1081 = int(_1079);
    float _1083 = as_type<float>(_774) * _1075;
    bool _1085 = !_1077;
    int _1087 = _1085 ? 0 : (-1);
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1091 = _1089 != 0;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1095 = _1093 != 0;
    int _1097 = ~_1035;
    int _1099 = _1097 + _1087;
    int _1101 = _1099 + 1;
    float _1103 = trunc(_1073);
    int _1105 = int(_1103);
    int _1107 = ~_706;
    int _1109 = _1107 + 1;
    int _1111 = _784 * _1101;
    int _1113 = _1111 + _792;
    float _1115 = _1049 * _166;
    float _1117 = trunc(_1083);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = _1115 * _798;
    bool _1125 = !_1027;
    int _1127 = _1125 ? _1113 : (-1);
    int _1129 = ~_1105;
    int _1131 = _1129 + 1;
    int _1133 = _1131 + 1;
    float _1135 = trunc(_1123);
    int _1137 = int(_1135);
    bool _1139 = !_1091;
    int _1141 = _1139 ? 0 : 1;
    int _1143 = _1133 * _1127;
    int _1145 = _784 + (-1);
    int _1147 = _1109 * int(_1121);
    int _1149 = _1147 + _1053;
    bool _1151 = !_947;
    int _1153 = _1151 ? 0 : 1;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1161 = _1159 != 0;
    int _1163 = _1105 * _1145;
    int _1165 = _1163 + _1143;
    float _1167 = float(uint(_1149));
    bool _1169 = !_1095;
    int _1171 = _1169 ? 0 : 1;
    bool _1173 = !_1157;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = as_type<float>(_774) * _1167;
    int _1179 = abs(_1171);
    int _1181 = abs(_1153);
    float _1183 = trunc(_1177);
    float _1185 = precise::max(_1183, 0.0);
    uint _1187 = uint(_1185);
    int _1189 = abs(_1141);
    int _1191 = _1165 * _1179;
    int _1193 = abs(_1175);
    bool _1195 = !_1161;
    int _1197 = _1195 ? 0 : 1;
    int _1199 = _1081 * _1181;
    int _1201 = _1199 + _792;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1205 = _1203 != 0;
    int _1207 = _1137 * _1189;
    int _1209 = _1207 + _1191;
    int _1211 = abs(_1197);
    float _1213 = in.m_69.z;
    int _1215 = ~_706;
    int _1217 = _1215 + 1;
    int _1219 = _1201 * _1193;
    int _1221 = _1219 + _1209;
    int _1223 = int(_1121) + int(_1187);
    float _1225 = in.m_69.w;
    int _1227 = _1081 * _1211;
    int _1229 = _1227 + _1221;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1233 = _1231 != 0;
    int _1235 = ~_784;
    int _1237 = _1235 + 1;
    int _1239 = _1217 * _1223;
    int _1241 = _1239 + _1053;
    float _1243 = float(uint(_1229));
    int _1245 = _1211;
    float _1247 = as_type<float>(_1137);
    int _1249 = _1209;
    float _1251 = as_type<float>(_1081);
    if (_1205)
    {
        float _1253 = -_188;
        float _1255 = _1253 + 1.0;
        _1245 = as_type<int>(_1255);
    }
    int _1257 = _1245;
    if (!_1205)
    {
        _1247 = _188;
    }
    float _1259 = _1247;
    bool _1261 = uint(_1241) >= uint(_706);
    float _1263 = as_type<float>(_821) * _1243;
    bool _1265 = _706 == 0;
    bool _1267 = !_1261;
    int _1269 = _1267 ? 0 : (-1);
    float _1271 = trunc(_1263);
    float _1273 = precise::max(_1271, 0.0);
    uint _1275 = uint(_1273);
    bool _1277 = _1261;
    float _1279 = _1259;
    if (_1205)
    {
        bool _1281 = _686 > 0.5;
        _1277 = _1281;
    }
    bool _1283 = _1277;
    if (_1233)
    {
        float _1285 = -_188;
        float _1287 = _1285 + 1.0;
        _1249 = as_type<int>(_1287);
    }
    int _1289 = _1249;
    int _1291 = ~_1223;
    int _1293 = _1291 + _1269;
    int _1295 = _1293 + 1;
    if (_1205)
    {
        float _1297 = _1283 ? as_type<float>(_1257) : _188;
        _1279 = _1297;
    }
    float _1299 = _1279;
    bool _1301 = _909 > 0.5;
    int _1303 = _706 * _1295;
    int _1305 = _1303 + _1053;
    float _1307 = -_192;
    float _1309 = _1307 + 1.0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1313 = _1311 != 0;
    bool _1315 = _1213 > 0.5;
    int _1317 = _1301 ? as_type<int>(_1309) : as_type<int>(_192);
    int _1319 = _1237 * int(_1275);
    int _1321 = _1319 + _1229;
    bool _1323 = _1225 > 0.5;
    bool _1325 = !_1265;
    int _1327 = _1325 ? _1305 : (-1);
    float _1329 = float(uint(_1321));
    if (!_1233)
    {
        _1251 = _188;
    }
    float _1331 = _1251;
    float _1333 = _1331;
    if (_1233)
    {
        float _1335 = _1315 ? as_type<float>(_1289) : _188;
        _1333 = _1335;
    }
    float _1337 = _1333;
    float _1339 = as_type<float>(_821) * _1329;
    float _1341 = _1313 ? as_type<float>(_1317) : _192;
    int _1343 = _1327 & 3;
    bool _1345 = _1343 != 0;
    float _1347 = trunc(_1339);
    float _1349 = precise::max(_1347, 0.0);
    uint _1351 = uint(_1349);
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1355 = _1353 != 0;
    int _1357 = _1323 ? as_type<int>(_1309) : as_type<int>(_192);
    int _1359 = _1327 & 3;
    bool _1361 = _1359 != 0;
    int _1363 = _1345 ? 0 : 1;
    float _1365 = _1355 ? as_type<float>(_1357) : _192;
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1369 = _1367 != 0;
    bool _1371 = uint(_1359) > 1u;
    int _1373 = ~_1363;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    int _1379 = int(_1275) + int(_1351);
    int _1381 = ~_784;
    int _1383 = _1381 + 1;
    int _1385 = _1377;
    if (_1369)
    {
        float _1387 = _1315 ? _1309 : _192;
        _238 = _1387;
    }
    float _1389 = _238;
    int _1391 = _1383 * _1379;
    int _1393 = _1391 + _1229;
    float _1395 = as_type<float>(_1393);
    if (!_1371)
    {
        int _1397 = ~_1363;
        int _1399 = _1397 + 1;
        _1385 = _1399;
    }
    int _1401 = _1385;
    float _1403 = in.m_50.x;
    float _1405 = in.m_50.y;
    float _1407 = in.m_50.z;
    bool _1409 = _1359 != 3;
    bool _1411 = uint(_1359) >= 2u;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1415 = _1413 != 0;
    int _1417 = _1411 ? 0 : 1;
    bool _1419 = _909 > 0.5;
    bool _1421 = _1419 && _1415;
    int _1423 = ~_1417;
    int _1425 = _1423 + 1;
    int _1427 = _1425 + 1;
    int _1429 = _1427;
    if (_1409)
    {
        int _1431 = ~_1417;
        int _1433 = _1431 + 1;
        _1429 = _1433;
    }
    int _1435 = _1429;
    bool _1437 = uint(_1393) >= uint(_784);
    if (!_1415)
    {
        _1395 = _188;
    }
    float _1439 = _1395;
    bool _1441 = !_1437;
    int _1443 = _1441 ? 0 : (-1);
    float _1445 = _1439;
    if (_1421)
    {
        float _1447 = -_188;
        float _1449 = _1447 + 1.0;
        _240 = _1449;
    }
    float _1451 = _240;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1455 = _1453 != 0;
    float _1457 = _214 * _1405;
    float _1459 = _202 * _1405;
    float _1461 = _208 * _1405;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1467 = fma(_200, _1403, _1459);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1473 = fma(_206, _1403, _1461);
    float _1475 = 1.0 / _1465;
    float _1477 = fma(_212, _1403, _1457);
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1481 = _1479 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1483 = fma(_204, _1407, _1467);
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1485;
    float _1489 = float(uint(_1021));
    float _1491 = _1405 + _694;
    float _1493 = 1.0 / _1471;
    float _1495 = _1487 * _817;
    float _1497 = as_type<float>(_774) * _1489;
    int _1499 = ~_1379;
    int _1501 = _1499 + _1443;
    int _1503 = _1501 + 1;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1509 = _1507 != 0;
    float _1511 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1515 = _1513 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1517;
    int _1521 = _784 * _1503;
    int _1523 = _1521 + _1229;
    float _1525 = -_1505;
    float _1527 = fma(_1511, 2.0, _1525);
    float _1529 = trunc(_1497);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1537 = _909 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1539 = _1515 * _1475;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1545 = _1519 * _1493;
    if (_1415)
    {
        _1445 = _1451;
    }
    float _1547 = _1445;
    float _1549 = fma(_1537, -2.0, _1535);
    bool _1551 = !_1027;
    float _1553 = _1551 ? as_type<float>(_1523) : as_type<float>(0xffffffffu /* nan */);
    float _1555 = fma(_210, _1407, _1473);
    float _1557 = float(uint(_1201));
    float _1559 = 1.0 / _1543;
    int _1561 = ~_706;
    int _1563 = _1561 + 1;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1569 = fma(_216, _1407, _1477);
    float _1571 = as_type<float>(_821) * _1557;
    int _1573 = _1563 * int(_1533);
    int _1575 = _1573 + _1021;
    int _1577 = ~_784;
    int _1579 = _1577 + 1;
    float _1581 = 1.0 / _1481;
    int _1583 = as_type<int>(_1553) & 3;
    bool _1585 = _1583 != 0;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1591 = float(uint(_1575));
    float _1593 = _1483 + _708;
    int _1595 = _1585 ? 0 : 1;
    float _1597 = -_166;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1527);
    bool _1601 = uint(_1583) >= 2u;
    float _1603 = trunc(_1571);
    float _1605 = precise::max(_1603, 0.0);
    uint _1607 = uint(_1605);
    float _1609 = as_type<float>(_774) * _1591;
    int _1611 = _1601 ? 0 : 1;
    bool _1613 = _1583 != 3;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1619 = 1.0 / _1589;
    int _1621 = ~_1611;
    int _1623 = _1621 + 1;
    int _1625 = _1623 + 1;
    float _1627 = _1567 * _1581;
    int _1629 = ~_1595;
    int _1631 = _1629 + 1;
    int _1633 = _1631 + 1;
    bool _1635 = !_1455;
    int _1637 = _1635 ? 0 : 1;
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1641 = _1639 != 0;
    float _1643 = trunc(_1609);
    float _1645 = precise::max(_1643, 0.0);
    uint _1647 = uint(_1645);
    int _1649 = _1625;
    int _1651 = _1633;
    float _1653 = _1555;
    float _1655 = _1553;
    float _1657 = _1549;
    if (_1613)
    {
        int _1659 = ~_1611;
        int _1661 = _1659 + 1;
        _1649 = _1661;
    }
    int _1663 = _1649;
    int _1665 = _1579 * int(_1607);
    int _1667 = _1665 + _1201;
    bool _1669 = uint(_1583) > 1u;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1679 = 1.0 / _1617;
    float _1681 = float(uint(_1667));
    float _1683 = _1673 * _1559;
    float _1685 = _686 * 2.0;
    float _1687 = _1677 * _1619;
    float _1689 = _686 + _909;
    float _1691 = as_type<float>(_821) * _1681;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1693;
    float _1697 = floor(_1685);
    int _1699 = int(_1533) + int(_1647);
    float _1701 = _1689 + (-1.0);
    float _1703 = _909 * 2.0;
    int _1705 = ~_706;
    int _1707 = _1705 + 1;
    float _1709 = fma(_1687, _690, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    if (!_1669)
    {
        int _1711 = ~_1595;
        int _1713 = _1711 + 1;
        _1651 = _1713;
    }
    int _1715 = _1651;
    float _1717 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1719 = trunc(_1691);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    float _1725 = _909 + _1213;
    float _1727 = _1695 * _1679;
    int _1729 = _1707 * _1699;
    int _1731 = _1729 + _1021;
    int _1733 = ~_784;
    int _1735 = _1733 + 1;
    float _1737 = _1725 + (-1.0);
    float _1739 = fma(_1727, _712, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1741 = _1697 > 0.0;
    float _1743 = floor(_1703);
    bool _1745 = _1697 >= 0.0;
    bool _1747 = isnan(_1697);
    bool _1749 = _1745 || _1747;
    bool _1751 = isnan(0.0);
    bool _1753 = _1749 || _1751;
    float _1755 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1757 = _1213 * 2.0;
    bool _1759 = !_1509;
    int _1761 = _1759 ? 0 : 1;
    int _1763 = _1753 ? 0 : 1;
    int _1765 = int(_1607) + int(_1723);
    bool _1767 = uint(_1731) >= uint(_706);
    int _1769 = ~_1763;
    int _1771 = _1769 + 1;
    int _1773 = _1771 + 1;
    int _1775 = _1735 * _1765;
    int _1777 = _1775 + _1201;
    int _1779 = _1773;
    if (!_1741)
    {
        int _1781 = ~_1763;
        int _1783 = _1781 + 1;
        _1779 = _1783;
    }
    int _1785 = _1779;
    bool _1787 = !_1767;
    int _1789 = _1787 ? 0 : (-1);
    bool _1791 = uint(_1777) >= uint(_784);
    float _1793 = floor(_1757);
    bool _1795 = _1743 > 0.0;
    bool _1797 = _1743 >= 0.0;
    bool _1799 = isnan(_1743);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    int _1807 = ~_1699;
    int _1809 = _1807 + _1789;
    int _1811 = _1809 + 1;
    int _1813 = as_type<int>(_1743);
    if (_1641)
    {
        _1813 = 0;
    }
    int _1815 = _1813;
    int _1817 = _1815;
    if (_1641)
    {
        _827 = 0;
    }
    int _1819 = _827;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1823 = _680 + _1821;
    int _1825 = _1805 ? 0 : 1;
    int _1827 = _706 * _1811;
    int _1829 = _1827 + _1021;
    int _1831 = _1819;
    if (!_1641)
    {
        _1817 = 1;
    }
    int _1833 = _1817;
    float _1835 = fma(_1539, _1823, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    if (!_1641)
    {
        _1831 = 2;
    }
    int _1837 = _1831;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1841 = _1839 != 0;
    int _1843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1845 = _1843 != 0;
    int _1847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1849 = _1847 != 0;
    bool _1851 = _706 == 0;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1855 = _680 + _1853;
    bool _1857 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1859 = isnan(_680);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1865 = _1861 || _1863;
    float _1867 = float(_1865);
    int _1869 = ~_1825;
    int _1871 = _1869 + 1;
    int _1873 = _1871 + 1;
    float _1875 = fma(_1495, _1855, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1877 = !_1791;
    int _1879 = _1877 ? 0 : (-1);
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1883 = _680 + _1881;
    int _1885 = _1873;
    if (!_1795)
    {
        int _1887 = ~_1825;
        int _1889 = _1887 + 1;
        _1885 = _1889;
    }
    int _1891 = _1885;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1895 = _680 + _1893;
    bool _1897 = _1793 > 0.0;
    bool _1899 = _1793 >= 0.0;
    bool _1901 = isnan(_1793);
    bool _1903 = _1899 || _1901;
    bool _1905 = isnan(0.0);
    bool _1907 = _1903 || _1905;
    float _1909 = -_1867;
    float _1911 = _1909 + 1.0;
    bool _1913 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1915 = isnan(_680);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    bool _1925 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1927 = isnan(_680);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1933 = _1929 || _1931;
    float _1935 = float(_1933);
    bool _1937 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1939 = isnan(_680);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1945 = _1941 || _1943;
    float _1947 = float(_1945);
    float _1949 = _1923 * _1911;
    float _1951 = -_1923;
    float _1953 = _1951 + 1.0;
    float _1955 = fma(_1545, _1883, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1957 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1959 = isnan(_680);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = fma(_1627, _1895, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1971 = -_1935;
    float _1973 = _1971 + 1.0;
    bool _1975 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1977 = isnan(_680);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1983 = _1979 || _1981;
    float _1985 = float(_1983);
    float _1987 = -_1947;
    float _1989 = _1987 + 1.0;
    bool _1991 = !_1851;
    int _1993 = _1991 ? _1829 : (-1);
    float _1995 = _1967 * _1973;
    float _1997 = -_1967;
    float _1999 = _1997 + 1.0;
    float _2001 = -_1985;
    float _2003 = _2001 + 1.0;
    float _2005 = _1935 * _1953;
    bool _2007 = _1833 != 1;
    float _2009 = in.m_63.w;
    float _2011 = _1985 * _1999;
    float _2013 = _1947 * _2003;
    float _2015 = _736 * _1989;
    float _2017 = -_736;
    float _2019 = _2017 + 1.0;
    float _2021 = in.m_65.w;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2025 = _1907 ? 0 : 1;
    float _2027 = _748 * _2019;
    float _2029 = -_748;
    float _2031 = _2029 + 1.0;
    bool _2033 = _1837 != 2;
    float _2035 = fma(_1683, _702, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2037 = _1875 * _2027;
    bool _2039 = !_1841;
    int _2041 = _2039 ? 0 : 1;
    float _2043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2045 = ~_2025;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    float _2051 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2037);
    int _2053 = _2049;
    float _2055 = _2019;
    if (!_1897)
    {
        int _2057 = ~_2025;
        int _2059 = _2057 + 1;
        _2053 = _2059;
    }
    int _2061 = _2053;
    float _2063 = fma(_1835, _2015, _2051);
    int _2065 = as_type<int>(_1553) & 3;
    bool _2067 = _2065 != 0;
    float _2069 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2073 = fma(_1955, _2013, _2063);
    float _2075 = _1555 + _2009;
    float _2077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2079 = _1593 + _2077;
    float _2081 = fma(_2069, _1389, -0.5);
    if (_2033)
    {
        _1653 = _686;
    }
    float _2083 = _1653;
    float _2085 = _1569 + _2021;
    float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2089 = _2075 + _2087;
    float _2091 = _2079 * _2079;
    float _2093 = _2083;
    if (!_2033)
    {
        _2093 = _1213;
    }
    float _2095 = _2093;
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2099 = _2085 + _2097;
    int _2101 = abs(_2041);
    float _2103 = fma(_2089, _2089, _2091);
    float _2105 = float(_2061);
    float _2107 = _2095 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2109 = float(_2101);
    float _2111 = fma(_2099, _2099, _2103);
    bool _2113 = !_2067;
    int _2115 = _2113 ? 0 : 1;
    float _2117 = -_2071;
    float _2119 = fma(_2107, 2.0, _2117);
    bool _2121 = _1359 != 3;
    float _2123 = sqrt(_2111);
    float _2125 = _2109 * _2105;
    int _2127 = _1327 >> 31;
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2131 = _1491 + _2129;
    bool _2133 = !_2121;
    int _2135 = _2133 ? 0 : (-1);
    float _2137 = _714 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _2139 = _1583 != 3;
    float _2141 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2143 = _2127 & 3;
    float _2145 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2147 = as_type<int>(_1553) >> 31;
    float _2149 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2141);
    int _2151 = _1327 + _2143;
    float _2153 = fma(_2145, _1547, -0.5);
    int _2155 = _2147 & 3;
    float _2157 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2149);
    int _2159 = _2151 >> 2;
    float _2161 = _2123 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2163 = as_type<int>(_1553) + _2155;
    float _2165 = rsqrt(_2111);
    int _2167 = _2159 << 4;
    int _2169 = _2167 + 368;
    float _2171 = fma(_1969, _2011, _2073);
    int _2173 = _2163 >> 2;
    float _2175 = -_166;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2119);
    float _2179 = as_type<float>(_2163);
    if (!_2007)
    {
        _2179 = _909;
    }
    float _2181 = _2179;
    float _2183 = fma(_2035, _1995, _2171);
    int _2185 = _2169 + 8;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    float _2203 = precise::min(_2137, _2161);
    int _2205 = _2173 << 4;
    int _2207 = _2205 + 512;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2211 = _2181;
    if (!_2007)
    {
        _2055 = _2181;
    }
    float _2213 = _2055;
    out.m_79.w = _2203;
    bool _2215 = !_2139;
    int _2217 = _2215 ? 0 : (-1);
    uint _2219 = uint(int(uint(_2169) >> uint(2)));
    uint _2221 = uint(int(uint(int(_2219)) >> uint(2)));
    int _2223 = int(_2219) & 3;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[int(_2221)][_2223];
    int _2227 = int(_2219) + 1;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    int _2231 = _2227 & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    float _2235 = _2213;
    if (_2007)
    {
        _2211 = _686;
    }
    float _2237 = _2211;
    float _2239 = _2165 * _2203;
    bool _2241 = _2157 >= 0.0;
    float _2243 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2209);
    if (!_2007)
    {
        _1655 = _1213;
    }
    float _2245 = _1655;
    uint _2247 = uint(int(uint(_2207) >> uint(2)));
    uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
    int _2251 = int(_2247) & 3;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[int(_2249)][_2251];
    int _2255 = int(_2247) + 1;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    int _2259 = _2255 & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    float _2263 = _2245;
    if (_2007)
    {
        _2263 = _909;
    }
    float _2265 = _2263;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2269 = _2089 * _2239;
    float _2271 = _2079 * _2239;
    if (_2007)
    {
        _2235 = _686;
    }
    float _2273 = _2235;
    float _2275 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[83].w, _768);
    float _2277 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2267);
    float _2279 = -_2269;
    float _2281 = _2089 + _2279;
    int _2283 = _2207 + 8;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    uint _2287 = uint(int(uint(int(_2285)) >> uint(2)));
    int _2289 = int(_2285) & 3;
    float _2291 = (*spvDescriptorSet0.vp_c9)._m0[int(_2287)][_2289];
    int _2293 = int(_2285) + 1;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    int _2297 = _2293 & 3;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[int(_2295)][_2297];
    float _2301 = -_2271;
    float _2303 = _2079 + _2301;
    float _2305 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2277);
    float _2307 = _2281 * _2281;
    float _2309 = _2273 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2311 = fma(_2305, _2153, _2177);
    float _2313 = fma(_2303, _2303, _2307);
    float _2315 = _2099 * _2239;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2319 = abs(_1401);
    float _2321 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2275);
    int _2323 = abs(_1715);
    float _2325 = -_2317;
    float _2327 = fma(_2309, 2.0, _2325);
    bool _2329 = !_1361;
    int _2331 = _2329 ? 0 : 1;
    float _2333 = -_2315;
    float _2335 = _2099 + _2333;
    if (_2241)
    {
        out.m_53.x = 0.0;
    }
    int _2337 = ~_2319;
    int _2339 = _2337 + 1;
    int _2341 = _2339 + 1;
    float _2343 = fma(_2335, _2335, _2313);
    int _2345 = abs(_2331);
    float _2347 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2349 = int(_2347);
    int _2351 = ~_2323;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    int _2357 = abs(_2115);
    int _2359 = abs(_1435);
    int _2361 = ~_1765;
    int _2363 = _2361 + _1879;
    int _2365 = _2363 + 1;
    int _2367 = ~_2345;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    int _2373 = _2341 * as_type<int>(_2233);
    int _2375 = abs(_1663);
    int _2377 = _784 * _2365;
    int _2379 = _2377 + _1201;
    int _2381 = ~_2357;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    int _2387 = _2371 * as_type<int>(_2225);
    int _2389 = _2387 + _2373;
    float _2391 = fma(_2131, _2131, _2091);
    int _2393 = _2355 * as_type<int>(_2261);
    int _2395 = abs(_2135);
    float _2397 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2399 = int(_2397);
    int _2401 = ~_2359;
    int _2403 = _2401 + 1;
    int _2405 = _2403 + 1;
    int _2407 = _2385 * as_type<int>(_2253);
    int _2409 = _2407 + _2393;
    int _2411 = ~_2375;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    float _2417 = fma(_2099, _2099, _2391);
    int _2419 = _2405 * as_type<int>(_2193);
    int _2421 = _2419 + _2389;
    int _2423 = abs(_1637);
    int _2425 = _2415 * as_type<int>(_2291);
    int _2427 = _2425 + _2409;
    int _2429 = ~_2395;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = rsqrt(_2417);
    int _2437 = abs(_2217);
    int _2439 = abs(_1761);
    int _2441 = _2433 * as_type<int>(_2201);
    int _2443 = _2441 + _2421;
    int _2445 = ~_2437;
    int _2447 = _2445 + 1;
    int _2449 = _2447 + 1;
    float _2451 = float(uint(_2349));
    int _2453 = ~_2423;
    int _2455 = _2453 + 1;
    int _2457 = _2455 + 1;
    int _2459 = _2449 * as_type<int>(_2299);
    int _2461 = _2459 + _2427;
    float _2463 = 1.0 / _2451;
    int _2465 = abs(_2349);
    int _2467 = _2443 * _2457;
    float _2469 = float(uint(_2399));
    float _2471 = in.m_81.x;
    float _2473 = in.m_81.y;
    float _2475 = in.m_81.z;
    float _2477 = float(uint(_2465));
    int _2479 = _1993 * _2423;
    int _2481 = _2479 + _2467;
    int _2483 = abs(_2399);
    float _2485 = 1.0 / _2469;
    bool _2487 = _784 == 0;
    int _2489 = ~_2439;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    if (!_2007)
    {
        _829 = _1213;
    }
    float _2495 = _829;
    float _2497 = _2495;
    if (_2007)
    {
        _2497 = _909;
    }
    float _2499 = _2497;
    float _2501 = 1.0 / _2477;
    float _2503 = float(uint(_2483));
    int _2505 = _2493 * _2461;
    bool _2507 = !_2487;
    int _2509 = _2507 ? _2379 : (-1);
    int _2511 = as_type<int>(_2463) + (-2);
    float _2513 = _2499 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2515 = float(uint(_2481));
    float _2517 = 1.0 / _2503;
    float _2519 = _2125 * (-2.0);
    int _2521 = _2509 * _2439;
    int _2523 = _2521 + _2505;
    int _2525 = as_type<int>(_2485) + (-2);
    float _2527 = as_type<float>(_2511) * _2515;
    float _2529 = fma(_1717, _2519, _1717);
    float _2531 = fma(_2519, _2471, _2471);
    float _2533 = float(uint(_2523));
    float _2535 = trunc(_2527);
    float _2537 = precise::max(_2535, 0.0);
    uint _2539 = uint(_2537);
    int _2541 = abs(_2481);
    int _2543 = as_type<int>(_2501) + (-2);
    float _2545 = as_type<float>(_2525) * _2533;
    int _2547 = ~_2349;
    int _2549 = _2547 + 1;
    float _2551 = sqrt(_2343);
    float _2553 = float(uint(_2541));
    int _2555 = abs(_2523);
    float _2557 = float(uint(_2555));
    float _2559 = trunc(_2545);
    float _2561 = precise::max(_2559, 0.0);
    uint _2563 = uint(_2561);
    float _2565 = as_type<float>(_2543) * _2553;
    int _2567 = as_type<int>(_2517) + (-2);
    int _2569 = _2549 * int(_2539);
    int _2571 = _2569 + _2481;
    int _2573 = ~_2399;
    int _2575 = _2573 + 1;
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2579 = ~_2465;
    int _2581 = _2579 + 1;
    float _2583 = as_type<float>(_2567) * _2557;
    float _2585 = trunc(_2565);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    float _2591 = _2517;
    float _2593 = as_type<float>(_2511);
    if (_2241)
    {
        _2591 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2595 = _2591;
    float _2597 = fma(_2513, -2.0, _2577);
    float _2599 = float(uint(_2571));
    float _2601 = _2165 * _2551;
    int _2603 = as_type<int>(_2595);
    if (_2241)
    {
        float _2605 = _2595 * 5.0;
        _2603 = as_type<int>(_2605);
    }
    int _2607 = _2603;
    int _2609 = ~_2399;
    int _2611 = _2609 + 1;
    float _2613 = trunc(_2583);
    float _2615 = precise::max(_2613, 0.0);
    uint _2617 = uint(_2615);
    int _2619 = _2575 * int(_2563);
    int _2621 = _2619 + _2523;
    float _2623 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2597);
    if (_2241)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8537 = as_type<float>(_2607);
        out.gl_Position.z = _8537;
    }
    int _2625 = _2581 * int(_2589);
    int _2627 = _2625 + _2541;
    float _2629 = fma(_1709, _2005, _2183);
    int _2631 = ~_2483;
    int _2633 = _2631 + 1;
    float _2635 = as_type<float>(_2511) * _2599;
    float _2637 = float(uint(_2621));
    float _2639 = fma(_1739, _1949, _2629);
    float _2641 = float(uint(_2627));
    float _2643 = _2639;
    if (_2033)
    {
        _2593 = _909;
    }
    float _2645 = _2593;
    float _2647 = as_type<float>(_2525) * _2637;
    float _2649 = as_type<float>(_2543) * _2641;
    float _2651 = _2645;
    if (!_2033)
    {
        _2651 = _686;
    }
    float _2653 = _2651;
    float _2655 = _714 * _2601;
    int _2657 = _2633 * int(_2617);
    int _2659 = _2657 + _2555;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2663 = _2653 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2665 = _2655 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2667 = float(uint(_2659));
    float _2669 = trunc(_2647);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    float _2675 = fma(_2663, -2.0, _2661);
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2679 = _2665 * _2435;
    float _2681 = as_type<float>(_2567) * _2667;
    float _2683 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2675);
    float _2685 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2677);
    float _2687 = _2131 * _2679;
    float _2689 = trunc(_2635);
    float _2691 = precise::max(_2689, 0.0);
    uint _2693 = uint(_2691);
    float _2695 = _2079 * _2679;
    float _2697 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2639);
    float _2699 = -_2687;
    float _2701 = _2131 + _2699;
    float _2703 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2685);
    int _2705 = ~_2483;
    int _2707 = _2705 + 1;
    float _2709 = -_2695;
    float _2711 = _2079 + _2709;
    float _2713 = _2701 * _2701;
    float _2715 = trunc(_2681);
    float _2717 = precise::max(_2715, 0.0);
    uint _2719 = uint(_2717);
    float _2721 = -_2683;
    float _2723 = fma(_2703, _2081, _2721);
    int _2725 = ~_2349;
    int _2727 = _2725 + 1;
    float _2729 = fma(_2711, _2711, _2713);
    int _2731 = int(_2563) + int(_2673);
    out.m_83.x = _2697;
    float _2733 = _2099 * _2679;
    float _2735 = trunc(_2649);
    float _2737 = precise::max(_2735, 0.0);
    uint _2739 = uint(_2737);
    int _2741 = int(_2539) + int(_2693);
    int _2743 = ~_2465;
    int _2745 = _2743 + 1;
    int _2747 = _2727 * _2741;
    int _2749 = _2747 + _2481;
    int _2751 = int(_2617) + int(_2719);
    bool _2753 = uint(_2749) >= uint(_2349);
    int _2755 = _2707 * _2751;
    int _2757 = _2755 + _2555;
    bool _2759 = !_2753;
    int _2761 = _2759 ? 0 : (-1);
    int _2763 = int(_2589) + int(_2739);
    float _2765 = -_2733;
    float _2767 = _2099 + _2765;
    int _2769 = _2611 * _2731;
    int _2771 = _2769 + _2523;
    bool _2773 = uint(_2757) >= uint(_2483);
    int _2775 = _2745 * _2763;
    int _2777 = _2775 + _2541;
    float _2779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2781 = uint(_2771) >= uint(_2399);
    float _2783 = fma(_2767, _2767, _2729);
    int _2785 = ~_2741;
    int _2787 = _2785 + _2761;
    int _2789 = _2787 + 1;
    bool _2791 = uint(_2777) >= uint(_2465);
    bool _2793 = !_2781;
    int _2795 = _2793 ? 0 : (-1);
    int _2797 = _2349 * _2789;
    int _2799 = _2797 + _2481;
    bool _2801 = _2349 == 0;
    float _2803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2805 = ~_2731;
    int _2807 = _2805 + _2795;
    int _2809 = _2807 + 1;
    bool _2811 = !_2791;
    int _2813 = _2811 ? 0 : (-1);
    bool _2815 = _2349 == 0;
    int _2817 = _2399 * _2809;
    int _2819 = _2817 + _2523;
    int _2821 = _2481 ^ _2349;
    bool _2823 = !_2801;
    int _2825 = _2823 ? _2799 : (-1);
    bool _2827 = !_2773;
    int _2829 = _2827 ? 0 : (-1);
    float _2831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2833 = _2399 == 0;
    bool _2835 = _2399 == 0;
    float _2837 = _2803 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2839 = _2523 ^ _2399;
    float _2841 = _2779 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2843 = float(_2825);
    float _2845 = fma(_2837, _1337, -0.5);
    float _2847 = fma(_2841, _1299, -0.5);
    uint _2849 = uint(int(uint(_2821) >> uint(31)));
    float _2851 = fma(_2841, _2843, _1599);
    uint _2853 = uint(int(uint(_2839) >> uint(31)));
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2857 = ~_2813;
    int _2859 = _2763 + _2857;
    int _2861 = _2859 + 1;
    int _2863 = ~int(_2849);
    int _2865 = _2863 + 1;
    float _2867 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2855);
    int _2869 = ~_2829;
    int _2871 = _2751 + _2869;
    int _2873 = _2871 + 1;
    float _2875 = -_166;
    float _2877 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2327);
    int _2879 = ~int(_2853);
    int _2881 = _2879 + 1;
    float _2883 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2867);
    bool _2885 = !_2833;
    int _2887 = _2885 ? _2819 : (-1);
    float _2889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2891 = _2861 ^ _2865;
    int _2893 = _2873 ^ _2881;
    float _2895 = float(_2887);
    int _2897 = ~_2865;
    int _2899 = _2897 + _2891;
    int _2901 = _2899 + 1;
    int _2903 = ~_2881;
    int _2905 = _2903 + _2893;
    int _2907 = _2905 + 1;
    float _2909 = fma(_2883, _2847, _2851);
    float _2911 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2913 = fma(_2837, _2895, _2877);
    bool _2915 = !_2815;
    int _2917 = _2915 ? _2901 : (-1);
    float _2919 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2921 = log2(_2919);
    float _2923 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1549);
    float _2925 = float(_2917);
    float _2927 = fma(_1341, _2911, -0.5);
    bool _2929 = !_2835;
    int _2931 = _2929 ? _2907 : (-1);
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2935 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2937 = -_2923;
    float _2939 = fma(_2911, _2925, _2937);
    float _2941 = sqrt(_2783);
    float _2943 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2933);
    float _2945 = float(_2931);
    float _2947 = fma(_1365, _2935, -0.5);
    float _2949 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2243);
    float _2951 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2943);
    bool _2953 = !_1845;
    int _2955 = _2953 ? 0 : 1;
    float _2957 = _2921 * _166;
    float _2959 = -_2623;
    float _2961 = fma(_2935, _2945, _2959);
    float _2963 = fma(_2951, _2927, _2939);
    float _2965 = fma(_2949, _2845, _2913);
    float _2967 = _2723 + 0.5;
    float _2969 = fma(_2321, _2947, _2961);
    float _2971 = _2963 + 0.5;
    float _2973 = exp2(_2957);
    float _2975 = _2435 * _2941;
    float _2977 = _2965 + 0.5;
    bool _2979 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2981 = isnan(1.0);
    bool _2983 = _2979 || _2981;
    bool _2985 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2987 = _2983 || _2985;
    float _2989 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2991 = 1.0 + _2989;
    float _2993 = _2311 + 0.5;
    float _2995 = _2909 + 0.5;
    float _2997 = _2969 + 0.5;
    float _2999 = _2655 * _2975;
    bool _3001 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3003 = isnan(0.0);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3009 = _3005 || _3007;
    float _3011 = 1.0 / _2991;
    int _3013 = abs(_2955);
    out.m_85.x = _2993;
    out.m_85.y = _2967;
    float _3015 = _686 + (-0.5);
    float _3017 = -_2973;
    float _3019 = _3017 + 1.0;
    out.m_87.x = _2995;
    out.m_87.y = _2971;
    out.m_87.z = _2977;
    out.m_87.w = _2997;
    out.m_89.x = _2999;
    float _3021 = _3009 ? _3019 : 0.0;
    bool _3023 = !_1849;
    int _3025 = _3023 ? 0 : 1;
    float _3027 = _3021;
    float _3029 = _2713;
    float _3031 = _2687;
    if (_2241)
    {
        return out;
    }
    float _3033 = -_2687;
    float _3035 = _1491 + _3033;
    float _3037 = float(_1785);
    float _3039 = -_2695;
    float _3041 = _1593 + _3039;
    float _3043 = float(_3013);
    float _3045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3047 = _3035 + _3045;
    float _3049 = fma(_3015, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2531);
    float _3051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3053 = _3041 + _3051;
    float _3055 = _909 + (-0.5);
    float _3057 = _3047 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3059 = _3043 * _3037;
    int _3061 = abs(_3025);
    if (_2987)
    {
        float _3063 = _3021 * _3011;
        _168 = _3063;
    }
    float _3065 = _168;
    float _3067 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3057);
    float _3069 = _3059 * (-2.0);
    float _3071 = float(_1891);
    float _3073 = -_2733;
    float _3075 = _2085 + _3073;
    float _3077 = float(_3061);
    float _3079 = fma(_3069, _2473, _2473);
    float _3081 = fma(_1755, _3069, _1755);
    float _3083 = _686 + _1213;
    float _3085 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3087 = _3075 + _3085;
    float _3089 = fma(_3055, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3079);
    float _3091 = _3077 * _3071;
    float _3093 = _3083 + (-1.0);
    float _3095 = fma(_3081, _3065, _3089);
    float _3097 = _3091 * (-2.0);
    float _3099 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3067);
    float _3101 = fma(_3093, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3103 = _1213 + (-0.5);
    float _3105 = fma(_3097, _2475, _2475);
    float _3107 = fma(_2529, _3065, _3049);
    bool _3109 = _3099 >= 0.0;
    float _3111 = fma(_3101, _3097, _3101);
    float _3113 = fma(_3103, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3105);
    float _3115 = _3107 * 0.15915493667125701904296875;
    float _3117 = _3095 * 0.15915493667125701904296875;
    float _3119 = fma(_3111, _3065, _3113);
    float _3121 = _3115 * 6.283185482025146484375;
    float _3123 = sin(_3121);
    float _3125 = _3119 * 0.15915493667125701904296875;
    float _3127 = _3095;
    if (_3109)
    {
        _3127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3129 = _3127;
    int _3131 = as_type<int>(_3129);
    if (_3109)
    {
        out.m_53.x = 0.0;
    }
    float _3133 = _3115 * 6.283185482025146484375;
    float _3135 = cos(_3133);
    if (_3109)
    {
        float _3137 = _3129 * 5.0;
        _3131 = as_type<int>(_3137);
    }
    int _3139 = _3131;
    float _3141 = _3117 * 6.283185482025146484375;
    float _3143 = sin(_3141);
    if (_3109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9337 = as_type<float>(_3139);
        out.gl_Position.z = _9337;
    }
    float _3145 = _3117 * 6.283185482025146484375;
    float _3147 = cos(_3145);
    float _3149 = _3125 * 6.283185482025146484375;
    float _3151 = sin(_3149);
    if (_3109)
    {
        return out;
    }
    float _3153 = in.m_91.x;
    float _3155 = in.m_91.y;
    float _3157 = in.m_91.z;
    float _3159 = _3125 * 6.283185482025146484375;
    float _3161 = cos(_3159);
    float _3163 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3165 = _2601 * _2975;
    float _3167 = _3123 * _3143;
    float _3169 = _3135 * _3147;
    float _3171 = _3135 * _3143;
    float _3173 = _3163 * _3165;
    float _3175 = _3123 * _3147;
    float _3177 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3179 = fma(_3151, _3169, _3167);
    float _3181 = fma(_3151, _3167, _3169);
    float _3183 = -_3171;
    float _3185 = fma(_3151, _3175, _3183);
    float _3187 = _3177 * _3165;
    float _3189 = _3135 * _3161;
    float _3191 = _3147 * _3161;
    float _3193 = _3123 * _3161;
    float _3195 = _3143 * _3161;
    float _3197 = -_3175;
    float _3199 = fma(_3151, _3171, _3197);
    float _3201 = _3179 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3203 = _3179 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3155);
    float _3207 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3157);
    float _3209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3153);
    float _3211 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3203);
    float _3213 = _3173 * _3205;
    float _3215 = _3187 * _3207;
    float _3217 = _3179 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3219 = _2999 * _3209;
    float _3221 = _3189 * _3213;
    float _3223 = -_3213;
    float _3225 = _3151 * _3223;
    float _3227 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3217);
    float _3229 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3201);
    float _3231 = fma(_3179, _3219, _3221);
    float _3233 = fma(_3191, _3219, _3225);
    float _3235 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3237 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3239 = _3193 * _3213;
    float _3241 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3243 = fma(_3199, _3215, _3231);
    float _3245 = fma(_3195, _3215, _3233);
    float _3247 = fma(_3185, _3219, _3239);
    float _3249 = -_3151;
    float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3241);
    float _3253 = _3243 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3255 = _3243 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3257 = fma(_3181, _3215, _3247);
    float _3259 = -_3151;
    float _3261 = fma(_3259, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3237);
    float _3263 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3253);
    float _3265 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3255);
    float _3267 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3211);
    float _3269 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3227);
    float _3271 = fma(_3257, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3263);
    float _3273 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3229);
    float _3275 = -_3151;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3235);
    float _3279 = _3199 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3281 = fma(_3257, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3265);
    float _3283 = _3271 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3285 = in.m_93.x;
    float _3287 = in.m_93.y;
    float _3289 = in.m_93.z;
    float _3291 = fma(_3195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3279);
    bool _3293 = _3155 != 0.0;
    bool _3295 = isnan(_3155);
    bool _3297 = _3293 || _3295;
    bool _3299 = isnan(0.0);
    bool _3301 = _3297 || _3299;
    float _3303 = _3281 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3305 = _2085 + _3283;
    float _3307 = _3199 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3309 = _3199 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3311 = _3153 == 0.0;
    bool _3313 = !_3301;
    bool _3315 = _3311 && _3313;
    float _3317 = _1593 + _3303;
    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3321 = _3305 + _3319;
    float _3323 = fma(_3193, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3277);
    bool _3325 = _3157 == 0.0;
    bool _3327 = _3325 && _3315;
    float _3329 = fma(_3195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3307);
    float _3331 = fma(_3195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3309);
    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3335 = _3317 + _3333;
    float _3337 = _3321 * _3321;
    float _3339 = in.m_95.x;
    float _3341 = in.m_95.y;
    float _3343 = in.m_95.z;
    float _3345 = in.m_95.w;
    float _3347 = fma(_3193, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3261);
    float _3349 = fma(_3193, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3251);
    float _3351 = fma(_3335, _3335, _3337);
    float _3353 = fma(_3181, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3291);
    float _3355 = _3243 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3357 = fma(_3181, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3331);
    float _3359 = sqrt(_3351);
    float _3361 = _3251;
    float _3363 = _3193;
    float _3365 = _3273;
    if (_3327)
    {
        _2643 = _3285;
    }
    float _3367 = _2643;
    float _3369 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3355);
    float _3371 = _3367;
    if (_3327)
    {
        _3027 = _3287;
    }
    float _3373 = _3027;
    float _3375 = _3373;
    if (_3327)
    {
        _3029 = _3289;
    }
    float _3377 = _3029;
    float _3379 = fma(_3257, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3369);
    float _3381 = _3377;
    if (_3327)
    {
        _1657 = _3367;
    }
    float _3383 = _1657;
    float _3385 = _3383;
    if (_3327)
    {
        _3361 = _3373;
    }
    float _3387 = _3361;
    float _3389 = _3387;
    if (_3327)
    {
        _3363 = _3377;
    }
    float _3391 = _3363;
    float _3393 = _3391;
    if (!_3327)
    {
        _3371 = _3285;
    }
    float _3395 = _3371;
    if (!_3327)
    {
        _3375 = _3287;
    }
    float _3397 = _3375;
    float _3399 = fma(_3181, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3329);
    if (!_3327)
    {
        _3381 = _3289;
    }
    float _3401 = _3381;
    if (!_3327)
    {
        float _3403 = fma(_3153, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3395);
        _3385 = _3403;
    }
    float _3405 = _3385;
    float _3407 = _3323 * _3341;
    if (!_3327)
    {
        float _3409 = fma(_3155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3397);
        _3389 = _3409;
    }
    float _3411 = _3389;
    float _3413 = _3343 * _3395;
    float _3415 = _3413;
    if (!_3327)
    {
        float _3417 = fma(_3157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3401);
        _3393 = _3417;
    }
    float _3419 = _3393;
    bool _3421 = _3359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3423 = _3347 * _3341;
    float _3425 = fma(_3273, _3339, _3407);
    float _3427 = _3339 * _3397;
    float _3429 = _3349 * _3341;
    float _3431 = fma(_3267, _3339, _3423);
    float _3433 = _3379 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3435 = -_3413;
    float _3437 = fma(_3339, _3401, _3435);
    float _3439 = -_3427;
    float _3441 = fma(_3341, _3395, _3439);
    float _3443 = fma(_3269, _3339, _3429);
    float _3445 = _1491 + _3433;
    float _3447 = _3341 * _3401;
    float _3449 = _3433;
    float _3451 = _3427;
    if (!_3421)
    {
        _3449 = _3317;
    }
    float _3453 = _3449;
    float _3455 = _3453;
    if (!_3421)
    {
        _3451 = _3305;
    }
    float _3457 = _3451;
    float _3459 = _3457;
    if (!_3421)
    {
        _3415 = _3445;
    }
    float _3461 = _3415;
    bool _3463 = !_3421;
    float _3465 = _3461;
    if (!_3463)
    {
        float _3467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3469 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3471 = _3359 + _3469;
        float _3473 = _3445 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3475 = rsqrt(_3351);
        float _3477 = _3471 * _3467;
        float _3479 = _3477 * 0.15915493667125701904296875;
        float _3481 = _3479 * 6.283185482025146484375;
        float _3483 = cos(_3481);
        float _3485 = _3479 * 6.283185482025146484375;
        float _3487 = sin(_3485);
        float _3489 = _3483 + (-1.0);
        float _3491 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3493 = fma(_3487, _3473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3495 = fma(_3445, _3483, _3491);
        float _3497 = _3475 * _3493;
        float _3499 = fma(_3335, _3497, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3501 = fma(_3321, _3497, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3465 = _3495;
        _3455 = _3499;
        _3459 = _3501;
    }
    float _3503 = _3465;
    float _3505 = _3455;
    float _3507 = _3459;
    float _3509 = -_2269;
    float _3511 = _3509 + _3503;
    float _3513 = -_2271;
    float _3515 = _3513 + _3505;
    float _3517 = -_3447;
    float _3519 = fma(_3343, _3397, _3517);
    float _3521 = _3349 * _3411;
    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3525 = _3511 + _3523;
    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3529 = _3515 + _3527;
    float _3531 = _3519 * _3345;
    float _3533 = _3441 * _3345;
    float _3535 = _3525 * _3525;
    float _3537 = _3437 * _3345;
    float _3539 = _3347 * _3411;
    float _3541 = fma(_3353, _3343, _3425);
    float _3543 = fma(_3529, _3529, _3535);
    float _3545 = -_2315;
    float _3547 = _3545 + _3507;
    float _3549 = _3323 * _3411;
    float _3551 = _3537 * _3323;
    float _3553 = _3537 * _3347;
    float _3555 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3557 = _3547 + _3555;
    float _3559 = _3537 * _3349;
    float _3561 = fma(_3273, _3405, _3549);
    float _3563 = fma(_3267, _3405, _3539);
    float _3565 = fma(_3557, _3557, _3543);
    float _3567 = fma(_3269, _3405, _3521);
    float _3569 = fma(_3531, _3273, _3551);
    float _3571 = fma(_3531, _3267, _3553);
    float _3573 = fma(_3531, _3269, _3559);
    float _3575 = fma(_3399, _3343, _3431);
    float _3577 = sqrt(_3565);
    float _3579 = fma(_3399, _3419, _3563);
    float _3581 = fma(_3357, _3343, _3443);
    float _3583 = fma(_3353, _3419, _3561);
    float _3585 = fma(_3533, _3353, _3569);
    float _3587 = fma(_3533, _3399, _3571);
    float _3589 = fma(_3533, _3357, _3573);
    float _3591 = fma(_3357, _3419, _3567);
    out.m_97.x = _3541;
    out.m_97.y = _3575;
    out.m_97.z = _3581;
    float _3593 = -_2271;
    float _3595 = _1593 + _3593;
    float _3597 = -_2269;
    float _3599 = _3597 + _1491;
    out.m_99.x = _3585;
    out.m_99.y = _3587;
    out.m_99.z = _3589;
    float _3601 = -_2315;
    float _3603 = _2085 + _3601;
    out.m_101.x = _3583;
    out.m_101.y = _3579;
    out.m_101.z = _3591;
    bool _3605 = _3577 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3607 = isnan(_3577);
    bool _3609 = _3605 || _3607;
    bool _3611 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3613 = _3609 || _3611;
    if (!_3613)
    {
        _3365 = 1.0;
    }
    float _3615 = _3365;
    bool _3617 = !_3613;
    float _3619 = _3615;
    if (!_3617)
    {
        bool _3621 = _3577 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3623 = isnan(_3577);
        bool _3625 = _3621 || _3623;
        bool _3627 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3629 = _3625 || _3627;
        if (!_3629)
        {
            float _3631 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3633 = _3577 + _3631;
            float _3635 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3637 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3635;
            float _3639 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3641 = _3639 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3643 = 1.0 / _3637;
            float _3645 = _3633 * _3643;
            float _3647 = fma(_3645, _3641, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3619 = _3647;
            _3649 = true;
        }
        else
        {
            bool _3651 = _3577 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3653 = isnan(_3577);
            bool _3655 = _3651 || _3653;
            bool _3657 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3659 = _3655 || _3657;
            if (!_3659)
            {
                float _3661 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3663 = _3577 + _3661;
                float _3665 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3667 = _3665 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3669 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3671 = _3669 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3673 = 1.0 / _3667;
                float _3675 = _3663 * _3673;
                float _3677 = fma(_3675, _3671, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3619 = _3677;
                _3649 = true;
            }
            else
            {
                _3619 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3649 = false;
    float _3679 = _3619;
    float _3681 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3683 = _3515 + _3681;
    float _3685 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3687 = _3547 + _3685;
    float _3689 = fma(_3683, _3679, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3691 = fma(_3687, _3679, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3693 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _3695 = _3689 + _3693;
    float _3697 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _3699 = _3691 + _3697;
    float _3701 = fma(_3695, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _3703 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _10313 = float2(_3701, _3703);
    float _3705 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_10313, float2(0.0), isnan(_10313)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_10313, float2(0.0), isnan(_10313)), level(0.0)).x;
    float _3707 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3709 = _3511 + _3707;
    float _3711 = -_2695;
    float _3713 = _3711 + _3595;
    float _3715 = -_2733;
    float _3717 = _3715 + _3603;
    float _3719 = -_3595;
    float _3721 = _3719 + _3689;
    float _3723 = fma(_3709, _3679, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3725 = -_3603;
    float _3727 = _3725 + _3691;
    float _3729 = fma(_3705, 100.0, _3599);
    float _3731 = -_3599;
    float _3733 = _3731 + _3723;
    float _3735 = fma(_3705, 100.0, _3723);
    float _3737 = -_2687;
    float _3739 = _3737 + _3729;
    float _3741 = _3733 * _3733;
    float _3743 = _3739 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3745 = fma(_3721, _3721, _3741);
    float _3747 = fma(_3713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3743);
    float _3749 = fma(_3727, _3727, _3745);
    float _3751 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3747);
    float _3753 = sqrt(_3749);
    float _3755 = _3751 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3757 = _3739 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3759 = 1.0 / _3755;
    float _3761 = fma(_3713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3757);
    float _3763 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3761);
    bool _3765 = _3753 > 0.0;
    float _3767 = _3763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3769 = _3767 + _3755;
    bool _3771 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3773 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3775 = _3771 || _3773;
    bool _3777 = isnan(0.5);
    bool _3779 = _3775 || _3777;
    float _3781 = _3769 * _3759;
    float _3783 = _3781 * 0.5;
    bool _3785 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3789 = _3785 || _3787;
    bool _3791 = isnan(0.5);
    bool _3793 = _3789 || _3791;
    float _3795 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3797 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3795);
    float _3799 = _3705;
    float _3801 = _3723;
    float _3803 = _3689;
    float _3805 = _3691;
    float _3807 = _3739;
    float _3809 = _3717;
    if (!_3765)
    {
        _3799 = _3691;
    }
    float _3811 = _3799;
    float _3813 = _3811;
    if (!_3765)
    {
        _3801 = _3735;
    }
    float _3815 = _3801;
    float _3817 = 1.0 / _3797;
    bool _3819 = !_3765;
    float _3821 = _3815;
    float _3823 = _3815;
    float _3825 = _3817;
    if (!_3819)
    {
        float _3827 = _232 * _232;
        float _3829 = rsqrt(_3749);
        float _3831 = fma(_230, _230, _3827);
        float _3833 = fma(_234, _234, _3831);
        float _3835 = sqrt(_3833);
        float _3837 = _3721 * _3829;
        float _3839 = _3733 * _3829;
        float _3841 = _3727 * _3829;
        bool _3843 = _3835 > 0.0;
        float _3845 = _3829;
        if (!_3843)
        {
            _3821 = _3735;
        }
        float _3847 = _3821;
        _3823 = _3847;
        if (!_3843)
        {
            _3845 = _3691;
        }
        float _3849 = _3845;
        bool _3851 = !_3843;
        _3813 = _3849;
        if (!_3851)
        {
            float _3853 = rsqrt(_3833);
            float _3855 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3857 = _232 * _3853;
            float _3859 = _230 * _3853;
            float _3861 = _3839 * _3857;
            float _3863 = _234 * _3853;
            float _3865 = fma(_3837, _3859, _3861);
            float _3867 = _3855 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3869 = fma(_3841, _3863, _3865);
            float _3871 = _3869 * _3867;
            float _3873 = fma(_230, _3871, _3689);
            float _3875 = fma(_232, _3871, _3735);
            float _3877 = fma(_234, _3871, _3691);
            _3823 = _3875;
            _3803 = _3873;
            _3813 = _3877;
        }
    }
    float _3879 = _3823;
    float _3881 = _3803;
    float _3883 = _3813;
    float _3885 = -_2687;
    float _3887 = _3885 + _3879;
    float _3889 = -_2695;
    float _3891 = _3889 + _3881;
    float _3893 = -_2733;
    float _3895 = _3893 + _3883;
    float _3897 = _3887;
    float _3899 = _3891;
    float _3901 = _3895;
    float _3903 = _3881;
    if (_3793)
    {
        _3031 = 1.0;
    }
    float _3905 = _3031;
    float _3907 = _3905;
    if (!_3779)
    {
        float _3909 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3911 = _3739 + _3909;
        float _3913 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3915 = _3713 + _3913;
        float _3917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3919 = -_3603;
        float _3921 = _3919 + _3883;
        float _3923 = _3911 * _3911;
        float _3925 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3927 = _3717 + _3925;
        float _3929 = -_3595;
        float _3931 = _3929 + _3881;
        float _3933 = -_3729;
        float _3935 = _3933 + _3879;
        float _3937 = fma(_3915, _3915, _3923);
        float _3939 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3941 = fma(_3927, _3927, _3937);
        float _3943 = sqrt(_3941);
        float _3945 = 1.0 / _2975;
        float _3947 = _3939 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3949 = precise::min(_3943, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3951 = _3949 * _3917;
        float _3953 = _3951 * _3945;
        float _3955 = _3947 * _3953;
        float _3957 = _3921 * _3953;
        float _3959 = fma(_3931, _3955, _3713);
        float _3961 = fma(_3935, _3955, _3739);
        float _3963 = fma(_3947, _3957, _3717);
        _3897 = _3961;
        _3899 = _3959;
        _3901 = _3963;
        _3903 = _3931;
    }
    float _3965 = _3897;
    float _3967 = _3899;
    float _3969 = _3901;
    float _3971 = _3903;
    float _3973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3975 = _3817 * _3973;
    float _3977 = _3971;
    if (!_3793)
    {
        float _3979 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3981 = _3979 * 0.15915493667125701904296875;
        float _3983 = _3981 * 6.283185482025146484375;
        float _3985 = cos(_3983);
        float _3987 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3989 = _3987 * 0.15915493667125701904296875;
        float _3991 = _3981 * 6.283185482025146484375;
        float _3993 = sin(_3991);
        float _3995 = 1.0 / _3985;
        float _3997 = _3989 * 6.283185482025146484375;
        float _3999 = cos(_3997);
        float _4001 = _3993 * _3995;
        float _4003 = _3989 * 6.283185482025146484375;
        float _4005 = sin(_4003);
        float _4007 = _3999 * _4001;
        float _4009 = 1.0 / _4007;
        float _4011 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4013 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4011;
        float _4015 = 1.0 / _4013;
        float _4017 = _4005 * _4009;
        float _4019 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4021 = fma(_3975, _4017, _4019);
        float _4023 = _4021 * _4015;
        float _4025 = precise::clamp(_4023, 0.0, 1.0);
        _242 = _3989;
        _3907 = _4025;
    }
    float _4027 = _242;
    float _4029 = _3907;
    float _4031 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4033 = _3965 + _4031;
    float _4035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4037 = _3967 + _4035;
    float _4039 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4041 = _3969 + _4039;
    float _4043 = _4033 * _4033;
    float _4045 = fma(_4037, _4037, _4043);
    float _4047 = fma(_4041, _4041, _4045);
    float _4049 = rsqrt(_4047);
    float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4053 = _4037 * _4051;
    float _4055 = _4041 * _4051;
    float _4057 = _4053 * _4053;
    float _4059 = _4055 * _4055;
    float _4061 = _4057 + _4059;
    float _4063 = sqrt(_4061);
    bool _4065 = _4063 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4069 = _4063 + _4067;
    float _4071 = _4041;
    float _4073 = _4027;
    float _4075 = _4069;
    float _4077 = _4033;
    if (_4065)
    {
        float _4079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4071 = _4079;
    }
    float _4081 = _4071;
    if (_4065)
    {
        float _4083 = rsqrt(_4061);
        _4073 = _4083;
    }
    float _4085 = _4073;
    float _4087 = _4085;
    if (_4065)
    {
        float _4089 = _4069 * _4081;
        _4075 = _4089;
    }
    float _4091 = _4075;
    if (_4065)
    {
        float _4093 = _4091 * 0.15915493667125701904296875;
        _3977 = _4093;
    }
    float _4095 = _3977;
    float _4097 = _4081;
    if (_4065)
    {
        float _4099 = _4095 * 6.283185482025146484375;
        float _4101 = cos(_4099);
        _4097 = _4101;
    }
    float _4103 = _4097;
    float _4105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4107 = precise::max(0.0, _4105);
    float _4109 = _4049;
    float _4111 = _4107;
    if (_4065)
    {
        float _4113 = _4095 * 6.283185482025146484375;
        float _4115 = sin(_4113);
        _4109 = _4115;
    }
    float _4117 = _4109;
    float _4119 = -_4051;
    float _4121 = -_4107;
    float _4123 = fma(_4033, _4119, _4121);
    float _4125 = _4123;
    if (_4065)
    {
        float _4127 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4111 = _4127;
    }
    float _4129 = _4111;
    float _4131 = _4129;
    if (_4065)
    {
        float _4133 = _4103 + (-1.0);
        _4077 = _4133;
    }
    float _4135 = _4077;
    float _4137 = _4135;
    float _4139 = _4117;
    if (_4065)
    {
        float _4141 = fma(_4117, _4129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3825 = _4141;
    }
    float _4143 = _3825;
    if (_4065)
    {
        float _4145 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4131 = _4145;
    }
    float _4147 = _4131;
    if (!_4065)
    {
        _4137 = _4057;
    }
    float _4149 = _4137;
    float _4151 = _4149;
    if (_4065)
    {
        float _4153 = _4085 * _4143;
        _3805 = _4153;
    }
    float _4155 = _3805;
    if (!_4065)
    {
        _4087 = _4053;
    }
    float _4157 = _4087;
    float _4159 = _4157;
    if (_4065)
    {
        float _4161 = fma(_4123, _4103, _4147);
        _4125 = _4161;
    }
    float _4163 = _4125;
    float _4165 = sqrt(_4047);
    float _4167 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4065)
    {
        float _4169 = _4053 * _4155;
        _4159 = _4169;
    }
    float _4171 = _4159;
    if (!_4065)
    {
        _4139 = _4055;
    }
    float _4173 = _4139;
    float _4175 = _4173;
    if (_4065)
    {
        float _4177 = _4055 * _4155;
        _4175 = _4177;
    }
    float _4179 = _4175;
    float _4181 = fma(_3713, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4065)
    {
        float _4183 = _4171 * _4171;
        _4151 = _4183;
    }
    float _4185 = _4151;
    if (!_4065)
    {
        _4167 = _4059;
    }
    float _4187 = _4167;
    float _4189 = _4187;
    if (_4065)
    {
        float _4191 = _4179 * _4179;
        _4189 = _4191;
    }
    float _4193 = _4189;
    float _4195 = fma(_4163, _4163, _4185);
    float _4197 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4199 = floor(_4181);
    float _4201 = _4195 + _4193;
    float _4203 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4197);
    float _4205 = fma(_3717, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4207 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4209 = fma(_4165, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4207);
    float _4211 = precise::clamp(_4209, 0.0, 1.0);
    float _4213 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4203);
    float _4215 = rsqrt(_4201);
    float _4217 = -_4211;
    float _4219 = _4217 + 1.0;
    float _4221 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4223 = _4213 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4227 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4221);
    float _4229 = _4223 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4231 = abs(_4219);
    float _4233 = log2(_4231);
    float _4235 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4237 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4227);
    float _4239 = -_4229;
    float _4241 = fma(_4239, _4225, 1.0);
    float _4243 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4245 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4235);
    float _4247 = _4215 * _4171;
    float _4249 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4243);
    float _4251 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4245);
    float _4253 = _4215 * _4163;
    float _4255 = _4215 * _4179;
    float _4257 = _4247 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4259 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4249);
    float _4261 = _4251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4263 = floor(_4205);
    float _4265 = -_4257;
    float _4267 = fma(_4253, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4265);
    float _4269 = _4259 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4271 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4273 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4275 = -_4255;
    float _4277 = fma(_4275, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4267);
    float _4279 = _4237 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4281 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4271);
    float _4283 = -_4199;
    float _4285 = _4181 + _4283;
    float _4287 = fma(_4277, -0.5, 0.5);
    float _4289 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4281);
    float _4291 = exp2(_4273);
    float _4293 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4295 = fma(_4277, 0.5, 0.5);
    float _4297 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4289);
    float _4299 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4301 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4293);
    float _4303 = -_4263;
    float _4305 = _4205 + _4303;
    float _4307 = _4253 + 1.0;
    float _4309 = log2(_4241);
    float _4311 = fma(_4295, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4313 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4299);
    float _4315 = fma(_4295, _4311, -0.212114393711090087890625);
    float _4317 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4313);
    float _4319 = 1.0 / _4297;
    float _4321 = -_4253;
    float _4323 = fma(_4291, _4307, _4321);
    float _4325 = sqrt(_4287);
    float _4327 = _4309 * 0.693147182464599609375;
    float2 _11295 = float2(_4285, _4305);
    float _4329 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11295, float2(0.0), isnan(_11295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11295, float2(0.0), isnan(_11295)), level(0.0)).x;
    float _4331 = fma(_4295, _4315, 1.570728778839111328125);
    float _4333 = _4327 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4335 = fma(_4323, 0.5, 0.5);
    float _4337 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4301);
    float _4339 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4337);
    float _4341 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4317);
    float _4343 = _4325 * 0.636619746685028076171875;
    float _4345 = _4339 * _4319;
    float _4347 = _4341 * _4319;
    float _4349 = -_4331;
    float _4351 = fma(_4343, _4349, 1.0);
    float _4353 = fma(_4345, 0.5, 0.5);
    float _4355 = fma(_4347, -0.5, 0.5);
    float3 _11347 = float3(_4353, _4355, _4333);
    float _4357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11347, float3(0.0), isnan(_11347)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11347, float3(0.0), isnan(_11347)), level(0.0)).x;
    float3 _11358 = float3(_4353, _4355, _4333);
    float4 _4360 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11358, float3(0.0), isnan(_11358)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11358, float3(0.0), isnan(_11358)), level(0.0)).xyzw;
    float _4362 = _4360.x;
    float _4364 = _4360.y;
    float _4366 = _4360.z;
    float _4368 = _4360.w;
    float2 _11374 = float2(_4351, _4335);
    float3 _4372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11374, float2(0.0), isnan(_11374)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11374, float2(0.0), isnan(_11374)), level(0.0)).xyz;
    float _4374 = _4372.x;
    float _4376 = _4372.y;
    float _4378 = _4372.z;
    float _4380 = abs(_3975);
    float _4382 = log2(_4380);
    float _4384 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4386 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_103.x = _3713;
    out.m_103.y = _3739;
    out.m_103.z = _3717;
    float _4388 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4384);
    bool _4390 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4392 = isnan(_4165);
    bool _4394 = _4390 || _4392;
    bool _4396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4398 = _4394 || _4396;
    bool _4400 = _3975 <= 8000.0;
    bool _4402 = isnan(_3975);
    bool _4404 = _4400 || _4402;
    bool _4406 = isnan(8000.0);
    bool _4408 = _4404 || _4406;
    float _4410 = float(_4408);
    float _4412 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4388);
    float _4414 = exp2(_4386);
    out.m_105.x = _3967;
    out.m_105.y = _3965;
    out.m_105.z = _3969;
    float _4416 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4412);
    float _4418 = _4297 * 0.5;
    float _4420 = _4382 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4422 = in.m_77.x;
    float _4424 = _4339 + _4297;
    float _4426 = _4339;
    if (!_4398)
    {
        _3807 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4428 = _3807;
    out.gl_Position.x = _4339;
    out.gl_Position.y = _4341;
    out.gl_Position.z = _4416;
    out.gl_Position.w = _4297;
    float _4430 = exp2(_4420);
    float _4432 = _4424 * 0.5;
    float _4434 = _4428;
    float _4436 = _4428;
    if (!_4398)
    {
        _3809 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4438 = _3809;
    float _4440 = -_4414;
    float _4442 = _4440 + 1.0;
    float _4444 = _4442 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4446 = -_4444;
    float _4448 = _4446 + 1.0;
    float _4450 = _4448;
    float _4452 = _4444;
    float _4454 = _4438;
    float _4456 = _4438;
    if (!_4398)
    {
        _4426 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4458 = _4426;
    float _4460 = fma(_4430, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4462 = precise::clamp(_4460, 0.0, 1.0);
    float _4464 = fma(_4341, -0.5, _4418);
    float _4466 = fma(_4462, -2.0, 3.0);
    float _4468 = _4462 * _4462;
    float _4470 = _4468 * _4466;
    float _4472 = -_4470;
    float _4474 = _4472 + 1.0;
    float _4476 = fma(_4474, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4470);
    float _4478 = _4416 + _4297;
    float _4480 = _4029 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4482 = _4410 * _4476;
    float _4484 = _4478 * 0.5;
    float _4486 = _4482 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.x = _4432;
    out.m_107.y = _4464;
    out.m_107.z = _4484;
    out.m_107.w = _4297;
    float _4488 = -_4329;
    float _4490 = _4488 + 1.0;
    float _4492 = _4490 * _4486;
    float _4494 = precise::clamp(_4492, 0.0, 1.0);
    float _4496 = -_4494;
    float _4498 = fma(_4496, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4500 = _4498 * _4422;
    float _4502 = _4500 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_109.x = _4502;
    float _4504 = _4444 * _4357;
    float _4506 = _4368 * _4448;
    float _4508 = _4458;
    float _4510 = _4458;
    if (!_4398)
    {
        _4450 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4512 = _4450;
    float _4514 = _4368 * _4504;
    float _4516 = _4378 * _4504;
    float _4518 = _4514;
    float _4520 = _4512;
    float _4522 = _4512;
    if (!_4398)
    {
        _4452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4524 = _4452;
    float _4526 = fma(_4374, _4514, _4362);
    float _4528 = fma(_4376, _4514, _4364);
    float _4530 = fma(_4368, _4516, _4366);
    float _4532 = _4524;
    float _4534 = _4524;
    if (!_4398)
    {
        _4518 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4536 = _4518;
    out.m_111.x = _4526;
    out.m_111.y = _4528;
    out.m_111.z = _4530;
    out.m_111.w = _4506;
    bool _4538 = !_4398;
    float _4540 = _4536;
    float _4542 = _4536;
    if (!_4538)
    {
        bool _4544 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4546 = isnan(_4165);
        bool _4548 = _4544 || _4546;
        bool _4550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4552 = _4548 || _4550;
        if (!_4552)
        {
            float _4554 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4556 = _4165 + _4554;
            float _4558 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4560 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4558;
            float _4562 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4564 = _4562 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4566 = 1.0 / _4560;
            float _4568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4570 = _4568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4572 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4574 = _4572 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4578 = _4576 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4580 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4582 = _4580 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4584 = _4556 * _4566;
            float _4586 = precise::clamp(_4584, 0.0, 1.0);
            float _4588 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4590 = _4588 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4592 = fma(_4586, _4564, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4594 = fma(_4586, _4590, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4596 = fma(_4586, _4570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4598 = fma(_4586, _4574, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4600 = fma(_4586, _4578, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4602 = fma(_4586, _4582, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4510 = _4592;
            _4534 = _4600;
            _4436 = _4596;
            _4522 = _4598;
            _4456 = _4594;
            _4542 = _4602;
            _4604 = true;
        }
        else
        {
            bool _4606 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4608 = isnan(_4165);
            bool _4610 = _4606 || _4608;
            bool _4612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4614 = _4610 || _4612;
            if (!_4614)
            {
                _4434 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4616 = _4434;
            _4436 = _4616;
            if (!_4614)
            {
                _4508 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4618 = _4508;
            _4510 = _4618;
            if (!_4614)
            {
                _4454 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4620 = _4454;
            _4456 = _4620;
            if (!_4614)
            {
                _4520 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4622 = _4520;
            _4522 = _4622;
            if (!_4614)
            {
                _4532 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4624 = _4532;
            _4534 = _4624;
            if (!_4614)
            {
                _4540 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4626 = _4540;
            bool _4628 = !_4614;
            _4542 = _4626;
            if (!_4628)
            {
                bool _4630 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4632 = isnan(_4165);
                bool _4634 = _4630 || _4632;
                bool _4636 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4638 = _4634 || _4636;
                if (!_4638)
                {
                    float _4640 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4642 = _4165 + _4640;
                    float _4644 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4646 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4644;
                    float _4648 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4650 = _4648 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4652 = 1.0 / _4646;
                    float _4654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4656 = _4654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4658 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4660 = _4658 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4662 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4664 = _4662 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4666 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4668 = _4666 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4670 = _4642 * _4652;
                    float _4672 = precise::clamp(_4670, 0.0, 1.0);
                    float _4674 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4676 = _4674 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4678 = fma(_4672, _4650, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4680 = fma(_4672, _4676, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4682 = fma(_4672, _4656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4684 = fma(_4672, _4660, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4686 = fma(_4672, _4664, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4688 = fma(_4672, _4668, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4510 = _4678;
                    _4534 = _4686;
                    _4436 = _4682;
                    _4522 = _4684;
                    _4456 = _4680;
                    _4542 = _4688;
                    _4604 = true;
                }
                else
                {
                    _4510 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4534 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4436 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4522 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4456 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4542 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4604 = false;
    float _4690 = _4510;
    float _4692 = _4534;
    float _4694 = _4436;
    float _4696 = _4522;
    float _4698 = _4456;
    float _4700 = _4542;
    float _4702 = fma(_3579, -0.5, 0.5);
    float _4704 = precise::clamp(_4702, 0.0, 1.0);
    float _4706 = -_4690;
    float _4708 = _4706 + _4692;
    float _4710 = _4480 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4712 = -_4694;
    float _4714 = _4712 + _4696;
    float _4716 = fma(_4704, _4708, _4690);
    out.m_113.x = 0.0;
    float _4718 = -_4698;
    float _4720 = _4718 + _4700;
    float _4722 = fma(_4704, _4714, _4694);
    float _4724 = _4716 * 0.586610972881317138671875;
    out.m_53.x = _4710;
    bool _4726 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4728 = fma(_4704, _4720, _4698);
    float _4730 = fma(_4722, 0.298911988735198974609375, _4724);
    bool _4732 = _4029 > 0.0;
    bool _4734 = isnan(_4029);
    bool _4736 = _4732 || _4734;
    bool _4738 = isnan(0.0);
    bool _4740 = _4736 || _4738;
    float _4742 = fma(_4728, 0.114477999508380889892578125, _4730);
    float _4744 = -_4742;
    float _4746 = _4722 + _4744;
    float _4748 = -_4742;
    float _4750 = _4716 + _4748;
    float _4752 = -_4742;
    float _4754 = _4728 + _4752;
    float _4756 = fma(_4746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4742);
    float _4758 = fma(_4750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4742);
    float _4760 = fma(_4754, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4742);
    bool _4762 = !_4726;
    if (!_4762)
    {
        float _4764 = -_3965;
        float _4766 = _4764 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4768 = -_3967;
        float _4770 = _4768 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4772 = -_3969;
        float _4774 = _4772 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4776 = _4766 * _4766;
        float _4778 = fma(_4770, _4770, _4776);
        float _4780 = fma(_4774, _4774, _4778);
        float _4782 = sqrt(_4780);
        float _4784 = rsqrt(_4780);
        float _4786 = -_4782;
        float _4788 = _4786 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4790 = _4788 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4792 = precise::clamp(_4790, 0.0, 1.0);
        float _4794 = _4770 * _4784;
        float _4796 = _4766 * _4784;
        float _4798 = abs(_4792);
        float _4800 = log2(_4798);
        float _4802 = _4774 * _4784;
        float _4804 = _4794 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4806 = _3579 * _4796;
        float _4808 = -_4796;
        float _4810 = -_4804;
        float _4812 = fma(_4808, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4810);
        float _4814 = fma(_3583, _4794, _4806);
        float _4816 = -_4802;
        float _4818 = fma(_4816, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4812);
        float _4820 = fma(_3591, _4802, _4814);
        float _4822 = precise::clamp(_4820, 0.0, 1.0);
        float _4824 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4826 = _4818 + _4824;
        float _4828 = _4800 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4830 = _4826 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4832 = precise::clamp(_4830, 0.0, 1.0);
        float _4834 = exp2(_4828);
        float _4836 = _4834 * _4832;
        float _4838 = _4822 * _4836;
        float _4840 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4842 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4844 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4840;
        out.m_113.y = _4842;
        out.m_113.z = _4844;
    }
    out.m_79.x = _4756;
    out.m_79.y = _4758;
    out.m_79.z = _4760;
    if (_4740)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4846 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4846;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4604 = false;
    bool _3649 = false;
    bool _672 = false;
    bool _530 = false;
    bool _388 = false;
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4903 = as_type<float>(_148);
        out.gl_Position.z = _4903;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4973 = as_type<float>(_186);
        out.gl_Position.z = _4973;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_57.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.y;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = in.m_65.x;
    float _214 = in.m_65.y;
    float _216 = in.m_65.z;
    out.m_67.x = _188;
    out.m_67.y = _192;
    float _218 = _196 * _202;
    float _220 = _196 * _208;
    float _222 = fma(_194, _200, _218);
    float _224 = _196 * _214;
    float _226 = fma(_194, _206, _220);
    float _228 = fma(_194, _212, _224);
    float _230 = fma(_198, _204, _222);
    float _232 = fma(_198, _210, _226);
    float _234 = fma(_198, _216, _228);
    bool _236 = !_190;
    float _238 = _192;
    float _240 = _188;
    float _242 = _234;
    float _260;
    if (!_236)
    {
        float _244 = in.m_69.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_132);
        float _266 = 1.0 / _264;
        float _268 = _166 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _270 + _272;
    bool _276 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _278 = isnan(_270);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = 1.0 / _290;
    bool _294 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _296 = isnan(_270);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -_286;
    float _308 = _306 + 1.0;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _314;
    bool _318 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = _304 * _308;
    float _326 = -_304;
    float _328 = _326 + 1.0;
    float _330 = _274 * _292;
    float _332 = in.m_71.x;
    float _334 = in.m_71.y;
    float _336 = in.m_71.z;
    float _338 = fma(_312, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _340 = fma(_322, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _342 = fma(_316, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _344 = _338 * _324;
    float _346 = _340 * _324;
    float _348 = _342 * _324;
    float _350 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _352 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _354 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].z, _348);
    float _356 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[144].x, _350);
    float _358 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[144].y, _352);
    float _360 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[144].z, _354);
    float _362 = _356 * _332;
    float _364 = _358 * _334;
    float _366 = _360 * _336;
    bool _368 = !_318;
    float _386;
    if (!_368)
    {
        float _370 = in.m_69.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_132);
        float _392 = 1.0 / _390;
        float _394 = _166 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _400 = _396 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _406 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_396);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _422 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _424 = isnan(_396);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _434;
    bool _438 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _440 = isnan(_396);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = 1.0 / _404;
    float _452 = -_416;
    float _454 = _452 + 1.0;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _458 = _432 * _454;
    float _460 = -_432;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _420;
    float _466 = _436 * _450;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _472 = fma(_466, _400, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _474 = -_448;
    float _476 = _474 + 1.0;
    float _478 = _472 * _458;
    float _480 = _470 * _464;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _484 = _396 + _482;
    float _486 = _416 * _476;
    float _488 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _490 = fma(_480, _484, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _492 = fma(_490, _486, _488);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _500 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[117].x, _492);
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _502;
    out.m_73.y = _504;
    out.m_73.z = _506;
    out.m_73.w = _508;
    bool _510 = !_456;
    float _528;
    if (!_510)
    {
        float _512 = in.m_69.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_132);
        float _534 = 1.0 / _532;
        float _536 = _166 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _542 = _538 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _548 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _550 = isnan(_538);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _564 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _566 = isnan(_538);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _576;
    bool _580 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _582 = isnan(_538);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _546;
    float _594 = -_558;
    float _596 = _594 + 1.0;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _600 = _574 * _596;
    float _602 = -_574;
    float _604 = _602 + 1.0;
    float _606 = 1.0 / _562;
    float _608 = _578 * _592;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _614 = fma(_608, _542, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _616 = -_590;
    float _618 = _616 + 1.0;
    float _620 = _614 * _600;
    float _622 = _612 * _606;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _626 = _538 + _624;
    float _628 = _558 * _618;
    float _630 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[131].x, _620);
    float _632 = fma(_622, _626, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _634 = fma(_632, _628, _630);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _642 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[133].x, _634);
    float _644 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _642 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _644;
    out.m_75.y = _646;
    out.m_75.z = _648;
    out.m_75.w = _650;
    bool _652 = !_598;
    float _670;
    if (!_652)
    {
        float _654 = in.m_69.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_132);
        float _676 = 1.0 / _674;
        float _678 = _166 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _684 = int(_682);
    float _686 = in.m_69.x;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _690 = _680 + _688;
    float _692 = float(_132);
    float _694 = in.m_77.y;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _698 = _696 != 0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _702 = _680 + _700;
    float _704 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _706 = int(_704);
    float _708 = in.m_61.w;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _712 = _680 + _710;
    float _714 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _716 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _718 = int(_716);
    float _720 = float(_684);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _726 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _728 = isnan(_680);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    bool _738 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _740 = isnan(_680);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = 1.0 / _720;
    float _752 = float(uint(_706));
    int _754 = ~_706;
    int _756 = _754 + 1;
    bool _758 = _706 == 0;
    float _760 = 1.0 / _752;
    int _762 = ~_706;
    int _764 = _762 + 1;
    float _766 = float(_718);
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _770 = _750 * _166;
    float _772 = 1.0 / _766;
    int _774 = as_type<int>(_760) + (-2);
    float _776 = trunc(_770);
    int _778 = int(_776);
    float _780 = float(_706);
    float _782 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _784 = int(_782);
    float _786 = _772 * _166;
    float _788 = float(uint(_778));
    float _790 = trunc(_786);
    int _792 = int(_790);
    float _794 = as_type<float>(_774) * _788;
    float _796 = float(uint(_784));
    float _798 = 1.0 / _692;
    int _800 = ~_784;
    int _802 = _800 + 1;
    float _804 = trunc(_794);
    float _806 = precise::max(_804, 0.0);
    uint _809 = uint(_806);
    float _811 = 1.0 / _796;
    int _813 = _764 * int(_809);
    int _815 = _813 + _778;
    float _817 = 1.0 / _724;
    float _819 = float(uint(_815));
    int _821 = as_type<int>(_811) + (-2);
    float _823 = as_type<float>(_774) * _819;
    float _825 = _819;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _829 = as_type<float>(_784);
    if (_698)
    {
        _825 = 1.0;
    }
    float _831 = _825;
    float _833 = _831;
    if (!_698)
    {
        _833 = 7.345489978790283203125;
    }
    float _835 = _833;
    float _837 = trunc(_823);
    float _839 = precise::max(_837, 0.0);
    uint _841 = uint(_839);
    float _843 = _835 * _686;
    float _845 = floor(_843);
    int _847 = int(_809) + int(_841);
    float _849 = float(_778);
    float _851 = float(uint(_792));
    int _853 = _756 * _847;
    int _855 = _853 + _778;
    bool _857 = _849 >= _780;
    bool _859 = isnan(_849);
    bool _861 = _857 || _859;
    bool _863 = isnan(_780);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -_845;
    float _871 = _843 + _869;
    float _873 = as_type<float>(_821) * _851;
    bool _875 = uint(_855) >= uint(_706);
    float _877 = trunc(_867);
    int _879 = int(_877);
    bool _881 = !_875;
    int _883 = _881 ? 0 : (-1);
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _891 = _889 != 0;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _895 = _893 != 0;
    int _897 = ~_847;
    int _899 = _897 + _883;
    int _901 = _899 + 1;
    float _903 = trunc(_873);
    float _905 = precise::max(_903, 0.0);
    uint _907 = uint(_905);
    float _909 = in.m_69.y;
    float _911 = _780 * _166;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _915 = _913 != 0;
    int _917 = _706 * _901;
    int _919 = _917 + _778;
    float _921 = _911 * _798;
    int _923 = ~_879;
    int _925 = _923 + 1;
    int _927 = _925 + 1;
    bool _929 = !_758;
    float _931 = _929 ? as_type<float>(_919) : as_type<float>(0xffffffffu /* nan */);
    float _933 = _871 * _780;
    float _935 = _871;
    float _937 = _931;
    if (_698)
    {
        _935 = _686;
    }
    float _939 = _935;
    float _941 = trunc(_921);
    int _943 = int(_941);
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _947 = _945 != 0;
    int _949 = as_type<int>(_931) * _927;
    float _951 = _939;
    if (_698)
    {
        _937 = 1.0;
    }
    float _953 = _937;
    float _955 = _953;
    if (!_698)
    {
        _955 = 1.2345600128173828125;
    }
    float _957 = _955;
    int _959 = _802 * int(_907);
    int _961 = _959 + _792;
    int _963 = _706 + (-1);
    float _965 = trunc(_933);
    int _967 = int(_965);
    if (!_698)
    {
        _951 = _909;
    }
    float _969 = _951;
    float _971 = float(uint(_961));
    int _973 = _879 * _963;
    int _975 = _973 + _949;
    bool _977 = !_915;
    int _979 = _977 ? 0 : 1;
    float _981 = _969 * _957;
    bool _983 = !_891;
    int _985 = _983 ? 0 : 1;
    float _987 = as_type<float>(_821) * _971;
    bool _989 = !_887;
    int _991 = _989 ? 0 : 1;
    int _993 = abs(_979);
    int _995 = abs(_985);
    float _997 = trunc(_987);
    float _999 = precise::max(_997, 0.0);
    uint _1001 = uint(_999);
    bool _1003 = !_895;
    int _1005 = _1003 ? 0 : 1;
    int _1007 = abs(_991);
    int _1009 = _975 * _995;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1013 = _1011 != 0;
    float _1015 = floor(_981);
    int _1017 = abs(_1005);
    int _1019 = _967 * _993;
    int _1021 = _1019 + _778;
    bool _1023 = !_1013;
    int _1025 = _1023 ? 0 : 1;
    bool _1027 = _784 == 0;
    int _1029 = _943 * _1007;
    int _1031 = _1029 + _1009;
    int _1033 = abs(_1025);
    int _1035 = int(_907) + int(_1001);
    int _1037 = _1021 * _1017;
    int _1039 = _1037 + _1031;
    int _1041 = ~_784;
    int _1043 = _1041 + 1;
    float _1045 = -_1015;
    float _1047 = _981 + _1045;
    float _1049 = float(_784);
    int _1051 = _967 * _1033;
    int _1053 = _1051 + _1039;
    float _1055 = float(_792);
    int _1057 = _1043 * _1035;
    int _1059 = _1057 + _792;
    float _1061 = _1049 * _1047;
    bool _1063 = _1055 >= _1049;
    bool _1065 = isnan(_1055);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(_1049);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = float(uint(_1053));
    bool _1077 = uint(_1059) >= uint(_784);
    float _1079 = trunc(_1061);
    int _1081 = int(_1079);
    float _1083 = as_type<float>(_774) * _1075;
    bool _1085 = !_1077;
    int _1087 = _1085 ? 0 : (-1);
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1091 = _1089 != 0;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1095 = _1093 != 0;
    int _1097 = ~_1035;
    int _1099 = _1097 + _1087;
    int _1101 = _1099 + 1;
    float _1103 = trunc(_1073);
    int _1105 = int(_1103);
    int _1107 = ~_706;
    int _1109 = _1107 + 1;
    int _1111 = _784 * _1101;
    int _1113 = _1111 + _792;
    float _1115 = _1049 * _166;
    float _1117 = trunc(_1083);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = _1115 * _798;
    bool _1125 = !_1027;
    int _1127 = _1125 ? _1113 : (-1);
    int _1129 = ~_1105;
    int _1131 = _1129 + 1;
    int _1133 = _1131 + 1;
    float _1135 = trunc(_1123);
    int _1137 = int(_1135);
    bool _1139 = !_1091;
    int _1141 = _1139 ? 0 : 1;
    int _1143 = _1133 * _1127;
    int _1145 = _784 + (-1);
    int _1147 = _1109 * int(_1121);
    int _1149 = _1147 + _1053;
    bool _1151 = !_947;
    int _1153 = _1151 ? 0 : 1;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1161 = _1159 != 0;
    int _1163 = _1105 * _1145;
    int _1165 = _1163 + _1143;
    float _1167 = float(uint(_1149));
    bool _1169 = !_1095;
    int _1171 = _1169 ? 0 : 1;
    bool _1173 = !_1157;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = as_type<float>(_774) * _1167;
    int _1179 = abs(_1171);
    int _1181 = abs(_1153);
    float _1183 = trunc(_1177);
    float _1185 = precise::max(_1183, 0.0);
    uint _1187 = uint(_1185);
    int _1189 = abs(_1141);
    int _1191 = _1165 * _1179;
    int _1193 = abs(_1175);
    bool _1195 = !_1161;
    int _1197 = _1195 ? 0 : 1;
    int _1199 = _1081 * _1181;
    int _1201 = _1199 + _792;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1205 = _1203 != 0;
    int _1207 = _1137 * _1189;
    int _1209 = _1207 + _1191;
    int _1211 = abs(_1197);
    float _1213 = in.m_69.z;
    int _1215 = ~_706;
    int _1217 = _1215 + 1;
    int _1219 = _1201 * _1193;
    int _1221 = _1219 + _1209;
    int _1223 = int(_1121) + int(_1187);
    float _1225 = in.m_69.w;
    int _1227 = _1081 * _1211;
    int _1229 = _1227 + _1221;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1233 = _1231 != 0;
    int _1235 = ~_784;
    int _1237 = _1235 + 1;
    int _1239 = _1217 * _1223;
    int _1241 = _1239 + _1053;
    float _1243 = float(uint(_1229));
    int _1245 = _1211;
    float _1247 = as_type<float>(_1137);
    int _1249 = _1209;
    float _1251 = as_type<float>(_1081);
    if (_1205)
    {
        float _1253 = -_188;
        float _1255 = _1253 + 1.0;
        _1245 = as_type<int>(_1255);
    }
    int _1257 = _1245;
    if (!_1205)
    {
        _1247 = _188;
    }
    float _1259 = _1247;
    bool _1261 = uint(_1241) >= uint(_706);
    float _1263 = as_type<float>(_821) * _1243;
    bool _1265 = _706 == 0;
    bool _1267 = !_1261;
    int _1269 = _1267 ? 0 : (-1);
    float _1271 = trunc(_1263);
    float _1273 = precise::max(_1271, 0.0);
    uint _1275 = uint(_1273);
    bool _1277 = _1261;
    float _1279 = _1259;
    if (_1205)
    {
        bool _1281 = _686 > 0.5;
        _1277 = _1281;
    }
    bool _1283 = _1277;
    if (_1233)
    {
        float _1285 = -_188;
        float _1287 = _1285 + 1.0;
        _1249 = as_type<int>(_1287);
    }
    int _1289 = _1249;
    int _1291 = ~_1223;
    int _1293 = _1291 + _1269;
    int _1295 = _1293 + 1;
    if (_1205)
    {
        float _1297 = _1283 ? as_type<float>(_1257) : _188;
        _1279 = _1297;
    }
    float _1299 = _1279;
    bool _1301 = _909 > 0.5;
    int _1303 = _706 * _1295;
    int _1305 = _1303 + _1053;
    float _1307 = -_192;
    float _1309 = _1307 + 1.0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1313 = _1311 != 0;
    bool _1315 = _1213 > 0.5;
    int _1317 = _1301 ? as_type<int>(_1309) : as_type<int>(_192);
    int _1319 = _1237 * int(_1275);
    int _1321 = _1319 + _1229;
    bool _1323 = _1225 > 0.5;
    bool _1325 = !_1265;
    int _1327 = _1325 ? _1305 : (-1);
    float _1329 = float(uint(_1321));
    if (!_1233)
    {
        _1251 = _188;
    }
    float _1331 = _1251;
    float _1333 = _1331;
    if (_1233)
    {
        float _1335 = _1315 ? as_type<float>(_1289) : _188;
        _1333 = _1335;
    }
    float _1337 = _1333;
    float _1339 = as_type<float>(_821) * _1329;
    float _1341 = _1313 ? as_type<float>(_1317) : _192;
    int _1343 = _1327 & 3;
    bool _1345 = _1343 != 0;
    float _1347 = trunc(_1339);
    float _1349 = precise::max(_1347, 0.0);
    uint _1351 = uint(_1349);
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1355 = _1353 != 0;
    int _1357 = _1323 ? as_type<int>(_1309) : as_type<int>(_192);
    int _1359 = _1327 & 3;
    bool _1361 = _1359 != 0;
    int _1363 = _1345 ? 0 : 1;
    float _1365 = _1355 ? as_type<float>(_1357) : _192;
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1369 = _1367 != 0;
    bool _1371 = uint(_1359) > 1u;
    int _1373 = ~_1363;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    int _1379 = int(_1275) + int(_1351);
    int _1381 = ~_784;
    int _1383 = _1381 + 1;
    int _1385 = _1377;
    if (_1369)
    {
        float _1387 = _1315 ? _1309 : _192;
        _238 = _1387;
    }
    float _1389 = _238;
    int _1391 = _1383 * _1379;
    int _1393 = _1391 + _1229;
    float _1395 = as_type<float>(_1393);
    if (!_1371)
    {
        int _1397 = ~_1363;
        int _1399 = _1397 + 1;
        _1385 = _1399;
    }
    int _1401 = _1385;
    float _1403 = in.m_50.x;
    float _1405 = in.m_50.y;
    float _1407 = in.m_50.z;
    bool _1409 = _1359 != 3;
    bool _1411 = uint(_1359) >= 2u;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1415 = _1413 != 0;
    int _1417 = _1411 ? 0 : 1;
    bool _1419 = _909 > 0.5;
    bool _1421 = _1419 && _1415;
    int _1423 = ~_1417;
    int _1425 = _1423 + 1;
    int _1427 = _1425 + 1;
    int _1429 = _1427;
    if (_1409)
    {
        int _1431 = ~_1417;
        int _1433 = _1431 + 1;
        _1429 = _1433;
    }
    int _1435 = _1429;
    bool _1437 = uint(_1393) >= uint(_784);
    if (!_1415)
    {
        _1395 = _188;
    }
    float _1439 = _1395;
    bool _1441 = !_1437;
    int _1443 = _1441 ? 0 : (-1);
    float _1445 = _1439;
    if (_1421)
    {
        float _1447 = -_188;
        float _1449 = _1447 + 1.0;
        _240 = _1449;
    }
    float _1451 = _240;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1455 = _1453 != 0;
    float _1457 = _214 * _1405;
    float _1459 = _202 * _1405;
    float _1461 = _208 * _1405;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1467 = fma(_200, _1403, _1459);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1473 = fma(_206, _1403, _1461);
    float _1475 = 1.0 / _1465;
    float _1477 = fma(_212, _1403, _1457);
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1481 = _1479 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1483 = fma(_204, _1407, _1467);
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1485;
    float _1489 = float(uint(_1021));
    float _1491 = _1405 + _694;
    float _1493 = 1.0 / _1471;
    float _1495 = _1487 * _817;
    float _1497 = as_type<float>(_774) * _1489;
    int _1499 = ~_1379;
    int _1501 = _1499 + _1443;
    int _1503 = _1501 + 1;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1509 = _1507 != 0;
    float _1511 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1515 = _1513 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1517;
    int _1521 = _784 * _1503;
    int _1523 = _1521 + _1229;
    float _1525 = -_1505;
    float _1527 = fma(_1511, 2.0, _1525);
    float _1529 = trunc(_1497);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1537 = _909 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1539 = _1515 * _1475;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1545 = _1519 * _1493;
    if (_1415)
    {
        _1445 = _1451;
    }
    float _1547 = _1445;
    float _1549 = fma(_1537, -2.0, _1535);
    bool _1551 = !_1027;
    float _1553 = _1551 ? as_type<float>(_1523) : as_type<float>(0xffffffffu /* nan */);
    float _1555 = fma(_210, _1407, _1473);
    float _1557 = float(uint(_1201));
    float _1559 = 1.0 / _1543;
    int _1561 = ~_706;
    int _1563 = _1561 + 1;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1569 = fma(_216, _1407, _1477);
    float _1571 = as_type<float>(_821) * _1557;
    int _1573 = _1563 * int(_1533);
    int _1575 = _1573 + _1021;
    int _1577 = ~_784;
    int _1579 = _1577 + 1;
    float _1581 = 1.0 / _1481;
    int _1583 = as_type<int>(_1553) & 3;
    bool _1585 = _1583 != 0;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1591 = float(uint(_1575));
    float _1593 = _1483 + _708;
    int _1595 = _1585 ? 0 : 1;
    float _1597 = -_166;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1527);
    bool _1601 = uint(_1583) >= 2u;
    float _1603 = trunc(_1571);
    float _1605 = precise::max(_1603, 0.0);
    uint _1607 = uint(_1605);
    float _1609 = as_type<float>(_774) * _1591;
    int _1611 = _1601 ? 0 : 1;
    bool _1613 = _1583 != 3;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1619 = 1.0 / _1589;
    int _1621 = ~_1611;
    int _1623 = _1621 + 1;
    int _1625 = _1623 + 1;
    float _1627 = _1567 * _1581;
    int _1629 = ~_1595;
    int _1631 = _1629 + 1;
    int _1633 = _1631 + 1;
    bool _1635 = !_1455;
    int _1637 = _1635 ? 0 : 1;
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1641 = _1639 != 0;
    float _1643 = trunc(_1609);
    float _1645 = precise::max(_1643, 0.0);
    uint _1647 = uint(_1645);
    int _1649 = _1625;
    int _1651 = _1633;
    float _1653 = _1555;
    float _1655 = _1553;
    float _1657 = _1549;
    if (_1613)
    {
        int _1659 = ~_1611;
        int _1661 = _1659 + 1;
        _1649 = _1661;
    }
    int _1663 = _1649;
    int _1665 = _1579 * int(_1607);
    int _1667 = _1665 + _1201;
    bool _1669 = uint(_1583) > 1u;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1679 = 1.0 / _1617;
    float _1681 = float(uint(_1667));
    float _1683 = _1673 * _1559;
    float _1685 = _686 * 2.0;
    float _1687 = _1677 * _1619;
    float _1689 = _686 + _909;
    float _1691 = as_type<float>(_821) * _1681;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1693;
    float _1697 = floor(_1685);
    int _1699 = int(_1533) + int(_1647);
    float _1701 = _1689 + (-1.0);
    float _1703 = _909 * 2.0;
    int _1705 = ~_706;
    int _1707 = _1705 + 1;
    float _1709 = fma(_1687, _690, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    if (!_1669)
    {
        int _1711 = ~_1595;
        int _1713 = _1711 + 1;
        _1651 = _1713;
    }
    int _1715 = _1651;
    float _1717 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1719 = trunc(_1691);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    float _1725 = _909 + _1213;
    float _1727 = _1695 * _1679;
    int _1729 = _1707 * _1699;
    int _1731 = _1729 + _1021;
    int _1733 = ~_784;
    int _1735 = _1733 + 1;
    float _1737 = _1725 + (-1.0);
    float _1739 = fma(_1727, _712, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1741 = _1697 > 0.0;
    float _1743 = floor(_1703);
    bool _1745 = _1697 >= 0.0;
    bool _1747 = isnan(_1697);
    bool _1749 = _1745 || _1747;
    bool _1751 = isnan(0.0);
    bool _1753 = _1749 || _1751;
    float _1755 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1757 = _1213 * 2.0;
    bool _1759 = !_1509;
    int _1761 = _1759 ? 0 : 1;
    int _1763 = _1753 ? 0 : 1;
    int _1765 = int(_1607) + int(_1723);
    bool _1767 = uint(_1731) >= uint(_706);
    int _1769 = ~_1763;
    int _1771 = _1769 + 1;
    int _1773 = _1771 + 1;
    int _1775 = _1735 * _1765;
    int _1777 = _1775 + _1201;
    int _1779 = _1773;
    if (!_1741)
    {
        int _1781 = ~_1763;
        int _1783 = _1781 + 1;
        _1779 = _1783;
    }
    int _1785 = _1779;
    bool _1787 = !_1767;
    int _1789 = _1787 ? 0 : (-1);
    bool _1791 = uint(_1777) >= uint(_784);
    float _1793 = floor(_1757);
    bool _1795 = _1743 > 0.0;
    bool _1797 = _1743 >= 0.0;
    bool _1799 = isnan(_1743);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    int _1807 = ~_1699;
    int _1809 = _1807 + _1789;
    int _1811 = _1809 + 1;
    int _1813 = as_type<int>(_1743);
    if (_1641)
    {
        _1813 = 0;
    }
    int _1815 = _1813;
    int _1817 = _1815;
    if (_1641)
    {
        _827 = 0;
    }
    int _1819 = _827;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1823 = _680 + _1821;
    int _1825 = _1805 ? 0 : 1;
    int _1827 = _706 * _1811;
    int _1829 = _1827 + _1021;
    int _1831 = _1819;
    if (!_1641)
    {
        _1817 = 1;
    }
    int _1833 = _1817;
    float _1835 = fma(_1539, _1823, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    if (!_1641)
    {
        _1831 = 2;
    }
    int _1837 = _1831;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1841 = _1839 != 0;
    int _1843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1845 = _1843 != 0;
    int _1847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1849 = _1847 != 0;
    bool _1851 = _706 == 0;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1855 = _680 + _1853;
    bool _1857 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1859 = isnan(_680);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1865 = _1861 || _1863;
    float _1867 = float(_1865);
    int _1869 = ~_1825;
    int _1871 = _1869 + 1;
    int _1873 = _1871 + 1;
    float _1875 = fma(_1495, _1855, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1877 = !_1791;
    int _1879 = _1877 ? 0 : (-1);
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1883 = _680 + _1881;
    int _1885 = _1873;
    if (!_1795)
    {
        int _1887 = ~_1825;
        int _1889 = _1887 + 1;
        _1885 = _1889;
    }
    int _1891 = _1885;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1895 = _680 + _1893;
    bool _1897 = _1793 > 0.0;
    bool _1899 = _1793 >= 0.0;
    bool _1901 = isnan(_1793);
    bool _1903 = _1899 || _1901;
    bool _1905 = isnan(0.0);
    bool _1907 = _1903 || _1905;
    float _1909 = -_1867;
    float _1911 = _1909 + 1.0;
    bool _1913 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1915 = isnan(_680);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    bool _1925 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1927 = isnan(_680);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1933 = _1929 || _1931;
    float _1935 = float(_1933);
    bool _1937 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1939 = isnan(_680);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1945 = _1941 || _1943;
    float _1947 = float(_1945);
    float _1949 = _1923 * _1911;
    float _1951 = -_1923;
    float _1953 = _1951 + 1.0;
    float _1955 = fma(_1545, _1883, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1957 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1959 = isnan(_680);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = fma(_1627, _1895, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1971 = -_1935;
    float _1973 = _1971 + 1.0;
    bool _1975 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1977 = isnan(_680);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1983 = _1979 || _1981;
    float _1985 = float(_1983);
    float _1987 = -_1947;
    float _1989 = _1987 + 1.0;
    bool _1991 = !_1851;
    int _1993 = _1991 ? _1829 : (-1);
    float _1995 = _1967 * _1973;
    float _1997 = -_1967;
    float _1999 = _1997 + 1.0;
    float _2001 = -_1985;
    float _2003 = _2001 + 1.0;
    float _2005 = _1935 * _1953;
    bool _2007 = _1833 != 1;
    float _2009 = in.m_63.w;
    float _2011 = _1985 * _1999;
    float _2013 = _1947 * _2003;
    float _2015 = _736 * _1989;
    float _2017 = -_736;
    float _2019 = _2017 + 1.0;
    float _2021 = in.m_65.w;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2025 = _1907 ? 0 : 1;
    float _2027 = _748 * _2019;
    float _2029 = -_748;
    float _2031 = _2029 + 1.0;
    bool _2033 = _1837 != 2;
    float _2035 = fma(_1683, _702, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2037 = _1875 * _2027;
    bool _2039 = !_1841;
    int _2041 = _2039 ? 0 : 1;
    float _2043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2045 = ~_2025;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    float _2051 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2037);
    int _2053 = _2049;
    float _2055 = _2019;
    if (!_1897)
    {
        int _2057 = ~_2025;
        int _2059 = _2057 + 1;
        _2053 = _2059;
    }
    int _2061 = _2053;
    float _2063 = fma(_1835, _2015, _2051);
    int _2065 = as_type<int>(_1553) & 3;
    bool _2067 = _2065 != 0;
    float _2069 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2073 = fma(_1955, _2013, _2063);
    float _2075 = _1555 + _2009;
    float _2077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2079 = _1593 + _2077;
    float _2081 = fma(_2069, _1389, -0.5);
    if (_2033)
    {
        _1653 = _686;
    }
    float _2083 = _1653;
    float _2085 = _1569 + _2021;
    float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2089 = _2075 + _2087;
    float _2091 = _2079 * _2079;
    float _2093 = _2083;
    if (!_2033)
    {
        _2093 = _1213;
    }
    float _2095 = _2093;
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2099 = _2085 + _2097;
    int _2101 = abs(_2041);
    float _2103 = fma(_2089, _2089, _2091);
    float _2105 = float(_2061);
    float _2107 = _2095 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2109 = float(_2101);
    float _2111 = fma(_2099, _2099, _2103);
    bool _2113 = !_2067;
    int _2115 = _2113 ? 0 : 1;
    float _2117 = -_2071;
    float _2119 = fma(_2107, 2.0, _2117);
    bool _2121 = _1359 != 3;
    float _2123 = sqrt(_2111);
    float _2125 = _2109 * _2105;
    int _2127 = _1327 >> 31;
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2131 = _1491 + _2129;
    bool _2133 = !_2121;
    int _2135 = _2133 ? 0 : (-1);
    float _2137 = _714 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _2139 = _1583 != 3;
    float _2141 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2143 = _2127 & 3;
    float _2145 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2147 = as_type<int>(_1553) >> 31;
    float _2149 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2141);
    int _2151 = _1327 + _2143;
    float _2153 = fma(_2145, _1547, -0.5);
    int _2155 = _2147 & 3;
    float _2157 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2149);
    int _2159 = _2151 >> 2;
    float _2161 = _2123 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2163 = as_type<int>(_1553) + _2155;
    float _2165 = rsqrt(_2111);
    int _2167 = _2159 << 4;
    int _2169 = _2167 + 368;
    float _2171 = fma(_1969, _2011, _2073);
    int _2173 = _2163 >> 2;
    float _2175 = -_166;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2119);
    float _2179 = as_type<float>(_2163);
    if (!_2007)
    {
        _2179 = _909;
    }
    float _2181 = _2179;
    float _2183 = fma(_2035, _1995, _2171);
    int _2185 = _2169 + 8;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    float _2203 = precise::min(_2137, _2161);
    int _2205 = _2173 << 4;
    int _2207 = _2205 + 512;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2211 = _2181;
    if (!_2007)
    {
        _2055 = _2181;
    }
    float _2213 = _2055;
    out.m_79.w = _2203;
    bool _2215 = !_2139;
    int _2217 = _2215 ? 0 : (-1);
    uint _2219 = uint(int(uint(_2169) >> uint(2)));
    uint _2221 = uint(int(uint(int(_2219)) >> uint(2)));
    int _2223 = int(_2219) & 3;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[int(_2221)][_2223];
    int _2227 = int(_2219) + 1;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    int _2231 = _2227 & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    float _2235 = _2213;
    if (_2007)
    {
        _2211 = _686;
    }
    float _2237 = _2211;
    float _2239 = _2165 * _2203;
    bool _2241 = _2157 >= 0.0;
    float _2243 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2209);
    if (!_2007)
    {
        _1655 = _1213;
    }
    float _2245 = _1655;
    uint _2247 = uint(int(uint(_2207) >> uint(2)));
    uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
    int _2251 = int(_2247) & 3;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[int(_2249)][_2251];
    int _2255 = int(_2247) + 1;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    int _2259 = _2255 & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    float _2263 = _2245;
    if (_2007)
    {
        _2263 = _909;
    }
    float _2265 = _2263;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2269 = _2089 * _2239;
    float _2271 = _2079 * _2239;
    if (_2007)
    {
        _2235 = _686;
    }
    float _2273 = _2235;
    float _2275 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[83].w, _768);
    float _2277 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2267);
    float _2279 = -_2269;
    float _2281 = _2089 + _2279;
    int _2283 = _2207 + 8;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    uint _2287 = uint(int(uint(int(_2285)) >> uint(2)));
    int _2289 = int(_2285) & 3;
    float _2291 = (*spvDescriptorSet0.vp_c9)._m0[int(_2287)][_2289];
    int _2293 = int(_2285) + 1;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    int _2297 = _2293 & 3;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[int(_2295)][_2297];
    float _2301 = -_2271;
    float _2303 = _2079 + _2301;
    float _2305 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2277);
    float _2307 = _2281 * _2281;
    float _2309 = _2273 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2311 = fma(_2305, _2153, _2177);
    float _2313 = fma(_2303, _2303, _2307);
    float _2315 = _2099 * _2239;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2319 = abs(_1401);
    float _2321 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2275);
    int _2323 = abs(_1715);
    float _2325 = -_2317;
    float _2327 = fma(_2309, 2.0, _2325);
    bool _2329 = !_1361;
    int _2331 = _2329 ? 0 : 1;
    float _2333 = -_2315;
    float _2335 = _2099 + _2333;
    if (_2241)
    {
        out.m_53.x = 0.0;
    }
    int _2337 = ~_2319;
    int _2339 = _2337 + 1;
    int _2341 = _2339 + 1;
    float _2343 = fma(_2335, _2335, _2313);
    int _2345 = abs(_2331);
    float _2347 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2349 = int(_2347);
    int _2351 = ~_2323;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    int _2357 = abs(_2115);
    int _2359 = abs(_1435);
    int _2361 = ~_1765;
    int _2363 = _2361 + _1879;
    int _2365 = _2363 + 1;
    int _2367 = ~_2345;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    int _2373 = _2341 * as_type<int>(_2233);
    int _2375 = abs(_1663);
    int _2377 = _784 * _2365;
    int _2379 = _2377 + _1201;
    int _2381 = ~_2357;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    int _2387 = _2371 * as_type<int>(_2225);
    int _2389 = _2387 + _2373;
    float _2391 = fma(_2131, _2131, _2091);
    int _2393 = _2355 * as_type<int>(_2261);
    int _2395 = abs(_2135);
    float _2397 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2399 = int(_2397);
    int _2401 = ~_2359;
    int _2403 = _2401 + 1;
    int _2405 = _2403 + 1;
    int _2407 = _2385 * as_type<int>(_2253);
    int _2409 = _2407 + _2393;
    int _2411 = ~_2375;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    float _2417 = fma(_2099, _2099, _2391);
    int _2419 = _2405 * as_type<int>(_2193);
    int _2421 = _2419 + _2389;
    int _2423 = abs(_1637);
    int _2425 = _2415 * as_type<int>(_2291);
    int _2427 = _2425 + _2409;
    int _2429 = ~_2395;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = rsqrt(_2417);
    int _2437 = abs(_2217);
    int _2439 = abs(_1761);
    int _2441 = _2433 * as_type<int>(_2201);
    int _2443 = _2441 + _2421;
    int _2445 = ~_2437;
    int _2447 = _2445 + 1;
    int _2449 = _2447 + 1;
    float _2451 = float(uint(_2349));
    int _2453 = ~_2423;
    int _2455 = _2453 + 1;
    int _2457 = _2455 + 1;
    int _2459 = _2449 * as_type<int>(_2299);
    int _2461 = _2459 + _2427;
    float _2463 = 1.0 / _2451;
    int _2465 = abs(_2349);
    int _2467 = _2443 * _2457;
    float _2469 = float(uint(_2399));
    float _2471 = in.m_81.x;
    float _2473 = in.m_81.y;
    float _2475 = in.m_81.z;
    float _2477 = float(uint(_2465));
    int _2479 = _1993 * _2423;
    int _2481 = _2479 + _2467;
    int _2483 = abs(_2399);
    float _2485 = 1.0 / _2469;
    bool _2487 = _784 == 0;
    int _2489 = ~_2439;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    if (!_2007)
    {
        _829 = _1213;
    }
    float _2495 = _829;
    float _2497 = _2495;
    if (_2007)
    {
        _2497 = _909;
    }
    float _2499 = _2497;
    float _2501 = 1.0 / _2477;
    float _2503 = float(uint(_2483));
    int _2505 = _2493 * _2461;
    bool _2507 = !_2487;
    int _2509 = _2507 ? _2379 : (-1);
    int _2511 = as_type<int>(_2463) + (-2);
    float _2513 = _2499 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2515 = float(uint(_2481));
    float _2517 = 1.0 / _2503;
    float _2519 = _2125 * (-2.0);
    int _2521 = _2509 * _2439;
    int _2523 = _2521 + _2505;
    int _2525 = as_type<int>(_2485) + (-2);
    float _2527 = as_type<float>(_2511) * _2515;
    float _2529 = fma(_1717, _2519, _1717);
    float _2531 = fma(_2519, _2471, _2471);
    float _2533 = float(uint(_2523));
    float _2535 = trunc(_2527);
    float _2537 = precise::max(_2535, 0.0);
    uint _2539 = uint(_2537);
    int _2541 = abs(_2481);
    int _2543 = as_type<int>(_2501) + (-2);
    float _2545 = as_type<float>(_2525) * _2533;
    int _2547 = ~_2349;
    int _2549 = _2547 + 1;
    float _2551 = sqrt(_2343);
    float _2553 = float(uint(_2541));
    int _2555 = abs(_2523);
    float _2557 = float(uint(_2555));
    float _2559 = trunc(_2545);
    float _2561 = precise::max(_2559, 0.0);
    uint _2563 = uint(_2561);
    float _2565 = as_type<float>(_2543) * _2553;
    int _2567 = as_type<int>(_2517) + (-2);
    int _2569 = _2549 * int(_2539);
    int _2571 = _2569 + _2481;
    int _2573 = ~_2399;
    int _2575 = _2573 + 1;
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2579 = ~_2465;
    int _2581 = _2579 + 1;
    float _2583 = as_type<float>(_2567) * _2557;
    float _2585 = trunc(_2565);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    float _2591 = _2517;
    float _2593 = as_type<float>(_2511);
    if (_2241)
    {
        _2591 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2595 = _2591;
    float _2597 = fma(_2513, -2.0, _2577);
    float _2599 = float(uint(_2571));
    float _2601 = _2165 * _2551;
    int _2603 = as_type<int>(_2595);
    if (_2241)
    {
        float _2605 = _2595 * 5.0;
        _2603 = as_type<int>(_2605);
    }
    int _2607 = _2603;
    int _2609 = ~_2399;
    int _2611 = _2609 + 1;
    float _2613 = trunc(_2583);
    float _2615 = precise::max(_2613, 0.0);
    uint _2617 = uint(_2615);
    int _2619 = _2575 * int(_2563);
    int _2621 = _2619 + _2523;
    float _2623 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2597);
    if (_2241)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8537 = as_type<float>(_2607);
        out.gl_Position.z = _8537;
    }
    int _2625 = _2581 * int(_2589);
    int _2627 = _2625 + _2541;
    float _2629 = fma(_1709, _2005, _2183);
    int _2631 = ~_2483;
    int _2633 = _2631 + 1;
    float _2635 = as_type<float>(_2511) * _2599;
    float _2637 = float(uint(_2621));
    float _2639 = fma(_1739, _1949, _2629);
    float _2641 = float(uint(_2627));
    float _2643 = _2639;
    if (_2033)
    {
        _2593 = _909;
    }
    float _2645 = _2593;
    float _2647 = as_type<float>(_2525) * _2637;
    float _2649 = as_type<float>(_2543) * _2641;
    float _2651 = _2645;
    if (!_2033)
    {
        _2651 = _686;
    }
    float _2653 = _2651;
    float _2655 = _714 * _2601;
    int _2657 = _2633 * int(_2617);
    int _2659 = _2657 + _2555;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2663 = _2653 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2665 = _2655 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2667 = float(uint(_2659));
    float _2669 = trunc(_2647);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    float _2675 = fma(_2663, -2.0, _2661);
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2679 = _2665 * _2435;
    float _2681 = as_type<float>(_2567) * _2667;
    float _2683 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2675);
    float _2685 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2677);
    float _2687 = _2131 * _2679;
    float _2689 = trunc(_2635);
    float _2691 = precise::max(_2689, 0.0);
    uint _2693 = uint(_2691);
    float _2695 = _2079 * _2679;
    float _2697 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2639);
    float _2699 = -_2687;
    float _2701 = _2131 + _2699;
    float _2703 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2685);
    int _2705 = ~_2483;
    int _2707 = _2705 + 1;
    float _2709 = -_2695;
    float _2711 = _2079 + _2709;
    float _2713 = _2701 * _2701;
    float _2715 = trunc(_2681);
    float _2717 = precise::max(_2715, 0.0);
    uint _2719 = uint(_2717);
    float _2721 = -_2683;
    float _2723 = fma(_2703, _2081, _2721);
    int _2725 = ~_2349;
    int _2727 = _2725 + 1;
    float _2729 = fma(_2711, _2711, _2713);
    int _2731 = int(_2563) + int(_2673);
    out.m_83.x = _2697;
    float _2733 = _2099 * _2679;
    float _2735 = trunc(_2649);
    float _2737 = precise::max(_2735, 0.0);
    uint _2739 = uint(_2737);
    int _2741 = int(_2539) + int(_2693);
    int _2743 = ~_2465;
    int _2745 = _2743 + 1;
    int _2747 = _2727 * _2741;
    int _2749 = _2747 + _2481;
    int _2751 = int(_2617) + int(_2719);
    bool _2753 = uint(_2749) >= uint(_2349);
    int _2755 = _2707 * _2751;
    int _2757 = _2755 + _2555;
    bool _2759 = !_2753;
    int _2761 = _2759 ? 0 : (-1);
    int _2763 = int(_2589) + int(_2739);
    float _2765 = -_2733;
    float _2767 = _2099 + _2765;
    int _2769 = _2611 * _2731;
    int _2771 = _2769 + _2523;
    bool _2773 = uint(_2757) >= uint(_2483);
    int _2775 = _2745 * _2763;
    int _2777 = _2775 + _2541;
    float _2779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2781 = uint(_2771) >= uint(_2399);
    float _2783 = fma(_2767, _2767, _2729);
    int _2785 = ~_2741;
    int _2787 = _2785 + _2761;
    int _2789 = _2787 + 1;
    bool _2791 = uint(_2777) >= uint(_2465);
    bool _2793 = !_2781;
    int _2795 = _2793 ? 0 : (-1);
    int _2797 = _2349 * _2789;
    int _2799 = _2797 + _2481;
    bool _2801 = _2349 == 0;
    float _2803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2805 = ~_2731;
    int _2807 = _2805 + _2795;
    int _2809 = _2807 + 1;
    bool _2811 = !_2791;
    int _2813 = _2811 ? 0 : (-1);
    bool _2815 = _2349 == 0;
    int _2817 = _2399 * _2809;
    int _2819 = _2817 + _2523;
    int _2821 = _2481 ^ _2349;
    bool _2823 = !_2801;
    int _2825 = _2823 ? _2799 : (-1);
    bool _2827 = !_2773;
    int _2829 = _2827 ? 0 : (-1);
    float _2831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2833 = _2399 == 0;
    bool _2835 = _2399 == 0;
    float _2837 = _2803 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2839 = _2523 ^ _2399;
    float _2841 = _2779 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2843 = float(_2825);
    float _2845 = fma(_2837, _1337, -0.5);
    float _2847 = fma(_2841, _1299, -0.5);
    uint _2849 = uint(int(uint(_2821) >> uint(31)));
    float _2851 = fma(_2841, _2843, _1599);
    uint _2853 = uint(int(uint(_2839) >> uint(31)));
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2857 = ~_2813;
    int _2859 = _2763 + _2857;
    int _2861 = _2859 + 1;
    int _2863 = ~int(_2849);
    int _2865 = _2863 + 1;
    float _2867 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2855);
    int _2869 = ~_2829;
    int _2871 = _2751 + _2869;
    int _2873 = _2871 + 1;
    float _2875 = -_166;
    float _2877 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2327);
    int _2879 = ~int(_2853);
    int _2881 = _2879 + 1;
    float _2883 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2867);
    bool _2885 = !_2833;
    int _2887 = _2885 ? _2819 : (-1);
    float _2889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2891 = _2861 ^ _2865;
    int _2893 = _2873 ^ _2881;
    float _2895 = float(_2887);
    int _2897 = ~_2865;
    int _2899 = _2897 + _2891;
    int _2901 = _2899 + 1;
    int _2903 = ~_2881;
    int _2905 = _2903 + _2893;
    int _2907 = _2905 + 1;
    float _2909 = fma(_2883, _2847, _2851);
    float _2911 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2913 = fma(_2837, _2895, _2877);
    bool _2915 = !_2815;
    int _2917 = _2915 ? _2901 : (-1);
    float _2919 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2921 = log2(_2919);
    float _2923 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1549);
    float _2925 = float(_2917);
    float _2927 = fma(_1341, _2911, -0.5);
    bool _2929 = !_2835;
    int _2931 = _2929 ? _2907 : (-1);
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2935 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2937 = -_2923;
    float _2939 = fma(_2911, _2925, _2937);
    float _2941 = sqrt(_2783);
    float _2943 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2933);
    float _2945 = float(_2931);
    float _2947 = fma(_1365, _2935, -0.5);
    float _2949 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2243);
    float _2951 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2943);
    bool _2953 = !_1845;
    int _2955 = _2953 ? 0 : 1;
    float _2957 = _2921 * _166;
    float _2959 = -_2623;
    float _2961 = fma(_2935, _2945, _2959);
    float _2963 = fma(_2951, _2927, _2939);
    float _2965 = fma(_2949, _2845, _2913);
    float _2967 = _2723 + 0.5;
    float _2969 = fma(_2321, _2947, _2961);
    float _2971 = _2963 + 0.5;
    float _2973 = exp2(_2957);
    float _2975 = _2435 * _2941;
    float _2977 = _2965 + 0.5;
    bool _2979 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2981 = isnan(1.0);
    bool _2983 = _2979 || _2981;
    bool _2985 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2987 = _2983 || _2985;
    float _2989 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2991 = 1.0 + _2989;
    float _2993 = _2311 + 0.5;
    float _2995 = _2909 + 0.5;
    float _2997 = _2969 + 0.5;
    float _2999 = _2655 * _2975;
    bool _3001 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3003 = isnan(0.0);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3009 = _3005 || _3007;
    float _3011 = 1.0 / _2991;
    int _3013 = abs(_2955);
    out.m_85.x = _2993;
    out.m_85.y = _2967;
    float _3015 = _686 + (-0.5);
    float _3017 = -_2973;
    float _3019 = _3017 + 1.0;
    out.m_87.x = _2995;
    out.m_87.y = _2971;
    out.m_87.z = _2977;
    out.m_87.w = _2997;
    out.m_89.x = _2999;
    float _3021 = _3009 ? _3019 : 0.0;
    bool _3023 = !_1849;
    int _3025 = _3023 ? 0 : 1;
    float _3027 = _3021;
    float _3029 = _2713;
    float _3031 = _2687;
    if (_2241)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3033 = -_2687;
    float _3035 = _1491 + _3033;
    float _3037 = float(_1785);
    float _3039 = -_2695;
    float _3041 = _1593 + _3039;
    float _3043 = float(_3013);
    float _3045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3047 = _3035 + _3045;
    float _3049 = fma(_3015, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2531);
    float _3051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3053 = _3041 + _3051;
    float _3055 = _909 + (-0.5);
    float _3057 = _3047 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3059 = _3043 * _3037;
    int _3061 = abs(_3025);
    if (_2987)
    {
        float _3063 = _3021 * _3011;
        _168 = _3063;
    }
    float _3065 = _168;
    float _3067 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3057);
    float _3069 = _3059 * (-2.0);
    float _3071 = float(_1891);
    float _3073 = -_2733;
    float _3075 = _2085 + _3073;
    float _3077 = float(_3061);
    float _3079 = fma(_3069, _2473, _2473);
    float _3081 = fma(_1755, _3069, _1755);
    float _3083 = _686 + _1213;
    float _3085 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3087 = _3075 + _3085;
    float _3089 = fma(_3055, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3079);
    float _3091 = _3077 * _3071;
    float _3093 = _3083 + (-1.0);
    float _3095 = fma(_3081, _3065, _3089);
    float _3097 = _3091 * (-2.0);
    float _3099 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3067);
    float _3101 = fma(_3093, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3103 = _1213 + (-0.5);
    float _3105 = fma(_3097, _2475, _2475);
    float _3107 = fma(_2529, _3065, _3049);
    bool _3109 = _3099 >= 0.0;
    float _3111 = fma(_3101, _3097, _3101);
    float _3113 = fma(_3103, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3105);
    float _3115 = _3107 * 0.15915493667125701904296875;
    float _3117 = _3095 * 0.15915493667125701904296875;
    float _3119 = fma(_3111, _3065, _3113);
    float _3121 = _3115 * 6.283185482025146484375;
    float _3123 = sin(_3121);
    float _3125 = _3119 * 0.15915493667125701904296875;
    float _3127 = _3095;
    if (_3109)
    {
        _3127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3129 = _3127;
    int _3131 = as_type<int>(_3129);
    if (_3109)
    {
        out.m_53.x = 0.0;
    }
    float _3133 = _3115 * 6.283185482025146484375;
    float _3135 = cos(_3133);
    if (_3109)
    {
        float _3137 = _3129 * 5.0;
        _3131 = as_type<int>(_3137);
    }
    int _3139 = _3131;
    float _3141 = _3117 * 6.283185482025146484375;
    float _3143 = sin(_3141);
    if (_3109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9337 = as_type<float>(_3139);
        out.gl_Position.z = _9337;
    }
    float _3145 = _3117 * 6.283185482025146484375;
    float _3147 = cos(_3145);
    float _3149 = _3125 * 6.283185482025146484375;
    float _3151 = sin(_3149);
    if (_3109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3153 = in.m_91.x;
    float _3155 = in.m_91.y;
    float _3157 = in.m_91.z;
    float _3159 = _3125 * 6.283185482025146484375;
    float _3161 = cos(_3159);
    float _3163 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3165 = _2601 * _2975;
    float _3167 = _3123 * _3143;
    float _3169 = _3135 * _3147;
    float _3171 = _3135 * _3143;
    float _3173 = _3163 * _3165;
    float _3175 = _3123 * _3147;
    float _3177 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3179 = fma(_3151, _3169, _3167);
    float _3181 = fma(_3151, _3167, _3169);
    float _3183 = -_3171;
    float _3185 = fma(_3151, _3175, _3183);
    float _3187 = _3177 * _3165;
    float _3189 = _3135 * _3161;
    float _3191 = _3147 * _3161;
    float _3193 = _3123 * _3161;
    float _3195 = _3143 * _3161;
    float _3197 = -_3175;
    float _3199 = fma(_3151, _3171, _3197);
    float _3201 = _3179 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3203 = _3179 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3155);
    float _3207 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3157);
    float _3209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3153);
    float _3211 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3203);
    float _3213 = _3173 * _3205;
    float _3215 = _3187 * _3207;
    float _3217 = _3179 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3219 = _2999 * _3209;
    float _3221 = _3189 * _3213;
    float _3223 = -_3213;
    float _3225 = _3151 * _3223;
    float _3227 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3217);
    float _3229 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3201);
    float _3231 = fma(_3179, _3219, _3221);
    float _3233 = fma(_3191, _3219, _3225);
    float _3235 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3237 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3239 = _3193 * _3213;
    float _3241 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3243 = fma(_3199, _3215, _3231);
    float _3245 = fma(_3195, _3215, _3233);
    float _3247 = fma(_3185, _3219, _3239);
    float _3249 = -_3151;
    float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3241);
    float _3253 = _3243 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3255 = _3243 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3257 = fma(_3181, _3215, _3247);
    float _3259 = -_3151;
    float _3261 = fma(_3259, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3237);
    float _3263 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3253);
    float _3265 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3255);
    float _3267 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3211);
    float _3269 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3227);
    float _3271 = fma(_3257, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3263);
    float _3273 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3229);
    float _3275 = -_3151;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3235);
    float _3279 = _3199 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3281 = fma(_3257, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3265);
    float _3283 = _3271 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3285 = in.m_93.x;
    float _3287 = in.m_93.y;
    float _3289 = in.m_93.z;
    float _3291 = fma(_3195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3279);
    bool _3293 = _3155 != 0.0;
    bool _3295 = isnan(_3155);
    bool _3297 = _3293 || _3295;
    bool _3299 = isnan(0.0);
    bool _3301 = _3297 || _3299;
    float _3303 = _3281 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3305 = _2085 + _3283;
    float _3307 = _3199 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3309 = _3199 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3311 = _3153 == 0.0;
    bool _3313 = !_3301;
    bool _3315 = _3311 && _3313;
    float _3317 = _1593 + _3303;
    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3321 = _3305 + _3319;
    float _3323 = fma(_3193, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3277);
    bool _3325 = _3157 == 0.0;
    bool _3327 = _3325 && _3315;
    float _3329 = fma(_3195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3307);
    float _3331 = fma(_3195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3309);
    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3335 = _3317 + _3333;
    float _3337 = _3321 * _3321;
    float _3339 = in.m_95.x;
    float _3341 = in.m_95.y;
    float _3343 = in.m_95.z;
    float _3345 = in.m_95.w;
    float _3347 = fma(_3193, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3261);
    float _3349 = fma(_3193, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3251);
    float _3351 = fma(_3335, _3335, _3337);
    float _3353 = fma(_3181, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3291);
    float _3355 = _3243 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3357 = fma(_3181, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3331);
    float _3359 = sqrt(_3351);
    float _3361 = _3251;
    float _3363 = _3193;
    float _3365 = _3273;
    if (_3327)
    {
        _2643 = _3285;
    }
    float _3367 = _2643;
    float _3369 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3355);
    float _3371 = _3367;
    if (_3327)
    {
        _3027 = _3287;
    }
    float _3373 = _3027;
    float _3375 = _3373;
    if (_3327)
    {
        _3029 = _3289;
    }
    float _3377 = _3029;
    float _3379 = fma(_3257, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3369);
    float _3381 = _3377;
    if (_3327)
    {
        _1657 = _3367;
    }
    float _3383 = _1657;
    float _3385 = _3383;
    if (_3327)
    {
        _3361 = _3373;
    }
    float _3387 = _3361;
    float _3389 = _3387;
    if (_3327)
    {
        _3363 = _3377;
    }
    float _3391 = _3363;
    float _3393 = _3391;
    if (!_3327)
    {
        _3371 = _3285;
    }
    float _3395 = _3371;
    if (!_3327)
    {
        _3375 = _3287;
    }
    float _3397 = _3375;
    float _3399 = fma(_3181, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3329);
    if (!_3327)
    {
        _3381 = _3289;
    }
    float _3401 = _3381;
    if (!_3327)
    {
        float _3403 = fma(_3153, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3395);
        _3385 = _3403;
    }
    float _3405 = _3385;
    float _3407 = _3323 * _3341;
    if (!_3327)
    {
        float _3409 = fma(_3155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3397);
        _3389 = _3409;
    }
    float _3411 = _3389;
    float _3413 = _3343 * _3395;
    float _3415 = _3413;
    if (!_3327)
    {
        float _3417 = fma(_3157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3401);
        _3393 = _3417;
    }
    float _3419 = _3393;
    bool _3421 = _3359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3423 = _3347 * _3341;
    float _3425 = fma(_3273, _3339, _3407);
    float _3427 = _3339 * _3397;
    float _3429 = _3349 * _3341;
    float _3431 = fma(_3267, _3339, _3423);
    float _3433 = _3379 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3435 = -_3413;
    float _3437 = fma(_3339, _3401, _3435);
    float _3439 = -_3427;
    float _3441 = fma(_3341, _3395, _3439);
    float _3443 = fma(_3269, _3339, _3429);
    float _3445 = _1491 + _3433;
    float _3447 = _3341 * _3401;
    float _3449 = _3433;
    float _3451 = _3427;
    if (!_3421)
    {
        _3449 = _3317;
    }
    float _3453 = _3449;
    float _3455 = _3453;
    if (!_3421)
    {
        _3451 = _3305;
    }
    float _3457 = _3451;
    float _3459 = _3457;
    if (!_3421)
    {
        _3415 = _3445;
    }
    float _3461 = _3415;
    bool _3463 = !_3421;
    float _3465 = _3461;
    if (!_3463)
    {
        float _3467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3469 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3471 = _3359 + _3469;
        float _3473 = _3445 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3475 = rsqrt(_3351);
        float _3477 = _3471 * _3467;
        float _3479 = _3477 * 0.15915493667125701904296875;
        float _3481 = _3479 * 6.283185482025146484375;
        float _3483 = cos(_3481);
        float _3485 = _3479 * 6.283185482025146484375;
        float _3487 = sin(_3485);
        float _3489 = _3483 + (-1.0);
        float _3491 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3493 = fma(_3487, _3473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3495 = fma(_3445, _3483, _3491);
        float _3497 = _3475 * _3493;
        float _3499 = fma(_3335, _3497, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3501 = fma(_3321, _3497, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3465 = _3495;
        _3455 = _3499;
        _3459 = _3501;
    }
    float _3503 = _3465;
    float _3505 = _3455;
    float _3507 = _3459;
    float _3509 = -_2269;
    float _3511 = _3509 + _3503;
    float _3513 = -_2271;
    float _3515 = _3513 + _3505;
    float _3517 = -_3447;
    float _3519 = fma(_3343, _3397, _3517);
    float _3521 = _3349 * _3411;
    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3525 = _3511 + _3523;
    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3529 = _3515 + _3527;
    float _3531 = _3519 * _3345;
    float _3533 = _3441 * _3345;
    float _3535 = _3525 * _3525;
    float _3537 = _3437 * _3345;
    float _3539 = _3347 * _3411;
    float _3541 = fma(_3353, _3343, _3425);
    float _3543 = fma(_3529, _3529, _3535);
    float _3545 = -_2315;
    float _3547 = _3545 + _3507;
    float _3549 = _3323 * _3411;
    float _3551 = _3537 * _3323;
    float _3553 = _3537 * _3347;
    float _3555 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3557 = _3547 + _3555;
    float _3559 = _3537 * _3349;
    float _3561 = fma(_3273, _3405, _3549);
    float _3563 = fma(_3267, _3405, _3539);
    float _3565 = fma(_3557, _3557, _3543);
    float _3567 = fma(_3269, _3405, _3521);
    float _3569 = fma(_3531, _3273, _3551);
    float _3571 = fma(_3531, _3267, _3553);
    float _3573 = fma(_3531, _3269, _3559);
    float _3575 = fma(_3399, _3343, _3431);
    float _3577 = sqrt(_3565);
    float _3579 = fma(_3399, _3419, _3563);
    float _3581 = fma(_3357, _3343, _3443);
    float _3583 = fma(_3353, _3419, _3561);
    float _3585 = fma(_3533, _3353, _3569);
    float _3587 = fma(_3533, _3399, _3571);
    float _3589 = fma(_3533, _3357, _3573);
    float _3591 = fma(_3357, _3419, _3567);
    out.m_97.x = _3541;
    out.m_97.y = _3575;
    out.m_97.z = _3581;
    float _3593 = -_2271;
    float _3595 = _1593 + _3593;
    float _3597 = -_2269;
    float _3599 = _3597 + _1491;
    out.m_99.x = _3585;
    out.m_99.y = _3587;
    out.m_99.z = _3589;
    float _3601 = -_2315;
    float _3603 = _2085 + _3601;
    out.m_101.x = _3583;
    out.m_101.y = _3579;
    out.m_101.z = _3591;
    bool _3605 = _3577 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3607 = isnan(_3577);
    bool _3609 = _3605 || _3607;
    bool _3611 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3613 = _3609 || _3611;
    if (!_3613)
    {
        _3365 = 1.0;
    }
    float _3615 = _3365;
    bool _3617 = !_3613;
    float _3619 = _3615;
    if (!_3617)
    {
        bool _3621 = _3577 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3623 = isnan(_3577);
        bool _3625 = _3621 || _3623;
        bool _3627 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3629 = _3625 || _3627;
        if (!_3629)
        {
            float _3631 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3633 = _3577 + _3631;
            float _3635 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3637 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3635;
            float _3639 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3641 = _3639 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3643 = 1.0 / _3637;
            float _3645 = _3633 * _3643;
            float _3647 = fma(_3645, _3641, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3619 = _3647;
            _3649 = true;
        }
        else
        {
            bool _3651 = _3577 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3653 = isnan(_3577);
            bool _3655 = _3651 || _3653;
            bool _3657 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3659 = _3655 || _3657;
            if (!_3659)
            {
                float _3661 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3663 = _3577 + _3661;
                float _3665 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3667 = _3665 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3669 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3671 = _3669 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3673 = 1.0 / _3667;
                float _3675 = _3663 * _3673;
                float _3677 = fma(_3675, _3671, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3619 = _3677;
                _3649 = true;
            }
            else
            {
                _3619 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3649 = false;
    float _3679 = _3619;
    float _3681 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3683 = _3515 + _3681;
    float _3685 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3687 = _3547 + _3685;
    float _3689 = fma(_3683, _3679, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3691 = fma(_3687, _3679, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3693 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _3695 = _3689 + _3693;
    float _3697 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _3699 = _3691 + _3697;
    float _3701 = fma(_3695, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _3703 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _10313 = float2(_3701, _3703);
    float _3705 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_10313, float2(0.0), isnan(_10313)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_10313, float2(0.0), isnan(_10313)), level(0.0)).x;
    float _3707 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3709 = _3511 + _3707;
    float _3711 = -_2695;
    float _3713 = _3711 + _3595;
    float _3715 = -_2733;
    float _3717 = _3715 + _3603;
    float _3719 = -_3595;
    float _3721 = _3719 + _3689;
    float _3723 = fma(_3709, _3679, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3725 = -_3603;
    float _3727 = _3725 + _3691;
    float _3729 = fma(_3705, 100.0, _3599);
    float _3731 = -_3599;
    float _3733 = _3731 + _3723;
    float _3735 = fma(_3705, 100.0, _3723);
    float _3737 = -_2687;
    float _3739 = _3737 + _3729;
    float _3741 = _3733 * _3733;
    float _3743 = _3739 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3745 = fma(_3721, _3721, _3741);
    float _3747 = fma(_3713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3743);
    float _3749 = fma(_3727, _3727, _3745);
    float _3751 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3747);
    float _3753 = sqrt(_3749);
    float _3755 = _3751 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3757 = _3739 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3759 = 1.0 / _3755;
    float _3761 = fma(_3713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3757);
    float _3763 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3761);
    bool _3765 = _3753 > 0.0;
    float _3767 = _3763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3769 = _3767 + _3755;
    bool _3771 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3773 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3775 = _3771 || _3773;
    bool _3777 = isnan(0.5);
    bool _3779 = _3775 || _3777;
    float _3781 = _3769 * _3759;
    float _3783 = _3781 * 0.5;
    bool _3785 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3789 = _3785 || _3787;
    bool _3791 = isnan(0.5);
    bool _3793 = _3789 || _3791;
    float _3795 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3797 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3795);
    float _3799 = _3705;
    float _3801 = _3723;
    float _3803 = _3689;
    float _3805 = _3691;
    float _3807 = _3739;
    float _3809 = _3717;
    if (!_3765)
    {
        _3799 = _3691;
    }
    float _3811 = _3799;
    float _3813 = _3811;
    if (!_3765)
    {
        _3801 = _3735;
    }
    float _3815 = _3801;
    float _3817 = 1.0 / _3797;
    bool _3819 = !_3765;
    float _3821 = _3815;
    float _3823 = _3815;
    float _3825 = _3817;
    if (!_3819)
    {
        float _3827 = _232 * _232;
        float _3829 = rsqrt(_3749);
        float _3831 = fma(_230, _230, _3827);
        float _3833 = fma(_234, _234, _3831);
        float _3835 = sqrt(_3833);
        float _3837 = _3721 * _3829;
        float _3839 = _3733 * _3829;
        float _3841 = _3727 * _3829;
        bool _3843 = _3835 > 0.0;
        float _3845 = _3829;
        if (!_3843)
        {
            _3821 = _3735;
        }
        float _3847 = _3821;
        _3823 = _3847;
        if (!_3843)
        {
            _3845 = _3691;
        }
        float _3849 = _3845;
        bool _3851 = !_3843;
        _3813 = _3849;
        if (!_3851)
        {
            float _3853 = rsqrt(_3833);
            float _3855 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3857 = _232 * _3853;
            float _3859 = _230 * _3853;
            float _3861 = _3839 * _3857;
            float _3863 = _234 * _3853;
            float _3865 = fma(_3837, _3859, _3861);
            float _3867 = _3855 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3869 = fma(_3841, _3863, _3865);
            float _3871 = _3869 * _3867;
            float _3873 = fma(_230, _3871, _3689);
            float _3875 = fma(_232, _3871, _3735);
            float _3877 = fma(_234, _3871, _3691);
            _3823 = _3875;
            _3803 = _3873;
            _3813 = _3877;
        }
    }
    float _3879 = _3823;
    float _3881 = _3803;
    float _3883 = _3813;
    float _3885 = -_2687;
    float _3887 = _3885 + _3879;
    float _3889 = -_2695;
    float _3891 = _3889 + _3881;
    float _3893 = -_2733;
    float _3895 = _3893 + _3883;
    float _3897 = _3887;
    float _3899 = _3891;
    float _3901 = _3895;
    float _3903 = _3881;
    if (_3793)
    {
        _3031 = 1.0;
    }
    float _3905 = _3031;
    float _3907 = _3905;
    if (!_3779)
    {
        float _3909 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3911 = _3739 + _3909;
        float _3913 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3915 = _3713 + _3913;
        float _3917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3919 = -_3603;
        float _3921 = _3919 + _3883;
        float _3923 = _3911 * _3911;
        float _3925 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3927 = _3717 + _3925;
        float _3929 = -_3595;
        float _3931 = _3929 + _3881;
        float _3933 = -_3729;
        float _3935 = _3933 + _3879;
        float _3937 = fma(_3915, _3915, _3923);
        float _3939 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3941 = fma(_3927, _3927, _3937);
        float _3943 = sqrt(_3941);
        float _3945 = 1.0 / _2975;
        float _3947 = _3939 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3949 = precise::min(_3943, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3951 = _3949 * _3917;
        float _3953 = _3951 * _3945;
        float _3955 = _3947 * _3953;
        float _3957 = _3921 * _3953;
        float _3959 = fma(_3931, _3955, _3713);
        float _3961 = fma(_3935, _3955, _3739);
        float _3963 = fma(_3947, _3957, _3717);
        _3897 = _3961;
        _3899 = _3959;
        _3901 = _3963;
        _3903 = _3931;
    }
    float _3965 = _3897;
    float _3967 = _3899;
    float _3969 = _3901;
    float _3971 = _3903;
    float _3973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3975 = _3817 * _3973;
    float _3977 = _3971;
    if (!_3793)
    {
        float _3979 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3981 = _3979 * 0.15915493667125701904296875;
        float _3983 = _3981 * 6.283185482025146484375;
        float _3985 = cos(_3983);
        float _3987 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3989 = _3987 * 0.15915493667125701904296875;
        float _3991 = _3981 * 6.283185482025146484375;
        float _3993 = sin(_3991);
        float _3995 = 1.0 / _3985;
        float _3997 = _3989 * 6.283185482025146484375;
        float _3999 = cos(_3997);
        float _4001 = _3993 * _3995;
        float _4003 = _3989 * 6.283185482025146484375;
        float _4005 = sin(_4003);
        float _4007 = _3999 * _4001;
        float _4009 = 1.0 / _4007;
        float _4011 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4013 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4011;
        float _4015 = 1.0 / _4013;
        float _4017 = _4005 * _4009;
        float _4019 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4021 = fma(_3975, _4017, _4019);
        float _4023 = _4021 * _4015;
        float _4025 = precise::clamp(_4023, 0.0, 1.0);
        _242 = _3989;
        _3907 = _4025;
    }
    float _4027 = _242;
    float _4029 = _3907;
    float _4031 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4033 = _3965 + _4031;
    float _4035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4037 = _3967 + _4035;
    float _4039 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4041 = _3969 + _4039;
    float _4043 = _4033 * _4033;
    float _4045 = fma(_4037, _4037, _4043);
    float _4047 = fma(_4041, _4041, _4045);
    float _4049 = rsqrt(_4047);
    float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4053 = _4037 * _4051;
    float _4055 = _4041 * _4051;
    float _4057 = _4053 * _4053;
    float _4059 = _4055 * _4055;
    float _4061 = _4057 + _4059;
    float _4063 = sqrt(_4061);
    bool _4065 = _4063 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4069 = _4063 + _4067;
    float _4071 = _4041;
    float _4073 = _4027;
    float _4075 = _4069;
    float _4077 = _4033;
    if (_4065)
    {
        float _4079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4071 = _4079;
    }
    float _4081 = _4071;
    if (_4065)
    {
        float _4083 = rsqrt(_4061);
        _4073 = _4083;
    }
    float _4085 = _4073;
    float _4087 = _4085;
    if (_4065)
    {
        float _4089 = _4069 * _4081;
        _4075 = _4089;
    }
    float _4091 = _4075;
    if (_4065)
    {
        float _4093 = _4091 * 0.15915493667125701904296875;
        _3977 = _4093;
    }
    float _4095 = _3977;
    float _4097 = _4081;
    if (_4065)
    {
        float _4099 = _4095 * 6.283185482025146484375;
        float _4101 = cos(_4099);
        _4097 = _4101;
    }
    float _4103 = _4097;
    float _4105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4107 = precise::max(0.0, _4105);
    float _4109 = _4049;
    float _4111 = _4107;
    if (_4065)
    {
        float _4113 = _4095 * 6.283185482025146484375;
        float _4115 = sin(_4113);
        _4109 = _4115;
    }
    float _4117 = _4109;
    float _4119 = -_4051;
    float _4121 = -_4107;
    float _4123 = fma(_4033, _4119, _4121);
    float _4125 = _4123;
    if (_4065)
    {
        float _4127 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4111 = _4127;
    }
    float _4129 = _4111;
    float _4131 = _4129;
    if (_4065)
    {
        float _4133 = _4103 + (-1.0);
        _4077 = _4133;
    }
    float _4135 = _4077;
    float _4137 = _4135;
    float _4139 = _4117;
    if (_4065)
    {
        float _4141 = fma(_4117, _4129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3825 = _4141;
    }
    float _4143 = _3825;
    if (_4065)
    {
        float _4145 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4131 = _4145;
    }
    float _4147 = _4131;
    if (!_4065)
    {
        _4137 = _4057;
    }
    float _4149 = _4137;
    float _4151 = _4149;
    if (_4065)
    {
        float _4153 = _4085 * _4143;
        _3805 = _4153;
    }
    float _4155 = _3805;
    if (!_4065)
    {
        _4087 = _4053;
    }
    float _4157 = _4087;
    float _4159 = _4157;
    if (_4065)
    {
        float _4161 = fma(_4123, _4103, _4147);
        _4125 = _4161;
    }
    float _4163 = _4125;
    float _4165 = sqrt(_4047);
    float _4167 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4065)
    {
        float _4169 = _4053 * _4155;
        _4159 = _4169;
    }
    float _4171 = _4159;
    if (!_4065)
    {
        _4139 = _4055;
    }
    float _4173 = _4139;
    float _4175 = _4173;
    if (_4065)
    {
        float _4177 = _4055 * _4155;
        _4175 = _4177;
    }
    float _4179 = _4175;
    float _4181 = fma(_3713, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4065)
    {
        float _4183 = _4171 * _4171;
        _4151 = _4183;
    }
    float _4185 = _4151;
    if (!_4065)
    {
        _4167 = _4059;
    }
    float _4187 = _4167;
    float _4189 = _4187;
    if (_4065)
    {
        float _4191 = _4179 * _4179;
        _4189 = _4191;
    }
    float _4193 = _4189;
    float _4195 = fma(_4163, _4163, _4185);
    float _4197 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4199 = floor(_4181);
    float _4201 = _4195 + _4193;
    float _4203 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4197);
    float _4205 = fma(_3717, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4207 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4209 = fma(_4165, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4207);
    float _4211 = precise::clamp(_4209, 0.0, 1.0);
    float _4213 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4203);
    float _4215 = rsqrt(_4201);
    float _4217 = -_4211;
    float _4219 = _4217 + 1.0;
    float _4221 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4223 = _4213 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4227 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4221);
    float _4229 = _4223 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4231 = abs(_4219);
    float _4233 = log2(_4231);
    float _4235 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4237 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4227);
    float _4239 = -_4229;
    float _4241 = fma(_4239, _4225, 1.0);
    float _4243 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4245 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4235);
    float _4247 = _4215 * _4171;
    float _4249 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4243);
    float _4251 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4245);
    float _4253 = _4215 * _4163;
    float _4255 = _4215 * _4179;
    float _4257 = _4247 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4259 = fma(_3969, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4249);
    float _4261 = _4251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4263 = floor(_4205);
    float _4265 = -_4257;
    float _4267 = fma(_4253, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4265);
    float _4269 = _4259 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4271 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4273 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4275 = -_4255;
    float _4277 = fma(_4275, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4267);
    float _4279 = _4237 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4281 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4271);
    float _4283 = -_4199;
    float _4285 = _4181 + _4283;
    float _4287 = fma(_4277, -0.5, 0.5);
    float _4289 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4281);
    float _4291 = exp2(_4273);
    float _4293 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4295 = fma(_4277, 0.5, 0.5);
    float _4297 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4289);
    float _4299 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4301 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4293);
    float _4303 = -_4263;
    float _4305 = _4205 + _4303;
    float _4307 = _4253 + 1.0;
    float _4309 = log2(_4241);
    float _4311 = fma(_4295, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4313 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4299);
    float _4315 = fma(_4295, _4311, -0.212114393711090087890625);
    float _4317 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4313);
    float _4319 = 1.0 / _4297;
    float _4321 = -_4253;
    float _4323 = fma(_4291, _4307, _4321);
    float _4325 = sqrt(_4287);
    float _4327 = _4309 * 0.693147182464599609375;
    float2 _11295 = float2(_4285, _4305);
    float _4329 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11295, float2(0.0), isnan(_11295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11295, float2(0.0), isnan(_11295)), level(0.0)).x;
    float _4331 = fma(_4295, _4315, 1.570728778839111328125);
    float _4333 = _4327 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4335 = fma(_4323, 0.5, 0.5);
    float _4337 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4301);
    float _4339 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4337);
    float _4341 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4317);
    float _4343 = _4325 * 0.636619746685028076171875;
    float _4345 = _4339 * _4319;
    float _4347 = _4341 * _4319;
    float _4349 = -_4331;
    float _4351 = fma(_4343, _4349, 1.0);
    float _4353 = fma(_4345, 0.5, 0.5);
    float _4355 = fma(_4347, -0.5, 0.5);
    float3 _11347 = float3(_4353, _4355, _4333);
    float _4357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11347, float3(0.0), isnan(_11347)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11347, float3(0.0), isnan(_11347)), level(0.0)).x;
    float3 _11358 = float3(_4353, _4355, _4333);
    float4 _4360 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11358, float3(0.0), isnan(_11358)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11358, float3(0.0), isnan(_11358)), level(0.0)).xyzw;
    float _4362 = _4360.x;
    float _4364 = _4360.y;
    float _4366 = _4360.z;
    float _4368 = _4360.w;
    float2 _11374 = float2(_4351, _4335);
    float3 _4372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11374, float2(0.0), isnan(_11374)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11374, float2(0.0), isnan(_11374)), level(0.0)).xyz;
    float _4374 = _4372.x;
    float _4376 = _4372.y;
    float _4378 = _4372.z;
    float _4380 = abs(_3975);
    float _4382 = log2(_4380);
    float _4384 = _4261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4386 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_103.x = _3713;
    out.m_103.y = _3739;
    out.m_103.z = _3717;
    float _4388 = fma(_4269, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4384);
    bool _4390 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4392 = isnan(_4165);
    bool _4394 = _4390 || _4392;
    bool _4396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4398 = _4394 || _4396;
    bool _4400 = _3975 <= 8000.0;
    bool _4402 = isnan(_3975);
    bool _4404 = _4400 || _4402;
    bool _4406 = isnan(8000.0);
    bool _4408 = _4404 || _4406;
    float _4410 = float(_4408);
    float _4412 = fma(_4223, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4388);
    float _4414 = exp2(_4386);
    out.m_105.x = _3967;
    out.m_105.y = _3965;
    out.m_105.z = _3969;
    float _4416 = fma(_4279, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4412);
    float _4418 = _4297 * 0.5;
    float _4420 = _4382 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4422 = in.m_77.x;
    float _4424 = _4339 + _4297;
    float _4426 = _4339;
    if (!_4398)
    {
        _3807 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4428 = _3807;
    out.gl_Position.x = _4339;
    out.gl_Position.y = _4341;
    out.gl_Position.z = _4416;
    out.gl_Position.w = _4297;
    float _4430 = exp2(_4420);
    float _4432 = _4424 * 0.5;
    float _4434 = _4428;
    float _4436 = _4428;
    if (!_4398)
    {
        _3809 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4438 = _3809;
    float _4440 = -_4414;
    float _4442 = _4440 + 1.0;
    float _4444 = _4442 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4446 = -_4444;
    float _4448 = _4446 + 1.0;
    float _4450 = _4448;
    float _4452 = _4444;
    float _4454 = _4438;
    float _4456 = _4438;
    if (!_4398)
    {
        _4426 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4458 = _4426;
    float _4460 = fma(_4430, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4462 = precise::clamp(_4460, 0.0, 1.0);
    float _4464 = fma(_4341, -0.5, _4418);
    float _4466 = fma(_4462, -2.0, 3.0);
    float _4468 = _4462 * _4462;
    float _4470 = _4468 * _4466;
    float _4472 = -_4470;
    float _4474 = _4472 + 1.0;
    float _4476 = fma(_4474, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4470);
    float _4478 = _4416 + _4297;
    float _4480 = _4029 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4482 = _4410 * _4476;
    float _4484 = _4478 * 0.5;
    float _4486 = _4482 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.x = _4432;
    out.m_107.y = _4464;
    out.m_107.z = _4484;
    out.m_107.w = _4297;
    float _4488 = -_4329;
    float _4490 = _4488 + 1.0;
    float _4492 = _4490 * _4486;
    float _4494 = precise::clamp(_4492, 0.0, 1.0);
    float _4496 = -_4494;
    float _4498 = fma(_4496, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4500 = _4498 * _4422;
    float _4502 = _4500 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_109.x = _4502;
    float _4504 = _4444 * _4357;
    float _4506 = _4368 * _4448;
    float _4508 = _4458;
    float _4510 = _4458;
    if (!_4398)
    {
        _4450 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4512 = _4450;
    float _4514 = _4368 * _4504;
    float _4516 = _4378 * _4504;
    float _4518 = _4514;
    float _4520 = _4512;
    float _4522 = _4512;
    if (!_4398)
    {
        _4452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4524 = _4452;
    float _4526 = fma(_4374, _4514, _4362);
    float _4528 = fma(_4376, _4514, _4364);
    float _4530 = fma(_4368, _4516, _4366);
    float _4532 = _4524;
    float _4534 = _4524;
    if (!_4398)
    {
        _4518 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4536 = _4518;
    out.m_111.x = _4526;
    out.m_111.y = _4528;
    out.m_111.z = _4530;
    out.m_111.w = _4506;
    bool _4538 = !_4398;
    float _4540 = _4536;
    float _4542 = _4536;
    if (!_4538)
    {
        bool _4544 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4546 = isnan(_4165);
        bool _4548 = _4544 || _4546;
        bool _4550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4552 = _4548 || _4550;
        if (!_4552)
        {
            float _4554 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4556 = _4165 + _4554;
            float _4558 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4560 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4558;
            float _4562 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4564 = _4562 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4566 = 1.0 / _4560;
            float _4568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4570 = _4568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4572 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4574 = _4572 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4578 = _4576 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4580 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4582 = _4580 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4584 = _4556 * _4566;
            float _4586 = precise::clamp(_4584, 0.0, 1.0);
            float _4588 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4590 = _4588 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4592 = fma(_4586, _4564, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4594 = fma(_4586, _4590, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4596 = fma(_4586, _4570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4598 = fma(_4586, _4574, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4600 = fma(_4586, _4578, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4602 = fma(_4586, _4582, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4510 = _4592;
            _4534 = _4600;
            _4436 = _4596;
            _4522 = _4598;
            _4456 = _4594;
            _4542 = _4602;
            _4604 = true;
        }
        else
        {
            bool _4606 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4608 = isnan(_4165);
            bool _4610 = _4606 || _4608;
            bool _4612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4614 = _4610 || _4612;
            if (!_4614)
            {
                _4434 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4616 = _4434;
            _4436 = _4616;
            if (!_4614)
            {
                _4508 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4618 = _4508;
            _4510 = _4618;
            if (!_4614)
            {
                _4454 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4620 = _4454;
            _4456 = _4620;
            if (!_4614)
            {
                _4520 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4622 = _4520;
            _4522 = _4622;
            if (!_4614)
            {
                _4532 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4624 = _4532;
            _4534 = _4624;
            if (!_4614)
            {
                _4540 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4626 = _4540;
            bool _4628 = !_4614;
            _4542 = _4626;
            if (!_4628)
            {
                bool _4630 = _4165 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4632 = isnan(_4165);
                bool _4634 = _4630 || _4632;
                bool _4636 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4638 = _4634 || _4636;
                if (!_4638)
                {
                    float _4640 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4642 = _4165 + _4640;
                    float _4644 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4646 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4644;
                    float _4648 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4650 = _4648 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4652 = 1.0 / _4646;
                    float _4654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4656 = _4654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4658 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4660 = _4658 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4662 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4664 = _4662 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4666 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4668 = _4666 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4670 = _4642 * _4652;
                    float _4672 = precise::clamp(_4670, 0.0, 1.0);
                    float _4674 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4676 = _4674 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4678 = fma(_4672, _4650, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4680 = fma(_4672, _4676, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4682 = fma(_4672, _4656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4684 = fma(_4672, _4660, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4686 = fma(_4672, _4664, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4688 = fma(_4672, _4668, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4510 = _4678;
                    _4534 = _4686;
                    _4436 = _4682;
                    _4522 = _4684;
                    _4456 = _4680;
                    _4542 = _4688;
                    _4604 = true;
                }
                else
                {
                    _4510 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4534 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4436 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4522 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4456 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4542 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4604 = false;
    float _4690 = _4510;
    float _4692 = _4534;
    float _4694 = _4436;
    float _4696 = _4522;
    float _4698 = _4456;
    float _4700 = _4542;
    float _4702 = fma(_3579, -0.5, 0.5);
    float _4704 = precise::clamp(_4702, 0.0, 1.0);
    float _4706 = -_4690;
    float _4708 = _4706 + _4692;
    float _4710 = _4480 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4712 = -_4694;
    float _4714 = _4712 + _4696;
    float _4716 = fma(_4704, _4708, _4690);
    out.m_113.x = 0.0;
    float _4718 = -_4698;
    float _4720 = _4718 + _4700;
    float _4722 = fma(_4704, _4714, _4694);
    float _4724 = _4716 * 0.586610972881317138671875;
    out.m_53.x = _4710;
    bool _4726 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4728 = fma(_4704, _4720, _4698);
    float _4730 = fma(_4722, 0.298911988735198974609375, _4724);
    bool _4732 = _4029 > 0.0;
    bool _4734 = isnan(_4029);
    bool _4736 = _4732 || _4734;
    bool _4738 = isnan(0.0);
    bool _4740 = _4736 || _4738;
    float _4742 = fma(_4728, 0.114477999508380889892578125, _4730);
    float _4744 = -_4742;
    float _4746 = _4722 + _4744;
    float _4748 = -_4742;
    float _4750 = _4716 + _4748;
    float _4752 = -_4742;
    float _4754 = _4728 + _4752;
    float _4756 = fma(_4746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4742);
    float _4758 = fma(_4750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4742);
    float _4760 = fma(_4754, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4742);
    bool _4762 = !_4726;
    if (!_4762)
    {
        float _4764 = -_3965;
        float _4766 = _4764 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4768 = -_3967;
        float _4770 = _4768 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4772 = -_3969;
        float _4774 = _4772 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4776 = _4766 * _4766;
        float _4778 = fma(_4770, _4770, _4776);
        float _4780 = fma(_4774, _4774, _4778);
        float _4782 = sqrt(_4780);
        float _4784 = rsqrt(_4780);
        float _4786 = -_4782;
        float _4788 = _4786 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4790 = _4788 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4792 = precise::clamp(_4790, 0.0, 1.0);
        float _4794 = _4770 * _4784;
        float _4796 = _4766 * _4784;
        float _4798 = abs(_4792);
        float _4800 = log2(_4798);
        float _4802 = _4774 * _4784;
        float _4804 = _4794 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4806 = _3579 * _4796;
        float _4808 = -_4796;
        float _4810 = -_4804;
        float _4812 = fma(_4808, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4810);
        float _4814 = fma(_3583, _4794, _4806);
        float _4816 = -_4802;
        float _4818 = fma(_4816, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4812);
        float _4820 = fma(_3591, _4802, _4814);
        float _4822 = precise::clamp(_4820, 0.0, 1.0);
        float _4824 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4826 = _4818 + _4824;
        float _4828 = _4800 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4830 = _4826 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4832 = precise::clamp(_4830, 0.0, 1.0);
        float _4834 = exp2(_4828);
        float _4836 = _4834 * _4832;
        float _4838 = _4822 * _4836;
        float _4840 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4842 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4844 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4840;
        out.m_113.y = _4842;
        out.m_113.z = _4844;
    }
    out.m_79.x = _4756;
    out.m_79.y = _4758;
    out.m_79.z = _4760;
    if (_4740)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4846 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4846;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

