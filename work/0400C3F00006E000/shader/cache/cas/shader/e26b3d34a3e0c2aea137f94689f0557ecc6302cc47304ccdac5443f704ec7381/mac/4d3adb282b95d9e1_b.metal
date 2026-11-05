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
    float4 m_85 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2802 = false;
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
        float _3112 = as_type<float>(_134);
        out.gl_Position.z = _3112;
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
        float _3167 = as_type<float>(_160);
        out.gl_Position.z = _3167;
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
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _760 = 1.0 + _758;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _764 = 1.0 / _760;
    float _766 = _740 * 2.0;
    float _768 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _770 = _746 * 2.0;
    float _772 = floor(_766);
    float _774 = _748 * 2.0;
    float _776 = -_750;
    float _778 = fma(_768, 2.0, _776);
    float _780 = _744 * _116;
    float _782 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _784 = _748 + _746;
    float _786 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _762);
    float _788 = floor(_770);
    float _790 = fma(_782, -2.0, _756);
    float _792 = _784 + (-1.0);
    float _794 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _786);
    float _796 = -_116;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[76].x, _778);
    float _800 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _790);
    float _802 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _804 = _772 >= 0.0;
    bool _806 = isnan(_772);
    bool _808 = _804 || _806;
    bool _810 = isnan(0.0);
    bool _812 = _808 || _810;
    float _814 = exp2(_780);
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _826 = _824 != 0;
    int _828 = _812 ? 0 : 1;
    bool _830 = _788 > 0.0;
    float _832 = floor(_774);
    bool _834 = !_822;
    int _836 = _834 ? 0 : 1;
    bool _838 = _772 > 0.0;
    bool _840 = _788 >= 0.0;
    bool _842 = isnan(_788);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    bool _850 = !_818;
    int _852 = _850 ? 0 : 1;
    float _854 = -_814;
    float _856 = _854 + 1.0;
    bool _858 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    int _868 = ~_828;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    bool _874 = !_826;
    int _876 = _874 ? 0 : 1;
    float _878 = _866 ? _856 : 0.0;
    bool _880 = _832 > 0.0;
    bool _882 = _832 >= 0.0;
    bool _884 = isnan(_832);
    bool _886 = _882 || _884;
    bool _888 = isnan(0.0);
    bool _890 = _886 || _888;
    int _892 = _872;
    if (!_838)
    {
        int _894 = ~_828;
        int _896 = _894 + 1;
        _892 = _896;
    }
    int _898 = _892;
    float _900 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _902 = int(_900);
    float _904 = float(_754);
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _908 = _906 != 0;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _916 = _914 != 0;
    float _918 = in.m_63.x;
    float _920 = in.m_63.y;
    float _922 = in.m_63.z;
    int _924 = _848 ? 0 : 1;
    float _926 = 1.0 / _904;
    bool _928 = !_908;
    int _930 = _928 ? 0 : 1;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _934 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _936 = isnan(1.0);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _942 = _938 || _940;
    float _944 = float(_898);
    float _946 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _932);
    int _948 = ~_924;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = abs(_930);
    float _956 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _946);
    float _958 = float(_902);
    float _960 = float(_954);
    bool _962 = !_912;
    int _964 = _962 ? 0 : 1;
    float _966 = _958 * _116;
    float _968 = _926 * _116;
    float _970 = _960 * _944;
    int _972 = _952;
    if (_942)
    {
        float _974 = _878 * _764;
        _126 = _974;
    }
    float _976 = _126;
    if (!_830)
    {
        int _978 = ~_924;
        int _980 = _978 + 1;
        _972 = _980;
    }
    int _982 = _972;
    float _984 = _746 + (-0.5);
    float _986 = _970 * (-2.0);
    int _988 = abs(_964);
    bool _990 = !_916;
    int _992 = _990 ? 0 : 1;
    float _994 = fma(_986, _918, _918);
    int _996 = _890 ? 0 : 1;
    float _998 = fma(_802, _986, _802);
    float _1000 = float(_982);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].x, _994);
    float _1004 = float(_988);
    int _1006 = abs(_992);
    float _1008 = fma(_998, _976, _1002);
    int _1010 = ~_996;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = _1004 * _1000;
    int _1018 = _1014;
    if (!_880)
    {
        int _1020 = ~_996;
        int _1022 = _1020 + 1;
        _1018 = _1022;
    }
    int _1024 = _1018;
    float _1026 = _748 + _740;
    float _1028 = _1016 * (-2.0);
    float _1030 = _1026 + (-1.0);
    float _1032 = float(_1024);
    float _1034 = fma(_1028, _920, _920);
    float _1036 = float(_1006);
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1040 = _740 + _746;
    float _1042 = _740 + (-0.5);
    float _1044 = _1008 * 0.15915493667125701904296875;
    float _1046 = _1036 * _1032;
    float _1048 = _748 + (-0.5);
    float _1050 = fma(_1038, _1028, _1038);
    float _1052 = _1040 + (-1.0);
    float _1054 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1034);
    float _1056 = _1046 * (-2.0);
    float _1058 = _1044 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1064 = fma(_1050, _976, _1054);
    float _1066 = fma(_1056, _922, _922);
    float _1068 = in.m_65.x;
    float _1070 = in.m_65.y;
    float _1072 = in.m_65.z;
    float _1074 = fma(_1062, _1056, _1062);
    float _1076 = _1064 * 0.15915493667125701904296875;
    float _1078 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1066);
    float _1080 = _1044 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1086 = fma(_1074, _976, _1078);
    float _1088 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1090 = _1086 * 0.15915493667125701904296875;
    float _1092 = _1076 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = in.m_46.x;
    float _1100 = in.m_46.y;
    float _1102 = in.m_46.z;
    float _1104 = _1076 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1068);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1072);
    float _1112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1070);
    float _1114 = _1090 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1096 * _1108;
    float _1120 = _1088 * _1110;
    float _1122 = _1060 * _1094;
    float _1124 = _1084 * _1112;
    float _1126 = _1082 * _1094;
    float _1128 = _1090 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _1060 * _1106;
    float _1134 = _1082 * _1106;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1138 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1136);
    float _1140 = _1060 * _1116;
    float _1142 = _1082 * _1116;
    float _1144 = _1106 * _1116;
    float _1146 = _1094 * _1116;
    float _1148 = _1140 * _1124;
    float _1150 = _1142 * _1124;
    float _1152 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1138);
    float _1154 = fma(_1130, _1132, _1126);
    float _1156 = -_1122;
    float _1158 = fma(_1130, _1134, _1156);
    float _1160 = -_1134;
    float _1162 = fma(_1130, _1122, _1160);
    float _1164 = -_1124;
    float _1166 = _1130 * _1164;
    float _1168 = fma(_1154, _1118, _1148);
    float _1170 = fma(_1130, _1126, _1132);
    float _1172 = fma(_1158, _1118, _1150);
    float _1174 = fma(_1144, _1118, _1166);
    float _1176 = fma(_1162, _1120, _1168);
    float _1178 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1180 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1182 = fma(_1146, _1120, _1174);
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1186 = fma(_1170, _1120, _1172);
    float _1188 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1178);
    float _1190 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1184);
    float _1194 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1180);
    float _1196 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1188);
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1190);
    float _1200 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    float _1202 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1194);
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1206 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1198);
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1216 = _1204 + _1208;
    float _1218 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1220 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1212);
    float _1222 = _1210 + _1214;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1226 = _1216 + _1224;
    float _1228 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1230 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1220);
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1234 = _1222 + _1232;
    float _1236 = _1226 * _1226;
    float _1238 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1228);
    float _1240 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1242 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1244 = fma(_1234, _1234, _1236);
    float _1246 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1238);
    float _1248 = _1218 + _1240;
    float _1250 = sqrt(_1244);
    float _1252 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1254 = _1250 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = _1102;
    float _1258 = _1238;
    float _1260 = _1248;
    float _1262 = _1252;
    float _1264 = _1212;
    float _1266 = _1152;
    float _1268 = _1210;
    if (!_1254)
    {
        _1256 = _1222;
    }
    float _1270 = _1256;
    float _1272 = _1270;
    if (!_1254)
    {
        _1258 = _1216;
    }
    float _1274 = _1258;
    bool _1276 = !_1254;
    float _1278 = _1274;
    if (!_1276)
    {
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1284 = _1250 + _1282;
        float _1286 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = rsqrt(_1244);
        float _1290 = _1284 * _1280;
        float _1292 = _1290 * 0.15915493667125701904296875;
        float _1294 = _1292 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = _1292 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        float _1302 = _1296 + (-1.0);
        float _1304 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = fma(_1300, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1308 = fma(_1248, _1296, _1304);
        float _1310 = _1288 * _1306;
        float _1312 = fma(_1234, _1310, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1314 = fma(_1226, _1310, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1260 = _1308;
        _1272 = _1312;
        _1278 = _1314;
    }
    float _1316 = _1260;
    float _1318 = _1272;
    float _1320 = _1278;
    float _1322 = -_1218;
    float _1324 = _1322 + _1316;
    float _1326 = -_1210;
    float _1328 = _1326 + _1318;
    float _1330 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1242);
    float _1332 = 1.0 / _1252;
    float _1334 = _1324 * _1324;
    float _1336 = -_1204;
    float _1338 = _1336 + _1320;
    float _1340 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1330);
    bool _1342 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1344 = isnan(0.5);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1350 = _1346 || _1348;
    float _1352 = fma(_1328, _1328, _1334);
    float _1354 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1356 = fma(_1338, _1338, _1352);
    float _1358 = _1354 + _1252;
    float _1360 = sqrt(_1356);
    float _1362 = _1358 * _1332;
    float _1364 = _1362 * 0.5;
    float _1366 = _1316;
    float _1368 = _1320;
    float _1370 = _1328;
    float _1372 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1350)
    {
        _1262 = 1.0;
    }
    float _1374 = _1262;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1376);
    float _1380 = 1.0 / _1378;
    bool _1382 = _1360 > 0.0;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1386 = _1380 * _1384;
    float _1388 = _1360;
    float _1390 = _1378;
    float _1392 = _1374;
    if (!_1382)
    {
        _1388 = _1318;
    }
    float _1394 = _1388;
    bool _1396 = !_1382;
    float _1398 = _1394;
    if (!_1396)
    {
        float _1400 = _188 * _188;
        float _1402 = rsqrt(_1356);
        float _1404 = fma(_186, _186, _1400);
        float _1406 = fma(_190, _190, _1404);
        float _1408 = sqrt(_1406);
        float _1410 = _1328 * _1402;
        float _1412 = _1324 * _1402;
        float _1414 = _1338 * _1402;
        bool _1416 = _1408 > 0.0;
        float _1418 = _1408;
        _1390 = _1406;
        _1264 = _1412;
        _1266 = _1410;
        _1372 = _1414;
        if (!_1416)
        {
            _1418 = _1318;
        }
        float _1420 = _1418;
        bool _1422 = !_1416;
        _1398 = _1420;
        if (!_1422)
        {
            float _1424 = rsqrt(_1406);
            float _1426 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1428 = _188 * _1424;
            float _1430 = _186 * _1424;
            float _1432 = _190 * _1424;
            float _1434 = _1412 * _1428;
            float _1436 = fma(_1410, _1430, _1434);
            float _1438 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1440 = fma(_1414, _1432, _1436);
            float _1442 = _1440 * _1438;
            float _1444 = fma(_186, _1442, _1318);
            float _1446 = fma(_188, _1442, _1316);
            float _1448 = fma(_190, _1442, _1320);
            _1366 = _1446;
            _1398 = _1444;
            _1368 = _1448;
            _1370 = _1434;
        }
    }
    float _1450 = _1366;
    float _1452 = _1398;
    float _1454 = _1368;
    float _1456 = _1390;
    float _1458 = _1370;
    float _1460 = _1264;
    float _1462 = _1266;
    float _1464 = _1372;
    float _1466 = _1460;
    float _1468 = _1462;
    float _1470 = _1464;
    if (!_1350)
    {
        float _1472 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1474 = _1472 * 0.15915493667125701904296875;
        float _1476 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1478 = _1474 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1476 * 0.15915493667125701904296875;
        float _1484 = _1474 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = 1.0 / _1480;
        float _1490 = _1482 * 6.283185482025146484375;
        float _1492 = cos(_1490);
        float _1494 = _1486 * _1488;
        float _1496 = _1482 * 6.283185482025146484375;
        float _1498 = sin(_1496);
        float _1500 = _1492 * _1494;
        float _1502 = 1.0 / _1500;
        float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1506 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1504;
        float _1508 = 1.0 / _1506;
        float _1510 = _1498 * _1502;
        float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1514 = fma(_1386, _1510, _1512);
        float _1516 = _1514 * _1508;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        _1392 = _1518;
    }
    float _1520 = _1392;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1450 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1452 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1454 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = sqrt(_1538);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1528 * _1544;
    float _1548 = _1532 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1456;
    float _1566 = _1554;
    float _1568 = _1562;
    float _1570 = _1548;
    float _1572 = _1550;
    float _1574 = _1552;
    if (_1558)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1576;
    }
    float _1578 = _1564;
    if (_1558)
    {
        float _1580 = rsqrt(_1554);
        _1566 = _1580;
    }
    float _1582 = _1566;
    if (_1558)
    {
        float _1584 = _1562 * _1578;
        _1568 = _1584;
    }
    float _1586 = _1568;
    if (_1558)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _1466 = _1588;
    }
    float _1590 = _1466;
    float _1592 = _1458;
    if (_1558)
    {
        float _1594 = _1590 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1578;
    if (_1558)
    {
        float _1606 = _1590 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = -_1544;
    float _1614 = -_1602;
    float _1616 = fma(_1524, _1612, _1614);
    if (_1558)
    {
        float _1618 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1468 = _1618;
    }
    float _1620 = _1468;
    float _1622 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1624 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1626 = _1620;
    if (!_1558)
    {
        _1268 = _1546;
    }
    float _1628 = _1268;
    float _1630 = _1598;
    float _1632 = _1628;
    if (_1558)
    {
        float _1634 = fma(_1598, _1620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = _1636;
    if (!_1558)
    {
        _1630 = _1616;
    }
    float _1640 = _1630;
    float _1642 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1622);
    float _1644 = floor(_1624);
    float _1646 = _1640;
    if (_1558)
    {
        float _1648 = _1610 + (-1.0);
        _1470 = _1648;
    }
    float _1650 = _1470;
    float _1652 = _1650;
    if (_1558)
    {
        float _1654 = _1582 * _1636;
        _1638 = _1654;
    }
    float _1656 = _1638;
    float _1658 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1642);
    if (_1558)
    {
        float _1660 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1652 = _1660;
    }
    float _1662 = _1652;
    if (_1558)
    {
        float _1664 = _1546 * _1656;
        _1632 = _1664;
    }
    float _1666 = _1632;
    if (_1558)
    {
        float _1668 = _1548 * _1656;
        _1570 = _1668;
    }
    float _1670 = _1570;
    if (_1558)
    {
        float _1672 = fma(_1616, _1610, _1662);
        _1646 = _1672;
    }
    float _1674 = _1646;
    if (_1558)
    {
        float _1676 = _1666 * _1666;
        _1572 = _1676;
    }
    float _1678 = _1572;
    float _1680 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1558)
    {
        float _1682 = _1670 * _1670;
        _1574 = _1682;
    }
    float _1684 = _1574;
    float _1686 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1688 = fma(_1674, _1674, _1678);
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1692 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1696 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1694);
    float _1698 = precise::clamp(_1696, 0.0, 1.0);
    float _1700 = _1688 + _1684;
    float _1702 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1704 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1692);
    float _1706 = -_1698;
    float _1708 = _1706 + 1.0;
    float _1710 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1712 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1702);
    float _1714 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1716 = rsqrt(_1700);
    float _1718 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1720 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1712);
    float _1722 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1724 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1726 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1718);
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1732 = abs(_1708);
    float _1734 = log2(_1732);
    float _1736 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1738 = -_1724;
    float _1740 = fma(_1738, _1690, 1.0);
    float _1742 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1730);
    float _1744 = -_1644;
    float _1746 = _1624 + _1744;
    float _1748 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1750 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    float _1752 = _1716 * _1666;
    float _1754 = _1716 * _1674;
    float _1756 = floor(_1680);
    float _1758 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1750);
    float _1760 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1762 = _1716 * _1670;
    float _1764 = _1754 + 1.0;
    float _1766 = -_1760;
    float _1768 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1766);
    float _1770 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = log2(_1740);
    float _1774 = -_1762;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1768);
    float _1778 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = fma(_1776, -0.5, 0.5);
    float _1782 = fma(_1776, 0.5, 0.5);
    float _1784 = exp2(_1770);
    float _1786 = -_1756;
    float _1788 = _1680 + _1786;
    float _1790 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1748);
    float _1792 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1794 = fma(_1782, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1796 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1798 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1792);
    float _1800 = 1.0 / _1758;
    float _1802 = fma(_1782, _1794, -0.212114393711090087890625);
    float _1804 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1806 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1808 = fma(_1782, _1802, 1.570728778839111328125);
    float _1810 = sqrt(_1780);
    float _1812 = -_1754;
    float _1814 = fma(_1784, _1764, _1812);
    float _1816 = _1772 * 0.693147182464599609375;
    float _1818 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1820 = _1804 * _1800;
    float _1822 = _1806 * _1800;
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = fma(_1822, 0.5, 0.5);
    float _1828 = fma(_1814, 0.5, 0.5);
    float _1830 = _1810 * 0.636619746685028076171875;
    float2 _5818 = float2(_1746, _1788);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5818, float2(0.0), isnan(_5818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5818, float2(0.0), isnan(_5818)), level(0.0)).x;
    float _1834 = -_1808;
    float _1836 = fma(_1830, _1834, 1.0);
    float3 _5834 = float3(_1826, _1824, _1818);
    float _1838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5834, float3(0.0), isnan(_5834)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5834, float3(0.0), isnan(_5834)), level(0.0)).x;
    float3 _5845 = float3(_1826, _1824, _1818);
    float4 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5845, float3(0.0), isnan(_5845)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5845, float3(0.0), isnan(_5845)), level(0.0)).xyzw;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1841.w;
    float2 _5861 = float2(_1836, _1828);
    float3 _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5861, float2(0.0), isnan(_5861)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5861, float2(0.0), isnan(_5861)), level(0.0)).xyz;
    float _1855 = _1853.x;
    float _1857 = _1853.y;
    float _1859 = _1853.z;
    float _1861 = float(uint(_902));
    float _1863 = trunc(_968);
    int _1865 = int(_1863);
    int _1867 = ~_902;
    int _1869 = _1867 + 1;
    float _1871 = _966 * _168;
    bool _1873 = _902 == 0;
    float _1875 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1877 = _902 + (-1);
    int _1879 = abs(_836);
    float _1881 = 1.0 / _1861;
    int _1883 = abs(_852);
    float _1885 = float(uint(_1865));
    float _1887 = trunc(_1871);
    int _1889 = int(_1887);
    int _1891 = as_type<int>(_1881) + (-2);
    float _1893 = exp2(_1875);
    float _1895 = as_type<float>(_1891) * _1885;
    float _1897 = trunc(_1895);
    float _1899 = precise::max(_1897, 0.0);
    uint _1902 = uint(_1899);
    float _1904 = -_1893;
    float _1906 = _1904 + 1.0;
    float _1908 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1910 = _1869 * int(_1902);
    int _1912 = _1910 + _1865;
    float _1914 = float(uint(_1912));
    float _1916 = as_type<float>(_1891) * _1914;
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1920 = _1918 != 0;
    int _1922 = ~_902;
    int _1924 = _1922 + 1;
    float _1926 = trunc(_1916);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    bool _1932 = !_1920;
    float _1934 = _1932 ? 7.345489978790283203125 : 1.0;
    float _1936 = _1934 * _746;
    float _1938 = floor(_1936);
    int _1940 = int(_1902) + int(_1930);
    float _1942 = float(_1865);
    int _1944 = _1924 * _1940;
    int _1946 = _1944 + _1865;
    bool _1948 = _1942 >= _958;
    bool _1950 = isnan(_1942);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(_958);
    bool _1956 = _1952 || _1954;
    float _1958 = float(_1956);
    float _1960 = -_1938;
    float _1962 = _1936 + _1960;
    bool _1964 = uint(_1946) >= uint(_902);
    float _1966 = trunc(_1958);
    int _1968 = int(_1966);
    float _1970 = _1962 * _958;
    bool _1972 = !_1964;
    int _1974 = _1972 ? 0 : (-1);
    int _1976 = ~_1940;
    int _1978 = _1976 + _1974;
    int _1980 = _1978 + 1;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1984 = _1982 != 0;
    float _1986 = trunc(_1970);
    int _1988 = int(_1986);
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1992 = _1990 != 0;
    int _1994 = _902 * _1980;
    int _1996 = _1994 + _1865;
    bool _1998 = !_1984;
    int _2000 = _1998 ? 0 : 1;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2004 = _2002 != 0;
    int _2006 = ~_1968;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    bool _2012 = !_1873;
    int _2014 = _2012 ? _1996 : (-1);
    int _2016 = abs(_2000);
    bool _2018 = !_2004;
    int _2020 = _2018 ? 0 : 1;
    int _2022 = _2014 * _2010;
    int _2024 = abs(_2020);
    int _2026 = _1968 * _1877;
    int _2028 = _2026 + _2022;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2030;
    int _2034 = abs(_876);
    int _2036 = _2028 * _1879;
    int _2038 = _1988 * _2016;
    int _2040 = _2038 + _1865;
    float _2042 = in.m_67.y;
    int _2044 = _1889 * _1883;
    int _2046 = _2044 + _2036;
    int _2048 = ~_902;
    int _2050 = _2048 + 1;
    int _2052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2054 = _2052 != 0;
    int _2056 = _2040 * _2034;
    int _2058 = _2056 + _2046;
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2062 = _2060 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2064 = as_type<float>(_2046);
    if (_1992)
    {
        float _2066 = in.m_57.x;
        _2064 = _2066;
    }
    float _2068 = _2064;
    bool _2070 = _748 > 0.5;
    int _2072 = _1988 * _2024;
    int _2074 = _2072 + _2058;
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2078 = _2076 != 0;
    float _2080 = in.m_67.x;
    float _2082 = 1.0 / _2062;
    bool _2084 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2086 = isnan(_738);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2092 = _2088 || _2090;
    float _2094 = float(_2092);
    float _2096 = float(uint(_2074));
    float _2098 = as_type<float>(_1891) * _2096;
    float _2100 = trunc(_2098);
    float _2102 = precise::max(_2100, 0.0);
    uint _2104 = uint(_2102);
    float _2106 = _2032 * _2082;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2110 = _738 + _2108;
    float _2112 = fma(_2106, _2110, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2114 = float(uint(_2040));
    int _2116 = ~_902;
    int _2118 = _2116 + 1;
    int _2120 = _2050 * int(_2104);
    int _2122 = _2120 + _2074;
    float _2124 = float(uint(_2122));
    float _2126 = as_type<float>(_1891) * _2124;
    float _2128 = -_2042;
    float _2130 = _2128 + 1.0;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2132 = trunc(_2126);
    float _2134 = precise::max(_2132, 0.0);
    uint _2136 = uint(_2134);
    float _2138 = _2042;
    if (_2054)
    {
        float _2140 = _2070 ? _2130 : _2042;
        _2138 = _2140;
    }
    float _2142 = _2138;
    float _2144 = in.m_71.x;
    float _2146 = in.m_71.y;
    float _2148 = in.m_71.z;
    bool _2150 = _2068 > 0.5;
    bool _2152 = _2150 && _1992;
    float _2154 = -_2094;
    float _2156 = _2154 + 1.0;
    bool _2158 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2160 = isnan(_738);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = as_type<float>(_1891) * _2114;
    bool _2172 = _1070 != 0.0;
    bool _2174 = isnan(_1070);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(0.0);
    bool _2180 = _2176 || _2178;
    float _2182 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _2184 = ~_902;
    int _2186 = _2184 + 1;
    float _2188 = _2168 * _2156;
    bool _2190 = _1068 == 0.0;
    bool _2192 = !_2180;
    bool _2194 = _2190 && _2192;
    float _2196 = trunc(_2170);
    float _2198 = precise::max(_2196, 0.0);
    uint _2200 = uint(_2198);
    float _2202 = -_800;
    float _2204 = fma(_794, _2182, _2202);
    float _2206 = _2112 * _2188;
    bool _2208 = _1072 == 0.0;
    bool _2210 = _2208 && _2194;
    float _2212 = -_2168;
    float _2214 = _2212 + 1.0;
    int _2216 = int(_2104) + int(_2136);
    float _2218 = as_type<float>(_2136);
    float _2220 = _2080;
    if (_1992)
    {
        _2218 = _2080;
    }
    float _2222 = _2218;
    float _2224 = abs(_1386);
    float _2226 = log2(_2224);
    float _2228 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2206);
    int _2230 = _2118 * _2216;
    int _2232 = _2230 + _2074;
    float _2234 = _2222;
    if (_2152)
    {
        float _2236 = -_2222;
        float _2238 = _2236 + 1.0;
        _2234 = _2238;
    }
    float _2240 = _2234;
    float _2242 = _2148;
    float _2244 = _2146;
    float _2246 = _2144;
    if (!_2210)
    {
        float _2248 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2148);
        _2242 = _2248;
    }
    float _2250 = _2242;
    if (_1992)
    {
        _2220 = _2240;
    }
    float _2252 = _2220;
    int _2254 = _2186 * int(_2200);
    int _2256 = _2254 + _2040;
    bool _2258 = uint(_2232) >= uint(_902);
    if (!_2210)
    {
        float _2260 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2244 = _2260;
    }
    float _2262 = _2244;
    float _2264 = _2204 + 0.5;
    float _2266 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2268 = !_2258;
    int _2270 = _2268 ? 0 : (-1);
    float _2272 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2274 = float(uint(_2256));
    float _2276 = fma(_956, _2266, _798);
    int _2278 = ~_2216;
    int _2280 = _2278 + _2270;
    int _2282 = _2280 + 1;
    float _2284 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2228);
    float _2286 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2288 = as_type<float>(_1891) * _2274;
    if (!_2210)
    {
        float _2290 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2144);
        _2246 = _2290;
    }
    float _2292 = _2246;
    int _2294 = _902 * _2282;
    int _2296 = _2294 + _2074;
    float _2298 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2300 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2302 = trunc(_2288);
    float _2304 = precise::max(_2302, 0.0);
    uint _2306 = uint(_2304);
    float _2308 = _2276 + 0.5;
    bool _2310 = !_1873;
    int _2312 = _2310 ? _2296 : (-1);
    float _2314 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2316 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2318 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2320 = _2312 >> 31;
    float _2322 = _2284 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _2308;
    out.m_73.y = _2264;
    int _2324 = ~_902;
    int _2326 = _2324 + 1;
    float _2328 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2330 = _2320 & 3;
    out.m_75.x = _2314;
    out.m_75.y = _2316;
    out.m_75.z = _2318;
    out.m_75.w = _2322;
    float _2332 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2334 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2336 = _2312 + _2330;
    float _2338 = exp2(_2272);
    int _2340 = int(_2200) + int(_2306);
    int _2342 = _2336 >> 2;
    float _2344 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2346 = -_1130;
    float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2328);
    int _2350 = _2312 & 3;
    bool _2352 = _2350 != 0;
    float _2354 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2344);
    float _2356 = -_1130;
    float _2358 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2332);
    int _2360 = _2342 << 4;
    int _2362 = _2360 + 368;
    float _2364 = -_1130;
    float _2366 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2334);
    float _2368 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2348);
    float _2370 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2358);
    uint _2372 = uint(int(uint(_2362) >> uint(2)));
    uint _2374 = uint(int(uint(int(_2372)) >> uint(2)));
    int _2376 = int(_2372) & 3;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[int(_2374)][_2376];
    int _2380 = int(_2372) + 1;
    uint _2382 = uint(int(uint(_2380) >> uint(2)));
    int _2384 = _2380 & 3;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[int(_2382)][_2384];
    float _2388 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2366);
    float _2390 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2392 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2394 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2396 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2390);
    float _2398 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2392);
    float _2400 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2394);
    int _2402 = _2312 & 3;
    bool _2404 = _2402 != 0;
    float _2406 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2408 = _2362 + 8;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    float _2426 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2428 = uint(_2402) > 1u;
    float _2430 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2406);
    float _2436 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2426);
    int _2438 = _2352 ? 0 : 1;
    float _2440 = _2370 * _2262;
    float _2442 = _2388 * _2262;
    float _2444 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2396);
    float _2446 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2398);
    float _2448 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2400);
    int _2450 = ~_2438;
    int _2452 = _2450 + 1;
    int _2454 = _2452 + 1;
    float _2456 = _2368 * _2262;
    float _2458 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2434);
    int _2460 = _2454;
    if (!_2428)
    {
        int _2462 = ~_2438;
        int _2464 = _2462 + 1;
        _2460 = _2464;
    }
    int _2466 = _2460;
    float _2468 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2354);
    bool _2470 = _2402 != 3;
    float _2472 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2436);
    bool _2474 = uint(_2402) >= 2u;
    float _2476 = fma(_2432, -2.0, 3.0);
    float _2478 = _2432 * _2432;
    int _2480 = abs(_2466);
    float _2482 = fma(_2444, _2292, _2440);
    int _2484 = _2474 ? 0 : 1;
    float _2486 = fma(_2446, _2292, _2456);
    bool _2488 = !_2404;
    int _2490 = _2488 ? 0 : 1;
    int _2492 = _2326 * _2340;
    int _2494 = _2492 + _2040;
    int _2496 = ~_2480;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = fma(_2448, _2292, _2442);
    bool _2504 = _2402 != 3;
    float _2506 = _2478 * _2476;
    int _2508 = ~_2484;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = -_1832;
    float _2516 = _2514 + 1.0;
    int _2518 = abs(_2490);
    float _2520 = _1908 * _1838;
    int _2522 = _2512;
    float _2524 = _2520;
    if (_2470)
    {
        int _2526 = ~_2484;
        int _2528 = _2526 + 1;
        _2522 = _2528;
    }
    int _2530 = _2522;
    int _2532 = _2500 * as_type<int>(_2386);
    bool _2534 = !_2504;
    int _2536 = _2534 ? 0 : (-1);
    float _2538 = -_1908;
    float _2540 = _2538 + 1.0;
    bool _2542 = uint(_2494) >= uint(_902);
    float _2544 = fma(_2468, _2250, _2486);
    bool _2546 = !_2078;
    int _2548 = _2546 ? 0 : 1;
    int _2550 = abs(_2530);
    int _2552 = ~_2518;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    int _2558 = abs(_2536);
    bool _2560 = !_2542;
    int _2562 = _2560 ? 0 : (-1);
    int _2564 = _2556 * as_type<int>(_2378);
    int _2566 = _2564 + _2532;
    int _2568 = abs(_2548);
    int _2570 = ~_2550;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = ~_2340;
    int _2578 = _2576 + _2562;
    int _2580 = _2578 + 1;
    int _2582 = _2574 * as_type<int>(_2416);
    int _2584 = _2582 + _2566;
    int _2586 = ~_2558;
    int _2588 = _2586 + 1;
    int _2590 = _2588 + 1;
    int _2592 = _902 * _2580;
    int _2594 = _2592 + _2040;
    int _2596 = ~_2568;
    int _2598 = _2596 + 1;
    int _2600 = _2598 + 1;
    float _2602 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2604 = _1386 <= 8000.0;
    bool _2606 = isnan(_1386);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan(8000.0);
    bool _2612 = _2608 || _2610;
    float _2614 = float(_2612);
    int _2616 = _2590 * as_type<int>(_2424);
    int _2618 = _2616 + _2584;
    bool _2620 = !_1873;
    int _2622 = _2620 ? _2594 : (-1);
    float _2624 = -_2506;
    float _2626 = _2624 + 1.0;
    float _2628 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2602);
    int _2630 = _2618 * _2600;
    float _2632 = fma(_2626, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2506);
    float _2634 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2628);
    int _2636 = _2622 * _2568;
    int _2638 = _2636 + _2630;
    float _2640 = fma(_2458, _2250, _2482);
    float _2642 = _2614 * _2632;
    float _2644 = in.m_77.x;
    float _2646 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2634);
    float _2648 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2650 = _2646 + _1758;
    float _2652 = _1849 * _2520;
    float _2654 = _2516 * _2648;
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = _1859 * _2520;
    float _2660 = _2650 * 0.5;
    float _2662 = fma(_2472, _2250, _2502);
    float _2664 = -_2656;
    float _2666 = fma(_2664, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2668 = fma(_1855, _2652, _1843);
    float _2670 = fma(_1857, _2652, _1845);
    out.m_79.z = _2660;
    out.m_79.w = _1758;
    float _2672 = _1849 * _2540;
    float _2674 = fma(_1849, _2658, _1847);
    bool _2676 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2678 = isnan(_1542);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2684 = _2680 || _2682;
    out.gl_Position.x = _1806;
    out.gl_Position.y = _1804;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _1758;
    float _2686 = float(_2638);
    out.m_81.x = _2668;
    out.m_81.y = _2670;
    out.m_81.z = _2674;
    out.m_81.w = _2672;
    float _2688 = _2666 * _2644;
    float _2690 = _1520 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_83.x = _2640;
    out.m_83.y = _2544;
    out.m_83.z = _2662;
    float _2692 = _2688 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2686;
    float _2694 = _2658;
    float _2696 = _2648;
    float _2698 = _2652;
    float _2700 = _2686;
    float _2702 = _2688;
    if (!_2684)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2704 = _2694;
    float _2706 = _2704;
    float _2708 = _2704;
    if (!_2684)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2710 = _2696;
    out.m_87.x = _2692;
    float _2712 = _2710;
    float _2714 = _2710;
    if (!_2684)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2716 = _2698;
    float _2718 = _2716;
    float _2720 = _2716;
    if (!_2684)
    {
        _2524 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2722 = _2524;
    float _2724 = _2722;
    float _2726 = _2722;
    if (!_2684)
    {
        _2700 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2728 = _2700;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2684)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2734 = _2702;
    bool _2736 = !_2684;
    float _2738 = _2734;
    float _2740 = _2734;
    if (!_2736)
    {
        bool _2742 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2744 = isnan(_1542);
        bool _2746 = _2742 || _2744;
        bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2750 = _2746 || _2748;
        if (!_2750)
        {
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2754 = _1542 + _2752;
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2758 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2756;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2764 = 1.0 / _2758;
            float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2782 = _2754 * _2764;
            float _2784 = precise::clamp(_2782, 0.0, 1.0);
            float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2790 = fma(_2784, _2762, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2792 = fma(_2784, _2788, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2794 = fma(_2784, _2768, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2796 = fma(_2784, _2772, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2798 = fma(_2784, _2776, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2800 = fma(_2784, _2780, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2708 = _2794;
            _2726 = _2798;
            _2732 = _2790;
            _2720 = _2796;
            _2714 = _2792;
            _2740 = _2800;
            _2802 = true;
        }
        else
        {
            bool _2804 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2806 = isnan(_1542);
            bool _2808 = _2804 || _2806;
            bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2812 = _2808 || _2810;
            if (!_2812)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2814 = _2730;
            _2732 = _2814;
            if (!_2812)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2816 = _2706;
            _2708 = _2816;
            if (!_2812)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2818 = _2712;
            _2714 = _2818;
            if (!_2812)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2820 = _2718;
            _2720 = _2820;
            if (!_2812)
            {
                _2724 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2822 = _2724;
            _2726 = _2822;
            if (!_2812)
            {
                _2738 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2824 = _2738;
            bool _2826 = !_2812;
            _2740 = _2824;
            if (!_2826)
            {
                bool _2828 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2830 = isnan(_1542);
                bool _2832 = _2828 || _2830;
                bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2836 = _2832 || _2834;
                if (!_2836)
                {
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2840 = _1542 + _2838;
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2844 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2842;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2850 = 1.0 / _2844;
                    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2868 = _2840 * _2850;
                    float _2870 = precise::clamp(_2868, 0.0, 1.0);
                    float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2876 = fma(_2870, _2848, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2878 = fma(_2870, _2874, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2880 = fma(_2870, _2854, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2882 = fma(_2870, _2858, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2884 = fma(_2870, _2862, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2886 = fma(_2870, _2866, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2708 = _2880;
                    _2726 = _2884;
                    _2732 = _2876;
                    _2720 = _2882;
                    _2714 = _2878;
                    _2740 = _2886;
                    _2802 = true;
                }
                else
                {
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2802 = false;
    float _2888 = _2708;
    float _2890 = _2726;
    float _2892 = _2732;
    float _2894 = _2720;
    float _2896 = _2714;
    float _2898 = _2740;
    float _2900 = _2690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2902 = fma(_2544, -0.5, 0.5);
    float _2904 = precise::clamp(_2902, 0.0, 1.0);
    float _2906 = -_2888;
    float _2908 = _2906 + _2890;
    float _2910 = -_2892;
    float _2912 = _2910 + _2894;
    out.m_53.x = _2900;
    float _2914 = -_2896;
    float _2916 = _2914 + _2898;
    float _2918 = fma(_2904, _2908, _2888);
    float _2920 = fma(_2904, _2912, _2892);
    bool _2922 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2924 = _2918 * 0.586610972881317138671875;
    float _2926 = fma(_2904, _2916, _2896);
    out.m_89.x = 0.0;
    bool _2928 = _1520 > 0.0;
    bool _2930 = isnan(_1520);
    bool _2932 = _2928 || _2930;
    bool _2934 = isnan(0.0);
    bool _2936 = _2932 || _2934;
    float _2938 = fma(_2920, 0.298911988735198974609375, _2924);
    float _2940 = fma(_2926, 0.114477999508380889892578125, _2938);
    float _2942 = -_2940;
    float _2944 = _2920 + _2942;
    float _2946 = -_2940;
    float _2948 = _2918 + _2946;
    float _2950 = -_2940;
    float _2952 = _2926 + _2950;
    float _2954 = fma(_2944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2940);
    float _2956 = fma(_2948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2940);
    float _2958 = fma(_2952, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2940);
    bool _2960 = !_2922;
    if (!_2960)
    {
        float _2962 = -_1450;
        float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2966 = -_1452;
        float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2970 = -_1454;
        float _2972 = _2970 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2974 = _2964 * _2964;
        float _2976 = fma(_2968, _2968, _2974);
        float _2978 = fma(_2972, _2972, _2976);
        float _2980 = sqrt(_2978);
        float _2982 = rsqrt(_2978);
        float _2984 = -_2980;
        float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2988 = _2986 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2990 = precise::clamp(_2988, 0.0, 1.0);
        float _2992 = _2968 * _2982;
        float _2994 = _2964 * _2982;
        float _2996 = abs(_2990);
        float _2998 = log2(_2996);
        float _3000 = _2972 * _2982;
        float _3002 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3004 = _2544 * _2994;
        float _3006 = -_2994;
        float _3008 = -_3002;
        float _3010 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3008);
        float _3012 = fma(_2640, _2992, _3004);
        float _3014 = -_3000;
        float _3016 = fma(_3014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3010);
        float _3018 = fma(_2662, _3000, _3012);
        float _3020 = precise::clamp(_3018, 0.0, 1.0);
        float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3024 = _3016 + _3022;
        float _3026 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3028 = _3024 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3030 = precise::clamp(_3028, 0.0, 1.0);
        float _3032 = exp2(_3026);
        float _3034 = _3032 * _3030;
        float _3036 = _3020 * _3034;
        float _3038 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3040 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3042 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3038;
        out.m_89.y = _3040;
        out.m_89.z = _3042;
    }
    out.m_91.x = _2954;
    out.m_91.y = _2956;
    out.m_91.z = _2958;
    if (_2936)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3044;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2802 = false;
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
        float _3112 = as_type<float>(_134);
        out.gl_Position.z = _3112;
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
        float _3167 = as_type<float>(_160);
        out.gl_Position.z = _3167;
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
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _760 = 1.0 + _758;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _764 = 1.0 / _760;
    float _766 = _740 * 2.0;
    float _768 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _770 = _746 * 2.0;
    float _772 = floor(_766);
    float _774 = _748 * 2.0;
    float _776 = -_750;
    float _778 = fma(_768, 2.0, _776);
    float _780 = _744 * _116;
    float _782 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _784 = _748 + _746;
    float _786 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _762);
    float _788 = floor(_770);
    float _790 = fma(_782, -2.0, _756);
    float _792 = _784 + (-1.0);
    float _794 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _786);
    float _796 = -_116;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[76].x, _778);
    float _800 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _790);
    float _802 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _804 = _772 >= 0.0;
    bool _806 = isnan(_772);
    bool _808 = _804 || _806;
    bool _810 = isnan(0.0);
    bool _812 = _808 || _810;
    float _814 = exp2(_780);
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _826 = _824 != 0;
    int _828 = _812 ? 0 : 1;
    bool _830 = _788 > 0.0;
    float _832 = floor(_774);
    bool _834 = !_822;
    int _836 = _834 ? 0 : 1;
    bool _838 = _772 > 0.0;
    bool _840 = _788 >= 0.0;
    bool _842 = isnan(_788);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    bool _850 = !_818;
    int _852 = _850 ? 0 : 1;
    float _854 = -_814;
    float _856 = _854 + 1.0;
    bool _858 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    int _868 = ~_828;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    bool _874 = !_826;
    int _876 = _874 ? 0 : 1;
    float _878 = _866 ? _856 : 0.0;
    bool _880 = _832 > 0.0;
    bool _882 = _832 >= 0.0;
    bool _884 = isnan(_832);
    bool _886 = _882 || _884;
    bool _888 = isnan(0.0);
    bool _890 = _886 || _888;
    int _892 = _872;
    if (!_838)
    {
        int _894 = ~_828;
        int _896 = _894 + 1;
        _892 = _896;
    }
    int _898 = _892;
    float _900 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _902 = int(_900);
    float _904 = float(_754);
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _908 = _906 != 0;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _916 = _914 != 0;
    float _918 = in.m_63.x;
    float _920 = in.m_63.y;
    float _922 = in.m_63.z;
    int _924 = _848 ? 0 : 1;
    float _926 = 1.0 / _904;
    bool _928 = !_908;
    int _930 = _928 ? 0 : 1;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _934 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _936 = isnan(1.0);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _942 = _938 || _940;
    float _944 = float(_898);
    float _946 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _932);
    int _948 = ~_924;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = abs(_930);
    float _956 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _946);
    float _958 = float(_902);
    float _960 = float(_954);
    bool _962 = !_912;
    int _964 = _962 ? 0 : 1;
    float _966 = _958 * _116;
    float _968 = _926 * _116;
    float _970 = _960 * _944;
    int _972 = _952;
    if (_942)
    {
        float _974 = _878 * _764;
        _126 = _974;
    }
    float _976 = _126;
    if (!_830)
    {
        int _978 = ~_924;
        int _980 = _978 + 1;
        _972 = _980;
    }
    int _982 = _972;
    float _984 = _746 + (-0.5);
    float _986 = _970 * (-2.0);
    int _988 = abs(_964);
    bool _990 = !_916;
    int _992 = _990 ? 0 : 1;
    float _994 = fma(_986, _918, _918);
    int _996 = _890 ? 0 : 1;
    float _998 = fma(_802, _986, _802);
    float _1000 = float(_982);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].x, _994);
    float _1004 = float(_988);
    int _1006 = abs(_992);
    float _1008 = fma(_998, _976, _1002);
    int _1010 = ~_996;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = _1004 * _1000;
    int _1018 = _1014;
    if (!_880)
    {
        int _1020 = ~_996;
        int _1022 = _1020 + 1;
        _1018 = _1022;
    }
    int _1024 = _1018;
    float _1026 = _748 + _740;
    float _1028 = _1016 * (-2.0);
    float _1030 = _1026 + (-1.0);
    float _1032 = float(_1024);
    float _1034 = fma(_1028, _920, _920);
    float _1036 = float(_1006);
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1040 = _740 + _746;
    float _1042 = _740 + (-0.5);
    float _1044 = _1008 * 0.15915493667125701904296875;
    float _1046 = _1036 * _1032;
    float _1048 = _748 + (-0.5);
    float _1050 = fma(_1038, _1028, _1038);
    float _1052 = _1040 + (-1.0);
    float _1054 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1034);
    float _1056 = _1046 * (-2.0);
    float _1058 = _1044 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1064 = fma(_1050, _976, _1054);
    float _1066 = fma(_1056, _922, _922);
    float _1068 = in.m_65.x;
    float _1070 = in.m_65.y;
    float _1072 = in.m_65.z;
    float _1074 = fma(_1062, _1056, _1062);
    float _1076 = _1064 * 0.15915493667125701904296875;
    float _1078 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1066);
    float _1080 = _1044 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1086 = fma(_1074, _976, _1078);
    float _1088 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1090 = _1086 * 0.15915493667125701904296875;
    float _1092 = _1076 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = in.m_46.x;
    float _1100 = in.m_46.y;
    float _1102 = in.m_46.z;
    float _1104 = _1076 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1068);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1072);
    float _1112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1070);
    float _1114 = _1090 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1096 * _1108;
    float _1120 = _1088 * _1110;
    float _1122 = _1060 * _1094;
    float _1124 = _1084 * _1112;
    float _1126 = _1082 * _1094;
    float _1128 = _1090 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _1060 * _1106;
    float _1134 = _1082 * _1106;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1138 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1136);
    float _1140 = _1060 * _1116;
    float _1142 = _1082 * _1116;
    float _1144 = _1106 * _1116;
    float _1146 = _1094 * _1116;
    float _1148 = _1140 * _1124;
    float _1150 = _1142 * _1124;
    float _1152 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1138);
    float _1154 = fma(_1130, _1132, _1126);
    float _1156 = -_1122;
    float _1158 = fma(_1130, _1134, _1156);
    float _1160 = -_1134;
    float _1162 = fma(_1130, _1122, _1160);
    float _1164 = -_1124;
    float _1166 = _1130 * _1164;
    float _1168 = fma(_1154, _1118, _1148);
    float _1170 = fma(_1130, _1126, _1132);
    float _1172 = fma(_1158, _1118, _1150);
    float _1174 = fma(_1144, _1118, _1166);
    float _1176 = fma(_1162, _1120, _1168);
    float _1178 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1180 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1182 = fma(_1146, _1120, _1174);
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1186 = fma(_1170, _1120, _1172);
    float _1188 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1178);
    float _1190 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1184);
    float _1194 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1180);
    float _1196 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1188);
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1190);
    float _1200 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    float _1202 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1194);
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1206 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1198);
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1216 = _1204 + _1208;
    float _1218 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1220 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1212);
    float _1222 = _1210 + _1214;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1226 = _1216 + _1224;
    float _1228 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1230 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1220);
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1234 = _1222 + _1232;
    float _1236 = _1226 * _1226;
    float _1238 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1228);
    float _1240 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1242 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1244 = fma(_1234, _1234, _1236);
    float _1246 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1238);
    float _1248 = _1218 + _1240;
    float _1250 = sqrt(_1244);
    float _1252 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1254 = _1250 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = _1102;
    float _1258 = _1238;
    float _1260 = _1248;
    float _1262 = _1252;
    float _1264 = _1212;
    float _1266 = _1152;
    float _1268 = _1210;
    if (!_1254)
    {
        _1256 = _1222;
    }
    float _1270 = _1256;
    float _1272 = _1270;
    if (!_1254)
    {
        _1258 = _1216;
    }
    float _1274 = _1258;
    bool _1276 = !_1254;
    float _1278 = _1274;
    if (!_1276)
    {
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1284 = _1250 + _1282;
        float _1286 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = rsqrt(_1244);
        float _1290 = _1284 * _1280;
        float _1292 = _1290 * 0.15915493667125701904296875;
        float _1294 = _1292 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = _1292 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        float _1302 = _1296 + (-1.0);
        float _1304 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = fma(_1300, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1308 = fma(_1248, _1296, _1304);
        float _1310 = _1288 * _1306;
        float _1312 = fma(_1234, _1310, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1314 = fma(_1226, _1310, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1260 = _1308;
        _1272 = _1312;
        _1278 = _1314;
    }
    float _1316 = _1260;
    float _1318 = _1272;
    float _1320 = _1278;
    float _1322 = -_1218;
    float _1324 = _1322 + _1316;
    float _1326 = -_1210;
    float _1328 = _1326 + _1318;
    float _1330 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1242);
    float _1332 = 1.0 / _1252;
    float _1334 = _1324 * _1324;
    float _1336 = -_1204;
    float _1338 = _1336 + _1320;
    float _1340 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1330);
    bool _1342 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1344 = isnan(0.5);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1350 = _1346 || _1348;
    float _1352 = fma(_1328, _1328, _1334);
    float _1354 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1356 = fma(_1338, _1338, _1352);
    float _1358 = _1354 + _1252;
    float _1360 = sqrt(_1356);
    float _1362 = _1358 * _1332;
    float _1364 = _1362 * 0.5;
    float _1366 = _1316;
    float _1368 = _1320;
    float _1370 = _1328;
    float _1372 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1350)
    {
        _1262 = 1.0;
    }
    float _1374 = _1262;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1376);
    float _1380 = 1.0 / _1378;
    bool _1382 = _1360 > 0.0;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1386 = _1380 * _1384;
    float _1388 = _1360;
    float _1390 = _1378;
    float _1392 = _1374;
    if (!_1382)
    {
        _1388 = _1318;
    }
    float _1394 = _1388;
    bool _1396 = !_1382;
    float _1398 = _1394;
    if (!_1396)
    {
        float _1400 = _188 * _188;
        float _1402 = rsqrt(_1356);
        float _1404 = fma(_186, _186, _1400);
        float _1406 = fma(_190, _190, _1404);
        float _1408 = sqrt(_1406);
        float _1410 = _1328 * _1402;
        float _1412 = _1324 * _1402;
        float _1414 = _1338 * _1402;
        bool _1416 = _1408 > 0.0;
        float _1418 = _1408;
        _1390 = _1406;
        _1264 = _1412;
        _1266 = _1410;
        _1372 = _1414;
        if (!_1416)
        {
            _1418 = _1318;
        }
        float _1420 = _1418;
        bool _1422 = !_1416;
        _1398 = _1420;
        if (!_1422)
        {
            float _1424 = rsqrt(_1406);
            float _1426 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1428 = _188 * _1424;
            float _1430 = _186 * _1424;
            float _1432 = _190 * _1424;
            float _1434 = _1412 * _1428;
            float _1436 = fma(_1410, _1430, _1434);
            float _1438 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1440 = fma(_1414, _1432, _1436);
            float _1442 = _1440 * _1438;
            float _1444 = fma(_186, _1442, _1318);
            float _1446 = fma(_188, _1442, _1316);
            float _1448 = fma(_190, _1442, _1320);
            _1366 = _1446;
            _1398 = _1444;
            _1368 = _1448;
            _1370 = _1434;
        }
    }
    float _1450 = _1366;
    float _1452 = _1398;
    float _1454 = _1368;
    float _1456 = _1390;
    float _1458 = _1370;
    float _1460 = _1264;
    float _1462 = _1266;
    float _1464 = _1372;
    float _1466 = _1460;
    float _1468 = _1462;
    float _1470 = _1464;
    if (!_1350)
    {
        float _1472 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1474 = _1472 * 0.15915493667125701904296875;
        float _1476 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1478 = _1474 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1476 * 0.15915493667125701904296875;
        float _1484 = _1474 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = 1.0 / _1480;
        float _1490 = _1482 * 6.283185482025146484375;
        float _1492 = cos(_1490);
        float _1494 = _1486 * _1488;
        float _1496 = _1482 * 6.283185482025146484375;
        float _1498 = sin(_1496);
        float _1500 = _1492 * _1494;
        float _1502 = 1.0 / _1500;
        float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1506 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1504;
        float _1508 = 1.0 / _1506;
        float _1510 = _1498 * _1502;
        float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1514 = fma(_1386, _1510, _1512);
        float _1516 = _1514 * _1508;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        _1392 = _1518;
    }
    float _1520 = _1392;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1450 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1452 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1454 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = sqrt(_1538);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1528 * _1544;
    float _1548 = _1532 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1456;
    float _1566 = _1554;
    float _1568 = _1562;
    float _1570 = _1548;
    float _1572 = _1550;
    float _1574 = _1552;
    if (_1558)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1576;
    }
    float _1578 = _1564;
    if (_1558)
    {
        float _1580 = rsqrt(_1554);
        _1566 = _1580;
    }
    float _1582 = _1566;
    if (_1558)
    {
        float _1584 = _1562 * _1578;
        _1568 = _1584;
    }
    float _1586 = _1568;
    if (_1558)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _1466 = _1588;
    }
    float _1590 = _1466;
    float _1592 = _1458;
    if (_1558)
    {
        float _1594 = _1590 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1578;
    if (_1558)
    {
        float _1606 = _1590 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = -_1544;
    float _1614 = -_1602;
    float _1616 = fma(_1524, _1612, _1614);
    if (_1558)
    {
        float _1618 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1468 = _1618;
    }
    float _1620 = _1468;
    float _1622 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1624 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1626 = _1620;
    if (!_1558)
    {
        _1268 = _1546;
    }
    float _1628 = _1268;
    float _1630 = _1598;
    float _1632 = _1628;
    if (_1558)
    {
        float _1634 = fma(_1598, _1620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = _1636;
    if (!_1558)
    {
        _1630 = _1616;
    }
    float _1640 = _1630;
    float _1642 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1622);
    float _1644 = floor(_1624);
    float _1646 = _1640;
    if (_1558)
    {
        float _1648 = _1610 + (-1.0);
        _1470 = _1648;
    }
    float _1650 = _1470;
    float _1652 = _1650;
    if (_1558)
    {
        float _1654 = _1582 * _1636;
        _1638 = _1654;
    }
    float _1656 = _1638;
    float _1658 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1642);
    if (_1558)
    {
        float _1660 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1652 = _1660;
    }
    float _1662 = _1652;
    if (_1558)
    {
        float _1664 = _1546 * _1656;
        _1632 = _1664;
    }
    float _1666 = _1632;
    if (_1558)
    {
        float _1668 = _1548 * _1656;
        _1570 = _1668;
    }
    float _1670 = _1570;
    if (_1558)
    {
        float _1672 = fma(_1616, _1610, _1662);
        _1646 = _1672;
    }
    float _1674 = _1646;
    if (_1558)
    {
        float _1676 = _1666 * _1666;
        _1572 = _1676;
    }
    float _1678 = _1572;
    float _1680 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1558)
    {
        float _1682 = _1670 * _1670;
        _1574 = _1682;
    }
    float _1684 = _1574;
    float _1686 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1688 = fma(_1674, _1674, _1678);
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1692 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1696 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1694);
    float _1698 = precise::clamp(_1696, 0.0, 1.0);
    float _1700 = _1688 + _1684;
    float _1702 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1704 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1692);
    float _1706 = -_1698;
    float _1708 = _1706 + 1.0;
    float _1710 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1712 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1702);
    float _1714 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1716 = rsqrt(_1700);
    float _1718 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1720 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1712);
    float _1722 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1724 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1726 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1718);
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1732 = abs(_1708);
    float _1734 = log2(_1732);
    float _1736 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1738 = -_1724;
    float _1740 = fma(_1738, _1690, 1.0);
    float _1742 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1730);
    float _1744 = -_1644;
    float _1746 = _1624 + _1744;
    float _1748 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1750 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    float _1752 = _1716 * _1666;
    float _1754 = _1716 * _1674;
    float _1756 = floor(_1680);
    float _1758 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1750);
    float _1760 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1762 = _1716 * _1670;
    float _1764 = _1754 + 1.0;
    float _1766 = -_1760;
    float _1768 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1766);
    float _1770 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = log2(_1740);
    float _1774 = -_1762;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1768);
    float _1778 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = fma(_1776, -0.5, 0.5);
    float _1782 = fma(_1776, 0.5, 0.5);
    float _1784 = exp2(_1770);
    float _1786 = -_1756;
    float _1788 = _1680 + _1786;
    float _1790 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1748);
    float _1792 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1794 = fma(_1782, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1796 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1798 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1792);
    float _1800 = 1.0 / _1758;
    float _1802 = fma(_1782, _1794, -0.212114393711090087890625);
    float _1804 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1806 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1808 = fma(_1782, _1802, 1.570728778839111328125);
    float _1810 = sqrt(_1780);
    float _1812 = -_1754;
    float _1814 = fma(_1784, _1764, _1812);
    float _1816 = _1772 * 0.693147182464599609375;
    float _1818 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1820 = _1804 * _1800;
    float _1822 = _1806 * _1800;
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = fma(_1822, 0.5, 0.5);
    float _1828 = fma(_1814, 0.5, 0.5);
    float _1830 = _1810 * 0.636619746685028076171875;
    float2 _5818 = float2(_1746, _1788);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5818, float2(0.0), isnan(_5818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5818, float2(0.0), isnan(_5818)), level(0.0)).x;
    float _1834 = -_1808;
    float _1836 = fma(_1830, _1834, 1.0);
    float3 _5834 = float3(_1826, _1824, _1818);
    float _1838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5834, float3(0.0), isnan(_5834)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5834, float3(0.0), isnan(_5834)), level(0.0)).x;
    float3 _5845 = float3(_1826, _1824, _1818);
    float4 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5845, float3(0.0), isnan(_5845)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5845, float3(0.0), isnan(_5845)), level(0.0)).xyzw;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1841.w;
    float2 _5861 = float2(_1836, _1828);
    float3 _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5861, float2(0.0), isnan(_5861)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5861, float2(0.0), isnan(_5861)), level(0.0)).xyz;
    float _1855 = _1853.x;
    float _1857 = _1853.y;
    float _1859 = _1853.z;
    float _1861 = float(uint(_902));
    float _1863 = trunc(_968);
    int _1865 = int(_1863);
    int _1867 = ~_902;
    int _1869 = _1867 + 1;
    float _1871 = _966 * _168;
    bool _1873 = _902 == 0;
    float _1875 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1877 = _902 + (-1);
    int _1879 = abs(_836);
    float _1881 = 1.0 / _1861;
    int _1883 = abs(_852);
    float _1885 = float(uint(_1865));
    float _1887 = trunc(_1871);
    int _1889 = int(_1887);
    int _1891 = as_type<int>(_1881) + (-2);
    float _1893 = exp2(_1875);
    float _1895 = as_type<float>(_1891) * _1885;
    float _1897 = trunc(_1895);
    float _1899 = precise::max(_1897, 0.0);
    uint _1902 = uint(_1899);
    float _1904 = -_1893;
    float _1906 = _1904 + 1.0;
    float _1908 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1910 = _1869 * int(_1902);
    int _1912 = _1910 + _1865;
    float _1914 = float(uint(_1912));
    float _1916 = as_type<float>(_1891) * _1914;
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1920 = _1918 != 0;
    int _1922 = ~_902;
    int _1924 = _1922 + 1;
    float _1926 = trunc(_1916);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    bool _1932 = !_1920;
    float _1934 = _1932 ? 7.345489978790283203125 : 1.0;
    float _1936 = _1934 * _746;
    float _1938 = floor(_1936);
    int _1940 = int(_1902) + int(_1930);
    float _1942 = float(_1865);
    int _1944 = _1924 * _1940;
    int _1946 = _1944 + _1865;
    bool _1948 = _1942 >= _958;
    bool _1950 = isnan(_1942);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(_958);
    bool _1956 = _1952 || _1954;
    float _1958 = float(_1956);
    float _1960 = -_1938;
    float _1962 = _1936 + _1960;
    bool _1964 = uint(_1946) >= uint(_902);
    float _1966 = trunc(_1958);
    int _1968 = int(_1966);
    float _1970 = _1962 * _958;
    bool _1972 = !_1964;
    int _1974 = _1972 ? 0 : (-1);
    int _1976 = ~_1940;
    int _1978 = _1976 + _1974;
    int _1980 = _1978 + 1;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1984 = _1982 != 0;
    float _1986 = trunc(_1970);
    int _1988 = int(_1986);
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1992 = _1990 != 0;
    int _1994 = _902 * _1980;
    int _1996 = _1994 + _1865;
    bool _1998 = !_1984;
    int _2000 = _1998 ? 0 : 1;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2004 = _2002 != 0;
    int _2006 = ~_1968;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    bool _2012 = !_1873;
    int _2014 = _2012 ? _1996 : (-1);
    int _2016 = abs(_2000);
    bool _2018 = !_2004;
    int _2020 = _2018 ? 0 : 1;
    int _2022 = _2014 * _2010;
    int _2024 = abs(_2020);
    int _2026 = _1968 * _1877;
    int _2028 = _2026 + _2022;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2030;
    int _2034 = abs(_876);
    int _2036 = _2028 * _1879;
    int _2038 = _1988 * _2016;
    int _2040 = _2038 + _1865;
    float _2042 = in.m_67.y;
    int _2044 = _1889 * _1883;
    int _2046 = _2044 + _2036;
    int _2048 = ~_902;
    int _2050 = _2048 + 1;
    int _2052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2054 = _2052 != 0;
    int _2056 = _2040 * _2034;
    int _2058 = _2056 + _2046;
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2062 = _2060 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2064 = as_type<float>(_2046);
    if (_1992)
    {
        float _2066 = in.m_57.x;
        _2064 = _2066;
    }
    float _2068 = _2064;
    bool _2070 = _748 > 0.5;
    int _2072 = _1988 * _2024;
    int _2074 = _2072 + _2058;
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2078 = _2076 != 0;
    float _2080 = in.m_67.x;
    float _2082 = 1.0 / _2062;
    bool _2084 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2086 = isnan(_738);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2092 = _2088 || _2090;
    float _2094 = float(_2092);
    float _2096 = float(uint(_2074));
    float _2098 = as_type<float>(_1891) * _2096;
    float _2100 = trunc(_2098);
    float _2102 = precise::max(_2100, 0.0);
    uint _2104 = uint(_2102);
    float _2106 = _2032 * _2082;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2110 = _738 + _2108;
    float _2112 = fma(_2106, _2110, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2114 = float(uint(_2040));
    int _2116 = ~_902;
    int _2118 = _2116 + 1;
    int _2120 = _2050 * int(_2104);
    int _2122 = _2120 + _2074;
    float _2124 = float(uint(_2122));
    float _2126 = as_type<float>(_1891) * _2124;
    float _2128 = -_2042;
    float _2130 = _2128 + 1.0;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2132 = trunc(_2126);
    float _2134 = precise::max(_2132, 0.0);
    uint _2136 = uint(_2134);
    float _2138 = _2042;
    if (_2054)
    {
        float _2140 = _2070 ? _2130 : _2042;
        _2138 = _2140;
    }
    float _2142 = _2138;
    float _2144 = in.m_71.x;
    float _2146 = in.m_71.y;
    float _2148 = in.m_71.z;
    bool _2150 = _2068 > 0.5;
    bool _2152 = _2150 && _1992;
    float _2154 = -_2094;
    float _2156 = _2154 + 1.0;
    bool _2158 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2160 = isnan(_738);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = as_type<float>(_1891) * _2114;
    bool _2172 = _1070 != 0.0;
    bool _2174 = isnan(_1070);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(0.0);
    bool _2180 = _2176 || _2178;
    float _2182 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _2184 = ~_902;
    int _2186 = _2184 + 1;
    float _2188 = _2168 * _2156;
    bool _2190 = _1068 == 0.0;
    bool _2192 = !_2180;
    bool _2194 = _2190 && _2192;
    float _2196 = trunc(_2170);
    float _2198 = precise::max(_2196, 0.0);
    uint _2200 = uint(_2198);
    float _2202 = -_800;
    float _2204 = fma(_794, _2182, _2202);
    float _2206 = _2112 * _2188;
    bool _2208 = _1072 == 0.0;
    bool _2210 = _2208 && _2194;
    float _2212 = -_2168;
    float _2214 = _2212 + 1.0;
    int _2216 = int(_2104) + int(_2136);
    float _2218 = as_type<float>(_2136);
    float _2220 = _2080;
    if (_1992)
    {
        _2218 = _2080;
    }
    float _2222 = _2218;
    float _2224 = abs(_1386);
    float _2226 = log2(_2224);
    float _2228 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2206);
    int _2230 = _2118 * _2216;
    int _2232 = _2230 + _2074;
    float _2234 = _2222;
    if (_2152)
    {
        float _2236 = -_2222;
        float _2238 = _2236 + 1.0;
        _2234 = _2238;
    }
    float _2240 = _2234;
    float _2242 = _2148;
    float _2244 = _2146;
    float _2246 = _2144;
    if (!_2210)
    {
        float _2248 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2148);
        _2242 = _2248;
    }
    float _2250 = _2242;
    if (_1992)
    {
        _2220 = _2240;
    }
    float _2252 = _2220;
    int _2254 = _2186 * int(_2200);
    int _2256 = _2254 + _2040;
    bool _2258 = uint(_2232) >= uint(_902);
    if (!_2210)
    {
        float _2260 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2244 = _2260;
    }
    float _2262 = _2244;
    float _2264 = _2204 + 0.5;
    float _2266 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2268 = !_2258;
    int _2270 = _2268 ? 0 : (-1);
    float _2272 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2274 = float(uint(_2256));
    float _2276 = fma(_956, _2266, _798);
    int _2278 = ~_2216;
    int _2280 = _2278 + _2270;
    int _2282 = _2280 + 1;
    float _2284 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2228);
    float _2286 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2288 = as_type<float>(_1891) * _2274;
    if (!_2210)
    {
        float _2290 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2144);
        _2246 = _2290;
    }
    float _2292 = _2246;
    int _2294 = _902 * _2282;
    int _2296 = _2294 + _2074;
    float _2298 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2300 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2302 = trunc(_2288);
    float _2304 = precise::max(_2302, 0.0);
    uint _2306 = uint(_2304);
    float _2308 = _2276 + 0.5;
    bool _2310 = !_1873;
    int _2312 = _2310 ? _2296 : (-1);
    float _2314 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2316 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2318 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2320 = _2312 >> 31;
    float _2322 = _2284 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _2308;
    out.m_73.y = _2264;
    int _2324 = ~_902;
    int _2326 = _2324 + 1;
    float _2328 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2330 = _2320 & 3;
    out.m_75.x = _2314;
    out.m_75.y = _2316;
    out.m_75.z = _2318;
    out.m_75.w = _2322;
    float _2332 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2334 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2336 = _2312 + _2330;
    float _2338 = exp2(_2272);
    int _2340 = int(_2200) + int(_2306);
    int _2342 = _2336 >> 2;
    float _2344 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2346 = -_1130;
    float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2328);
    int _2350 = _2312 & 3;
    bool _2352 = _2350 != 0;
    float _2354 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2344);
    float _2356 = -_1130;
    float _2358 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2332);
    int _2360 = _2342 << 4;
    int _2362 = _2360 + 368;
    float _2364 = -_1130;
    float _2366 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2334);
    float _2368 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2348);
    float _2370 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2358);
    uint _2372 = uint(int(uint(_2362) >> uint(2)));
    uint _2374 = uint(int(uint(int(_2372)) >> uint(2)));
    int _2376 = int(_2372) & 3;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[int(_2374)][_2376];
    int _2380 = int(_2372) + 1;
    uint _2382 = uint(int(uint(_2380) >> uint(2)));
    int _2384 = _2380 & 3;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[int(_2382)][_2384];
    float _2388 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2366);
    float _2390 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2392 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2394 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2396 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2390);
    float _2398 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2392);
    float _2400 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2394);
    int _2402 = _2312 & 3;
    bool _2404 = _2402 != 0;
    float _2406 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2408 = _2362 + 8;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    float _2426 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2428 = uint(_2402) > 1u;
    float _2430 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2406);
    float _2436 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2426);
    int _2438 = _2352 ? 0 : 1;
    float _2440 = _2370 * _2262;
    float _2442 = _2388 * _2262;
    float _2444 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2396);
    float _2446 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2398);
    float _2448 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2400);
    int _2450 = ~_2438;
    int _2452 = _2450 + 1;
    int _2454 = _2452 + 1;
    float _2456 = _2368 * _2262;
    float _2458 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2434);
    int _2460 = _2454;
    if (!_2428)
    {
        int _2462 = ~_2438;
        int _2464 = _2462 + 1;
        _2460 = _2464;
    }
    int _2466 = _2460;
    float _2468 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2354);
    bool _2470 = _2402 != 3;
    float _2472 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2436);
    bool _2474 = uint(_2402) >= 2u;
    float _2476 = fma(_2432, -2.0, 3.0);
    float _2478 = _2432 * _2432;
    int _2480 = abs(_2466);
    float _2482 = fma(_2444, _2292, _2440);
    int _2484 = _2474 ? 0 : 1;
    float _2486 = fma(_2446, _2292, _2456);
    bool _2488 = !_2404;
    int _2490 = _2488 ? 0 : 1;
    int _2492 = _2326 * _2340;
    int _2494 = _2492 + _2040;
    int _2496 = ~_2480;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = fma(_2448, _2292, _2442);
    bool _2504 = _2402 != 3;
    float _2506 = _2478 * _2476;
    int _2508 = ~_2484;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = -_1832;
    float _2516 = _2514 + 1.0;
    int _2518 = abs(_2490);
    float _2520 = _1908 * _1838;
    int _2522 = _2512;
    float _2524 = _2520;
    if (_2470)
    {
        int _2526 = ~_2484;
        int _2528 = _2526 + 1;
        _2522 = _2528;
    }
    int _2530 = _2522;
    int _2532 = _2500 * as_type<int>(_2386);
    bool _2534 = !_2504;
    int _2536 = _2534 ? 0 : (-1);
    float _2538 = -_1908;
    float _2540 = _2538 + 1.0;
    bool _2542 = uint(_2494) >= uint(_902);
    float _2544 = fma(_2468, _2250, _2486);
    bool _2546 = !_2078;
    int _2548 = _2546 ? 0 : 1;
    int _2550 = abs(_2530);
    int _2552 = ~_2518;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    int _2558 = abs(_2536);
    bool _2560 = !_2542;
    int _2562 = _2560 ? 0 : (-1);
    int _2564 = _2556 * as_type<int>(_2378);
    int _2566 = _2564 + _2532;
    int _2568 = abs(_2548);
    int _2570 = ~_2550;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = ~_2340;
    int _2578 = _2576 + _2562;
    int _2580 = _2578 + 1;
    int _2582 = _2574 * as_type<int>(_2416);
    int _2584 = _2582 + _2566;
    int _2586 = ~_2558;
    int _2588 = _2586 + 1;
    int _2590 = _2588 + 1;
    int _2592 = _902 * _2580;
    int _2594 = _2592 + _2040;
    int _2596 = ~_2568;
    int _2598 = _2596 + 1;
    int _2600 = _2598 + 1;
    float _2602 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2604 = _1386 <= 8000.0;
    bool _2606 = isnan(_1386);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan(8000.0);
    bool _2612 = _2608 || _2610;
    float _2614 = float(_2612);
    int _2616 = _2590 * as_type<int>(_2424);
    int _2618 = _2616 + _2584;
    bool _2620 = !_1873;
    int _2622 = _2620 ? _2594 : (-1);
    float _2624 = -_2506;
    float _2626 = _2624 + 1.0;
    float _2628 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2602);
    int _2630 = _2618 * _2600;
    float _2632 = fma(_2626, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2506);
    float _2634 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2628);
    int _2636 = _2622 * _2568;
    int _2638 = _2636 + _2630;
    float _2640 = fma(_2458, _2250, _2482);
    float _2642 = _2614 * _2632;
    float _2644 = in.m_77.x;
    float _2646 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2634);
    float _2648 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2650 = _2646 + _1758;
    float _2652 = _1849 * _2520;
    float _2654 = _2516 * _2648;
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = _1859 * _2520;
    float _2660 = _2650 * 0.5;
    float _2662 = fma(_2472, _2250, _2502);
    float _2664 = -_2656;
    float _2666 = fma(_2664, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2668 = fma(_1855, _2652, _1843);
    float _2670 = fma(_1857, _2652, _1845);
    out.m_79.z = _2660;
    out.m_79.w = _1758;
    float _2672 = _1849 * _2540;
    float _2674 = fma(_1849, _2658, _1847);
    bool _2676 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2678 = isnan(_1542);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2684 = _2680 || _2682;
    out.gl_Position.x = _1806;
    out.gl_Position.y = _1804;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _1758;
    float _2686 = float(_2638);
    out.m_81.x = _2668;
    out.m_81.y = _2670;
    out.m_81.z = _2674;
    out.m_81.w = _2672;
    float _2688 = _2666 * _2644;
    float _2690 = _1520 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_83.x = _2640;
    out.m_83.y = _2544;
    out.m_83.z = _2662;
    float _2692 = _2688 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2686;
    float _2694 = _2658;
    float _2696 = _2648;
    float _2698 = _2652;
    float _2700 = _2686;
    float _2702 = _2688;
    if (!_2684)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2704 = _2694;
    float _2706 = _2704;
    float _2708 = _2704;
    if (!_2684)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2710 = _2696;
    out.m_87.x = _2692;
    float _2712 = _2710;
    float _2714 = _2710;
    if (!_2684)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2716 = _2698;
    float _2718 = _2716;
    float _2720 = _2716;
    if (!_2684)
    {
        _2524 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2722 = _2524;
    float _2724 = _2722;
    float _2726 = _2722;
    if (!_2684)
    {
        _2700 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2728 = _2700;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2684)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2734 = _2702;
    bool _2736 = !_2684;
    float _2738 = _2734;
    float _2740 = _2734;
    if (!_2736)
    {
        bool _2742 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2744 = isnan(_1542);
        bool _2746 = _2742 || _2744;
        bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2750 = _2746 || _2748;
        if (!_2750)
        {
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2754 = _1542 + _2752;
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2758 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2756;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2764 = 1.0 / _2758;
            float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2782 = _2754 * _2764;
            float _2784 = precise::clamp(_2782, 0.0, 1.0);
            float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2790 = fma(_2784, _2762, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2792 = fma(_2784, _2788, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2794 = fma(_2784, _2768, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2796 = fma(_2784, _2772, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2798 = fma(_2784, _2776, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2800 = fma(_2784, _2780, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2708 = _2794;
            _2726 = _2798;
            _2732 = _2790;
            _2720 = _2796;
            _2714 = _2792;
            _2740 = _2800;
            _2802 = true;
        }
        else
        {
            bool _2804 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2806 = isnan(_1542);
            bool _2808 = _2804 || _2806;
            bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2812 = _2808 || _2810;
            if (!_2812)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2814 = _2730;
            _2732 = _2814;
            if (!_2812)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2816 = _2706;
            _2708 = _2816;
            if (!_2812)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2818 = _2712;
            _2714 = _2818;
            if (!_2812)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2820 = _2718;
            _2720 = _2820;
            if (!_2812)
            {
                _2724 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2822 = _2724;
            _2726 = _2822;
            if (!_2812)
            {
                _2738 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2824 = _2738;
            bool _2826 = !_2812;
            _2740 = _2824;
            if (!_2826)
            {
                bool _2828 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2830 = isnan(_1542);
                bool _2832 = _2828 || _2830;
                bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2836 = _2832 || _2834;
                if (!_2836)
                {
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2840 = _1542 + _2838;
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2844 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2842;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2850 = 1.0 / _2844;
                    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2868 = _2840 * _2850;
                    float _2870 = precise::clamp(_2868, 0.0, 1.0);
                    float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2876 = fma(_2870, _2848, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2878 = fma(_2870, _2874, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2880 = fma(_2870, _2854, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2882 = fma(_2870, _2858, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2884 = fma(_2870, _2862, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2886 = fma(_2870, _2866, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2708 = _2880;
                    _2726 = _2884;
                    _2732 = _2876;
                    _2720 = _2882;
                    _2714 = _2878;
                    _2740 = _2886;
                    _2802 = true;
                }
                else
                {
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2802 = false;
    float _2888 = _2708;
    float _2890 = _2726;
    float _2892 = _2732;
    float _2894 = _2720;
    float _2896 = _2714;
    float _2898 = _2740;
    float _2900 = _2690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2902 = fma(_2544, -0.5, 0.5);
    float _2904 = precise::clamp(_2902, 0.0, 1.0);
    float _2906 = -_2888;
    float _2908 = _2906 + _2890;
    float _2910 = -_2892;
    float _2912 = _2910 + _2894;
    out.m_53.x = _2900;
    float _2914 = -_2896;
    float _2916 = _2914 + _2898;
    float _2918 = fma(_2904, _2908, _2888);
    float _2920 = fma(_2904, _2912, _2892);
    bool _2922 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2924 = _2918 * 0.586610972881317138671875;
    float _2926 = fma(_2904, _2916, _2896);
    out.m_89.x = 0.0;
    bool _2928 = _1520 > 0.0;
    bool _2930 = isnan(_1520);
    bool _2932 = _2928 || _2930;
    bool _2934 = isnan(0.0);
    bool _2936 = _2932 || _2934;
    float _2938 = fma(_2920, 0.298911988735198974609375, _2924);
    float _2940 = fma(_2926, 0.114477999508380889892578125, _2938);
    float _2942 = -_2940;
    float _2944 = _2920 + _2942;
    float _2946 = -_2940;
    float _2948 = _2918 + _2946;
    float _2950 = -_2940;
    float _2952 = _2926 + _2950;
    float _2954 = fma(_2944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2940);
    float _2956 = fma(_2948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2940);
    float _2958 = fma(_2952, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2940);
    bool _2960 = !_2922;
    if (!_2960)
    {
        float _2962 = -_1450;
        float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2966 = -_1452;
        float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2970 = -_1454;
        float _2972 = _2970 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2974 = _2964 * _2964;
        float _2976 = fma(_2968, _2968, _2974);
        float _2978 = fma(_2972, _2972, _2976);
        float _2980 = sqrt(_2978);
        float _2982 = rsqrt(_2978);
        float _2984 = -_2980;
        float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2988 = _2986 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2990 = precise::clamp(_2988, 0.0, 1.0);
        float _2992 = _2968 * _2982;
        float _2994 = _2964 * _2982;
        float _2996 = abs(_2990);
        float _2998 = log2(_2996);
        float _3000 = _2972 * _2982;
        float _3002 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3004 = _2544 * _2994;
        float _3006 = -_2994;
        float _3008 = -_3002;
        float _3010 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3008);
        float _3012 = fma(_2640, _2992, _3004);
        float _3014 = -_3000;
        float _3016 = fma(_3014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3010);
        float _3018 = fma(_2662, _3000, _3012);
        float _3020 = precise::clamp(_3018, 0.0, 1.0);
        float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3024 = _3016 + _3022;
        float _3026 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3028 = _3024 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3030 = precise::clamp(_3028, 0.0, 1.0);
        float _3032 = exp2(_3026);
        float _3034 = _3032 * _3030;
        float _3036 = _3020 * _3034;
        float _3038 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3040 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3042 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3038;
        out.m_89.y = _3040;
        out.m_89.z = _3042;
    }
    out.m_91.x = _2954;
    out.m_91.y = _2956;
    out.m_91.z = _2958;
    if (_2936)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3044;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2802 = false;
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
        float _3112 = as_type<float>(_134);
        out.gl_Position.z = _3112;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3167 = as_type<float>(_160);
        out.gl_Position.z = _3167;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _760 = 1.0 + _758;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _764 = 1.0 / _760;
    float _766 = _740 * 2.0;
    float _768 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _770 = _746 * 2.0;
    float _772 = floor(_766);
    float _774 = _748 * 2.0;
    float _776 = -_750;
    float _778 = fma(_768, 2.0, _776);
    float _780 = _744 * _116;
    float _782 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _784 = _748 + _746;
    float _786 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _762);
    float _788 = floor(_770);
    float _790 = fma(_782, -2.0, _756);
    float _792 = _784 + (-1.0);
    float _794 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _786);
    float _796 = -_116;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[76].x, _778);
    float _800 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _790);
    float _802 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _804 = _772 >= 0.0;
    bool _806 = isnan(_772);
    bool _808 = _804 || _806;
    bool _810 = isnan(0.0);
    bool _812 = _808 || _810;
    float _814 = exp2(_780);
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _826 = _824 != 0;
    int _828 = _812 ? 0 : 1;
    bool _830 = _788 > 0.0;
    float _832 = floor(_774);
    bool _834 = !_822;
    int _836 = _834 ? 0 : 1;
    bool _838 = _772 > 0.0;
    bool _840 = _788 >= 0.0;
    bool _842 = isnan(_788);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    bool _850 = !_818;
    int _852 = _850 ? 0 : 1;
    float _854 = -_814;
    float _856 = _854 + 1.0;
    bool _858 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    int _868 = ~_828;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    bool _874 = !_826;
    int _876 = _874 ? 0 : 1;
    float _878 = _866 ? _856 : 0.0;
    bool _880 = _832 > 0.0;
    bool _882 = _832 >= 0.0;
    bool _884 = isnan(_832);
    bool _886 = _882 || _884;
    bool _888 = isnan(0.0);
    bool _890 = _886 || _888;
    int _892 = _872;
    if (!_838)
    {
        int _894 = ~_828;
        int _896 = _894 + 1;
        _892 = _896;
    }
    int _898 = _892;
    float _900 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _902 = int(_900);
    float _904 = float(_754);
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _908 = _906 != 0;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _916 = _914 != 0;
    float _918 = in.m_63.x;
    float _920 = in.m_63.y;
    float _922 = in.m_63.z;
    int _924 = _848 ? 0 : 1;
    float _926 = 1.0 / _904;
    bool _928 = !_908;
    int _930 = _928 ? 0 : 1;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _934 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _936 = isnan(1.0);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _942 = _938 || _940;
    float _944 = float(_898);
    float _946 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _932);
    int _948 = ~_924;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = abs(_930);
    float _956 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _946);
    float _958 = float(_902);
    float _960 = float(_954);
    bool _962 = !_912;
    int _964 = _962 ? 0 : 1;
    float _966 = _958 * _116;
    float _968 = _926 * _116;
    float _970 = _960 * _944;
    int _972 = _952;
    if (_942)
    {
        float _974 = _878 * _764;
        _126 = _974;
    }
    float _976 = _126;
    if (!_830)
    {
        int _978 = ~_924;
        int _980 = _978 + 1;
        _972 = _980;
    }
    int _982 = _972;
    float _984 = _746 + (-0.5);
    float _986 = _970 * (-2.0);
    int _988 = abs(_964);
    bool _990 = !_916;
    int _992 = _990 ? 0 : 1;
    float _994 = fma(_986, _918, _918);
    int _996 = _890 ? 0 : 1;
    float _998 = fma(_802, _986, _802);
    float _1000 = float(_982);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].x, _994);
    float _1004 = float(_988);
    int _1006 = abs(_992);
    float _1008 = fma(_998, _976, _1002);
    int _1010 = ~_996;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = _1004 * _1000;
    int _1018 = _1014;
    if (!_880)
    {
        int _1020 = ~_996;
        int _1022 = _1020 + 1;
        _1018 = _1022;
    }
    int _1024 = _1018;
    float _1026 = _748 + _740;
    float _1028 = _1016 * (-2.0);
    float _1030 = _1026 + (-1.0);
    float _1032 = float(_1024);
    float _1034 = fma(_1028, _920, _920);
    float _1036 = float(_1006);
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1040 = _740 + _746;
    float _1042 = _740 + (-0.5);
    float _1044 = _1008 * 0.15915493667125701904296875;
    float _1046 = _1036 * _1032;
    float _1048 = _748 + (-0.5);
    float _1050 = fma(_1038, _1028, _1038);
    float _1052 = _1040 + (-1.0);
    float _1054 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1034);
    float _1056 = _1046 * (-2.0);
    float _1058 = _1044 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1064 = fma(_1050, _976, _1054);
    float _1066 = fma(_1056, _922, _922);
    float _1068 = in.m_65.x;
    float _1070 = in.m_65.y;
    float _1072 = in.m_65.z;
    float _1074 = fma(_1062, _1056, _1062);
    float _1076 = _1064 * 0.15915493667125701904296875;
    float _1078 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1066);
    float _1080 = _1044 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1086 = fma(_1074, _976, _1078);
    float _1088 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1090 = _1086 * 0.15915493667125701904296875;
    float _1092 = _1076 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = in.m_46.x;
    float _1100 = in.m_46.y;
    float _1102 = in.m_46.z;
    float _1104 = _1076 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1068);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1072);
    float _1112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1070);
    float _1114 = _1090 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1096 * _1108;
    float _1120 = _1088 * _1110;
    float _1122 = _1060 * _1094;
    float _1124 = _1084 * _1112;
    float _1126 = _1082 * _1094;
    float _1128 = _1090 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _1060 * _1106;
    float _1134 = _1082 * _1106;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1138 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1136);
    float _1140 = _1060 * _1116;
    float _1142 = _1082 * _1116;
    float _1144 = _1106 * _1116;
    float _1146 = _1094 * _1116;
    float _1148 = _1140 * _1124;
    float _1150 = _1142 * _1124;
    float _1152 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1138);
    float _1154 = fma(_1130, _1132, _1126);
    float _1156 = -_1122;
    float _1158 = fma(_1130, _1134, _1156);
    float _1160 = -_1134;
    float _1162 = fma(_1130, _1122, _1160);
    float _1164 = -_1124;
    float _1166 = _1130 * _1164;
    float _1168 = fma(_1154, _1118, _1148);
    float _1170 = fma(_1130, _1126, _1132);
    float _1172 = fma(_1158, _1118, _1150);
    float _1174 = fma(_1144, _1118, _1166);
    float _1176 = fma(_1162, _1120, _1168);
    float _1178 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1180 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1182 = fma(_1146, _1120, _1174);
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1186 = fma(_1170, _1120, _1172);
    float _1188 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1178);
    float _1190 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1184);
    float _1194 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1180);
    float _1196 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1188);
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1190);
    float _1200 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    float _1202 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1194);
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1206 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1198);
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1216 = _1204 + _1208;
    float _1218 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1220 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1212);
    float _1222 = _1210 + _1214;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1226 = _1216 + _1224;
    float _1228 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1230 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1220);
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1234 = _1222 + _1232;
    float _1236 = _1226 * _1226;
    float _1238 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1228);
    float _1240 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1242 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1244 = fma(_1234, _1234, _1236);
    float _1246 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1238);
    float _1248 = _1218 + _1240;
    float _1250 = sqrt(_1244);
    float _1252 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1254 = _1250 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = _1102;
    float _1258 = _1238;
    float _1260 = _1248;
    float _1262 = _1252;
    float _1264 = _1212;
    float _1266 = _1152;
    float _1268 = _1210;
    if (!_1254)
    {
        _1256 = _1222;
    }
    float _1270 = _1256;
    float _1272 = _1270;
    if (!_1254)
    {
        _1258 = _1216;
    }
    float _1274 = _1258;
    bool _1276 = !_1254;
    float _1278 = _1274;
    if (!_1276)
    {
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1284 = _1250 + _1282;
        float _1286 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = rsqrt(_1244);
        float _1290 = _1284 * _1280;
        float _1292 = _1290 * 0.15915493667125701904296875;
        float _1294 = _1292 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = _1292 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        float _1302 = _1296 + (-1.0);
        float _1304 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = fma(_1300, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1308 = fma(_1248, _1296, _1304);
        float _1310 = _1288 * _1306;
        float _1312 = fma(_1234, _1310, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1314 = fma(_1226, _1310, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1260 = _1308;
        _1272 = _1312;
        _1278 = _1314;
    }
    float _1316 = _1260;
    float _1318 = _1272;
    float _1320 = _1278;
    float _1322 = -_1218;
    float _1324 = _1322 + _1316;
    float _1326 = -_1210;
    float _1328 = _1326 + _1318;
    float _1330 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1242);
    float _1332 = 1.0 / _1252;
    float _1334 = _1324 * _1324;
    float _1336 = -_1204;
    float _1338 = _1336 + _1320;
    float _1340 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1330);
    bool _1342 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1344 = isnan(0.5);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1350 = _1346 || _1348;
    float _1352 = fma(_1328, _1328, _1334);
    float _1354 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1356 = fma(_1338, _1338, _1352);
    float _1358 = _1354 + _1252;
    float _1360 = sqrt(_1356);
    float _1362 = _1358 * _1332;
    float _1364 = _1362 * 0.5;
    float _1366 = _1316;
    float _1368 = _1320;
    float _1370 = _1328;
    float _1372 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1350)
    {
        _1262 = 1.0;
    }
    float _1374 = _1262;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1376);
    float _1380 = 1.0 / _1378;
    bool _1382 = _1360 > 0.0;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1386 = _1380 * _1384;
    float _1388 = _1360;
    float _1390 = _1378;
    float _1392 = _1374;
    if (!_1382)
    {
        _1388 = _1318;
    }
    float _1394 = _1388;
    bool _1396 = !_1382;
    float _1398 = _1394;
    if (!_1396)
    {
        float _1400 = _188 * _188;
        float _1402 = rsqrt(_1356);
        float _1404 = fma(_186, _186, _1400);
        float _1406 = fma(_190, _190, _1404);
        float _1408 = sqrt(_1406);
        float _1410 = _1328 * _1402;
        float _1412 = _1324 * _1402;
        float _1414 = _1338 * _1402;
        bool _1416 = _1408 > 0.0;
        float _1418 = _1408;
        _1390 = _1406;
        _1264 = _1412;
        _1266 = _1410;
        _1372 = _1414;
        if (!_1416)
        {
            _1418 = _1318;
        }
        float _1420 = _1418;
        bool _1422 = !_1416;
        _1398 = _1420;
        if (!_1422)
        {
            float _1424 = rsqrt(_1406);
            float _1426 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1428 = _188 * _1424;
            float _1430 = _186 * _1424;
            float _1432 = _190 * _1424;
            float _1434 = _1412 * _1428;
            float _1436 = fma(_1410, _1430, _1434);
            float _1438 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1440 = fma(_1414, _1432, _1436);
            float _1442 = _1440 * _1438;
            float _1444 = fma(_186, _1442, _1318);
            float _1446 = fma(_188, _1442, _1316);
            float _1448 = fma(_190, _1442, _1320);
            _1366 = _1446;
            _1398 = _1444;
            _1368 = _1448;
            _1370 = _1434;
        }
    }
    float _1450 = _1366;
    float _1452 = _1398;
    float _1454 = _1368;
    float _1456 = _1390;
    float _1458 = _1370;
    float _1460 = _1264;
    float _1462 = _1266;
    float _1464 = _1372;
    float _1466 = _1460;
    float _1468 = _1462;
    float _1470 = _1464;
    if (!_1350)
    {
        float _1472 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1474 = _1472 * 0.15915493667125701904296875;
        float _1476 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1478 = _1474 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1476 * 0.15915493667125701904296875;
        float _1484 = _1474 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = 1.0 / _1480;
        float _1490 = _1482 * 6.283185482025146484375;
        float _1492 = cos(_1490);
        float _1494 = _1486 * _1488;
        float _1496 = _1482 * 6.283185482025146484375;
        float _1498 = sin(_1496);
        float _1500 = _1492 * _1494;
        float _1502 = 1.0 / _1500;
        float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1506 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1504;
        float _1508 = 1.0 / _1506;
        float _1510 = _1498 * _1502;
        float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1514 = fma(_1386, _1510, _1512);
        float _1516 = _1514 * _1508;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        _1392 = _1518;
    }
    float _1520 = _1392;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1450 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1452 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1454 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = sqrt(_1538);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1528 * _1544;
    float _1548 = _1532 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1456;
    float _1566 = _1554;
    float _1568 = _1562;
    float _1570 = _1548;
    float _1572 = _1550;
    float _1574 = _1552;
    if (_1558)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1576;
    }
    float _1578 = _1564;
    if (_1558)
    {
        float _1580 = rsqrt(_1554);
        _1566 = _1580;
    }
    float _1582 = _1566;
    if (_1558)
    {
        float _1584 = _1562 * _1578;
        _1568 = _1584;
    }
    float _1586 = _1568;
    if (_1558)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _1466 = _1588;
    }
    float _1590 = _1466;
    float _1592 = _1458;
    if (_1558)
    {
        float _1594 = _1590 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1578;
    if (_1558)
    {
        float _1606 = _1590 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = -_1544;
    float _1614 = -_1602;
    float _1616 = fma(_1524, _1612, _1614);
    if (_1558)
    {
        float _1618 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1468 = _1618;
    }
    float _1620 = _1468;
    float _1622 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1624 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1626 = _1620;
    if (!_1558)
    {
        _1268 = _1546;
    }
    float _1628 = _1268;
    float _1630 = _1598;
    float _1632 = _1628;
    if (_1558)
    {
        float _1634 = fma(_1598, _1620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = _1636;
    if (!_1558)
    {
        _1630 = _1616;
    }
    float _1640 = _1630;
    float _1642 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1622);
    float _1644 = floor(_1624);
    float _1646 = _1640;
    if (_1558)
    {
        float _1648 = _1610 + (-1.0);
        _1470 = _1648;
    }
    float _1650 = _1470;
    float _1652 = _1650;
    if (_1558)
    {
        float _1654 = _1582 * _1636;
        _1638 = _1654;
    }
    float _1656 = _1638;
    float _1658 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1642);
    if (_1558)
    {
        float _1660 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1652 = _1660;
    }
    float _1662 = _1652;
    if (_1558)
    {
        float _1664 = _1546 * _1656;
        _1632 = _1664;
    }
    float _1666 = _1632;
    if (_1558)
    {
        float _1668 = _1548 * _1656;
        _1570 = _1668;
    }
    float _1670 = _1570;
    if (_1558)
    {
        float _1672 = fma(_1616, _1610, _1662);
        _1646 = _1672;
    }
    float _1674 = _1646;
    if (_1558)
    {
        float _1676 = _1666 * _1666;
        _1572 = _1676;
    }
    float _1678 = _1572;
    float _1680 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1558)
    {
        float _1682 = _1670 * _1670;
        _1574 = _1682;
    }
    float _1684 = _1574;
    float _1686 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1688 = fma(_1674, _1674, _1678);
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1692 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1696 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1694);
    float _1698 = precise::clamp(_1696, 0.0, 1.0);
    float _1700 = _1688 + _1684;
    float _1702 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1704 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1692);
    float _1706 = -_1698;
    float _1708 = _1706 + 1.0;
    float _1710 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1712 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1702);
    float _1714 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1716 = rsqrt(_1700);
    float _1718 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1720 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1712);
    float _1722 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1724 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1726 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1718);
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1732 = abs(_1708);
    float _1734 = log2(_1732);
    float _1736 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1738 = -_1724;
    float _1740 = fma(_1738, _1690, 1.0);
    float _1742 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1730);
    float _1744 = -_1644;
    float _1746 = _1624 + _1744;
    float _1748 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1750 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    float _1752 = _1716 * _1666;
    float _1754 = _1716 * _1674;
    float _1756 = floor(_1680);
    float _1758 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1750);
    float _1760 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1762 = _1716 * _1670;
    float _1764 = _1754 + 1.0;
    float _1766 = -_1760;
    float _1768 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1766);
    float _1770 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = log2(_1740);
    float _1774 = -_1762;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1768);
    float _1778 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = fma(_1776, -0.5, 0.5);
    float _1782 = fma(_1776, 0.5, 0.5);
    float _1784 = exp2(_1770);
    float _1786 = -_1756;
    float _1788 = _1680 + _1786;
    float _1790 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1748);
    float _1792 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1794 = fma(_1782, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1796 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1798 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1792);
    float _1800 = 1.0 / _1758;
    float _1802 = fma(_1782, _1794, -0.212114393711090087890625);
    float _1804 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1806 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1808 = fma(_1782, _1802, 1.570728778839111328125);
    float _1810 = sqrt(_1780);
    float _1812 = -_1754;
    float _1814 = fma(_1784, _1764, _1812);
    float _1816 = _1772 * 0.693147182464599609375;
    float _1818 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1820 = _1804 * _1800;
    float _1822 = _1806 * _1800;
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = fma(_1822, 0.5, 0.5);
    float _1828 = fma(_1814, 0.5, 0.5);
    float _1830 = _1810 * 0.636619746685028076171875;
    float2 _5818 = float2(_1746, _1788);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5818, float2(0.0), isnan(_5818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5818, float2(0.0), isnan(_5818)), level(0.0)).x;
    float _1834 = -_1808;
    float _1836 = fma(_1830, _1834, 1.0);
    float3 _5834 = float3(_1826, _1824, _1818);
    float _1838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5834, float3(0.0), isnan(_5834)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5834, float3(0.0), isnan(_5834)), level(0.0)).x;
    float3 _5845 = float3(_1826, _1824, _1818);
    float4 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5845, float3(0.0), isnan(_5845)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5845, float3(0.0), isnan(_5845)), level(0.0)).xyzw;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1841.w;
    float2 _5861 = float2(_1836, _1828);
    float3 _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5861, float2(0.0), isnan(_5861)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5861, float2(0.0), isnan(_5861)), level(0.0)).xyz;
    float _1855 = _1853.x;
    float _1857 = _1853.y;
    float _1859 = _1853.z;
    float _1861 = float(uint(_902));
    float _1863 = trunc(_968);
    int _1865 = int(_1863);
    int _1867 = ~_902;
    int _1869 = _1867 + 1;
    float _1871 = _966 * _168;
    bool _1873 = _902 == 0;
    float _1875 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1877 = _902 + (-1);
    int _1879 = abs(_836);
    float _1881 = 1.0 / _1861;
    int _1883 = abs(_852);
    float _1885 = float(uint(_1865));
    float _1887 = trunc(_1871);
    int _1889 = int(_1887);
    int _1891 = as_type<int>(_1881) + (-2);
    float _1893 = exp2(_1875);
    float _1895 = as_type<float>(_1891) * _1885;
    float _1897 = trunc(_1895);
    float _1899 = precise::max(_1897, 0.0);
    uint _1902 = uint(_1899);
    float _1904 = -_1893;
    float _1906 = _1904 + 1.0;
    float _1908 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1910 = _1869 * int(_1902);
    int _1912 = _1910 + _1865;
    float _1914 = float(uint(_1912));
    float _1916 = as_type<float>(_1891) * _1914;
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1920 = _1918 != 0;
    int _1922 = ~_902;
    int _1924 = _1922 + 1;
    float _1926 = trunc(_1916);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    bool _1932 = !_1920;
    float _1934 = _1932 ? 7.345489978790283203125 : 1.0;
    float _1936 = _1934 * _746;
    float _1938 = floor(_1936);
    int _1940 = int(_1902) + int(_1930);
    float _1942 = float(_1865);
    int _1944 = _1924 * _1940;
    int _1946 = _1944 + _1865;
    bool _1948 = _1942 >= _958;
    bool _1950 = isnan(_1942);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(_958);
    bool _1956 = _1952 || _1954;
    float _1958 = float(_1956);
    float _1960 = -_1938;
    float _1962 = _1936 + _1960;
    bool _1964 = uint(_1946) >= uint(_902);
    float _1966 = trunc(_1958);
    int _1968 = int(_1966);
    float _1970 = _1962 * _958;
    bool _1972 = !_1964;
    int _1974 = _1972 ? 0 : (-1);
    int _1976 = ~_1940;
    int _1978 = _1976 + _1974;
    int _1980 = _1978 + 1;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1984 = _1982 != 0;
    float _1986 = trunc(_1970);
    int _1988 = int(_1986);
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1992 = _1990 != 0;
    int _1994 = _902 * _1980;
    int _1996 = _1994 + _1865;
    bool _1998 = !_1984;
    int _2000 = _1998 ? 0 : 1;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2004 = _2002 != 0;
    int _2006 = ~_1968;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    bool _2012 = !_1873;
    int _2014 = _2012 ? _1996 : (-1);
    int _2016 = abs(_2000);
    bool _2018 = !_2004;
    int _2020 = _2018 ? 0 : 1;
    int _2022 = _2014 * _2010;
    int _2024 = abs(_2020);
    int _2026 = _1968 * _1877;
    int _2028 = _2026 + _2022;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2030;
    int _2034 = abs(_876);
    int _2036 = _2028 * _1879;
    int _2038 = _1988 * _2016;
    int _2040 = _2038 + _1865;
    float _2042 = in.m_67.y;
    int _2044 = _1889 * _1883;
    int _2046 = _2044 + _2036;
    int _2048 = ~_902;
    int _2050 = _2048 + 1;
    int _2052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2054 = _2052 != 0;
    int _2056 = _2040 * _2034;
    int _2058 = _2056 + _2046;
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2062 = _2060 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2064 = as_type<float>(_2046);
    if (_1992)
    {
        float _2066 = in.m_57.x;
        _2064 = _2066;
    }
    float _2068 = _2064;
    bool _2070 = _748 > 0.5;
    int _2072 = _1988 * _2024;
    int _2074 = _2072 + _2058;
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2078 = _2076 != 0;
    float _2080 = in.m_67.x;
    float _2082 = 1.0 / _2062;
    bool _2084 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2086 = isnan(_738);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2092 = _2088 || _2090;
    float _2094 = float(_2092);
    float _2096 = float(uint(_2074));
    float _2098 = as_type<float>(_1891) * _2096;
    float _2100 = trunc(_2098);
    float _2102 = precise::max(_2100, 0.0);
    uint _2104 = uint(_2102);
    float _2106 = _2032 * _2082;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2110 = _738 + _2108;
    float _2112 = fma(_2106, _2110, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2114 = float(uint(_2040));
    int _2116 = ~_902;
    int _2118 = _2116 + 1;
    int _2120 = _2050 * int(_2104);
    int _2122 = _2120 + _2074;
    float _2124 = float(uint(_2122));
    float _2126 = as_type<float>(_1891) * _2124;
    float _2128 = -_2042;
    float _2130 = _2128 + 1.0;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2132 = trunc(_2126);
    float _2134 = precise::max(_2132, 0.0);
    uint _2136 = uint(_2134);
    float _2138 = _2042;
    if (_2054)
    {
        float _2140 = _2070 ? _2130 : _2042;
        _2138 = _2140;
    }
    float _2142 = _2138;
    float _2144 = in.m_71.x;
    float _2146 = in.m_71.y;
    float _2148 = in.m_71.z;
    bool _2150 = _2068 > 0.5;
    bool _2152 = _2150 && _1992;
    float _2154 = -_2094;
    float _2156 = _2154 + 1.0;
    bool _2158 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2160 = isnan(_738);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = as_type<float>(_1891) * _2114;
    bool _2172 = _1070 != 0.0;
    bool _2174 = isnan(_1070);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(0.0);
    bool _2180 = _2176 || _2178;
    float _2182 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _2184 = ~_902;
    int _2186 = _2184 + 1;
    float _2188 = _2168 * _2156;
    bool _2190 = _1068 == 0.0;
    bool _2192 = !_2180;
    bool _2194 = _2190 && _2192;
    float _2196 = trunc(_2170);
    float _2198 = precise::max(_2196, 0.0);
    uint _2200 = uint(_2198);
    float _2202 = -_800;
    float _2204 = fma(_794, _2182, _2202);
    float _2206 = _2112 * _2188;
    bool _2208 = _1072 == 0.0;
    bool _2210 = _2208 && _2194;
    float _2212 = -_2168;
    float _2214 = _2212 + 1.0;
    int _2216 = int(_2104) + int(_2136);
    float _2218 = as_type<float>(_2136);
    float _2220 = _2080;
    if (_1992)
    {
        _2218 = _2080;
    }
    float _2222 = _2218;
    float _2224 = abs(_1386);
    float _2226 = log2(_2224);
    float _2228 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2206);
    int _2230 = _2118 * _2216;
    int _2232 = _2230 + _2074;
    float _2234 = _2222;
    if (_2152)
    {
        float _2236 = -_2222;
        float _2238 = _2236 + 1.0;
        _2234 = _2238;
    }
    float _2240 = _2234;
    float _2242 = _2148;
    float _2244 = _2146;
    float _2246 = _2144;
    if (!_2210)
    {
        float _2248 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2148);
        _2242 = _2248;
    }
    float _2250 = _2242;
    if (_1992)
    {
        _2220 = _2240;
    }
    float _2252 = _2220;
    int _2254 = _2186 * int(_2200);
    int _2256 = _2254 + _2040;
    bool _2258 = uint(_2232) >= uint(_902);
    if (!_2210)
    {
        float _2260 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2244 = _2260;
    }
    float _2262 = _2244;
    float _2264 = _2204 + 0.5;
    float _2266 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2268 = !_2258;
    int _2270 = _2268 ? 0 : (-1);
    float _2272 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2274 = float(uint(_2256));
    float _2276 = fma(_956, _2266, _798);
    int _2278 = ~_2216;
    int _2280 = _2278 + _2270;
    int _2282 = _2280 + 1;
    float _2284 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2228);
    float _2286 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2288 = as_type<float>(_1891) * _2274;
    if (!_2210)
    {
        float _2290 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2144);
        _2246 = _2290;
    }
    float _2292 = _2246;
    int _2294 = _902 * _2282;
    int _2296 = _2294 + _2074;
    float _2298 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2300 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2302 = trunc(_2288);
    float _2304 = precise::max(_2302, 0.0);
    uint _2306 = uint(_2304);
    float _2308 = _2276 + 0.5;
    bool _2310 = !_1873;
    int _2312 = _2310 ? _2296 : (-1);
    float _2314 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2316 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2318 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2320 = _2312 >> 31;
    float _2322 = _2284 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _2308;
    out.m_73.y = _2264;
    int _2324 = ~_902;
    int _2326 = _2324 + 1;
    float _2328 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2330 = _2320 & 3;
    out.m_75.x = _2314;
    out.m_75.y = _2316;
    out.m_75.z = _2318;
    out.m_75.w = _2322;
    float _2332 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2334 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2336 = _2312 + _2330;
    float _2338 = exp2(_2272);
    int _2340 = int(_2200) + int(_2306);
    int _2342 = _2336 >> 2;
    float _2344 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2346 = -_1130;
    float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2328);
    int _2350 = _2312 & 3;
    bool _2352 = _2350 != 0;
    float _2354 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2344);
    float _2356 = -_1130;
    float _2358 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2332);
    int _2360 = _2342 << 4;
    int _2362 = _2360 + 368;
    float _2364 = -_1130;
    float _2366 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2334);
    float _2368 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2348);
    float _2370 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2358);
    uint _2372 = uint(int(uint(_2362) >> uint(2)));
    uint _2374 = uint(int(uint(int(_2372)) >> uint(2)));
    int _2376 = int(_2372) & 3;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[int(_2374)][_2376];
    int _2380 = int(_2372) + 1;
    uint _2382 = uint(int(uint(_2380) >> uint(2)));
    int _2384 = _2380 & 3;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[int(_2382)][_2384];
    float _2388 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2366);
    float _2390 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2392 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2394 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2396 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2390);
    float _2398 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2392);
    float _2400 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2394);
    int _2402 = _2312 & 3;
    bool _2404 = _2402 != 0;
    float _2406 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2408 = _2362 + 8;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    float _2426 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2428 = uint(_2402) > 1u;
    float _2430 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2406);
    float _2436 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2426);
    int _2438 = _2352 ? 0 : 1;
    float _2440 = _2370 * _2262;
    float _2442 = _2388 * _2262;
    float _2444 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2396);
    float _2446 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2398);
    float _2448 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2400);
    int _2450 = ~_2438;
    int _2452 = _2450 + 1;
    int _2454 = _2452 + 1;
    float _2456 = _2368 * _2262;
    float _2458 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2434);
    int _2460 = _2454;
    if (!_2428)
    {
        int _2462 = ~_2438;
        int _2464 = _2462 + 1;
        _2460 = _2464;
    }
    int _2466 = _2460;
    float _2468 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2354);
    bool _2470 = _2402 != 3;
    float _2472 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2436);
    bool _2474 = uint(_2402) >= 2u;
    float _2476 = fma(_2432, -2.0, 3.0);
    float _2478 = _2432 * _2432;
    int _2480 = abs(_2466);
    float _2482 = fma(_2444, _2292, _2440);
    int _2484 = _2474 ? 0 : 1;
    float _2486 = fma(_2446, _2292, _2456);
    bool _2488 = !_2404;
    int _2490 = _2488 ? 0 : 1;
    int _2492 = _2326 * _2340;
    int _2494 = _2492 + _2040;
    int _2496 = ~_2480;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = fma(_2448, _2292, _2442);
    bool _2504 = _2402 != 3;
    float _2506 = _2478 * _2476;
    int _2508 = ~_2484;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = -_1832;
    float _2516 = _2514 + 1.0;
    int _2518 = abs(_2490);
    float _2520 = _1908 * _1838;
    int _2522 = _2512;
    float _2524 = _2520;
    if (_2470)
    {
        int _2526 = ~_2484;
        int _2528 = _2526 + 1;
        _2522 = _2528;
    }
    int _2530 = _2522;
    int _2532 = _2500 * as_type<int>(_2386);
    bool _2534 = !_2504;
    int _2536 = _2534 ? 0 : (-1);
    float _2538 = -_1908;
    float _2540 = _2538 + 1.0;
    bool _2542 = uint(_2494) >= uint(_902);
    float _2544 = fma(_2468, _2250, _2486);
    bool _2546 = !_2078;
    int _2548 = _2546 ? 0 : 1;
    int _2550 = abs(_2530);
    int _2552 = ~_2518;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    int _2558 = abs(_2536);
    bool _2560 = !_2542;
    int _2562 = _2560 ? 0 : (-1);
    int _2564 = _2556 * as_type<int>(_2378);
    int _2566 = _2564 + _2532;
    int _2568 = abs(_2548);
    int _2570 = ~_2550;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = ~_2340;
    int _2578 = _2576 + _2562;
    int _2580 = _2578 + 1;
    int _2582 = _2574 * as_type<int>(_2416);
    int _2584 = _2582 + _2566;
    int _2586 = ~_2558;
    int _2588 = _2586 + 1;
    int _2590 = _2588 + 1;
    int _2592 = _902 * _2580;
    int _2594 = _2592 + _2040;
    int _2596 = ~_2568;
    int _2598 = _2596 + 1;
    int _2600 = _2598 + 1;
    float _2602 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2604 = _1386 <= 8000.0;
    bool _2606 = isnan(_1386);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan(8000.0);
    bool _2612 = _2608 || _2610;
    float _2614 = float(_2612);
    int _2616 = _2590 * as_type<int>(_2424);
    int _2618 = _2616 + _2584;
    bool _2620 = !_1873;
    int _2622 = _2620 ? _2594 : (-1);
    float _2624 = -_2506;
    float _2626 = _2624 + 1.0;
    float _2628 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2602);
    int _2630 = _2618 * _2600;
    float _2632 = fma(_2626, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2506);
    float _2634 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2628);
    int _2636 = _2622 * _2568;
    int _2638 = _2636 + _2630;
    float _2640 = fma(_2458, _2250, _2482);
    float _2642 = _2614 * _2632;
    float _2644 = in.m_77.x;
    float _2646 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2634);
    float _2648 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2650 = _2646 + _1758;
    float _2652 = _1849 * _2520;
    float _2654 = _2516 * _2648;
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = _1859 * _2520;
    float _2660 = _2650 * 0.5;
    float _2662 = fma(_2472, _2250, _2502);
    float _2664 = -_2656;
    float _2666 = fma(_2664, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2668 = fma(_1855, _2652, _1843);
    float _2670 = fma(_1857, _2652, _1845);
    out.m_79.z = _2660;
    out.m_79.w = _1758;
    float _2672 = _1849 * _2540;
    float _2674 = fma(_1849, _2658, _1847);
    bool _2676 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2678 = isnan(_1542);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2684 = _2680 || _2682;
    out.gl_Position.x = _1806;
    out.gl_Position.y = _1804;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _1758;
    float _2686 = float(_2638);
    out.m_81.x = _2668;
    out.m_81.y = _2670;
    out.m_81.z = _2674;
    out.m_81.w = _2672;
    float _2688 = _2666 * _2644;
    float _2690 = _1520 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_83.x = _2640;
    out.m_83.y = _2544;
    out.m_83.z = _2662;
    float _2692 = _2688 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2686;
    float _2694 = _2658;
    float _2696 = _2648;
    float _2698 = _2652;
    float _2700 = _2686;
    float _2702 = _2688;
    if (!_2684)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2704 = _2694;
    float _2706 = _2704;
    float _2708 = _2704;
    if (!_2684)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2710 = _2696;
    out.m_87.x = _2692;
    float _2712 = _2710;
    float _2714 = _2710;
    if (!_2684)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2716 = _2698;
    float _2718 = _2716;
    float _2720 = _2716;
    if (!_2684)
    {
        _2524 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2722 = _2524;
    float _2724 = _2722;
    float _2726 = _2722;
    if (!_2684)
    {
        _2700 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2728 = _2700;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2684)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2734 = _2702;
    bool _2736 = !_2684;
    float _2738 = _2734;
    float _2740 = _2734;
    if (!_2736)
    {
        bool _2742 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2744 = isnan(_1542);
        bool _2746 = _2742 || _2744;
        bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2750 = _2746 || _2748;
        if (!_2750)
        {
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2754 = _1542 + _2752;
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2758 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2756;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2764 = 1.0 / _2758;
            float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2782 = _2754 * _2764;
            float _2784 = precise::clamp(_2782, 0.0, 1.0);
            float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2790 = fma(_2784, _2762, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2792 = fma(_2784, _2788, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2794 = fma(_2784, _2768, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2796 = fma(_2784, _2772, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2798 = fma(_2784, _2776, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2800 = fma(_2784, _2780, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2708 = _2794;
            _2726 = _2798;
            _2732 = _2790;
            _2720 = _2796;
            _2714 = _2792;
            _2740 = _2800;
            _2802 = true;
        }
        else
        {
            bool _2804 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2806 = isnan(_1542);
            bool _2808 = _2804 || _2806;
            bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2812 = _2808 || _2810;
            if (!_2812)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2814 = _2730;
            _2732 = _2814;
            if (!_2812)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2816 = _2706;
            _2708 = _2816;
            if (!_2812)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2818 = _2712;
            _2714 = _2818;
            if (!_2812)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2820 = _2718;
            _2720 = _2820;
            if (!_2812)
            {
                _2724 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2822 = _2724;
            _2726 = _2822;
            if (!_2812)
            {
                _2738 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2824 = _2738;
            bool _2826 = !_2812;
            _2740 = _2824;
            if (!_2826)
            {
                bool _2828 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2830 = isnan(_1542);
                bool _2832 = _2828 || _2830;
                bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2836 = _2832 || _2834;
                if (!_2836)
                {
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2840 = _1542 + _2838;
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2844 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2842;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2850 = 1.0 / _2844;
                    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2868 = _2840 * _2850;
                    float _2870 = precise::clamp(_2868, 0.0, 1.0);
                    float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2876 = fma(_2870, _2848, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2878 = fma(_2870, _2874, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2880 = fma(_2870, _2854, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2882 = fma(_2870, _2858, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2884 = fma(_2870, _2862, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2886 = fma(_2870, _2866, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2708 = _2880;
                    _2726 = _2884;
                    _2732 = _2876;
                    _2720 = _2882;
                    _2714 = _2878;
                    _2740 = _2886;
                    _2802 = true;
                }
                else
                {
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2802 = false;
    float _2888 = _2708;
    float _2890 = _2726;
    float _2892 = _2732;
    float _2894 = _2720;
    float _2896 = _2714;
    float _2898 = _2740;
    float _2900 = _2690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2902 = fma(_2544, -0.5, 0.5);
    float _2904 = precise::clamp(_2902, 0.0, 1.0);
    float _2906 = -_2888;
    float _2908 = _2906 + _2890;
    float _2910 = -_2892;
    float _2912 = _2910 + _2894;
    out.m_53.x = _2900;
    float _2914 = -_2896;
    float _2916 = _2914 + _2898;
    float _2918 = fma(_2904, _2908, _2888);
    float _2920 = fma(_2904, _2912, _2892);
    bool _2922 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2924 = _2918 * 0.586610972881317138671875;
    float _2926 = fma(_2904, _2916, _2896);
    out.m_89.x = 0.0;
    bool _2928 = _1520 > 0.0;
    bool _2930 = isnan(_1520);
    bool _2932 = _2928 || _2930;
    bool _2934 = isnan(0.0);
    bool _2936 = _2932 || _2934;
    float _2938 = fma(_2920, 0.298911988735198974609375, _2924);
    float _2940 = fma(_2926, 0.114477999508380889892578125, _2938);
    float _2942 = -_2940;
    float _2944 = _2920 + _2942;
    float _2946 = -_2940;
    float _2948 = _2918 + _2946;
    float _2950 = -_2940;
    float _2952 = _2926 + _2950;
    float _2954 = fma(_2944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2940);
    float _2956 = fma(_2948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2940);
    float _2958 = fma(_2952, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2940);
    bool _2960 = !_2922;
    if (!_2960)
    {
        float _2962 = -_1450;
        float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2966 = -_1452;
        float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2970 = -_1454;
        float _2972 = _2970 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2974 = _2964 * _2964;
        float _2976 = fma(_2968, _2968, _2974);
        float _2978 = fma(_2972, _2972, _2976);
        float _2980 = sqrt(_2978);
        float _2982 = rsqrt(_2978);
        float _2984 = -_2980;
        float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2988 = _2986 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2990 = precise::clamp(_2988, 0.0, 1.0);
        float _2992 = _2968 * _2982;
        float _2994 = _2964 * _2982;
        float _2996 = abs(_2990);
        float _2998 = log2(_2996);
        float _3000 = _2972 * _2982;
        float _3002 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3004 = _2544 * _2994;
        float _3006 = -_2994;
        float _3008 = -_3002;
        float _3010 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3008);
        float _3012 = fma(_2640, _2992, _3004);
        float _3014 = -_3000;
        float _3016 = fma(_3014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3010);
        float _3018 = fma(_2662, _3000, _3012);
        float _3020 = precise::clamp(_3018, 0.0, 1.0);
        float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3024 = _3016 + _3022;
        float _3026 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3028 = _3024 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3030 = precise::clamp(_3028, 0.0, 1.0);
        float _3032 = exp2(_3026);
        float _3034 = _3032 * _3030;
        float _3036 = _3020 * _3034;
        float _3038 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3040 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3042 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3038;
        out.m_89.y = _3040;
        out.m_89.z = _3042;
    }
    out.m_91.x = _2954;
    out.m_91.y = _2956;
    out.m_91.z = _2958;
    if (_2936)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3044;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

