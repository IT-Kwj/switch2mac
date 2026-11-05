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
    float4 m_73 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _344 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _346 = isnan(_324);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _338;
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _360 = 1.0 / _342;
    float _362 = _300 * _330;
    float _364 = _298 * _328;
    bool _366 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _368 = isnan(_324);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    bool _378 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _380 = isnan(_324);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = _334 * _356;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _394 = _324 + _392;
    float _396 = -_376;
    float _398 = _396 + 1.0;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = -_388;
    float _406 = _404 + 1.0;
    float _408 = _388 * _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = _354 * _406;
    float _420 = fma(_402, _390, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _422 = fma(_412, _390, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_416, _390, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = _394 * _360;
    float _428 = _420 * _418;
    float _430 = _422 * _418;
    float _432 = _424 * _418;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _446 = -_354;
    float _448 = _446 + 1.0;
    float _450 = fma(_436, _426, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _452 = fma(_440, _426, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _454 = fma(_444, _426, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _456 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[107].z, _428);
    float _462 = fma(_450, _408, _456);
    float _464 = fma(_452, _408, _458);
    float _466 = fma(_454, _408, _460);
    float _468 = _296 * _326;
    float _470 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[109].x, _462);
    float _472 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[109].y, _464);
    float _474 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[109].z, _466);
    bool _476 = !_358;
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
    float _560 = _534 * _556;
    float _562 = -_534;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _522;
    float _568 = _538 * _552;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _574 = fma(_568, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _572 * _566;
    float _578 = _574 * _560;
    float _580 = -_550;
    float _582 = _580 + 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = _498 + _584;
    float _588 = _470 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _590 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[115].x, _578);
    float _592 = _518 * _582;
    float _594 = fma(_576, _586, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = fma(_594, _592, _590);
    float _602 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _608 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _598;
    out.m_61.y = _608;
    out.m_61.z = _604;
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
    float _704 = _698 * _680;
    float _706 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].x, _700);
    float _708 = _702 * _680;
    float _710 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].x, _706);
    float _712 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].y, _708);
    float _714 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].z, _704);
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
    float _750 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _752 = int(_750);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _758 = _744 * _116;
    float _760 = exp2(_758);
    float _762 = _740 * 2.0;
    float _764 = _746 * 2.0;
    float _766 = _748 * 2.0;
    float _768 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _770 = floor(_762);
    float _772 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _774 = -_754;
    float _776 = fma(_768, 2.0, _774);
    float _778 = _748 + _746;
    float _780 = fma(_772, -2.0, _756);
    float _782 = -_116;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[76].x, _776);
    float _786 = floor(_764);
    float _788 = -_760;
    float _790 = _788 + 1.0;
    float _792 = _778 + (-1.0);
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = floor(_766);
    bool _798 = _770 >= 0.0;
    bool _800 = isnan(_770);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _810 = 1.0 + _808;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _814 = _812 != 0;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _822 = _820 != 0;
    int _824 = _806 ? 0 : 1;
    float _826 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _828 = int(_826);
    bool _830 = _786 > 0.0;
    bool _832 = !_818;
    int _834 = _832 ? 0 : 1;
    bool _836 = _770 > 0.0;
    bool _838 = !_814;
    int _840 = _838 ? 0 : 1;
    float _842 = 1.0 / _810;
    bool _844 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _852 = _848 || _850;
    bool _854 = _786 >= 0.0;
    bool _856 = isnan(_786);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = _796 > 0.0;
    bool _866 = _796 >= 0.0;
    bool _868 = isnan(_796);
    bool _870 = _866 || _868;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    int _876 = ~_824;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    int _882 = _880;
    if (!_836)
    {
        int _884 = ~_824;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    bool _890 = !_822;
    int _892 = _890 ? 0 : 1;
    float _894 = _852 ? _790 : 0.0;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _900 = _898 != 0;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _908 = _906 != 0;
    float _910 = float(_752);
    float _912 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _896);
    float _914 = in.m_63.x;
    float _916 = in.m_63.y;
    float _918 = in.m_63.z;
    bool _920 = !_900;
    int _922 = _920 ? 0 : 1;
    float _924 = 1.0 / _910;
    float _926 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _912);
    int _928 = _862 ? 0 : 1;
    bool _930 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _932 = isnan(1.0);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _938 = _934 || _936;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _942 = float(_888);
    int _944 = abs(_922);
    float _946 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _940);
    bool _948 = !_904;
    int _950 = _948 ? 0 : 1;
    float _952 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _780);
    float _954 = float(_944);
    float _956 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _946);
    int _958 = abs(_950);
    float _960 = _924 * _116;
    float _962 = float(_828);
    float _964 = _954 * _942;
    int _966 = ~_928;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = _746 + (-0.5);
    int _974 = _970;
    if (!_830)
    {
        int _976 = ~_928;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = _964 * (-2.0);
    float _984 = _962 * _116;
    if (_938)
    {
        float _986 = _894 * _842;
        _126 = _986;
    }
    float _988 = _126;
    int _990 = _874 ? 0 : 1;
    float _992 = fma(_982, _914, _914);
    bool _994 = !_908;
    int _996 = _994 ? 0 : 1;
    float _998 = float(_980);
    float _1000 = fma(_794, _982, _794);
    float _1002 = float(_958);
    float _1004 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[196].x, _992);
    int _1006 = ~_990;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = _1010;
    if (!_864)
    {
        int _1014 = ~_990;
        int _1016 = _1014 + 1;
        _1012 = _1016;
    }
    int _1018 = _1012;
    float _1020 = _1002 * _998;
    int _1022 = abs(_996);
    float _1024 = _748 + _740;
    float _1026 = float(_1018);
    float _1028 = fma(_1000, _988, _1004);
    float _1030 = float(_1022);
    float _1032 = _1024 + (-1.0);
    float _1034 = _1020 * (-2.0);
    float _1036 = _1028 * 0.15915493667125701904296875;
    float _1038 = _1030 * _1026;
    float _1040 = _748 + (-0.5);
    float _1042 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1044 = fma(_1034, _916, _916);
    float _1046 = _740 + _746;
    float _1048 = fma(_1042, _1034, _1042);
    float _1050 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1044);
    float _1052 = _1046 + (-1.0);
    float _1054 = _1038 * (-2.0);
    float _1056 = _740 + (-0.5);
    float _1058 = fma(_1048, _988, _1050);
    float _1060 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1062 = fma(_1054, _918, _918);
    float _1064 = in.m_65.x;
    float _1066 = in.m_65.y;
    float _1068 = in.m_65.z;
    float _1070 = _1036 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = fma(_1060, _1054, _1060);
    float _1076 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    float _1078 = _1058 * 0.15915493667125701904296875;
    float _1080 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1082 = fma(_1074, _988, _1076);
    float _1084 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1086 = _1036 * 6.283185482025146484375;
    float _1088 = cos(_1086);
    float _1090 = _1078 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1082 * 0.15915493667125701904296875;
    float _1096 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = in.m_46.x;
    float _1100 = in.m_46.y;
    float _1102 = in.m_46.z;
    float _1104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1064);
    float _1106 = _1078 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1066);
    float _1112 = _1096 * _1104;
    float _1114 = _1080 * _1110;
    float _1116 = _1094 * 6.283185482025146484375;
    float _1118 = cos(_1116);
    float _1120 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1122 = _1072 * _1092;
    float _1124 = _1084 * _1120;
    float _1126 = _1088 * _1092;
    float _1128 = _1094 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _1088 * _1108;
    float _1134 = _1072 * _1108;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1138 = _1088 * _1118;
    float _1140 = _1072 * _1118;
    float _1142 = _1108 * _1118;
    float _1144 = _1092 * _1118;
    float _1146 = _1138 * _1114;
    float _1148 = _1140 * _1114;
    float _1150 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1136);
    float _1152 = fma(_1130, _1132, _1122);
    float _1154 = -_1126;
    float _1156 = fma(_1130, _1134, _1154);
    float _1158 = -_1134;
    float _1160 = fma(_1130, _1126, _1158);
    float _1162 = -_1114;
    float _1164 = _1130 * _1162;
    float _1166 = fma(_1152, _1112, _1146);
    float _1168 = fma(_1156, _1112, _1148);
    float _1170 = fma(_1130, _1122, _1132);
    float _1172 = fma(_1142, _1112, _1164);
    float _1174 = fma(_1160, _1124, _1166);
    float _1176 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1178 = fma(_1170, _1124, _1168);
    float _1180 = fma(_1144, _1124, _1172);
    float _1182 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1184 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1186 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1176);
    float _1188 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1190 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1182);
    float _1192 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1184);
    float _1194 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1186);
    float _1196 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1188);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1190);
    float _1200 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1192);
    float _1202 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1204 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1196);
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1210 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1150);
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1214 = _1202 + _1206;
    float _1216 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1218 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1220 = _1208 + _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1214 + _1222;
    float _1226 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1216);
    float _1228 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1232 = _1220 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1226);
    float _1238 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1228);
    float _1240 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1242 = fma(_1232, _1232, _1234);
    float _1244 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1246 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1238);
    float _1248 = sqrt(_1242);
    float _1250 = _1218 + _1244;
    float _1252 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1254 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = _1102;
    float _1258 = _1238;
    float _1260 = _1250;
    float _1262 = _1252;
    float _1264 = _1240;
    float _1266 = _1208;
    if (!_1254)
    {
        _1256 = _1220;
    }
    float _1268 = _1256;
    float _1270 = _1268;
    if (!_1254)
    {
        _1258 = _1214;
    }
    float _1272 = _1258;
    bool _1274 = !_1254;
    float _1276 = _1272;
    if (!_1274)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1282 = _1248 + _1280;
        float _1284 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
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
        float _1306 = fma(_1250, _1294, _1302);
        float _1308 = _1286 * _1304;
        float _1310 = fma(_1232, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1224, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1260 = _1306;
        _1270 = _1310;
        _1276 = _1312;
    }
    float _1314 = _1260;
    float _1316 = _1270;
    float _1318 = _1276;
    float _1320 = -_1218;
    float _1322 = _1320 + _1314;
    float _1324 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1240);
    float _1326 = -_1208;
    float _1328 = _1326 + _1316;
    float _1330 = 1.0 / _1252;
    float _1332 = _1322 * _1322;
    float _1334 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1324);
    float _1336 = -_1202;
    float _1338 = _1336 + _1318;
    float _1340 = fma(_1328, _1328, _1332);
    float _1342 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1344 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1346 = isnan(0.5);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1352 = _1348 || _1350;
    float _1354 = fma(_1338, _1338, _1340);
    float _1356 = _1342 + _1252;
    float _1358 = sqrt(_1354);
    float _1360 = _1356 * _1330;
    float _1362 = _1360 * 0.5;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1366 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1364);
    float _1368 = _1314;
    float _1370 = _1318;
    float _1372 = _1366;
    float _1374 = _1354;
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1352)
    {
        _1262 = 1.0;
    }
    float _1378 = _1262;
    float _1380 = 1.0 / _1366;
    bool _1382 = _1358 > 0.0;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1386 = _1380 * _1384;
    float _1388 = _1358;
    float _1390 = _1378;
    if (!_1382)
    {
        _1388 = _1316;
    }
    float _1392 = _1388;
    bool _1394 = !_1382;
    float _1396 = _1392;
    if (!_1394)
    {
        float _1398 = _188 * _188;
        float _1400 = rsqrt(_1354);
        float _1402 = fma(_186, _186, _1398);
        float _1404 = fma(_190, _190, _1402);
        float _1406 = sqrt(_1404);
        float _1408 = _1328 * _1400;
        float _1410 = _1322 * _1400;
        float _1412 = _1338 * _1400;
        bool _1414 = _1406 > 0.0;
        float _1416 = _1406;
        _1372 = _1404;
        _1374 = _1400;
        _1376 = _1410;
        _1264 = _1412;
        if (!_1414)
        {
            _1416 = _1316;
        }
        float _1418 = _1416;
        bool _1420 = !_1414;
        _1396 = _1418;
        if (!_1420)
        {
            float _1422 = rsqrt(_1404);
            float _1424 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1426 = _188 * _1422;
            float _1428 = _186 * _1422;
            float _1430 = _1410 * _1426;
            float _1432 = _190 * _1422;
            float _1434 = fma(_1408, _1428, _1430);
            float _1436 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1438 = fma(_1412, _1432, _1434);
            float _1440 = _1438 * _1436;
            float _1442 = fma(_186, _1440, _1316);
            float _1444 = fma(_188, _1440, _1314);
            float _1446 = fma(_190, _1440, _1318);
            _1368 = _1444;
            _1396 = _1442;
            _1370 = _1446;
            _1372 = _1422;
        }
    }
    float _1448 = _1368;
    float _1450 = _1396;
    float _1452 = _1370;
    float _1454 = _1372;
    float _1456 = _1374;
    float _1458 = _1376;
    float _1460 = _1264;
    float _1462 = _1458;
    float _1464 = _1460;
    if (!_1352)
    {
        float _1466 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1468 = _1466 * 0.15915493667125701904296875;
        float _1470 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1472 = _1468 * 6.283185482025146484375;
        float _1474 = cos(_1472);
        float _1476 = _1470 * 0.15915493667125701904296875;
        float _1478 = _1468 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = 1.0 / _1474;
        float _1484 = _1476 * 6.283185482025146484375;
        float _1486 = cos(_1484);
        float _1488 = _1480 * _1482;
        float _1490 = _1476 * 6.283185482025146484375;
        float _1492 = sin(_1490);
        float _1494 = _1486 * _1488;
        float _1496 = 1.0 / _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1500 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1498;
        float _1502 = 1.0 / _1500;
        float _1504 = _1492 * _1496;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1508 = fma(_1386, _1504, _1506);
        float _1510 = _1508 * _1502;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1390 = _1512;
    }
    float _1514 = _1390;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1448 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1450 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1452 + _1524;
    float _1528 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1530 = _1518 * _1518;
    float _1532 = fma(_1522, _1522, _1530);
    float _1534 = fma(_1526, _1526, _1532);
    float _1536 = rsqrt(_1534);
    float _1538 = sqrt(_1534);
    float _1540 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1542 = _1522 * _1540;
    float _1544 = _1526 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 + _1548;
    float _1552 = sqrt(_1550);
    bool _1554 = _1552 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1552 + _1556;
    float _1560 = _1454;
    float _1562 = _1550;
    float _1564 = _1558;
    float _1566 = _1542;
    float _1568 = _1544;
    float _1570 = _1546;
    float _1572 = _1548;
    if (_1554)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1574;
    }
    float _1576 = _1560;
    if (_1554)
    {
        float _1578 = rsqrt(_1550);
        _1562 = _1578;
    }
    float _1580 = _1562;
    if (_1554)
    {
        float _1582 = _1558 * _1576;
        _1564 = _1582;
    }
    float _1584 = _1564;
    if (_1554)
    {
        float _1586 = _1584 * 0.15915493667125701904296875;
        _1462 = _1586;
    }
    float _1588 = _1462;
    float _1590 = _1456;
    if (_1554)
    {
        float _1592 = _1588 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        _1590 = _1594;
    }
    float _1596 = _1590;
    float _1598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1600 = precise::max(0.0, _1598);
    float _1602 = _1576;
    if (_1554)
    {
        float _1604 = _1588 * 6.283185482025146484375;
        float _1606 = cos(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = -_1540;
    float _1612 = -_1600;
    float _1614 = fma(_1518, _1610, _1612);
    if (_1554)
    {
        float _1616 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1616;
    }
    float _1618 = _1464;
    float _1620 = fma(_1208, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1622 = _1618;
    float _1624 = _1596;
    if (_1554)
    {
        float _1626 = fma(_1596, _1618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1622 = _1626;
    }
    float _1628 = _1622;
    float _1630 = _1628;
    if (!_1554)
    {
        _1624 = _1614;
    }
    float _1632 = _1624;
    float _1634 = floor(_1620);
    float _1636 = _1632;
    if (_1554)
    {
        float _1638 = _1608 + (-1.0);
        _1266 = _1638;
    }
    float _1640 = _1266;
    float _1642 = _1640;
    if (_1554)
    {
        float _1644 = _1580 * _1628;
        _1630 = _1644;
    }
    float _1646 = _1630;
    if (_1554)
    {
        float _1648 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1648;
    }
    float _1650 = _1642;
    if (_1554)
    {
        float _1652 = _1542 * _1646;
        _1566 = _1652;
    }
    float _1654 = _1566;
    if (_1554)
    {
        float _1656 = _1544 * _1646;
        _1568 = _1656;
    }
    float _1658 = _1568;
    float _1660 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1554)
    {
        float _1662 = fma(_1614, _1608, _1650);
        _1636 = _1662;
    }
    float _1664 = _1636;
    if (_1554)
    {
        float _1666 = _1654 * _1654;
        _1570 = _1666;
    }
    float _1668 = _1570;
    if (_1554)
    {
        float _1670 = _1658 * _1658;
        _1572 = _1670;
    }
    float _1672 = _1572;
    float _1674 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1660);
    float _1676 = fma(_1664, _1664, _1668);
    float _1678 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1528);
    float _1680 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1674);
    float _1682 = _1676 + _1672;
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1686 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1690 = fma(_1202, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1692 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1694 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1688);
    float _1696 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1698 = floor(_1690);
    float _1700 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1692);
    float _1702 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1694);
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1706 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1704);
    float _1708 = precise::clamp(_1706, 0.0, 1.0);
    float _1710 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1714 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1716 = -_1708;
    float _1718 = _1716 + 1.0;
    float _1720 = rsqrt(_1682);
    float _1722 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1724 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1678);
    float _1726 = -_1634;
    float _1728 = _1620 + _1726;
    float _1730 = -_1710;
    float _1732 = fma(_1730, _1684, 1.0);
    float _1734 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1722);
    float _1736 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1738 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1740 = abs(_1718);
    float _1742 = log2(_1740);
    float _1744 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1746 = -_1698;
    float _1748 = _1690 + _1746;
    float _1750 = _1720 * _1654;
    float _1752 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1744);
    float _1754 = _1720 * _1664;
    float _1756 = _1720 * _1658;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1760 = log2(_1732);
    float _1762 = -_1758;
    float _1764 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = -_1756;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1772 = 1.0 / _1752;
    float _1774 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1776 = fma(_1770, -0.5, 0.5);
    float _1778 = fma(_1770, 0.5, 0.5);
    float _1780 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1774);
    float _1782 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1738);
    float _1784 = _1754 + 1.0;
    float _1786 = exp2(_1766);
    float _1788 = fma(_1778, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1790 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1780);
    float _1792 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1782);
    float _1794 = _1760 * 0.693147182464599609375;
    float _1796 = fma(_1778, _1788, -0.212114393711090087890625);
    float _1798 = sqrt(_1776);
    float _1800 = fma(_1778, _1796, 1.570728778839111328125);
    float _1802 = -_1754;
    float _1804 = fma(_1786, _1784, _1802);
    float _1806 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1790);
    float _1808 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1810 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = _1806 * _1772;
    float _1814 = _1808 * _1772;
    float _1816 = _1798 * 0.636619746685028076171875;
    float _1818 = fma(_1812, 0.5, 0.5);
    float _1820 = fma(_1814, -0.5, 0.5);
    float _1822 = -_1800;
    float _1824 = fma(_1816, _1822, 1.0);
    float _1826 = fma(_1804, 0.5, 0.5);
    float2 _5814 = float2(_1728, _1748);
    float _1828 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5814, float2(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5814, float2(0.0), isnan(_5814)), level(0.0)).x;
    float3 _5825 = float3(_1818, _1820, _1810);
    float _1830 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5825, float3(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5825, float3(0.0), isnan(_5825)), level(0.0)).x;
    float3 _5836 = float3(_1818, _1820, _1810);
    float4 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5836, float3(0.0), isnan(_5836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5836, float3(0.0), isnan(_5836)), level(0.0)).xyzw;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = _1833.w;
    float2 _5852 = float2(_1824, _1826);
    float3 _1845 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5852, float2(0.0), isnan(_5852)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5852, float2(0.0), isnan(_5852)), level(0.0)).xyz;
    float _1847 = _1845.x;
    float _1849 = _1845.y;
    float _1851 = _1845.z;
    float _1853 = float(uint(_828));
    float _1855 = trunc(_960);
    int _1857 = int(_1855);
    bool _1859 = _828 == 0;
    float _1861 = _984 * _168;
    int _1863 = _828 + (-1);
    float _1865 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1867 = ~_828;
    int _1869 = _1867 + 1;
    int _1871 = abs(_834);
    float _1873 = 1.0 / _1853;
    int _1875 = abs(_840);
    bool _1877 = _748 > 0.5;
    bool _1879 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1881 = isnan(_738);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    float _1891 = float(uint(_1857));
    float _1893 = trunc(_1861);
    int _1895 = int(_1893);
    int _1897 = as_type<int>(_1873) + (-2);
    float _1899 = exp2(_1865);
    float _1901 = as_type<float>(_1897) * _1891;
    float _1903 = trunc(_1901);
    float _1905 = precise::max(_1903, 0.0);
    uint _1908 = uint(_1905);
    float _1910 = -_1899;
    float _1912 = _1910 + 1.0;
    int _1914 = _1869 * int(_1908);
    int _1916 = _1914 + _1857;
    float _1918 = float(uint(_1916));
    float _1920 = as_type<float>(_1897) * _1918;
    int _1922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1924 = _1922 != 0;
    int _1926 = ~_828;
    int _1928 = _1926 + 1;
    bool _1930 = !_1924;
    float _1932 = _1930 ? 7.345489978790283203125 : 1.0;
    float _1934 = trunc(_1920);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    float _1940 = _1932 * _746;
    float _1942 = float(_1857);
    bool _1944 = _1942 >= _962;
    bool _1946 = isnan(_1942);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan(_962);
    bool _1952 = _1948 || _1950;
    float _1954 = float(_1952);
    float _1956 = trunc(_1954);
    int _1958 = int(_1956);
    int _1960 = int(_1908) + int(_1938);
    float _1962 = floor(_1940);
    int _1964 = _1928 * _1960;
    int _1966 = _1964 + _1857;
    bool _1968 = uint(_1966) >= uint(_828);
    bool _1970 = !_1968;
    int _1972 = _1970 ? 0 : (-1);
    int _1974 = ~_1960;
    int _1976 = _1974 + _1972;
    int _1978 = _1976 + 1;
    float _1980 = -_1962;
    float _1982 = _1940 + _1980;
    int _1984 = ~_1958;
    int _1986 = _1984 + 1;
    int _1988 = _1986 + 1;
    float _1990 = _1982 * _962;
    int _1992 = _828 * _1978;
    int _1994 = _1992 + _1857;
    float _1996 = -_1889;
    float _1998 = _1996 + 1.0;
    bool _2000 = !_1859;
    int _2002 = _2000 ? _1994 : (-1);
    float _2004 = trunc(_1990);
    int _2006 = int(_2004);
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2010 = _2008 != 0;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2014 = _2012 != 0;
    int _2016 = _2002 * _1988;
    bool _2018 = !_2010;
    int _2020 = _2018 ? 0 : 1;
    int _2022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2024 = _2022 != 0;
    int _2026 = _1958 * _1863;
    int _2028 = _2026 + _2016;
    bool _2030 = !_2024;
    int _2032 = _2030 ? 0 : 1;
    int _2034 = abs(_892);
    int _2036 = _2028 * _1871;
    int _2038 = abs(_2020);
    int _2040 = abs(_2032);
    int _2042 = _2006 * _2038;
    int _2044 = _2042 + _1857;
    int _2046 = _1895 * _1875;
    int _2048 = _2046 + _2036;
    float _2050 = as_type<float>(_2034);
    if (_2014)
    {
        float _2052 = in.m_57.x;
        _2050 = _2052;
    }
    float _2054 = _2050;
    int _2056 = ~_828;
    int _2058 = _2056 + 1;
    int _2060 = _2044 * _2034;
    int _2062 = _2060 + _2048;
    float _2064 = in.m_67.y;
    int _2066 = _2006 * _2040;
    int _2068 = _2066 + _2062;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2072 = _2070 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2074 = in.m_67.x;
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2078 = _2076 != 0;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2080;
    float _2084 = float(uint(_2068));
    float _2086 = 1.0 / _2072;
    bool _2088 = _1066 != 0.0;
    bool _2090 = isnan(_1066);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan(0.0);
    bool _2096 = _2092 || _2094;
    float _2098 = as_type<float>(_1897) * _2084;
    int _2100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2102 = _2100 != 0;
    bool _2104 = _1064 == 0.0;
    bool _2106 = !_2096;
    bool _2108 = _2104 && _2106;
    float _2110 = trunc(_2098);
    float _2112 = precise::max(_2110, 0.0);
    uint _2114 = uint(_2112);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _2116 = _2054 > 0.5;
    bool _2118 = _2116 && _2014;
    bool _2120 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2122 = isnan(_738);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = in.m_71.x;
    float _2134 = in.m_71.y;
    float _2136 = in.m_71.z;
    bool _2138 = _1068 == 0.0;
    bool _2140 = _2138 && _2108;
    float _2142 = _2082 * _2086;
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2146 = _738 + _2144;
    float _2148 = float(uint(_2044));
    float _2150 = fma(_2142, _2146, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2152 = _2142;
    float _2154 = _2074;
    float _2156 = _2064;
    if (_2014)
    {
        _2152 = _2074;
    }
    float _2158 = _2152;
    float _2160 = as_type<float>(_1897) * _2148;
    float _2162 = _2130 * _1998;
    int _2164 = _2058 * int(_2114);
    int _2166 = _2164 + _2068;
    float _2168 = _2158;
    if (_2118)
    {
        float _2170 = -_2158;
        float _2172 = _2170 + 1.0;
        _2168 = _2172;
    }
    float _2174 = _2168;
    float _2176 = _2150 * _2162;
    float _2178 = trunc(_2160);
    float _2180 = precise::max(_2178, 0.0);
    uint _2182 = uint(_2180);
    float _2184 = float(uint(_2166));
    float _2186 = -_2130;
    float _2188 = _2186 + 1.0;
    if (_2014)
    {
        _2154 = _2174;
    }
    float _2190 = _2154;
    float _2192 = as_type<float>(_1897) * _2184;
    float _2194 = -_2064;
    float _2196 = _2194 + 1.0;
    float _2198 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2200 = _2132;
    float _2202 = _2134;
    float _2204 = _2136;
    if (!_2140)
    {
        float _2206 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2200 = _2206;
    }
    float _2208 = _2200;
    if (!_2140)
    {
        float _2210 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2134);
        _2202 = _2210;
    }
    float _2212 = _2202;
    if (!_2140)
    {
        float _2214 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2136);
        _2204 = _2214;
    }
    float _2216 = _2204;
    float _2218 = trunc(_2192);
    float _2220 = precise::max(_2218, 0.0);
    uint _2222 = uint(_2220);
    if (_2078)
    {
        float _2224 = _1877 ? _2196 : _2064;
        _2156 = _2224;
    }
    float _2226 = _2156;
    float _2228 = fma(_956, _2198, _784);
    int _2230 = ~_828;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2176);
    float _2236 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2240 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2242 = _2236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2244 = -_952;
    float _2246 = fma(_926, _2238, _2244);
    int _2248 = ~_828;
    int _2250 = _2248 + 1;
    int _2252 = _2232 * int(_2182);
    int _2254 = _2252 + _2044;
    float _2256 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2240);
    int _2258 = int(_2114) + int(_2222);
    float _2260 = abs(_1386);
    float _2262 = log2(_2260);
    float _2264 = float(uint(_2254));
    float _2266 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2234);
    float _2268 = _2246 + 0.5;
    int _2270 = _2250 * _2258;
    int _2272 = _2270 + _2068;
    float _2274 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2276 = as_type<float>(_1897) * _2264;
    float _2278 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2280 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2282 = uint(_2272) >= uint(_828);
    float _2284 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2286 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2288 = trunc(_2276);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    bool _2294 = !_2282;
    int _2296 = _2294 ? 0 : (-1);
    float _2298 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2300 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2302 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2304 = ~_2258;
    int _2306 = _2304 + _2296;
    int _2308 = _2306 + 1;
    float _2310 = _2228 + 0.5;
    out.m_73.x = _2298;
    out.m_73.y = _2286;
    out.m_73.z = _2242;
    out.m_73.w = _2280;
    float _2312 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2314 = _828 * _2308;
    int _2316 = _2314 + _2068;
    float _2318 = exp2(_2302);
    int _2320 = ~_828;
    int _2322 = _2320 + 1;
    out.m_75.x = _2310;
    out.m_75.y = _2268;
    float _2324 = -_1130;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2312);
    bool _2328 = !_1859;
    int _2330 = _2328 ? _2316 : (-1);
    float _2332 = -_1130;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2336 = int(_2182) + int(_2292);
    float _2338 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2326);
    float _2340 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2342 = _2330 & 3;
    bool _2344 = _2342 != 0;
    float _2346 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2348 = _2330 >> 31;
    int _2350 = _2322 * _2336;
    int _2352 = _2350 + _2044;
    float _2354 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2356 = -_1130;
    float _2358 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2346);
    int _2360 = _2348 & 3;
    float _2362 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    bool _2366 = uint(_2352) >= uint(_828);
    float _2368 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    int _2370 = _2330 + _2360;
    float _2372 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2374 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2376 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2334);
    int _2378 = _2370 >> 2;
    float _2380 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2372);
    float _2382 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2374);
    float _2384 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2354);
    int _2386 = _2378 << 4;
    int _2388 = _2386 + 368;
    float _2390 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2340);
    float _2392 = _2376 * _2212;
    float _2394 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2380);
    uint _2396 = uint(int(uint(_2388) >> uint(2)));
    uint _2398 = uint(int(uint(int(_2396)) >> uint(2)));
    int _2400 = int(_2396) & 3;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[int(_2398)][_2400];
    int _2404 = int(_2396) + 1;
    uint _2406 = uint(int(uint(_2404) >> uint(2)));
    int _2408 = _2404 & 3;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[int(_2406)][_2408];
    float _2412 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2382);
    float _2414 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2384);
    int _2416 = _2330 & 3;
    bool _2418 = _2416 != 0;
    float _2420 = _2364 * _2364;
    float _2422 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    bool _2424 = uint(_2416) > 1u;
    int _2426 = _2388 + 8;
    uint _2428 = uint(int(uint(_2426) >> uint(2)));
    uint _2430 = uint(int(uint(int(_2428)) >> uint(2)));
    int _2432 = int(_2428) & 3;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[int(_2430)][_2432];
    int _2436 = int(_2428) + 1;
    uint _2438 = uint(int(uint(_2436) >> uint(2)));
    int _2440 = _2436 & 3;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[int(_2438)][_2440];
    float _2444 = _2338 * _2212;
    float _2446 = fma(_2364, -2.0, 3.0);
    int _2448 = _2344 ? 0 : 1;
    float _2450 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2256);
    bool _2452 = _2416 != 3;
    float _2454 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2422);
    int _2456 = ~_2448;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    float _2462 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2390);
    bool _2464 = !_2366;
    int _2466 = _2464 ? 0 : (-1);
    float _2468 = _2368 * _2212;
    bool _2470 = uint(_2416) >= 2u;
    float _2472 = fma(_2412, _2208, _2392);
    int _2474 = _2460;
    if (!_2424)
    {
        int _2476 = ~_2448;
        int _2478 = _2476 + 1;
        _2474 = _2478;
    }
    int _2480 = _2474;
    float _2482 = fma(_2394, _2208, _2444);
    bool _2484 = !_2418;
    int _2486 = _2484 ? 0 : 1;
    float _2488 = _2420 * _2446;
    int _2490 = abs(_2480);
    float _2492 = fma(_2414, _2208, _2468);
    int _2494 = ~_2336;
    int _2496 = _2494 + _2466;
    int _2498 = _2496 + 1;
    float _2500 = fma(_2454, _2216, _2472);
    int _2502 = _2470 ? 0 : 1;
    float _2504 = in.m_77.x;
    bool _2506 = _2416 != 3;
    float _2508 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2510 = abs(_2486);
    int _2512 = _828 * _2498;
    int _2514 = _2512 + _2044;
    float _2516 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2508);
    int _2518 = ~_2502;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    float _2524 = -_1828;
    float _2526 = _2524 + 1.0;
    bool _2528 = !_2506;
    int _2530 = _2528 ? 0 : (-1);
    float _2532 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2516);
    int _2534 = _2522;
    if (_2452)
    {
        int _2536 = ~_2502;
        int _2538 = _2536 + 1;
        _2534 = _2538;
    }
    int _2540 = _2534;
    float _2542 = fma(_2450, _2216, _2482);
    int _2544 = ~_2490;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    float _2550 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2532);
    bool _2552 = !_2102;
    int _2554 = _2552 ? 0 : 1;
    float _2556 = fma(_2462, _2216, _2492);
    int _2558 = abs(_2530);
    int _2560 = _2548 * as_type<int>(_2410);
    int _2562 = abs(_2540);
    float _2564 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2566 = ~_2510;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    out.gl_Position.x = _1806;
    out.gl_Position.y = _1808;
    out.gl_Position.z = _2550;
    out.gl_Position.w = _1752;
    int _2572 = abs(_2554);
    float _2574 = _2564 * _1830;
    int _2576 = _2570 * as_type<int>(_2402);
    int _2578 = _2576 + _2560;
    int _2580 = ~_2562;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    float _2586 = -_2564;
    float _2588 = _2586 + 1.0;
    int _2590 = ~_2558;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    out.m_79.x = _2542;
    out.m_79.y = _2500;
    out.m_79.z = _2556;
    bool _2596 = _1386 <= 8000.0;
    bool _2598 = isnan(_1386);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan(8000.0);
    bool _2604 = _2600 || _2602;
    float _2606 = float(_2604);
    int _2608 = _2584 * as_type<int>(_2434);
    int _2610 = _2608 + _2578;
    float _2612 = _2550 + _1752;
    bool _2614 = !_1859;
    int _2616 = _2614 ? _2514 : (-1);
    int _2618 = _2594 * as_type<int>(_2442);
    int _2620 = _2618 + _2610;
    float _2622 = -_2488;
    float _2624 = _2622 + 1.0;
    int _2626 = ~_2572;
    int _2628 = _2626 + 1;
    int _2630 = _2628 + 1;
    float _2632 = _2612 * 0.5;
    float _2634 = fma(_2624, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2488);
    float _2636 = _1752 * 0.5;
    int _2638 = _2620 * _2630;
    float _2640 = _2606 * _2634;
    float _2642 = fma(_1808, -0.5, _2636);
    int _2644 = _2616 * _2572;
    int _2646 = _2644 + _2638;
    float _2648 = _1806 + _1752;
    float _2650 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2652 = _1851 * _2574;
    bool _2654 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2656 = isnan(_1538);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2662 = _2658 || _2660;
    float _2664 = _2648 * 0.5;
    float _2666 = _2526 * _2650;
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = _1841 * _2574;
    float _2672 = fma(_1841, _2652, _1839);
    float _2674 = float(_2646);
    float _2676 = -_2668;
    float _2678 = fma(_2676, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2664;
    out.m_81.y = _2642;
    out.m_81.z = _2632;
    out.m_81.w = _1752;
    float _2680 = fma(_1847, _2670, _1835);
    float _2682 = fma(_1849, _2670, _1837);
    float _2684 = _2678 * _2504;
    float _2686 = _1841 * _2588;
    out.m_83.x = _2674;
    float _2688 = _2670;
    float _2690 = _2588;
    float _2692 = _2652;
    float _2694 = _2574;
    float _2696 = _2674;
    float _2698 = _2684;
    if (!_2662)
    {
        _2688 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2700 = _2688;
    float _2702 = _2700;
    float _2704 = _2700;
    if (!_2662)
    {
        _2690 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2706 = _2690;
    out.m_85.x = _2680;
    out.m_85.y = _2682;
    out.m_85.z = _2672;
    out.m_85.w = _2686;
    float _2708 = _2706;
    float _2710 = _2706;
    if (!_2662)
    {
        _2692 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2712 = _2692;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2662)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2718 = _2694;
    float _2720 = _2684 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2722 = _1514 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2724 = _2718;
    float _2726 = _2718;
    if (!_2662)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2728 = _2696;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2662)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2734 = _2698;
    out.m_87.x = _2720;
    bool _2736 = !_2662;
    float _2738 = _2734;
    float _2740 = _2734;
    if (!_2736)
    {
        bool _2742 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2744 = isnan(_1538);
        bool _2746 = _2742 || _2744;
        bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2750 = _2746 || _2748;
        if (!_2750)
        {
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2754 = _1538 + _2752;
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
            _2710 = _2794;
            _2726 = _2798;
            _2704 = _2790;
            _2716 = _2796;
            _2732 = _2792;
            _2740 = _2800;
            _2802 = true;
        }
        else
        {
            bool _2804 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2806 = isnan(_1538);
            bool _2808 = _2804 || _2806;
            bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2812 = _2808 || _2810;
            if (!_2812)
            {
                _2702 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2814 = _2702;
            _2704 = _2814;
            if (!_2812)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2816 = _2708;
            _2710 = _2816;
            if (!_2812)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2818 = _2730;
            _2732 = _2818;
            if (!_2812)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2820 = _2714;
            _2716 = _2820;
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
                bool _2828 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2830 = isnan(_1538);
                bool _2832 = _2828 || _2830;
                bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2836 = _2832 || _2834;
                if (!_2836)
                {
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2840 = _1538 + _2838;
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
                    _2710 = _2880;
                    _2726 = _2884;
                    _2704 = _2876;
                    _2716 = _2882;
                    _2732 = _2878;
                    _2740 = _2886;
                    _2802 = true;
                }
                else
                {
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2704 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2802 = false;
    float _2888 = _2710;
    float _2890 = _2726;
    float _2892 = _2704;
    float _2894 = _2716;
    float _2896 = _2732;
    float _2898 = _2740;
    float _2900 = _2722 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2902 = fma(_2500, -0.5, 0.5);
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
    bool _2928 = _1514 > 0.0;
    bool _2930 = isnan(_1514);
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
        float _2962 = -_1448;
        float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2966 = -_1450;
        float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2970 = -_1452;
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
        float _3004 = _2500 * _2994;
        float _3006 = -_2994;
        float _3008 = -_3002;
        float _3010 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3008);
        float _3012 = fma(_2542, _2992, _3004);
        float _3014 = -_3000;
        float _3016 = fma(_3014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3010);
        float _3018 = fma(_2556, _3000, _3012);
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _344 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _346 = isnan(_324);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _338;
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _360 = 1.0 / _342;
    float _362 = _300 * _330;
    float _364 = _298 * _328;
    bool _366 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _368 = isnan(_324);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    bool _378 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _380 = isnan(_324);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = _334 * _356;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _394 = _324 + _392;
    float _396 = -_376;
    float _398 = _396 + 1.0;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = -_388;
    float _406 = _404 + 1.0;
    float _408 = _388 * _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = _354 * _406;
    float _420 = fma(_402, _390, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _422 = fma(_412, _390, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_416, _390, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = _394 * _360;
    float _428 = _420 * _418;
    float _430 = _422 * _418;
    float _432 = _424 * _418;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _446 = -_354;
    float _448 = _446 + 1.0;
    float _450 = fma(_436, _426, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _452 = fma(_440, _426, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _454 = fma(_444, _426, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _456 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[107].z, _428);
    float _462 = fma(_450, _408, _456);
    float _464 = fma(_452, _408, _458);
    float _466 = fma(_454, _408, _460);
    float _468 = _296 * _326;
    float _470 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[109].x, _462);
    float _472 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[109].y, _464);
    float _474 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[109].z, _466);
    bool _476 = !_358;
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
    float _560 = _534 * _556;
    float _562 = -_534;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _522;
    float _568 = _538 * _552;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _574 = fma(_568, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _572 * _566;
    float _578 = _574 * _560;
    float _580 = -_550;
    float _582 = _580 + 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = _498 + _584;
    float _588 = _470 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _590 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[115].x, _578);
    float _592 = _518 * _582;
    float _594 = fma(_576, _586, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = fma(_594, _592, _590);
    float _602 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _608 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _598;
    out.m_61.y = _608;
    out.m_61.z = _604;
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
    float _704 = _698 * _680;
    float _706 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].x, _700);
    float _708 = _702 * _680;
    float _710 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].x, _706);
    float _712 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].y, _708);
    float _714 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].z, _704);
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
    float _750 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _752 = int(_750);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _758 = _744 * _116;
    float _760 = exp2(_758);
    float _762 = _740 * 2.0;
    float _764 = _746 * 2.0;
    float _766 = _748 * 2.0;
    float _768 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _770 = floor(_762);
    float _772 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _774 = -_754;
    float _776 = fma(_768, 2.0, _774);
    float _778 = _748 + _746;
    float _780 = fma(_772, -2.0, _756);
    float _782 = -_116;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[76].x, _776);
    float _786 = floor(_764);
    float _788 = -_760;
    float _790 = _788 + 1.0;
    float _792 = _778 + (-1.0);
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = floor(_766);
    bool _798 = _770 >= 0.0;
    bool _800 = isnan(_770);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _810 = 1.0 + _808;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _814 = _812 != 0;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _822 = _820 != 0;
    int _824 = _806 ? 0 : 1;
    float _826 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _828 = int(_826);
    bool _830 = _786 > 0.0;
    bool _832 = !_818;
    int _834 = _832 ? 0 : 1;
    bool _836 = _770 > 0.0;
    bool _838 = !_814;
    int _840 = _838 ? 0 : 1;
    float _842 = 1.0 / _810;
    bool _844 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _852 = _848 || _850;
    bool _854 = _786 >= 0.0;
    bool _856 = isnan(_786);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = _796 > 0.0;
    bool _866 = _796 >= 0.0;
    bool _868 = isnan(_796);
    bool _870 = _866 || _868;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    int _876 = ~_824;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    int _882 = _880;
    if (!_836)
    {
        int _884 = ~_824;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    bool _890 = !_822;
    int _892 = _890 ? 0 : 1;
    float _894 = _852 ? _790 : 0.0;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _900 = _898 != 0;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _908 = _906 != 0;
    float _910 = float(_752);
    float _912 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _896);
    float _914 = in.m_63.x;
    float _916 = in.m_63.y;
    float _918 = in.m_63.z;
    bool _920 = !_900;
    int _922 = _920 ? 0 : 1;
    float _924 = 1.0 / _910;
    float _926 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _912);
    int _928 = _862 ? 0 : 1;
    bool _930 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _932 = isnan(1.0);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _938 = _934 || _936;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _942 = float(_888);
    int _944 = abs(_922);
    float _946 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _940);
    bool _948 = !_904;
    int _950 = _948 ? 0 : 1;
    float _952 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _780);
    float _954 = float(_944);
    float _956 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _946);
    int _958 = abs(_950);
    float _960 = _924 * _116;
    float _962 = float(_828);
    float _964 = _954 * _942;
    int _966 = ~_928;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = _746 + (-0.5);
    int _974 = _970;
    if (!_830)
    {
        int _976 = ~_928;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = _964 * (-2.0);
    float _984 = _962 * _116;
    if (_938)
    {
        float _986 = _894 * _842;
        _126 = _986;
    }
    float _988 = _126;
    int _990 = _874 ? 0 : 1;
    float _992 = fma(_982, _914, _914);
    bool _994 = !_908;
    int _996 = _994 ? 0 : 1;
    float _998 = float(_980);
    float _1000 = fma(_794, _982, _794);
    float _1002 = float(_958);
    float _1004 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[196].x, _992);
    int _1006 = ~_990;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = _1010;
    if (!_864)
    {
        int _1014 = ~_990;
        int _1016 = _1014 + 1;
        _1012 = _1016;
    }
    int _1018 = _1012;
    float _1020 = _1002 * _998;
    int _1022 = abs(_996);
    float _1024 = _748 + _740;
    float _1026 = float(_1018);
    float _1028 = fma(_1000, _988, _1004);
    float _1030 = float(_1022);
    float _1032 = _1024 + (-1.0);
    float _1034 = _1020 * (-2.0);
    float _1036 = _1028 * 0.15915493667125701904296875;
    float _1038 = _1030 * _1026;
    float _1040 = _748 + (-0.5);
    float _1042 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1044 = fma(_1034, _916, _916);
    float _1046 = _740 + _746;
    float _1048 = fma(_1042, _1034, _1042);
    float _1050 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1044);
    float _1052 = _1046 + (-1.0);
    float _1054 = _1038 * (-2.0);
    float _1056 = _740 + (-0.5);
    float _1058 = fma(_1048, _988, _1050);
    float _1060 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1062 = fma(_1054, _918, _918);
    float _1064 = in.m_65.x;
    float _1066 = in.m_65.y;
    float _1068 = in.m_65.z;
    float _1070 = _1036 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = fma(_1060, _1054, _1060);
    float _1076 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    float _1078 = _1058 * 0.15915493667125701904296875;
    float _1080 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1082 = fma(_1074, _988, _1076);
    float _1084 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1086 = _1036 * 6.283185482025146484375;
    float _1088 = cos(_1086);
    float _1090 = _1078 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1082 * 0.15915493667125701904296875;
    float _1096 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = in.m_46.x;
    float _1100 = in.m_46.y;
    float _1102 = in.m_46.z;
    float _1104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1064);
    float _1106 = _1078 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1066);
    float _1112 = _1096 * _1104;
    float _1114 = _1080 * _1110;
    float _1116 = _1094 * 6.283185482025146484375;
    float _1118 = cos(_1116);
    float _1120 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1122 = _1072 * _1092;
    float _1124 = _1084 * _1120;
    float _1126 = _1088 * _1092;
    float _1128 = _1094 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _1088 * _1108;
    float _1134 = _1072 * _1108;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1138 = _1088 * _1118;
    float _1140 = _1072 * _1118;
    float _1142 = _1108 * _1118;
    float _1144 = _1092 * _1118;
    float _1146 = _1138 * _1114;
    float _1148 = _1140 * _1114;
    float _1150 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1136);
    float _1152 = fma(_1130, _1132, _1122);
    float _1154 = -_1126;
    float _1156 = fma(_1130, _1134, _1154);
    float _1158 = -_1134;
    float _1160 = fma(_1130, _1126, _1158);
    float _1162 = -_1114;
    float _1164 = _1130 * _1162;
    float _1166 = fma(_1152, _1112, _1146);
    float _1168 = fma(_1156, _1112, _1148);
    float _1170 = fma(_1130, _1122, _1132);
    float _1172 = fma(_1142, _1112, _1164);
    float _1174 = fma(_1160, _1124, _1166);
    float _1176 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1178 = fma(_1170, _1124, _1168);
    float _1180 = fma(_1144, _1124, _1172);
    float _1182 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1184 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1186 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1176);
    float _1188 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1190 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1182);
    float _1192 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1184);
    float _1194 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1186);
    float _1196 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1188);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1190);
    float _1200 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1192);
    float _1202 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1204 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1196);
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1210 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1150);
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1214 = _1202 + _1206;
    float _1216 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1218 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1220 = _1208 + _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1214 + _1222;
    float _1226 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1216);
    float _1228 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1232 = _1220 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1226);
    float _1238 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1228);
    float _1240 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1242 = fma(_1232, _1232, _1234);
    float _1244 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1246 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1238);
    float _1248 = sqrt(_1242);
    float _1250 = _1218 + _1244;
    float _1252 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1254 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = _1102;
    float _1258 = _1238;
    float _1260 = _1250;
    float _1262 = _1252;
    float _1264 = _1240;
    float _1266 = _1208;
    if (!_1254)
    {
        _1256 = _1220;
    }
    float _1268 = _1256;
    float _1270 = _1268;
    if (!_1254)
    {
        _1258 = _1214;
    }
    float _1272 = _1258;
    bool _1274 = !_1254;
    float _1276 = _1272;
    if (!_1274)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1282 = _1248 + _1280;
        float _1284 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
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
        float _1306 = fma(_1250, _1294, _1302);
        float _1308 = _1286 * _1304;
        float _1310 = fma(_1232, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1224, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1260 = _1306;
        _1270 = _1310;
        _1276 = _1312;
    }
    float _1314 = _1260;
    float _1316 = _1270;
    float _1318 = _1276;
    float _1320 = -_1218;
    float _1322 = _1320 + _1314;
    float _1324 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1240);
    float _1326 = -_1208;
    float _1328 = _1326 + _1316;
    float _1330 = 1.0 / _1252;
    float _1332 = _1322 * _1322;
    float _1334 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1324);
    float _1336 = -_1202;
    float _1338 = _1336 + _1318;
    float _1340 = fma(_1328, _1328, _1332);
    float _1342 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1344 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1346 = isnan(0.5);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1352 = _1348 || _1350;
    float _1354 = fma(_1338, _1338, _1340);
    float _1356 = _1342 + _1252;
    float _1358 = sqrt(_1354);
    float _1360 = _1356 * _1330;
    float _1362 = _1360 * 0.5;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1366 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1364);
    float _1368 = _1314;
    float _1370 = _1318;
    float _1372 = _1366;
    float _1374 = _1354;
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1352)
    {
        _1262 = 1.0;
    }
    float _1378 = _1262;
    float _1380 = 1.0 / _1366;
    bool _1382 = _1358 > 0.0;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1386 = _1380 * _1384;
    float _1388 = _1358;
    float _1390 = _1378;
    if (!_1382)
    {
        _1388 = _1316;
    }
    float _1392 = _1388;
    bool _1394 = !_1382;
    float _1396 = _1392;
    if (!_1394)
    {
        float _1398 = _188 * _188;
        float _1400 = rsqrt(_1354);
        float _1402 = fma(_186, _186, _1398);
        float _1404 = fma(_190, _190, _1402);
        float _1406 = sqrt(_1404);
        float _1408 = _1328 * _1400;
        float _1410 = _1322 * _1400;
        float _1412 = _1338 * _1400;
        bool _1414 = _1406 > 0.0;
        float _1416 = _1406;
        _1372 = _1404;
        _1374 = _1400;
        _1376 = _1410;
        _1264 = _1412;
        if (!_1414)
        {
            _1416 = _1316;
        }
        float _1418 = _1416;
        bool _1420 = !_1414;
        _1396 = _1418;
        if (!_1420)
        {
            float _1422 = rsqrt(_1404);
            float _1424 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1426 = _188 * _1422;
            float _1428 = _186 * _1422;
            float _1430 = _1410 * _1426;
            float _1432 = _190 * _1422;
            float _1434 = fma(_1408, _1428, _1430);
            float _1436 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1438 = fma(_1412, _1432, _1434);
            float _1440 = _1438 * _1436;
            float _1442 = fma(_186, _1440, _1316);
            float _1444 = fma(_188, _1440, _1314);
            float _1446 = fma(_190, _1440, _1318);
            _1368 = _1444;
            _1396 = _1442;
            _1370 = _1446;
            _1372 = _1422;
        }
    }
    float _1448 = _1368;
    float _1450 = _1396;
    float _1452 = _1370;
    float _1454 = _1372;
    float _1456 = _1374;
    float _1458 = _1376;
    float _1460 = _1264;
    float _1462 = _1458;
    float _1464 = _1460;
    if (!_1352)
    {
        float _1466 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1468 = _1466 * 0.15915493667125701904296875;
        float _1470 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1472 = _1468 * 6.283185482025146484375;
        float _1474 = cos(_1472);
        float _1476 = _1470 * 0.15915493667125701904296875;
        float _1478 = _1468 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = 1.0 / _1474;
        float _1484 = _1476 * 6.283185482025146484375;
        float _1486 = cos(_1484);
        float _1488 = _1480 * _1482;
        float _1490 = _1476 * 6.283185482025146484375;
        float _1492 = sin(_1490);
        float _1494 = _1486 * _1488;
        float _1496 = 1.0 / _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1500 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1498;
        float _1502 = 1.0 / _1500;
        float _1504 = _1492 * _1496;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1508 = fma(_1386, _1504, _1506);
        float _1510 = _1508 * _1502;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1390 = _1512;
    }
    float _1514 = _1390;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1448 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1450 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1452 + _1524;
    float _1528 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1530 = _1518 * _1518;
    float _1532 = fma(_1522, _1522, _1530);
    float _1534 = fma(_1526, _1526, _1532);
    float _1536 = rsqrt(_1534);
    float _1538 = sqrt(_1534);
    float _1540 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1542 = _1522 * _1540;
    float _1544 = _1526 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 + _1548;
    float _1552 = sqrt(_1550);
    bool _1554 = _1552 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1552 + _1556;
    float _1560 = _1454;
    float _1562 = _1550;
    float _1564 = _1558;
    float _1566 = _1542;
    float _1568 = _1544;
    float _1570 = _1546;
    float _1572 = _1548;
    if (_1554)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1574;
    }
    float _1576 = _1560;
    if (_1554)
    {
        float _1578 = rsqrt(_1550);
        _1562 = _1578;
    }
    float _1580 = _1562;
    if (_1554)
    {
        float _1582 = _1558 * _1576;
        _1564 = _1582;
    }
    float _1584 = _1564;
    if (_1554)
    {
        float _1586 = _1584 * 0.15915493667125701904296875;
        _1462 = _1586;
    }
    float _1588 = _1462;
    float _1590 = _1456;
    if (_1554)
    {
        float _1592 = _1588 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        _1590 = _1594;
    }
    float _1596 = _1590;
    float _1598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1600 = precise::max(0.0, _1598);
    float _1602 = _1576;
    if (_1554)
    {
        float _1604 = _1588 * 6.283185482025146484375;
        float _1606 = cos(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = -_1540;
    float _1612 = -_1600;
    float _1614 = fma(_1518, _1610, _1612);
    if (_1554)
    {
        float _1616 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1616;
    }
    float _1618 = _1464;
    float _1620 = fma(_1208, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1622 = _1618;
    float _1624 = _1596;
    if (_1554)
    {
        float _1626 = fma(_1596, _1618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1622 = _1626;
    }
    float _1628 = _1622;
    float _1630 = _1628;
    if (!_1554)
    {
        _1624 = _1614;
    }
    float _1632 = _1624;
    float _1634 = floor(_1620);
    float _1636 = _1632;
    if (_1554)
    {
        float _1638 = _1608 + (-1.0);
        _1266 = _1638;
    }
    float _1640 = _1266;
    float _1642 = _1640;
    if (_1554)
    {
        float _1644 = _1580 * _1628;
        _1630 = _1644;
    }
    float _1646 = _1630;
    if (_1554)
    {
        float _1648 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1648;
    }
    float _1650 = _1642;
    if (_1554)
    {
        float _1652 = _1542 * _1646;
        _1566 = _1652;
    }
    float _1654 = _1566;
    if (_1554)
    {
        float _1656 = _1544 * _1646;
        _1568 = _1656;
    }
    float _1658 = _1568;
    float _1660 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1554)
    {
        float _1662 = fma(_1614, _1608, _1650);
        _1636 = _1662;
    }
    float _1664 = _1636;
    if (_1554)
    {
        float _1666 = _1654 * _1654;
        _1570 = _1666;
    }
    float _1668 = _1570;
    if (_1554)
    {
        float _1670 = _1658 * _1658;
        _1572 = _1670;
    }
    float _1672 = _1572;
    float _1674 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1660);
    float _1676 = fma(_1664, _1664, _1668);
    float _1678 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1528);
    float _1680 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1674);
    float _1682 = _1676 + _1672;
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1686 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1690 = fma(_1202, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1692 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1694 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1688);
    float _1696 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1698 = floor(_1690);
    float _1700 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1692);
    float _1702 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1694);
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1706 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1704);
    float _1708 = precise::clamp(_1706, 0.0, 1.0);
    float _1710 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1714 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1716 = -_1708;
    float _1718 = _1716 + 1.0;
    float _1720 = rsqrt(_1682);
    float _1722 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1724 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1678);
    float _1726 = -_1634;
    float _1728 = _1620 + _1726;
    float _1730 = -_1710;
    float _1732 = fma(_1730, _1684, 1.0);
    float _1734 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1722);
    float _1736 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1738 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1740 = abs(_1718);
    float _1742 = log2(_1740);
    float _1744 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1746 = -_1698;
    float _1748 = _1690 + _1746;
    float _1750 = _1720 * _1654;
    float _1752 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1744);
    float _1754 = _1720 * _1664;
    float _1756 = _1720 * _1658;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1760 = log2(_1732);
    float _1762 = -_1758;
    float _1764 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = -_1756;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1772 = 1.0 / _1752;
    float _1774 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1776 = fma(_1770, -0.5, 0.5);
    float _1778 = fma(_1770, 0.5, 0.5);
    float _1780 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1774);
    float _1782 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1738);
    float _1784 = _1754 + 1.0;
    float _1786 = exp2(_1766);
    float _1788 = fma(_1778, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1790 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1780);
    float _1792 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1782);
    float _1794 = _1760 * 0.693147182464599609375;
    float _1796 = fma(_1778, _1788, -0.212114393711090087890625);
    float _1798 = sqrt(_1776);
    float _1800 = fma(_1778, _1796, 1.570728778839111328125);
    float _1802 = -_1754;
    float _1804 = fma(_1786, _1784, _1802);
    float _1806 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1790);
    float _1808 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1810 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = _1806 * _1772;
    float _1814 = _1808 * _1772;
    float _1816 = _1798 * 0.636619746685028076171875;
    float _1818 = fma(_1812, 0.5, 0.5);
    float _1820 = fma(_1814, -0.5, 0.5);
    float _1822 = -_1800;
    float _1824 = fma(_1816, _1822, 1.0);
    float _1826 = fma(_1804, 0.5, 0.5);
    float2 _5814 = float2(_1728, _1748);
    float _1828 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5814, float2(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5814, float2(0.0), isnan(_5814)), level(0.0)).x;
    float3 _5825 = float3(_1818, _1820, _1810);
    float _1830 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5825, float3(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5825, float3(0.0), isnan(_5825)), level(0.0)).x;
    float3 _5836 = float3(_1818, _1820, _1810);
    float4 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5836, float3(0.0), isnan(_5836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5836, float3(0.0), isnan(_5836)), level(0.0)).xyzw;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = _1833.w;
    float2 _5852 = float2(_1824, _1826);
    float3 _1845 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5852, float2(0.0), isnan(_5852)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5852, float2(0.0), isnan(_5852)), level(0.0)).xyz;
    float _1847 = _1845.x;
    float _1849 = _1845.y;
    float _1851 = _1845.z;
    float _1853 = float(uint(_828));
    float _1855 = trunc(_960);
    int _1857 = int(_1855);
    bool _1859 = _828 == 0;
    float _1861 = _984 * _168;
    int _1863 = _828 + (-1);
    float _1865 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1867 = ~_828;
    int _1869 = _1867 + 1;
    int _1871 = abs(_834);
    float _1873 = 1.0 / _1853;
    int _1875 = abs(_840);
    bool _1877 = _748 > 0.5;
    bool _1879 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1881 = isnan(_738);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    float _1891 = float(uint(_1857));
    float _1893 = trunc(_1861);
    int _1895 = int(_1893);
    int _1897 = as_type<int>(_1873) + (-2);
    float _1899 = exp2(_1865);
    float _1901 = as_type<float>(_1897) * _1891;
    float _1903 = trunc(_1901);
    float _1905 = precise::max(_1903, 0.0);
    uint _1908 = uint(_1905);
    float _1910 = -_1899;
    float _1912 = _1910 + 1.0;
    int _1914 = _1869 * int(_1908);
    int _1916 = _1914 + _1857;
    float _1918 = float(uint(_1916));
    float _1920 = as_type<float>(_1897) * _1918;
    int _1922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1924 = _1922 != 0;
    int _1926 = ~_828;
    int _1928 = _1926 + 1;
    bool _1930 = !_1924;
    float _1932 = _1930 ? 7.345489978790283203125 : 1.0;
    float _1934 = trunc(_1920);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    float _1940 = _1932 * _746;
    float _1942 = float(_1857);
    bool _1944 = _1942 >= _962;
    bool _1946 = isnan(_1942);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan(_962);
    bool _1952 = _1948 || _1950;
    float _1954 = float(_1952);
    float _1956 = trunc(_1954);
    int _1958 = int(_1956);
    int _1960 = int(_1908) + int(_1938);
    float _1962 = floor(_1940);
    int _1964 = _1928 * _1960;
    int _1966 = _1964 + _1857;
    bool _1968 = uint(_1966) >= uint(_828);
    bool _1970 = !_1968;
    int _1972 = _1970 ? 0 : (-1);
    int _1974 = ~_1960;
    int _1976 = _1974 + _1972;
    int _1978 = _1976 + 1;
    float _1980 = -_1962;
    float _1982 = _1940 + _1980;
    int _1984 = ~_1958;
    int _1986 = _1984 + 1;
    int _1988 = _1986 + 1;
    float _1990 = _1982 * _962;
    int _1992 = _828 * _1978;
    int _1994 = _1992 + _1857;
    float _1996 = -_1889;
    float _1998 = _1996 + 1.0;
    bool _2000 = !_1859;
    int _2002 = _2000 ? _1994 : (-1);
    float _2004 = trunc(_1990);
    int _2006 = int(_2004);
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2010 = _2008 != 0;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2014 = _2012 != 0;
    int _2016 = _2002 * _1988;
    bool _2018 = !_2010;
    int _2020 = _2018 ? 0 : 1;
    int _2022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2024 = _2022 != 0;
    int _2026 = _1958 * _1863;
    int _2028 = _2026 + _2016;
    bool _2030 = !_2024;
    int _2032 = _2030 ? 0 : 1;
    int _2034 = abs(_892);
    int _2036 = _2028 * _1871;
    int _2038 = abs(_2020);
    int _2040 = abs(_2032);
    int _2042 = _2006 * _2038;
    int _2044 = _2042 + _1857;
    int _2046 = _1895 * _1875;
    int _2048 = _2046 + _2036;
    float _2050 = as_type<float>(_2034);
    if (_2014)
    {
        float _2052 = in.m_57.x;
        _2050 = _2052;
    }
    float _2054 = _2050;
    int _2056 = ~_828;
    int _2058 = _2056 + 1;
    int _2060 = _2044 * _2034;
    int _2062 = _2060 + _2048;
    float _2064 = in.m_67.y;
    int _2066 = _2006 * _2040;
    int _2068 = _2066 + _2062;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2072 = _2070 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2074 = in.m_67.x;
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2078 = _2076 != 0;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2080;
    float _2084 = float(uint(_2068));
    float _2086 = 1.0 / _2072;
    bool _2088 = _1066 != 0.0;
    bool _2090 = isnan(_1066);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan(0.0);
    bool _2096 = _2092 || _2094;
    float _2098 = as_type<float>(_1897) * _2084;
    int _2100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2102 = _2100 != 0;
    bool _2104 = _1064 == 0.0;
    bool _2106 = !_2096;
    bool _2108 = _2104 && _2106;
    float _2110 = trunc(_2098);
    float _2112 = precise::max(_2110, 0.0);
    uint _2114 = uint(_2112);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _2116 = _2054 > 0.5;
    bool _2118 = _2116 && _2014;
    bool _2120 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2122 = isnan(_738);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = in.m_71.x;
    float _2134 = in.m_71.y;
    float _2136 = in.m_71.z;
    bool _2138 = _1068 == 0.0;
    bool _2140 = _2138 && _2108;
    float _2142 = _2082 * _2086;
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2146 = _738 + _2144;
    float _2148 = float(uint(_2044));
    float _2150 = fma(_2142, _2146, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2152 = _2142;
    float _2154 = _2074;
    float _2156 = _2064;
    if (_2014)
    {
        _2152 = _2074;
    }
    float _2158 = _2152;
    float _2160 = as_type<float>(_1897) * _2148;
    float _2162 = _2130 * _1998;
    int _2164 = _2058 * int(_2114);
    int _2166 = _2164 + _2068;
    float _2168 = _2158;
    if (_2118)
    {
        float _2170 = -_2158;
        float _2172 = _2170 + 1.0;
        _2168 = _2172;
    }
    float _2174 = _2168;
    float _2176 = _2150 * _2162;
    float _2178 = trunc(_2160);
    float _2180 = precise::max(_2178, 0.0);
    uint _2182 = uint(_2180);
    float _2184 = float(uint(_2166));
    float _2186 = -_2130;
    float _2188 = _2186 + 1.0;
    if (_2014)
    {
        _2154 = _2174;
    }
    float _2190 = _2154;
    float _2192 = as_type<float>(_1897) * _2184;
    float _2194 = -_2064;
    float _2196 = _2194 + 1.0;
    float _2198 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2200 = _2132;
    float _2202 = _2134;
    float _2204 = _2136;
    if (!_2140)
    {
        float _2206 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2200 = _2206;
    }
    float _2208 = _2200;
    if (!_2140)
    {
        float _2210 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2134);
        _2202 = _2210;
    }
    float _2212 = _2202;
    if (!_2140)
    {
        float _2214 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2136);
        _2204 = _2214;
    }
    float _2216 = _2204;
    float _2218 = trunc(_2192);
    float _2220 = precise::max(_2218, 0.0);
    uint _2222 = uint(_2220);
    if (_2078)
    {
        float _2224 = _1877 ? _2196 : _2064;
        _2156 = _2224;
    }
    float _2226 = _2156;
    float _2228 = fma(_956, _2198, _784);
    int _2230 = ~_828;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2176);
    float _2236 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2240 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2242 = _2236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2244 = -_952;
    float _2246 = fma(_926, _2238, _2244);
    int _2248 = ~_828;
    int _2250 = _2248 + 1;
    int _2252 = _2232 * int(_2182);
    int _2254 = _2252 + _2044;
    float _2256 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2240);
    int _2258 = int(_2114) + int(_2222);
    float _2260 = abs(_1386);
    float _2262 = log2(_2260);
    float _2264 = float(uint(_2254));
    float _2266 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2234);
    float _2268 = _2246 + 0.5;
    int _2270 = _2250 * _2258;
    int _2272 = _2270 + _2068;
    float _2274 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2276 = as_type<float>(_1897) * _2264;
    float _2278 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2280 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2282 = uint(_2272) >= uint(_828);
    float _2284 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2286 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2288 = trunc(_2276);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    bool _2294 = !_2282;
    int _2296 = _2294 ? 0 : (-1);
    float _2298 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2300 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2302 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2304 = ~_2258;
    int _2306 = _2304 + _2296;
    int _2308 = _2306 + 1;
    float _2310 = _2228 + 0.5;
    out.m_73.x = _2298;
    out.m_73.y = _2286;
    out.m_73.z = _2242;
    out.m_73.w = _2280;
    float _2312 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2314 = _828 * _2308;
    int _2316 = _2314 + _2068;
    float _2318 = exp2(_2302);
    int _2320 = ~_828;
    int _2322 = _2320 + 1;
    out.m_75.x = _2310;
    out.m_75.y = _2268;
    float _2324 = -_1130;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2312);
    bool _2328 = !_1859;
    int _2330 = _2328 ? _2316 : (-1);
    float _2332 = -_1130;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2336 = int(_2182) + int(_2292);
    float _2338 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2326);
    float _2340 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2342 = _2330 & 3;
    bool _2344 = _2342 != 0;
    float _2346 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2348 = _2330 >> 31;
    int _2350 = _2322 * _2336;
    int _2352 = _2350 + _2044;
    float _2354 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2356 = -_1130;
    float _2358 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2346);
    int _2360 = _2348 & 3;
    float _2362 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    bool _2366 = uint(_2352) >= uint(_828);
    float _2368 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    int _2370 = _2330 + _2360;
    float _2372 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2374 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2376 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2334);
    int _2378 = _2370 >> 2;
    float _2380 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2372);
    float _2382 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2374);
    float _2384 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2354);
    int _2386 = _2378 << 4;
    int _2388 = _2386 + 368;
    float _2390 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2340);
    float _2392 = _2376 * _2212;
    float _2394 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2380);
    uint _2396 = uint(int(uint(_2388) >> uint(2)));
    uint _2398 = uint(int(uint(int(_2396)) >> uint(2)));
    int _2400 = int(_2396) & 3;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[int(_2398)][_2400];
    int _2404 = int(_2396) + 1;
    uint _2406 = uint(int(uint(_2404) >> uint(2)));
    int _2408 = _2404 & 3;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[int(_2406)][_2408];
    float _2412 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2382);
    float _2414 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2384);
    int _2416 = _2330 & 3;
    bool _2418 = _2416 != 0;
    float _2420 = _2364 * _2364;
    float _2422 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    bool _2424 = uint(_2416) > 1u;
    int _2426 = _2388 + 8;
    uint _2428 = uint(int(uint(_2426) >> uint(2)));
    uint _2430 = uint(int(uint(int(_2428)) >> uint(2)));
    int _2432 = int(_2428) & 3;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[int(_2430)][_2432];
    int _2436 = int(_2428) + 1;
    uint _2438 = uint(int(uint(_2436) >> uint(2)));
    int _2440 = _2436 & 3;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[int(_2438)][_2440];
    float _2444 = _2338 * _2212;
    float _2446 = fma(_2364, -2.0, 3.0);
    int _2448 = _2344 ? 0 : 1;
    float _2450 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2256);
    bool _2452 = _2416 != 3;
    float _2454 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2422);
    int _2456 = ~_2448;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    float _2462 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2390);
    bool _2464 = !_2366;
    int _2466 = _2464 ? 0 : (-1);
    float _2468 = _2368 * _2212;
    bool _2470 = uint(_2416) >= 2u;
    float _2472 = fma(_2412, _2208, _2392);
    int _2474 = _2460;
    if (!_2424)
    {
        int _2476 = ~_2448;
        int _2478 = _2476 + 1;
        _2474 = _2478;
    }
    int _2480 = _2474;
    float _2482 = fma(_2394, _2208, _2444);
    bool _2484 = !_2418;
    int _2486 = _2484 ? 0 : 1;
    float _2488 = _2420 * _2446;
    int _2490 = abs(_2480);
    float _2492 = fma(_2414, _2208, _2468);
    int _2494 = ~_2336;
    int _2496 = _2494 + _2466;
    int _2498 = _2496 + 1;
    float _2500 = fma(_2454, _2216, _2472);
    int _2502 = _2470 ? 0 : 1;
    float _2504 = in.m_77.x;
    bool _2506 = _2416 != 3;
    float _2508 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2510 = abs(_2486);
    int _2512 = _828 * _2498;
    int _2514 = _2512 + _2044;
    float _2516 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2508);
    int _2518 = ~_2502;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    float _2524 = -_1828;
    float _2526 = _2524 + 1.0;
    bool _2528 = !_2506;
    int _2530 = _2528 ? 0 : (-1);
    float _2532 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2516);
    int _2534 = _2522;
    if (_2452)
    {
        int _2536 = ~_2502;
        int _2538 = _2536 + 1;
        _2534 = _2538;
    }
    int _2540 = _2534;
    float _2542 = fma(_2450, _2216, _2482);
    int _2544 = ~_2490;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    float _2550 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2532);
    bool _2552 = !_2102;
    int _2554 = _2552 ? 0 : 1;
    float _2556 = fma(_2462, _2216, _2492);
    int _2558 = abs(_2530);
    int _2560 = _2548 * as_type<int>(_2410);
    int _2562 = abs(_2540);
    float _2564 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2566 = ~_2510;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    out.gl_Position.x = _1806;
    out.gl_Position.y = _1808;
    out.gl_Position.z = _2550;
    out.gl_Position.w = _1752;
    int _2572 = abs(_2554);
    float _2574 = _2564 * _1830;
    int _2576 = _2570 * as_type<int>(_2402);
    int _2578 = _2576 + _2560;
    int _2580 = ~_2562;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    float _2586 = -_2564;
    float _2588 = _2586 + 1.0;
    int _2590 = ~_2558;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    out.m_79.x = _2542;
    out.m_79.y = _2500;
    out.m_79.z = _2556;
    bool _2596 = _1386 <= 8000.0;
    bool _2598 = isnan(_1386);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan(8000.0);
    bool _2604 = _2600 || _2602;
    float _2606 = float(_2604);
    int _2608 = _2584 * as_type<int>(_2434);
    int _2610 = _2608 + _2578;
    float _2612 = _2550 + _1752;
    bool _2614 = !_1859;
    int _2616 = _2614 ? _2514 : (-1);
    int _2618 = _2594 * as_type<int>(_2442);
    int _2620 = _2618 + _2610;
    float _2622 = -_2488;
    float _2624 = _2622 + 1.0;
    int _2626 = ~_2572;
    int _2628 = _2626 + 1;
    int _2630 = _2628 + 1;
    float _2632 = _2612 * 0.5;
    float _2634 = fma(_2624, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2488);
    float _2636 = _1752 * 0.5;
    int _2638 = _2620 * _2630;
    float _2640 = _2606 * _2634;
    float _2642 = fma(_1808, -0.5, _2636);
    int _2644 = _2616 * _2572;
    int _2646 = _2644 + _2638;
    float _2648 = _1806 + _1752;
    float _2650 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2652 = _1851 * _2574;
    bool _2654 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2656 = isnan(_1538);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2662 = _2658 || _2660;
    float _2664 = _2648 * 0.5;
    float _2666 = _2526 * _2650;
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = _1841 * _2574;
    float _2672 = fma(_1841, _2652, _1839);
    float _2674 = float(_2646);
    float _2676 = -_2668;
    float _2678 = fma(_2676, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2664;
    out.m_81.y = _2642;
    out.m_81.z = _2632;
    out.m_81.w = _1752;
    float _2680 = fma(_1847, _2670, _1835);
    float _2682 = fma(_1849, _2670, _1837);
    float _2684 = _2678 * _2504;
    float _2686 = _1841 * _2588;
    out.m_83.x = _2674;
    float _2688 = _2670;
    float _2690 = _2588;
    float _2692 = _2652;
    float _2694 = _2574;
    float _2696 = _2674;
    float _2698 = _2684;
    if (!_2662)
    {
        _2688 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2700 = _2688;
    float _2702 = _2700;
    float _2704 = _2700;
    if (!_2662)
    {
        _2690 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2706 = _2690;
    out.m_85.x = _2680;
    out.m_85.y = _2682;
    out.m_85.z = _2672;
    out.m_85.w = _2686;
    float _2708 = _2706;
    float _2710 = _2706;
    if (!_2662)
    {
        _2692 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2712 = _2692;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2662)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2718 = _2694;
    float _2720 = _2684 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2722 = _1514 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2724 = _2718;
    float _2726 = _2718;
    if (!_2662)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2728 = _2696;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2662)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2734 = _2698;
    out.m_87.x = _2720;
    bool _2736 = !_2662;
    float _2738 = _2734;
    float _2740 = _2734;
    if (!_2736)
    {
        bool _2742 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2744 = isnan(_1538);
        bool _2746 = _2742 || _2744;
        bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2750 = _2746 || _2748;
        if (!_2750)
        {
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2754 = _1538 + _2752;
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
            _2710 = _2794;
            _2726 = _2798;
            _2704 = _2790;
            _2716 = _2796;
            _2732 = _2792;
            _2740 = _2800;
            _2802 = true;
        }
        else
        {
            bool _2804 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2806 = isnan(_1538);
            bool _2808 = _2804 || _2806;
            bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2812 = _2808 || _2810;
            if (!_2812)
            {
                _2702 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2814 = _2702;
            _2704 = _2814;
            if (!_2812)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2816 = _2708;
            _2710 = _2816;
            if (!_2812)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2818 = _2730;
            _2732 = _2818;
            if (!_2812)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2820 = _2714;
            _2716 = _2820;
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
                bool _2828 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2830 = isnan(_1538);
                bool _2832 = _2828 || _2830;
                bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2836 = _2832 || _2834;
                if (!_2836)
                {
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2840 = _1538 + _2838;
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
                    _2710 = _2880;
                    _2726 = _2884;
                    _2704 = _2876;
                    _2716 = _2882;
                    _2732 = _2878;
                    _2740 = _2886;
                    _2802 = true;
                }
                else
                {
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2704 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2802 = false;
    float _2888 = _2710;
    float _2890 = _2726;
    float _2892 = _2704;
    float _2894 = _2716;
    float _2896 = _2732;
    float _2898 = _2740;
    float _2900 = _2722 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2902 = fma(_2500, -0.5, 0.5);
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
    bool _2928 = _1514 > 0.0;
    bool _2930 = isnan(_1514);
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
        float _2962 = -_1448;
        float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2966 = -_1450;
        float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2970 = -_1452;
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
        float _3004 = _2500 * _2994;
        float _3006 = -_2994;
        float _3008 = -_3002;
        float _3010 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3008);
        float _3012 = fma(_2542, _2992, _3004);
        float _3014 = -_3000;
        float _3016 = fma(_3014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3010);
        float _3018 = fma(_2556, _3000, _3012);
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
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
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _344 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _346 = isnan(_324);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _338;
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _360 = 1.0 / _342;
    float _362 = _300 * _330;
    float _364 = _298 * _328;
    bool _366 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _368 = isnan(_324);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    bool _378 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _380 = isnan(_324);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = _334 * _356;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _394 = _324 + _392;
    float _396 = -_376;
    float _398 = _396 + 1.0;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = -_388;
    float _406 = _404 + 1.0;
    float _408 = _388 * _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = _354 * _406;
    float _420 = fma(_402, _390, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _422 = fma(_412, _390, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_416, _390, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = _394 * _360;
    float _428 = _420 * _418;
    float _430 = _422 * _418;
    float _432 = _424 * _418;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _446 = -_354;
    float _448 = _446 + 1.0;
    float _450 = fma(_436, _426, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _452 = fma(_440, _426, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _454 = fma(_444, _426, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _456 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[107].z, _428);
    float _462 = fma(_450, _408, _456);
    float _464 = fma(_452, _408, _458);
    float _466 = fma(_454, _408, _460);
    float _468 = _296 * _326;
    float _470 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[109].x, _462);
    float _472 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[109].y, _464);
    float _474 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[109].z, _466);
    bool _476 = !_358;
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
    float _560 = _534 * _556;
    float _562 = -_534;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _522;
    float _568 = _538 * _552;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _574 = fma(_568, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _572 * _566;
    float _578 = _574 * _560;
    float _580 = -_550;
    float _582 = _580 + 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = _498 + _584;
    float _588 = _470 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _590 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[115].x, _578);
    float _592 = _518 * _582;
    float _594 = fma(_576, _586, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = fma(_594, _592, _590);
    float _602 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _608 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _598;
    out.m_61.y = _608;
    out.m_61.z = _604;
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
    float _704 = _698 * _680;
    float _706 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].x, _700);
    float _708 = _702 * _680;
    float _710 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[124].x, _706);
    float _712 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].y, _708);
    float _714 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[123].z, _704);
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
    float _750 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _752 = int(_750);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _758 = _744 * _116;
    float _760 = exp2(_758);
    float _762 = _740 * 2.0;
    float _764 = _746 * 2.0;
    float _766 = _748 * 2.0;
    float _768 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _770 = floor(_762);
    float _772 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _774 = -_754;
    float _776 = fma(_768, 2.0, _774);
    float _778 = _748 + _746;
    float _780 = fma(_772, -2.0, _756);
    float _782 = -_116;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[76].x, _776);
    float _786 = floor(_764);
    float _788 = -_760;
    float _790 = _788 + 1.0;
    float _792 = _778 + (-1.0);
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = floor(_766);
    bool _798 = _770 >= 0.0;
    bool _800 = isnan(_770);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _810 = 1.0 + _808;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _814 = _812 != 0;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _822 = _820 != 0;
    int _824 = _806 ? 0 : 1;
    float _826 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _828 = int(_826);
    bool _830 = _786 > 0.0;
    bool _832 = !_818;
    int _834 = _832 ? 0 : 1;
    bool _836 = _770 > 0.0;
    bool _838 = !_814;
    int _840 = _838 ? 0 : 1;
    float _842 = 1.0 / _810;
    bool _844 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _852 = _848 || _850;
    bool _854 = _786 >= 0.0;
    bool _856 = isnan(_786);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = _796 > 0.0;
    bool _866 = _796 >= 0.0;
    bool _868 = isnan(_796);
    bool _870 = _866 || _868;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    int _876 = ~_824;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    int _882 = _880;
    if (!_836)
    {
        int _884 = ~_824;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    bool _890 = !_822;
    int _892 = _890 ? 0 : 1;
    float _894 = _852 ? _790 : 0.0;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _900 = _898 != 0;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _908 = _906 != 0;
    float _910 = float(_752);
    float _912 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _896);
    float _914 = in.m_63.x;
    float _916 = in.m_63.y;
    float _918 = in.m_63.z;
    bool _920 = !_900;
    int _922 = _920 ? 0 : 1;
    float _924 = 1.0 / _910;
    float _926 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _912);
    int _928 = _862 ? 0 : 1;
    bool _930 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _932 = isnan(1.0);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _938 = _934 || _936;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _942 = float(_888);
    int _944 = abs(_922);
    float _946 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _940);
    bool _948 = !_904;
    int _950 = _948 ? 0 : 1;
    float _952 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _780);
    float _954 = float(_944);
    float _956 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _946);
    int _958 = abs(_950);
    float _960 = _924 * _116;
    float _962 = float(_828);
    float _964 = _954 * _942;
    int _966 = ~_928;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = _746 + (-0.5);
    int _974 = _970;
    if (!_830)
    {
        int _976 = ~_928;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = _964 * (-2.0);
    float _984 = _962 * _116;
    if (_938)
    {
        float _986 = _894 * _842;
        _126 = _986;
    }
    float _988 = _126;
    int _990 = _874 ? 0 : 1;
    float _992 = fma(_982, _914, _914);
    bool _994 = !_908;
    int _996 = _994 ? 0 : 1;
    float _998 = float(_980);
    float _1000 = fma(_794, _982, _794);
    float _1002 = float(_958);
    float _1004 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[196].x, _992);
    int _1006 = ~_990;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = _1010;
    if (!_864)
    {
        int _1014 = ~_990;
        int _1016 = _1014 + 1;
        _1012 = _1016;
    }
    int _1018 = _1012;
    float _1020 = _1002 * _998;
    int _1022 = abs(_996);
    float _1024 = _748 + _740;
    float _1026 = float(_1018);
    float _1028 = fma(_1000, _988, _1004);
    float _1030 = float(_1022);
    float _1032 = _1024 + (-1.0);
    float _1034 = _1020 * (-2.0);
    float _1036 = _1028 * 0.15915493667125701904296875;
    float _1038 = _1030 * _1026;
    float _1040 = _748 + (-0.5);
    float _1042 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1044 = fma(_1034, _916, _916);
    float _1046 = _740 + _746;
    float _1048 = fma(_1042, _1034, _1042);
    float _1050 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1044);
    float _1052 = _1046 + (-1.0);
    float _1054 = _1038 * (-2.0);
    float _1056 = _740 + (-0.5);
    float _1058 = fma(_1048, _988, _1050);
    float _1060 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1062 = fma(_1054, _918, _918);
    float _1064 = in.m_65.x;
    float _1066 = in.m_65.y;
    float _1068 = in.m_65.z;
    float _1070 = _1036 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = fma(_1060, _1054, _1060);
    float _1076 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    float _1078 = _1058 * 0.15915493667125701904296875;
    float _1080 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1082 = fma(_1074, _988, _1076);
    float _1084 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1086 = _1036 * 6.283185482025146484375;
    float _1088 = cos(_1086);
    float _1090 = _1078 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1082 * 0.15915493667125701904296875;
    float _1096 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = in.m_46.x;
    float _1100 = in.m_46.y;
    float _1102 = in.m_46.z;
    float _1104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1064);
    float _1106 = _1078 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1066);
    float _1112 = _1096 * _1104;
    float _1114 = _1080 * _1110;
    float _1116 = _1094 * 6.283185482025146484375;
    float _1118 = cos(_1116);
    float _1120 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1122 = _1072 * _1092;
    float _1124 = _1084 * _1120;
    float _1126 = _1088 * _1092;
    float _1128 = _1094 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _1088 * _1108;
    float _1134 = _1072 * _1108;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1138 = _1088 * _1118;
    float _1140 = _1072 * _1118;
    float _1142 = _1108 * _1118;
    float _1144 = _1092 * _1118;
    float _1146 = _1138 * _1114;
    float _1148 = _1140 * _1114;
    float _1150 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1136);
    float _1152 = fma(_1130, _1132, _1122);
    float _1154 = -_1126;
    float _1156 = fma(_1130, _1134, _1154);
    float _1158 = -_1134;
    float _1160 = fma(_1130, _1126, _1158);
    float _1162 = -_1114;
    float _1164 = _1130 * _1162;
    float _1166 = fma(_1152, _1112, _1146);
    float _1168 = fma(_1156, _1112, _1148);
    float _1170 = fma(_1130, _1122, _1132);
    float _1172 = fma(_1142, _1112, _1164);
    float _1174 = fma(_1160, _1124, _1166);
    float _1176 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1178 = fma(_1170, _1124, _1168);
    float _1180 = fma(_1144, _1124, _1172);
    float _1182 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1184 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1186 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1176);
    float _1188 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1190 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1182);
    float _1192 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1184);
    float _1194 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1186);
    float _1196 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1188);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1190);
    float _1200 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1192);
    float _1202 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1204 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1196);
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1210 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1150);
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1214 = _1202 + _1206;
    float _1216 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1218 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1220 = _1208 + _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1214 + _1222;
    float _1226 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1216);
    float _1228 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1232 = _1220 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1226);
    float _1238 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1228);
    float _1240 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1242 = fma(_1232, _1232, _1234);
    float _1244 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1246 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1238);
    float _1248 = sqrt(_1242);
    float _1250 = _1218 + _1244;
    float _1252 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1254 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = _1102;
    float _1258 = _1238;
    float _1260 = _1250;
    float _1262 = _1252;
    float _1264 = _1240;
    float _1266 = _1208;
    if (!_1254)
    {
        _1256 = _1220;
    }
    float _1268 = _1256;
    float _1270 = _1268;
    if (!_1254)
    {
        _1258 = _1214;
    }
    float _1272 = _1258;
    bool _1274 = !_1254;
    float _1276 = _1272;
    if (!_1274)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1282 = _1248 + _1280;
        float _1284 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
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
        float _1306 = fma(_1250, _1294, _1302);
        float _1308 = _1286 * _1304;
        float _1310 = fma(_1232, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1224, _1308, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1260 = _1306;
        _1270 = _1310;
        _1276 = _1312;
    }
    float _1314 = _1260;
    float _1316 = _1270;
    float _1318 = _1276;
    float _1320 = -_1218;
    float _1322 = _1320 + _1314;
    float _1324 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1240);
    float _1326 = -_1208;
    float _1328 = _1326 + _1316;
    float _1330 = 1.0 / _1252;
    float _1332 = _1322 * _1322;
    float _1334 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1324);
    float _1336 = -_1202;
    float _1338 = _1336 + _1318;
    float _1340 = fma(_1328, _1328, _1332);
    float _1342 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1344 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1346 = isnan(0.5);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1352 = _1348 || _1350;
    float _1354 = fma(_1338, _1338, _1340);
    float _1356 = _1342 + _1252;
    float _1358 = sqrt(_1354);
    float _1360 = _1356 * _1330;
    float _1362 = _1360 * 0.5;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1366 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1364);
    float _1368 = _1314;
    float _1370 = _1318;
    float _1372 = _1366;
    float _1374 = _1354;
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1352)
    {
        _1262 = 1.0;
    }
    float _1378 = _1262;
    float _1380 = 1.0 / _1366;
    bool _1382 = _1358 > 0.0;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1386 = _1380 * _1384;
    float _1388 = _1358;
    float _1390 = _1378;
    if (!_1382)
    {
        _1388 = _1316;
    }
    float _1392 = _1388;
    bool _1394 = !_1382;
    float _1396 = _1392;
    if (!_1394)
    {
        float _1398 = _188 * _188;
        float _1400 = rsqrt(_1354);
        float _1402 = fma(_186, _186, _1398);
        float _1404 = fma(_190, _190, _1402);
        float _1406 = sqrt(_1404);
        float _1408 = _1328 * _1400;
        float _1410 = _1322 * _1400;
        float _1412 = _1338 * _1400;
        bool _1414 = _1406 > 0.0;
        float _1416 = _1406;
        _1372 = _1404;
        _1374 = _1400;
        _1376 = _1410;
        _1264 = _1412;
        if (!_1414)
        {
            _1416 = _1316;
        }
        float _1418 = _1416;
        bool _1420 = !_1414;
        _1396 = _1418;
        if (!_1420)
        {
            float _1422 = rsqrt(_1404);
            float _1424 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1426 = _188 * _1422;
            float _1428 = _186 * _1422;
            float _1430 = _1410 * _1426;
            float _1432 = _190 * _1422;
            float _1434 = fma(_1408, _1428, _1430);
            float _1436 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1438 = fma(_1412, _1432, _1434);
            float _1440 = _1438 * _1436;
            float _1442 = fma(_186, _1440, _1316);
            float _1444 = fma(_188, _1440, _1314);
            float _1446 = fma(_190, _1440, _1318);
            _1368 = _1444;
            _1396 = _1442;
            _1370 = _1446;
            _1372 = _1422;
        }
    }
    float _1448 = _1368;
    float _1450 = _1396;
    float _1452 = _1370;
    float _1454 = _1372;
    float _1456 = _1374;
    float _1458 = _1376;
    float _1460 = _1264;
    float _1462 = _1458;
    float _1464 = _1460;
    if (!_1352)
    {
        float _1466 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1468 = _1466 * 0.15915493667125701904296875;
        float _1470 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1472 = _1468 * 6.283185482025146484375;
        float _1474 = cos(_1472);
        float _1476 = _1470 * 0.15915493667125701904296875;
        float _1478 = _1468 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = 1.0 / _1474;
        float _1484 = _1476 * 6.283185482025146484375;
        float _1486 = cos(_1484);
        float _1488 = _1480 * _1482;
        float _1490 = _1476 * 6.283185482025146484375;
        float _1492 = sin(_1490);
        float _1494 = _1486 * _1488;
        float _1496 = 1.0 / _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1500 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1498;
        float _1502 = 1.0 / _1500;
        float _1504 = _1492 * _1496;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1508 = fma(_1386, _1504, _1506);
        float _1510 = _1508 * _1502;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1390 = _1512;
    }
    float _1514 = _1390;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1448 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1450 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1452 + _1524;
    float _1528 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1530 = _1518 * _1518;
    float _1532 = fma(_1522, _1522, _1530);
    float _1534 = fma(_1526, _1526, _1532);
    float _1536 = rsqrt(_1534);
    float _1538 = sqrt(_1534);
    float _1540 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1542 = _1522 * _1540;
    float _1544 = _1526 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 + _1548;
    float _1552 = sqrt(_1550);
    bool _1554 = _1552 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1552 + _1556;
    float _1560 = _1454;
    float _1562 = _1550;
    float _1564 = _1558;
    float _1566 = _1542;
    float _1568 = _1544;
    float _1570 = _1546;
    float _1572 = _1548;
    if (_1554)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1574;
    }
    float _1576 = _1560;
    if (_1554)
    {
        float _1578 = rsqrt(_1550);
        _1562 = _1578;
    }
    float _1580 = _1562;
    if (_1554)
    {
        float _1582 = _1558 * _1576;
        _1564 = _1582;
    }
    float _1584 = _1564;
    if (_1554)
    {
        float _1586 = _1584 * 0.15915493667125701904296875;
        _1462 = _1586;
    }
    float _1588 = _1462;
    float _1590 = _1456;
    if (_1554)
    {
        float _1592 = _1588 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        _1590 = _1594;
    }
    float _1596 = _1590;
    float _1598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1600 = precise::max(0.0, _1598);
    float _1602 = _1576;
    if (_1554)
    {
        float _1604 = _1588 * 6.283185482025146484375;
        float _1606 = cos(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = -_1540;
    float _1612 = -_1600;
    float _1614 = fma(_1518, _1610, _1612);
    if (_1554)
    {
        float _1616 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1616;
    }
    float _1618 = _1464;
    float _1620 = fma(_1208, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1622 = _1618;
    float _1624 = _1596;
    if (_1554)
    {
        float _1626 = fma(_1596, _1618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1622 = _1626;
    }
    float _1628 = _1622;
    float _1630 = _1628;
    if (!_1554)
    {
        _1624 = _1614;
    }
    float _1632 = _1624;
    float _1634 = floor(_1620);
    float _1636 = _1632;
    if (_1554)
    {
        float _1638 = _1608 + (-1.0);
        _1266 = _1638;
    }
    float _1640 = _1266;
    float _1642 = _1640;
    if (_1554)
    {
        float _1644 = _1580 * _1628;
        _1630 = _1644;
    }
    float _1646 = _1630;
    if (_1554)
    {
        float _1648 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1648;
    }
    float _1650 = _1642;
    if (_1554)
    {
        float _1652 = _1542 * _1646;
        _1566 = _1652;
    }
    float _1654 = _1566;
    if (_1554)
    {
        float _1656 = _1544 * _1646;
        _1568 = _1656;
    }
    float _1658 = _1568;
    float _1660 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1554)
    {
        float _1662 = fma(_1614, _1608, _1650);
        _1636 = _1662;
    }
    float _1664 = _1636;
    if (_1554)
    {
        float _1666 = _1654 * _1654;
        _1570 = _1666;
    }
    float _1668 = _1570;
    if (_1554)
    {
        float _1670 = _1658 * _1658;
        _1572 = _1670;
    }
    float _1672 = _1572;
    float _1674 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1660);
    float _1676 = fma(_1664, _1664, _1668);
    float _1678 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1528);
    float _1680 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1674);
    float _1682 = _1676 + _1672;
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1686 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1690 = fma(_1202, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1692 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1694 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1688);
    float _1696 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1698 = floor(_1690);
    float _1700 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1692);
    float _1702 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1694);
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1706 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1704);
    float _1708 = precise::clamp(_1706, 0.0, 1.0);
    float _1710 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1714 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1716 = -_1708;
    float _1718 = _1716 + 1.0;
    float _1720 = rsqrt(_1682);
    float _1722 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1724 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1678);
    float _1726 = -_1634;
    float _1728 = _1620 + _1726;
    float _1730 = -_1710;
    float _1732 = fma(_1730, _1684, 1.0);
    float _1734 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1722);
    float _1736 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1738 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1740 = abs(_1718);
    float _1742 = log2(_1740);
    float _1744 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1746 = -_1698;
    float _1748 = _1690 + _1746;
    float _1750 = _1720 * _1654;
    float _1752 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1744);
    float _1754 = _1720 * _1664;
    float _1756 = _1720 * _1658;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1760 = log2(_1732);
    float _1762 = -_1758;
    float _1764 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = -_1756;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1772 = 1.0 / _1752;
    float _1774 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1776 = fma(_1770, -0.5, 0.5);
    float _1778 = fma(_1770, 0.5, 0.5);
    float _1780 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1774);
    float _1782 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1738);
    float _1784 = _1754 + 1.0;
    float _1786 = exp2(_1766);
    float _1788 = fma(_1778, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1790 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1780);
    float _1792 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1782);
    float _1794 = _1760 * 0.693147182464599609375;
    float _1796 = fma(_1778, _1788, -0.212114393711090087890625);
    float _1798 = sqrt(_1776);
    float _1800 = fma(_1778, _1796, 1.570728778839111328125);
    float _1802 = -_1754;
    float _1804 = fma(_1786, _1784, _1802);
    float _1806 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1790);
    float _1808 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1810 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = _1806 * _1772;
    float _1814 = _1808 * _1772;
    float _1816 = _1798 * 0.636619746685028076171875;
    float _1818 = fma(_1812, 0.5, 0.5);
    float _1820 = fma(_1814, -0.5, 0.5);
    float _1822 = -_1800;
    float _1824 = fma(_1816, _1822, 1.0);
    float _1826 = fma(_1804, 0.5, 0.5);
    float2 _5814 = float2(_1728, _1748);
    float _1828 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5814, float2(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5814, float2(0.0), isnan(_5814)), level(0.0)).x;
    float3 _5825 = float3(_1818, _1820, _1810);
    float _1830 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5825, float3(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5825, float3(0.0), isnan(_5825)), level(0.0)).x;
    float3 _5836 = float3(_1818, _1820, _1810);
    float4 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5836, float3(0.0), isnan(_5836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5836, float3(0.0), isnan(_5836)), level(0.0)).xyzw;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = _1833.w;
    float2 _5852 = float2(_1824, _1826);
    float3 _1845 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5852, float2(0.0), isnan(_5852)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5852, float2(0.0), isnan(_5852)), level(0.0)).xyz;
    float _1847 = _1845.x;
    float _1849 = _1845.y;
    float _1851 = _1845.z;
    float _1853 = float(uint(_828));
    float _1855 = trunc(_960);
    int _1857 = int(_1855);
    bool _1859 = _828 == 0;
    float _1861 = _984 * _168;
    int _1863 = _828 + (-1);
    float _1865 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1867 = ~_828;
    int _1869 = _1867 + 1;
    int _1871 = abs(_834);
    float _1873 = 1.0 / _1853;
    int _1875 = abs(_840);
    bool _1877 = _748 > 0.5;
    bool _1879 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1881 = isnan(_738);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    float _1891 = float(uint(_1857));
    float _1893 = trunc(_1861);
    int _1895 = int(_1893);
    int _1897 = as_type<int>(_1873) + (-2);
    float _1899 = exp2(_1865);
    float _1901 = as_type<float>(_1897) * _1891;
    float _1903 = trunc(_1901);
    float _1905 = precise::max(_1903, 0.0);
    uint _1908 = uint(_1905);
    float _1910 = -_1899;
    float _1912 = _1910 + 1.0;
    int _1914 = _1869 * int(_1908);
    int _1916 = _1914 + _1857;
    float _1918 = float(uint(_1916));
    float _1920 = as_type<float>(_1897) * _1918;
    int _1922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1924 = _1922 != 0;
    int _1926 = ~_828;
    int _1928 = _1926 + 1;
    bool _1930 = !_1924;
    float _1932 = _1930 ? 7.345489978790283203125 : 1.0;
    float _1934 = trunc(_1920);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    float _1940 = _1932 * _746;
    float _1942 = float(_1857);
    bool _1944 = _1942 >= _962;
    bool _1946 = isnan(_1942);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan(_962);
    bool _1952 = _1948 || _1950;
    float _1954 = float(_1952);
    float _1956 = trunc(_1954);
    int _1958 = int(_1956);
    int _1960 = int(_1908) + int(_1938);
    float _1962 = floor(_1940);
    int _1964 = _1928 * _1960;
    int _1966 = _1964 + _1857;
    bool _1968 = uint(_1966) >= uint(_828);
    bool _1970 = !_1968;
    int _1972 = _1970 ? 0 : (-1);
    int _1974 = ~_1960;
    int _1976 = _1974 + _1972;
    int _1978 = _1976 + 1;
    float _1980 = -_1962;
    float _1982 = _1940 + _1980;
    int _1984 = ~_1958;
    int _1986 = _1984 + 1;
    int _1988 = _1986 + 1;
    float _1990 = _1982 * _962;
    int _1992 = _828 * _1978;
    int _1994 = _1992 + _1857;
    float _1996 = -_1889;
    float _1998 = _1996 + 1.0;
    bool _2000 = !_1859;
    int _2002 = _2000 ? _1994 : (-1);
    float _2004 = trunc(_1990);
    int _2006 = int(_2004);
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2010 = _2008 != 0;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2014 = _2012 != 0;
    int _2016 = _2002 * _1988;
    bool _2018 = !_2010;
    int _2020 = _2018 ? 0 : 1;
    int _2022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2024 = _2022 != 0;
    int _2026 = _1958 * _1863;
    int _2028 = _2026 + _2016;
    bool _2030 = !_2024;
    int _2032 = _2030 ? 0 : 1;
    int _2034 = abs(_892);
    int _2036 = _2028 * _1871;
    int _2038 = abs(_2020);
    int _2040 = abs(_2032);
    int _2042 = _2006 * _2038;
    int _2044 = _2042 + _1857;
    int _2046 = _1895 * _1875;
    int _2048 = _2046 + _2036;
    float _2050 = as_type<float>(_2034);
    if (_2014)
    {
        float _2052 = in.m_57.x;
        _2050 = _2052;
    }
    float _2054 = _2050;
    int _2056 = ~_828;
    int _2058 = _2056 + 1;
    int _2060 = _2044 * _2034;
    int _2062 = _2060 + _2048;
    float _2064 = in.m_67.y;
    int _2066 = _2006 * _2040;
    int _2068 = _2066 + _2062;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2072 = _2070 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2074 = in.m_67.x;
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2078 = _2076 != 0;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2080;
    float _2084 = float(uint(_2068));
    float _2086 = 1.0 / _2072;
    bool _2088 = _1066 != 0.0;
    bool _2090 = isnan(_1066);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan(0.0);
    bool _2096 = _2092 || _2094;
    float _2098 = as_type<float>(_1897) * _2084;
    int _2100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2102 = _2100 != 0;
    bool _2104 = _1064 == 0.0;
    bool _2106 = !_2096;
    bool _2108 = _2104 && _2106;
    float _2110 = trunc(_2098);
    float _2112 = precise::max(_2110, 0.0);
    uint _2114 = uint(_2112);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _2116 = _2054 > 0.5;
    bool _2118 = _2116 && _2014;
    bool _2120 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2122 = isnan(_738);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = in.m_71.x;
    float _2134 = in.m_71.y;
    float _2136 = in.m_71.z;
    bool _2138 = _1068 == 0.0;
    bool _2140 = _2138 && _2108;
    float _2142 = _2082 * _2086;
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2146 = _738 + _2144;
    float _2148 = float(uint(_2044));
    float _2150 = fma(_2142, _2146, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2152 = _2142;
    float _2154 = _2074;
    float _2156 = _2064;
    if (_2014)
    {
        _2152 = _2074;
    }
    float _2158 = _2152;
    float _2160 = as_type<float>(_1897) * _2148;
    float _2162 = _2130 * _1998;
    int _2164 = _2058 * int(_2114);
    int _2166 = _2164 + _2068;
    float _2168 = _2158;
    if (_2118)
    {
        float _2170 = -_2158;
        float _2172 = _2170 + 1.0;
        _2168 = _2172;
    }
    float _2174 = _2168;
    float _2176 = _2150 * _2162;
    float _2178 = trunc(_2160);
    float _2180 = precise::max(_2178, 0.0);
    uint _2182 = uint(_2180);
    float _2184 = float(uint(_2166));
    float _2186 = -_2130;
    float _2188 = _2186 + 1.0;
    if (_2014)
    {
        _2154 = _2174;
    }
    float _2190 = _2154;
    float _2192 = as_type<float>(_1897) * _2184;
    float _2194 = -_2064;
    float _2196 = _2194 + 1.0;
    float _2198 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2200 = _2132;
    float _2202 = _2134;
    float _2204 = _2136;
    if (!_2140)
    {
        float _2206 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2200 = _2206;
    }
    float _2208 = _2200;
    if (!_2140)
    {
        float _2210 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2134);
        _2202 = _2210;
    }
    float _2212 = _2202;
    if (!_2140)
    {
        float _2214 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2136);
        _2204 = _2214;
    }
    float _2216 = _2204;
    float _2218 = trunc(_2192);
    float _2220 = precise::max(_2218, 0.0);
    uint _2222 = uint(_2220);
    if (_2078)
    {
        float _2224 = _1877 ? _2196 : _2064;
        _2156 = _2224;
    }
    float _2226 = _2156;
    float _2228 = fma(_956, _2198, _784);
    int _2230 = ~_828;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2176);
    float _2236 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2240 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2242 = _2236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2244 = -_952;
    float _2246 = fma(_926, _2238, _2244);
    int _2248 = ~_828;
    int _2250 = _2248 + 1;
    int _2252 = _2232 * int(_2182);
    int _2254 = _2252 + _2044;
    float _2256 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2240);
    int _2258 = int(_2114) + int(_2222);
    float _2260 = abs(_1386);
    float _2262 = log2(_2260);
    float _2264 = float(uint(_2254));
    float _2266 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2234);
    float _2268 = _2246 + 0.5;
    int _2270 = _2250 * _2258;
    int _2272 = _2270 + _2068;
    float _2274 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2276 = as_type<float>(_1897) * _2264;
    float _2278 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2280 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2282 = uint(_2272) >= uint(_828);
    float _2284 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2286 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2288 = trunc(_2276);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    bool _2294 = !_2282;
    int _2296 = _2294 ? 0 : (-1);
    float _2298 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2300 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2302 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2304 = ~_2258;
    int _2306 = _2304 + _2296;
    int _2308 = _2306 + 1;
    float _2310 = _2228 + 0.5;
    out.m_73.x = _2298;
    out.m_73.y = _2286;
    out.m_73.z = _2242;
    out.m_73.w = _2280;
    float _2312 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2314 = _828 * _2308;
    int _2316 = _2314 + _2068;
    float _2318 = exp2(_2302);
    int _2320 = ~_828;
    int _2322 = _2320 + 1;
    out.m_75.x = _2310;
    out.m_75.y = _2268;
    float _2324 = -_1130;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2312);
    bool _2328 = !_1859;
    int _2330 = _2328 ? _2316 : (-1);
    float _2332 = -_1130;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2336 = int(_2182) + int(_2292);
    float _2338 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2326);
    float _2340 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2342 = _2330 & 3;
    bool _2344 = _2342 != 0;
    float _2346 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2348 = _2330 >> 31;
    int _2350 = _2322 * _2336;
    int _2352 = _2350 + _2044;
    float _2354 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2356 = -_1130;
    float _2358 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2346);
    int _2360 = _2348 & 3;
    float _2362 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    bool _2366 = uint(_2352) >= uint(_828);
    float _2368 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    int _2370 = _2330 + _2360;
    float _2372 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2374 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2376 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2334);
    int _2378 = _2370 >> 2;
    float _2380 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2372);
    float _2382 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2374);
    float _2384 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2354);
    int _2386 = _2378 << 4;
    int _2388 = _2386 + 368;
    float _2390 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2340);
    float _2392 = _2376 * _2212;
    float _2394 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2380);
    uint _2396 = uint(int(uint(_2388) >> uint(2)));
    uint _2398 = uint(int(uint(int(_2396)) >> uint(2)));
    int _2400 = int(_2396) & 3;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[int(_2398)][_2400];
    int _2404 = int(_2396) + 1;
    uint _2406 = uint(int(uint(_2404) >> uint(2)));
    int _2408 = _2404 & 3;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[int(_2406)][_2408];
    float _2412 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2382);
    float _2414 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2384);
    int _2416 = _2330 & 3;
    bool _2418 = _2416 != 0;
    float _2420 = _2364 * _2364;
    float _2422 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    bool _2424 = uint(_2416) > 1u;
    int _2426 = _2388 + 8;
    uint _2428 = uint(int(uint(_2426) >> uint(2)));
    uint _2430 = uint(int(uint(int(_2428)) >> uint(2)));
    int _2432 = int(_2428) & 3;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[int(_2430)][_2432];
    int _2436 = int(_2428) + 1;
    uint _2438 = uint(int(uint(_2436) >> uint(2)));
    int _2440 = _2436 & 3;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[int(_2438)][_2440];
    float _2444 = _2338 * _2212;
    float _2446 = fma(_2364, -2.0, 3.0);
    int _2448 = _2344 ? 0 : 1;
    float _2450 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2256);
    bool _2452 = _2416 != 3;
    float _2454 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2422);
    int _2456 = ~_2448;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    float _2462 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2390);
    bool _2464 = !_2366;
    int _2466 = _2464 ? 0 : (-1);
    float _2468 = _2368 * _2212;
    bool _2470 = uint(_2416) >= 2u;
    float _2472 = fma(_2412, _2208, _2392);
    int _2474 = _2460;
    if (!_2424)
    {
        int _2476 = ~_2448;
        int _2478 = _2476 + 1;
        _2474 = _2478;
    }
    int _2480 = _2474;
    float _2482 = fma(_2394, _2208, _2444);
    bool _2484 = !_2418;
    int _2486 = _2484 ? 0 : 1;
    float _2488 = _2420 * _2446;
    int _2490 = abs(_2480);
    float _2492 = fma(_2414, _2208, _2468);
    int _2494 = ~_2336;
    int _2496 = _2494 + _2466;
    int _2498 = _2496 + 1;
    float _2500 = fma(_2454, _2216, _2472);
    int _2502 = _2470 ? 0 : 1;
    float _2504 = in.m_77.x;
    bool _2506 = _2416 != 3;
    float _2508 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2510 = abs(_2486);
    int _2512 = _828 * _2498;
    int _2514 = _2512 + _2044;
    float _2516 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2508);
    int _2518 = ~_2502;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    float _2524 = -_1828;
    float _2526 = _2524 + 1.0;
    bool _2528 = !_2506;
    int _2530 = _2528 ? 0 : (-1);
    float _2532 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2516);
    int _2534 = _2522;
    if (_2452)
    {
        int _2536 = ~_2502;
        int _2538 = _2536 + 1;
        _2534 = _2538;
    }
    int _2540 = _2534;
    float _2542 = fma(_2450, _2216, _2482);
    int _2544 = ~_2490;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    float _2550 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2532);
    bool _2552 = !_2102;
    int _2554 = _2552 ? 0 : 1;
    float _2556 = fma(_2462, _2216, _2492);
    int _2558 = abs(_2530);
    int _2560 = _2548 * as_type<int>(_2410);
    int _2562 = abs(_2540);
    float _2564 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2566 = ~_2510;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    out.gl_Position.x = _1806;
    out.gl_Position.y = _1808;
    out.gl_Position.z = _2550;
    out.gl_Position.w = _1752;
    int _2572 = abs(_2554);
    float _2574 = _2564 * _1830;
    int _2576 = _2570 * as_type<int>(_2402);
    int _2578 = _2576 + _2560;
    int _2580 = ~_2562;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    float _2586 = -_2564;
    float _2588 = _2586 + 1.0;
    int _2590 = ~_2558;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    out.m_79.x = _2542;
    out.m_79.y = _2500;
    out.m_79.z = _2556;
    bool _2596 = _1386 <= 8000.0;
    bool _2598 = isnan(_1386);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan(8000.0);
    bool _2604 = _2600 || _2602;
    float _2606 = float(_2604);
    int _2608 = _2584 * as_type<int>(_2434);
    int _2610 = _2608 + _2578;
    float _2612 = _2550 + _1752;
    bool _2614 = !_1859;
    int _2616 = _2614 ? _2514 : (-1);
    int _2618 = _2594 * as_type<int>(_2442);
    int _2620 = _2618 + _2610;
    float _2622 = -_2488;
    float _2624 = _2622 + 1.0;
    int _2626 = ~_2572;
    int _2628 = _2626 + 1;
    int _2630 = _2628 + 1;
    float _2632 = _2612 * 0.5;
    float _2634 = fma(_2624, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2488);
    float _2636 = _1752 * 0.5;
    int _2638 = _2620 * _2630;
    float _2640 = _2606 * _2634;
    float _2642 = fma(_1808, -0.5, _2636);
    int _2644 = _2616 * _2572;
    int _2646 = _2644 + _2638;
    float _2648 = _1806 + _1752;
    float _2650 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2652 = _1851 * _2574;
    bool _2654 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2656 = isnan(_1538);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2662 = _2658 || _2660;
    float _2664 = _2648 * 0.5;
    float _2666 = _2526 * _2650;
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = _1841 * _2574;
    float _2672 = fma(_1841, _2652, _1839);
    float _2674 = float(_2646);
    float _2676 = -_2668;
    float _2678 = fma(_2676, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2664;
    out.m_81.y = _2642;
    out.m_81.z = _2632;
    out.m_81.w = _1752;
    float _2680 = fma(_1847, _2670, _1835);
    float _2682 = fma(_1849, _2670, _1837);
    float _2684 = _2678 * _2504;
    float _2686 = _1841 * _2588;
    out.m_83.x = _2674;
    float _2688 = _2670;
    float _2690 = _2588;
    float _2692 = _2652;
    float _2694 = _2574;
    float _2696 = _2674;
    float _2698 = _2684;
    if (!_2662)
    {
        _2688 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2700 = _2688;
    float _2702 = _2700;
    float _2704 = _2700;
    if (!_2662)
    {
        _2690 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2706 = _2690;
    out.m_85.x = _2680;
    out.m_85.y = _2682;
    out.m_85.z = _2672;
    out.m_85.w = _2686;
    float _2708 = _2706;
    float _2710 = _2706;
    if (!_2662)
    {
        _2692 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2712 = _2692;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2662)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2718 = _2694;
    float _2720 = _2684 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2722 = _1514 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2724 = _2718;
    float _2726 = _2718;
    if (!_2662)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2728 = _2696;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2662)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2734 = _2698;
    out.m_87.x = _2720;
    bool _2736 = !_2662;
    float _2738 = _2734;
    float _2740 = _2734;
    if (!_2736)
    {
        bool _2742 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2744 = isnan(_1538);
        bool _2746 = _2742 || _2744;
        bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2750 = _2746 || _2748;
        if (!_2750)
        {
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2754 = _1538 + _2752;
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
            _2710 = _2794;
            _2726 = _2798;
            _2704 = _2790;
            _2716 = _2796;
            _2732 = _2792;
            _2740 = _2800;
            _2802 = true;
        }
        else
        {
            bool _2804 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2806 = isnan(_1538);
            bool _2808 = _2804 || _2806;
            bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2812 = _2808 || _2810;
            if (!_2812)
            {
                _2702 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2814 = _2702;
            _2704 = _2814;
            if (!_2812)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2816 = _2708;
            _2710 = _2816;
            if (!_2812)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2818 = _2730;
            _2732 = _2818;
            if (!_2812)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2820 = _2714;
            _2716 = _2820;
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
                bool _2828 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2830 = isnan(_1538);
                bool _2832 = _2828 || _2830;
                bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2836 = _2832 || _2834;
                if (!_2836)
                {
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2840 = _1538 + _2838;
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
                    _2710 = _2880;
                    _2726 = _2884;
                    _2704 = _2876;
                    _2716 = _2882;
                    _2732 = _2878;
                    _2740 = _2886;
                    _2802 = true;
                }
                else
                {
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2704 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2802 = false;
    float _2888 = _2710;
    float _2890 = _2726;
    float _2892 = _2704;
    float _2894 = _2716;
    float _2896 = _2732;
    float _2898 = _2740;
    float _2900 = _2722 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2902 = fma(_2500, -0.5, 0.5);
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
    bool _2928 = _1514 > 0.0;
    bool _2930 = isnan(_1514);
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
        float _2962 = -_1448;
        float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2966 = -_1450;
        float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2970 = -_1452;
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
        float _3004 = _2500 * _2994;
        float _3006 = -_2994;
        float _3008 = -_3002;
        float _3010 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3008);
        float _3012 = fma(_2542, _2992, _3004);
        float _3014 = -_3000;
        float _3016 = fma(_3014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3010);
        float _3018 = fma(_2556, _3000, _3012);
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
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3044;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

