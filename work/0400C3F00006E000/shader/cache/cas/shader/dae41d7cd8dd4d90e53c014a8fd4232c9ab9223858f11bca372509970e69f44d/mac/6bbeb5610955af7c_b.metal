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
    bool _2898 = false;
    bool _634 = false;
    bool _498 = false;
    bool _324 = false;
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
    float _124 = as_type<float>(_112);
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
        float _3209 = as_type<float>(_134);
        out.gl_Position.z = _3209;
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
        float _3264 = as_type<float>(_160);
        out.gl_Position.z = _3264;
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
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _238;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = _250 * _254;
    float _266 = -_250;
    float _268 = _266 + 1.0;
    float _270 = _222 * _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = _276 * _264;
    float _286 = fma(_280, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = _282 * _264;
    float _290 = _286 * _264;
    float _292 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _294 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _296 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _298 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _294);
    float _302 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].z, _296);
    bool _304 = !_262;
    float _322;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _322 = _320;
        _324 = true;
    }
    else
    {
        _322 = _172;
    }
    _324 = false;
    float _326 = _322;
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = _326 + _334;
    bool _338 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _340 = isnan(_326);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _358 = 1.0 / _352;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = 1.0 / _356;
    float _364 = _300 * _330;
    float _366 = _302 * _332;
    bool _368 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _370 = isnan(_326);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -_348;
    float _382 = _380 + 1.0;
    float _384 = _336 * _358;
    bool _386 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _388 = isnan(_326);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _400 = _326 + _398;
    float _402 = _378 * _382;
    float _404 = -_378;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _416;
    float _420 = _396 * _406;
    float _422 = fma(_410, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_414, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = fma(_418, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _428 = _400 * _362;
    float _430 = _422 * _420;
    float _432 = _424 * _420;
    float _434 = _426 * _420;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _444 = -_396;
    float _446 = _444 + 1.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _452 = fma(_438, _428, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _454 = fma(_442, _428, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _456 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _458 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _460 = fma(_450, _428, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _462 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _464 = fma(_452, _402, _456);
    float _466 = fma(_454, _402, _458);
    float _468 = fma(_460, _402, _462);
    float _470 = _298 * _328;
    float _472 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].x, _464);
    float _474 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].y, _466);
    float _476 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].z, _468);
    bool _478 = !_360;
    float _496;
    if (!_478)
    {
        float _480 = in.m_57.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _172;
    }
    _498 = false;
    float _500 = _496;
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
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _562 = _536 * _558;
    float _564 = -_536;
    float _566 = _564 + 1.0;
    float _568 = 1.0 / _524;
    float _570 = _540 * _554;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _576 = fma(_570, _504, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _578 = -_552;
    float _580 = _578 + 1.0;
    float _582 = _576 * _562;
    float _584 = _574 * _568;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = _500 + _586;
    float _590 = _520 * _580;
    float _592 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _594 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _596 = fma(_584, _588, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _598 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _600 = _476 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _602 = fma(_596, _590, _592);
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _602);
    float _610 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _604;
    out.m_61.y = _606;
    out.m_61.z = _610;
    out.m_61.w = _612;
    bool _614 = !_560;
    float _632;
    if (!_614)
    {
        float _616 = in.m_57.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        _632 = _172;
    }
    _634 = false;
    float _636 = _632;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _674;
    float _678 = 1.0 / _656;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _682 = _668 * _672;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _640 * _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _690;
    float _694 = fma(_676, _688, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _696;
    float _700 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _702 = _694 * _682;
    float _704 = fma(_698, _688, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _706 = _700 * _682;
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].x, _702);
    float _710 = _704 * _682;
    float _712 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].x, _708);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].y, _710);
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].z, _706);
    float _718 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].y, _714);
    float _720 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].z, _716);
    bool _722 = !_680;
    if (!_722)
    {
        float _724 = in.m_57.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _194 = _738;
    }
    float _740 = _194;
    float _742 = in.m_57.z;
    float _744 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _746 = log2(_744);
    float _748 = in.m_57.x;
    float _750 = in.m_57.y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _756 = int(_754);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _762 = 1.0 + _760;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _766 = 1.0 / _762;
    float _768 = _742 * 2.0;
    float _770 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _772 = _748 * 2.0;
    float _774 = floor(_768);
    float _776 = _750 * 2.0;
    float _778 = -_752;
    float _780 = fma(_770, 2.0, _778);
    float _782 = _746 * _116;
    float _784 = _750 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = _750 + _748;
    float _788 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].z, _764);
    float _790 = -_116;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _794 = floor(_772);
    float _796 = fma(_784, -2.0, _758);
    float _798 = _786 + (-1.0);
    float _800 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _788);
    float _802 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    float _804 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _806 = _774 >= 0.0;
    bool _808 = isnan(_774);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = exp2(_782);
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _824 = _822 != 0;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _828 = _826 != 0;
    int _830 = _814 ? 0 : 1;
    bool _832 = _794 > 0.0;
    float _834 = floor(_776);
    bool _836 = !_824;
    int _838 = _836 ? 0 : 1;
    bool _840 = _774 > 0.0;
    bool _842 = _794 >= 0.0;
    bool _844 = isnan(_794);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    bool _852 = !_820;
    int _854 = _852 ? 0 : 1;
    float _856 = -_816;
    float _858 = _856 + 1.0;
    bool _860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _868 = _864 || _866;
    int _870 = ~_830;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    bool _876 = !_828;
    int _878 = _876 ? 0 : 1;
    float _880 = float(_756);
    bool _882 = _834 > 0.0;
    float _884 = in.m_63.x;
    float _886 = in.m_63.y;
    float _888 = in.m_63.z;
    bool _890 = _834 >= 0.0;
    bool _892 = isnan(_834);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = 1.0 / _880;
    int _902 = _874;
    if (!_840)
    {
        int _904 = ~_830;
        int _906 = _904 + 1;
        _902 = _906;
    }
    int _908 = _902;
    float _910 = _868 ? _858 : 0.0;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _924 = _922 != 0;
    float _926 = float(_908);
    float _928 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _930 = int(_928);
    float _932 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[78].w, _912);
    bool _934 = !_916;
    int _936 = _934 ? 0 : 1;
    int _938 = _850 ? 0 : 1;
    float _940 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _932);
    int _942 = abs(_936);
    bool _944 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _946 = isnan(1.0);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _952 = _948 || _950;
    float _954 = _900 * _116;
    float _956 = float(_942);
    bool _958 = !_920;
    int _960 = _958 ? 0 : 1;
    int _962 = ~_938;
    int _964 = _962 + 1;
    int _966 = _964 + 1;
    float _968 = _956 * _926;
    int _970 = _966;
    if (!_832)
    {
        int _972 = ~_938;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    float _978 = _748 + (-0.5);
    int _980 = abs(_960);
    float _982 = _968 * (-2.0);
    float _984 = float(_930);
    int _986 = _898 ? 0 : 1;
    float _988 = fma(_982, _884, _884);
    float _990 = float(_976);
    float _992 = _984 * _116;
    float _994 = float(_980);
    if (_952)
    {
        float _996 = _910 * _766;
        _126 = _996;
    }
    float _998 = _126;
    bool _1000 = !_924;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = fma(_804, _982, _804);
    int _1006 = ~_986;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].x, _988);
    int _1014 = _1010;
    if (!_882)
    {
        int _1016 = ~_986;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = _994 * _990;
    int _1024 = abs(_1002);
    float _1026 = _750 + _742;
    float _1028 = fma(_1004, _998, _1012);
    float _1030 = _1022 * (-2.0);
    float _1032 = float(_1020);
    float _1034 = _1026 + (-1.0);
    float _1036 = float(_1024);
    float _1038 = fma(_1030, _886, _886);
    float _1040 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = _742 + _748;
    float _1044 = _1036 * _1032;
    float _1046 = _750 + (-0.5);
    float _1048 = fma(_1040, _1030, _1040);
    float _1050 = _1042 + (-1.0);
    float _1052 = _1044 * (-2.0);
    float _1054 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1038);
    float _1056 = _742 + (-0.5);
    float _1058 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1060 = fma(_1052, _888, _888);
    float _1062 = fma(_1048, _998, _1054);
    float _1064 = _1028 * 0.15915493667125701904296875;
    float _1066 = in.m_65.x;
    float _1068 = in.m_65.y;
    float _1070 = in.m_65.z;
    float _1072 = fma(_1058, _1052, _1058);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1060);
    float _1076 = _1062 * 0.15915493667125701904296875;
    float _1078 = _1064 * 6.283185482025146484375;
    float _1080 = cos(_1078);
    float _1082 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1084 = fma(_1072, _998, _1074);
    float _1086 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1088 = _1084 * 0.15915493667125701904296875;
    float _1090 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1092 = _1076 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = in.m_46.x;
    float _1098 = in.m_46.y;
    float _1100 = in.m_46.z;
    float _1102 = _1076 * 6.283185482025146484375;
    float _1104 = cos(_1102);
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1066);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1068);
    float _1110 = _1064 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = _1082 * _1106;
    float _1116 = _1090 * _1108;
    float _1118 = _1088 * 6.283185482025146484375;
    float _1120 = cos(_1118);
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1070);
    float _1124 = _1080 * _1104;
    float _1126 = _1086 * _1122;
    float _1128 = _1080 * _1094;
    float _1130 = _1088 * 6.283185482025146484375;
    float _1132 = sin(_1130);
    float _1134 = _1112 * _1094;
    float _1136 = _1112 * _1104;
    float _1138 = _1080 * _1120;
    float _1140 = _1112 * _1120;
    float _1142 = _1104 * _1120;
    float _1144 = _1094 * _1120;
    float _1146 = _1138 * _1116;
    float _1148 = _1140 * _1116;
    float _1150 = fma(_1132, _1124, _1134);
    float _1152 = -_1128;
    float _1154 = fma(_1132, _1136, _1152);
    float _1156 = -_1136;
    float _1158 = fma(_1132, _1128, _1156);
    float _1160 = -_1116;
    float _1162 = _1132 * _1160;
    float _1164 = fma(_1150, _1114, _1146);
    float _1166 = fma(_1154, _1114, _1148);
    float _1168 = fma(_1132, _1134, _1124);
    float _1170 = fma(_1142, _1114, _1162);
    float _1172 = fma(_1158, _1126, _1164);
    float _1174 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1176 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1178 = fma(_1144, _1126, _1170);
    float _1180 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1182 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1184 = fma(_1168, _1126, _1166);
    float _1186 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1174);
    float _1188 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1180);
    float _1190 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1176);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1182);
    float _1194 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1186);
    float _1196 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1188);
    float _1198 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1190);
    float _1200 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1192);
    float _1202 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1210 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1212 = _1202 + _1204;
    float _1214 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1216 = _1206 + _1208;
    float _1218 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1210);
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1222 = _1212 + _1220;
    float _1224 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1214);
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1228 = _1216 + _1226;
    float _1230 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1218);
    float _1232 = _1222 * _1222;
    float _1234 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1224);
    float _1236 = _1230 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1238 = fma(_1228, _1228, _1232);
    float _1240 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1242 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1244 = sqrt(_1238);
    float _1246 = _1236 + _1240;
    float _1248 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1242);
    float _1250 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1248);
    bool _1252 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1248;
    float _1256 = _1242;
    float _1258 = _1240;
    float _1260 = _1214;
    if (!_1252)
    {
        _1254 = _1216;
    }
    float _1262 = _1254;
    float _1264 = _1262;
    if (!_1252)
    {
        _1256 = _1212;
    }
    float _1266 = _1256;
    float _1268 = _1266;
    if (!_1252)
    {
        _1258 = _1246;
    }
    float _1270 = _1258;
    bool _1272 = !_1252;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1244 + _1278;
        float _1282 = rsqrt(_1238);
        float _1284 = _1280 * _1276;
        float _1286 = _1246 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = _1292 + (-1.0);
        float _1300 = fma(_1296, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1302 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = _1282 * _1300;
        float _1306 = fma(_1246, _1292, _1302);
        float _1308 = fma(_1228, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1310 = fma(_1222, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1274 = _1306;
        _1264 = _1308;
        _1268 = _1310;
    }
    float _1312 = _1274;
    float _1314 = _1264;
    float _1316 = _1268;
    float _1318 = -_1236;
    float _1320 = _1318 + _1312;
    float _1322 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1324 = -_1206;
    float _1326 = _1324 + _1314;
    float _1328 = -_1202;
    float _1330 = _1328 + _1316;
    float _1332 = _1320 * _1320;
    float _1334 = 1.0 / _1322;
    float _1336 = fma(_1326, _1326, _1332);
    float _1338 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1340 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1342 = isnan(0.5);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1330, _1330, _1336);
    float _1352 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1338);
    bool _1354 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1356 = isnan(0.5);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1362 = _1358 || _1360;
    float _1364 = sqrt(_1350);
    float _1366 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1352);
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1370 = _1368 + _1322;
    float _1372 = _1370 * _1334;
    float _1374 = _1372 * 0.5;
    bool _1376 = _1364 > 0.0;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1380 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
    float _1382 = 1.0 / _1380;
    float _1384 = _1322;
    float _1386 = _1334;
    float _1388 = _1364;
    float _1390 = _1350;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1394 = _1312;
    float _1396 = _1316;
    if (!_1376)
    {
        _1384 = _1314;
    }
    float _1398 = _1384;
    float _1400 = _1398;
    float _1402 = _1398;
    if (!_1376)
    {
        _1386 = _1312;
    }
    float _1404 = _1386;
    float _1406 = _1404;
    float _1408 = _1404;
    if (!_1376)
    {
        _1388 = _1316;
    }
    float _1410 = _1388;
    bool _1412 = !_1376;
    float _1414 = _1410;
    if (!_1412)
    {
        float _1416 = _188 * _188;
        float _1418 = rsqrt(_1350);
        float _1420 = fma(_186, _186, _1416);
        float _1422 = fma(_190, _190, _1420);
        float _1424 = sqrt(_1422);
        float _1426 = _1326 * _1418;
        float _1428 = _1320 * _1418;
        float _1430 = _1330 * _1418;
        bool _1432 = _1424 > 0.0;
        float _1434 = _1424;
        _1390 = _1418;
        _1392 = _1426;
        _1260 = _1422;
        if (!_1432)
        {
            _1400 = _1314;
        }
        float _1436 = _1400;
        _1402 = _1436;
        if (!_1432)
        {
            _1406 = _1312;
        }
        float _1438 = _1406;
        _1408 = _1438;
        if (!_1432)
        {
            _1434 = _1316;
        }
        float _1440 = _1434;
        bool _1442 = !_1432;
        _1414 = _1440;
        if (!_1442)
        {
            float _1444 = rsqrt(_1422);
            float _1446 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1448 = _188 * _1444;
            float _1450 = _186 * _1444;
            float _1452 = _190 * _1444;
            float _1454 = _1428 * _1448;
            float _1456 = fma(_1426, _1450, _1454);
            float _1458 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1460 = fma(_1430, _1452, _1456);
            float _1462 = _1460 * _1458;
            float _1464 = fma(_186, _1462, _1314);
            float _1466 = fma(_188, _1462, _1312);
            float _1468 = fma(_190, _1462, _1316);
            _1402 = _1464;
            _1408 = _1466;
            _1414 = _1468;
        }
    }
    float _1470 = _1402;
    float _1472 = _1408;
    float _1474 = _1414;
    float _1476 = _1390;
    float _1478 = _1392;
    float _1480 = _1260;
    float _1482 = _1474;
    float _1484 = _1478;
    float _1486 = _1480;
    if (_1362)
    {
        _1394 = 1.0;
    }
    float _1488 = _1394;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1492 = _1382 * _1490;
    float _1494 = _1488;
    if (_1348)
    {
        _1396 = _1470;
    }
    float _1496 = _1396;
    float _1498 = _1496;
    if (_1348)
    {
        _196 = _1472;
    }
    float _1500 = _196;
    float _1502 = _1500;
    if (!_1348)
    {
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1506 = _1236 + _1504;
        float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1510 = _1206 + _1508;
        float _1512 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1514 = -_1236;
        float _1516 = _1514 + _1472;
        float _1518 = _1506 * _1506;
        float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1522 = _1202 + _1520;
        float _1524 = -_1202;
        float _1526 = _1524 + _1474;
        float _1528 = fma(_1510, _1510, _1518);
        float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1532 = fma(_1522, _1522, _1528);
        float _1534 = sqrt(_1532);
        float _1536 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1538 = precise::min(_1534, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1540 = _1538 * _1530;
        float _1542 = _1536 * _1540;
        float _1544 = -_1206;
        float _1546 = _1544 + _1470;
        float _1548 = fma(_1516, _1542, _1236);
        float _1550 = fma(_1546, _1542, _1206);
        float _1552 = fma(_1526, _1542, _1202);
        _1502 = _1548;
        _1498 = _1550;
        _1482 = _1552;
    }
    float _1554 = _1502;
    float _1556 = _1498;
    float _1558 = _1482;
    if (!_1362)
    {
        float _1560 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1562 = _1560 * 0.15915493667125701904296875;
        float _1564 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1566 = _1562 * 6.283185482025146484375;
        float _1568 = cos(_1566);
        float _1570 = _1564 * 0.15915493667125701904296875;
        float _1572 = _1562 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = 1.0 / _1568;
        float _1578 = _1570 * 6.283185482025146484375;
        float _1580 = cos(_1578);
        float _1582 = _1574 * _1576;
        float _1584 = _1570 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1580 * _1582;
        float _1590 = 1.0 / _1588;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1592;
        float _1596 = 1.0 / _1594;
        float _1598 = _1586 * _1590;
        float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1602 = fma(_1492, _1598, _1600);
        float _1604 = _1602 * _1596;
        float _1606 = precise::clamp(_1604, 0.0, 1.0);
        _1494 = _1606;
    }
    float _1608 = _1494;
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1612 = _1554 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1616 = _1556 + _1614;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1620 = _1558 + _1618;
    float _1622 = _1612 * _1612;
    float _1624 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1626 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1628 = fma(_1616, _1616, _1622);
    float _1630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1632 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1624);
    float _1634 = fma(_1620, _1620, _1628);
    float _1636 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1632);
    float _1638 = rsqrt(_1634);
    float _1640 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1642 = sqrt(_1634);
    float _1644 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1646 = _1616 * _1644;
    float _1648 = _1620 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 + _1652;
    float _1656 = sqrt(_1654);
    bool _1658 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = _1656 + _1660;
    float _1664 = _1382;
    float _1666 = _1662;
    float _1668 = _1630;
    float _1670 = _1646;
    float _1672 = _1648;
    float _1674 = _1650;
    float _1676 = _1652;
    if (_1658)
    {
        float _1678 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1664 = _1678;
    }
    float _1680 = _1664;
    if (_1658)
    {
        float _1682 = _1662 * _1680;
        _1666 = _1682;
    }
    float _1684 = _1666;
    float _1686 = precise::max(0.0, _1630);
    float _1688 = _1686;
    if (_1658)
    {
        float _1690 = rsqrt(_1654);
        _1668 = _1690;
    }
    float _1692 = _1668;
    float _1694 = _1692;
    if (_1658)
    {
        float _1696 = _1684 * 0.15915493667125701904296875;
        _1484 = _1696;
    }
    float _1698 = _1484;
    float _1700 = -_1644;
    float _1702 = -_1686;
    float _1704 = fma(_1612, _1700, _1702);
    if (_1658)
    {
        float _1706 = _1704 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1706;
    }
    float _1708 = _1688;
    float _1710 = _1476;
    float _1712 = _1708;
    if (_1658)
    {
        float _1714 = _1698 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        _1710 = _1716;
    }
    float _1718 = _1710;
    float _1720 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1722 = _1684;
    if (_1658)
    {
        float _1724 = _1698 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        _1722 = _1726;
    }
    float _1728 = _1722;
    float _1730 = _1718;
    if (_1658)
    {
        float _1732 = fma(_1718, _1708, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1486 = _1732;
    }
    float _1734 = _1486;
    float _1736 = floor(_1720);
    if (_1658)
    {
        float _1738 = _1692 * _1734;
        _1730 = _1738;
    }
    float _1740 = _1730;
    if (!_1658)
    {
        _1694 = _1704;
    }
    float _1742 = _1694;
    float _1744 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1746 = _1742;
    if (_1658)
    {
        float _1748 = _1728 + (-1.0);
        _1712 = _1748;
    }
    float _1750 = _1712;
    float _1752 = _1750;
    if (_1658)
    {
        float _1754 = _1646 * _1740;
        _1670 = _1754;
    }
    float _1756 = _1670;
    if (_1658)
    {
        float _1758 = _1648 * _1740;
        _1672 = _1758;
    }
    float _1760 = _1672;
    float _1762 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1744);
    if (_1658)
    {
        float _1764 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1752 = _1764;
    }
    float _1766 = _1752;
    if (_1658)
    {
        float _1768 = _1756 * _1756;
        _1674 = _1768;
    }
    float _1770 = _1674;
    if (_1658)
    {
        float _1772 = _1760 * _1760;
        _1676 = _1772;
    }
    float _1774 = _1676;
    float _1776 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1762);
    if (_1658)
    {
        float _1778 = fma(_1704, _1728, _1766);
        _1746 = _1778;
    }
    float _1780 = _1746;
    float _1782 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1626);
    float _1784 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1786 = fma(_1780, _1780, _1770);
    float _1788 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1792 = _1786 + _1774;
    float _1794 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1796 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1800 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1798);
    float _1802 = precise::clamp(_1800, 0.0, 1.0);
    float _1804 = fma(_1202, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1806 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    float _1808 = rsqrt(_1792);
    float _1810 = -_1802;
    float _1812 = _1810 + 1.0;
    float _1814 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1782);
    float _1816 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1806);
    float _1818 = -_1788;
    float _1820 = fma(_1818, _1796, 1.0);
    float _1822 = -_1736;
    float _1824 = _1720 + _1822;
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1830 = floor(_1804);
    float _1832 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1834 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1790);
    float _1836 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1838 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1834);
    float _1840 = _1808 * _1756;
    float _1842 = abs(_1812);
    float _1844 = log2(_1842);
    float _1846 = _1808 * _1760;
    float _1848 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1838);
    float _1850 = _1808 * _1780;
    float _1852 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1854 = -_1830;
    float _1856 = _1804 + _1854;
    float _1858 = -_1852;
    float _1860 = fma(_1850, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = log2(_1820);
    float _1864 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1832);
    float _1866 = -_1846;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1870 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1864);
    float _1872 = fma(_1868, -0.5, 0.5);
    float _1874 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1876 = 1.0 / _1848;
    float _1878 = fma(_1868, 0.5, 0.5);
    float _1880 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1836);
    float _1882 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1870);
    float _1884 = _1850 + 1.0;
    float _1886 = fma(_1878, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1888 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1880);
    float _1890 = _1862 * 0.693147182464599609375;
    float _1892 = sqrt(_1872);
    float _1894 = fma(_1878, _1886, -0.212114393711090087890625);
    float _1896 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1888);
    float _1898 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1900 = fma(_1878, _1894, 1.570728778839111328125);
    float _1902 = exp2(_1874);
    float _1904 = _1882 * _1876;
    float _1906 = _1896 * _1876;
    float _1908 = fma(_1904, 0.5, 0.5);
    float _1910 = fma(_1906, -0.5, 0.5);
    float _1912 = _1892 * 0.636619746685028076171875;
    float2 _6049 = float2(_1824, _1856);
    float _1914 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6049, float2(0.0), isnan(_6049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6049, float2(0.0), isnan(_6049)), level(0.0)).x;
    float _1916 = -_1850;
    float _1918 = fma(_1902, _1884, _1916);
    float _1920 = -_1900;
    float _1922 = fma(_1912, _1920, 1.0);
    float _1924 = fma(_1918, 0.5, 0.5);
    float3 _6073 = float3(_1908, _1910, _1898);
    float _1926 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6073, float3(0.0), isnan(_6073)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6073, float3(0.0), isnan(_6073)), level(0.0)).x;
    float3 _6084 = float3(_1908, _1910, _1898);
    float4 _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6084, float3(0.0), isnan(_6084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6084, float3(0.0), isnan(_6084)), level(0.0)).xyzw;
    float _1931 = _1929.x;
    float _1933 = _1929.y;
    float _1935 = _1929.z;
    float _1937 = _1929.w;
    float2 _6100 = float2(_1922, _1924);
    float3 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6100, float2(0.0), isnan(_6100)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6100, float2(0.0), isnan(_6100)), level(0.0)).xyz;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    float _1949 = float(uint(_930));
    float _1951 = trunc(_954);
    int _1953 = int(_1951);
    int _1955 = ~_930;
    int _1957 = _1955 + 1;
    float _1959 = _992 * _168;
    bool _1961 = _930 == 0;
    float _1963 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1965 = _930 + (-1);
    int _1967 = abs(_838);
    float _1969 = 1.0 / _1949;
    int _1971 = abs(_854);
    bool _1973 = _750 > 0.5;
    bool _1975 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1977 = isnan(_740);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1983 = _1979 || _1981;
    float _1985 = float(_1983);
    float _1987 = float(uint(_1953));
    float _1989 = trunc(_1959);
    int _1991 = int(_1989);
    int _1993 = as_type<int>(_1969) + (-2);
    float _1995 = exp2(_1963);
    float _1997 = as_type<float>(_1993) * _1987;
    float _1999 = trunc(_1997);
    float _2001 = precise::max(_1999, 0.0);
    uint _2004 = uint(_2001);
    float _2006 = -_1995;
    float _2008 = _2006 + 1.0;
    int _2010 = _1957 * int(_2004);
    int _2012 = _2010 + _1953;
    float _2014 = float(uint(_2012));
    float _2016 = as_type<float>(_1993) * _2014;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2020 = _2018 != 0;
    int _2022 = ~_930;
    int _2024 = _2022 + 1;
    bool _2026 = !_2020;
    float _2028 = _2026 ? 7.345489978790283203125 : 1.0;
    float _2030 = trunc(_2016);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    float _2036 = _2028 * _748;
    float _2038 = float(_1953);
    bool _2040 = _2038 >= _984;
    bool _2042 = isnan(_2038);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan(_984);
    bool _2048 = _2044 || _2046;
    float _2050 = float(_2048);
    float _2052 = trunc(_2050);
    int _2054 = int(_2052);
    int _2056 = int(_2004) + int(_2034);
    float _2058 = floor(_2036);
    int _2060 = _2024 * _2056;
    int _2062 = _2060 + _1953;
    bool _2064 = uint(_2062) >= uint(_930);
    bool _2066 = !_2064;
    int _2068 = _2066 ? 0 : (-1);
    int _2070 = ~_2056;
    int _2072 = _2070 + _2068;
    int _2074 = _2072 + 1;
    float _2076 = -_2058;
    float _2078 = _2036 + _2076;
    int _2080 = ~_2054;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    float _2086 = _2078 * _984;
    int _2088 = _930 * _2074;
    int _2090 = _2088 + _1953;
    float _2092 = -_1985;
    float _2094 = _2092 + 1.0;
    bool _2096 = !_1961;
    int _2098 = _2096 ? _2090 : (-1);
    float _2100 = trunc(_2086);
    int _2102 = int(_2100);
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2106 = _2104 != 0;
    int _2108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2110 = _2108 != 0;
    int _2112 = _2098 * _2084;
    bool _2114 = !_2106;
    int _2116 = _2114 ? 0 : 1;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2120 = _2118 != 0;
    int _2122 = _2054 * _1965;
    int _2124 = _2122 + _2112;
    bool _2126 = !_2120;
    int _2128 = _2126 ? 0 : 1;
    int _2130 = abs(_878);
    int _2132 = _2124 * _1967;
    int _2134 = abs(_2116);
    int _2136 = abs(_2128);
    int _2138 = _2102 * _2134;
    int _2140 = _2138 + _1953;
    int _2142 = _1991 * _1971;
    int _2144 = _2142 + _2132;
    float _2146 = as_type<float>(_2130);
    if (_2110)
    {
        float _2148 = in.m_57.x;
        _2146 = _2148;
    }
    float _2150 = _2146;
    int _2152 = ~_930;
    int _2154 = _2152 + 1;
    int _2156 = _2140 * _2130;
    int _2158 = _2156 + _2144;
    float _2160 = in.m_67.y;
    int _2162 = _2102 * _2136;
    int _2164 = _2162 + _2158;
    float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2168 = _2166 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2170 = in.m_67.x;
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2174 = _2172 != 0;
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2176;
    float _2180 = float(uint(_2164));
    float _2182 = 1.0 / _2168;
    bool _2184 = _1068 != 0.0;
    bool _2186 = isnan(_1068);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.0);
    bool _2192 = _2188 || _2190;
    float _2194 = as_type<float>(_1993) * _2180;
    int _2196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2198 = _2196 != 0;
    bool _2200 = _1066 == 0.0;
    bool _2202 = !_2192;
    bool _2204 = _2200 && _2202;
    float _2206 = trunc(_2194);
    float _2208 = precise::max(_2206, 0.0);
    uint _2210 = uint(_2208);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _2212 = _2150 > 0.5;
    bool _2214 = _2212 && _2110;
    bool _2216 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2218 = isnan(_740);
    bool _2220 = _2216 || _2218;
    bool _2222 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2224 = _2220 || _2222;
    float _2226 = float(_2224);
    float _2228 = in.m_71.x;
    float _2230 = in.m_71.y;
    float _2232 = in.m_71.z;
    bool _2234 = _1070 == 0.0;
    bool _2236 = _2234 && _2204;
    float _2238 = _2178 * _2182;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2242 = _740 + _2240;
    float _2244 = float(uint(_2140));
    float _2246 = fma(_2238, _2242, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2248 = _2238;
    float _2250 = _2170;
    float _2252 = _2160;
    if (_2110)
    {
        _2248 = _2170;
    }
    float _2254 = _2248;
    float _2256 = as_type<float>(_1993) * _2244;
    float _2258 = _2226 * _2094;
    int _2260 = _2154 * int(_2210);
    int _2262 = _2260 + _2164;
    float _2264 = _2254;
    if (_2214)
    {
        float _2266 = -_2254;
        float _2268 = _2266 + 1.0;
        _2264 = _2268;
    }
    float _2270 = _2264;
    float _2272 = _2246 * _2258;
    float _2274 = trunc(_2256);
    float _2276 = precise::max(_2274, 0.0);
    uint _2278 = uint(_2276);
    float _2280 = float(uint(_2262));
    float _2282 = -_2226;
    float _2284 = _2282 + 1.0;
    if (_2110)
    {
        _2250 = _2270;
    }
    float _2286 = _2250;
    float _2288 = as_type<float>(_1993) * _2280;
    float _2290 = -_2160;
    float _2292 = _2290 + 1.0;
    float _2294 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2296 = _2228;
    float _2298 = _2230;
    float _2300 = _2232;
    if (!_2236)
    {
        float _2302 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2228);
        _2296 = _2302;
    }
    float _2304 = _2296;
    if (!_2236)
    {
        float _2306 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2230);
        _2298 = _2306;
    }
    float _2308 = _2298;
    if (!_2236)
    {
        float _2310 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2232);
        _2300 = _2310;
    }
    float _2312 = _2300;
    float _2314 = trunc(_2288);
    float _2316 = precise::max(_2314, 0.0);
    uint _2318 = uint(_2316);
    if (_2174)
    {
        float _2320 = _1973 ? _2292 : _2160;
        _2252 = _2320;
    }
    float _2322 = _2252;
    float _2324 = fma(_800, _2294, _792);
    int _2326 = ~_930;
    int _2328 = _2326 + 1;
    float _2330 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2272);
    float _2332 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2334 = fma(_2322, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2336 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2340 = -_802;
    float _2342 = fma(_940, _2334, _2340);
    int _2344 = ~_930;
    int _2346 = _2344 + 1;
    int _2348 = _2328 * int(_2278);
    int _2350 = _2348 + _2140;
    float _2352 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    int _2354 = int(_2210) + int(_2318);
    float _2356 = abs(_1492);
    float _2358 = log2(_2356);
    float _2360 = float(uint(_2350));
    float _2362 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2330);
    float _2364 = _2342 + 0.5;
    int _2366 = _2346 * _2354;
    int _2368 = _2366 + _2164;
    float _2370 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2372 = as_type<float>(_1993) * _2360;
    float _2374 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2376 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2378 = uint(_2368) >= uint(_930);
    float _2380 = _712 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2382 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2384 = trunc(_2372);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    bool _2390 = !_2378;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2398 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2400 = ~_2354;
    int _2402 = _2400 + _2392;
    int _2404 = _2402 + 1;
    float _2406 = _2324 + 0.5;
    out.m_73.x = _2394;
    out.m_73.y = _2382;
    out.m_73.z = _2338;
    out.m_73.w = _2376;
    float _2408 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2410 = _930 * _2404;
    int _2412 = _2410 + _2164;
    float _2414 = exp2(_2398);
    int _2416 = ~_930;
    int _2418 = _2416 + 1;
    out.m_75.x = _2406;
    out.m_75.y = _2364;
    float _2420 = -_1132;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2408);
    bool _2424 = !_1961;
    int _2426 = _2424 ? _2412 : (-1);
    float _2428 = -_1132;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2396);
    int _2432 = int(_2278) + int(_2388);
    float _2434 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2422);
    float _2436 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2438 = _2426 & 3;
    bool _2440 = _2438 != 0;
    float _2442 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2444 = _2426 >> 31;
    int _2446 = _2418 * _2432;
    int _2448 = _2446 + _2140;
    float _2450 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2452 = -_1132;
    float _2454 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2442);
    int _2456 = _2444 & 3;
    float _2458 = fma(_2414, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    bool _2462 = uint(_2448) >= uint(_930);
    float _2464 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2454);
    int _2466 = _2426 + _2456;
    float _2468 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2470 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2472 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2430);
    int _2474 = _2466 >> 2;
    float _2476 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2468);
    float _2478 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2470);
    float _2480 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2450);
    int _2482 = _2474 << 4;
    int _2484 = _2482 + 368;
    float _2486 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2436);
    float _2488 = _2472 * _2308;
    float _2490 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2476);
    uint _2492 = uint(int(uint(_2484) >> uint(2)));
    uint _2494 = uint(int(uint(int(_2492)) >> uint(2)));
    int _2496 = int(_2492) & 3;
    float _2498 = (*spvDescriptorSet0.vp_c9)._m0[int(_2494)][_2496];
    int _2500 = int(_2492) + 1;
    uint _2502 = uint(int(uint(_2500) >> uint(2)));
    int _2504 = _2500 & 3;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[int(_2502)][_2504];
    float _2508 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2478);
    float _2510 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2480);
    int _2512 = _2426 & 3;
    bool _2514 = _2512 != 0;
    float _2516 = _2460 * _2460;
    float _2518 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2370);
    bool _2520 = uint(_2512) > 1u;
    int _2522 = _2484 + 8;
    uint _2524 = uint(int(uint(_2522) >> uint(2)));
    uint _2526 = uint(int(uint(int(_2524)) >> uint(2)));
    int _2528 = int(_2524) & 3;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[int(_2526)][_2528];
    int _2532 = int(_2524) + 1;
    uint _2534 = uint(int(uint(_2532) >> uint(2)));
    int _2536 = _2532 & 3;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[int(_2534)][_2536];
    float _2540 = _2434 * _2308;
    float _2542 = fma(_2460, -2.0, 3.0);
    int _2544 = _2440 ? 0 : 1;
    float _2546 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2352);
    bool _2548 = _2512 != 3;
    float _2550 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2518);
    int _2552 = ~_2544;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    float _2558 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2486);
    bool _2560 = !_2462;
    int _2562 = _2560 ? 0 : (-1);
    float _2564 = _2464 * _2308;
    bool _2566 = uint(_2512) >= 2u;
    float _2568 = fma(_2508, _2304, _2488);
    int _2570 = _2556;
    if (!_2520)
    {
        int _2572 = ~_2544;
        int _2574 = _2572 + 1;
        _2570 = _2574;
    }
    int _2576 = _2570;
    float _2578 = fma(_2490, _2304, _2540);
    bool _2580 = !_2514;
    int _2582 = _2580 ? 0 : 1;
    float _2584 = _2516 * _2542;
    int _2586 = abs(_2576);
    float _2588 = fma(_2510, _2304, _2564);
    int _2590 = ~_2432;
    int _2592 = _2590 + _2562;
    int _2594 = _2592 + 1;
    float _2596 = fma(_2550, _2312, _2568);
    int _2598 = _2566 ? 0 : 1;
    float _2600 = in.m_77.x;
    bool _2602 = _2512 != 3;
    float _2604 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2606 = abs(_2582);
    int _2608 = _930 * _2594;
    int _2610 = _2608 + _2140;
    float _2612 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2604);
    int _2614 = ~_2598;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    float _2620 = -_1914;
    float _2622 = _2620 + 1.0;
    bool _2624 = !_2602;
    int _2626 = _2624 ? 0 : (-1);
    float _2628 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2612);
    int _2630 = _2618;
    if (_2548)
    {
        int _2632 = ~_2598;
        int _2634 = _2632 + 1;
        _2630 = _2634;
    }
    int _2636 = _2630;
    float _2638 = fma(_2546, _2312, _2578);
    int _2640 = ~_2586;
    int _2642 = _2640 + 1;
    int _2644 = _2642 + 1;
    float _2646 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2628);
    bool _2648 = !_2198;
    int _2650 = _2648 ? 0 : 1;
    float _2652 = fma(_2558, _2312, _2588);
    int _2654 = abs(_2626);
    int _2656 = _2644 * as_type<int>(_2506);
    int _2658 = abs(_2636);
    float _2660 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2662 = ~_2606;
    int _2664 = _2662 + 1;
    int _2666 = _2664 + 1;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1896;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _1848;
    int _2668 = abs(_2650);
    float _2670 = _2660 * _1926;
    int _2672 = _2666 * as_type<int>(_2498);
    int _2674 = _2672 + _2656;
    int _2676 = ~_2658;
    int _2678 = _2676 + 1;
    int _2680 = _2678 + 1;
    float _2682 = -_2660;
    float _2684 = _2682 + 1.0;
    int _2686 = ~_2654;
    int _2688 = _2686 + 1;
    int _2690 = _2688 + 1;
    out.m_79.x = _2638;
    out.m_79.y = _2596;
    out.m_79.z = _2652;
    bool _2692 = _1492 <= 8000.0;
    bool _2694 = isnan(_1492);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(8000.0);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    int _2704 = _2680 * as_type<int>(_2530);
    int _2706 = _2704 + _2674;
    float _2708 = _2646 + _1848;
    bool _2710 = !_1961;
    int _2712 = _2710 ? _2610 : (-1);
    int _2714 = _2690 * as_type<int>(_2538);
    int _2716 = _2714 + _2706;
    float _2718 = -_2584;
    float _2720 = _2718 + 1.0;
    int _2722 = ~_2668;
    int _2724 = _2722 + 1;
    int _2726 = _2724 + 1;
    float _2728 = _2708 * 0.5;
    float _2730 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2584);
    float _2732 = _1848 * 0.5;
    int _2734 = _2716 * _2726;
    float _2736 = _2702 * _2730;
    float _2738 = fma(_1896, -0.5, _2732);
    int _2740 = _2712 * _2668;
    int _2742 = _2740 + _2734;
    float _2744 = _1882 + _1848;
    float _2746 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2748 = _1947 * _2670;
    bool _2750 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2752 = isnan(_1642);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2758 = _2754 || _2756;
    float _2760 = _2744 * 0.5;
    float _2762 = _2622 * _2746;
    float _2764 = precise::clamp(_2762, 0.0, 1.0);
    float _2766 = _1937 * _2670;
    float _2768 = fma(_1937, _2748, _1935);
    float _2770 = float(_2742);
    float _2772 = -_2764;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2760;
    out.m_81.y = _2738;
    out.m_81.z = _2728;
    out.m_81.w = _1848;
    float _2776 = fma(_1943, _2766, _1931);
    float _2778 = fma(_1945, _2766, _1933);
    float _2780 = _2774 * _2600;
    float _2782 = _1937 * _2684;
    out.m_83.x = _2770;
    float _2784 = _2766;
    float _2786 = _2684;
    float _2788 = _2748;
    float _2790 = _2670;
    float _2792 = _2770;
    float _2794 = _2780;
    if (!_2758)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2796 = _2784;
    float _2798 = _2796;
    float _2800 = _2796;
    if (!_2758)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2802 = _2786;
    out.m_85.x = _2776;
    out.m_85.y = _2778;
    out.m_85.z = _2768;
    out.m_85.w = _2782;
    float _2804 = _2802;
    float _2806 = _2802;
    if (!_2758)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2808 = _2788;
    float _2810 = _2808;
    float _2812 = _2808;
    if (!_2758)
    {
        _2790 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2814 = _2790;
    float _2816 = _2780 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2818 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2820 = _2814;
    float _2822 = _2814;
    if (!_2758)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2824 = _2792;
    float _2826 = _2824;
    float _2828 = _2824;
    if (!_2758)
    {
        _2794 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2830 = _2794;
    out.m_87.x = _2816;
    bool _2832 = !_2758;
    float _2834 = _2830;
    float _2836 = _2830;
    if (!_2832)
    {
        bool _2838 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2840 = isnan(_1642);
        bool _2842 = _2838 || _2840;
        bool _2844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2846 = _2842 || _2844;
        if (!_2846)
        {
            float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2850 = _1642 + _2848;
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2854 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2852;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2860 = 1.0 / _2854;
            float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2878 = _2850 * _2860;
            float _2880 = precise::clamp(_2878, 0.0, 1.0);
            float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2886 = fma(_2880, _2858, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2888 = fma(_2880, _2884, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2890 = fma(_2880, _2864, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2892 = fma(_2880, _2868, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2894 = fma(_2880, _2872, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2896 = fma(_2880, _2876, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2806 = _2890;
            _2822 = _2894;
            _2800 = _2886;
            _2812 = _2892;
            _2828 = _2888;
            _2836 = _2896;
            _2898 = true;
        }
        else
        {
            bool _2900 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2902 = isnan(_1642);
            bool _2904 = _2900 || _2902;
            bool _2906 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2908 = _2904 || _2906;
            if (!_2908)
            {
                _2798 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2910 = _2798;
            _2800 = _2910;
            if (!_2908)
            {
                _2804 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2912 = _2804;
            _2806 = _2912;
            if (!_2908)
            {
                _2826 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2914 = _2826;
            _2828 = _2914;
            if (!_2908)
            {
                _2810 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2916 = _2810;
            _2812 = _2916;
            if (!_2908)
            {
                _2820 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2918 = _2820;
            _2822 = _2918;
            if (!_2908)
            {
                _2834 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2920 = _2834;
            bool _2922 = !_2908;
            _2836 = _2920;
            if (!_2922)
            {
                bool _2924 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2926 = isnan(_1642);
                bool _2928 = _2924 || _2926;
                bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2932 = _2928 || _2930;
                if (!_2932)
                {
                    float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2936 = _1642 + _2934;
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2940 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2938;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2946 = 1.0 / _2940;
                    float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2952 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2954 = _2952 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2962 = _2960 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2964 = _2936 * _2946;
                    float _2966 = precise::clamp(_2964, 0.0, 1.0);
                    float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2970 = _2968 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2972 = fma(_2966, _2944, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2974 = fma(_2966, _2970, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2976 = fma(_2966, _2950, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2978 = fma(_2966, _2954, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2980 = fma(_2966, _2958, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2982 = fma(_2966, _2962, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2806 = _2976;
                    _2822 = _2980;
                    _2800 = _2972;
                    _2812 = _2978;
                    _2828 = _2974;
                    _2836 = _2982;
                    _2898 = true;
                }
                else
                {
                    _2806 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2822 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2800 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2812 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2828 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2836 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2898 = false;
    float _2984 = _2806;
    float _2986 = _2822;
    float _2988 = _2800;
    float _2990 = _2812;
    float _2992 = _2828;
    float _2994 = _2836;
    float _2996 = _2818 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2998 = fma(_2596, -0.5, 0.5);
    float _3000 = precise::clamp(_2998, 0.0, 1.0);
    float _3002 = -_2984;
    float _3004 = _3002 + _2986;
    float _3006 = -_2988;
    float _3008 = _3006 + _2990;
    out.m_53.x = _2996;
    float _3010 = -_2992;
    float _3012 = _3010 + _2994;
    float _3014 = fma(_3000, _3004, _2984);
    float _3016 = fma(_3000, _3008, _2988);
    bool _3018 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3020 = _3014 * 0.586610972881317138671875;
    float _3022 = fma(_3000, _3012, _2992);
    out.m_89.x = 0.0;
    bool _3024 = _1608 > 0.0;
    bool _3026 = isnan(_1608);
    bool _3028 = _3024 || _3026;
    bool _3030 = isnan(0.0);
    bool _3032 = _3028 || _3030;
    float _3034 = fma(_3016, 0.298911988735198974609375, _3020);
    float _3036 = fma(_3022, 0.114477999508380889892578125, _3034);
    float _3038 = -_3036;
    float _3040 = _3016 + _3038;
    float _3042 = -_3036;
    float _3044 = _3014 + _3042;
    float _3046 = -_3036;
    float _3048 = _3022 + _3046;
    float _3050 = fma(_3040, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3036);
    float _3052 = fma(_3044, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3036);
    float _3054 = fma(_3048, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3036);
    bool _3056 = !_3018;
    if (!_3056)
    {
        float _3058 = -_1554;
        float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3062 = -_1556;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3066 = -_1558;
        float _3068 = _3066 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3070 = _3060 * _3060;
        float _3072 = fma(_3064, _3064, _3070);
        float _3074 = fma(_3068, _3068, _3072);
        float _3076 = sqrt(_3074);
        float _3078 = rsqrt(_3074);
        float _3080 = -_3076;
        float _3082 = _3080 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3084 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3086 = precise::clamp(_3084, 0.0, 1.0);
        float _3088 = _3064 * _3078;
        float _3090 = _3060 * _3078;
        float _3092 = abs(_3086);
        float _3094 = log2(_3092);
        float _3096 = _3068 * _3078;
        float _3098 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3100 = _2596 * _3090;
        float _3102 = -_3090;
        float _3104 = -_3098;
        float _3106 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3104);
        float _3108 = fma(_2638, _3088, _3100);
        float _3110 = -_3096;
        float _3112 = fma(_3110, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3106);
        float _3114 = fma(_2652, _3096, _3108);
        float _3116 = precise::clamp(_3114, 0.0, 1.0);
        float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3120 = _3112 + _3118;
        float _3122 = _3094 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3124 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3126 = precise::clamp(_3124, 0.0, 1.0);
        float _3128 = exp2(_3122);
        float _3130 = _3128 * _3126;
        float _3132 = _3116 * _3130;
        float _3134 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3136 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3138 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3134;
        out.m_89.y = _3136;
        out.m_89.z = _3138;
    }
    out.m_91.x = _3050;
    out.m_91.y = _3052;
    out.m_91.z = _3054;
    if (_3032)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3140 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3140;
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
    bool _2898 = false;
    bool _634 = false;
    bool _498 = false;
    bool _324 = false;
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
    float _124 = as_type<float>(_112);
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
        float _3209 = as_type<float>(_134);
        out.gl_Position.z = _3209;
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
        float _3264 = as_type<float>(_160);
        out.gl_Position.z = _3264;
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
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _238;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = _250 * _254;
    float _266 = -_250;
    float _268 = _266 + 1.0;
    float _270 = _222 * _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = _276 * _264;
    float _286 = fma(_280, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = _282 * _264;
    float _290 = _286 * _264;
    float _292 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _294 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _296 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _298 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _294);
    float _302 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].z, _296);
    bool _304 = !_262;
    float _322;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _322 = _320;
        _324 = true;
    }
    else
    {
        _322 = _172;
    }
    _324 = false;
    float _326 = _322;
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = _326 + _334;
    bool _338 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _340 = isnan(_326);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _358 = 1.0 / _352;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = 1.0 / _356;
    float _364 = _300 * _330;
    float _366 = _302 * _332;
    bool _368 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _370 = isnan(_326);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -_348;
    float _382 = _380 + 1.0;
    float _384 = _336 * _358;
    bool _386 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _388 = isnan(_326);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _400 = _326 + _398;
    float _402 = _378 * _382;
    float _404 = -_378;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _416;
    float _420 = _396 * _406;
    float _422 = fma(_410, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_414, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = fma(_418, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _428 = _400 * _362;
    float _430 = _422 * _420;
    float _432 = _424 * _420;
    float _434 = _426 * _420;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _444 = -_396;
    float _446 = _444 + 1.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _452 = fma(_438, _428, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _454 = fma(_442, _428, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _456 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _458 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _460 = fma(_450, _428, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _462 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _464 = fma(_452, _402, _456);
    float _466 = fma(_454, _402, _458);
    float _468 = fma(_460, _402, _462);
    float _470 = _298 * _328;
    float _472 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].x, _464);
    float _474 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].y, _466);
    float _476 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].z, _468);
    bool _478 = !_360;
    float _496;
    if (!_478)
    {
        float _480 = in.m_57.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _172;
    }
    _498 = false;
    float _500 = _496;
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
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _562 = _536 * _558;
    float _564 = -_536;
    float _566 = _564 + 1.0;
    float _568 = 1.0 / _524;
    float _570 = _540 * _554;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _576 = fma(_570, _504, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _578 = -_552;
    float _580 = _578 + 1.0;
    float _582 = _576 * _562;
    float _584 = _574 * _568;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = _500 + _586;
    float _590 = _520 * _580;
    float _592 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _594 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _596 = fma(_584, _588, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _598 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _600 = _476 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _602 = fma(_596, _590, _592);
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _602);
    float _610 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _604;
    out.m_61.y = _606;
    out.m_61.z = _610;
    out.m_61.w = _612;
    bool _614 = !_560;
    float _632;
    if (!_614)
    {
        float _616 = in.m_57.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        _632 = _172;
    }
    _634 = false;
    float _636 = _632;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _674;
    float _678 = 1.0 / _656;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _682 = _668 * _672;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _640 * _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _690;
    float _694 = fma(_676, _688, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _696;
    float _700 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _702 = _694 * _682;
    float _704 = fma(_698, _688, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _706 = _700 * _682;
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].x, _702);
    float _710 = _704 * _682;
    float _712 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].x, _708);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].y, _710);
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].z, _706);
    float _718 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].y, _714);
    float _720 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].z, _716);
    bool _722 = !_680;
    if (!_722)
    {
        float _724 = in.m_57.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _194 = _738;
    }
    float _740 = _194;
    float _742 = in.m_57.z;
    float _744 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _746 = log2(_744);
    float _748 = in.m_57.x;
    float _750 = in.m_57.y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _756 = int(_754);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _762 = 1.0 + _760;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _766 = 1.0 / _762;
    float _768 = _742 * 2.0;
    float _770 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _772 = _748 * 2.0;
    float _774 = floor(_768);
    float _776 = _750 * 2.0;
    float _778 = -_752;
    float _780 = fma(_770, 2.0, _778);
    float _782 = _746 * _116;
    float _784 = _750 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = _750 + _748;
    float _788 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].z, _764);
    float _790 = -_116;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _794 = floor(_772);
    float _796 = fma(_784, -2.0, _758);
    float _798 = _786 + (-1.0);
    float _800 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _788);
    float _802 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    float _804 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _806 = _774 >= 0.0;
    bool _808 = isnan(_774);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = exp2(_782);
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _824 = _822 != 0;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _828 = _826 != 0;
    int _830 = _814 ? 0 : 1;
    bool _832 = _794 > 0.0;
    float _834 = floor(_776);
    bool _836 = !_824;
    int _838 = _836 ? 0 : 1;
    bool _840 = _774 > 0.0;
    bool _842 = _794 >= 0.0;
    bool _844 = isnan(_794);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    bool _852 = !_820;
    int _854 = _852 ? 0 : 1;
    float _856 = -_816;
    float _858 = _856 + 1.0;
    bool _860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _868 = _864 || _866;
    int _870 = ~_830;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    bool _876 = !_828;
    int _878 = _876 ? 0 : 1;
    float _880 = float(_756);
    bool _882 = _834 > 0.0;
    float _884 = in.m_63.x;
    float _886 = in.m_63.y;
    float _888 = in.m_63.z;
    bool _890 = _834 >= 0.0;
    bool _892 = isnan(_834);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = 1.0 / _880;
    int _902 = _874;
    if (!_840)
    {
        int _904 = ~_830;
        int _906 = _904 + 1;
        _902 = _906;
    }
    int _908 = _902;
    float _910 = _868 ? _858 : 0.0;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _924 = _922 != 0;
    float _926 = float(_908);
    float _928 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _930 = int(_928);
    float _932 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[78].w, _912);
    bool _934 = !_916;
    int _936 = _934 ? 0 : 1;
    int _938 = _850 ? 0 : 1;
    float _940 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _932);
    int _942 = abs(_936);
    bool _944 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _946 = isnan(1.0);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _952 = _948 || _950;
    float _954 = _900 * _116;
    float _956 = float(_942);
    bool _958 = !_920;
    int _960 = _958 ? 0 : 1;
    int _962 = ~_938;
    int _964 = _962 + 1;
    int _966 = _964 + 1;
    float _968 = _956 * _926;
    int _970 = _966;
    if (!_832)
    {
        int _972 = ~_938;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    float _978 = _748 + (-0.5);
    int _980 = abs(_960);
    float _982 = _968 * (-2.0);
    float _984 = float(_930);
    int _986 = _898 ? 0 : 1;
    float _988 = fma(_982, _884, _884);
    float _990 = float(_976);
    float _992 = _984 * _116;
    float _994 = float(_980);
    if (_952)
    {
        float _996 = _910 * _766;
        _126 = _996;
    }
    float _998 = _126;
    bool _1000 = !_924;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = fma(_804, _982, _804);
    int _1006 = ~_986;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].x, _988);
    int _1014 = _1010;
    if (!_882)
    {
        int _1016 = ~_986;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = _994 * _990;
    int _1024 = abs(_1002);
    float _1026 = _750 + _742;
    float _1028 = fma(_1004, _998, _1012);
    float _1030 = _1022 * (-2.0);
    float _1032 = float(_1020);
    float _1034 = _1026 + (-1.0);
    float _1036 = float(_1024);
    float _1038 = fma(_1030, _886, _886);
    float _1040 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = _742 + _748;
    float _1044 = _1036 * _1032;
    float _1046 = _750 + (-0.5);
    float _1048 = fma(_1040, _1030, _1040);
    float _1050 = _1042 + (-1.0);
    float _1052 = _1044 * (-2.0);
    float _1054 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1038);
    float _1056 = _742 + (-0.5);
    float _1058 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1060 = fma(_1052, _888, _888);
    float _1062 = fma(_1048, _998, _1054);
    float _1064 = _1028 * 0.15915493667125701904296875;
    float _1066 = in.m_65.x;
    float _1068 = in.m_65.y;
    float _1070 = in.m_65.z;
    float _1072 = fma(_1058, _1052, _1058);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1060);
    float _1076 = _1062 * 0.15915493667125701904296875;
    float _1078 = _1064 * 6.283185482025146484375;
    float _1080 = cos(_1078);
    float _1082 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1084 = fma(_1072, _998, _1074);
    float _1086 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1088 = _1084 * 0.15915493667125701904296875;
    float _1090 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1092 = _1076 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = in.m_46.x;
    float _1098 = in.m_46.y;
    float _1100 = in.m_46.z;
    float _1102 = _1076 * 6.283185482025146484375;
    float _1104 = cos(_1102);
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1066);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1068);
    float _1110 = _1064 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = _1082 * _1106;
    float _1116 = _1090 * _1108;
    float _1118 = _1088 * 6.283185482025146484375;
    float _1120 = cos(_1118);
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1070);
    float _1124 = _1080 * _1104;
    float _1126 = _1086 * _1122;
    float _1128 = _1080 * _1094;
    float _1130 = _1088 * 6.283185482025146484375;
    float _1132 = sin(_1130);
    float _1134 = _1112 * _1094;
    float _1136 = _1112 * _1104;
    float _1138 = _1080 * _1120;
    float _1140 = _1112 * _1120;
    float _1142 = _1104 * _1120;
    float _1144 = _1094 * _1120;
    float _1146 = _1138 * _1116;
    float _1148 = _1140 * _1116;
    float _1150 = fma(_1132, _1124, _1134);
    float _1152 = -_1128;
    float _1154 = fma(_1132, _1136, _1152);
    float _1156 = -_1136;
    float _1158 = fma(_1132, _1128, _1156);
    float _1160 = -_1116;
    float _1162 = _1132 * _1160;
    float _1164 = fma(_1150, _1114, _1146);
    float _1166 = fma(_1154, _1114, _1148);
    float _1168 = fma(_1132, _1134, _1124);
    float _1170 = fma(_1142, _1114, _1162);
    float _1172 = fma(_1158, _1126, _1164);
    float _1174 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1176 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1178 = fma(_1144, _1126, _1170);
    float _1180 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1182 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1184 = fma(_1168, _1126, _1166);
    float _1186 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1174);
    float _1188 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1180);
    float _1190 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1176);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1182);
    float _1194 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1186);
    float _1196 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1188);
    float _1198 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1190);
    float _1200 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1192);
    float _1202 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1210 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1212 = _1202 + _1204;
    float _1214 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1216 = _1206 + _1208;
    float _1218 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1210);
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1222 = _1212 + _1220;
    float _1224 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1214);
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1228 = _1216 + _1226;
    float _1230 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1218);
    float _1232 = _1222 * _1222;
    float _1234 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1224);
    float _1236 = _1230 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1238 = fma(_1228, _1228, _1232);
    float _1240 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1242 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1244 = sqrt(_1238);
    float _1246 = _1236 + _1240;
    float _1248 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1242);
    float _1250 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1248);
    bool _1252 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1248;
    float _1256 = _1242;
    float _1258 = _1240;
    float _1260 = _1214;
    if (!_1252)
    {
        _1254 = _1216;
    }
    float _1262 = _1254;
    float _1264 = _1262;
    if (!_1252)
    {
        _1256 = _1212;
    }
    float _1266 = _1256;
    float _1268 = _1266;
    if (!_1252)
    {
        _1258 = _1246;
    }
    float _1270 = _1258;
    bool _1272 = !_1252;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1244 + _1278;
        float _1282 = rsqrt(_1238);
        float _1284 = _1280 * _1276;
        float _1286 = _1246 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = _1292 + (-1.0);
        float _1300 = fma(_1296, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1302 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = _1282 * _1300;
        float _1306 = fma(_1246, _1292, _1302);
        float _1308 = fma(_1228, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1310 = fma(_1222, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1274 = _1306;
        _1264 = _1308;
        _1268 = _1310;
    }
    float _1312 = _1274;
    float _1314 = _1264;
    float _1316 = _1268;
    float _1318 = -_1236;
    float _1320 = _1318 + _1312;
    float _1322 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1324 = -_1206;
    float _1326 = _1324 + _1314;
    float _1328 = -_1202;
    float _1330 = _1328 + _1316;
    float _1332 = _1320 * _1320;
    float _1334 = 1.0 / _1322;
    float _1336 = fma(_1326, _1326, _1332);
    float _1338 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1340 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1342 = isnan(0.5);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1330, _1330, _1336);
    float _1352 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1338);
    bool _1354 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1356 = isnan(0.5);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1362 = _1358 || _1360;
    float _1364 = sqrt(_1350);
    float _1366 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1352);
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1370 = _1368 + _1322;
    float _1372 = _1370 * _1334;
    float _1374 = _1372 * 0.5;
    bool _1376 = _1364 > 0.0;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1380 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
    float _1382 = 1.0 / _1380;
    float _1384 = _1322;
    float _1386 = _1334;
    float _1388 = _1364;
    float _1390 = _1350;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1394 = _1312;
    float _1396 = _1316;
    if (!_1376)
    {
        _1384 = _1314;
    }
    float _1398 = _1384;
    float _1400 = _1398;
    float _1402 = _1398;
    if (!_1376)
    {
        _1386 = _1312;
    }
    float _1404 = _1386;
    float _1406 = _1404;
    float _1408 = _1404;
    if (!_1376)
    {
        _1388 = _1316;
    }
    float _1410 = _1388;
    bool _1412 = !_1376;
    float _1414 = _1410;
    if (!_1412)
    {
        float _1416 = _188 * _188;
        float _1418 = rsqrt(_1350);
        float _1420 = fma(_186, _186, _1416);
        float _1422 = fma(_190, _190, _1420);
        float _1424 = sqrt(_1422);
        float _1426 = _1326 * _1418;
        float _1428 = _1320 * _1418;
        float _1430 = _1330 * _1418;
        bool _1432 = _1424 > 0.0;
        float _1434 = _1424;
        _1390 = _1418;
        _1392 = _1426;
        _1260 = _1422;
        if (!_1432)
        {
            _1400 = _1314;
        }
        float _1436 = _1400;
        _1402 = _1436;
        if (!_1432)
        {
            _1406 = _1312;
        }
        float _1438 = _1406;
        _1408 = _1438;
        if (!_1432)
        {
            _1434 = _1316;
        }
        float _1440 = _1434;
        bool _1442 = !_1432;
        _1414 = _1440;
        if (!_1442)
        {
            float _1444 = rsqrt(_1422);
            float _1446 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1448 = _188 * _1444;
            float _1450 = _186 * _1444;
            float _1452 = _190 * _1444;
            float _1454 = _1428 * _1448;
            float _1456 = fma(_1426, _1450, _1454);
            float _1458 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1460 = fma(_1430, _1452, _1456);
            float _1462 = _1460 * _1458;
            float _1464 = fma(_186, _1462, _1314);
            float _1466 = fma(_188, _1462, _1312);
            float _1468 = fma(_190, _1462, _1316);
            _1402 = _1464;
            _1408 = _1466;
            _1414 = _1468;
        }
    }
    float _1470 = _1402;
    float _1472 = _1408;
    float _1474 = _1414;
    float _1476 = _1390;
    float _1478 = _1392;
    float _1480 = _1260;
    float _1482 = _1474;
    float _1484 = _1478;
    float _1486 = _1480;
    if (_1362)
    {
        _1394 = 1.0;
    }
    float _1488 = _1394;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1492 = _1382 * _1490;
    float _1494 = _1488;
    if (_1348)
    {
        _1396 = _1470;
    }
    float _1496 = _1396;
    float _1498 = _1496;
    if (_1348)
    {
        _196 = _1472;
    }
    float _1500 = _196;
    float _1502 = _1500;
    if (!_1348)
    {
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1506 = _1236 + _1504;
        float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1510 = _1206 + _1508;
        float _1512 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1514 = -_1236;
        float _1516 = _1514 + _1472;
        float _1518 = _1506 * _1506;
        float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1522 = _1202 + _1520;
        float _1524 = -_1202;
        float _1526 = _1524 + _1474;
        float _1528 = fma(_1510, _1510, _1518);
        float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1532 = fma(_1522, _1522, _1528);
        float _1534 = sqrt(_1532);
        float _1536 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1538 = precise::min(_1534, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1540 = _1538 * _1530;
        float _1542 = _1536 * _1540;
        float _1544 = -_1206;
        float _1546 = _1544 + _1470;
        float _1548 = fma(_1516, _1542, _1236);
        float _1550 = fma(_1546, _1542, _1206);
        float _1552 = fma(_1526, _1542, _1202);
        _1502 = _1548;
        _1498 = _1550;
        _1482 = _1552;
    }
    float _1554 = _1502;
    float _1556 = _1498;
    float _1558 = _1482;
    if (!_1362)
    {
        float _1560 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1562 = _1560 * 0.15915493667125701904296875;
        float _1564 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1566 = _1562 * 6.283185482025146484375;
        float _1568 = cos(_1566);
        float _1570 = _1564 * 0.15915493667125701904296875;
        float _1572 = _1562 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = 1.0 / _1568;
        float _1578 = _1570 * 6.283185482025146484375;
        float _1580 = cos(_1578);
        float _1582 = _1574 * _1576;
        float _1584 = _1570 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1580 * _1582;
        float _1590 = 1.0 / _1588;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1592;
        float _1596 = 1.0 / _1594;
        float _1598 = _1586 * _1590;
        float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1602 = fma(_1492, _1598, _1600);
        float _1604 = _1602 * _1596;
        float _1606 = precise::clamp(_1604, 0.0, 1.0);
        _1494 = _1606;
    }
    float _1608 = _1494;
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1612 = _1554 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1616 = _1556 + _1614;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1620 = _1558 + _1618;
    float _1622 = _1612 * _1612;
    float _1624 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1626 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1628 = fma(_1616, _1616, _1622);
    float _1630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1632 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1624);
    float _1634 = fma(_1620, _1620, _1628);
    float _1636 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1632);
    float _1638 = rsqrt(_1634);
    float _1640 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1642 = sqrt(_1634);
    float _1644 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1646 = _1616 * _1644;
    float _1648 = _1620 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 + _1652;
    float _1656 = sqrt(_1654);
    bool _1658 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = _1656 + _1660;
    float _1664 = _1382;
    float _1666 = _1662;
    float _1668 = _1630;
    float _1670 = _1646;
    float _1672 = _1648;
    float _1674 = _1650;
    float _1676 = _1652;
    if (_1658)
    {
        float _1678 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1664 = _1678;
    }
    float _1680 = _1664;
    if (_1658)
    {
        float _1682 = _1662 * _1680;
        _1666 = _1682;
    }
    float _1684 = _1666;
    float _1686 = precise::max(0.0, _1630);
    float _1688 = _1686;
    if (_1658)
    {
        float _1690 = rsqrt(_1654);
        _1668 = _1690;
    }
    float _1692 = _1668;
    float _1694 = _1692;
    if (_1658)
    {
        float _1696 = _1684 * 0.15915493667125701904296875;
        _1484 = _1696;
    }
    float _1698 = _1484;
    float _1700 = -_1644;
    float _1702 = -_1686;
    float _1704 = fma(_1612, _1700, _1702);
    if (_1658)
    {
        float _1706 = _1704 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1706;
    }
    float _1708 = _1688;
    float _1710 = _1476;
    float _1712 = _1708;
    if (_1658)
    {
        float _1714 = _1698 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        _1710 = _1716;
    }
    float _1718 = _1710;
    float _1720 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1722 = _1684;
    if (_1658)
    {
        float _1724 = _1698 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        _1722 = _1726;
    }
    float _1728 = _1722;
    float _1730 = _1718;
    if (_1658)
    {
        float _1732 = fma(_1718, _1708, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1486 = _1732;
    }
    float _1734 = _1486;
    float _1736 = floor(_1720);
    if (_1658)
    {
        float _1738 = _1692 * _1734;
        _1730 = _1738;
    }
    float _1740 = _1730;
    if (!_1658)
    {
        _1694 = _1704;
    }
    float _1742 = _1694;
    float _1744 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1746 = _1742;
    if (_1658)
    {
        float _1748 = _1728 + (-1.0);
        _1712 = _1748;
    }
    float _1750 = _1712;
    float _1752 = _1750;
    if (_1658)
    {
        float _1754 = _1646 * _1740;
        _1670 = _1754;
    }
    float _1756 = _1670;
    if (_1658)
    {
        float _1758 = _1648 * _1740;
        _1672 = _1758;
    }
    float _1760 = _1672;
    float _1762 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1744);
    if (_1658)
    {
        float _1764 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1752 = _1764;
    }
    float _1766 = _1752;
    if (_1658)
    {
        float _1768 = _1756 * _1756;
        _1674 = _1768;
    }
    float _1770 = _1674;
    if (_1658)
    {
        float _1772 = _1760 * _1760;
        _1676 = _1772;
    }
    float _1774 = _1676;
    float _1776 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1762);
    if (_1658)
    {
        float _1778 = fma(_1704, _1728, _1766);
        _1746 = _1778;
    }
    float _1780 = _1746;
    float _1782 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1626);
    float _1784 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1786 = fma(_1780, _1780, _1770);
    float _1788 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1792 = _1786 + _1774;
    float _1794 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1796 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1800 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1798);
    float _1802 = precise::clamp(_1800, 0.0, 1.0);
    float _1804 = fma(_1202, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1806 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    float _1808 = rsqrt(_1792);
    float _1810 = -_1802;
    float _1812 = _1810 + 1.0;
    float _1814 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1782);
    float _1816 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1806);
    float _1818 = -_1788;
    float _1820 = fma(_1818, _1796, 1.0);
    float _1822 = -_1736;
    float _1824 = _1720 + _1822;
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1830 = floor(_1804);
    float _1832 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1834 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1790);
    float _1836 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1838 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1834);
    float _1840 = _1808 * _1756;
    float _1842 = abs(_1812);
    float _1844 = log2(_1842);
    float _1846 = _1808 * _1760;
    float _1848 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1838);
    float _1850 = _1808 * _1780;
    float _1852 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1854 = -_1830;
    float _1856 = _1804 + _1854;
    float _1858 = -_1852;
    float _1860 = fma(_1850, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = log2(_1820);
    float _1864 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1832);
    float _1866 = -_1846;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1870 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1864);
    float _1872 = fma(_1868, -0.5, 0.5);
    float _1874 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1876 = 1.0 / _1848;
    float _1878 = fma(_1868, 0.5, 0.5);
    float _1880 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1836);
    float _1882 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1870);
    float _1884 = _1850 + 1.0;
    float _1886 = fma(_1878, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1888 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1880);
    float _1890 = _1862 * 0.693147182464599609375;
    float _1892 = sqrt(_1872);
    float _1894 = fma(_1878, _1886, -0.212114393711090087890625);
    float _1896 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1888);
    float _1898 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1900 = fma(_1878, _1894, 1.570728778839111328125);
    float _1902 = exp2(_1874);
    float _1904 = _1882 * _1876;
    float _1906 = _1896 * _1876;
    float _1908 = fma(_1904, 0.5, 0.5);
    float _1910 = fma(_1906, -0.5, 0.5);
    float _1912 = _1892 * 0.636619746685028076171875;
    float2 _6049 = float2(_1824, _1856);
    float _1914 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6049, float2(0.0), isnan(_6049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6049, float2(0.0), isnan(_6049)), level(0.0)).x;
    float _1916 = -_1850;
    float _1918 = fma(_1902, _1884, _1916);
    float _1920 = -_1900;
    float _1922 = fma(_1912, _1920, 1.0);
    float _1924 = fma(_1918, 0.5, 0.5);
    float3 _6073 = float3(_1908, _1910, _1898);
    float _1926 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6073, float3(0.0), isnan(_6073)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6073, float3(0.0), isnan(_6073)), level(0.0)).x;
    float3 _6084 = float3(_1908, _1910, _1898);
    float4 _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6084, float3(0.0), isnan(_6084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6084, float3(0.0), isnan(_6084)), level(0.0)).xyzw;
    float _1931 = _1929.x;
    float _1933 = _1929.y;
    float _1935 = _1929.z;
    float _1937 = _1929.w;
    float2 _6100 = float2(_1922, _1924);
    float3 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6100, float2(0.0), isnan(_6100)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6100, float2(0.0), isnan(_6100)), level(0.0)).xyz;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    float _1949 = float(uint(_930));
    float _1951 = trunc(_954);
    int _1953 = int(_1951);
    int _1955 = ~_930;
    int _1957 = _1955 + 1;
    float _1959 = _992 * _168;
    bool _1961 = _930 == 0;
    float _1963 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1965 = _930 + (-1);
    int _1967 = abs(_838);
    float _1969 = 1.0 / _1949;
    int _1971 = abs(_854);
    bool _1973 = _750 > 0.5;
    bool _1975 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1977 = isnan(_740);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1983 = _1979 || _1981;
    float _1985 = float(_1983);
    float _1987 = float(uint(_1953));
    float _1989 = trunc(_1959);
    int _1991 = int(_1989);
    int _1993 = as_type<int>(_1969) + (-2);
    float _1995 = exp2(_1963);
    float _1997 = as_type<float>(_1993) * _1987;
    float _1999 = trunc(_1997);
    float _2001 = precise::max(_1999, 0.0);
    uint _2004 = uint(_2001);
    float _2006 = -_1995;
    float _2008 = _2006 + 1.0;
    int _2010 = _1957 * int(_2004);
    int _2012 = _2010 + _1953;
    float _2014 = float(uint(_2012));
    float _2016 = as_type<float>(_1993) * _2014;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2020 = _2018 != 0;
    int _2022 = ~_930;
    int _2024 = _2022 + 1;
    bool _2026 = !_2020;
    float _2028 = _2026 ? 7.345489978790283203125 : 1.0;
    float _2030 = trunc(_2016);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    float _2036 = _2028 * _748;
    float _2038 = float(_1953);
    bool _2040 = _2038 >= _984;
    bool _2042 = isnan(_2038);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan(_984);
    bool _2048 = _2044 || _2046;
    float _2050 = float(_2048);
    float _2052 = trunc(_2050);
    int _2054 = int(_2052);
    int _2056 = int(_2004) + int(_2034);
    float _2058 = floor(_2036);
    int _2060 = _2024 * _2056;
    int _2062 = _2060 + _1953;
    bool _2064 = uint(_2062) >= uint(_930);
    bool _2066 = !_2064;
    int _2068 = _2066 ? 0 : (-1);
    int _2070 = ~_2056;
    int _2072 = _2070 + _2068;
    int _2074 = _2072 + 1;
    float _2076 = -_2058;
    float _2078 = _2036 + _2076;
    int _2080 = ~_2054;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    float _2086 = _2078 * _984;
    int _2088 = _930 * _2074;
    int _2090 = _2088 + _1953;
    float _2092 = -_1985;
    float _2094 = _2092 + 1.0;
    bool _2096 = !_1961;
    int _2098 = _2096 ? _2090 : (-1);
    float _2100 = trunc(_2086);
    int _2102 = int(_2100);
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2106 = _2104 != 0;
    int _2108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2110 = _2108 != 0;
    int _2112 = _2098 * _2084;
    bool _2114 = !_2106;
    int _2116 = _2114 ? 0 : 1;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2120 = _2118 != 0;
    int _2122 = _2054 * _1965;
    int _2124 = _2122 + _2112;
    bool _2126 = !_2120;
    int _2128 = _2126 ? 0 : 1;
    int _2130 = abs(_878);
    int _2132 = _2124 * _1967;
    int _2134 = abs(_2116);
    int _2136 = abs(_2128);
    int _2138 = _2102 * _2134;
    int _2140 = _2138 + _1953;
    int _2142 = _1991 * _1971;
    int _2144 = _2142 + _2132;
    float _2146 = as_type<float>(_2130);
    if (_2110)
    {
        float _2148 = in.m_57.x;
        _2146 = _2148;
    }
    float _2150 = _2146;
    int _2152 = ~_930;
    int _2154 = _2152 + 1;
    int _2156 = _2140 * _2130;
    int _2158 = _2156 + _2144;
    float _2160 = in.m_67.y;
    int _2162 = _2102 * _2136;
    int _2164 = _2162 + _2158;
    float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2168 = _2166 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2170 = in.m_67.x;
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2174 = _2172 != 0;
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2176;
    float _2180 = float(uint(_2164));
    float _2182 = 1.0 / _2168;
    bool _2184 = _1068 != 0.0;
    bool _2186 = isnan(_1068);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.0);
    bool _2192 = _2188 || _2190;
    float _2194 = as_type<float>(_1993) * _2180;
    int _2196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2198 = _2196 != 0;
    bool _2200 = _1066 == 0.0;
    bool _2202 = !_2192;
    bool _2204 = _2200 && _2202;
    float _2206 = trunc(_2194);
    float _2208 = precise::max(_2206, 0.0);
    uint _2210 = uint(_2208);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _2212 = _2150 > 0.5;
    bool _2214 = _2212 && _2110;
    bool _2216 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2218 = isnan(_740);
    bool _2220 = _2216 || _2218;
    bool _2222 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2224 = _2220 || _2222;
    float _2226 = float(_2224);
    float _2228 = in.m_71.x;
    float _2230 = in.m_71.y;
    float _2232 = in.m_71.z;
    bool _2234 = _1070 == 0.0;
    bool _2236 = _2234 && _2204;
    float _2238 = _2178 * _2182;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2242 = _740 + _2240;
    float _2244 = float(uint(_2140));
    float _2246 = fma(_2238, _2242, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2248 = _2238;
    float _2250 = _2170;
    float _2252 = _2160;
    if (_2110)
    {
        _2248 = _2170;
    }
    float _2254 = _2248;
    float _2256 = as_type<float>(_1993) * _2244;
    float _2258 = _2226 * _2094;
    int _2260 = _2154 * int(_2210);
    int _2262 = _2260 + _2164;
    float _2264 = _2254;
    if (_2214)
    {
        float _2266 = -_2254;
        float _2268 = _2266 + 1.0;
        _2264 = _2268;
    }
    float _2270 = _2264;
    float _2272 = _2246 * _2258;
    float _2274 = trunc(_2256);
    float _2276 = precise::max(_2274, 0.0);
    uint _2278 = uint(_2276);
    float _2280 = float(uint(_2262));
    float _2282 = -_2226;
    float _2284 = _2282 + 1.0;
    if (_2110)
    {
        _2250 = _2270;
    }
    float _2286 = _2250;
    float _2288 = as_type<float>(_1993) * _2280;
    float _2290 = -_2160;
    float _2292 = _2290 + 1.0;
    float _2294 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2296 = _2228;
    float _2298 = _2230;
    float _2300 = _2232;
    if (!_2236)
    {
        float _2302 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2228);
        _2296 = _2302;
    }
    float _2304 = _2296;
    if (!_2236)
    {
        float _2306 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2230);
        _2298 = _2306;
    }
    float _2308 = _2298;
    if (!_2236)
    {
        float _2310 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2232);
        _2300 = _2310;
    }
    float _2312 = _2300;
    float _2314 = trunc(_2288);
    float _2316 = precise::max(_2314, 0.0);
    uint _2318 = uint(_2316);
    if (_2174)
    {
        float _2320 = _1973 ? _2292 : _2160;
        _2252 = _2320;
    }
    float _2322 = _2252;
    float _2324 = fma(_800, _2294, _792);
    int _2326 = ~_930;
    int _2328 = _2326 + 1;
    float _2330 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2272);
    float _2332 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2334 = fma(_2322, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2336 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2340 = -_802;
    float _2342 = fma(_940, _2334, _2340);
    int _2344 = ~_930;
    int _2346 = _2344 + 1;
    int _2348 = _2328 * int(_2278);
    int _2350 = _2348 + _2140;
    float _2352 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    int _2354 = int(_2210) + int(_2318);
    float _2356 = abs(_1492);
    float _2358 = log2(_2356);
    float _2360 = float(uint(_2350));
    float _2362 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2330);
    float _2364 = _2342 + 0.5;
    int _2366 = _2346 * _2354;
    int _2368 = _2366 + _2164;
    float _2370 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2372 = as_type<float>(_1993) * _2360;
    float _2374 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2376 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2378 = uint(_2368) >= uint(_930);
    float _2380 = _712 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2382 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2384 = trunc(_2372);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    bool _2390 = !_2378;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2398 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2400 = ~_2354;
    int _2402 = _2400 + _2392;
    int _2404 = _2402 + 1;
    float _2406 = _2324 + 0.5;
    out.m_73.x = _2394;
    out.m_73.y = _2382;
    out.m_73.z = _2338;
    out.m_73.w = _2376;
    float _2408 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2410 = _930 * _2404;
    int _2412 = _2410 + _2164;
    float _2414 = exp2(_2398);
    int _2416 = ~_930;
    int _2418 = _2416 + 1;
    out.m_75.x = _2406;
    out.m_75.y = _2364;
    float _2420 = -_1132;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2408);
    bool _2424 = !_1961;
    int _2426 = _2424 ? _2412 : (-1);
    float _2428 = -_1132;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2396);
    int _2432 = int(_2278) + int(_2388);
    float _2434 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2422);
    float _2436 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2438 = _2426 & 3;
    bool _2440 = _2438 != 0;
    float _2442 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2444 = _2426 >> 31;
    int _2446 = _2418 * _2432;
    int _2448 = _2446 + _2140;
    float _2450 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2452 = -_1132;
    float _2454 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2442);
    int _2456 = _2444 & 3;
    float _2458 = fma(_2414, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    bool _2462 = uint(_2448) >= uint(_930);
    float _2464 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2454);
    int _2466 = _2426 + _2456;
    float _2468 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2470 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2472 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2430);
    int _2474 = _2466 >> 2;
    float _2476 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2468);
    float _2478 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2470);
    float _2480 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2450);
    int _2482 = _2474 << 4;
    int _2484 = _2482 + 368;
    float _2486 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2436);
    float _2488 = _2472 * _2308;
    float _2490 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2476);
    uint _2492 = uint(int(uint(_2484) >> uint(2)));
    uint _2494 = uint(int(uint(int(_2492)) >> uint(2)));
    int _2496 = int(_2492) & 3;
    float _2498 = (*spvDescriptorSet0.vp_c9)._m0[int(_2494)][_2496];
    int _2500 = int(_2492) + 1;
    uint _2502 = uint(int(uint(_2500) >> uint(2)));
    int _2504 = _2500 & 3;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[int(_2502)][_2504];
    float _2508 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2478);
    float _2510 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2480);
    int _2512 = _2426 & 3;
    bool _2514 = _2512 != 0;
    float _2516 = _2460 * _2460;
    float _2518 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2370);
    bool _2520 = uint(_2512) > 1u;
    int _2522 = _2484 + 8;
    uint _2524 = uint(int(uint(_2522) >> uint(2)));
    uint _2526 = uint(int(uint(int(_2524)) >> uint(2)));
    int _2528 = int(_2524) & 3;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[int(_2526)][_2528];
    int _2532 = int(_2524) + 1;
    uint _2534 = uint(int(uint(_2532) >> uint(2)));
    int _2536 = _2532 & 3;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[int(_2534)][_2536];
    float _2540 = _2434 * _2308;
    float _2542 = fma(_2460, -2.0, 3.0);
    int _2544 = _2440 ? 0 : 1;
    float _2546 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2352);
    bool _2548 = _2512 != 3;
    float _2550 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2518);
    int _2552 = ~_2544;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    float _2558 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2486);
    bool _2560 = !_2462;
    int _2562 = _2560 ? 0 : (-1);
    float _2564 = _2464 * _2308;
    bool _2566 = uint(_2512) >= 2u;
    float _2568 = fma(_2508, _2304, _2488);
    int _2570 = _2556;
    if (!_2520)
    {
        int _2572 = ~_2544;
        int _2574 = _2572 + 1;
        _2570 = _2574;
    }
    int _2576 = _2570;
    float _2578 = fma(_2490, _2304, _2540);
    bool _2580 = !_2514;
    int _2582 = _2580 ? 0 : 1;
    float _2584 = _2516 * _2542;
    int _2586 = abs(_2576);
    float _2588 = fma(_2510, _2304, _2564);
    int _2590 = ~_2432;
    int _2592 = _2590 + _2562;
    int _2594 = _2592 + 1;
    float _2596 = fma(_2550, _2312, _2568);
    int _2598 = _2566 ? 0 : 1;
    float _2600 = in.m_77.x;
    bool _2602 = _2512 != 3;
    float _2604 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2606 = abs(_2582);
    int _2608 = _930 * _2594;
    int _2610 = _2608 + _2140;
    float _2612 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2604);
    int _2614 = ~_2598;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    float _2620 = -_1914;
    float _2622 = _2620 + 1.0;
    bool _2624 = !_2602;
    int _2626 = _2624 ? 0 : (-1);
    float _2628 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2612);
    int _2630 = _2618;
    if (_2548)
    {
        int _2632 = ~_2598;
        int _2634 = _2632 + 1;
        _2630 = _2634;
    }
    int _2636 = _2630;
    float _2638 = fma(_2546, _2312, _2578);
    int _2640 = ~_2586;
    int _2642 = _2640 + 1;
    int _2644 = _2642 + 1;
    float _2646 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2628);
    bool _2648 = !_2198;
    int _2650 = _2648 ? 0 : 1;
    float _2652 = fma(_2558, _2312, _2588);
    int _2654 = abs(_2626);
    int _2656 = _2644 * as_type<int>(_2506);
    int _2658 = abs(_2636);
    float _2660 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2662 = ~_2606;
    int _2664 = _2662 + 1;
    int _2666 = _2664 + 1;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1896;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _1848;
    int _2668 = abs(_2650);
    float _2670 = _2660 * _1926;
    int _2672 = _2666 * as_type<int>(_2498);
    int _2674 = _2672 + _2656;
    int _2676 = ~_2658;
    int _2678 = _2676 + 1;
    int _2680 = _2678 + 1;
    float _2682 = -_2660;
    float _2684 = _2682 + 1.0;
    int _2686 = ~_2654;
    int _2688 = _2686 + 1;
    int _2690 = _2688 + 1;
    out.m_79.x = _2638;
    out.m_79.y = _2596;
    out.m_79.z = _2652;
    bool _2692 = _1492 <= 8000.0;
    bool _2694 = isnan(_1492);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(8000.0);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    int _2704 = _2680 * as_type<int>(_2530);
    int _2706 = _2704 + _2674;
    float _2708 = _2646 + _1848;
    bool _2710 = !_1961;
    int _2712 = _2710 ? _2610 : (-1);
    int _2714 = _2690 * as_type<int>(_2538);
    int _2716 = _2714 + _2706;
    float _2718 = -_2584;
    float _2720 = _2718 + 1.0;
    int _2722 = ~_2668;
    int _2724 = _2722 + 1;
    int _2726 = _2724 + 1;
    float _2728 = _2708 * 0.5;
    float _2730 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2584);
    float _2732 = _1848 * 0.5;
    int _2734 = _2716 * _2726;
    float _2736 = _2702 * _2730;
    float _2738 = fma(_1896, -0.5, _2732);
    int _2740 = _2712 * _2668;
    int _2742 = _2740 + _2734;
    float _2744 = _1882 + _1848;
    float _2746 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2748 = _1947 * _2670;
    bool _2750 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2752 = isnan(_1642);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2758 = _2754 || _2756;
    float _2760 = _2744 * 0.5;
    float _2762 = _2622 * _2746;
    float _2764 = precise::clamp(_2762, 0.0, 1.0);
    float _2766 = _1937 * _2670;
    float _2768 = fma(_1937, _2748, _1935);
    float _2770 = float(_2742);
    float _2772 = -_2764;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2760;
    out.m_81.y = _2738;
    out.m_81.z = _2728;
    out.m_81.w = _1848;
    float _2776 = fma(_1943, _2766, _1931);
    float _2778 = fma(_1945, _2766, _1933);
    float _2780 = _2774 * _2600;
    float _2782 = _1937 * _2684;
    out.m_83.x = _2770;
    float _2784 = _2766;
    float _2786 = _2684;
    float _2788 = _2748;
    float _2790 = _2670;
    float _2792 = _2770;
    float _2794 = _2780;
    if (!_2758)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2796 = _2784;
    float _2798 = _2796;
    float _2800 = _2796;
    if (!_2758)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2802 = _2786;
    out.m_85.x = _2776;
    out.m_85.y = _2778;
    out.m_85.z = _2768;
    out.m_85.w = _2782;
    float _2804 = _2802;
    float _2806 = _2802;
    if (!_2758)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2808 = _2788;
    float _2810 = _2808;
    float _2812 = _2808;
    if (!_2758)
    {
        _2790 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2814 = _2790;
    float _2816 = _2780 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2818 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2820 = _2814;
    float _2822 = _2814;
    if (!_2758)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2824 = _2792;
    float _2826 = _2824;
    float _2828 = _2824;
    if (!_2758)
    {
        _2794 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2830 = _2794;
    out.m_87.x = _2816;
    bool _2832 = !_2758;
    float _2834 = _2830;
    float _2836 = _2830;
    if (!_2832)
    {
        bool _2838 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2840 = isnan(_1642);
        bool _2842 = _2838 || _2840;
        bool _2844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2846 = _2842 || _2844;
        if (!_2846)
        {
            float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2850 = _1642 + _2848;
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2854 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2852;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2860 = 1.0 / _2854;
            float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2878 = _2850 * _2860;
            float _2880 = precise::clamp(_2878, 0.0, 1.0);
            float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2886 = fma(_2880, _2858, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2888 = fma(_2880, _2884, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2890 = fma(_2880, _2864, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2892 = fma(_2880, _2868, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2894 = fma(_2880, _2872, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2896 = fma(_2880, _2876, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2806 = _2890;
            _2822 = _2894;
            _2800 = _2886;
            _2812 = _2892;
            _2828 = _2888;
            _2836 = _2896;
            _2898 = true;
        }
        else
        {
            bool _2900 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2902 = isnan(_1642);
            bool _2904 = _2900 || _2902;
            bool _2906 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2908 = _2904 || _2906;
            if (!_2908)
            {
                _2798 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2910 = _2798;
            _2800 = _2910;
            if (!_2908)
            {
                _2804 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2912 = _2804;
            _2806 = _2912;
            if (!_2908)
            {
                _2826 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2914 = _2826;
            _2828 = _2914;
            if (!_2908)
            {
                _2810 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2916 = _2810;
            _2812 = _2916;
            if (!_2908)
            {
                _2820 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2918 = _2820;
            _2822 = _2918;
            if (!_2908)
            {
                _2834 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2920 = _2834;
            bool _2922 = !_2908;
            _2836 = _2920;
            if (!_2922)
            {
                bool _2924 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2926 = isnan(_1642);
                bool _2928 = _2924 || _2926;
                bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2932 = _2928 || _2930;
                if (!_2932)
                {
                    float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2936 = _1642 + _2934;
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2940 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2938;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2946 = 1.0 / _2940;
                    float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2952 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2954 = _2952 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2962 = _2960 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2964 = _2936 * _2946;
                    float _2966 = precise::clamp(_2964, 0.0, 1.0);
                    float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2970 = _2968 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2972 = fma(_2966, _2944, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2974 = fma(_2966, _2970, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2976 = fma(_2966, _2950, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2978 = fma(_2966, _2954, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2980 = fma(_2966, _2958, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2982 = fma(_2966, _2962, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2806 = _2976;
                    _2822 = _2980;
                    _2800 = _2972;
                    _2812 = _2978;
                    _2828 = _2974;
                    _2836 = _2982;
                    _2898 = true;
                }
                else
                {
                    _2806 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2822 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2800 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2812 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2828 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2836 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2898 = false;
    float _2984 = _2806;
    float _2986 = _2822;
    float _2988 = _2800;
    float _2990 = _2812;
    float _2992 = _2828;
    float _2994 = _2836;
    float _2996 = _2818 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2998 = fma(_2596, -0.5, 0.5);
    float _3000 = precise::clamp(_2998, 0.0, 1.0);
    float _3002 = -_2984;
    float _3004 = _3002 + _2986;
    float _3006 = -_2988;
    float _3008 = _3006 + _2990;
    out.m_53.x = _2996;
    float _3010 = -_2992;
    float _3012 = _3010 + _2994;
    float _3014 = fma(_3000, _3004, _2984);
    float _3016 = fma(_3000, _3008, _2988);
    bool _3018 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3020 = _3014 * 0.586610972881317138671875;
    float _3022 = fma(_3000, _3012, _2992);
    out.m_89.x = 0.0;
    bool _3024 = _1608 > 0.0;
    bool _3026 = isnan(_1608);
    bool _3028 = _3024 || _3026;
    bool _3030 = isnan(0.0);
    bool _3032 = _3028 || _3030;
    float _3034 = fma(_3016, 0.298911988735198974609375, _3020);
    float _3036 = fma(_3022, 0.114477999508380889892578125, _3034);
    float _3038 = -_3036;
    float _3040 = _3016 + _3038;
    float _3042 = -_3036;
    float _3044 = _3014 + _3042;
    float _3046 = -_3036;
    float _3048 = _3022 + _3046;
    float _3050 = fma(_3040, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3036);
    float _3052 = fma(_3044, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3036);
    float _3054 = fma(_3048, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3036);
    bool _3056 = !_3018;
    if (!_3056)
    {
        float _3058 = -_1554;
        float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3062 = -_1556;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3066 = -_1558;
        float _3068 = _3066 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3070 = _3060 * _3060;
        float _3072 = fma(_3064, _3064, _3070);
        float _3074 = fma(_3068, _3068, _3072);
        float _3076 = sqrt(_3074);
        float _3078 = rsqrt(_3074);
        float _3080 = -_3076;
        float _3082 = _3080 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3084 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3086 = precise::clamp(_3084, 0.0, 1.0);
        float _3088 = _3064 * _3078;
        float _3090 = _3060 * _3078;
        float _3092 = abs(_3086);
        float _3094 = log2(_3092);
        float _3096 = _3068 * _3078;
        float _3098 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3100 = _2596 * _3090;
        float _3102 = -_3090;
        float _3104 = -_3098;
        float _3106 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3104);
        float _3108 = fma(_2638, _3088, _3100);
        float _3110 = -_3096;
        float _3112 = fma(_3110, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3106);
        float _3114 = fma(_2652, _3096, _3108);
        float _3116 = precise::clamp(_3114, 0.0, 1.0);
        float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3120 = _3112 + _3118;
        float _3122 = _3094 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3124 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3126 = precise::clamp(_3124, 0.0, 1.0);
        float _3128 = exp2(_3122);
        float _3130 = _3128 * _3126;
        float _3132 = _3116 * _3130;
        float _3134 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3136 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3138 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3134;
        out.m_89.y = _3136;
        out.m_89.z = _3138;
    }
    out.m_91.x = _3050;
    out.m_91.y = _3052;
    out.m_91.z = _3054;
    if (_3032)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3140 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3140;
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
    bool _2898 = false;
    bool _634 = false;
    bool _498 = false;
    bool _324 = false;
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
    float _124 = as_type<float>(_112);
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
        float _3209 = as_type<float>(_134);
        out.gl_Position.z = _3209;
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
        float _3264 = as_type<float>(_160);
        out.gl_Position.z = _3264;
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
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _238;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = _250 * _254;
    float _266 = -_250;
    float _268 = _266 + 1.0;
    float _270 = _222 * _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = _276 * _264;
    float _286 = fma(_280, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = _282 * _264;
    float _290 = _286 * _264;
    float _292 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _294 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _296 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _298 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _294);
    float _302 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].z, _296);
    bool _304 = !_262;
    float _322;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _322 = _320;
        _324 = true;
    }
    else
    {
        _322 = _172;
    }
    _324 = false;
    float _326 = _322;
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = _326 + _334;
    bool _338 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _340 = isnan(_326);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _358 = 1.0 / _352;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = 1.0 / _356;
    float _364 = _300 * _330;
    float _366 = _302 * _332;
    bool _368 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _370 = isnan(_326);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -_348;
    float _382 = _380 + 1.0;
    float _384 = _336 * _358;
    bool _386 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _388 = isnan(_326);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _400 = _326 + _398;
    float _402 = _378 * _382;
    float _404 = -_378;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _416;
    float _420 = _396 * _406;
    float _422 = fma(_410, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_414, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = fma(_418, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _428 = _400 * _362;
    float _430 = _422 * _420;
    float _432 = _424 * _420;
    float _434 = _426 * _420;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _444 = -_396;
    float _446 = _444 + 1.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _452 = fma(_438, _428, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _454 = fma(_442, _428, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _456 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _458 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _460 = fma(_450, _428, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _462 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _464 = fma(_452, _402, _456);
    float _466 = fma(_454, _402, _458);
    float _468 = fma(_460, _402, _462);
    float _470 = _298 * _328;
    float _472 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].x, _464);
    float _474 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].y, _466);
    float _476 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].z, _468);
    bool _478 = !_360;
    float _496;
    if (!_478)
    {
        float _480 = in.m_57.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _172;
    }
    _498 = false;
    float _500 = _496;
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
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _562 = _536 * _558;
    float _564 = -_536;
    float _566 = _564 + 1.0;
    float _568 = 1.0 / _524;
    float _570 = _540 * _554;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _576 = fma(_570, _504, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _578 = -_552;
    float _580 = _578 + 1.0;
    float _582 = _576 * _562;
    float _584 = _574 * _568;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = _500 + _586;
    float _590 = _520 * _580;
    float _592 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _594 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _596 = fma(_584, _588, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _598 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _600 = _476 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _602 = fma(_596, _590, _592);
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _602);
    float _610 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _604;
    out.m_61.y = _606;
    out.m_61.z = _610;
    out.m_61.w = _612;
    bool _614 = !_560;
    float _632;
    if (!_614)
    {
        float _616 = in.m_57.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        _632 = _172;
    }
    _634 = false;
    float _636 = _632;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _674;
    float _678 = 1.0 / _656;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _682 = _668 * _672;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _640 * _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _690;
    float _694 = fma(_676, _688, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _696;
    float _700 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _702 = _694 * _682;
    float _704 = fma(_698, _688, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _706 = _700 * _682;
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].x, _702);
    float _710 = _704 * _682;
    float _712 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].x, _708);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].y, _710);
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].z, _706);
    float _718 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].y, _714);
    float _720 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].z, _716);
    bool _722 = !_680;
    if (!_722)
    {
        float _724 = in.m_57.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _194 = _738;
    }
    float _740 = _194;
    float _742 = in.m_57.z;
    float _744 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _746 = log2(_744);
    float _748 = in.m_57.x;
    float _750 = in.m_57.y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _756 = int(_754);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _762 = 1.0 + _760;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _766 = 1.0 / _762;
    float _768 = _742 * 2.0;
    float _770 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _772 = _748 * 2.0;
    float _774 = floor(_768);
    float _776 = _750 * 2.0;
    float _778 = -_752;
    float _780 = fma(_770, 2.0, _778);
    float _782 = _746 * _116;
    float _784 = _750 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = _750 + _748;
    float _788 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].z, _764);
    float _790 = -_116;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _794 = floor(_772);
    float _796 = fma(_784, -2.0, _758);
    float _798 = _786 + (-1.0);
    float _800 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _788);
    float _802 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    float _804 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _806 = _774 >= 0.0;
    bool _808 = isnan(_774);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = exp2(_782);
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _824 = _822 != 0;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _828 = _826 != 0;
    int _830 = _814 ? 0 : 1;
    bool _832 = _794 > 0.0;
    float _834 = floor(_776);
    bool _836 = !_824;
    int _838 = _836 ? 0 : 1;
    bool _840 = _774 > 0.0;
    bool _842 = _794 >= 0.0;
    bool _844 = isnan(_794);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    bool _852 = !_820;
    int _854 = _852 ? 0 : 1;
    float _856 = -_816;
    float _858 = _856 + 1.0;
    bool _860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _868 = _864 || _866;
    int _870 = ~_830;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    bool _876 = !_828;
    int _878 = _876 ? 0 : 1;
    float _880 = float(_756);
    bool _882 = _834 > 0.0;
    float _884 = in.m_63.x;
    float _886 = in.m_63.y;
    float _888 = in.m_63.z;
    bool _890 = _834 >= 0.0;
    bool _892 = isnan(_834);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = 1.0 / _880;
    int _902 = _874;
    if (!_840)
    {
        int _904 = ~_830;
        int _906 = _904 + 1;
        _902 = _906;
    }
    int _908 = _902;
    float _910 = _868 ? _858 : 0.0;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _924 = _922 != 0;
    float _926 = float(_908);
    float _928 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _930 = int(_928);
    float _932 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[78].w, _912);
    bool _934 = !_916;
    int _936 = _934 ? 0 : 1;
    int _938 = _850 ? 0 : 1;
    float _940 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _932);
    int _942 = abs(_936);
    bool _944 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _946 = isnan(1.0);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _952 = _948 || _950;
    float _954 = _900 * _116;
    float _956 = float(_942);
    bool _958 = !_920;
    int _960 = _958 ? 0 : 1;
    int _962 = ~_938;
    int _964 = _962 + 1;
    int _966 = _964 + 1;
    float _968 = _956 * _926;
    int _970 = _966;
    if (!_832)
    {
        int _972 = ~_938;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    float _978 = _748 + (-0.5);
    int _980 = abs(_960);
    float _982 = _968 * (-2.0);
    float _984 = float(_930);
    int _986 = _898 ? 0 : 1;
    float _988 = fma(_982, _884, _884);
    float _990 = float(_976);
    float _992 = _984 * _116;
    float _994 = float(_980);
    if (_952)
    {
        float _996 = _910 * _766;
        _126 = _996;
    }
    float _998 = _126;
    bool _1000 = !_924;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = fma(_804, _982, _804);
    int _1006 = ~_986;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].x, _988);
    int _1014 = _1010;
    if (!_882)
    {
        int _1016 = ~_986;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = _994 * _990;
    int _1024 = abs(_1002);
    float _1026 = _750 + _742;
    float _1028 = fma(_1004, _998, _1012);
    float _1030 = _1022 * (-2.0);
    float _1032 = float(_1020);
    float _1034 = _1026 + (-1.0);
    float _1036 = float(_1024);
    float _1038 = fma(_1030, _886, _886);
    float _1040 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = _742 + _748;
    float _1044 = _1036 * _1032;
    float _1046 = _750 + (-0.5);
    float _1048 = fma(_1040, _1030, _1040);
    float _1050 = _1042 + (-1.0);
    float _1052 = _1044 * (-2.0);
    float _1054 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1038);
    float _1056 = _742 + (-0.5);
    float _1058 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1060 = fma(_1052, _888, _888);
    float _1062 = fma(_1048, _998, _1054);
    float _1064 = _1028 * 0.15915493667125701904296875;
    float _1066 = in.m_65.x;
    float _1068 = in.m_65.y;
    float _1070 = in.m_65.z;
    float _1072 = fma(_1058, _1052, _1058);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1060);
    float _1076 = _1062 * 0.15915493667125701904296875;
    float _1078 = _1064 * 6.283185482025146484375;
    float _1080 = cos(_1078);
    float _1082 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1084 = fma(_1072, _998, _1074);
    float _1086 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1088 = _1084 * 0.15915493667125701904296875;
    float _1090 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1092 = _1076 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = in.m_46.x;
    float _1098 = in.m_46.y;
    float _1100 = in.m_46.z;
    float _1102 = _1076 * 6.283185482025146484375;
    float _1104 = cos(_1102);
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1066);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1068);
    float _1110 = _1064 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = _1082 * _1106;
    float _1116 = _1090 * _1108;
    float _1118 = _1088 * 6.283185482025146484375;
    float _1120 = cos(_1118);
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1070);
    float _1124 = _1080 * _1104;
    float _1126 = _1086 * _1122;
    float _1128 = _1080 * _1094;
    float _1130 = _1088 * 6.283185482025146484375;
    float _1132 = sin(_1130);
    float _1134 = _1112 * _1094;
    float _1136 = _1112 * _1104;
    float _1138 = _1080 * _1120;
    float _1140 = _1112 * _1120;
    float _1142 = _1104 * _1120;
    float _1144 = _1094 * _1120;
    float _1146 = _1138 * _1116;
    float _1148 = _1140 * _1116;
    float _1150 = fma(_1132, _1124, _1134);
    float _1152 = -_1128;
    float _1154 = fma(_1132, _1136, _1152);
    float _1156 = -_1136;
    float _1158 = fma(_1132, _1128, _1156);
    float _1160 = -_1116;
    float _1162 = _1132 * _1160;
    float _1164 = fma(_1150, _1114, _1146);
    float _1166 = fma(_1154, _1114, _1148);
    float _1168 = fma(_1132, _1134, _1124);
    float _1170 = fma(_1142, _1114, _1162);
    float _1172 = fma(_1158, _1126, _1164);
    float _1174 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1176 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1178 = fma(_1144, _1126, _1170);
    float _1180 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1182 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1184 = fma(_1168, _1126, _1166);
    float _1186 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1174);
    float _1188 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1180);
    float _1190 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1176);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1182);
    float _1194 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1186);
    float _1196 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1188);
    float _1198 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1190);
    float _1200 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1192);
    float _1202 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1210 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1212 = _1202 + _1204;
    float _1214 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1216 = _1206 + _1208;
    float _1218 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1210);
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1222 = _1212 + _1220;
    float _1224 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1214);
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1228 = _1216 + _1226;
    float _1230 = fma(_1100, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1218);
    float _1232 = _1222 * _1222;
    float _1234 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1224);
    float _1236 = _1230 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1238 = fma(_1228, _1228, _1232);
    float _1240 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1242 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1244 = sqrt(_1238);
    float _1246 = _1236 + _1240;
    float _1248 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1242);
    float _1250 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1248);
    bool _1252 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1248;
    float _1256 = _1242;
    float _1258 = _1240;
    float _1260 = _1214;
    if (!_1252)
    {
        _1254 = _1216;
    }
    float _1262 = _1254;
    float _1264 = _1262;
    if (!_1252)
    {
        _1256 = _1212;
    }
    float _1266 = _1256;
    float _1268 = _1266;
    if (!_1252)
    {
        _1258 = _1246;
    }
    float _1270 = _1258;
    bool _1272 = !_1252;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1244 + _1278;
        float _1282 = rsqrt(_1238);
        float _1284 = _1280 * _1276;
        float _1286 = _1246 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = _1292 + (-1.0);
        float _1300 = fma(_1296, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1302 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = _1282 * _1300;
        float _1306 = fma(_1246, _1292, _1302);
        float _1308 = fma(_1228, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1310 = fma(_1222, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1274 = _1306;
        _1264 = _1308;
        _1268 = _1310;
    }
    float _1312 = _1274;
    float _1314 = _1264;
    float _1316 = _1268;
    float _1318 = -_1236;
    float _1320 = _1318 + _1312;
    float _1322 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1324 = -_1206;
    float _1326 = _1324 + _1314;
    float _1328 = -_1202;
    float _1330 = _1328 + _1316;
    float _1332 = _1320 * _1320;
    float _1334 = 1.0 / _1322;
    float _1336 = fma(_1326, _1326, _1332);
    float _1338 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1340 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1342 = isnan(0.5);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1330, _1330, _1336);
    float _1352 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1338);
    bool _1354 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1356 = isnan(0.5);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1362 = _1358 || _1360;
    float _1364 = sqrt(_1350);
    float _1366 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1352);
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1370 = _1368 + _1322;
    float _1372 = _1370 * _1334;
    float _1374 = _1372 * 0.5;
    bool _1376 = _1364 > 0.0;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1380 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
    float _1382 = 1.0 / _1380;
    float _1384 = _1322;
    float _1386 = _1334;
    float _1388 = _1364;
    float _1390 = _1350;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1394 = _1312;
    float _1396 = _1316;
    if (!_1376)
    {
        _1384 = _1314;
    }
    float _1398 = _1384;
    float _1400 = _1398;
    float _1402 = _1398;
    if (!_1376)
    {
        _1386 = _1312;
    }
    float _1404 = _1386;
    float _1406 = _1404;
    float _1408 = _1404;
    if (!_1376)
    {
        _1388 = _1316;
    }
    float _1410 = _1388;
    bool _1412 = !_1376;
    float _1414 = _1410;
    if (!_1412)
    {
        float _1416 = _188 * _188;
        float _1418 = rsqrt(_1350);
        float _1420 = fma(_186, _186, _1416);
        float _1422 = fma(_190, _190, _1420);
        float _1424 = sqrt(_1422);
        float _1426 = _1326 * _1418;
        float _1428 = _1320 * _1418;
        float _1430 = _1330 * _1418;
        bool _1432 = _1424 > 0.0;
        float _1434 = _1424;
        _1390 = _1418;
        _1392 = _1426;
        _1260 = _1422;
        if (!_1432)
        {
            _1400 = _1314;
        }
        float _1436 = _1400;
        _1402 = _1436;
        if (!_1432)
        {
            _1406 = _1312;
        }
        float _1438 = _1406;
        _1408 = _1438;
        if (!_1432)
        {
            _1434 = _1316;
        }
        float _1440 = _1434;
        bool _1442 = !_1432;
        _1414 = _1440;
        if (!_1442)
        {
            float _1444 = rsqrt(_1422);
            float _1446 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1448 = _188 * _1444;
            float _1450 = _186 * _1444;
            float _1452 = _190 * _1444;
            float _1454 = _1428 * _1448;
            float _1456 = fma(_1426, _1450, _1454);
            float _1458 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1460 = fma(_1430, _1452, _1456);
            float _1462 = _1460 * _1458;
            float _1464 = fma(_186, _1462, _1314);
            float _1466 = fma(_188, _1462, _1312);
            float _1468 = fma(_190, _1462, _1316);
            _1402 = _1464;
            _1408 = _1466;
            _1414 = _1468;
        }
    }
    float _1470 = _1402;
    float _1472 = _1408;
    float _1474 = _1414;
    float _1476 = _1390;
    float _1478 = _1392;
    float _1480 = _1260;
    float _1482 = _1474;
    float _1484 = _1478;
    float _1486 = _1480;
    if (_1362)
    {
        _1394 = 1.0;
    }
    float _1488 = _1394;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1492 = _1382 * _1490;
    float _1494 = _1488;
    if (_1348)
    {
        _1396 = _1470;
    }
    float _1496 = _1396;
    float _1498 = _1496;
    if (_1348)
    {
        _196 = _1472;
    }
    float _1500 = _196;
    float _1502 = _1500;
    if (!_1348)
    {
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1506 = _1236 + _1504;
        float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1510 = _1206 + _1508;
        float _1512 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1514 = -_1236;
        float _1516 = _1514 + _1472;
        float _1518 = _1506 * _1506;
        float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1522 = _1202 + _1520;
        float _1524 = -_1202;
        float _1526 = _1524 + _1474;
        float _1528 = fma(_1510, _1510, _1518);
        float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1532 = fma(_1522, _1522, _1528);
        float _1534 = sqrt(_1532);
        float _1536 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1538 = precise::min(_1534, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1540 = _1538 * _1530;
        float _1542 = _1536 * _1540;
        float _1544 = -_1206;
        float _1546 = _1544 + _1470;
        float _1548 = fma(_1516, _1542, _1236);
        float _1550 = fma(_1546, _1542, _1206);
        float _1552 = fma(_1526, _1542, _1202);
        _1502 = _1548;
        _1498 = _1550;
        _1482 = _1552;
    }
    float _1554 = _1502;
    float _1556 = _1498;
    float _1558 = _1482;
    if (!_1362)
    {
        float _1560 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1562 = _1560 * 0.15915493667125701904296875;
        float _1564 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1566 = _1562 * 6.283185482025146484375;
        float _1568 = cos(_1566);
        float _1570 = _1564 * 0.15915493667125701904296875;
        float _1572 = _1562 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = 1.0 / _1568;
        float _1578 = _1570 * 6.283185482025146484375;
        float _1580 = cos(_1578);
        float _1582 = _1574 * _1576;
        float _1584 = _1570 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1580 * _1582;
        float _1590 = 1.0 / _1588;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1592;
        float _1596 = 1.0 / _1594;
        float _1598 = _1586 * _1590;
        float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1602 = fma(_1492, _1598, _1600);
        float _1604 = _1602 * _1596;
        float _1606 = precise::clamp(_1604, 0.0, 1.0);
        _1494 = _1606;
    }
    float _1608 = _1494;
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1612 = _1554 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1616 = _1556 + _1614;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1620 = _1558 + _1618;
    float _1622 = _1612 * _1612;
    float _1624 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1626 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1628 = fma(_1616, _1616, _1622);
    float _1630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1632 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1624);
    float _1634 = fma(_1620, _1620, _1628);
    float _1636 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1632);
    float _1638 = rsqrt(_1634);
    float _1640 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1642 = sqrt(_1634);
    float _1644 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1646 = _1616 * _1644;
    float _1648 = _1620 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 + _1652;
    float _1656 = sqrt(_1654);
    bool _1658 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = _1656 + _1660;
    float _1664 = _1382;
    float _1666 = _1662;
    float _1668 = _1630;
    float _1670 = _1646;
    float _1672 = _1648;
    float _1674 = _1650;
    float _1676 = _1652;
    if (_1658)
    {
        float _1678 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1664 = _1678;
    }
    float _1680 = _1664;
    if (_1658)
    {
        float _1682 = _1662 * _1680;
        _1666 = _1682;
    }
    float _1684 = _1666;
    float _1686 = precise::max(0.0, _1630);
    float _1688 = _1686;
    if (_1658)
    {
        float _1690 = rsqrt(_1654);
        _1668 = _1690;
    }
    float _1692 = _1668;
    float _1694 = _1692;
    if (_1658)
    {
        float _1696 = _1684 * 0.15915493667125701904296875;
        _1484 = _1696;
    }
    float _1698 = _1484;
    float _1700 = -_1644;
    float _1702 = -_1686;
    float _1704 = fma(_1612, _1700, _1702);
    if (_1658)
    {
        float _1706 = _1704 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1706;
    }
    float _1708 = _1688;
    float _1710 = _1476;
    float _1712 = _1708;
    if (_1658)
    {
        float _1714 = _1698 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        _1710 = _1716;
    }
    float _1718 = _1710;
    float _1720 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1722 = _1684;
    if (_1658)
    {
        float _1724 = _1698 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        _1722 = _1726;
    }
    float _1728 = _1722;
    float _1730 = _1718;
    if (_1658)
    {
        float _1732 = fma(_1718, _1708, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1486 = _1732;
    }
    float _1734 = _1486;
    float _1736 = floor(_1720);
    if (_1658)
    {
        float _1738 = _1692 * _1734;
        _1730 = _1738;
    }
    float _1740 = _1730;
    if (!_1658)
    {
        _1694 = _1704;
    }
    float _1742 = _1694;
    float _1744 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1746 = _1742;
    if (_1658)
    {
        float _1748 = _1728 + (-1.0);
        _1712 = _1748;
    }
    float _1750 = _1712;
    float _1752 = _1750;
    if (_1658)
    {
        float _1754 = _1646 * _1740;
        _1670 = _1754;
    }
    float _1756 = _1670;
    if (_1658)
    {
        float _1758 = _1648 * _1740;
        _1672 = _1758;
    }
    float _1760 = _1672;
    float _1762 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1744);
    if (_1658)
    {
        float _1764 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1752 = _1764;
    }
    float _1766 = _1752;
    if (_1658)
    {
        float _1768 = _1756 * _1756;
        _1674 = _1768;
    }
    float _1770 = _1674;
    if (_1658)
    {
        float _1772 = _1760 * _1760;
        _1676 = _1772;
    }
    float _1774 = _1676;
    float _1776 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1762);
    if (_1658)
    {
        float _1778 = fma(_1704, _1728, _1766);
        _1746 = _1778;
    }
    float _1780 = _1746;
    float _1782 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1626);
    float _1784 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1786 = fma(_1780, _1780, _1770);
    float _1788 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1792 = _1786 + _1774;
    float _1794 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1796 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1800 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1798);
    float _1802 = precise::clamp(_1800, 0.0, 1.0);
    float _1804 = fma(_1202, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1806 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    float _1808 = rsqrt(_1792);
    float _1810 = -_1802;
    float _1812 = _1810 + 1.0;
    float _1814 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1782);
    float _1816 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1806);
    float _1818 = -_1788;
    float _1820 = fma(_1818, _1796, 1.0);
    float _1822 = -_1736;
    float _1824 = _1720 + _1822;
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1830 = floor(_1804);
    float _1832 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1834 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1790);
    float _1836 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1838 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1834);
    float _1840 = _1808 * _1756;
    float _1842 = abs(_1812);
    float _1844 = log2(_1842);
    float _1846 = _1808 * _1760;
    float _1848 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1838);
    float _1850 = _1808 * _1780;
    float _1852 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1854 = -_1830;
    float _1856 = _1804 + _1854;
    float _1858 = -_1852;
    float _1860 = fma(_1850, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = log2(_1820);
    float _1864 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1832);
    float _1866 = -_1846;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1870 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1864);
    float _1872 = fma(_1868, -0.5, 0.5);
    float _1874 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1876 = 1.0 / _1848;
    float _1878 = fma(_1868, 0.5, 0.5);
    float _1880 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1836);
    float _1882 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1870);
    float _1884 = _1850 + 1.0;
    float _1886 = fma(_1878, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1888 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1880);
    float _1890 = _1862 * 0.693147182464599609375;
    float _1892 = sqrt(_1872);
    float _1894 = fma(_1878, _1886, -0.212114393711090087890625);
    float _1896 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1888);
    float _1898 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1900 = fma(_1878, _1894, 1.570728778839111328125);
    float _1902 = exp2(_1874);
    float _1904 = _1882 * _1876;
    float _1906 = _1896 * _1876;
    float _1908 = fma(_1904, 0.5, 0.5);
    float _1910 = fma(_1906, -0.5, 0.5);
    float _1912 = _1892 * 0.636619746685028076171875;
    float2 _6049 = float2(_1824, _1856);
    float _1914 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6049, float2(0.0), isnan(_6049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6049, float2(0.0), isnan(_6049)), level(0.0)).x;
    float _1916 = -_1850;
    float _1918 = fma(_1902, _1884, _1916);
    float _1920 = -_1900;
    float _1922 = fma(_1912, _1920, 1.0);
    float _1924 = fma(_1918, 0.5, 0.5);
    float3 _6073 = float3(_1908, _1910, _1898);
    float _1926 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6073, float3(0.0), isnan(_6073)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6073, float3(0.0), isnan(_6073)), level(0.0)).x;
    float3 _6084 = float3(_1908, _1910, _1898);
    float4 _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6084, float3(0.0), isnan(_6084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6084, float3(0.0), isnan(_6084)), level(0.0)).xyzw;
    float _1931 = _1929.x;
    float _1933 = _1929.y;
    float _1935 = _1929.z;
    float _1937 = _1929.w;
    float2 _6100 = float2(_1922, _1924);
    float3 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6100, float2(0.0), isnan(_6100)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6100, float2(0.0), isnan(_6100)), level(0.0)).xyz;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    float _1949 = float(uint(_930));
    float _1951 = trunc(_954);
    int _1953 = int(_1951);
    int _1955 = ~_930;
    int _1957 = _1955 + 1;
    float _1959 = _992 * _168;
    bool _1961 = _930 == 0;
    float _1963 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1965 = _930 + (-1);
    int _1967 = abs(_838);
    float _1969 = 1.0 / _1949;
    int _1971 = abs(_854);
    bool _1973 = _750 > 0.5;
    bool _1975 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1977 = isnan(_740);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1983 = _1979 || _1981;
    float _1985 = float(_1983);
    float _1987 = float(uint(_1953));
    float _1989 = trunc(_1959);
    int _1991 = int(_1989);
    int _1993 = as_type<int>(_1969) + (-2);
    float _1995 = exp2(_1963);
    float _1997 = as_type<float>(_1993) * _1987;
    float _1999 = trunc(_1997);
    float _2001 = precise::max(_1999, 0.0);
    uint _2004 = uint(_2001);
    float _2006 = -_1995;
    float _2008 = _2006 + 1.0;
    int _2010 = _1957 * int(_2004);
    int _2012 = _2010 + _1953;
    float _2014 = float(uint(_2012));
    float _2016 = as_type<float>(_1993) * _2014;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2020 = _2018 != 0;
    int _2022 = ~_930;
    int _2024 = _2022 + 1;
    bool _2026 = !_2020;
    float _2028 = _2026 ? 7.345489978790283203125 : 1.0;
    float _2030 = trunc(_2016);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    float _2036 = _2028 * _748;
    float _2038 = float(_1953);
    bool _2040 = _2038 >= _984;
    bool _2042 = isnan(_2038);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan(_984);
    bool _2048 = _2044 || _2046;
    float _2050 = float(_2048);
    float _2052 = trunc(_2050);
    int _2054 = int(_2052);
    int _2056 = int(_2004) + int(_2034);
    float _2058 = floor(_2036);
    int _2060 = _2024 * _2056;
    int _2062 = _2060 + _1953;
    bool _2064 = uint(_2062) >= uint(_930);
    bool _2066 = !_2064;
    int _2068 = _2066 ? 0 : (-1);
    int _2070 = ~_2056;
    int _2072 = _2070 + _2068;
    int _2074 = _2072 + 1;
    float _2076 = -_2058;
    float _2078 = _2036 + _2076;
    int _2080 = ~_2054;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    float _2086 = _2078 * _984;
    int _2088 = _930 * _2074;
    int _2090 = _2088 + _1953;
    float _2092 = -_1985;
    float _2094 = _2092 + 1.0;
    bool _2096 = !_1961;
    int _2098 = _2096 ? _2090 : (-1);
    float _2100 = trunc(_2086);
    int _2102 = int(_2100);
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2106 = _2104 != 0;
    int _2108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2110 = _2108 != 0;
    int _2112 = _2098 * _2084;
    bool _2114 = !_2106;
    int _2116 = _2114 ? 0 : 1;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2120 = _2118 != 0;
    int _2122 = _2054 * _1965;
    int _2124 = _2122 + _2112;
    bool _2126 = !_2120;
    int _2128 = _2126 ? 0 : 1;
    int _2130 = abs(_878);
    int _2132 = _2124 * _1967;
    int _2134 = abs(_2116);
    int _2136 = abs(_2128);
    int _2138 = _2102 * _2134;
    int _2140 = _2138 + _1953;
    int _2142 = _1991 * _1971;
    int _2144 = _2142 + _2132;
    float _2146 = as_type<float>(_2130);
    if (_2110)
    {
        float _2148 = in.m_57.x;
        _2146 = _2148;
    }
    float _2150 = _2146;
    int _2152 = ~_930;
    int _2154 = _2152 + 1;
    int _2156 = _2140 * _2130;
    int _2158 = _2156 + _2144;
    float _2160 = in.m_67.y;
    int _2162 = _2102 * _2136;
    int _2164 = _2162 + _2158;
    float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2168 = _2166 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2170 = in.m_67.x;
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2174 = _2172 != 0;
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2176;
    float _2180 = float(uint(_2164));
    float _2182 = 1.0 / _2168;
    bool _2184 = _1068 != 0.0;
    bool _2186 = isnan(_1068);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.0);
    bool _2192 = _2188 || _2190;
    float _2194 = as_type<float>(_1993) * _2180;
    int _2196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2198 = _2196 != 0;
    bool _2200 = _1066 == 0.0;
    bool _2202 = !_2192;
    bool _2204 = _2200 && _2202;
    float _2206 = trunc(_2194);
    float _2208 = precise::max(_2206, 0.0);
    uint _2210 = uint(_2208);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _2212 = _2150 > 0.5;
    bool _2214 = _2212 && _2110;
    bool _2216 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2218 = isnan(_740);
    bool _2220 = _2216 || _2218;
    bool _2222 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2224 = _2220 || _2222;
    float _2226 = float(_2224);
    float _2228 = in.m_71.x;
    float _2230 = in.m_71.y;
    float _2232 = in.m_71.z;
    bool _2234 = _1070 == 0.0;
    bool _2236 = _2234 && _2204;
    float _2238 = _2178 * _2182;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2242 = _740 + _2240;
    float _2244 = float(uint(_2140));
    float _2246 = fma(_2238, _2242, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2248 = _2238;
    float _2250 = _2170;
    float _2252 = _2160;
    if (_2110)
    {
        _2248 = _2170;
    }
    float _2254 = _2248;
    float _2256 = as_type<float>(_1993) * _2244;
    float _2258 = _2226 * _2094;
    int _2260 = _2154 * int(_2210);
    int _2262 = _2260 + _2164;
    float _2264 = _2254;
    if (_2214)
    {
        float _2266 = -_2254;
        float _2268 = _2266 + 1.0;
        _2264 = _2268;
    }
    float _2270 = _2264;
    float _2272 = _2246 * _2258;
    float _2274 = trunc(_2256);
    float _2276 = precise::max(_2274, 0.0);
    uint _2278 = uint(_2276);
    float _2280 = float(uint(_2262));
    float _2282 = -_2226;
    float _2284 = _2282 + 1.0;
    if (_2110)
    {
        _2250 = _2270;
    }
    float _2286 = _2250;
    float _2288 = as_type<float>(_1993) * _2280;
    float _2290 = -_2160;
    float _2292 = _2290 + 1.0;
    float _2294 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2296 = _2228;
    float _2298 = _2230;
    float _2300 = _2232;
    if (!_2236)
    {
        float _2302 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2228);
        _2296 = _2302;
    }
    float _2304 = _2296;
    if (!_2236)
    {
        float _2306 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2230);
        _2298 = _2306;
    }
    float _2308 = _2298;
    if (!_2236)
    {
        float _2310 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2232);
        _2300 = _2310;
    }
    float _2312 = _2300;
    float _2314 = trunc(_2288);
    float _2316 = precise::max(_2314, 0.0);
    uint _2318 = uint(_2316);
    if (_2174)
    {
        float _2320 = _1973 ? _2292 : _2160;
        _2252 = _2320;
    }
    float _2322 = _2252;
    float _2324 = fma(_800, _2294, _792);
    int _2326 = ~_930;
    int _2328 = _2326 + 1;
    float _2330 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2272);
    float _2332 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2334 = fma(_2322, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2336 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2340 = -_802;
    float _2342 = fma(_940, _2334, _2340);
    int _2344 = ~_930;
    int _2346 = _2344 + 1;
    int _2348 = _2328 * int(_2278);
    int _2350 = _2348 + _2140;
    float _2352 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    int _2354 = int(_2210) + int(_2318);
    float _2356 = abs(_1492);
    float _2358 = log2(_2356);
    float _2360 = float(uint(_2350));
    float _2362 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2330);
    float _2364 = _2342 + 0.5;
    int _2366 = _2346 * _2354;
    int _2368 = _2366 + _2164;
    float _2370 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2372 = as_type<float>(_1993) * _2360;
    float _2374 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2376 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2378 = uint(_2368) >= uint(_930);
    float _2380 = _712 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2382 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2384 = trunc(_2372);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    bool _2390 = !_2378;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2398 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2400 = ~_2354;
    int _2402 = _2400 + _2392;
    int _2404 = _2402 + 1;
    float _2406 = _2324 + 0.5;
    out.m_73.x = _2394;
    out.m_73.y = _2382;
    out.m_73.z = _2338;
    out.m_73.w = _2376;
    float _2408 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2410 = _930 * _2404;
    int _2412 = _2410 + _2164;
    float _2414 = exp2(_2398);
    int _2416 = ~_930;
    int _2418 = _2416 + 1;
    out.m_75.x = _2406;
    out.m_75.y = _2364;
    float _2420 = -_1132;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2408);
    bool _2424 = !_1961;
    int _2426 = _2424 ? _2412 : (-1);
    float _2428 = -_1132;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2396);
    int _2432 = int(_2278) + int(_2388);
    float _2434 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2422);
    float _2436 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2438 = _2426 & 3;
    bool _2440 = _2438 != 0;
    float _2442 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2444 = _2426 >> 31;
    int _2446 = _2418 * _2432;
    int _2448 = _2446 + _2140;
    float _2450 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2452 = -_1132;
    float _2454 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2442);
    int _2456 = _2444 & 3;
    float _2458 = fma(_2414, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    bool _2462 = uint(_2448) >= uint(_930);
    float _2464 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2454);
    int _2466 = _2426 + _2456;
    float _2468 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2470 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2472 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2430);
    int _2474 = _2466 >> 2;
    float _2476 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2468);
    float _2478 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2470);
    float _2480 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2450);
    int _2482 = _2474 << 4;
    int _2484 = _2482 + 368;
    float _2486 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2436);
    float _2488 = _2472 * _2308;
    float _2490 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2476);
    uint _2492 = uint(int(uint(_2484) >> uint(2)));
    uint _2494 = uint(int(uint(int(_2492)) >> uint(2)));
    int _2496 = int(_2492) & 3;
    float _2498 = (*spvDescriptorSet0.vp_c9)._m0[int(_2494)][_2496];
    int _2500 = int(_2492) + 1;
    uint _2502 = uint(int(uint(_2500) >> uint(2)));
    int _2504 = _2500 & 3;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[int(_2502)][_2504];
    float _2508 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2478);
    float _2510 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2480);
    int _2512 = _2426 & 3;
    bool _2514 = _2512 != 0;
    float _2516 = _2460 * _2460;
    float _2518 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2370);
    bool _2520 = uint(_2512) > 1u;
    int _2522 = _2484 + 8;
    uint _2524 = uint(int(uint(_2522) >> uint(2)));
    uint _2526 = uint(int(uint(int(_2524)) >> uint(2)));
    int _2528 = int(_2524) & 3;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[int(_2526)][_2528];
    int _2532 = int(_2524) + 1;
    uint _2534 = uint(int(uint(_2532) >> uint(2)));
    int _2536 = _2532 & 3;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[int(_2534)][_2536];
    float _2540 = _2434 * _2308;
    float _2542 = fma(_2460, -2.0, 3.0);
    int _2544 = _2440 ? 0 : 1;
    float _2546 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2352);
    bool _2548 = _2512 != 3;
    float _2550 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2518);
    int _2552 = ~_2544;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    float _2558 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2486);
    bool _2560 = !_2462;
    int _2562 = _2560 ? 0 : (-1);
    float _2564 = _2464 * _2308;
    bool _2566 = uint(_2512) >= 2u;
    float _2568 = fma(_2508, _2304, _2488);
    int _2570 = _2556;
    if (!_2520)
    {
        int _2572 = ~_2544;
        int _2574 = _2572 + 1;
        _2570 = _2574;
    }
    int _2576 = _2570;
    float _2578 = fma(_2490, _2304, _2540);
    bool _2580 = !_2514;
    int _2582 = _2580 ? 0 : 1;
    float _2584 = _2516 * _2542;
    int _2586 = abs(_2576);
    float _2588 = fma(_2510, _2304, _2564);
    int _2590 = ~_2432;
    int _2592 = _2590 + _2562;
    int _2594 = _2592 + 1;
    float _2596 = fma(_2550, _2312, _2568);
    int _2598 = _2566 ? 0 : 1;
    float _2600 = in.m_77.x;
    bool _2602 = _2512 != 3;
    float _2604 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2606 = abs(_2582);
    int _2608 = _930 * _2594;
    int _2610 = _2608 + _2140;
    float _2612 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2604);
    int _2614 = ~_2598;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    float _2620 = -_1914;
    float _2622 = _2620 + 1.0;
    bool _2624 = !_2602;
    int _2626 = _2624 ? 0 : (-1);
    float _2628 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2612);
    int _2630 = _2618;
    if (_2548)
    {
        int _2632 = ~_2598;
        int _2634 = _2632 + 1;
        _2630 = _2634;
    }
    int _2636 = _2630;
    float _2638 = fma(_2546, _2312, _2578);
    int _2640 = ~_2586;
    int _2642 = _2640 + 1;
    int _2644 = _2642 + 1;
    float _2646 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2628);
    bool _2648 = !_2198;
    int _2650 = _2648 ? 0 : 1;
    float _2652 = fma(_2558, _2312, _2588);
    int _2654 = abs(_2626);
    int _2656 = _2644 * as_type<int>(_2506);
    int _2658 = abs(_2636);
    float _2660 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2662 = ~_2606;
    int _2664 = _2662 + 1;
    int _2666 = _2664 + 1;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1896;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _1848;
    int _2668 = abs(_2650);
    float _2670 = _2660 * _1926;
    int _2672 = _2666 * as_type<int>(_2498);
    int _2674 = _2672 + _2656;
    int _2676 = ~_2658;
    int _2678 = _2676 + 1;
    int _2680 = _2678 + 1;
    float _2682 = -_2660;
    float _2684 = _2682 + 1.0;
    int _2686 = ~_2654;
    int _2688 = _2686 + 1;
    int _2690 = _2688 + 1;
    out.m_79.x = _2638;
    out.m_79.y = _2596;
    out.m_79.z = _2652;
    bool _2692 = _1492 <= 8000.0;
    bool _2694 = isnan(_1492);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(8000.0);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    int _2704 = _2680 * as_type<int>(_2530);
    int _2706 = _2704 + _2674;
    float _2708 = _2646 + _1848;
    bool _2710 = !_1961;
    int _2712 = _2710 ? _2610 : (-1);
    int _2714 = _2690 * as_type<int>(_2538);
    int _2716 = _2714 + _2706;
    float _2718 = -_2584;
    float _2720 = _2718 + 1.0;
    int _2722 = ~_2668;
    int _2724 = _2722 + 1;
    int _2726 = _2724 + 1;
    float _2728 = _2708 * 0.5;
    float _2730 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2584);
    float _2732 = _1848 * 0.5;
    int _2734 = _2716 * _2726;
    float _2736 = _2702 * _2730;
    float _2738 = fma(_1896, -0.5, _2732);
    int _2740 = _2712 * _2668;
    int _2742 = _2740 + _2734;
    float _2744 = _1882 + _1848;
    float _2746 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2748 = _1947 * _2670;
    bool _2750 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2752 = isnan(_1642);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2758 = _2754 || _2756;
    float _2760 = _2744 * 0.5;
    float _2762 = _2622 * _2746;
    float _2764 = precise::clamp(_2762, 0.0, 1.0);
    float _2766 = _1937 * _2670;
    float _2768 = fma(_1937, _2748, _1935);
    float _2770 = float(_2742);
    float _2772 = -_2764;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2760;
    out.m_81.y = _2738;
    out.m_81.z = _2728;
    out.m_81.w = _1848;
    float _2776 = fma(_1943, _2766, _1931);
    float _2778 = fma(_1945, _2766, _1933);
    float _2780 = _2774 * _2600;
    float _2782 = _1937 * _2684;
    out.m_83.x = _2770;
    float _2784 = _2766;
    float _2786 = _2684;
    float _2788 = _2748;
    float _2790 = _2670;
    float _2792 = _2770;
    float _2794 = _2780;
    if (!_2758)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2796 = _2784;
    float _2798 = _2796;
    float _2800 = _2796;
    if (!_2758)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2802 = _2786;
    out.m_85.x = _2776;
    out.m_85.y = _2778;
    out.m_85.z = _2768;
    out.m_85.w = _2782;
    float _2804 = _2802;
    float _2806 = _2802;
    if (!_2758)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2808 = _2788;
    float _2810 = _2808;
    float _2812 = _2808;
    if (!_2758)
    {
        _2790 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2814 = _2790;
    float _2816 = _2780 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2818 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2820 = _2814;
    float _2822 = _2814;
    if (!_2758)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2824 = _2792;
    float _2826 = _2824;
    float _2828 = _2824;
    if (!_2758)
    {
        _2794 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2830 = _2794;
    out.m_87.x = _2816;
    bool _2832 = !_2758;
    float _2834 = _2830;
    float _2836 = _2830;
    if (!_2832)
    {
        bool _2838 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2840 = isnan(_1642);
        bool _2842 = _2838 || _2840;
        bool _2844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2846 = _2842 || _2844;
        if (!_2846)
        {
            float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2850 = _1642 + _2848;
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2854 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2852;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2860 = 1.0 / _2854;
            float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2878 = _2850 * _2860;
            float _2880 = precise::clamp(_2878, 0.0, 1.0);
            float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2886 = fma(_2880, _2858, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2888 = fma(_2880, _2884, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2890 = fma(_2880, _2864, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2892 = fma(_2880, _2868, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2894 = fma(_2880, _2872, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2896 = fma(_2880, _2876, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2806 = _2890;
            _2822 = _2894;
            _2800 = _2886;
            _2812 = _2892;
            _2828 = _2888;
            _2836 = _2896;
            _2898 = true;
        }
        else
        {
            bool _2900 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2902 = isnan(_1642);
            bool _2904 = _2900 || _2902;
            bool _2906 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2908 = _2904 || _2906;
            if (!_2908)
            {
                _2798 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2910 = _2798;
            _2800 = _2910;
            if (!_2908)
            {
                _2804 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2912 = _2804;
            _2806 = _2912;
            if (!_2908)
            {
                _2826 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2914 = _2826;
            _2828 = _2914;
            if (!_2908)
            {
                _2810 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2916 = _2810;
            _2812 = _2916;
            if (!_2908)
            {
                _2820 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2918 = _2820;
            _2822 = _2918;
            if (!_2908)
            {
                _2834 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2920 = _2834;
            bool _2922 = !_2908;
            _2836 = _2920;
            if (!_2922)
            {
                bool _2924 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2926 = isnan(_1642);
                bool _2928 = _2924 || _2926;
                bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2932 = _2928 || _2930;
                if (!_2932)
                {
                    float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2936 = _1642 + _2934;
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2940 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2938;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2946 = 1.0 / _2940;
                    float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2952 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2954 = _2952 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2962 = _2960 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2964 = _2936 * _2946;
                    float _2966 = precise::clamp(_2964, 0.0, 1.0);
                    float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2970 = _2968 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2972 = fma(_2966, _2944, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2974 = fma(_2966, _2970, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2976 = fma(_2966, _2950, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2978 = fma(_2966, _2954, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2980 = fma(_2966, _2958, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2982 = fma(_2966, _2962, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2806 = _2976;
                    _2822 = _2980;
                    _2800 = _2972;
                    _2812 = _2978;
                    _2828 = _2974;
                    _2836 = _2982;
                    _2898 = true;
                }
                else
                {
                    _2806 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2822 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2800 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2812 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2828 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2836 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2898 = false;
    float _2984 = _2806;
    float _2986 = _2822;
    float _2988 = _2800;
    float _2990 = _2812;
    float _2992 = _2828;
    float _2994 = _2836;
    float _2996 = _2818 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2998 = fma(_2596, -0.5, 0.5);
    float _3000 = precise::clamp(_2998, 0.0, 1.0);
    float _3002 = -_2984;
    float _3004 = _3002 + _2986;
    float _3006 = -_2988;
    float _3008 = _3006 + _2990;
    out.m_53.x = _2996;
    float _3010 = -_2992;
    float _3012 = _3010 + _2994;
    float _3014 = fma(_3000, _3004, _2984);
    float _3016 = fma(_3000, _3008, _2988);
    bool _3018 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3020 = _3014 * 0.586610972881317138671875;
    float _3022 = fma(_3000, _3012, _2992);
    out.m_89.x = 0.0;
    bool _3024 = _1608 > 0.0;
    bool _3026 = isnan(_1608);
    bool _3028 = _3024 || _3026;
    bool _3030 = isnan(0.0);
    bool _3032 = _3028 || _3030;
    float _3034 = fma(_3016, 0.298911988735198974609375, _3020);
    float _3036 = fma(_3022, 0.114477999508380889892578125, _3034);
    float _3038 = -_3036;
    float _3040 = _3016 + _3038;
    float _3042 = -_3036;
    float _3044 = _3014 + _3042;
    float _3046 = -_3036;
    float _3048 = _3022 + _3046;
    float _3050 = fma(_3040, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3036);
    float _3052 = fma(_3044, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3036);
    float _3054 = fma(_3048, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3036);
    bool _3056 = !_3018;
    if (!_3056)
    {
        float _3058 = -_1554;
        float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3062 = -_1556;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3066 = -_1558;
        float _3068 = _3066 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3070 = _3060 * _3060;
        float _3072 = fma(_3064, _3064, _3070);
        float _3074 = fma(_3068, _3068, _3072);
        float _3076 = sqrt(_3074);
        float _3078 = rsqrt(_3074);
        float _3080 = -_3076;
        float _3082 = _3080 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3084 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3086 = precise::clamp(_3084, 0.0, 1.0);
        float _3088 = _3064 * _3078;
        float _3090 = _3060 * _3078;
        float _3092 = abs(_3086);
        float _3094 = log2(_3092);
        float _3096 = _3068 * _3078;
        float _3098 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3100 = _2596 * _3090;
        float _3102 = -_3090;
        float _3104 = -_3098;
        float _3106 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3104);
        float _3108 = fma(_2638, _3088, _3100);
        float _3110 = -_3096;
        float _3112 = fma(_3110, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3106);
        float _3114 = fma(_2652, _3096, _3108);
        float _3116 = precise::clamp(_3114, 0.0, 1.0);
        float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3120 = _3112 + _3118;
        float _3122 = _3094 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3124 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3126 = precise::clamp(_3124, 0.0, 1.0);
        float _3128 = exp2(_3122);
        float _3130 = _3128 * _3126;
        float _3132 = _3116 * _3130;
        float _3134 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3136 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3138 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3134;
        out.m_89.y = _3136;
        out.m_89.z = _3138;
    }
    out.m_91.x = _3050;
    out.m_91.y = _3052;
    out.m_91.z = _3054;
    if (_3032)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3140 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3140;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

