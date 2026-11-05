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
    float4 m_79 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2848 = false;
    bool _632 = false;
    bool _496 = false;
    bool _322 = false;
    bool _214 = false;
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
        float _3164 = as_type<float>(_134);
        out.gl_Position.z = _3164;
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
        float _3219 = as_type<float>(_160);
        out.gl_Position.z = _3219;
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
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _254;
    float _258 = 1.0 / _236;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _248 * _252;
    float _264 = -_248;
    float _266 = _264 + 1.0;
    float _268 = _220 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_256, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = fma(_278, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _274 * _262;
    float _286 = _282 * _262;
    float _288 = _280 * _262;
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _292 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _294 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _302 = !_260;
    float _320;
    if (!_302)
    {
        float _304 = in.m_57.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _172;
    }
    _322 = false;
    float _324 = _320;
    float _326 = in.m_59.x;
    float _328 = in.m_59.y;
    float _330 = in.m_59.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = _324 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _344 = 1.0 / _338;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = 1.0 / _342;
    float _350 = _334 * _344;
    bool _352 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _354 = isnan(_324);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _300 * _330;
    float _366 = _298 * _328;
    bool _368 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _370 = isnan(_324);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _324 + _380;
    float _384 = -_362;
    float _386 = _384 + 1.0;
    bool _388 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _390 = isnan(_324);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = -_378;
    float _406 = _404 + 1.0;
    float _408 = _378 * _386;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = _398 * _406;
    float _420 = fma(_402, _350, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _422 = fma(_412, _350, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_416, _350, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = _382 * _348;
    float _428 = -_398;
    float _430 = _428 + 1.0;
    float _432 = _422 * _418;
    float _434 = _424 * _418;
    float _436 = _420 * _418;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _450 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[107].x, _432);
    float _452 = fma(_440, _426, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _454 = fma(_444, _426, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _456 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[107].y, _434);
    float _458 = fma(_448, _426, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _460 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[107].z, _436);
    float _462 = fma(_452, _408, _450);
    float _464 = fma(_454, _408, _456);
    float _466 = fma(_458, _408, _460);
    float _468 = _296 * _326;
    float _470 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].x, _462);
    float _472 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].y, _464);
    float _474 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].z, _466);
    bool _476 = !_346;
    float _494;
    if (!_476)
    {
        float _478 = in.m_57.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        _494 = _172;
    }
    _496 = false;
    float _498 = _494;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _498 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = isnan(_498);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _524 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _526 = isnan(_498);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _536;
    bool _540 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _542 = isnan(_498);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _506;
    float _554 = -_518;
    float _556 = _554 + 1.0;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _560 = 1.0 / _522;
    float _562 = _538 * _552;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _568 = -_550;
    float _570 = _568 + 1.0;
    float _572 = fma(_562, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _574 = _534 * _556;
    float _576 = -_534;
    float _578 = _576 + 1.0;
    float _580 = _518 * _570;
    float _582 = _566 * _560;
    float _584 = _572 * _574;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = _498 + _586;
    float _590 = _470 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _592 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _594 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[115].x, _584);
    float _596 = fma(_582, _588, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _598 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _600 = fma(_596, _580, _594);
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _608 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _602;
    out.m_61.y = _604;
    out.m_61.z = _608;
    out.m_61.w = _610;
    bool _612 = !_558;
    float _630;
    if (!_612)
    {
        float _614 = in.m_57.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        _630 = _172;
    }
    _632 = false;
    float _634 = _630;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _638 = _634 + _636;
    bool _640 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _642 = isnan(_634);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _652;
    bool _656 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _658 = isnan(_634);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -_650;
    float _670 = _668 + 1.0;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _672;
    float _676 = 1.0 / _654;
    bool _678 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _680 = _666 * _670;
    float _682 = -_666;
    float _684 = _682 + 1.0;
    float _686 = _638 * _676;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _688;
    float _692 = fma(_674, _686, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _694;
    float _698 = fma(_690, _686, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _700 = _692 * _680;
    float _702 = fma(_696, _686, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _704 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].x, _700);
    float _706 = _702 * _680;
    float _708 = _698 * _680;
    float _710 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].x, _704);
    float _712 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].y, _706);
    float _714 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].z, _708);
    float _716 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].y, _712);
    float _718 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].z, _714);
    bool _720 = !_678;
    if (!_720)
    {
        float _722 = in.m_57.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _194 = _736;
    }
    float _738 = _194;
    float _740 = in.m_57.z;
    float _742 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _744 = log2(_742);
    float _746 = in.m_57.x;
    float _748 = in.m_57.y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _754 = int(_752);
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _758 = _740 * 2.0;
    float _760 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _762 = _746 * 2.0;
    float _764 = floor(_758);
    float _766 = _748 * 2.0;
    float _768 = -_750;
    float _770 = fma(_760, 2.0, _768);
    float _772 = _744 * _116;
    float _774 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _776 = _748 + _746;
    float _778 = -_116;
    float _780 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[76].x, _770);
    float _782 = floor(_762);
    float _784 = fma(_774, -2.0, _756);
    float _786 = _776 + (-1.0);
    float _788 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    float _790 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _792 = _764 >= 0.0;
    bool _794 = isnan(_764);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = exp2(_772);
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _814 = _812 != 0;
    int _816 = _800 ? 0 : 1;
    bool _818 = _782 > 0.0;
    float _820 = floor(_766);
    bool _822 = !_810;
    int _824 = _822 ? 0 : 1;
    bool _826 = _764 > 0.0;
    bool _828 = _782 >= 0.0;
    bool _830 = isnan(_782);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    bool _838 = !_806;
    int _840 = _838 ? 0 : 1;
    float _842 = -_802;
    float _844 = _842 + 1.0;
    bool _846 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _854 = _850 || _852;
    int _856 = ~_816;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    bool _862 = !_814;
    int _864 = _862 ? 0 : 1;
    float _866 = _854 ? _844 : 0.0;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _870 = _820 > 0.0;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _874 = _820 >= 0.0;
    bool _876 = isnan(_820);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _868);
    int _886 = _860;
    float _888 = _738;
    if (!_826)
    {
        int _890 = ~_816;
        int _892 = _890 + 1;
        _886 = _892;
    }
    int _894 = _886;
    float _896 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _872);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _900 = _898 != 0;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _908 = _906 != 0;
    float _910 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _912 = int(_910);
    float _914 = float(_754);
    float _916 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _918 = in.m_63.x;
    float _920 = in.m_63.y;
    float _922 = in.m_63.z;
    float _924 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _884);
    bool _926 = !_900;
    int _928 = _926 ? 0 : 1;
    float _930 = 1.0 / _914;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _934 = 1.0 + _932;
    float _936 = float(_894);
    int _938 = _836 ? 0 : 1;
    bool _940 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(1.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = 1.0 / _934;
    int _952 = abs(_928);
    bool _954 = !_904;
    int _956 = _954 ? 0 : 1;
    float _958 = float(_952);
    float _960 = float(_912);
    float _962 = _930 * _116;
    int _964 = ~_938;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    float _970 = _958 * _936;
    int _972 = _968;
    if (!_818)
    {
        int _974 = ~_938;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    float _980 = _746 + (-0.5);
    int _982 = abs(_956);
    float _984 = _970 * (-2.0);
    bool _986 = !_908;
    int _988 = _986 ? 0 : 1;
    float _990 = _960 * _116;
    if (_948)
    {
        float _992 = _866 * _950;
        _126 = _992;
    }
    float _994 = _126;
    float _996 = fma(_984, _918, _918);
    int _998 = _882 ? 0 : 1;
    float _1000 = fma(_790, _984, _790);
    float _1002 = float(_978);
    float _1004 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[196].x, _996);
    float _1006 = float(_982);
    int _1008 = abs(_988);
    float _1010 = fma(_1000, _994, _1004);
    int _1012 = ~_998;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    float _1018 = _1006 * _1002;
    int _1020 = _1016;
    if (!_870)
    {
        int _1022 = ~_998;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = _748 + _740;
    float _1030 = _1018 * (-2.0);
    float _1032 = _1028 + (-1.0);
    float _1034 = float(_1026);
    float _1036 = fma(_1030, _920, _920);
    float _1038 = float(_1008);
    float _1040 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = _740 + _746;
    float _1044 = _1010 * 0.15915493667125701904296875;
    float _1046 = _740 + (-0.5);
    float _1048 = _1038 * _1034;
    float _1050 = _748 + (-0.5);
    float _1052 = fma(_1040, _1030, _1040);
    float _1054 = _1042 + (-1.0);
    float _1056 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1036);
    float _1058 = _1048 * (-2.0);
    float _1060 = _1044 * 6.283185482025146484375;
    float _1062 = cos(_1060);
    float _1064 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1066 = fma(_1052, _994, _1056);
    float _1068 = fma(_1058, _922, _922);
    float _1070 = in.m_65.x;
    float _1072 = in.m_65.y;
    float _1074 = in.m_65.z;
    float _1076 = fma(_1064, _1058, _1064);
    float _1078 = _1066 * 0.15915493667125701904296875;
    float _1080 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1068);
    float _1082 = _1044 * 6.283185482025146484375;
    float _1084 = sin(_1082);
    float _1086 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1088 = fma(_1076, _994, _1080);
    float _1090 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1092 = _1088 * 0.15915493667125701904296875;
    float _1094 = _1078 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1100 = in.m_46.x;
    float _1102 = in.m_46.y;
    float _1104 = in.m_46.z;
    float _1106 = _1078 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1072);
    float _1112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1070);
    float _1114 = _1092 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1074);
    float _1120 = _1086 * _1110;
    float _1122 = _1098 * _1112;
    float _1124 = _1062 * _1096;
    float _1126 = _1084 * _1096;
    float _1128 = _1090 * _1118;
    float _1130 = _1092 * 6.283185482025146484375;
    float _1132 = sin(_1130);
    float _1134 = _1062 * _1108;
    float _1136 = _1084 * _1108;
    float _1138 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1140 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1138);
    float _1142 = _1062 * _1116;
    float _1144 = _1084 * _1116;
    float _1146 = _1108 * _1116;
    float _1148 = _1096 * _1116;
    float _1150 = _1142 * _1120;
    float _1152 = _1144 * _1120;
    float _1154 = fma(_1132, _1134, _1126);
    float _1156 = -_1120;
    float _1158 = _1132 * _1156;
    float _1160 = -_1124;
    float _1162 = fma(_1132, _1136, _1160);
    float _1164 = -_1136;
    float _1166 = fma(_1132, _1124, _1164);
    float _1168 = fma(_1154, _1122, _1150);
    float _1170 = fma(_1146, _1122, _1158);
    float _1172 = fma(_1132, _1126, _1134);
    float _1174 = fma(_1162, _1122, _1152);
    float _1176 = fma(_1166, _1128, _1168);
    float _1178 = fma(_1148, _1128, _1170);
    float _1180 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1182 = fma(_1172, _1128, _1174);
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1188 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1140);
    float _1190 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1180);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1184);
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1198 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    float _1202 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1190);
    float _1204 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1194);
    float _1206 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1214 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1198);
    float _1216 = _1196 + _1208;
    float _1218 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1206);
    float _1220 = _1210 + _1212;
    float _1222 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1214);
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1226 = _1216 + _1224;
    float _1228 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1218);
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1232 = _1220 + _1230;
    float _1234 = _1222 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1236 = _1226 * _1226;
    float _1238 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1242 = fma(_1232, _1232, _1236);
    float _1244 = _1234 + _1238;
    float _1246 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1240);
    float _1248 = sqrt(_1242);
    float _1250 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1246);
    bool _1252 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1228;
    float _1256 = _1100;
    float _1258 = _1238;
    float _1260 = _1220;
    float _1262 = _1244;
    if (!_1252)
    {
        _1254 = _1220;
    }
    float _1264 = _1254;
    float _1266 = _1264;
    if (!_1252)
    {
        _1256 = _1216;
    }
    float _1268 = _1256;
    float _1270 = _1268;
    if (!_1252)
    {
        _1258 = _1244;
    }
    float _1272 = _1258;
    bool _1274 = !_1252;
    float _1276 = _1272;
    if (!_1274)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1282 = _1248 + _1280;
        float _1284 = _1244 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1286 = rsqrt(_1242);
        float _1288 = _1282 * _1278;
        float _1290 = _1288 * 0.15915493667125701904296875;
        float _1292 = _1290 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        float _1296 = _1290 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294 + (-1.0);
        float _1302 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = fma(_1298, _1284, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1306 = fma(_1244, _1294, _1302);
        float _1308 = _1286 * _1304;
        float _1310 = fma(_1232, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1226, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1276 = _1306;
        _1266 = _1310;
        _1270 = _1312;
    }
    float _1314 = _1276;
    float _1316 = _1266;
    float _1318 = _1270;
    float _1320 = -_1234;
    float _1322 = _1320 + _1314;
    float _1324 = -_1210;
    float _1326 = _1324 + _1316;
    float _1328 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1330 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1332 = _1322 * _1322;
    float _1334 = -_1196;
    float _1336 = _1334 + _1318;
    float _1338 = 1.0 / _1328;
    float _1340 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1330);
    float _1342 = fma(_1326, _1326, _1332);
    float _1344 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1340);
    float _1346 = fma(_1336, _1336, _1342);
    bool _1348 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1350 = isnan(0.5);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1356 = _1352 || _1354;
    float _1358 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1360 = sqrt(_1346);
    float _1362 = _1358 + _1328;
    float _1364 = _1362 * _1338;
    float _1366 = _1364 * 0.5;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1370 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1368);
    bool _1372 = _1360 > 0.0;
    float _1374 = 1.0 / _1370;
    float _1376 = _1360;
    float _1378 = _1314;
    float _1380 = _1316;
    float _1382 = _1318;
    float _1384 = _1322;
    if (_1356)
    {
        _1376 = 1.0;
    }
    float _1386 = _1376;
    bool _1388 = !_1372;
    float _1390 = 0.0;
    float _1392 = _1386;
    if (!_1388)
    {
        float _1394 = _188 * _188;
        float _1396 = fma(_186, _186, _1394);
        float _1398 = fma(_190, _190, _1396);
        float _1400 = rsqrt(_1346);
        float _1402 = sqrt(_1398);
        float _1404 = _1322 * _1400;
        float _1406 = _1336 * _1400;
        bool _1408 = _1402 > 0.0;
        float _1410 = _1326 * _1400;
        bool _1412 = !_1408;
        _1390 = _1406;
        _1260 = _1410;
        if (!_1412)
        {
            float _1414 = rsqrt(_1398);
            float _1416 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1418 = _188 * _1414;
            float _1420 = _186 * _1414;
            float _1422 = _190 * _1414;
            float _1424 = _1404 * _1418;
            float _1426 = fma(_1410, _1420, _1424);
            float _1428 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1430 = fma(_1406, _1422, _1426);
            float _1432 = _1430 * _1428;
            float _1434 = fma(_186, _1432, _1316);
            float _1436 = fma(_188, _1432, _1314);
            float _1438 = fma(_190, _1432, _1318);
            _1378 = _1436;
            _1380 = _1434;
            _1382 = _1438;
            _1384 = _1432;
        }
    }
    float _1440 = _1378;
    float _1442 = _1380;
    float _1444 = _1382;
    float _1446 = _1390;
    float _1448 = _1260;
    float _1450 = _1384;
    float _1452 = _1450;
    if (_1356)
    {
        _1452 = 1.0;
    }
    float _1454 = _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1458 = _1374 * _1456;
    float _1460 = _1454;
    if (!_1356)
    {
        float _1462 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1464 = _1462 * 0.15915493667125701904296875;
        float _1466 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1468 = _1464 * 6.283185482025146484375;
        float _1470 = cos(_1468);
        float _1472 = _1466 * 0.15915493667125701904296875;
        float _1474 = _1464 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = 1.0 / _1470;
        float _1480 = _1472 * 6.283185482025146484375;
        float _1482 = cos(_1480);
        float _1484 = _1476 * _1478;
        float _1486 = _1472 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = _1482 * _1484;
        float _1492 = 1.0 / _1490;
        float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1496 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1494;
        float _1498 = 1.0 / _1496;
        float _1500 = _1488 * _1492;
        float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1504 = fma(_1458, _1500, _1502);
        float _1506 = _1504 * _1498;
        float _1508 = precise::clamp(_1506, 0.0, 1.0);
        _1392 = _1508;
    }
    float _1510 = _1392;
    if (!_1356)
    {
        float _1512 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1514 = _1512 * 0.15915493667125701904296875;
        float _1516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1518 = _1514 * 6.283185482025146484375;
        float _1520 = cos(_1518);
        float _1522 = _1516 * 0.15915493667125701904296875;
        float _1524 = _1514 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        float _1528 = 1.0 / _1520;
        float _1530 = _1522 * 6.283185482025146484375;
        float _1532 = cos(_1530);
        float _1534 = _1526 * _1528;
        float _1536 = _1522 * 6.283185482025146484375;
        float _1538 = sin(_1536);
        float _1540 = _1532 * _1534;
        float _1542 = 1.0 / _1540;
        float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1546 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1544;
        float _1548 = 1.0 / _1546;
        float _1550 = _1538 * _1542;
        float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1554 = fma(_1458, _1550, _1552);
        float _1556 = _1554 * _1548;
        float _1558 = precise::clamp(_1556, 0.0, 1.0);
        float _1560 = -_1558;
        float _1562 = _1560 + 1.0;
        _1460 = _1562;
    }
    float _1564 = _1460;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1440 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1572 = _1442 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1576 = _1444 + _1574;
    float _1578 = _1568 * _1568;
    float _1580 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1582 = fma(_1572, _1572, _1578);
    float _1584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1586 = fma(_1576, _1576, _1582);
    float _1588 = precise::max(0.0, _1584);
    float _1590 = rsqrt(_1586);
    float _1592 = sqrt(_1586);
    float _1594 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1596 = _1572 * _1594;
    float _1598 = _1576 * _1594;
    float _1600 = -_1594;
    float _1602 = -_1588;
    float _1604 = fma(_1568, _1600, _1602);
    float _1606 = _1596 * _1596;
    float _1608 = _1598 * _1598;
    float _1610 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1612 = _1606 + _1608;
    float _1614 = floor(_1610);
    float _1616 = sqrt(_1612);
    bool _1618 = _1616 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1622 = _1616 + _1620;
    float _1624 = _1446;
    float _1626 = _1568;
    float _1628 = _1612;
    float _1630 = _1622;
    float _1632 = _1596;
    float _1634 = _1598;
    float _1636 = _1606;
    float _1638 = _1608;
    if (_1618)
    {
        float _1640 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1618)
    {
        float _1644 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1644;
    }
    float _1646 = _1626;
    float _1648 = _1646;
    if (_1618)
    {
        float _1650 = rsqrt(_1612);
        _1628 = _1650;
    }
    float _1652 = _1628;
    float _1654 = _1642;
    float _1656 = _1652;
    if (_1618)
    {
        float _1658 = _1622 * _1642;
        _1630 = _1658;
    }
    float _1660 = _1630;
    if (_1618)
    {
        float _1662 = _1660 * 0.15915493667125701904296875;
        _1654 = _1662;
    }
    float _1664 = _1654;
    float _1666 = _1448;
    if (_1618)
    {
        float _1668 = _1664 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1666 = _1670;
    }
    float _1672 = _1666;
    float _1674 = _1660;
    if (_1618)
    {
        float _1676 = _1664 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = _1672;
    if (_1618)
    {
        float _1684 = fma(_1672, _1646, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1262 = _1684;
    }
    float _1686 = _1262;
    float _1688 = _1686;
    if (!_1618)
    {
        _1648 = _1604;
    }
    float _1690 = _1648;
    float _1692 = _1690;
    if (_1618)
    {
        float _1694 = _1652 * _1686;
        _1688 = _1694;
    }
    float _1696 = _1688;
    if (_1618)
    {
        float _1698 = _1680 + (-1.0);
        _1682 = _1698;
    }
    float _1700 = _1682;
    if (_1618)
    {
        float _1702 = _1596 * _1696;
        _1632 = _1702;
    }
    float _1704 = _1632;
    if (_1618)
    {
        float _1706 = _1598 * _1696;
        _1634 = _1706;
    }
    float _1708 = _1634;
    float _1710 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1618)
    {
        float _1712 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1656 = _1712;
    }
    float _1714 = _1656;
    if (_1618)
    {
        float _1716 = _1704 * _1704;
        _1636 = _1716;
    }
    float _1718 = _1636;
    if (_1618)
    {
        float _1720 = _1708 * _1708;
        _1638 = _1720;
    }
    float _1722 = _1638;
    if (_1618)
    {
        float _1724 = fma(_1604, _1680, _1714);
        _1692 = _1724;
    }
    float _1726 = _1692;
    float _1728 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1730 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1710);
    float _1732 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1580);
    float _1734 = fma(_1726, _1726, _1718);
    float _1736 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1728);
    float _1738 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1730);
    float _1740 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1742 = _1734 + _1722;
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1746 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1750 = fma(_1592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1748);
    float _1752 = precise::clamp(_1750, 0.0, 1.0);
    float _1754 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1736);
    float _1756 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1758 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1746);
    float _1760 = -_1752;
    float _1762 = _1760 + 1.0;
    float _1764 = rsqrt(_1742);
    float _1766 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1768 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1758);
    float _1770 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1774 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1776 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1778 = abs(_1762);
    float _1780 = log2(_1778);
    float _1782 = -_1772;
    float _1784 = fma(_1782, _1744, 1.0);
    float _1786 = fma(_1196, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1788 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1776);
    float _1790 = -_1614;
    float _1792 = _1610 + _1790;
    float _1794 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1796 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1798 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1788);
    float _1800 = _1764 * _1704;
    float _1802 = _1764 * _1726;
    float _1804 = _1764 * _1708;
    float _1806 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1798);
    float _1808 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1810 = floor(_1786);
    float _1812 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1796);
    float _1814 = -_1808;
    float _1816 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1814);
    float _1818 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1820 = -_1804;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1816);
    float _1824 = log2(_1784);
    float _1826 = fma(_1822, -0.5, 0.5);
    float _1828 = fma(_1822, 0.5, 0.5);
    float _1830 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1794);
    float _1832 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1812);
    float _1834 = exp2(_1818);
    float _1836 = fma(_1828, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1838 = -_1810;
    float _1840 = _1786 + _1838;
    float _1842 = _1802 + 1.0;
    float _1844 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1830);
    float _1846 = fma(_1828, _1836, -0.212114393711090087890625);
    float _1848 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1832);
    float _1850 = 1.0 / _1806;
    float _1852 = fma(_1828, _1846, 1.570728778839111328125);
    float _1854 = _1824 * 0.693147182464599609375;
    float _1856 = sqrt(_1826);
    float _1858 = -_1802;
    float _1860 = fma(_1834, _1842, _1858);
    float _1862 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1844);
    float _1864 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1866 = fma(_1860, 0.5, 0.5);
    float _1868 = _1862 * _1850;
    float _1870 = _1848 * _1850;
    float _1872 = _1856 * 0.636619746685028076171875;
    float _1874 = fma(_1868, 0.5, 0.5);
    float _1876 = fma(_1870, -0.5, 0.5);
    float _1878 = -_1852;
    float _1880 = fma(_1872, _1878, 1.0);
    float2 _5929 = float2(_1792, _1840);
    float _1882 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5929, float2(0.0), isnan(_5929)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5929, float2(0.0), isnan(_5929)), level(0.0)).x;
    float3 _5940 = float3(_1874, _1876, _1864);
    float _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5940, float3(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5940, float3(0.0), isnan(_5940)), level(0.0)).x;
    float3 _5951 = float3(_1874, _1876, _1864);
    float4 _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5951, float3(0.0), isnan(_5951)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5951, float3(0.0), isnan(_5951)), level(0.0)).xyzw;
    float _1889 = _1887.x;
    float _1891 = _1887.y;
    float _1893 = _1887.z;
    float _1895 = _1887.w;
    float2 _5967 = float2(_1880, _1866);
    float3 _1899 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5967, float2(0.0), isnan(_5967)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5967, float2(0.0), isnan(_5967)), level(0.0)).xyz;
    float _1901 = _1899.x;
    float _1903 = _1899.y;
    float _1905 = _1899.z;
    float _1907 = float(uint(_912));
    float _1909 = trunc(_962);
    int _1911 = int(_1909);
    float _1913 = _990 * _168;
    bool _1915 = _912 == 0;
    float _1917 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1919 = ~_912;
    int _1921 = _1919 + 1;
    int _1923 = abs(_824);
    float _1925 = 1.0 / _1907;
    int _1927 = abs(_864);
    float _1929 = float(uint(_1911));
    float _1931 = trunc(_1913);
    int _1933 = int(_1931);
    int _1935 = as_type<int>(_1925) + (-2);
    float _1937 = exp2(_1917);
    float _1939 = as_type<float>(_1935) * _1929;
    float _1941 = trunc(_1939);
    float _1943 = precise::max(_1941, 0.0);
    uint _1946 = uint(_1943);
    int _1948 = ~_912;
    int _1950 = _1948 + 1;
    float _1952 = -_1937;
    float _1954 = _1952 + 1.0;
    float _1956 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1958 = _1921 * int(_1946);
    int _1960 = _1958 + _1911;
    float _1962 = float(uint(_1960));
    float _1964 = as_type<float>(_1935) * _1962;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1968 = _1966 != 0;
    float _1970 = trunc(_1964);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    bool _1976 = !_1968;
    float _1978 = _1976 ? 7.345489978790283203125 : 1.0;
    float _1980 = _1978 * _746;
    float _1982 = floor(_1980);
    int _1984 = int(_1946) + int(_1974);
    float _1986 = float(_1911);
    int _1988 = _1950 * _1984;
    int _1990 = _1988 + _1911;
    bool _1992 = _1986 >= _960;
    bool _1994 = isnan(_1986);
    bool _1996 = _1992 || _1994;
    bool _1998 = isnan(_960);
    bool _2000 = _1996 || _1998;
    float _2002 = float(_2000);
    bool _2004 = uint(_1990) >= uint(_912);
    float _2006 = trunc(_2002);
    int _2008 = int(_2006);
    float _2010 = -_1982;
    float _2012 = _1980 + _2010;
    float _2014 = _2012 * _960;
    bool _2016 = !_2004;
    int _2018 = _2016 ? 0 : (-1);
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2022 = _2020 != 0;
    float _2024 = trunc(_2014);
    int _2026 = int(_2024);
    int _2028 = ~_1984;
    int _2030 = _2028 + _2018;
    int _2032 = _2030 + 1;
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2036 = _2034 != 0;
    int _2038 = ~_2008;
    int _2040 = _2038 + 1;
    int _2042 = _2040 + 1;
    int _2044 = _912 * _2032;
    int _2046 = _2044 + _1911;
    int _2048 = _912 + (-1);
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2052 = _2050 != 0;
    bool _2054 = !_1915;
    int _2056 = _2054 ? _2046 : (-1);
    bool _2058 = !_2022;
    int _2060 = _2058 ? 0 : 1;
    int _2062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2064 = _2062 != 0;
    int _2066 = _2056 * _2042;
    int _2068 = abs(_2060);
    int _2070 = abs(_840);
    int _2072 = _2008 * _2048;
    int _2074 = _2072 + _2066;
    bool _2076 = !_2064;
    int _2078 = _2076 ? 0 : 1;
    int _2080 = _2026 * _2068;
    int _2082 = _2080 + _1911;
    float _2084 = in.m_67.y;
    int _2086 = _2074 * _1923;
    int _2088 = abs(_2078);
    int _2090 = _1933 * _2070;
    int _2092 = _2090 + _2086;
    bool _2094 = _748 > 0.5;
    int _2096 = _2082 * _1927;
    int _2098 = _2096 + _2092;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2104 = as_type<float>(_1927);
    if (_2036)
    {
        float _2106 = in.m_57.x;
        _2104 = _2106;
    }
    float _2108 = _2104;
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2110;
    int _2114 = _2026 * _2088;
    int _2116 = _2114 + _2098;
    int _2118 = ~_912;
    int _2120 = _2118 + 1;
    float _2122 = in.m_67.x;
    float _2124 = 1.0 / _2102;
    int _2126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2128 = _2126 != 0;
    float _2130 = float(uint(_2116));
    bool _2132 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2134 = isnan(_738);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = as_type<float>(_1935) * _2130;
    float _2146 = -_2084;
    float _2148 = _2146 + 1.0;
    float _2150 = trunc(_2144);
    float _2152 = precise::max(_2150, 0.0);
    uint _2154 = uint(_2152);
    float _2156 = _2084;
    if (_2052)
    {
        float _2158 = _2094 ? _2148 : _2084;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = _2112 * _2124;
    float _2164 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2166 = _738 + _2164;
    bool _2168 = _1072 != 0.0;
    bool _2170 = isnan(_1072);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(0.0);
    bool _2176 = _2172 || _2174;
    bool _2178 = _2108 > 0.5;
    bool _2180 = _2178 && _2036;
    float _2182 = fma(_2162, _2166, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2184 = float(uint(_2082));
    float _2186 = -_2142;
    float _2188 = _2186 + 1.0;
    int _2190 = ~_912;
    int _2192 = _2190 + 1;
    float _2194 = as_type<float>(_1935) * _2184;
    int _2196 = _2120 * int(_2154);
    int _2198 = _2196 + _2116;
    int _2200 = ~_912;
    int _2202 = _2200 + 1;
    bool _2204 = _1070 == 0.0;
    bool _2206 = !_2176;
    bool _2208 = _2204 && _2206;
    float _2210 = float(uint(_2198));
    float _2212 = trunc(_2194);
    float _2214 = precise::max(_2212, 0.0);
    uint _2216 = uint(_2214);
    bool _2218 = _1074 == 0.0;
    bool _2220 = _2218 && _2208;
    float _2222 = as_type<float>(_1935) * _2210;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2224 = trunc(_2222);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    float _2230 = in.m_71.x;
    float _2232 = in.m_71.y;
    float _2234 = in.m_71.z;
    int _2236 = int(_2154) + int(_2228);
    bool _2238 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2240 = isnan(_738);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2122;
    if (_2036)
    {
        _888 = _2122;
    }
    float _2252 = _888;
    int _2254 = _2202 * _2236;
    int _2256 = _2254 + _2116;
    float _2258 = _2248 * _2188;
    float _2260 = _2252;
    if (_2180)
    {
        float _2262 = -_2252;
        float _2264 = _2262 + 1.0;
        _2260 = _2264;
    }
    float _2266 = _2260;
    float _2268 = _2234;
    float _2270 = _2232;
    float _2272 = _2230;
    if (!_2220)
    {
        float _2274 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2234);
        _2268 = _2274;
    }
    float _2276 = _2268;
    float _2278 = _2182 * _2258;
    float _2280 = -_2248;
    float _2282 = _2280 + 1.0;
    if (!_2220)
    {
        float _2284 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2232);
        _2270 = _2284;
    }
    float _2286 = _2270;
    if (_2036)
    {
        _2250 = _2266;
    }
    float _2288 = _2250;
    float _2290 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2292 = uint(_2256) >= uint(_912);
    int _2294 = _2192 * int(_2216);
    int _2296 = _2294 + _2082;
    float _2298 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2278);
    float _2300 = -_788;
    float _2302 = fma(_916, _2290, _2300);
    bool _2304 = !_2292;
    int _2306 = _2304 ? 0 : (-1);
    float _2308 = fma(_2288, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2310 = float(uint(_2296));
    float _2312 = _2302 + 0.5;
    int _2314 = ~_2236;
    int _2316 = _2314 + _2306;
    int _2318 = _2316 + 1;
    float _2320 = fma(_924, _2308, _780);
    float _2322 = abs(_1458);
    float _2324 = log2(_2322);
    float _2326 = as_type<float>(_1935) * _2310;
    float _2328 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2298);
    int _2330 = _912 * _2318;
    int _2332 = _2330 + _2116;
    float _2334 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2336 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2338 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_2220)
    {
        float _2340 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2230);
        _2272 = _2340;
    }
    float _2342 = _2272;
    float _2344 = trunc(_2326);
    float _2346 = precise::max(_2344, 0.0);
    uint _2348 = uint(_2346);
    bool _2350 = !_1915;
    int _2352 = _2350 ? _2332 : (-1);
    float _2354 = _2320 + 0.5;
    float _2356 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2358 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2360 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2362 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2364 = ~_912;
    int _2366 = _2364 + 1;
    float _2368 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2370 = _2352 >> 31;
    out.m_73.x = _2354;
    out.m_73.y = _2312;
    int _2372 = _2370 & 3;
    float _2374 = exp2(_2368);
    out.m_75.x = _2356;
    out.m_75.y = _2358;
    out.m_75.z = _2360;
    out.m_75.w = _2362;
    int _2376 = int(_2216) + int(_2348);
    float _2378 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2380 = _2352 + _2372;
    float _2382 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2384 = _2380 >> 2;
    int _2386 = _2352 & 3;
    bool _2388 = _2386 != 0;
    int _2390 = _2366 * _2376;
    int _2392 = _2390 + _2082;
    bool _2394 = _1458 <= 8000.0;
    bool _2396 = isnan(_1458);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(8000.0);
    bool _2402 = _2398 || _2400;
    float _2404 = float(_2402);
    float _2406 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2408 = -_1132;
    float _2410 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2378);
    float _2412 = -_1132;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2382);
    float _2416 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2418 = -_1132;
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2406);
    int _2422 = _2384 << 4;
    int _2424 = _2422 + 368;
    float _2426 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    float _2430 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2410);
    float _2432 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2414);
    uint _2434 = uint(int(uint(_2424) >> uint(2)));
    uint _2436 = uint(int(uint(int(_2434)) >> uint(2)));
    int _2438 = int(_2434) & 3;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[int(_2436)][_2438];
    int _2442 = int(_2434) + 1;
    uint _2444 = uint(int(uint(_2442) >> uint(2)));
    int _2446 = _2442 & 3;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[int(_2444)][_2446];
    float _2450 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2420);
    float _2452 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2454 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2416);
    int _2456 = _2352 & 3;
    bool _2458 = _2456 != 0;
    float _2460 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2462 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2452);
    float _2464 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2466 = _2424 + 8;
    uint _2468 = uint(int(uint(_2466) >> uint(2)));
    uint _2470 = uint(int(uint(int(_2468)) >> uint(2)));
    int _2472 = int(_2468) & 3;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[int(_2470)][_2472];
    int _2476 = int(_2468) + 1;
    uint _2478 = uint(int(uint(_2476) >> uint(2)));
    int _2480 = _2476 & 3;
    float _2482 = (*spvDescriptorSet0.vp_c9)._m0[int(_2478)][_2480];
    bool _2484 = uint(_2456) > 1u;
    float _2486 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2488 = uint(_2392) >= uint(_912);
    float _2490 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2460);
    float _2492 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2464);
    float _2494 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2486);
    float _2496 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2498 = _2432 * _2286;
    int _2500 = _2388 ? 0 : 1;
    float _2502 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2490);
    float _2504 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2496);
    float _2506 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2492);
    int _2508 = ~_2500;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2494);
    int _2516 = _2512;
    if (!_2484)
    {
        int _2518 = ~_2500;
        int _2520 = _2518 + 1;
        _2516 = _2520;
    }
    int _2522 = _2516;
    float _2524 = _2430 * _2286;
    bool _2526 = _2456 != 3;
    float _2528 = _2450 * _2286;
    float _2530 = fma(_2502, _2342, _2524);
    bool _2532 = uint(_2456) >= 2u;
    float _2534 = fma(_2506, _2342, _2498);
    int _2536 = abs(_2522);
    float _2538 = fma(_2428, -2.0, 3.0);
    float _2540 = _2428 * _2428;
    int _2542 = _2532 ? 0 : 1;
    float _2544 = fma(_2514, _2342, _2528);
    bool _2546 = !_2458;
    int _2548 = _2546 ? 0 : 1;
    float _2550 = _2540 * _2538;
    int _2552 = ~_2536;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    float _2558 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2462);
    bool _2560 = _2456 != 3;
    float _2562 = -_1882;
    float _2564 = _2562 + 1.0;
    int _2566 = ~_2542;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = _1956 * _1884;
    int _2574 = abs(_2548);
    float _2576 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2454);
    int _2578 = _2570;
    if (_2526)
    {
        int _2580 = ~_2542;
        int _2582 = _2580 + 1;
        _2578 = _2582;
    }
    int _2584 = _2578;
    int _2586 = _2556 * as_type<int>(_2448);
    bool _2588 = !_2560;
    int _2590 = _2588 ? 0 : (-1);
    float _2592 = _1905 * _2572;
    bool _2594 = !_2128;
    int _2596 = _2594 ? 0 : 1;
    float _2598 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2504);
    int _2600 = abs(_2584);
    float _2602 = fma(_2576, _2276, _2534);
    int _2604 = ~_2574;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    float _2610 = fma(_1895, _2592, _1893);
    int _2612 = abs(_2590);
    int _2614 = abs(_2596);
    int _2616 = _2608 * as_type<int>(_2440);
    int _2618 = _2616 + _2586;
    bool _2620 = !_2488;
    int _2622 = _2620 ? 0 : (-1);
    int _2624 = ~_2600;
    int _2626 = _2624 + 1;
    int _2628 = _2626 + 1;
    float _2630 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2632 = ~_2376;
    int _2634 = _2632 + _2622;
    int _2636 = _2634 + 1;
    int _2638 = ~_2612;
    int _2640 = _2638 + 1;
    int _2642 = _2640 + 1;
    int _2644 = _2628 * as_type<int>(_2474);
    int _2646 = _2644 + _2618;
    float _2648 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2630);
    int _2650 = _912 * _2636;
    int _2652 = _2650 + _2082;
    float _2654 = fma(_2558, _2276, _2530);
    int _2656 = _2642 * as_type<int>(_2482);
    int _2658 = _2656 + _2646;
    float _2660 = -_2550;
    float _2662 = _2660 + 1.0;
    float _2664 = in.m_77.x;
    int _2666 = ~_2614;
    int _2668 = _2666 + 1;
    int _2670 = _2668 + 1;
    float _2672 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2648);
    float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2550);
    bool _2676 = !_1915;
    int _2678 = _2676 ? _2652 : (-1);
    float _2680 = fma(_2598, _2276, _2544);
    int _2682 = _2658 * _2670;
    float _2684 = _2404 * _2674;
    float _2686 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2672);
    int _2688 = _2678 * _2614;
    int _2690 = _2688 + _2682;
    float _2692 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2694 = _2686 + _1806;
    float _2696 = _1895 * _2572;
    float _2698 = _2564 * _2692;
    float _2700 = precise::clamp(_2698, 0.0, 1.0);
    float _2702 = _2694 * 0.5;
    float _2704 = -_1956;
    float _2706 = _2704 + 1.0;
    float _2708 = fma(_1901, _2696, _1889);
    float _2710 = -_2700;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2714 = fma(_1903, _2696, _1891);
    out.m_79.z = _2702;
    out.m_79.w = _1806;
    float _2716 = _1895 * _2706;
    bool _2718 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2720 = isnan(_1592);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2726 = _2722 || _2724;
    float _2728 = _2712 * _2664;
    out.gl_Position.x = _1862;
    out.gl_Position.y = _1848;
    out.gl_Position.z = _2686;
    out.gl_Position.w = _1806;
    float _2730 = float(_2690);
    out.m_81.x = _2708;
    out.m_81.y = _2714;
    out.m_81.z = _2610;
    out.m_81.w = _2716;
    float _2732 = _2728 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2734 = _1510 * _1564;
    out.m_83.x = _2654;
    out.m_83.y = _2602;
    out.m_83.z = _2680;
    float _2736 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_85.x = _2732;
    float _2738 = _2702;
    float _2740 = _2592;
    float _2742 = _2696;
    float _2744 = _2706;
    float _2746 = _2734;
    float _2748 = _2730;
    if (!_2726)
    {
        _2738 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2750 = _2738;
    float _2752 = _2750;
    float _2754 = _2750;
    if (!_2726)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2756 = _2740;
    out.m_87.x = _2730;
    float _2758 = _2756;
    float _2760 = _2756;
    if (!_2726)
    {
        _2742 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2762 = _2742;
    float _2764 = _2762;
    float _2766 = _2762;
    if (!_2726)
    {
        _2744 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2768 = _2744;
    float _2770 = _2768;
    float _2772 = _2768;
    if (!_2726)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2774 = _2746;
    float _2776 = _2774;
    float _2778 = _2774;
    if (!_2726)
    {
        _2748 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2780 = _2748;
    bool _2782 = !_2726;
    float _2784 = _2780;
    float _2786 = _2780;
    if (!_2782)
    {
        bool _2788 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2790 = isnan(_1592);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2796 = _2792 || _2794;
        if (!_2796)
        {
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2800 = _1592 + _2798;
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2804 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2802;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2810 = 1.0 / _2804;
            float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2828 = _2800 * _2810;
            float _2830 = precise::clamp(_2828, 0.0, 1.0);
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2836 = fma(_2830, _2808, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2838 = fma(_2830, _2834, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2840 = fma(_2830, _2814, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2842 = fma(_2830, _2818, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2844 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2846 = fma(_2830, _2826, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2786 = _2840;
            _2772 = _2844;
            _2754 = _2836;
            _2766 = _2842;
            _2760 = _2838;
            _2778 = _2846;
            _2848 = true;
        }
        else
        {
            bool _2850 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2852 = isnan(_1592);
            bool _2854 = _2850 || _2852;
            bool _2856 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2858 = _2854 || _2856;
            if (!_2858)
            {
                _2752 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2860 = _2752;
            _2754 = _2860;
            if (!_2858)
            {
                _2784 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2862 = _2784;
            _2786 = _2862;
            if (!_2858)
            {
                _2758 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2864 = _2758;
            _2760 = _2864;
            if (!_2858)
            {
                _2764 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2866 = _2764;
            _2766 = _2866;
            if (!_2858)
            {
                _2770 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2868 = _2770;
            _2772 = _2868;
            if (!_2858)
            {
                _2776 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2870 = _2776;
            bool _2872 = !_2858;
            _2778 = _2870;
            if (!_2872)
            {
                bool _2874 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2876 = isnan(_1592);
                bool _2878 = _2874 || _2876;
                bool _2880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2882 = _2878 || _2880;
                if (!_2882)
                {
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2886 = _1592 + _2884;
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2890 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2888;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2896 = 1.0 / _2890;
                    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2900 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2914 = _2886 * _2896;
                    float _2916 = precise::clamp(_2914, 0.0, 1.0);
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2922 = fma(_2916, _2894, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2924 = fma(_2916, _2920, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2926 = fma(_2916, _2900, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2928 = fma(_2916, _2904, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2930 = fma(_2916, _2908, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2932 = fma(_2916, _2912, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2786 = _2926;
                    _2772 = _2930;
                    _2754 = _2922;
                    _2766 = _2928;
                    _2760 = _2924;
                    _2778 = _2932;
                    _2848 = true;
                }
                else
                {
                    _2786 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2772 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2754 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2766 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2760 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2778 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2848 = false;
    float _2934 = _2786;
    float _2936 = _2772;
    float _2938 = _2754;
    float _2940 = _2766;
    float _2942 = _2760;
    float _2944 = _2778;
    float _2946 = fma(_2602, -0.5, 0.5);
    float _2948 = precise::clamp(_2946, 0.0, 1.0);
    float _2950 = -_2934;
    float _2952 = _2950 + _2936;
    float _2954 = _2736 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2956 = -_2938;
    float _2958 = _2956 + _2940;
    out.m_89.x = 0.0;
    float _2960 = fma(_2948, _2952, _2934);
    float _2962 = fma(_2948, _2958, _2938);
    out.m_53.x = _2954;
    float _2964 = -_2942;
    float _2966 = _2964 + _2944;
    float _2968 = _2960 * 0.586610972881317138671875;
    bool _2970 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2972 = fma(_2948, _2966, _2942);
    float _2974 = fma(_2962, 0.298911988735198974609375, _2968);
    bool _2976 = _1510 > 0.0;
    bool _2978 = isnan(_1510);
    bool _2980 = _2976 || _2978;
    bool _2982 = isnan(0.0);
    bool _2984 = _2980 || _2982;
    float _2986 = fma(_2972, 0.114477999508380889892578125, _2974);
    bool _2988 = _1564 <= 0.0;
    bool _2990 = !_2984;
    bool _2992 = _2988 || _2990;
    float _2994 = -_2986;
    float _2996 = _2962 + _2994;
    float _2998 = -_2986;
    float _3000 = _2960 + _2998;
    float _3002 = -_2986;
    float _3004 = _2972 + _3002;
    float _3006 = fma(_2996, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2986);
    float _3008 = fma(_3000, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2986);
    float _3010 = fma(_3004, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2986);
    bool _3012 = !_2970;
    if (!_3012)
    {
        float _3014 = -_1440;
        float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3018 = -_1442;
        float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3022 = -_1444;
        float _3024 = _3022 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3026 = _3016 * _3016;
        float _3028 = fma(_3020, _3020, _3026);
        float _3030 = fma(_3024, _3024, _3028);
        float _3032 = sqrt(_3030);
        float _3034 = rsqrt(_3030);
        float _3036 = -_3032;
        float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3040 = _3038 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3042 = precise::clamp(_3040, 0.0, 1.0);
        float _3044 = _3020 * _3034;
        float _3046 = _3016 * _3034;
        float _3048 = abs(_3042);
        float _3050 = log2(_3048);
        float _3052 = _3024 * _3034;
        float _3054 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3056 = _2602 * _3046;
        float _3058 = -_3046;
        float _3060 = -_3054;
        float _3062 = fma(_3058, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3060);
        float _3064 = fma(_2654, _3044, _3056);
        float _3066 = -_3052;
        float _3068 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3062);
        float _3070 = fma(_2680, _3052, _3064);
        float _3072 = precise::clamp(_3070, 0.0, 1.0);
        float _3074 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3076 = _3068 + _3074;
        float _3078 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3080 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3082 = precise::clamp(_3080, 0.0, 1.0);
        float _3084 = exp2(_3078);
        float _3086 = _3084 * _3082;
        float _3088 = _3072 * _3086;
        float _3090 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3092 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3094 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3090;
        out.m_89.y = _3092;
        out.m_89.z = _3094;
    }
    out.m_91.x = _3006;
    out.m_91.y = _3008;
    out.m_91.z = _3010;
    if (!_2992)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3096 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3096;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2848 = false;
    bool _632 = false;
    bool _496 = false;
    bool _322 = false;
    bool _214 = false;
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
        float _3164 = as_type<float>(_134);
        out.gl_Position.z = _3164;
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
        float _3219 = as_type<float>(_160);
        out.gl_Position.z = _3219;
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
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _254;
    float _258 = 1.0 / _236;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _248 * _252;
    float _264 = -_248;
    float _266 = _264 + 1.0;
    float _268 = _220 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_256, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = fma(_278, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _274 * _262;
    float _286 = _282 * _262;
    float _288 = _280 * _262;
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _292 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _294 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _302 = !_260;
    float _320;
    if (!_302)
    {
        float _304 = in.m_57.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _172;
    }
    _322 = false;
    float _324 = _320;
    float _326 = in.m_59.x;
    float _328 = in.m_59.y;
    float _330 = in.m_59.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = _324 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _344 = 1.0 / _338;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = 1.0 / _342;
    float _350 = _334 * _344;
    bool _352 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _354 = isnan(_324);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _300 * _330;
    float _366 = _298 * _328;
    bool _368 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _370 = isnan(_324);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _324 + _380;
    float _384 = -_362;
    float _386 = _384 + 1.0;
    bool _388 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _390 = isnan(_324);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = -_378;
    float _406 = _404 + 1.0;
    float _408 = _378 * _386;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = _398 * _406;
    float _420 = fma(_402, _350, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _422 = fma(_412, _350, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_416, _350, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = _382 * _348;
    float _428 = -_398;
    float _430 = _428 + 1.0;
    float _432 = _422 * _418;
    float _434 = _424 * _418;
    float _436 = _420 * _418;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _450 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[107].x, _432);
    float _452 = fma(_440, _426, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _454 = fma(_444, _426, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _456 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[107].y, _434);
    float _458 = fma(_448, _426, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _460 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[107].z, _436);
    float _462 = fma(_452, _408, _450);
    float _464 = fma(_454, _408, _456);
    float _466 = fma(_458, _408, _460);
    float _468 = _296 * _326;
    float _470 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].x, _462);
    float _472 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].y, _464);
    float _474 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].z, _466);
    bool _476 = !_346;
    float _494;
    if (!_476)
    {
        float _478 = in.m_57.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        _494 = _172;
    }
    _496 = false;
    float _498 = _494;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _498 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = isnan(_498);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _524 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _526 = isnan(_498);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _536;
    bool _540 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _542 = isnan(_498);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _506;
    float _554 = -_518;
    float _556 = _554 + 1.0;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _560 = 1.0 / _522;
    float _562 = _538 * _552;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _568 = -_550;
    float _570 = _568 + 1.0;
    float _572 = fma(_562, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _574 = _534 * _556;
    float _576 = -_534;
    float _578 = _576 + 1.0;
    float _580 = _518 * _570;
    float _582 = _566 * _560;
    float _584 = _572 * _574;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = _498 + _586;
    float _590 = _470 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _592 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _594 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[115].x, _584);
    float _596 = fma(_582, _588, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _598 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _600 = fma(_596, _580, _594);
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _608 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _602;
    out.m_61.y = _604;
    out.m_61.z = _608;
    out.m_61.w = _610;
    bool _612 = !_558;
    float _630;
    if (!_612)
    {
        float _614 = in.m_57.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        _630 = _172;
    }
    _632 = false;
    float _634 = _630;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _638 = _634 + _636;
    bool _640 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _642 = isnan(_634);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _652;
    bool _656 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _658 = isnan(_634);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -_650;
    float _670 = _668 + 1.0;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _672;
    float _676 = 1.0 / _654;
    bool _678 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _680 = _666 * _670;
    float _682 = -_666;
    float _684 = _682 + 1.0;
    float _686 = _638 * _676;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _688;
    float _692 = fma(_674, _686, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _694;
    float _698 = fma(_690, _686, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _700 = _692 * _680;
    float _702 = fma(_696, _686, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _704 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].x, _700);
    float _706 = _702 * _680;
    float _708 = _698 * _680;
    float _710 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].x, _704);
    float _712 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].y, _706);
    float _714 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].z, _708);
    float _716 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].y, _712);
    float _718 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].z, _714);
    bool _720 = !_678;
    if (!_720)
    {
        float _722 = in.m_57.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _194 = _736;
    }
    float _738 = _194;
    float _740 = in.m_57.z;
    float _742 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _744 = log2(_742);
    float _746 = in.m_57.x;
    float _748 = in.m_57.y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _754 = int(_752);
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _758 = _740 * 2.0;
    float _760 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _762 = _746 * 2.0;
    float _764 = floor(_758);
    float _766 = _748 * 2.0;
    float _768 = -_750;
    float _770 = fma(_760, 2.0, _768);
    float _772 = _744 * _116;
    float _774 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _776 = _748 + _746;
    float _778 = -_116;
    float _780 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[76].x, _770);
    float _782 = floor(_762);
    float _784 = fma(_774, -2.0, _756);
    float _786 = _776 + (-1.0);
    float _788 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    float _790 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _792 = _764 >= 0.0;
    bool _794 = isnan(_764);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = exp2(_772);
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _814 = _812 != 0;
    int _816 = _800 ? 0 : 1;
    bool _818 = _782 > 0.0;
    float _820 = floor(_766);
    bool _822 = !_810;
    int _824 = _822 ? 0 : 1;
    bool _826 = _764 > 0.0;
    bool _828 = _782 >= 0.0;
    bool _830 = isnan(_782);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    bool _838 = !_806;
    int _840 = _838 ? 0 : 1;
    float _842 = -_802;
    float _844 = _842 + 1.0;
    bool _846 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _854 = _850 || _852;
    int _856 = ~_816;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    bool _862 = !_814;
    int _864 = _862 ? 0 : 1;
    float _866 = _854 ? _844 : 0.0;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _870 = _820 > 0.0;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _874 = _820 >= 0.0;
    bool _876 = isnan(_820);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _868);
    int _886 = _860;
    float _888 = _738;
    if (!_826)
    {
        int _890 = ~_816;
        int _892 = _890 + 1;
        _886 = _892;
    }
    int _894 = _886;
    float _896 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _872);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _900 = _898 != 0;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _908 = _906 != 0;
    float _910 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _912 = int(_910);
    float _914 = float(_754);
    float _916 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _918 = in.m_63.x;
    float _920 = in.m_63.y;
    float _922 = in.m_63.z;
    float _924 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _884);
    bool _926 = !_900;
    int _928 = _926 ? 0 : 1;
    float _930 = 1.0 / _914;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _934 = 1.0 + _932;
    float _936 = float(_894);
    int _938 = _836 ? 0 : 1;
    bool _940 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(1.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = 1.0 / _934;
    int _952 = abs(_928);
    bool _954 = !_904;
    int _956 = _954 ? 0 : 1;
    float _958 = float(_952);
    float _960 = float(_912);
    float _962 = _930 * _116;
    int _964 = ~_938;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    float _970 = _958 * _936;
    int _972 = _968;
    if (!_818)
    {
        int _974 = ~_938;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    float _980 = _746 + (-0.5);
    int _982 = abs(_956);
    float _984 = _970 * (-2.0);
    bool _986 = !_908;
    int _988 = _986 ? 0 : 1;
    float _990 = _960 * _116;
    if (_948)
    {
        float _992 = _866 * _950;
        _126 = _992;
    }
    float _994 = _126;
    float _996 = fma(_984, _918, _918);
    int _998 = _882 ? 0 : 1;
    float _1000 = fma(_790, _984, _790);
    float _1002 = float(_978);
    float _1004 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[196].x, _996);
    float _1006 = float(_982);
    int _1008 = abs(_988);
    float _1010 = fma(_1000, _994, _1004);
    int _1012 = ~_998;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    float _1018 = _1006 * _1002;
    int _1020 = _1016;
    if (!_870)
    {
        int _1022 = ~_998;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = _748 + _740;
    float _1030 = _1018 * (-2.0);
    float _1032 = _1028 + (-1.0);
    float _1034 = float(_1026);
    float _1036 = fma(_1030, _920, _920);
    float _1038 = float(_1008);
    float _1040 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = _740 + _746;
    float _1044 = _1010 * 0.15915493667125701904296875;
    float _1046 = _740 + (-0.5);
    float _1048 = _1038 * _1034;
    float _1050 = _748 + (-0.5);
    float _1052 = fma(_1040, _1030, _1040);
    float _1054 = _1042 + (-1.0);
    float _1056 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1036);
    float _1058 = _1048 * (-2.0);
    float _1060 = _1044 * 6.283185482025146484375;
    float _1062 = cos(_1060);
    float _1064 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1066 = fma(_1052, _994, _1056);
    float _1068 = fma(_1058, _922, _922);
    float _1070 = in.m_65.x;
    float _1072 = in.m_65.y;
    float _1074 = in.m_65.z;
    float _1076 = fma(_1064, _1058, _1064);
    float _1078 = _1066 * 0.15915493667125701904296875;
    float _1080 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1068);
    float _1082 = _1044 * 6.283185482025146484375;
    float _1084 = sin(_1082);
    float _1086 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1088 = fma(_1076, _994, _1080);
    float _1090 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1092 = _1088 * 0.15915493667125701904296875;
    float _1094 = _1078 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1100 = in.m_46.x;
    float _1102 = in.m_46.y;
    float _1104 = in.m_46.z;
    float _1106 = _1078 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1072);
    float _1112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1070);
    float _1114 = _1092 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1074);
    float _1120 = _1086 * _1110;
    float _1122 = _1098 * _1112;
    float _1124 = _1062 * _1096;
    float _1126 = _1084 * _1096;
    float _1128 = _1090 * _1118;
    float _1130 = _1092 * 6.283185482025146484375;
    float _1132 = sin(_1130);
    float _1134 = _1062 * _1108;
    float _1136 = _1084 * _1108;
    float _1138 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1140 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1138);
    float _1142 = _1062 * _1116;
    float _1144 = _1084 * _1116;
    float _1146 = _1108 * _1116;
    float _1148 = _1096 * _1116;
    float _1150 = _1142 * _1120;
    float _1152 = _1144 * _1120;
    float _1154 = fma(_1132, _1134, _1126);
    float _1156 = -_1120;
    float _1158 = _1132 * _1156;
    float _1160 = -_1124;
    float _1162 = fma(_1132, _1136, _1160);
    float _1164 = -_1136;
    float _1166 = fma(_1132, _1124, _1164);
    float _1168 = fma(_1154, _1122, _1150);
    float _1170 = fma(_1146, _1122, _1158);
    float _1172 = fma(_1132, _1126, _1134);
    float _1174 = fma(_1162, _1122, _1152);
    float _1176 = fma(_1166, _1128, _1168);
    float _1178 = fma(_1148, _1128, _1170);
    float _1180 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1182 = fma(_1172, _1128, _1174);
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1188 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1140);
    float _1190 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1180);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1184);
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1198 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    float _1202 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1190);
    float _1204 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1194);
    float _1206 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1214 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1198);
    float _1216 = _1196 + _1208;
    float _1218 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1206);
    float _1220 = _1210 + _1212;
    float _1222 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1214);
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1226 = _1216 + _1224;
    float _1228 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1218);
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1232 = _1220 + _1230;
    float _1234 = _1222 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1236 = _1226 * _1226;
    float _1238 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1242 = fma(_1232, _1232, _1236);
    float _1244 = _1234 + _1238;
    float _1246 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1240);
    float _1248 = sqrt(_1242);
    float _1250 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1246);
    bool _1252 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1228;
    float _1256 = _1100;
    float _1258 = _1238;
    float _1260 = _1220;
    float _1262 = _1244;
    if (!_1252)
    {
        _1254 = _1220;
    }
    float _1264 = _1254;
    float _1266 = _1264;
    if (!_1252)
    {
        _1256 = _1216;
    }
    float _1268 = _1256;
    float _1270 = _1268;
    if (!_1252)
    {
        _1258 = _1244;
    }
    float _1272 = _1258;
    bool _1274 = !_1252;
    float _1276 = _1272;
    if (!_1274)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1282 = _1248 + _1280;
        float _1284 = _1244 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1286 = rsqrt(_1242);
        float _1288 = _1282 * _1278;
        float _1290 = _1288 * 0.15915493667125701904296875;
        float _1292 = _1290 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        float _1296 = _1290 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294 + (-1.0);
        float _1302 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = fma(_1298, _1284, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1306 = fma(_1244, _1294, _1302);
        float _1308 = _1286 * _1304;
        float _1310 = fma(_1232, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1226, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1276 = _1306;
        _1266 = _1310;
        _1270 = _1312;
    }
    float _1314 = _1276;
    float _1316 = _1266;
    float _1318 = _1270;
    float _1320 = -_1234;
    float _1322 = _1320 + _1314;
    float _1324 = -_1210;
    float _1326 = _1324 + _1316;
    float _1328 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1330 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1332 = _1322 * _1322;
    float _1334 = -_1196;
    float _1336 = _1334 + _1318;
    float _1338 = 1.0 / _1328;
    float _1340 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1330);
    float _1342 = fma(_1326, _1326, _1332);
    float _1344 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1340);
    float _1346 = fma(_1336, _1336, _1342);
    bool _1348 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1350 = isnan(0.5);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1356 = _1352 || _1354;
    float _1358 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1360 = sqrt(_1346);
    float _1362 = _1358 + _1328;
    float _1364 = _1362 * _1338;
    float _1366 = _1364 * 0.5;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1370 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1368);
    bool _1372 = _1360 > 0.0;
    float _1374 = 1.0 / _1370;
    float _1376 = _1360;
    float _1378 = _1314;
    float _1380 = _1316;
    float _1382 = _1318;
    float _1384 = _1322;
    if (_1356)
    {
        _1376 = 1.0;
    }
    float _1386 = _1376;
    bool _1388 = !_1372;
    float _1390 = 0.0;
    float _1392 = _1386;
    if (!_1388)
    {
        float _1394 = _188 * _188;
        float _1396 = fma(_186, _186, _1394);
        float _1398 = fma(_190, _190, _1396);
        float _1400 = rsqrt(_1346);
        float _1402 = sqrt(_1398);
        float _1404 = _1322 * _1400;
        float _1406 = _1336 * _1400;
        bool _1408 = _1402 > 0.0;
        float _1410 = _1326 * _1400;
        bool _1412 = !_1408;
        _1390 = _1406;
        _1260 = _1410;
        if (!_1412)
        {
            float _1414 = rsqrt(_1398);
            float _1416 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1418 = _188 * _1414;
            float _1420 = _186 * _1414;
            float _1422 = _190 * _1414;
            float _1424 = _1404 * _1418;
            float _1426 = fma(_1410, _1420, _1424);
            float _1428 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1430 = fma(_1406, _1422, _1426);
            float _1432 = _1430 * _1428;
            float _1434 = fma(_186, _1432, _1316);
            float _1436 = fma(_188, _1432, _1314);
            float _1438 = fma(_190, _1432, _1318);
            _1378 = _1436;
            _1380 = _1434;
            _1382 = _1438;
            _1384 = _1432;
        }
    }
    float _1440 = _1378;
    float _1442 = _1380;
    float _1444 = _1382;
    float _1446 = _1390;
    float _1448 = _1260;
    float _1450 = _1384;
    float _1452 = _1450;
    if (_1356)
    {
        _1452 = 1.0;
    }
    float _1454 = _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1458 = _1374 * _1456;
    float _1460 = _1454;
    if (!_1356)
    {
        float _1462 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1464 = _1462 * 0.15915493667125701904296875;
        float _1466 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1468 = _1464 * 6.283185482025146484375;
        float _1470 = cos(_1468);
        float _1472 = _1466 * 0.15915493667125701904296875;
        float _1474 = _1464 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = 1.0 / _1470;
        float _1480 = _1472 * 6.283185482025146484375;
        float _1482 = cos(_1480);
        float _1484 = _1476 * _1478;
        float _1486 = _1472 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = _1482 * _1484;
        float _1492 = 1.0 / _1490;
        float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1496 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1494;
        float _1498 = 1.0 / _1496;
        float _1500 = _1488 * _1492;
        float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1504 = fma(_1458, _1500, _1502);
        float _1506 = _1504 * _1498;
        float _1508 = precise::clamp(_1506, 0.0, 1.0);
        _1392 = _1508;
    }
    float _1510 = _1392;
    if (!_1356)
    {
        float _1512 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1514 = _1512 * 0.15915493667125701904296875;
        float _1516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1518 = _1514 * 6.283185482025146484375;
        float _1520 = cos(_1518);
        float _1522 = _1516 * 0.15915493667125701904296875;
        float _1524 = _1514 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        float _1528 = 1.0 / _1520;
        float _1530 = _1522 * 6.283185482025146484375;
        float _1532 = cos(_1530);
        float _1534 = _1526 * _1528;
        float _1536 = _1522 * 6.283185482025146484375;
        float _1538 = sin(_1536);
        float _1540 = _1532 * _1534;
        float _1542 = 1.0 / _1540;
        float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1546 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1544;
        float _1548 = 1.0 / _1546;
        float _1550 = _1538 * _1542;
        float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1554 = fma(_1458, _1550, _1552);
        float _1556 = _1554 * _1548;
        float _1558 = precise::clamp(_1556, 0.0, 1.0);
        float _1560 = -_1558;
        float _1562 = _1560 + 1.0;
        _1460 = _1562;
    }
    float _1564 = _1460;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1440 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1572 = _1442 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1576 = _1444 + _1574;
    float _1578 = _1568 * _1568;
    float _1580 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1582 = fma(_1572, _1572, _1578);
    float _1584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1586 = fma(_1576, _1576, _1582);
    float _1588 = precise::max(0.0, _1584);
    float _1590 = rsqrt(_1586);
    float _1592 = sqrt(_1586);
    float _1594 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1596 = _1572 * _1594;
    float _1598 = _1576 * _1594;
    float _1600 = -_1594;
    float _1602 = -_1588;
    float _1604 = fma(_1568, _1600, _1602);
    float _1606 = _1596 * _1596;
    float _1608 = _1598 * _1598;
    float _1610 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1612 = _1606 + _1608;
    float _1614 = floor(_1610);
    float _1616 = sqrt(_1612);
    bool _1618 = _1616 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1622 = _1616 + _1620;
    float _1624 = _1446;
    float _1626 = _1568;
    float _1628 = _1612;
    float _1630 = _1622;
    float _1632 = _1596;
    float _1634 = _1598;
    float _1636 = _1606;
    float _1638 = _1608;
    if (_1618)
    {
        float _1640 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1618)
    {
        float _1644 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1644;
    }
    float _1646 = _1626;
    float _1648 = _1646;
    if (_1618)
    {
        float _1650 = rsqrt(_1612);
        _1628 = _1650;
    }
    float _1652 = _1628;
    float _1654 = _1642;
    float _1656 = _1652;
    if (_1618)
    {
        float _1658 = _1622 * _1642;
        _1630 = _1658;
    }
    float _1660 = _1630;
    if (_1618)
    {
        float _1662 = _1660 * 0.15915493667125701904296875;
        _1654 = _1662;
    }
    float _1664 = _1654;
    float _1666 = _1448;
    if (_1618)
    {
        float _1668 = _1664 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1666 = _1670;
    }
    float _1672 = _1666;
    float _1674 = _1660;
    if (_1618)
    {
        float _1676 = _1664 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = _1672;
    if (_1618)
    {
        float _1684 = fma(_1672, _1646, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1262 = _1684;
    }
    float _1686 = _1262;
    float _1688 = _1686;
    if (!_1618)
    {
        _1648 = _1604;
    }
    float _1690 = _1648;
    float _1692 = _1690;
    if (_1618)
    {
        float _1694 = _1652 * _1686;
        _1688 = _1694;
    }
    float _1696 = _1688;
    if (_1618)
    {
        float _1698 = _1680 + (-1.0);
        _1682 = _1698;
    }
    float _1700 = _1682;
    if (_1618)
    {
        float _1702 = _1596 * _1696;
        _1632 = _1702;
    }
    float _1704 = _1632;
    if (_1618)
    {
        float _1706 = _1598 * _1696;
        _1634 = _1706;
    }
    float _1708 = _1634;
    float _1710 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1618)
    {
        float _1712 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1656 = _1712;
    }
    float _1714 = _1656;
    if (_1618)
    {
        float _1716 = _1704 * _1704;
        _1636 = _1716;
    }
    float _1718 = _1636;
    if (_1618)
    {
        float _1720 = _1708 * _1708;
        _1638 = _1720;
    }
    float _1722 = _1638;
    if (_1618)
    {
        float _1724 = fma(_1604, _1680, _1714);
        _1692 = _1724;
    }
    float _1726 = _1692;
    float _1728 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1730 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1710);
    float _1732 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1580);
    float _1734 = fma(_1726, _1726, _1718);
    float _1736 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1728);
    float _1738 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1730);
    float _1740 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1742 = _1734 + _1722;
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1746 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1750 = fma(_1592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1748);
    float _1752 = precise::clamp(_1750, 0.0, 1.0);
    float _1754 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1736);
    float _1756 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1758 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1746);
    float _1760 = -_1752;
    float _1762 = _1760 + 1.0;
    float _1764 = rsqrt(_1742);
    float _1766 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1768 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1758);
    float _1770 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1774 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1776 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1778 = abs(_1762);
    float _1780 = log2(_1778);
    float _1782 = -_1772;
    float _1784 = fma(_1782, _1744, 1.0);
    float _1786 = fma(_1196, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1788 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1776);
    float _1790 = -_1614;
    float _1792 = _1610 + _1790;
    float _1794 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1796 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1798 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1788);
    float _1800 = _1764 * _1704;
    float _1802 = _1764 * _1726;
    float _1804 = _1764 * _1708;
    float _1806 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1798);
    float _1808 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1810 = floor(_1786);
    float _1812 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1796);
    float _1814 = -_1808;
    float _1816 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1814);
    float _1818 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1820 = -_1804;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1816);
    float _1824 = log2(_1784);
    float _1826 = fma(_1822, -0.5, 0.5);
    float _1828 = fma(_1822, 0.5, 0.5);
    float _1830 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1794);
    float _1832 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1812);
    float _1834 = exp2(_1818);
    float _1836 = fma(_1828, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1838 = -_1810;
    float _1840 = _1786 + _1838;
    float _1842 = _1802 + 1.0;
    float _1844 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1830);
    float _1846 = fma(_1828, _1836, -0.212114393711090087890625);
    float _1848 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1832);
    float _1850 = 1.0 / _1806;
    float _1852 = fma(_1828, _1846, 1.570728778839111328125);
    float _1854 = _1824 * 0.693147182464599609375;
    float _1856 = sqrt(_1826);
    float _1858 = -_1802;
    float _1860 = fma(_1834, _1842, _1858);
    float _1862 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1844);
    float _1864 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1866 = fma(_1860, 0.5, 0.5);
    float _1868 = _1862 * _1850;
    float _1870 = _1848 * _1850;
    float _1872 = _1856 * 0.636619746685028076171875;
    float _1874 = fma(_1868, 0.5, 0.5);
    float _1876 = fma(_1870, -0.5, 0.5);
    float _1878 = -_1852;
    float _1880 = fma(_1872, _1878, 1.0);
    float2 _5929 = float2(_1792, _1840);
    float _1882 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5929, float2(0.0), isnan(_5929)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5929, float2(0.0), isnan(_5929)), level(0.0)).x;
    float3 _5940 = float3(_1874, _1876, _1864);
    float _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5940, float3(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5940, float3(0.0), isnan(_5940)), level(0.0)).x;
    float3 _5951 = float3(_1874, _1876, _1864);
    float4 _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5951, float3(0.0), isnan(_5951)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5951, float3(0.0), isnan(_5951)), level(0.0)).xyzw;
    float _1889 = _1887.x;
    float _1891 = _1887.y;
    float _1893 = _1887.z;
    float _1895 = _1887.w;
    float2 _5967 = float2(_1880, _1866);
    float3 _1899 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5967, float2(0.0), isnan(_5967)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5967, float2(0.0), isnan(_5967)), level(0.0)).xyz;
    float _1901 = _1899.x;
    float _1903 = _1899.y;
    float _1905 = _1899.z;
    float _1907 = float(uint(_912));
    float _1909 = trunc(_962);
    int _1911 = int(_1909);
    float _1913 = _990 * _168;
    bool _1915 = _912 == 0;
    float _1917 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1919 = ~_912;
    int _1921 = _1919 + 1;
    int _1923 = abs(_824);
    float _1925 = 1.0 / _1907;
    int _1927 = abs(_864);
    float _1929 = float(uint(_1911));
    float _1931 = trunc(_1913);
    int _1933 = int(_1931);
    int _1935 = as_type<int>(_1925) + (-2);
    float _1937 = exp2(_1917);
    float _1939 = as_type<float>(_1935) * _1929;
    float _1941 = trunc(_1939);
    float _1943 = precise::max(_1941, 0.0);
    uint _1946 = uint(_1943);
    int _1948 = ~_912;
    int _1950 = _1948 + 1;
    float _1952 = -_1937;
    float _1954 = _1952 + 1.0;
    float _1956 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1958 = _1921 * int(_1946);
    int _1960 = _1958 + _1911;
    float _1962 = float(uint(_1960));
    float _1964 = as_type<float>(_1935) * _1962;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1968 = _1966 != 0;
    float _1970 = trunc(_1964);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    bool _1976 = !_1968;
    float _1978 = _1976 ? 7.345489978790283203125 : 1.0;
    float _1980 = _1978 * _746;
    float _1982 = floor(_1980);
    int _1984 = int(_1946) + int(_1974);
    float _1986 = float(_1911);
    int _1988 = _1950 * _1984;
    int _1990 = _1988 + _1911;
    bool _1992 = _1986 >= _960;
    bool _1994 = isnan(_1986);
    bool _1996 = _1992 || _1994;
    bool _1998 = isnan(_960);
    bool _2000 = _1996 || _1998;
    float _2002 = float(_2000);
    bool _2004 = uint(_1990) >= uint(_912);
    float _2006 = trunc(_2002);
    int _2008 = int(_2006);
    float _2010 = -_1982;
    float _2012 = _1980 + _2010;
    float _2014 = _2012 * _960;
    bool _2016 = !_2004;
    int _2018 = _2016 ? 0 : (-1);
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2022 = _2020 != 0;
    float _2024 = trunc(_2014);
    int _2026 = int(_2024);
    int _2028 = ~_1984;
    int _2030 = _2028 + _2018;
    int _2032 = _2030 + 1;
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2036 = _2034 != 0;
    int _2038 = ~_2008;
    int _2040 = _2038 + 1;
    int _2042 = _2040 + 1;
    int _2044 = _912 * _2032;
    int _2046 = _2044 + _1911;
    int _2048 = _912 + (-1);
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2052 = _2050 != 0;
    bool _2054 = !_1915;
    int _2056 = _2054 ? _2046 : (-1);
    bool _2058 = !_2022;
    int _2060 = _2058 ? 0 : 1;
    int _2062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2064 = _2062 != 0;
    int _2066 = _2056 * _2042;
    int _2068 = abs(_2060);
    int _2070 = abs(_840);
    int _2072 = _2008 * _2048;
    int _2074 = _2072 + _2066;
    bool _2076 = !_2064;
    int _2078 = _2076 ? 0 : 1;
    int _2080 = _2026 * _2068;
    int _2082 = _2080 + _1911;
    float _2084 = in.m_67.y;
    int _2086 = _2074 * _1923;
    int _2088 = abs(_2078);
    int _2090 = _1933 * _2070;
    int _2092 = _2090 + _2086;
    bool _2094 = _748 > 0.5;
    int _2096 = _2082 * _1927;
    int _2098 = _2096 + _2092;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2104 = as_type<float>(_1927);
    if (_2036)
    {
        float _2106 = in.m_57.x;
        _2104 = _2106;
    }
    float _2108 = _2104;
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2110;
    int _2114 = _2026 * _2088;
    int _2116 = _2114 + _2098;
    int _2118 = ~_912;
    int _2120 = _2118 + 1;
    float _2122 = in.m_67.x;
    float _2124 = 1.0 / _2102;
    int _2126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2128 = _2126 != 0;
    float _2130 = float(uint(_2116));
    bool _2132 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2134 = isnan(_738);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = as_type<float>(_1935) * _2130;
    float _2146 = -_2084;
    float _2148 = _2146 + 1.0;
    float _2150 = trunc(_2144);
    float _2152 = precise::max(_2150, 0.0);
    uint _2154 = uint(_2152);
    float _2156 = _2084;
    if (_2052)
    {
        float _2158 = _2094 ? _2148 : _2084;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = _2112 * _2124;
    float _2164 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2166 = _738 + _2164;
    bool _2168 = _1072 != 0.0;
    bool _2170 = isnan(_1072);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(0.0);
    bool _2176 = _2172 || _2174;
    bool _2178 = _2108 > 0.5;
    bool _2180 = _2178 && _2036;
    float _2182 = fma(_2162, _2166, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2184 = float(uint(_2082));
    float _2186 = -_2142;
    float _2188 = _2186 + 1.0;
    int _2190 = ~_912;
    int _2192 = _2190 + 1;
    float _2194 = as_type<float>(_1935) * _2184;
    int _2196 = _2120 * int(_2154);
    int _2198 = _2196 + _2116;
    int _2200 = ~_912;
    int _2202 = _2200 + 1;
    bool _2204 = _1070 == 0.0;
    bool _2206 = !_2176;
    bool _2208 = _2204 && _2206;
    float _2210 = float(uint(_2198));
    float _2212 = trunc(_2194);
    float _2214 = precise::max(_2212, 0.0);
    uint _2216 = uint(_2214);
    bool _2218 = _1074 == 0.0;
    bool _2220 = _2218 && _2208;
    float _2222 = as_type<float>(_1935) * _2210;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2224 = trunc(_2222);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    float _2230 = in.m_71.x;
    float _2232 = in.m_71.y;
    float _2234 = in.m_71.z;
    int _2236 = int(_2154) + int(_2228);
    bool _2238 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2240 = isnan(_738);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2122;
    if (_2036)
    {
        _888 = _2122;
    }
    float _2252 = _888;
    int _2254 = _2202 * _2236;
    int _2256 = _2254 + _2116;
    float _2258 = _2248 * _2188;
    float _2260 = _2252;
    if (_2180)
    {
        float _2262 = -_2252;
        float _2264 = _2262 + 1.0;
        _2260 = _2264;
    }
    float _2266 = _2260;
    float _2268 = _2234;
    float _2270 = _2232;
    float _2272 = _2230;
    if (!_2220)
    {
        float _2274 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2234);
        _2268 = _2274;
    }
    float _2276 = _2268;
    float _2278 = _2182 * _2258;
    float _2280 = -_2248;
    float _2282 = _2280 + 1.0;
    if (!_2220)
    {
        float _2284 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2232);
        _2270 = _2284;
    }
    float _2286 = _2270;
    if (_2036)
    {
        _2250 = _2266;
    }
    float _2288 = _2250;
    float _2290 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2292 = uint(_2256) >= uint(_912);
    int _2294 = _2192 * int(_2216);
    int _2296 = _2294 + _2082;
    float _2298 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2278);
    float _2300 = -_788;
    float _2302 = fma(_916, _2290, _2300);
    bool _2304 = !_2292;
    int _2306 = _2304 ? 0 : (-1);
    float _2308 = fma(_2288, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2310 = float(uint(_2296));
    float _2312 = _2302 + 0.5;
    int _2314 = ~_2236;
    int _2316 = _2314 + _2306;
    int _2318 = _2316 + 1;
    float _2320 = fma(_924, _2308, _780);
    float _2322 = abs(_1458);
    float _2324 = log2(_2322);
    float _2326 = as_type<float>(_1935) * _2310;
    float _2328 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2298);
    int _2330 = _912 * _2318;
    int _2332 = _2330 + _2116;
    float _2334 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2336 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2338 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_2220)
    {
        float _2340 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2230);
        _2272 = _2340;
    }
    float _2342 = _2272;
    float _2344 = trunc(_2326);
    float _2346 = precise::max(_2344, 0.0);
    uint _2348 = uint(_2346);
    bool _2350 = !_1915;
    int _2352 = _2350 ? _2332 : (-1);
    float _2354 = _2320 + 0.5;
    float _2356 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2358 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2360 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2362 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2364 = ~_912;
    int _2366 = _2364 + 1;
    float _2368 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2370 = _2352 >> 31;
    out.m_73.x = _2354;
    out.m_73.y = _2312;
    int _2372 = _2370 & 3;
    float _2374 = exp2(_2368);
    out.m_75.x = _2356;
    out.m_75.y = _2358;
    out.m_75.z = _2360;
    out.m_75.w = _2362;
    int _2376 = int(_2216) + int(_2348);
    float _2378 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2380 = _2352 + _2372;
    float _2382 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2384 = _2380 >> 2;
    int _2386 = _2352 & 3;
    bool _2388 = _2386 != 0;
    int _2390 = _2366 * _2376;
    int _2392 = _2390 + _2082;
    bool _2394 = _1458 <= 8000.0;
    bool _2396 = isnan(_1458);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(8000.0);
    bool _2402 = _2398 || _2400;
    float _2404 = float(_2402);
    float _2406 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2408 = -_1132;
    float _2410 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2378);
    float _2412 = -_1132;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2382);
    float _2416 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2418 = -_1132;
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2406);
    int _2422 = _2384 << 4;
    int _2424 = _2422 + 368;
    float _2426 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    float _2430 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2410);
    float _2432 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2414);
    uint _2434 = uint(int(uint(_2424) >> uint(2)));
    uint _2436 = uint(int(uint(int(_2434)) >> uint(2)));
    int _2438 = int(_2434) & 3;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[int(_2436)][_2438];
    int _2442 = int(_2434) + 1;
    uint _2444 = uint(int(uint(_2442) >> uint(2)));
    int _2446 = _2442 & 3;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[int(_2444)][_2446];
    float _2450 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2420);
    float _2452 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2454 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2416);
    int _2456 = _2352 & 3;
    bool _2458 = _2456 != 0;
    float _2460 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2462 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2452);
    float _2464 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2466 = _2424 + 8;
    uint _2468 = uint(int(uint(_2466) >> uint(2)));
    uint _2470 = uint(int(uint(int(_2468)) >> uint(2)));
    int _2472 = int(_2468) & 3;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[int(_2470)][_2472];
    int _2476 = int(_2468) + 1;
    uint _2478 = uint(int(uint(_2476) >> uint(2)));
    int _2480 = _2476 & 3;
    float _2482 = (*spvDescriptorSet0.vp_c9)._m0[int(_2478)][_2480];
    bool _2484 = uint(_2456) > 1u;
    float _2486 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2488 = uint(_2392) >= uint(_912);
    float _2490 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2460);
    float _2492 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2464);
    float _2494 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2486);
    float _2496 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2498 = _2432 * _2286;
    int _2500 = _2388 ? 0 : 1;
    float _2502 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2490);
    float _2504 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2496);
    float _2506 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2492);
    int _2508 = ~_2500;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2494);
    int _2516 = _2512;
    if (!_2484)
    {
        int _2518 = ~_2500;
        int _2520 = _2518 + 1;
        _2516 = _2520;
    }
    int _2522 = _2516;
    float _2524 = _2430 * _2286;
    bool _2526 = _2456 != 3;
    float _2528 = _2450 * _2286;
    float _2530 = fma(_2502, _2342, _2524);
    bool _2532 = uint(_2456) >= 2u;
    float _2534 = fma(_2506, _2342, _2498);
    int _2536 = abs(_2522);
    float _2538 = fma(_2428, -2.0, 3.0);
    float _2540 = _2428 * _2428;
    int _2542 = _2532 ? 0 : 1;
    float _2544 = fma(_2514, _2342, _2528);
    bool _2546 = !_2458;
    int _2548 = _2546 ? 0 : 1;
    float _2550 = _2540 * _2538;
    int _2552 = ~_2536;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    float _2558 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2462);
    bool _2560 = _2456 != 3;
    float _2562 = -_1882;
    float _2564 = _2562 + 1.0;
    int _2566 = ~_2542;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = _1956 * _1884;
    int _2574 = abs(_2548);
    float _2576 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2454);
    int _2578 = _2570;
    if (_2526)
    {
        int _2580 = ~_2542;
        int _2582 = _2580 + 1;
        _2578 = _2582;
    }
    int _2584 = _2578;
    int _2586 = _2556 * as_type<int>(_2448);
    bool _2588 = !_2560;
    int _2590 = _2588 ? 0 : (-1);
    float _2592 = _1905 * _2572;
    bool _2594 = !_2128;
    int _2596 = _2594 ? 0 : 1;
    float _2598 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2504);
    int _2600 = abs(_2584);
    float _2602 = fma(_2576, _2276, _2534);
    int _2604 = ~_2574;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    float _2610 = fma(_1895, _2592, _1893);
    int _2612 = abs(_2590);
    int _2614 = abs(_2596);
    int _2616 = _2608 * as_type<int>(_2440);
    int _2618 = _2616 + _2586;
    bool _2620 = !_2488;
    int _2622 = _2620 ? 0 : (-1);
    int _2624 = ~_2600;
    int _2626 = _2624 + 1;
    int _2628 = _2626 + 1;
    float _2630 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2632 = ~_2376;
    int _2634 = _2632 + _2622;
    int _2636 = _2634 + 1;
    int _2638 = ~_2612;
    int _2640 = _2638 + 1;
    int _2642 = _2640 + 1;
    int _2644 = _2628 * as_type<int>(_2474);
    int _2646 = _2644 + _2618;
    float _2648 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2630);
    int _2650 = _912 * _2636;
    int _2652 = _2650 + _2082;
    float _2654 = fma(_2558, _2276, _2530);
    int _2656 = _2642 * as_type<int>(_2482);
    int _2658 = _2656 + _2646;
    float _2660 = -_2550;
    float _2662 = _2660 + 1.0;
    float _2664 = in.m_77.x;
    int _2666 = ~_2614;
    int _2668 = _2666 + 1;
    int _2670 = _2668 + 1;
    float _2672 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2648);
    float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2550);
    bool _2676 = !_1915;
    int _2678 = _2676 ? _2652 : (-1);
    float _2680 = fma(_2598, _2276, _2544);
    int _2682 = _2658 * _2670;
    float _2684 = _2404 * _2674;
    float _2686 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2672);
    int _2688 = _2678 * _2614;
    int _2690 = _2688 + _2682;
    float _2692 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2694 = _2686 + _1806;
    float _2696 = _1895 * _2572;
    float _2698 = _2564 * _2692;
    float _2700 = precise::clamp(_2698, 0.0, 1.0);
    float _2702 = _2694 * 0.5;
    float _2704 = -_1956;
    float _2706 = _2704 + 1.0;
    float _2708 = fma(_1901, _2696, _1889);
    float _2710 = -_2700;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2714 = fma(_1903, _2696, _1891);
    out.m_79.z = _2702;
    out.m_79.w = _1806;
    float _2716 = _1895 * _2706;
    bool _2718 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2720 = isnan(_1592);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2726 = _2722 || _2724;
    float _2728 = _2712 * _2664;
    out.gl_Position.x = _1862;
    out.gl_Position.y = _1848;
    out.gl_Position.z = _2686;
    out.gl_Position.w = _1806;
    float _2730 = float(_2690);
    out.m_81.x = _2708;
    out.m_81.y = _2714;
    out.m_81.z = _2610;
    out.m_81.w = _2716;
    float _2732 = _2728 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2734 = _1510 * _1564;
    out.m_83.x = _2654;
    out.m_83.y = _2602;
    out.m_83.z = _2680;
    float _2736 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_85.x = _2732;
    float _2738 = _2702;
    float _2740 = _2592;
    float _2742 = _2696;
    float _2744 = _2706;
    float _2746 = _2734;
    float _2748 = _2730;
    if (!_2726)
    {
        _2738 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2750 = _2738;
    float _2752 = _2750;
    float _2754 = _2750;
    if (!_2726)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2756 = _2740;
    out.m_87.x = _2730;
    float _2758 = _2756;
    float _2760 = _2756;
    if (!_2726)
    {
        _2742 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2762 = _2742;
    float _2764 = _2762;
    float _2766 = _2762;
    if (!_2726)
    {
        _2744 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2768 = _2744;
    float _2770 = _2768;
    float _2772 = _2768;
    if (!_2726)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2774 = _2746;
    float _2776 = _2774;
    float _2778 = _2774;
    if (!_2726)
    {
        _2748 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2780 = _2748;
    bool _2782 = !_2726;
    float _2784 = _2780;
    float _2786 = _2780;
    if (!_2782)
    {
        bool _2788 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2790 = isnan(_1592);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2796 = _2792 || _2794;
        if (!_2796)
        {
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2800 = _1592 + _2798;
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2804 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2802;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2810 = 1.0 / _2804;
            float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2828 = _2800 * _2810;
            float _2830 = precise::clamp(_2828, 0.0, 1.0);
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2836 = fma(_2830, _2808, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2838 = fma(_2830, _2834, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2840 = fma(_2830, _2814, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2842 = fma(_2830, _2818, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2844 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2846 = fma(_2830, _2826, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2786 = _2840;
            _2772 = _2844;
            _2754 = _2836;
            _2766 = _2842;
            _2760 = _2838;
            _2778 = _2846;
            _2848 = true;
        }
        else
        {
            bool _2850 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2852 = isnan(_1592);
            bool _2854 = _2850 || _2852;
            bool _2856 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2858 = _2854 || _2856;
            if (!_2858)
            {
                _2752 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2860 = _2752;
            _2754 = _2860;
            if (!_2858)
            {
                _2784 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2862 = _2784;
            _2786 = _2862;
            if (!_2858)
            {
                _2758 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2864 = _2758;
            _2760 = _2864;
            if (!_2858)
            {
                _2764 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2866 = _2764;
            _2766 = _2866;
            if (!_2858)
            {
                _2770 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2868 = _2770;
            _2772 = _2868;
            if (!_2858)
            {
                _2776 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2870 = _2776;
            bool _2872 = !_2858;
            _2778 = _2870;
            if (!_2872)
            {
                bool _2874 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2876 = isnan(_1592);
                bool _2878 = _2874 || _2876;
                bool _2880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2882 = _2878 || _2880;
                if (!_2882)
                {
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2886 = _1592 + _2884;
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2890 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2888;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2896 = 1.0 / _2890;
                    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2900 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2914 = _2886 * _2896;
                    float _2916 = precise::clamp(_2914, 0.0, 1.0);
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2922 = fma(_2916, _2894, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2924 = fma(_2916, _2920, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2926 = fma(_2916, _2900, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2928 = fma(_2916, _2904, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2930 = fma(_2916, _2908, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2932 = fma(_2916, _2912, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2786 = _2926;
                    _2772 = _2930;
                    _2754 = _2922;
                    _2766 = _2928;
                    _2760 = _2924;
                    _2778 = _2932;
                    _2848 = true;
                }
                else
                {
                    _2786 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2772 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2754 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2766 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2760 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2778 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2848 = false;
    float _2934 = _2786;
    float _2936 = _2772;
    float _2938 = _2754;
    float _2940 = _2766;
    float _2942 = _2760;
    float _2944 = _2778;
    float _2946 = fma(_2602, -0.5, 0.5);
    float _2948 = precise::clamp(_2946, 0.0, 1.0);
    float _2950 = -_2934;
    float _2952 = _2950 + _2936;
    float _2954 = _2736 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2956 = -_2938;
    float _2958 = _2956 + _2940;
    out.m_89.x = 0.0;
    float _2960 = fma(_2948, _2952, _2934);
    float _2962 = fma(_2948, _2958, _2938);
    out.m_53.x = _2954;
    float _2964 = -_2942;
    float _2966 = _2964 + _2944;
    float _2968 = _2960 * 0.586610972881317138671875;
    bool _2970 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2972 = fma(_2948, _2966, _2942);
    float _2974 = fma(_2962, 0.298911988735198974609375, _2968);
    bool _2976 = _1510 > 0.0;
    bool _2978 = isnan(_1510);
    bool _2980 = _2976 || _2978;
    bool _2982 = isnan(0.0);
    bool _2984 = _2980 || _2982;
    float _2986 = fma(_2972, 0.114477999508380889892578125, _2974);
    bool _2988 = _1564 <= 0.0;
    bool _2990 = !_2984;
    bool _2992 = _2988 || _2990;
    float _2994 = -_2986;
    float _2996 = _2962 + _2994;
    float _2998 = -_2986;
    float _3000 = _2960 + _2998;
    float _3002 = -_2986;
    float _3004 = _2972 + _3002;
    float _3006 = fma(_2996, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2986);
    float _3008 = fma(_3000, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2986);
    float _3010 = fma(_3004, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2986);
    bool _3012 = !_2970;
    if (!_3012)
    {
        float _3014 = -_1440;
        float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3018 = -_1442;
        float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3022 = -_1444;
        float _3024 = _3022 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3026 = _3016 * _3016;
        float _3028 = fma(_3020, _3020, _3026);
        float _3030 = fma(_3024, _3024, _3028);
        float _3032 = sqrt(_3030);
        float _3034 = rsqrt(_3030);
        float _3036 = -_3032;
        float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3040 = _3038 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3042 = precise::clamp(_3040, 0.0, 1.0);
        float _3044 = _3020 * _3034;
        float _3046 = _3016 * _3034;
        float _3048 = abs(_3042);
        float _3050 = log2(_3048);
        float _3052 = _3024 * _3034;
        float _3054 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3056 = _2602 * _3046;
        float _3058 = -_3046;
        float _3060 = -_3054;
        float _3062 = fma(_3058, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3060);
        float _3064 = fma(_2654, _3044, _3056);
        float _3066 = -_3052;
        float _3068 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3062);
        float _3070 = fma(_2680, _3052, _3064);
        float _3072 = precise::clamp(_3070, 0.0, 1.0);
        float _3074 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3076 = _3068 + _3074;
        float _3078 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3080 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3082 = precise::clamp(_3080, 0.0, 1.0);
        float _3084 = exp2(_3078);
        float _3086 = _3084 * _3082;
        float _3088 = _3072 * _3086;
        float _3090 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3092 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3094 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3090;
        out.m_89.y = _3092;
        out.m_89.z = _3094;
    }
    out.m_91.x = _3006;
    out.m_91.y = _3008;
    out.m_91.z = _3010;
    if (!_2992)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3096 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3096;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2848 = false;
    bool _632 = false;
    bool _496 = false;
    bool _322 = false;
    bool _214 = false;
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
        float _3164 = as_type<float>(_134);
        out.gl_Position.z = _3164;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3219 = as_type<float>(_160);
        out.gl_Position.z = _3219;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _254;
    float _258 = 1.0 / _236;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _248 * _252;
    float _264 = -_248;
    float _266 = _264 + 1.0;
    float _268 = _220 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_256, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = fma(_278, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _274 * _262;
    float _286 = _282 * _262;
    float _288 = _280 * _262;
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _292 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _294 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _302 = !_260;
    float _320;
    if (!_302)
    {
        float _304 = in.m_57.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _172;
    }
    _322 = false;
    float _324 = _320;
    float _326 = in.m_59.x;
    float _328 = in.m_59.y;
    float _330 = in.m_59.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = _324 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _344 = 1.0 / _338;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = 1.0 / _342;
    float _350 = _334 * _344;
    bool _352 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _354 = isnan(_324);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _300 * _330;
    float _366 = _298 * _328;
    bool _368 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _370 = isnan(_324);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _324 + _380;
    float _384 = -_362;
    float _386 = _384 + 1.0;
    bool _388 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _390 = isnan(_324);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = -_378;
    float _406 = _404 + 1.0;
    float _408 = _378 * _386;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = _398 * _406;
    float _420 = fma(_402, _350, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _422 = fma(_412, _350, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_416, _350, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = _382 * _348;
    float _428 = -_398;
    float _430 = _428 + 1.0;
    float _432 = _422 * _418;
    float _434 = _424 * _418;
    float _436 = _420 * _418;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _450 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[107].x, _432);
    float _452 = fma(_440, _426, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _454 = fma(_444, _426, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _456 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[107].y, _434);
    float _458 = fma(_448, _426, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _460 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[107].z, _436);
    float _462 = fma(_452, _408, _450);
    float _464 = fma(_454, _408, _456);
    float _466 = fma(_458, _408, _460);
    float _468 = _296 * _326;
    float _470 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].x, _462);
    float _472 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].y, _464);
    float _474 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].z, _466);
    bool _476 = !_346;
    float _494;
    if (!_476)
    {
        float _478 = in.m_57.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        _494 = _172;
    }
    _496 = false;
    float _498 = _494;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _498 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = isnan(_498);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _524 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _526 = isnan(_498);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _536;
    bool _540 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _542 = isnan(_498);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _506;
    float _554 = -_518;
    float _556 = _554 + 1.0;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _560 = 1.0 / _522;
    float _562 = _538 * _552;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _568 = -_550;
    float _570 = _568 + 1.0;
    float _572 = fma(_562, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _574 = _534 * _556;
    float _576 = -_534;
    float _578 = _576 + 1.0;
    float _580 = _518 * _570;
    float _582 = _566 * _560;
    float _584 = _572 * _574;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = _498 + _586;
    float _590 = _470 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _592 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _594 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[115].x, _584);
    float _596 = fma(_582, _588, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _598 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _600 = fma(_596, _580, _594);
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _608 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _602;
    out.m_61.y = _604;
    out.m_61.z = _608;
    out.m_61.w = _610;
    bool _612 = !_558;
    float _630;
    if (!_612)
    {
        float _614 = in.m_57.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        _630 = _172;
    }
    _632 = false;
    float _634 = _630;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _638 = _634 + _636;
    bool _640 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _642 = isnan(_634);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _652;
    bool _656 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _658 = isnan(_634);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -_650;
    float _670 = _668 + 1.0;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _672;
    float _676 = 1.0 / _654;
    bool _678 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _680 = _666 * _670;
    float _682 = -_666;
    float _684 = _682 + 1.0;
    float _686 = _638 * _676;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _688;
    float _692 = fma(_674, _686, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _694;
    float _698 = fma(_690, _686, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _700 = _692 * _680;
    float _702 = fma(_696, _686, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _704 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].x, _700);
    float _706 = _702 * _680;
    float _708 = _698 * _680;
    float _710 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].x, _704);
    float _712 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].y, _706);
    float _714 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].z, _708);
    float _716 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].y, _712);
    float _718 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].z, _714);
    bool _720 = !_678;
    if (!_720)
    {
        float _722 = in.m_57.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _194 = _736;
    }
    float _738 = _194;
    float _740 = in.m_57.z;
    float _742 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _744 = log2(_742);
    float _746 = in.m_57.x;
    float _748 = in.m_57.y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _754 = int(_752);
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _758 = _740 * 2.0;
    float _760 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _762 = _746 * 2.0;
    float _764 = floor(_758);
    float _766 = _748 * 2.0;
    float _768 = -_750;
    float _770 = fma(_760, 2.0, _768);
    float _772 = _744 * _116;
    float _774 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _776 = _748 + _746;
    float _778 = -_116;
    float _780 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[76].x, _770);
    float _782 = floor(_762);
    float _784 = fma(_774, -2.0, _756);
    float _786 = _776 + (-1.0);
    float _788 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    float _790 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _792 = _764 >= 0.0;
    bool _794 = isnan(_764);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = exp2(_772);
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _814 = _812 != 0;
    int _816 = _800 ? 0 : 1;
    bool _818 = _782 > 0.0;
    float _820 = floor(_766);
    bool _822 = !_810;
    int _824 = _822 ? 0 : 1;
    bool _826 = _764 > 0.0;
    bool _828 = _782 >= 0.0;
    bool _830 = isnan(_782);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    bool _838 = !_806;
    int _840 = _838 ? 0 : 1;
    float _842 = -_802;
    float _844 = _842 + 1.0;
    bool _846 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _854 = _850 || _852;
    int _856 = ~_816;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    bool _862 = !_814;
    int _864 = _862 ? 0 : 1;
    float _866 = _854 ? _844 : 0.0;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _870 = _820 > 0.0;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _874 = _820 >= 0.0;
    bool _876 = isnan(_820);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _868);
    int _886 = _860;
    float _888 = _738;
    if (!_826)
    {
        int _890 = ~_816;
        int _892 = _890 + 1;
        _886 = _892;
    }
    int _894 = _886;
    float _896 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _872);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _900 = _898 != 0;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _908 = _906 != 0;
    float _910 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _912 = int(_910);
    float _914 = float(_754);
    float _916 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _918 = in.m_63.x;
    float _920 = in.m_63.y;
    float _922 = in.m_63.z;
    float _924 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _884);
    bool _926 = !_900;
    int _928 = _926 ? 0 : 1;
    float _930 = 1.0 / _914;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _934 = 1.0 + _932;
    float _936 = float(_894);
    int _938 = _836 ? 0 : 1;
    bool _940 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(1.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = 1.0 / _934;
    int _952 = abs(_928);
    bool _954 = !_904;
    int _956 = _954 ? 0 : 1;
    float _958 = float(_952);
    float _960 = float(_912);
    float _962 = _930 * _116;
    int _964 = ~_938;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    float _970 = _958 * _936;
    int _972 = _968;
    if (!_818)
    {
        int _974 = ~_938;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    float _980 = _746 + (-0.5);
    int _982 = abs(_956);
    float _984 = _970 * (-2.0);
    bool _986 = !_908;
    int _988 = _986 ? 0 : 1;
    float _990 = _960 * _116;
    if (_948)
    {
        float _992 = _866 * _950;
        _126 = _992;
    }
    float _994 = _126;
    float _996 = fma(_984, _918, _918);
    int _998 = _882 ? 0 : 1;
    float _1000 = fma(_790, _984, _790);
    float _1002 = float(_978);
    float _1004 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[196].x, _996);
    float _1006 = float(_982);
    int _1008 = abs(_988);
    float _1010 = fma(_1000, _994, _1004);
    int _1012 = ~_998;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    float _1018 = _1006 * _1002;
    int _1020 = _1016;
    if (!_870)
    {
        int _1022 = ~_998;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = _748 + _740;
    float _1030 = _1018 * (-2.0);
    float _1032 = _1028 + (-1.0);
    float _1034 = float(_1026);
    float _1036 = fma(_1030, _920, _920);
    float _1038 = float(_1008);
    float _1040 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = _740 + _746;
    float _1044 = _1010 * 0.15915493667125701904296875;
    float _1046 = _740 + (-0.5);
    float _1048 = _1038 * _1034;
    float _1050 = _748 + (-0.5);
    float _1052 = fma(_1040, _1030, _1040);
    float _1054 = _1042 + (-1.0);
    float _1056 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1036);
    float _1058 = _1048 * (-2.0);
    float _1060 = _1044 * 6.283185482025146484375;
    float _1062 = cos(_1060);
    float _1064 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1066 = fma(_1052, _994, _1056);
    float _1068 = fma(_1058, _922, _922);
    float _1070 = in.m_65.x;
    float _1072 = in.m_65.y;
    float _1074 = in.m_65.z;
    float _1076 = fma(_1064, _1058, _1064);
    float _1078 = _1066 * 0.15915493667125701904296875;
    float _1080 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1068);
    float _1082 = _1044 * 6.283185482025146484375;
    float _1084 = sin(_1082);
    float _1086 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1088 = fma(_1076, _994, _1080);
    float _1090 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1092 = _1088 * 0.15915493667125701904296875;
    float _1094 = _1078 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1100 = in.m_46.x;
    float _1102 = in.m_46.y;
    float _1104 = in.m_46.z;
    float _1106 = _1078 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1072);
    float _1112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1070);
    float _1114 = _1092 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1074);
    float _1120 = _1086 * _1110;
    float _1122 = _1098 * _1112;
    float _1124 = _1062 * _1096;
    float _1126 = _1084 * _1096;
    float _1128 = _1090 * _1118;
    float _1130 = _1092 * 6.283185482025146484375;
    float _1132 = sin(_1130);
    float _1134 = _1062 * _1108;
    float _1136 = _1084 * _1108;
    float _1138 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1140 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1138);
    float _1142 = _1062 * _1116;
    float _1144 = _1084 * _1116;
    float _1146 = _1108 * _1116;
    float _1148 = _1096 * _1116;
    float _1150 = _1142 * _1120;
    float _1152 = _1144 * _1120;
    float _1154 = fma(_1132, _1134, _1126);
    float _1156 = -_1120;
    float _1158 = _1132 * _1156;
    float _1160 = -_1124;
    float _1162 = fma(_1132, _1136, _1160);
    float _1164 = -_1136;
    float _1166 = fma(_1132, _1124, _1164);
    float _1168 = fma(_1154, _1122, _1150);
    float _1170 = fma(_1146, _1122, _1158);
    float _1172 = fma(_1132, _1126, _1134);
    float _1174 = fma(_1162, _1122, _1152);
    float _1176 = fma(_1166, _1128, _1168);
    float _1178 = fma(_1148, _1128, _1170);
    float _1180 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1182 = fma(_1172, _1128, _1174);
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1188 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1140);
    float _1190 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1180);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1184);
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1198 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    float _1202 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1190);
    float _1204 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1194);
    float _1206 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1214 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1198);
    float _1216 = _1196 + _1208;
    float _1218 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1206);
    float _1220 = _1210 + _1212;
    float _1222 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1214);
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1226 = _1216 + _1224;
    float _1228 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1218);
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1232 = _1220 + _1230;
    float _1234 = _1222 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1236 = _1226 * _1226;
    float _1238 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1242 = fma(_1232, _1232, _1236);
    float _1244 = _1234 + _1238;
    float _1246 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1240);
    float _1248 = sqrt(_1242);
    float _1250 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1246);
    bool _1252 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1228;
    float _1256 = _1100;
    float _1258 = _1238;
    float _1260 = _1220;
    float _1262 = _1244;
    if (!_1252)
    {
        _1254 = _1220;
    }
    float _1264 = _1254;
    float _1266 = _1264;
    if (!_1252)
    {
        _1256 = _1216;
    }
    float _1268 = _1256;
    float _1270 = _1268;
    if (!_1252)
    {
        _1258 = _1244;
    }
    float _1272 = _1258;
    bool _1274 = !_1252;
    float _1276 = _1272;
    if (!_1274)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1282 = _1248 + _1280;
        float _1284 = _1244 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1286 = rsqrt(_1242);
        float _1288 = _1282 * _1278;
        float _1290 = _1288 * 0.15915493667125701904296875;
        float _1292 = _1290 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        float _1296 = _1290 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294 + (-1.0);
        float _1302 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = fma(_1298, _1284, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1306 = fma(_1244, _1294, _1302);
        float _1308 = _1286 * _1304;
        float _1310 = fma(_1232, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1226, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1276 = _1306;
        _1266 = _1310;
        _1270 = _1312;
    }
    float _1314 = _1276;
    float _1316 = _1266;
    float _1318 = _1270;
    float _1320 = -_1234;
    float _1322 = _1320 + _1314;
    float _1324 = -_1210;
    float _1326 = _1324 + _1316;
    float _1328 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1330 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1332 = _1322 * _1322;
    float _1334 = -_1196;
    float _1336 = _1334 + _1318;
    float _1338 = 1.0 / _1328;
    float _1340 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1330);
    float _1342 = fma(_1326, _1326, _1332);
    float _1344 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1340);
    float _1346 = fma(_1336, _1336, _1342);
    bool _1348 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1350 = isnan(0.5);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1356 = _1352 || _1354;
    float _1358 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1360 = sqrt(_1346);
    float _1362 = _1358 + _1328;
    float _1364 = _1362 * _1338;
    float _1366 = _1364 * 0.5;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1370 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1368);
    bool _1372 = _1360 > 0.0;
    float _1374 = 1.0 / _1370;
    float _1376 = _1360;
    float _1378 = _1314;
    float _1380 = _1316;
    float _1382 = _1318;
    float _1384 = _1322;
    if (_1356)
    {
        _1376 = 1.0;
    }
    float _1386 = _1376;
    bool _1388 = !_1372;
    float _1390 = 0.0;
    float _1392 = _1386;
    if (!_1388)
    {
        float _1394 = _188 * _188;
        float _1396 = fma(_186, _186, _1394);
        float _1398 = fma(_190, _190, _1396);
        float _1400 = rsqrt(_1346);
        float _1402 = sqrt(_1398);
        float _1404 = _1322 * _1400;
        float _1406 = _1336 * _1400;
        bool _1408 = _1402 > 0.0;
        float _1410 = _1326 * _1400;
        bool _1412 = !_1408;
        _1390 = _1406;
        _1260 = _1410;
        if (!_1412)
        {
            float _1414 = rsqrt(_1398);
            float _1416 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1418 = _188 * _1414;
            float _1420 = _186 * _1414;
            float _1422 = _190 * _1414;
            float _1424 = _1404 * _1418;
            float _1426 = fma(_1410, _1420, _1424);
            float _1428 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1430 = fma(_1406, _1422, _1426);
            float _1432 = _1430 * _1428;
            float _1434 = fma(_186, _1432, _1316);
            float _1436 = fma(_188, _1432, _1314);
            float _1438 = fma(_190, _1432, _1318);
            _1378 = _1436;
            _1380 = _1434;
            _1382 = _1438;
            _1384 = _1432;
        }
    }
    float _1440 = _1378;
    float _1442 = _1380;
    float _1444 = _1382;
    float _1446 = _1390;
    float _1448 = _1260;
    float _1450 = _1384;
    float _1452 = _1450;
    if (_1356)
    {
        _1452 = 1.0;
    }
    float _1454 = _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1458 = _1374 * _1456;
    float _1460 = _1454;
    if (!_1356)
    {
        float _1462 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1464 = _1462 * 0.15915493667125701904296875;
        float _1466 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1468 = _1464 * 6.283185482025146484375;
        float _1470 = cos(_1468);
        float _1472 = _1466 * 0.15915493667125701904296875;
        float _1474 = _1464 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = 1.0 / _1470;
        float _1480 = _1472 * 6.283185482025146484375;
        float _1482 = cos(_1480);
        float _1484 = _1476 * _1478;
        float _1486 = _1472 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = _1482 * _1484;
        float _1492 = 1.0 / _1490;
        float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1496 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1494;
        float _1498 = 1.0 / _1496;
        float _1500 = _1488 * _1492;
        float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1504 = fma(_1458, _1500, _1502);
        float _1506 = _1504 * _1498;
        float _1508 = precise::clamp(_1506, 0.0, 1.0);
        _1392 = _1508;
    }
    float _1510 = _1392;
    if (!_1356)
    {
        float _1512 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1514 = _1512 * 0.15915493667125701904296875;
        float _1516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1518 = _1514 * 6.283185482025146484375;
        float _1520 = cos(_1518);
        float _1522 = _1516 * 0.15915493667125701904296875;
        float _1524 = _1514 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        float _1528 = 1.0 / _1520;
        float _1530 = _1522 * 6.283185482025146484375;
        float _1532 = cos(_1530);
        float _1534 = _1526 * _1528;
        float _1536 = _1522 * 6.283185482025146484375;
        float _1538 = sin(_1536);
        float _1540 = _1532 * _1534;
        float _1542 = 1.0 / _1540;
        float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1546 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1544;
        float _1548 = 1.0 / _1546;
        float _1550 = _1538 * _1542;
        float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1554 = fma(_1458, _1550, _1552);
        float _1556 = _1554 * _1548;
        float _1558 = precise::clamp(_1556, 0.0, 1.0);
        float _1560 = -_1558;
        float _1562 = _1560 + 1.0;
        _1460 = _1562;
    }
    float _1564 = _1460;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1440 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1572 = _1442 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1576 = _1444 + _1574;
    float _1578 = _1568 * _1568;
    float _1580 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1582 = fma(_1572, _1572, _1578);
    float _1584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1586 = fma(_1576, _1576, _1582);
    float _1588 = precise::max(0.0, _1584);
    float _1590 = rsqrt(_1586);
    float _1592 = sqrt(_1586);
    float _1594 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1596 = _1572 * _1594;
    float _1598 = _1576 * _1594;
    float _1600 = -_1594;
    float _1602 = -_1588;
    float _1604 = fma(_1568, _1600, _1602);
    float _1606 = _1596 * _1596;
    float _1608 = _1598 * _1598;
    float _1610 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1612 = _1606 + _1608;
    float _1614 = floor(_1610);
    float _1616 = sqrt(_1612);
    bool _1618 = _1616 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1622 = _1616 + _1620;
    float _1624 = _1446;
    float _1626 = _1568;
    float _1628 = _1612;
    float _1630 = _1622;
    float _1632 = _1596;
    float _1634 = _1598;
    float _1636 = _1606;
    float _1638 = _1608;
    if (_1618)
    {
        float _1640 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1618)
    {
        float _1644 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1644;
    }
    float _1646 = _1626;
    float _1648 = _1646;
    if (_1618)
    {
        float _1650 = rsqrt(_1612);
        _1628 = _1650;
    }
    float _1652 = _1628;
    float _1654 = _1642;
    float _1656 = _1652;
    if (_1618)
    {
        float _1658 = _1622 * _1642;
        _1630 = _1658;
    }
    float _1660 = _1630;
    if (_1618)
    {
        float _1662 = _1660 * 0.15915493667125701904296875;
        _1654 = _1662;
    }
    float _1664 = _1654;
    float _1666 = _1448;
    if (_1618)
    {
        float _1668 = _1664 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1666 = _1670;
    }
    float _1672 = _1666;
    float _1674 = _1660;
    if (_1618)
    {
        float _1676 = _1664 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = _1672;
    if (_1618)
    {
        float _1684 = fma(_1672, _1646, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1262 = _1684;
    }
    float _1686 = _1262;
    float _1688 = _1686;
    if (!_1618)
    {
        _1648 = _1604;
    }
    float _1690 = _1648;
    float _1692 = _1690;
    if (_1618)
    {
        float _1694 = _1652 * _1686;
        _1688 = _1694;
    }
    float _1696 = _1688;
    if (_1618)
    {
        float _1698 = _1680 + (-1.0);
        _1682 = _1698;
    }
    float _1700 = _1682;
    if (_1618)
    {
        float _1702 = _1596 * _1696;
        _1632 = _1702;
    }
    float _1704 = _1632;
    if (_1618)
    {
        float _1706 = _1598 * _1696;
        _1634 = _1706;
    }
    float _1708 = _1634;
    float _1710 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1618)
    {
        float _1712 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1656 = _1712;
    }
    float _1714 = _1656;
    if (_1618)
    {
        float _1716 = _1704 * _1704;
        _1636 = _1716;
    }
    float _1718 = _1636;
    if (_1618)
    {
        float _1720 = _1708 * _1708;
        _1638 = _1720;
    }
    float _1722 = _1638;
    if (_1618)
    {
        float _1724 = fma(_1604, _1680, _1714);
        _1692 = _1724;
    }
    float _1726 = _1692;
    float _1728 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1730 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1710);
    float _1732 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1580);
    float _1734 = fma(_1726, _1726, _1718);
    float _1736 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1728);
    float _1738 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1730);
    float _1740 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1742 = _1734 + _1722;
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1746 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1750 = fma(_1592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1748);
    float _1752 = precise::clamp(_1750, 0.0, 1.0);
    float _1754 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1736);
    float _1756 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1758 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1746);
    float _1760 = -_1752;
    float _1762 = _1760 + 1.0;
    float _1764 = rsqrt(_1742);
    float _1766 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1768 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1758);
    float _1770 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1774 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1776 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1778 = abs(_1762);
    float _1780 = log2(_1778);
    float _1782 = -_1772;
    float _1784 = fma(_1782, _1744, 1.0);
    float _1786 = fma(_1196, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1788 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1776);
    float _1790 = -_1614;
    float _1792 = _1610 + _1790;
    float _1794 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1796 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1798 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1788);
    float _1800 = _1764 * _1704;
    float _1802 = _1764 * _1726;
    float _1804 = _1764 * _1708;
    float _1806 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1798);
    float _1808 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1810 = floor(_1786);
    float _1812 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1796);
    float _1814 = -_1808;
    float _1816 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1814);
    float _1818 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1820 = -_1804;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1816);
    float _1824 = log2(_1784);
    float _1826 = fma(_1822, -0.5, 0.5);
    float _1828 = fma(_1822, 0.5, 0.5);
    float _1830 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1794);
    float _1832 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1812);
    float _1834 = exp2(_1818);
    float _1836 = fma(_1828, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1838 = -_1810;
    float _1840 = _1786 + _1838;
    float _1842 = _1802 + 1.0;
    float _1844 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1830);
    float _1846 = fma(_1828, _1836, -0.212114393711090087890625);
    float _1848 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1832);
    float _1850 = 1.0 / _1806;
    float _1852 = fma(_1828, _1846, 1.570728778839111328125);
    float _1854 = _1824 * 0.693147182464599609375;
    float _1856 = sqrt(_1826);
    float _1858 = -_1802;
    float _1860 = fma(_1834, _1842, _1858);
    float _1862 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1844);
    float _1864 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1866 = fma(_1860, 0.5, 0.5);
    float _1868 = _1862 * _1850;
    float _1870 = _1848 * _1850;
    float _1872 = _1856 * 0.636619746685028076171875;
    float _1874 = fma(_1868, 0.5, 0.5);
    float _1876 = fma(_1870, -0.5, 0.5);
    float _1878 = -_1852;
    float _1880 = fma(_1872, _1878, 1.0);
    float2 _5929 = float2(_1792, _1840);
    float _1882 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5929, float2(0.0), isnan(_5929)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5929, float2(0.0), isnan(_5929)), level(0.0)).x;
    float3 _5940 = float3(_1874, _1876, _1864);
    float _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5940, float3(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5940, float3(0.0), isnan(_5940)), level(0.0)).x;
    float3 _5951 = float3(_1874, _1876, _1864);
    float4 _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5951, float3(0.0), isnan(_5951)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5951, float3(0.0), isnan(_5951)), level(0.0)).xyzw;
    float _1889 = _1887.x;
    float _1891 = _1887.y;
    float _1893 = _1887.z;
    float _1895 = _1887.w;
    float2 _5967 = float2(_1880, _1866);
    float3 _1899 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5967, float2(0.0), isnan(_5967)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5967, float2(0.0), isnan(_5967)), level(0.0)).xyz;
    float _1901 = _1899.x;
    float _1903 = _1899.y;
    float _1905 = _1899.z;
    float _1907 = float(uint(_912));
    float _1909 = trunc(_962);
    int _1911 = int(_1909);
    float _1913 = _990 * _168;
    bool _1915 = _912 == 0;
    float _1917 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1919 = ~_912;
    int _1921 = _1919 + 1;
    int _1923 = abs(_824);
    float _1925 = 1.0 / _1907;
    int _1927 = abs(_864);
    float _1929 = float(uint(_1911));
    float _1931 = trunc(_1913);
    int _1933 = int(_1931);
    int _1935 = as_type<int>(_1925) + (-2);
    float _1937 = exp2(_1917);
    float _1939 = as_type<float>(_1935) * _1929;
    float _1941 = trunc(_1939);
    float _1943 = precise::max(_1941, 0.0);
    uint _1946 = uint(_1943);
    int _1948 = ~_912;
    int _1950 = _1948 + 1;
    float _1952 = -_1937;
    float _1954 = _1952 + 1.0;
    float _1956 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1958 = _1921 * int(_1946);
    int _1960 = _1958 + _1911;
    float _1962 = float(uint(_1960));
    float _1964 = as_type<float>(_1935) * _1962;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1968 = _1966 != 0;
    float _1970 = trunc(_1964);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    bool _1976 = !_1968;
    float _1978 = _1976 ? 7.345489978790283203125 : 1.0;
    float _1980 = _1978 * _746;
    float _1982 = floor(_1980);
    int _1984 = int(_1946) + int(_1974);
    float _1986 = float(_1911);
    int _1988 = _1950 * _1984;
    int _1990 = _1988 + _1911;
    bool _1992 = _1986 >= _960;
    bool _1994 = isnan(_1986);
    bool _1996 = _1992 || _1994;
    bool _1998 = isnan(_960);
    bool _2000 = _1996 || _1998;
    float _2002 = float(_2000);
    bool _2004 = uint(_1990) >= uint(_912);
    float _2006 = trunc(_2002);
    int _2008 = int(_2006);
    float _2010 = -_1982;
    float _2012 = _1980 + _2010;
    float _2014 = _2012 * _960;
    bool _2016 = !_2004;
    int _2018 = _2016 ? 0 : (-1);
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2022 = _2020 != 0;
    float _2024 = trunc(_2014);
    int _2026 = int(_2024);
    int _2028 = ~_1984;
    int _2030 = _2028 + _2018;
    int _2032 = _2030 + 1;
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2036 = _2034 != 0;
    int _2038 = ~_2008;
    int _2040 = _2038 + 1;
    int _2042 = _2040 + 1;
    int _2044 = _912 * _2032;
    int _2046 = _2044 + _1911;
    int _2048 = _912 + (-1);
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2052 = _2050 != 0;
    bool _2054 = !_1915;
    int _2056 = _2054 ? _2046 : (-1);
    bool _2058 = !_2022;
    int _2060 = _2058 ? 0 : 1;
    int _2062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2064 = _2062 != 0;
    int _2066 = _2056 * _2042;
    int _2068 = abs(_2060);
    int _2070 = abs(_840);
    int _2072 = _2008 * _2048;
    int _2074 = _2072 + _2066;
    bool _2076 = !_2064;
    int _2078 = _2076 ? 0 : 1;
    int _2080 = _2026 * _2068;
    int _2082 = _2080 + _1911;
    float _2084 = in.m_67.y;
    int _2086 = _2074 * _1923;
    int _2088 = abs(_2078);
    int _2090 = _1933 * _2070;
    int _2092 = _2090 + _2086;
    bool _2094 = _748 > 0.5;
    int _2096 = _2082 * _1927;
    int _2098 = _2096 + _2092;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2104 = as_type<float>(_1927);
    if (_2036)
    {
        float _2106 = in.m_57.x;
        _2104 = _2106;
    }
    float _2108 = _2104;
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2110;
    int _2114 = _2026 * _2088;
    int _2116 = _2114 + _2098;
    int _2118 = ~_912;
    int _2120 = _2118 + 1;
    float _2122 = in.m_67.x;
    float _2124 = 1.0 / _2102;
    int _2126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2128 = _2126 != 0;
    float _2130 = float(uint(_2116));
    bool _2132 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2134 = isnan(_738);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = as_type<float>(_1935) * _2130;
    float _2146 = -_2084;
    float _2148 = _2146 + 1.0;
    float _2150 = trunc(_2144);
    float _2152 = precise::max(_2150, 0.0);
    uint _2154 = uint(_2152);
    float _2156 = _2084;
    if (_2052)
    {
        float _2158 = _2094 ? _2148 : _2084;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = _2112 * _2124;
    float _2164 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2166 = _738 + _2164;
    bool _2168 = _1072 != 0.0;
    bool _2170 = isnan(_1072);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(0.0);
    bool _2176 = _2172 || _2174;
    bool _2178 = _2108 > 0.5;
    bool _2180 = _2178 && _2036;
    float _2182 = fma(_2162, _2166, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2184 = float(uint(_2082));
    float _2186 = -_2142;
    float _2188 = _2186 + 1.0;
    int _2190 = ~_912;
    int _2192 = _2190 + 1;
    float _2194 = as_type<float>(_1935) * _2184;
    int _2196 = _2120 * int(_2154);
    int _2198 = _2196 + _2116;
    int _2200 = ~_912;
    int _2202 = _2200 + 1;
    bool _2204 = _1070 == 0.0;
    bool _2206 = !_2176;
    bool _2208 = _2204 && _2206;
    float _2210 = float(uint(_2198));
    float _2212 = trunc(_2194);
    float _2214 = precise::max(_2212, 0.0);
    uint _2216 = uint(_2214);
    bool _2218 = _1074 == 0.0;
    bool _2220 = _2218 && _2208;
    float _2222 = as_type<float>(_1935) * _2210;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2224 = trunc(_2222);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    float _2230 = in.m_71.x;
    float _2232 = in.m_71.y;
    float _2234 = in.m_71.z;
    int _2236 = int(_2154) + int(_2228);
    bool _2238 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2240 = isnan(_738);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2122;
    if (_2036)
    {
        _888 = _2122;
    }
    float _2252 = _888;
    int _2254 = _2202 * _2236;
    int _2256 = _2254 + _2116;
    float _2258 = _2248 * _2188;
    float _2260 = _2252;
    if (_2180)
    {
        float _2262 = -_2252;
        float _2264 = _2262 + 1.0;
        _2260 = _2264;
    }
    float _2266 = _2260;
    float _2268 = _2234;
    float _2270 = _2232;
    float _2272 = _2230;
    if (!_2220)
    {
        float _2274 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2234);
        _2268 = _2274;
    }
    float _2276 = _2268;
    float _2278 = _2182 * _2258;
    float _2280 = -_2248;
    float _2282 = _2280 + 1.0;
    if (!_2220)
    {
        float _2284 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2232);
        _2270 = _2284;
    }
    float _2286 = _2270;
    if (_2036)
    {
        _2250 = _2266;
    }
    float _2288 = _2250;
    float _2290 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2292 = uint(_2256) >= uint(_912);
    int _2294 = _2192 * int(_2216);
    int _2296 = _2294 + _2082;
    float _2298 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2278);
    float _2300 = -_788;
    float _2302 = fma(_916, _2290, _2300);
    bool _2304 = !_2292;
    int _2306 = _2304 ? 0 : (-1);
    float _2308 = fma(_2288, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2310 = float(uint(_2296));
    float _2312 = _2302 + 0.5;
    int _2314 = ~_2236;
    int _2316 = _2314 + _2306;
    int _2318 = _2316 + 1;
    float _2320 = fma(_924, _2308, _780);
    float _2322 = abs(_1458);
    float _2324 = log2(_2322);
    float _2326 = as_type<float>(_1935) * _2310;
    float _2328 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2298);
    int _2330 = _912 * _2318;
    int _2332 = _2330 + _2116;
    float _2334 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2336 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2338 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_2220)
    {
        float _2340 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2230);
        _2272 = _2340;
    }
    float _2342 = _2272;
    float _2344 = trunc(_2326);
    float _2346 = precise::max(_2344, 0.0);
    uint _2348 = uint(_2346);
    bool _2350 = !_1915;
    int _2352 = _2350 ? _2332 : (-1);
    float _2354 = _2320 + 0.5;
    float _2356 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2358 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2360 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2362 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2364 = ~_912;
    int _2366 = _2364 + 1;
    float _2368 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2370 = _2352 >> 31;
    out.m_73.x = _2354;
    out.m_73.y = _2312;
    int _2372 = _2370 & 3;
    float _2374 = exp2(_2368);
    out.m_75.x = _2356;
    out.m_75.y = _2358;
    out.m_75.z = _2360;
    out.m_75.w = _2362;
    int _2376 = int(_2216) + int(_2348);
    float _2378 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2380 = _2352 + _2372;
    float _2382 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2384 = _2380 >> 2;
    int _2386 = _2352 & 3;
    bool _2388 = _2386 != 0;
    int _2390 = _2366 * _2376;
    int _2392 = _2390 + _2082;
    bool _2394 = _1458 <= 8000.0;
    bool _2396 = isnan(_1458);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(8000.0);
    bool _2402 = _2398 || _2400;
    float _2404 = float(_2402);
    float _2406 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2408 = -_1132;
    float _2410 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2378);
    float _2412 = -_1132;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2382);
    float _2416 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2418 = -_1132;
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2406);
    int _2422 = _2384 << 4;
    int _2424 = _2422 + 368;
    float _2426 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    float _2430 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2410);
    float _2432 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2414);
    uint _2434 = uint(int(uint(_2424) >> uint(2)));
    uint _2436 = uint(int(uint(int(_2434)) >> uint(2)));
    int _2438 = int(_2434) & 3;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[int(_2436)][_2438];
    int _2442 = int(_2434) + 1;
    uint _2444 = uint(int(uint(_2442) >> uint(2)));
    int _2446 = _2442 & 3;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[int(_2444)][_2446];
    float _2450 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2420);
    float _2452 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2454 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2416);
    int _2456 = _2352 & 3;
    bool _2458 = _2456 != 0;
    float _2460 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2462 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2452);
    float _2464 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2466 = _2424 + 8;
    uint _2468 = uint(int(uint(_2466) >> uint(2)));
    uint _2470 = uint(int(uint(int(_2468)) >> uint(2)));
    int _2472 = int(_2468) & 3;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[int(_2470)][_2472];
    int _2476 = int(_2468) + 1;
    uint _2478 = uint(int(uint(_2476) >> uint(2)));
    int _2480 = _2476 & 3;
    float _2482 = (*spvDescriptorSet0.vp_c9)._m0[int(_2478)][_2480];
    bool _2484 = uint(_2456) > 1u;
    float _2486 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2488 = uint(_2392) >= uint(_912);
    float _2490 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2460);
    float _2492 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2464);
    float _2494 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2486);
    float _2496 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2498 = _2432 * _2286;
    int _2500 = _2388 ? 0 : 1;
    float _2502 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2490);
    float _2504 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2496);
    float _2506 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2492);
    int _2508 = ~_2500;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2494);
    int _2516 = _2512;
    if (!_2484)
    {
        int _2518 = ~_2500;
        int _2520 = _2518 + 1;
        _2516 = _2520;
    }
    int _2522 = _2516;
    float _2524 = _2430 * _2286;
    bool _2526 = _2456 != 3;
    float _2528 = _2450 * _2286;
    float _2530 = fma(_2502, _2342, _2524);
    bool _2532 = uint(_2456) >= 2u;
    float _2534 = fma(_2506, _2342, _2498);
    int _2536 = abs(_2522);
    float _2538 = fma(_2428, -2.0, 3.0);
    float _2540 = _2428 * _2428;
    int _2542 = _2532 ? 0 : 1;
    float _2544 = fma(_2514, _2342, _2528);
    bool _2546 = !_2458;
    int _2548 = _2546 ? 0 : 1;
    float _2550 = _2540 * _2538;
    int _2552 = ~_2536;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    float _2558 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2462);
    bool _2560 = _2456 != 3;
    float _2562 = -_1882;
    float _2564 = _2562 + 1.0;
    int _2566 = ~_2542;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = _1956 * _1884;
    int _2574 = abs(_2548);
    float _2576 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2454);
    int _2578 = _2570;
    if (_2526)
    {
        int _2580 = ~_2542;
        int _2582 = _2580 + 1;
        _2578 = _2582;
    }
    int _2584 = _2578;
    int _2586 = _2556 * as_type<int>(_2448);
    bool _2588 = !_2560;
    int _2590 = _2588 ? 0 : (-1);
    float _2592 = _1905 * _2572;
    bool _2594 = !_2128;
    int _2596 = _2594 ? 0 : 1;
    float _2598 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2504);
    int _2600 = abs(_2584);
    float _2602 = fma(_2576, _2276, _2534);
    int _2604 = ~_2574;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    float _2610 = fma(_1895, _2592, _1893);
    int _2612 = abs(_2590);
    int _2614 = abs(_2596);
    int _2616 = _2608 * as_type<int>(_2440);
    int _2618 = _2616 + _2586;
    bool _2620 = !_2488;
    int _2622 = _2620 ? 0 : (-1);
    int _2624 = ~_2600;
    int _2626 = _2624 + 1;
    int _2628 = _2626 + 1;
    float _2630 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2632 = ~_2376;
    int _2634 = _2632 + _2622;
    int _2636 = _2634 + 1;
    int _2638 = ~_2612;
    int _2640 = _2638 + 1;
    int _2642 = _2640 + 1;
    int _2644 = _2628 * as_type<int>(_2474);
    int _2646 = _2644 + _2618;
    float _2648 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2630);
    int _2650 = _912 * _2636;
    int _2652 = _2650 + _2082;
    float _2654 = fma(_2558, _2276, _2530);
    int _2656 = _2642 * as_type<int>(_2482);
    int _2658 = _2656 + _2646;
    float _2660 = -_2550;
    float _2662 = _2660 + 1.0;
    float _2664 = in.m_77.x;
    int _2666 = ~_2614;
    int _2668 = _2666 + 1;
    int _2670 = _2668 + 1;
    float _2672 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2648);
    float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2550);
    bool _2676 = !_1915;
    int _2678 = _2676 ? _2652 : (-1);
    float _2680 = fma(_2598, _2276, _2544);
    int _2682 = _2658 * _2670;
    float _2684 = _2404 * _2674;
    float _2686 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2672);
    int _2688 = _2678 * _2614;
    int _2690 = _2688 + _2682;
    float _2692 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2694 = _2686 + _1806;
    float _2696 = _1895 * _2572;
    float _2698 = _2564 * _2692;
    float _2700 = precise::clamp(_2698, 0.0, 1.0);
    float _2702 = _2694 * 0.5;
    float _2704 = -_1956;
    float _2706 = _2704 + 1.0;
    float _2708 = fma(_1901, _2696, _1889);
    float _2710 = -_2700;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2714 = fma(_1903, _2696, _1891);
    out.m_79.z = _2702;
    out.m_79.w = _1806;
    float _2716 = _1895 * _2706;
    bool _2718 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2720 = isnan(_1592);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2726 = _2722 || _2724;
    float _2728 = _2712 * _2664;
    out.gl_Position.x = _1862;
    out.gl_Position.y = _1848;
    out.gl_Position.z = _2686;
    out.gl_Position.w = _1806;
    float _2730 = float(_2690);
    out.m_81.x = _2708;
    out.m_81.y = _2714;
    out.m_81.z = _2610;
    out.m_81.w = _2716;
    float _2732 = _2728 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2734 = _1510 * _1564;
    out.m_83.x = _2654;
    out.m_83.y = _2602;
    out.m_83.z = _2680;
    float _2736 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_85.x = _2732;
    float _2738 = _2702;
    float _2740 = _2592;
    float _2742 = _2696;
    float _2744 = _2706;
    float _2746 = _2734;
    float _2748 = _2730;
    if (!_2726)
    {
        _2738 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2750 = _2738;
    float _2752 = _2750;
    float _2754 = _2750;
    if (!_2726)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2756 = _2740;
    out.m_87.x = _2730;
    float _2758 = _2756;
    float _2760 = _2756;
    if (!_2726)
    {
        _2742 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2762 = _2742;
    float _2764 = _2762;
    float _2766 = _2762;
    if (!_2726)
    {
        _2744 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2768 = _2744;
    float _2770 = _2768;
    float _2772 = _2768;
    if (!_2726)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2774 = _2746;
    float _2776 = _2774;
    float _2778 = _2774;
    if (!_2726)
    {
        _2748 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2780 = _2748;
    bool _2782 = !_2726;
    float _2784 = _2780;
    float _2786 = _2780;
    if (!_2782)
    {
        bool _2788 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2790 = isnan(_1592);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2796 = _2792 || _2794;
        if (!_2796)
        {
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2800 = _1592 + _2798;
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2804 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2802;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2810 = 1.0 / _2804;
            float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2828 = _2800 * _2810;
            float _2830 = precise::clamp(_2828, 0.0, 1.0);
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2836 = fma(_2830, _2808, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2838 = fma(_2830, _2834, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2840 = fma(_2830, _2814, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2842 = fma(_2830, _2818, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2844 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2846 = fma(_2830, _2826, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2786 = _2840;
            _2772 = _2844;
            _2754 = _2836;
            _2766 = _2842;
            _2760 = _2838;
            _2778 = _2846;
            _2848 = true;
        }
        else
        {
            bool _2850 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2852 = isnan(_1592);
            bool _2854 = _2850 || _2852;
            bool _2856 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2858 = _2854 || _2856;
            if (!_2858)
            {
                _2752 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2860 = _2752;
            _2754 = _2860;
            if (!_2858)
            {
                _2784 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2862 = _2784;
            _2786 = _2862;
            if (!_2858)
            {
                _2758 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2864 = _2758;
            _2760 = _2864;
            if (!_2858)
            {
                _2764 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2866 = _2764;
            _2766 = _2866;
            if (!_2858)
            {
                _2770 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2868 = _2770;
            _2772 = _2868;
            if (!_2858)
            {
                _2776 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2870 = _2776;
            bool _2872 = !_2858;
            _2778 = _2870;
            if (!_2872)
            {
                bool _2874 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2876 = isnan(_1592);
                bool _2878 = _2874 || _2876;
                bool _2880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2882 = _2878 || _2880;
                if (!_2882)
                {
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2886 = _1592 + _2884;
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2890 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2888;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2896 = 1.0 / _2890;
                    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2900 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2914 = _2886 * _2896;
                    float _2916 = precise::clamp(_2914, 0.0, 1.0);
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2922 = fma(_2916, _2894, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2924 = fma(_2916, _2920, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2926 = fma(_2916, _2900, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2928 = fma(_2916, _2904, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2930 = fma(_2916, _2908, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2932 = fma(_2916, _2912, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2786 = _2926;
                    _2772 = _2930;
                    _2754 = _2922;
                    _2766 = _2928;
                    _2760 = _2924;
                    _2778 = _2932;
                    _2848 = true;
                }
                else
                {
                    _2786 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2772 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2754 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2766 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2760 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2778 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2848 = false;
    float _2934 = _2786;
    float _2936 = _2772;
    float _2938 = _2754;
    float _2940 = _2766;
    float _2942 = _2760;
    float _2944 = _2778;
    float _2946 = fma(_2602, -0.5, 0.5);
    float _2948 = precise::clamp(_2946, 0.0, 1.0);
    float _2950 = -_2934;
    float _2952 = _2950 + _2936;
    float _2954 = _2736 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2956 = -_2938;
    float _2958 = _2956 + _2940;
    out.m_89.x = 0.0;
    float _2960 = fma(_2948, _2952, _2934);
    float _2962 = fma(_2948, _2958, _2938);
    out.m_53.x = _2954;
    float _2964 = -_2942;
    float _2966 = _2964 + _2944;
    float _2968 = _2960 * 0.586610972881317138671875;
    bool _2970 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2972 = fma(_2948, _2966, _2942);
    float _2974 = fma(_2962, 0.298911988735198974609375, _2968);
    bool _2976 = _1510 > 0.0;
    bool _2978 = isnan(_1510);
    bool _2980 = _2976 || _2978;
    bool _2982 = isnan(0.0);
    bool _2984 = _2980 || _2982;
    float _2986 = fma(_2972, 0.114477999508380889892578125, _2974);
    bool _2988 = _1564 <= 0.0;
    bool _2990 = !_2984;
    bool _2992 = _2988 || _2990;
    float _2994 = -_2986;
    float _2996 = _2962 + _2994;
    float _2998 = -_2986;
    float _3000 = _2960 + _2998;
    float _3002 = -_2986;
    float _3004 = _2972 + _3002;
    float _3006 = fma(_2996, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2986);
    float _3008 = fma(_3000, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2986);
    float _3010 = fma(_3004, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2986);
    bool _3012 = !_2970;
    if (!_3012)
    {
        float _3014 = -_1440;
        float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3018 = -_1442;
        float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3022 = -_1444;
        float _3024 = _3022 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3026 = _3016 * _3016;
        float _3028 = fma(_3020, _3020, _3026);
        float _3030 = fma(_3024, _3024, _3028);
        float _3032 = sqrt(_3030);
        float _3034 = rsqrt(_3030);
        float _3036 = -_3032;
        float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3040 = _3038 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3042 = precise::clamp(_3040, 0.0, 1.0);
        float _3044 = _3020 * _3034;
        float _3046 = _3016 * _3034;
        float _3048 = abs(_3042);
        float _3050 = log2(_3048);
        float _3052 = _3024 * _3034;
        float _3054 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3056 = _2602 * _3046;
        float _3058 = -_3046;
        float _3060 = -_3054;
        float _3062 = fma(_3058, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3060);
        float _3064 = fma(_2654, _3044, _3056);
        float _3066 = -_3052;
        float _3068 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3062);
        float _3070 = fma(_2680, _3052, _3064);
        float _3072 = precise::clamp(_3070, 0.0, 1.0);
        float _3074 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3076 = _3068 + _3074;
        float _3078 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3080 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3082 = precise::clamp(_3080, 0.0, 1.0);
        float _3084 = exp2(_3078);
        float _3086 = _3084 * _3082;
        float _3088 = _3072 * _3086;
        float _3090 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3092 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3094 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3090;
        out.m_89.y = _3092;
        out.m_89.z = _3094;
    }
    out.m_91.x = _3006;
    out.m_91.y = _3008;
    out.m_91.z = _3010;
    if (!_2992)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3096 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3096;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

