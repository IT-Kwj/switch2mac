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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_63 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_59 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _738 = false;
    bool _640 = false;
    bool _466 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2929 = as_type<float>(_118);
        out.gl_Position.z = _2929;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = float(_96);
    bool _134 = _100 >= _132;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    if (_138)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _108;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _120 = as_type<int>(_142);
    }
    int _144 = _120;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2984 = as_type<float>(_144);
        out.gl_Position.z = _2984;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _132;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        _194 = _156;
    }
    _196 = false;
    float _198 = _194;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _198 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = 1.0 / _222;
    bool _230 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _232 = isnan(_198);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = 1.0 / _218;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _246 = _198 + _244;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = 1.0 / _226;
    float _252 = _202 * _228;
    bool _254 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _256 = isnan(_198);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = 1.0 / _214;
    float _268 = _246 * _242;
    bool _270 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _272 = isnan(_198);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -_280;
    float _296 = _294 + 1.0;
    float _298 = _206 * _250;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _300;
    bool _304 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_198);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = _264 * _296;
    float _318 = -_264;
    float _320 = _318 + 1.0;
    float _322 = fma(_302, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _328 = _210 * _266;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _334;
    float _338 = _292 * _320;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _344 = fma(_332, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = fma(_336, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = -_292;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = fma(_326, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_342, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = _240 * _350;
    float _362 = -_240;
    float _364 = _362 + 1.0;
    float _366 = fma(_354, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _368 = _314 * _364;
    float _370 = -_314;
    float _372 = _370 + 1.0;
    float _374 = _322 * _368;
    float _376 = _344 * _368;
    float _378 = _346 * _368;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _380;
    float _384 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _374);
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _376);
    float _388 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _378);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_382, _328, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _400 = fma(_356, _360, _384);
    float _402 = fma(_366, _360, _386);
    float _404 = fma(_358, _360, _388);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _414 = fma(_392, _328, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_396, _328, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _422 = fma(_398, _338, _400);
    float _424 = fma(_408, _268, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _426 = fma(_412, _268, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _428 = fma(_420, _268, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _430 = fma(_414, _338, _402);
    float _432 = fma(_416, _338, _404);
    float _434 = fma(_424, _316, _422);
    float _436 = fma(_426, _316, _430);
    float _438 = fma(_428, _316, _432);
    float _440 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[147].x, _434);
    float _442 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[147].y, _436);
    float _444 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[147].z, _438);
    bool _446 = !_248;
    float _464;
    if (!_446)
    {
        float _448 = in.m_53.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        _464 = _156;
    }
    _466 = false;
    float _468 = _464;
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = in.m_55.z;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = _468 + _476;
    bool _480 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _482 = isnan(_468);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _500 = 1.0 / _494;
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _504 = 1.0 / _498;
    float _506 = _442 * _472;
    float _508 = _444 * _474;
    bool _510 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _512 = isnan(_468);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -_490;
    float _524 = _522 + 1.0;
    float _526 = _478 * _500;
    bool _528 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _530 = isnan(_468);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _542 = _468 + _540;
    float _544 = _520 * _524;
    float _546 = -_520;
    float _548 = _546 + 1.0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _558;
    float _562 = _538 * _548;
    float _564 = fma(_552, _526, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _566 = fma(_556, _526, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _568 = fma(_560, _526, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _570 = _542 * _504;
    float _572 = _564 * _562;
    float _574 = _566 * _562;
    float _576 = _568 * _562;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _586 = -_538;
    float _588 = _586 + 1.0;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _594 = fma(_580, _570, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _596 = fma(_584, _570, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].x, _572);
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].y, _574);
    float _602 = fma(_592, _570, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _604 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].z, _576);
    float _606 = fma(_594, _544, _598);
    float _608 = fma(_596, _544, _600);
    float _610 = _440 * _470;
    float _612 = fma(_602, _544, _604);
    float _614 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[109].x, _606);
    float _616 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[109].y, _608);
    float _618 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[109].z, _612);
    bool _620 = !_502;
    float _638;
    if (!_620)
    {
        float _622 = in.m_53.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _156;
    }
    _640 = false;
    float _642 = _638;
    bool _644 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _646 = isnan(_642);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _662 = isnan(_642);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _642 + _676;
    float _680 = -_654;
    float _682 = _680 + 1.0;
    bool _684 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _686 = 1.0 / _658;
    float _688 = _670 * _682;
    float _690 = -_670;
    float _692 = _690 + 1.0;
    float _694 = _674 * _686;
    float _696 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_694, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _702 = _698 * _688;
    float _704 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[115].x, _702);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[116].x, _706);
    float _716 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _718 = !_684;
    float _736;
    if (!_718)
    {
        float _720 = in.m_53.x;
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _724 = _720 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _728 = _726 * _722;
        float _730 = floor(_728);
        float _732 = -_730;
        float _734 = _728 + _732;
        _736 = _734;
        _738 = true;
    }
    else
    {
        _736 = _156;
    }
    _738 = false;
    float _740 = _736;
    float _742 = in.m_53.y;
    float _744 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _746 = log2(_744);
    float _748 = in.m_53.x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = in.m_42.x;
    float _754 = in.m_42.y;
    float _756 = in.m_42.z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _762 = _760 != 0;
    float _764 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _766 = in.m_53.z;
    float _768 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _770 = _742 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _774 = fma(_770, -2.0, _750);
    float _776 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _778 = _742 * 2.0;
    float _780 = _748 * 2.0;
    float _782 = _754 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = -_758;
    float _786 = fma(_776, 2.0, _784);
    float _788 = _754 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _790 = floor(_780);
    float _792 = _754 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _794 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _796 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[5].x, _788);
    float _798 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[6].x, _792);
    float _800 = _748 + _742;
    float _802 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].z, _796);
    float _804 = floor(_778);
    float _806 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _808 = _800 + (-1.0);
    float _810 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _812 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _806);
    float _814 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _816 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _810);
    float _818 = _808;
    float _820 = _756;
    float _822 = _798;
    float _824 = _742;
    if (!_762)
    {
        _818 = _742;
    }
    float _826 = _818;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _830 = _826;
    if (_762)
    {
        _830 = _748;
    }
    float _832 = _830;
    float _834 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _812);
    bool _836 = _790 > 0.0;
    float _838 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _816);
    bool _840 = _790 >= 0.0;
    bool _842 = isnan(_790);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    float _850 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].z, _798);
    bool _852 = _804 > 0.0;
    float _854 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[83].z, _772);
    bool _856 = _804 >= 0.0;
    bool _858 = isnan(_804);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _868 = _832;
    if (!_762)
    {
        _820 = _742;
    }
    float _870 = _820;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _874 = _766 * 2.0;
    float _876 = _870;
    if (_762)
    {
        _876 = _748;
    }
    float _878 = _876;
    float _880 = rsqrt(_838);
    float _882 = _878;
    if (!_762)
    {
        _868 = _766;
    }
    float _884 = _868;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _888 = _884;
    if (!_762)
    {
        _822 = _748;
    }
    float _890 = _822;
    float _892 = _878 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _894 = _890;
    if (_762)
    {
        _894 = _766;
    }
    float _896 = _894;
    float _898 = -_100;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[76].x, _786);
    if (!_762)
    {
        _882 = _884;
    }
    float _902 = _882;
    float _904 = floor(_874);
    float _906 = _902;
    if (_762)
    {
        _906 = _742;
    }
    float _908 = _906;
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[84].z, _886);
    float _912 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _774);
    int _914 = _864 ? 0 : 1;
    float _916 = _908 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _928 = _926 != 0;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_762)
    {
        _888 = _742;
    }
    float _932 = _888;
    float _934 = fma(_916, -2.0, _828);
    float _936 = _748 + _766;
    bool _938 = !_924;
    int _940 = _938 ? 0 : 1;
    float _942 = -_930;
    float _944 = fma(_892, 2.0, _942);
    bool _946 = !_920;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[83].w, _872);
    bool _952 = !_928;
    int _954 = _952 ? 0 : 1;
    float _956 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _958 = int(_956);
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _962 = _960 != 0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _966 = _964 != 0;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _970 = _968 != 0;
    float _972 = _936 + (-1.0);
    int _974 = ~_914;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    float _980 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _910);
    float _982 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _950);
    int _984 = _848 ? 0 : 1;
    float _986 = -_100;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[81].x, _944);
    int _990 = _978;
    if (!_852)
    {
        int _992 = ~_914;
        int _994 = _992 + 1;
        _990 = _994;
    }
    int _996 = _990;
    float _998 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1000 = !_966;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = _742 + _766;
    int _1006 = ~_984;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = _834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _1014 = _1010;
    if (!_836)
    {
        int _1016 = ~_984;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = _1004 + (-1.0);
    int _1024 = abs(_1002);
    float _1026 = _746 * _100;
    float _1028 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1030 = int(_1028);
    float _1032 = float(_1020);
    float _1034 = float(_1024);
    float _1036 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1038 = float(_996);
    float _1040 = float(_958);
    float _1042 = _1034 * _1032;
    float _1044 = exp2(_1026);
    float _1046 = in.m_57.x;
    float _1048 = in.m_57.y;
    float _1050 = in.m_57.z;
    float _1052 = _1042 * (-2.0);
    bool _1054 = !_970;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1060 = 1.0 + _1058;
    float _1062 = 1.0 / _1040;
    int _1064 = abs(_1056);
    float _1066 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _854);
    bool _1068 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1070 = isnan(0.0);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1076 = _1072 || _1074;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1080 = _904 > 0.0;
    bool _1082 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1084 = isnan(1.0);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1090 = _1086 || _1088;
    float _1092 = 1.0 / _1060;
    float _1094 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1078);
    float _1096 = float(_1064);
    bool _1098 = _904 >= 0.0;
    bool _1100 = isnan(_904);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1110 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1094);
    float _1112 = _1062 * _100;
    float _1114 = _1096 * _1038;
    float _1116 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1108);
    float _1118 = -_1044;
    float _1120 = _1118 + 1.0;
    float _1122 = fma(_1052, _1048, _1048);
    float _1124 = float(_1030);
    float _1126 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1128 = _1106 ? 0 : 1;
    float _1130 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1116);
    float _1132 = _1076 ? _1120 : 0.0;
    float _1134 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _934);
    float _1136 = fma(_1036, _1052, _1036);
    float _1138 = _742 + (-0.5);
    float _1140 = _1126 * _1126;
    float _1142 = _1124 * _100;
    int _1144 = ~_1128;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1122);
    float _1152 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    int _1154 = _1148;
    if (_1090)
    {
        float _1156 = _1132 * _1092;
        _110 = _1156;
    }
    float _1158 = _110;
    if (!_1080)
    {
        int _1160 = ~_1128;
        int _1162 = _1160 + 1;
        _1154 = _1162;
    }
    int _1164 = _1154;
    float _1166 = _1114 * (-2.0);
    float _1168 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1170 = fma(_1152, _1152, _1140);
    bool _1172 = !_962;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = fma(_1166, _1050, _1050);
    float _1178 = fma(_998, _1166, _998);
    float _1180 = fma(_1168, _1168, _1170);
    int _1182 = abs(_1174);
    float _1184 = _866 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1186 = _802 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1188 = _766 + (-0.5);
    float _1190 = float(_1164);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1192;
    float _1196 = float(_1182);
    float _1198 = fma(_1136, _1158, _1150);
    float _1200 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1176);
    float _1204 = _850 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1206 = _1196 * _1190;
    float _1208 = 1.0 / _1194;
    float _1210 = in.m_59.x;
    float _1212 = in.m_59.y;
    float _1214 = in.m_59.z;
    float _1216 = fma(_1178, _1158, _1202);
    float _1218 = _1206 * (-2.0);
    float _1220 = _1198 * 0.15915493667125701904296875;
    float _1222 = _1216 * 0.15915493667125701904296875;
    float _1224 = fma(_1218, _1046, _1046);
    float _1226 = _748 + (-0.5);
    float _1228 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1200);
    float _1230 = fma(_814, _1218, _814);
    float _1232 = rsqrt(_1180);
    float _1234 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1224);
    float _1236 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1228);
    float _1238 = fma(_1230, _1158, _1234);
    float _1240 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1242 = _1222 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = _1238 * 0.15915493667125701904296875;
    float _1248 = -_1240;
    float _1250 = _1012 + _1248;
    bool _1252 = _1240 >= _1012;
    bool _1254 = isnan(_1240);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan(_1012);
    bool _1260 = _1256 || _1258;
    float _1262 = abs(_1250);
    float _1264 = precise::max(_1262, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1266 = _1220 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    bool _1270 = !_1260;
    float _1272 = _1270 ? 1.0 : (-1.0);
    float _1274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1214);
    float _1276 = precise::min(_1264, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1278 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1280 = _1126 * _1232;
    float _1282 = _1220 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = _1246 * 6.283185482025146484375;
    float _1288 = sin(_1286);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1292 = _1276 + _1290;
    float _1294 = _1292 * _1208;
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1210);
    float _1298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1212);
    float _1300 = _1246 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1272 * _1294;
    float _1306 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1308 = _1278 * _1296;
    float _1310 = _764 * _1298;
    float _1312 = _768 * _1274;
    float _1314 = _1306 * _1304;
    float _1316 = _1152 * _1232;
    float _1318 = _1222 * 6.283185482025146484375;
    float _1320 = sin(_1318);
    float _1322 = _1244 * _1310;
    float _1324 = _1288 * _1268;
    float _1326 = _1314 * 0.15915493667125701904296875;
    float _1328 = _1168 * _1232;
    float _1330 = _1284 * _1244;
    float _1332 = _1268 * _1244;
    float _1334 = _1302 * _1284;
    float _1336 = _1288 * _1284;
    float _1338 = _1326 * 6.283185482025146484375;
    float _1340 = cos(_1338);
    float _1342 = -_1310;
    float _1344 = _1320 * _1342;
    float _1346 = _1302 * _1268;
    float _1348 = _1302 * _1322;
    float _1350 = fma(_1320, _1334, _1324);
    float _1352 = fma(_1330, _1308, _1344);
    float _1354 = -_1336;
    float _1356 = fma(_1320, _1346, _1354);
    float _1358 = _1288 * _1322;
    float _1360 = fma(_1350, _1308, _1348);
    float _1362 = -_1346;
    float _1364 = fma(_1320, _1336, _1362);
    float _1366 = _1326 * 6.283185482025146484375;
    float _1368 = sin(_1366);
    float _1370 = fma(_1320, _1324, _1334);
    float _1372 = fma(_1356, _1312, _1360);
    float _1374 = fma(_1332, _1312, _1352);
    float _1376 = fma(_1364, _1308, _1358);
    float _1378 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1382 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1384 = fma(_1370, _1312, _1376);
    float _1386 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1378);
    float _1388 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1380);
    float _1390 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1382);
    float _1392 = -_1340;
    float _1394 = _1392 + 1.0;
    float _1396 = _1328 * _1328;
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1388);
    float _1400 = _1316 * _1368;
    float _1402 = _1280 * _1394;
    float _1404 = _1280 * _1368;
    float _1406 = fma(_1394, _1396, _1340);
    float _1408 = _1328 * _1368;
    float _1410 = _1316 * _1394;
    float _1412 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1386);
    float _1414 = fma(_1328, _1402, _1400);
    float _1416 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1418 = -_1408;
    float _1420 = fma(_1280, _1410, _1418);
    float _1422 = -_1404;
    float _1424 = fma(_1328, _1410, _1422);
    float _1426 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1428 = _1416 * _1414;
    float _1430 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1390);
    float _1432 = fma(_1316, _1410, _1340);
    float _1434 = _1416 * _1420;
    float _1436 = fma(_1426, _1424, _1428);
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1440 = fma(_1280, _1402, _1340);
    float _1442 = fma(_1426, _1432, _1434);
    float _1444 = fma(_1328, _1410, _1404);
    float _1446 = fma(_1438, _1406, _1436);
    float _1448 = fma(_1280, _1410, _1408);
    float _1450 = _1416 * _1440;
    float _1452 = fma(_1438, _1444, _1442);
    float _1454 = _1204 + _1446;
    float _1456 = -_1400;
    float _1458 = fma(_1328, _1402, _1456);
    float _1460 = fma(_1426, _1448, _1450);
    float _1462 = _1184 + _1452;
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1466 = _1454 + _1464;
    float _1468 = fma(_1438, _1458, _1460);
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1472 = _1462 + _1470;
    float _1474 = _1466 * _1466;
    float _1476 = _1186 + _1468;
    float _1478 = fma(_1472, _1472, _1474);
    float _1480 = sqrt(_1478);
    bool _1482 = _1480 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1484 = _1458;
    float _1486 = _1328;
    float _1488 = _1448;
    float _1490 = _1480;
    float _1492 = _1462;
    if (!_1482)
    {
        _1484 = _1462;
    }
    float _1494 = _1484;
    float _1496 = _1494;
    if (!_1482)
    {
        _1486 = _1454;
    }
    float _1498 = _1486;
    float _1500 = _1498;
    if (!_1482)
    {
        _1488 = _1476;
    }
    float _1502 = _1488;
    bool _1504 = !_1482;
    float _1506 = _1502;
    if (!_1504)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1512 = _1480 + _1510;
        float _1514 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1516 = rsqrt(_1478);
        float _1518 = _1512 * _1508;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1520 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = _1520 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        float _1530 = _1524 + (-1.0);
        float _1532 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = fma(_1528, _1514, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1536 = fma(_1476, _1524, _1532);
        float _1538 = _1516 * _1534;
        float _1540 = fma(_1472, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1542 = fma(_1466, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1506 = _1536;
        _1496 = _1540;
        _1500 = _1542;
    }
    float _1544 = _1506;
    float _1546 = _1496;
    float _1548 = _1500;
    float _1550 = -_1186;
    float _1552 = _1550 + _1544;
    float _1554 = -_1184;
    float _1556 = _1554 + _1546;
    float _1558 = -_1204;
    float _1560 = _1558 + _1548;
    float _1562 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1564 = _1552 * _1552;
    float _1566 = fma(_1556, _1556, _1564);
    float _1568 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1562);
    float _1570 = fma(_1560, _1560, _1566);
    float _1572 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1568);
    float _1574 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1576 = sqrt(_1570);
    float _1578 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1580 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1574);
    float _1582 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1580);
    bool _1584 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan(0.5);
    bool _1592 = _1588 || _1590;
    float _1594 = 1.0 / _1578;
    float _1596 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1598 = _1596 + _1578;
    bool _1600 = _1576 > 0.0;
    bool _1602 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan(0.5);
    bool _1610 = _1606 || _1608;
    float _1612 = _1598 * _1594;
    float _1614 = _1612 * 0.5;
    bool _1616 = !_1600;
    float _1618 = _1546;
    float _1620 = _1544;
    float _1622 = _1548;
    float _1624 = _1556;
    if (!_1616)
    {
        float _1626 = _172 * _172;
        float _1628 = rsqrt(_1570);
        float _1630 = fma(_170, _170, _1626);
        float _1632 = fma(_174, _174, _1630);
        float _1634 = sqrt(_1632);
        float _1636 = _1552 * _1628;
        float _1638 = _1560 * _1628;
        bool _1640 = _1634 > 0.0;
        float _1642 = _1556 * _1628;
        bool _1644 = !_1640;
        if (!_1644)
        {
            float _1646 = rsqrt(_1632);
            float _1648 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1650 = _172 * _1646;
            float _1652 = _170 * _1646;
            float _1654 = _1636 * _1650;
            float _1656 = _174 * _1646;
            float _1658 = fma(_1642, _1652, _1654);
            float _1660 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1662 = fma(_1638, _1656, _1658);
            float _1664 = _1662 * _1660;
            float _1666 = fma(_170, _1664, _1546);
            float _1668 = fma(_172, _1664, _1544);
            float _1670 = fma(_174, _1664, _1548);
            _1618 = _1666;
            _1620 = _1668;
            _1622 = _1670;
            _1624 = _1660;
        }
    }
    float _1672 = _1618;
    float _1674 = _1620;
    float _1676 = _1622;
    float _1678 = _1624;
    float _1680 = _1674;
    float _1682 = _1672;
    float _1684 = _1676;
    float _1686 = _1678;
    if (_1610)
    {
        _1490 = 1.0;
    }
    float _1688 = _1490;
    float _1690 = _1688;
    if (!_1592)
    {
        float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1694 = _1186 + _1692;
        float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1698 = _1184 + _1696;
        float _1700 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1702 = -_1184;
        float _1704 = _1702 + _1672;
        float _1706 = _1694 * _1694;
        float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1710 = _1204 + _1708;
        float _1712 = -_1186;
        float _1714 = _1712 + _1674;
        float _1716 = fma(_1698, _1698, _1706);
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1720 = fma(_1710, _1710, _1716);
        float _1722 = sqrt(_1720);
        float _1724 = _1700 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1726 = precise::min(_1722, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1728 = _1726 * _1718;
        float _1730 = _1724 * _1728;
        float _1732 = -_1204;
        float _1734 = _1732 + _1676;
        float _1736 = fma(_1704, _1730, _1184);
        float _1738 = fma(_1714, _1730, _1186);
        float _1740 = fma(_1734, _1730, _1204);
        _1680 = _1738;
        _1682 = _1736;
        _1684 = _1740;
    }
    float _1742 = _1680;
    float _1744 = _1682;
    float _1746 = _1684;
    if (!_1610)
    {
        float _1748 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1752 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1750);
        float _1754 = _1748 * 0.15915493667125701904296875;
        float _1756 = _1754 * 6.283185482025146484375;
        float _1758 = cos(_1756);
        float _1760 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1762 = _1760 * 0.15915493667125701904296875;
        float _1764 = _1754 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = 1.0 / _1758;
        float _1770 = _1762 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = 1.0 / _1752;
        float _1778 = _1772 * _1774;
        float _1780 = _1762 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1786 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1784;
        float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1790 = _1776 * _1788;
        float _1792 = 1.0 / _1778;
        float _1794 = 1.0 / _1786;
        float _1796 = _1782 * _1792;
        float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1800 = fma(_1796, _1790, _1798);
        float _1802 = _1800 * _1794;
        float _1804 = precise::clamp(_1802, 0.0, 1.0);
        _1686 = _1762;
        _1690 = _1804;
    }
    float _1806 = _1686;
    float _1808 = _1690;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1812 = _1742 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1816 = _1744 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1820 = _1746 + _1818;
    float _1822 = _1812 * _1812;
    float _1824 = fma(_1816, _1816, _1822);
    float _1826 = fma(_1820, _1820, _1824);
    float _1828 = rsqrt(_1826);
    float _1830 = sqrt(_1826);
    float _1832 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1834 = _1816 * _1832;
    float _1836 = _1820 * _1832;
    float _1838 = _1834 * _1834;
    float _1840 = _1836 * _1836;
    float _1842 = _1838 + _1840;
    float _1844 = sqrt(_1842);
    bool _1846 = _1844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1850 = _1844 + _1848;
    float _1852 = _1820;
    float _1854 = _1842;
    float _1856 = _1850;
    float _1858 = _1806;
    float _1860 = _1812;
    if (_1846)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1852 = _1862;
    }
    float _1864 = _1852;
    if (_1846)
    {
        float _1866 = rsqrt(_1842);
        _1854 = _1866;
    }
    float _1868 = _1854;
    float _1870 = _1868;
    if (_1846)
    {
        float _1872 = _1850 * _1864;
        _1856 = _1872;
    }
    float _1874 = _1856;
    if (_1846)
    {
        float _1876 = _1874 * 0.15915493667125701904296875;
        _1858 = _1876;
    }
    float _1878 = _1858;
    float _1880 = _1864;
    float _1882 = _1878;
    if (_1846)
    {
        float _1884 = _1878 * 6.283185482025146484375;
        float _1886 = sin(_1884);
        _1880 = _1886;
    }
    float _1888 = _1880;
    float _1890 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1892 = precise::max(0.0, _1890);
    float _1894 = _1822;
    float _1896 = _1892;
    if (_1846)
    {
        float _1898 = _1878 * 6.283185482025146484375;
        float _1900 = cos(_1898);
        _1894 = _1900;
    }
    float _1902 = _1894;
    float _1904 = -_1832;
    float _1906 = -_1892;
    float _1908 = fma(_1812, _1904, _1906);
    if (_1846)
    {
        float _1910 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1910;
    }
    float _1912 = _1896;
    float _1914 = _1888;
    float _1916 = _1912;
    if (_1846)
    {
        float _1918 = fma(_1888, _1912, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1860 = _1918;
    }
    float _1920 = _1860;
    float _1922 = _1920;
    if (!_1846)
    {
        _1914 = _1834;
    }
    float _1924 = _1914;
    float _1926 = _1924;
    float _1928 = _1902;
    if (_1846)
    {
        float _1930 = _1902 + (-1.0);
        _1916 = _1930;
    }
    float _1932 = _1916;
    float _1934 = _1932;
    if (_1846)
    {
        float _1936 = _1868 * _1920;
        _1492 = _1936;
    }
    float _1938 = _1492;
    if (!_1846)
    {
        _1922 = _1908;
    }
    float _1940 = _1922;
    float _1942 = _1940;
    if (_1846)
    {
        float _1944 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1944;
    }
    float _1946 = _1882;
    if (_1846)
    {
        float _1948 = _1834 * _1938;
        _1926 = _1948;
    }
    float _1950 = _1926;
    if (!_1846)
    {
        _1934 = _1836;
    }
    float _1952 = _1934;
    float _1954 = _1952;
    if (_1846)
    {
        float _1956 = _1836 * _1938;
        _1954 = _1956;
    }
    float _1958 = _1954;
    if (!_1846)
    {
        _1870 = _1838;
    }
    float _1960 = _1870;
    float _1962 = _1960;
    if (_1846)
    {
        float _1964 = fma(_1908, _1902, _1946);
        _1942 = _1964;
    }
    float _1966 = _1942;
    if (_1846)
    {
        float _1968 = _1950 * _1950;
        _1962 = _1968;
    }
    float _1970 = _1962;
    if (!_1846)
    {
        _1928 = _1840;
    }
    float _1972 = _1928;
    float _1974 = _1972;
    if (_1846)
    {
        float _1976 = _1958 * _1958;
        _1974 = _1976;
    }
    float _1978 = _1974;
    float _1980 = fma(_1966, _1966, _1970);
    float _1982 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1984 = _1980 + _1978;
    float _1986 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1990 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1988);
    float _1992 = precise::clamp(_1990, 0.0, 1.0);
    float _1994 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1996 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1998 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1986);
    float _2000 = rsqrt(_1984);
    float _2002 = -_1992;
    float _2004 = _2002 + 1.0;
    float _2006 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1994);
    float _2008 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1998);
    float _2010 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2012 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1982);
    float _2014 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2006);
    float _2016 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2018 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2010);
    float _2020 = abs(_2004);
    float _2022 = log2(_2020);
    float _2024 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2026 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2028 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2018);
    float _2030 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2032 = -_2026;
    float _2034 = fma(_2032, _1996, 1.0);
    float _2036 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2038 = _2000 * _1950;
    float _2040 = _2000 * _1966;
    float _2042 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2012);
    float _2044 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2030);
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2048 = _2000 * _1958;
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2052 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2044);
    float _2054 = -_2046;
    float _2056 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2054);
    float _2058 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2060 = log2(_2034);
    float _2062 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2052);
    float _2064 = -_2048;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2056);
    float _2068 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2070 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = fma(_2066, -0.5, 0.5);
    float _2074 = fma(_2066, 0.5, 0.5);
    float _2076 = exp2(_2058);
    float _2078 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2068);
    float _2080 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2082 = _2040 + 1.0;
    float _2084 = fma(_2074, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2086 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2078);
    float _2088 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2080);
    float _2090 = 1.0 / _2062;
    float _2092 = _2060 * 0.693147182464599609375;
    float _2094 = fma(_2074, _2084, -0.212114393711090087890625);
    float _2096 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2098 = fma(_2074, _2094, 1.570728778839111328125);
    float _2100 = sqrt(_2072);
    float _2102 = -_2040;
    float _2104 = fma(_2076, _2082, _2102);
    float _2106 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2108 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2088);
    float _2110 = fma(_2104, 0.5, 0.5);
    float _2112 = _2108 * _2090;
    float _2114 = _2106 * _2090;
    float _2116 = fma(_2114, 0.5, 0.5);
    float _2118 = _2100 * 0.636619746685028076171875;
    float _2120 = fma(_2112, -0.5, 0.5);
    float _2122 = -_2098;
    float _2124 = fma(_2118, _2122, 1.0);
    float3 _6171 = float3(_2116, _2120, _2096);
    float _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).x;
    float3 _6182 = float3(_2116, _2120, _2096);
    float4 _2129 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6182, float3(0.0), isnan(_6182)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6182, float3(0.0), isnan(_6182)), level(0.0)).xyzw;
    float _2131 = _2129.x;
    float _2133 = _2129.y;
    float _2135 = _2129.z;
    float _2137 = _2129.w;
    float2 _6199 = float2(_2124, _2110);
    float3 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6199, float2(0.0), isnan(_6199)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6199, float2(0.0), isnan(_6199)), level(0.0)).xyz;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = float(uint(_1030));
    float _2151 = trunc(_1112);
    int _2153 = int(_2151);
    int _2155 = ~_1030;
    int _2157 = _2155 + 1;
    float _2159 = _1142 * _152;
    int _2161 = ~_1030;
    int _2163 = _2161 + 1;
    float _2165 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2167 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _708;
    out.m_61.y = _710;
    out.m_61.z = _712;
    out.m_61.w = _716;
    float _2169 = 1.0 / _2149;
    float _2171 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2167);
    out.m_63.x = _1744;
    out.m_63.y = _1742;
    out.m_63.z = _1746;
    float _2173 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2171);
    float _2175 = float(uint(_2153));
    float _2177 = trunc(_2159);
    int _2179 = int(_2177);
    float _2181 = float(_2153);
    float _2183 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2173);
    int _2185 = as_type<int>(_2169) + (-2);
    float _2187 = exp2(_2165);
    out.gl_Position.x = _2106;
    out.gl_Position.y = _2108;
    out.gl_Position.z = _2183;
    out.gl_Position.w = _2062;
    float _2189 = as_type<float>(_2185) * _2175;
    float _2191 = trunc(_2189);
    float _2193 = precise::max(_2191, 0.0);
    uint _2196 = uint(_2193);
    float _2198 = -_2187;
    float _2200 = _2198 + 1.0;
    float _2202 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2204 = _2157 * int(_2196);
    int _2206 = _2204 + _2153;
    float _2208 = float(uint(_2206));
    float _2210 = as_type<float>(_2185) * _2208;
    bool _2212 = !_762;
    float _2214 = _2212 ? 7.345489978790283203125 : 1.0;
    float _2216 = trunc(_2210);
    float _2218 = precise::max(_2216, 0.0);
    uint _2220 = uint(_2218);
    float _2222 = _2214 * _748;
    bool _2224 = _2181 >= _1124;
    bool _2226 = isnan(_2181);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan(_1124);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = floor(_2222);
    int _2238 = int(_2196) + int(_2220);
    float _2240 = trunc(_2234);
    int _2242 = int(_2240);
    int _2244 = _2163 * _2238;
    int _2246 = _2244 + _2153;
    float _2248 = -_2236;
    float _2250 = _2222 + _2248;
    bool _2252 = uint(_2246) >= uint(_1030);
    float _2254 = _2250 * _1124;
    bool _2256 = !_2252;
    int _2258 = _2256 ? 0 : (-1);
    bool _2260 = _1030 == 0;
    float _2262 = trunc(_2254);
    int _2264 = int(_2262);
    int _2266 = ~_2238;
    int _2268 = _2266 + _2258;
    int _2270 = _2268 + 1;
    int _2272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2274 = _2272 != 0;
    int _2276 = ~_2242;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _1030 * _2270;
    int _2284 = _2282 + _2153;
    bool _2286 = !_2274;
    int _2288 = _2286 ? 0 : 1;
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2292 = _2290 != 0;
    bool _2294 = !_2260;
    int _2296 = _2294 ? _2284 : (-1);
    int _2298 = _1030 + (-1);
    int _2300 = abs(_940);
    int _2302 = _2296 * _2280;
    int _2304 = abs(_2288);
    int _2306 = abs(_948);
    int _2308 = _2242 * _2298;
    int _2310 = _2308 + _2302;
    int _2312 = _2264 * _2304;
    int _2314 = _2312 + _2153;
    int _2316 = abs(_954);
    int _2318 = _2310 * _2300;
    bool _2320 = !_2292;
    int _2322 = _2320 ? 0 : 1;
    int _2324 = _2179 * _2306;
    int _2326 = _2324 + _2318;
    int _2328 = abs(_2322);
    float _2330 = in.m_65.y;
    int _2332 = ~_1030;
    int _2334 = _2332 + 1;
    int _2336 = _2314 * _2316;
    int _2338 = _2336 + _2326;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2342 = _2340 != 0;
    int _2344 = _2264 * _2328;
    int _2346 = _2344 + _2338;
    int _2348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2350 = _2348 != 0;
    float _2352 = in.m_65.x;
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2356 = _2354 != 0;
    float _2358 = float(uint(_2346));
    int _2360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2362 = _2360 != 0;
    int _2364 = ~_1030;
    int _2366 = _2364 + 1;
    float _2368 = as_type<float>(_2185) * _2358;
    int _2370 = ~_1030;
    int _2372 = _2370 + 1;
    float _2374 = trunc(_2368);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    int _2380 = _2280;
    float _2382 = _2330;
    int _2384 = _2185;
    float _2386 = _2352;
    if (_2362)
    {
        float _2388 = -_2352;
        float _2390 = _2388 + 1.0;
        _2380 = as_type<int>(_2390);
    }
    int _2392 = _2380;
    int _2394 = _2372 * int(_2378);
    int _2396 = _2394 + _2346;
    float _2398 = float(uint(_2396));
    float _2400 = as_type<float>(_2185) * _2398;
    float _2402 = in.m_53.w;
    float _2404 = trunc(_2400);
    float _2406 = precise::max(_2404, 0.0);
    uint _2408 = uint(_2406);
    float _2410 = -_2330;
    float _2412 = _2410 + 1.0;
    int _2414 = int(_2378) + int(_2408);
    bool _2416 = _2402 > 0.5;
    float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2420 = _2418 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2422 = float(uint(_2314));
    int _2424 = _2334 * _2414;
    int _2426 = _2424 + _2346;
    int _2428 = _2416 ? as_type<int>(_2412) : as_type<int>(_2330);
    bool _2430 = _742 > 0.5;
    float _2432 = 1.0 / _2420;
    bool _2434 = uint(_2426) >= uint(_1030);
    float _2436 = as_type<float>(_2185) * _2422;
    bool _2438 = _2430;
    if (!_2342)
    {
        _824 = _2352;
    }
    float _2440 = _824;
    bool _2442 = !_2434;
    int _2444 = _2442 ? 0 : (-1);
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2448 = _2446 != 0;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2450;
    int _2454 = ~_2414;
    int _2456 = _2454 + _2444;
    int _2458 = _2456 + 1;
    float _2460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2462 = _2448 ? as_type<float>(_2428) : _2330;
    bool _2464 = _2448;
    float _2466 = _2440;
    if (_2342)
    {
        bool _2468 = _748 > 0.5;
        _2464 = _2468;
    }
    bool _2470 = _2464;
    int _2472 = _1030 * _2458;
    int _2474 = _2472 + _2346;
    if (_2350)
    {
        float _2476 = _2430 ? _2412 : _2330;
        _2382 = _2476;
    }
    float _2478 = _2382;
    float _2480 = _2452 * _2432;
    float _2482 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2484 = _740 + _2482;
    bool _2486 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2488 = isnan(_740);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2494 = _2490 || _2492;
    float _2496 = float(_2494);
    float _2498 = trunc(_2436);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    bool _2504 = !_2260;
    int _2506 = _2504 ? _2474 : (-1);
    float _2508 = fma(_2480, _2484, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_2362)
    {
        bool _2510 = _766 > 0.5;
        _2438 = _2510;
    }
    bool _2512 = _2438;
    float _2514 = -_2496;
    float _2516 = _2514 + 1.0;
    int _2518 = _2506 >> 31;
    float _2520 = _980 * (-0.15915493667125701904296875);
    bool _2522 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2524 = isnan(_740);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2530 = _2526 || _2528;
    float _2532 = float(_2530);
    float _2534 = _2460 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2536 = _2518 & 3;
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2540 = _2532 * _2516;
    int _2542 = _2506 + _2536;
    float _2544 = fma(_2462, _2534, -0.5);
    float _2546 = -_2532;
    float _2548 = _2546 + 1.0;
    float _2550 = _2508 * _2540;
    int _2552 = _2542 >> 2;
    int _2554 = _2366 * int(_2502);
    int _2556 = _2554 + _2314;
    float _2558 = _2520 * 6.283185482025146484375;
    float _2560 = sin(_2558);
    float _2562 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2550);
    int _2564 = _2552 << 4;
    int _2566 = _2564 + 368;
    float _2568 = float(uint(_2556));
    float _2570 = fma(_2496, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2562);
    uint _2572 = uint(int(uint(_2566) >> uint(2)));
    uint _2574 = uint(int(uint(int(_2572)) >> uint(2)));
    int _2576 = int(_2572) & 3;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[int(_2574)][_2576];
    int _2580 = int(_2572) + 1;
    uint _2582 = uint(int(uint(_2580) >> uint(2)));
    int _2584 = _2580 & 3;
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[int(_2582)][_2584];
    float _2588 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2590 = _2520 * 6.283185482025146484375;
    float _2592 = cos(_2590);
    float _2594 = as_type<float>(_2185) * _2568;
    if (_2342)
    {
        float _2596 = -_2352;
        float _2598 = _2596 + 1.0;
        _2384 = as_type<int>(_2598);
    }
    int _2600 = _2384;
    float _2602 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2604 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2478, -0.5);
    float _2606 = trunc(_2594);
    float _2608 = precise::max(_2606, 0.0);
    uint _2610 = uint(_2608);
    int _2612 = _2566 + 8;
    uint _2614 = uint(int(uint(_2612) >> uint(2)));
    uint _2616 = uint(int(uint(int(_2614)) >> uint(2)));
    int _2618 = int(_2614) & 3;
    float _2620 = (*spvDescriptorSet0.vp_c9)._m0[int(_2616)][_2618];
    int _2622 = int(_2614) + 1;
    uint _2624 = uint(int(uint(_2622) >> uint(2)));
    int _2626 = _2622 & 3;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[int(_2624)][_2626];
    if (_2342)
    {
        float _2630 = _2470 ? as_type<float>(_2600) : _2352;
        _2466 = _2630;
    }
    float _2632 = _2466;
    float _2634 = -_912;
    float _2636 = fma(_1130, _2604, _2634);
    if (_2362)
    {
        float _2638 = _2512 ? as_type<float>(_2392) : _2352;
        _2386 = _2638;
    }
    float _2640 = _2386;
    out.m_67.w = _2602;
    int _2642 = _2506 & 3;
    bool _2644 = _2642 != 0;
    float _2646 = fma(_2588, _2640, -0.5);
    bool _2648 = uint(_2642) > 1u;
    int _2650 = ~_1030;
    int _2652 = _2650 + 1;
    float _2654 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2656 = _2506 & 3;
    bool _2658 = _2656 != 0;
    int _2660 = int(_2502) + int(_2610);
    float _2662 = fma(_1110, _2654, _900);
    float _2664 = _2560 * _2544;
    int _2666 = _2658 ? 0 : 1;
    float _2668 = _2592 * _2544;
    bool _2670 = _2642 != 3;
    int _2672 = _2652 * _2660;
    int _2674 = _2672 + _2314;
    int _2676 = ~_2666;
    int _2678 = _2676 + 1;
    int _2680 = _2678 + 1;
    float _2682 = fma(_2560, _2646, _2668);
    int _2684 = _2680;
    if (!_2648)
    {
        int _2686 = ~_2666;
        int _2688 = _2686 + 1;
        _2684 = _2688;
    }
    int _2690 = _2684;
    float _2692 = -_2664;
    float _2694 = fma(_2592, _2646, _2692);
    bool _2696 = uint(_2642) >= 2u;
    float _2698 = _2202 * _2126;
    bool _2700 = !_2644;
    int _2702 = _2700 ? 0 : 1;
    float _2704 = fma(_1066, _2694, _988);
    bool _2706 = _2642 != 3;
    float _2708 = _2137 * _2698;
    int _2710 = abs(_2690);
    float _2712 = -_1134;
    float _2714 = fma(_982, _2682, _2712);
    int _2716 = _2696 ? 0 : 1;
    float _2718 = -_2202;
    float _2720 = _2718 + 1.0;
    bool _2722 = uint(_2674) >= uint(_1030);
    bool _2724 = !_2356;
    int _2726 = _2724 ? 0 : 1;
    float _2728 = _2147 * _2698;
    int _2730 = abs(_2702);
    float _2732 = fma(_2143, _2708, _2131);
    bool _2734 = !_2706;
    int _2736 = _2734 ? 0 : (-1);
    float _2738 = _2662 + 0.5;
    int _2740 = ~_2710;
    int _2742 = _2740 + 1;
    int _2744 = _2742 + 1;
    float _2746 = _2714 + 0.5;
    int _2748 = ~_2716;
    int _2750 = _2748 + 1;
    int _2752 = _2750 + 1;
    float _2754 = fma(_2145, _2708, _2133);
    int _2756 = _2752;
    if (_2670)
    {
        int _2758 = ~_2716;
        int _2760 = _2758 + 1;
        _2756 = _2760;
    }
    int _2762 = _2756;
    int _2764 = _2744 * as_type<int>(_2586);
    int _2766 = abs(_2736);
    float _2768 = fma(_2137, _2728, _2135);
    int _2770 = ~_2730;
    int _2772 = _2770 + 1;
    int _2774 = _2772 + 1;
    int _2776 = abs(_2726);
    int _2778 = abs(_2762);
    int _2780 = _2774 * as_type<int>(_2578);
    int _2782 = _2780 + _2764;
    bool _2784 = !_2722;
    int _2786 = _2784 ? 0 : (-1);
    int _2788 = ~_2778;
    int _2790 = _2788 + 1;
    int _2792 = _2790 + 1;
    int _2794 = ~_2660;
    int _2796 = _2794 + _2786;
    int _2798 = _2796 + 1;
    int _2800 = ~_2766;
    int _2802 = _2800 + 1;
    int _2804 = _2802 + 1;
    int _2806 = _2792 * as_type<int>(_2620);
    int _2808 = _2806 + _2782;
    int _2810 = ~_2776;
    int _2812 = _2810 + 1;
    int _2814 = _2812 + 1;
    int _2816 = _1030 * _2798;
    int _2818 = _2816 + _2314;
    float _2820 = _2636 + 0.5;
    int _2822 = _2804 * as_type<int>(_2628);
    int _2824 = _2822 + _2808;
    float _2826 = _2704 + 0.5;
    bool _2828 = !_2260;
    int _2830 = _2828 ? _2818 : (-1);
    int _2832 = _2824 * _2814;
    bool _2834 = _1808 > 0.0;
    bool _2836 = isnan(_1808);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan(0.0);
    bool _2842 = _2838 || _2840;
    float _2844 = _1808 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _2738;
    out.m_69.y = _2820;
    out.m_69.z = _2826;
    out.m_69.w = _2746;
    int _2846 = _2830 * _2776;
    int _2848 = _2846 + _2832;
    float _2850 = _2183 + _2062;
    float _2852 = _2844 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2854 = float(_2848);
    float _2856 = _2850 * 0.5;
    out.m_49.x = _2852;
    out.m_71.x = _2854;
    out.m_73.z = _2856;
    out.m_73.w = _2062;
    float _2858 = _2137 * _2720;
    out.m_75.x = _2732;
    out.m_75.y = _2754;
    out.m_75.z = _2768;
    out.m_75.w = _2858;
    if (_2842)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2860 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2860;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _738 = false;
    bool _640 = false;
    bool _466 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2929 = as_type<float>(_118);
        out.gl_Position.z = _2929;
    }
    if (!_104)
    {
        return out;
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = float(_96);
    bool _134 = _100 >= _132;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    if (_138)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _108;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _120 = as_type<int>(_142);
    }
    int _144 = _120;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2984 = as_type<float>(_144);
        out.gl_Position.z = _2984;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _132;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        _194 = _156;
    }
    _196 = false;
    float _198 = _194;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _198 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = 1.0 / _222;
    bool _230 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _232 = isnan(_198);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = 1.0 / _218;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _246 = _198 + _244;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = 1.0 / _226;
    float _252 = _202 * _228;
    bool _254 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _256 = isnan(_198);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = 1.0 / _214;
    float _268 = _246 * _242;
    bool _270 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _272 = isnan(_198);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -_280;
    float _296 = _294 + 1.0;
    float _298 = _206 * _250;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _300;
    bool _304 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_198);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = _264 * _296;
    float _318 = -_264;
    float _320 = _318 + 1.0;
    float _322 = fma(_302, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _328 = _210 * _266;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _334;
    float _338 = _292 * _320;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _344 = fma(_332, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = fma(_336, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = -_292;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = fma(_326, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_342, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = _240 * _350;
    float _362 = -_240;
    float _364 = _362 + 1.0;
    float _366 = fma(_354, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _368 = _314 * _364;
    float _370 = -_314;
    float _372 = _370 + 1.0;
    float _374 = _322 * _368;
    float _376 = _344 * _368;
    float _378 = _346 * _368;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _380;
    float _384 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _374);
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _376);
    float _388 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _378);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_382, _328, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _400 = fma(_356, _360, _384);
    float _402 = fma(_366, _360, _386);
    float _404 = fma(_358, _360, _388);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _414 = fma(_392, _328, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_396, _328, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _422 = fma(_398, _338, _400);
    float _424 = fma(_408, _268, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _426 = fma(_412, _268, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _428 = fma(_420, _268, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _430 = fma(_414, _338, _402);
    float _432 = fma(_416, _338, _404);
    float _434 = fma(_424, _316, _422);
    float _436 = fma(_426, _316, _430);
    float _438 = fma(_428, _316, _432);
    float _440 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[147].x, _434);
    float _442 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[147].y, _436);
    float _444 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[147].z, _438);
    bool _446 = !_248;
    float _464;
    if (!_446)
    {
        float _448 = in.m_53.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        _464 = _156;
    }
    _466 = false;
    float _468 = _464;
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = in.m_55.z;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = _468 + _476;
    bool _480 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _482 = isnan(_468);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _500 = 1.0 / _494;
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _504 = 1.0 / _498;
    float _506 = _442 * _472;
    float _508 = _444 * _474;
    bool _510 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _512 = isnan(_468);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -_490;
    float _524 = _522 + 1.0;
    float _526 = _478 * _500;
    bool _528 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _530 = isnan(_468);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _542 = _468 + _540;
    float _544 = _520 * _524;
    float _546 = -_520;
    float _548 = _546 + 1.0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _558;
    float _562 = _538 * _548;
    float _564 = fma(_552, _526, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _566 = fma(_556, _526, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _568 = fma(_560, _526, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _570 = _542 * _504;
    float _572 = _564 * _562;
    float _574 = _566 * _562;
    float _576 = _568 * _562;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _586 = -_538;
    float _588 = _586 + 1.0;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _594 = fma(_580, _570, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _596 = fma(_584, _570, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].x, _572);
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].y, _574);
    float _602 = fma(_592, _570, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _604 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].z, _576);
    float _606 = fma(_594, _544, _598);
    float _608 = fma(_596, _544, _600);
    float _610 = _440 * _470;
    float _612 = fma(_602, _544, _604);
    float _614 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[109].x, _606);
    float _616 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[109].y, _608);
    float _618 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[109].z, _612);
    bool _620 = !_502;
    float _638;
    if (!_620)
    {
        float _622 = in.m_53.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _156;
    }
    _640 = false;
    float _642 = _638;
    bool _644 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _646 = isnan(_642);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _662 = isnan(_642);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _642 + _676;
    float _680 = -_654;
    float _682 = _680 + 1.0;
    bool _684 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _686 = 1.0 / _658;
    float _688 = _670 * _682;
    float _690 = -_670;
    float _692 = _690 + 1.0;
    float _694 = _674 * _686;
    float _696 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_694, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _702 = _698 * _688;
    float _704 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[115].x, _702);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[116].x, _706);
    float _716 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _718 = !_684;
    float _736;
    if (!_718)
    {
        float _720 = in.m_53.x;
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _724 = _720 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _728 = _726 * _722;
        float _730 = floor(_728);
        float _732 = -_730;
        float _734 = _728 + _732;
        _736 = _734;
        _738 = true;
    }
    else
    {
        _736 = _156;
    }
    _738 = false;
    float _740 = _736;
    float _742 = in.m_53.y;
    float _744 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _746 = log2(_744);
    float _748 = in.m_53.x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = in.m_42.x;
    float _754 = in.m_42.y;
    float _756 = in.m_42.z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _762 = _760 != 0;
    float _764 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _766 = in.m_53.z;
    float _768 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _770 = _742 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _774 = fma(_770, -2.0, _750);
    float _776 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _778 = _742 * 2.0;
    float _780 = _748 * 2.0;
    float _782 = _754 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = -_758;
    float _786 = fma(_776, 2.0, _784);
    float _788 = _754 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _790 = floor(_780);
    float _792 = _754 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _794 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _796 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[5].x, _788);
    float _798 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[6].x, _792);
    float _800 = _748 + _742;
    float _802 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].z, _796);
    float _804 = floor(_778);
    float _806 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _808 = _800 + (-1.0);
    float _810 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _812 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _806);
    float _814 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _816 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _810);
    float _818 = _808;
    float _820 = _756;
    float _822 = _798;
    float _824 = _742;
    if (!_762)
    {
        _818 = _742;
    }
    float _826 = _818;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _830 = _826;
    if (_762)
    {
        _830 = _748;
    }
    float _832 = _830;
    float _834 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _812);
    bool _836 = _790 > 0.0;
    float _838 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _816);
    bool _840 = _790 >= 0.0;
    bool _842 = isnan(_790);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    float _850 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].z, _798);
    bool _852 = _804 > 0.0;
    float _854 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[83].z, _772);
    bool _856 = _804 >= 0.0;
    bool _858 = isnan(_804);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _868 = _832;
    if (!_762)
    {
        _820 = _742;
    }
    float _870 = _820;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _874 = _766 * 2.0;
    float _876 = _870;
    if (_762)
    {
        _876 = _748;
    }
    float _878 = _876;
    float _880 = rsqrt(_838);
    float _882 = _878;
    if (!_762)
    {
        _868 = _766;
    }
    float _884 = _868;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _888 = _884;
    if (!_762)
    {
        _822 = _748;
    }
    float _890 = _822;
    float _892 = _878 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _894 = _890;
    if (_762)
    {
        _894 = _766;
    }
    float _896 = _894;
    float _898 = -_100;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[76].x, _786);
    if (!_762)
    {
        _882 = _884;
    }
    float _902 = _882;
    float _904 = floor(_874);
    float _906 = _902;
    if (_762)
    {
        _906 = _742;
    }
    float _908 = _906;
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[84].z, _886);
    float _912 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _774);
    int _914 = _864 ? 0 : 1;
    float _916 = _908 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _928 = _926 != 0;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_762)
    {
        _888 = _742;
    }
    float _932 = _888;
    float _934 = fma(_916, -2.0, _828);
    float _936 = _748 + _766;
    bool _938 = !_924;
    int _940 = _938 ? 0 : 1;
    float _942 = -_930;
    float _944 = fma(_892, 2.0, _942);
    bool _946 = !_920;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[83].w, _872);
    bool _952 = !_928;
    int _954 = _952 ? 0 : 1;
    float _956 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _958 = int(_956);
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _962 = _960 != 0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _966 = _964 != 0;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _970 = _968 != 0;
    float _972 = _936 + (-1.0);
    int _974 = ~_914;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    float _980 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _910);
    float _982 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _950);
    int _984 = _848 ? 0 : 1;
    float _986 = -_100;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[81].x, _944);
    int _990 = _978;
    if (!_852)
    {
        int _992 = ~_914;
        int _994 = _992 + 1;
        _990 = _994;
    }
    int _996 = _990;
    float _998 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1000 = !_966;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = _742 + _766;
    int _1006 = ~_984;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = _834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _1014 = _1010;
    if (!_836)
    {
        int _1016 = ~_984;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = _1004 + (-1.0);
    int _1024 = abs(_1002);
    float _1026 = _746 * _100;
    float _1028 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1030 = int(_1028);
    float _1032 = float(_1020);
    float _1034 = float(_1024);
    float _1036 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1038 = float(_996);
    float _1040 = float(_958);
    float _1042 = _1034 * _1032;
    float _1044 = exp2(_1026);
    float _1046 = in.m_57.x;
    float _1048 = in.m_57.y;
    float _1050 = in.m_57.z;
    float _1052 = _1042 * (-2.0);
    bool _1054 = !_970;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1060 = 1.0 + _1058;
    float _1062 = 1.0 / _1040;
    int _1064 = abs(_1056);
    float _1066 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _854);
    bool _1068 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1070 = isnan(0.0);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1076 = _1072 || _1074;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1080 = _904 > 0.0;
    bool _1082 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1084 = isnan(1.0);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1090 = _1086 || _1088;
    float _1092 = 1.0 / _1060;
    float _1094 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1078);
    float _1096 = float(_1064);
    bool _1098 = _904 >= 0.0;
    bool _1100 = isnan(_904);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1110 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1094);
    float _1112 = _1062 * _100;
    float _1114 = _1096 * _1038;
    float _1116 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1108);
    float _1118 = -_1044;
    float _1120 = _1118 + 1.0;
    float _1122 = fma(_1052, _1048, _1048);
    float _1124 = float(_1030);
    float _1126 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1128 = _1106 ? 0 : 1;
    float _1130 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1116);
    float _1132 = _1076 ? _1120 : 0.0;
    float _1134 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _934);
    float _1136 = fma(_1036, _1052, _1036);
    float _1138 = _742 + (-0.5);
    float _1140 = _1126 * _1126;
    float _1142 = _1124 * _100;
    int _1144 = ~_1128;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1122);
    float _1152 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    int _1154 = _1148;
    if (_1090)
    {
        float _1156 = _1132 * _1092;
        _110 = _1156;
    }
    float _1158 = _110;
    if (!_1080)
    {
        int _1160 = ~_1128;
        int _1162 = _1160 + 1;
        _1154 = _1162;
    }
    int _1164 = _1154;
    float _1166 = _1114 * (-2.0);
    float _1168 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1170 = fma(_1152, _1152, _1140);
    bool _1172 = !_962;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = fma(_1166, _1050, _1050);
    float _1178 = fma(_998, _1166, _998);
    float _1180 = fma(_1168, _1168, _1170);
    int _1182 = abs(_1174);
    float _1184 = _866 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1186 = _802 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1188 = _766 + (-0.5);
    float _1190 = float(_1164);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1192;
    float _1196 = float(_1182);
    float _1198 = fma(_1136, _1158, _1150);
    float _1200 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1176);
    float _1204 = _850 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1206 = _1196 * _1190;
    float _1208 = 1.0 / _1194;
    float _1210 = in.m_59.x;
    float _1212 = in.m_59.y;
    float _1214 = in.m_59.z;
    float _1216 = fma(_1178, _1158, _1202);
    float _1218 = _1206 * (-2.0);
    float _1220 = _1198 * 0.15915493667125701904296875;
    float _1222 = _1216 * 0.15915493667125701904296875;
    float _1224 = fma(_1218, _1046, _1046);
    float _1226 = _748 + (-0.5);
    float _1228 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1200);
    float _1230 = fma(_814, _1218, _814);
    float _1232 = rsqrt(_1180);
    float _1234 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1224);
    float _1236 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1228);
    float _1238 = fma(_1230, _1158, _1234);
    float _1240 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1242 = _1222 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = _1238 * 0.15915493667125701904296875;
    float _1248 = -_1240;
    float _1250 = _1012 + _1248;
    bool _1252 = _1240 >= _1012;
    bool _1254 = isnan(_1240);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan(_1012);
    bool _1260 = _1256 || _1258;
    float _1262 = abs(_1250);
    float _1264 = precise::max(_1262, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1266 = _1220 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    bool _1270 = !_1260;
    float _1272 = _1270 ? 1.0 : (-1.0);
    float _1274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1214);
    float _1276 = precise::min(_1264, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1278 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1280 = _1126 * _1232;
    float _1282 = _1220 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = _1246 * 6.283185482025146484375;
    float _1288 = sin(_1286);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1292 = _1276 + _1290;
    float _1294 = _1292 * _1208;
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1210);
    float _1298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1212);
    float _1300 = _1246 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1272 * _1294;
    float _1306 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1308 = _1278 * _1296;
    float _1310 = _764 * _1298;
    float _1312 = _768 * _1274;
    float _1314 = _1306 * _1304;
    float _1316 = _1152 * _1232;
    float _1318 = _1222 * 6.283185482025146484375;
    float _1320 = sin(_1318);
    float _1322 = _1244 * _1310;
    float _1324 = _1288 * _1268;
    float _1326 = _1314 * 0.15915493667125701904296875;
    float _1328 = _1168 * _1232;
    float _1330 = _1284 * _1244;
    float _1332 = _1268 * _1244;
    float _1334 = _1302 * _1284;
    float _1336 = _1288 * _1284;
    float _1338 = _1326 * 6.283185482025146484375;
    float _1340 = cos(_1338);
    float _1342 = -_1310;
    float _1344 = _1320 * _1342;
    float _1346 = _1302 * _1268;
    float _1348 = _1302 * _1322;
    float _1350 = fma(_1320, _1334, _1324);
    float _1352 = fma(_1330, _1308, _1344);
    float _1354 = -_1336;
    float _1356 = fma(_1320, _1346, _1354);
    float _1358 = _1288 * _1322;
    float _1360 = fma(_1350, _1308, _1348);
    float _1362 = -_1346;
    float _1364 = fma(_1320, _1336, _1362);
    float _1366 = _1326 * 6.283185482025146484375;
    float _1368 = sin(_1366);
    float _1370 = fma(_1320, _1324, _1334);
    float _1372 = fma(_1356, _1312, _1360);
    float _1374 = fma(_1332, _1312, _1352);
    float _1376 = fma(_1364, _1308, _1358);
    float _1378 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1382 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1384 = fma(_1370, _1312, _1376);
    float _1386 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1378);
    float _1388 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1380);
    float _1390 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1382);
    float _1392 = -_1340;
    float _1394 = _1392 + 1.0;
    float _1396 = _1328 * _1328;
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1388);
    float _1400 = _1316 * _1368;
    float _1402 = _1280 * _1394;
    float _1404 = _1280 * _1368;
    float _1406 = fma(_1394, _1396, _1340);
    float _1408 = _1328 * _1368;
    float _1410 = _1316 * _1394;
    float _1412 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1386);
    float _1414 = fma(_1328, _1402, _1400);
    float _1416 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1418 = -_1408;
    float _1420 = fma(_1280, _1410, _1418);
    float _1422 = -_1404;
    float _1424 = fma(_1328, _1410, _1422);
    float _1426 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1428 = _1416 * _1414;
    float _1430 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1390);
    float _1432 = fma(_1316, _1410, _1340);
    float _1434 = _1416 * _1420;
    float _1436 = fma(_1426, _1424, _1428);
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1440 = fma(_1280, _1402, _1340);
    float _1442 = fma(_1426, _1432, _1434);
    float _1444 = fma(_1328, _1410, _1404);
    float _1446 = fma(_1438, _1406, _1436);
    float _1448 = fma(_1280, _1410, _1408);
    float _1450 = _1416 * _1440;
    float _1452 = fma(_1438, _1444, _1442);
    float _1454 = _1204 + _1446;
    float _1456 = -_1400;
    float _1458 = fma(_1328, _1402, _1456);
    float _1460 = fma(_1426, _1448, _1450);
    float _1462 = _1184 + _1452;
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1466 = _1454 + _1464;
    float _1468 = fma(_1438, _1458, _1460);
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1472 = _1462 + _1470;
    float _1474 = _1466 * _1466;
    float _1476 = _1186 + _1468;
    float _1478 = fma(_1472, _1472, _1474);
    float _1480 = sqrt(_1478);
    bool _1482 = _1480 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1484 = _1458;
    float _1486 = _1328;
    float _1488 = _1448;
    float _1490 = _1480;
    float _1492 = _1462;
    if (!_1482)
    {
        _1484 = _1462;
    }
    float _1494 = _1484;
    float _1496 = _1494;
    if (!_1482)
    {
        _1486 = _1454;
    }
    float _1498 = _1486;
    float _1500 = _1498;
    if (!_1482)
    {
        _1488 = _1476;
    }
    float _1502 = _1488;
    bool _1504 = !_1482;
    float _1506 = _1502;
    if (!_1504)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1512 = _1480 + _1510;
        float _1514 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1516 = rsqrt(_1478);
        float _1518 = _1512 * _1508;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1520 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = _1520 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        float _1530 = _1524 + (-1.0);
        float _1532 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = fma(_1528, _1514, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1536 = fma(_1476, _1524, _1532);
        float _1538 = _1516 * _1534;
        float _1540 = fma(_1472, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1542 = fma(_1466, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1506 = _1536;
        _1496 = _1540;
        _1500 = _1542;
    }
    float _1544 = _1506;
    float _1546 = _1496;
    float _1548 = _1500;
    float _1550 = -_1186;
    float _1552 = _1550 + _1544;
    float _1554 = -_1184;
    float _1556 = _1554 + _1546;
    float _1558 = -_1204;
    float _1560 = _1558 + _1548;
    float _1562 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1564 = _1552 * _1552;
    float _1566 = fma(_1556, _1556, _1564);
    float _1568 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1562);
    float _1570 = fma(_1560, _1560, _1566);
    float _1572 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1568);
    float _1574 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1576 = sqrt(_1570);
    float _1578 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1580 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1574);
    float _1582 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1580);
    bool _1584 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan(0.5);
    bool _1592 = _1588 || _1590;
    float _1594 = 1.0 / _1578;
    float _1596 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1598 = _1596 + _1578;
    bool _1600 = _1576 > 0.0;
    bool _1602 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan(0.5);
    bool _1610 = _1606 || _1608;
    float _1612 = _1598 * _1594;
    float _1614 = _1612 * 0.5;
    bool _1616 = !_1600;
    float _1618 = _1546;
    float _1620 = _1544;
    float _1622 = _1548;
    float _1624 = _1556;
    if (!_1616)
    {
        float _1626 = _172 * _172;
        float _1628 = rsqrt(_1570);
        float _1630 = fma(_170, _170, _1626);
        float _1632 = fma(_174, _174, _1630);
        float _1634 = sqrt(_1632);
        float _1636 = _1552 * _1628;
        float _1638 = _1560 * _1628;
        bool _1640 = _1634 > 0.0;
        float _1642 = _1556 * _1628;
        bool _1644 = !_1640;
        if (!_1644)
        {
            float _1646 = rsqrt(_1632);
            float _1648 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1650 = _172 * _1646;
            float _1652 = _170 * _1646;
            float _1654 = _1636 * _1650;
            float _1656 = _174 * _1646;
            float _1658 = fma(_1642, _1652, _1654);
            float _1660 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1662 = fma(_1638, _1656, _1658);
            float _1664 = _1662 * _1660;
            float _1666 = fma(_170, _1664, _1546);
            float _1668 = fma(_172, _1664, _1544);
            float _1670 = fma(_174, _1664, _1548);
            _1618 = _1666;
            _1620 = _1668;
            _1622 = _1670;
            _1624 = _1660;
        }
    }
    float _1672 = _1618;
    float _1674 = _1620;
    float _1676 = _1622;
    float _1678 = _1624;
    float _1680 = _1674;
    float _1682 = _1672;
    float _1684 = _1676;
    float _1686 = _1678;
    if (_1610)
    {
        _1490 = 1.0;
    }
    float _1688 = _1490;
    float _1690 = _1688;
    if (!_1592)
    {
        float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1694 = _1186 + _1692;
        float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1698 = _1184 + _1696;
        float _1700 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1702 = -_1184;
        float _1704 = _1702 + _1672;
        float _1706 = _1694 * _1694;
        float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1710 = _1204 + _1708;
        float _1712 = -_1186;
        float _1714 = _1712 + _1674;
        float _1716 = fma(_1698, _1698, _1706);
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1720 = fma(_1710, _1710, _1716);
        float _1722 = sqrt(_1720);
        float _1724 = _1700 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1726 = precise::min(_1722, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1728 = _1726 * _1718;
        float _1730 = _1724 * _1728;
        float _1732 = -_1204;
        float _1734 = _1732 + _1676;
        float _1736 = fma(_1704, _1730, _1184);
        float _1738 = fma(_1714, _1730, _1186);
        float _1740 = fma(_1734, _1730, _1204);
        _1680 = _1738;
        _1682 = _1736;
        _1684 = _1740;
    }
    float _1742 = _1680;
    float _1744 = _1682;
    float _1746 = _1684;
    if (!_1610)
    {
        float _1748 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1752 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1750);
        float _1754 = _1748 * 0.15915493667125701904296875;
        float _1756 = _1754 * 6.283185482025146484375;
        float _1758 = cos(_1756);
        float _1760 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1762 = _1760 * 0.15915493667125701904296875;
        float _1764 = _1754 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = 1.0 / _1758;
        float _1770 = _1762 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = 1.0 / _1752;
        float _1778 = _1772 * _1774;
        float _1780 = _1762 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1786 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1784;
        float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1790 = _1776 * _1788;
        float _1792 = 1.0 / _1778;
        float _1794 = 1.0 / _1786;
        float _1796 = _1782 * _1792;
        float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1800 = fma(_1796, _1790, _1798);
        float _1802 = _1800 * _1794;
        float _1804 = precise::clamp(_1802, 0.0, 1.0);
        _1686 = _1762;
        _1690 = _1804;
    }
    float _1806 = _1686;
    float _1808 = _1690;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1812 = _1742 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1816 = _1744 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1820 = _1746 + _1818;
    float _1822 = _1812 * _1812;
    float _1824 = fma(_1816, _1816, _1822);
    float _1826 = fma(_1820, _1820, _1824);
    float _1828 = rsqrt(_1826);
    float _1830 = sqrt(_1826);
    float _1832 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1834 = _1816 * _1832;
    float _1836 = _1820 * _1832;
    float _1838 = _1834 * _1834;
    float _1840 = _1836 * _1836;
    float _1842 = _1838 + _1840;
    float _1844 = sqrt(_1842);
    bool _1846 = _1844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1850 = _1844 + _1848;
    float _1852 = _1820;
    float _1854 = _1842;
    float _1856 = _1850;
    float _1858 = _1806;
    float _1860 = _1812;
    if (_1846)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1852 = _1862;
    }
    float _1864 = _1852;
    if (_1846)
    {
        float _1866 = rsqrt(_1842);
        _1854 = _1866;
    }
    float _1868 = _1854;
    float _1870 = _1868;
    if (_1846)
    {
        float _1872 = _1850 * _1864;
        _1856 = _1872;
    }
    float _1874 = _1856;
    if (_1846)
    {
        float _1876 = _1874 * 0.15915493667125701904296875;
        _1858 = _1876;
    }
    float _1878 = _1858;
    float _1880 = _1864;
    float _1882 = _1878;
    if (_1846)
    {
        float _1884 = _1878 * 6.283185482025146484375;
        float _1886 = sin(_1884);
        _1880 = _1886;
    }
    float _1888 = _1880;
    float _1890 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1892 = precise::max(0.0, _1890);
    float _1894 = _1822;
    float _1896 = _1892;
    if (_1846)
    {
        float _1898 = _1878 * 6.283185482025146484375;
        float _1900 = cos(_1898);
        _1894 = _1900;
    }
    float _1902 = _1894;
    float _1904 = -_1832;
    float _1906 = -_1892;
    float _1908 = fma(_1812, _1904, _1906);
    if (_1846)
    {
        float _1910 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1910;
    }
    float _1912 = _1896;
    float _1914 = _1888;
    float _1916 = _1912;
    if (_1846)
    {
        float _1918 = fma(_1888, _1912, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1860 = _1918;
    }
    float _1920 = _1860;
    float _1922 = _1920;
    if (!_1846)
    {
        _1914 = _1834;
    }
    float _1924 = _1914;
    float _1926 = _1924;
    float _1928 = _1902;
    if (_1846)
    {
        float _1930 = _1902 + (-1.0);
        _1916 = _1930;
    }
    float _1932 = _1916;
    float _1934 = _1932;
    if (_1846)
    {
        float _1936 = _1868 * _1920;
        _1492 = _1936;
    }
    float _1938 = _1492;
    if (!_1846)
    {
        _1922 = _1908;
    }
    float _1940 = _1922;
    float _1942 = _1940;
    if (_1846)
    {
        float _1944 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1944;
    }
    float _1946 = _1882;
    if (_1846)
    {
        float _1948 = _1834 * _1938;
        _1926 = _1948;
    }
    float _1950 = _1926;
    if (!_1846)
    {
        _1934 = _1836;
    }
    float _1952 = _1934;
    float _1954 = _1952;
    if (_1846)
    {
        float _1956 = _1836 * _1938;
        _1954 = _1956;
    }
    float _1958 = _1954;
    if (!_1846)
    {
        _1870 = _1838;
    }
    float _1960 = _1870;
    float _1962 = _1960;
    if (_1846)
    {
        float _1964 = fma(_1908, _1902, _1946);
        _1942 = _1964;
    }
    float _1966 = _1942;
    if (_1846)
    {
        float _1968 = _1950 * _1950;
        _1962 = _1968;
    }
    float _1970 = _1962;
    if (!_1846)
    {
        _1928 = _1840;
    }
    float _1972 = _1928;
    float _1974 = _1972;
    if (_1846)
    {
        float _1976 = _1958 * _1958;
        _1974 = _1976;
    }
    float _1978 = _1974;
    float _1980 = fma(_1966, _1966, _1970);
    float _1982 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1984 = _1980 + _1978;
    float _1986 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1990 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1988);
    float _1992 = precise::clamp(_1990, 0.0, 1.0);
    float _1994 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1996 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1998 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1986);
    float _2000 = rsqrt(_1984);
    float _2002 = -_1992;
    float _2004 = _2002 + 1.0;
    float _2006 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1994);
    float _2008 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1998);
    float _2010 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2012 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1982);
    float _2014 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2006);
    float _2016 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2018 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2010);
    float _2020 = abs(_2004);
    float _2022 = log2(_2020);
    float _2024 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2026 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2028 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2018);
    float _2030 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2032 = -_2026;
    float _2034 = fma(_2032, _1996, 1.0);
    float _2036 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2038 = _2000 * _1950;
    float _2040 = _2000 * _1966;
    float _2042 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2012);
    float _2044 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2030);
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2048 = _2000 * _1958;
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2052 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2044);
    float _2054 = -_2046;
    float _2056 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2054);
    float _2058 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2060 = log2(_2034);
    float _2062 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2052);
    float _2064 = -_2048;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2056);
    float _2068 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2070 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = fma(_2066, -0.5, 0.5);
    float _2074 = fma(_2066, 0.5, 0.5);
    float _2076 = exp2(_2058);
    float _2078 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2068);
    float _2080 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2082 = _2040 + 1.0;
    float _2084 = fma(_2074, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2086 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2078);
    float _2088 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2080);
    float _2090 = 1.0 / _2062;
    float _2092 = _2060 * 0.693147182464599609375;
    float _2094 = fma(_2074, _2084, -0.212114393711090087890625);
    float _2096 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2098 = fma(_2074, _2094, 1.570728778839111328125);
    float _2100 = sqrt(_2072);
    float _2102 = -_2040;
    float _2104 = fma(_2076, _2082, _2102);
    float _2106 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2108 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2088);
    float _2110 = fma(_2104, 0.5, 0.5);
    float _2112 = _2108 * _2090;
    float _2114 = _2106 * _2090;
    float _2116 = fma(_2114, 0.5, 0.5);
    float _2118 = _2100 * 0.636619746685028076171875;
    float _2120 = fma(_2112, -0.5, 0.5);
    float _2122 = -_2098;
    float _2124 = fma(_2118, _2122, 1.0);
    float3 _6171 = float3(_2116, _2120, _2096);
    float _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).x;
    float3 _6182 = float3(_2116, _2120, _2096);
    float4 _2129 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6182, float3(0.0), isnan(_6182)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6182, float3(0.0), isnan(_6182)), level(0.0)).xyzw;
    float _2131 = _2129.x;
    float _2133 = _2129.y;
    float _2135 = _2129.z;
    float _2137 = _2129.w;
    float2 _6199 = float2(_2124, _2110);
    float3 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6199, float2(0.0), isnan(_6199)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6199, float2(0.0), isnan(_6199)), level(0.0)).xyz;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = float(uint(_1030));
    float _2151 = trunc(_1112);
    int _2153 = int(_2151);
    int _2155 = ~_1030;
    int _2157 = _2155 + 1;
    float _2159 = _1142 * _152;
    int _2161 = ~_1030;
    int _2163 = _2161 + 1;
    float _2165 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2167 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _708;
    out.m_61.y = _710;
    out.m_61.z = _712;
    out.m_61.w = _716;
    float _2169 = 1.0 / _2149;
    float _2171 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2167);
    out.m_63.x = _1744;
    out.m_63.y = _1742;
    out.m_63.z = _1746;
    float _2173 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2171);
    float _2175 = float(uint(_2153));
    float _2177 = trunc(_2159);
    int _2179 = int(_2177);
    float _2181 = float(_2153);
    float _2183 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2173);
    int _2185 = as_type<int>(_2169) + (-2);
    float _2187 = exp2(_2165);
    out.gl_Position.x = _2106;
    out.gl_Position.y = _2108;
    out.gl_Position.z = _2183;
    out.gl_Position.w = _2062;
    float _2189 = as_type<float>(_2185) * _2175;
    float _2191 = trunc(_2189);
    float _2193 = precise::max(_2191, 0.0);
    uint _2196 = uint(_2193);
    float _2198 = -_2187;
    float _2200 = _2198 + 1.0;
    float _2202 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2204 = _2157 * int(_2196);
    int _2206 = _2204 + _2153;
    float _2208 = float(uint(_2206));
    float _2210 = as_type<float>(_2185) * _2208;
    bool _2212 = !_762;
    float _2214 = _2212 ? 7.345489978790283203125 : 1.0;
    float _2216 = trunc(_2210);
    float _2218 = precise::max(_2216, 0.0);
    uint _2220 = uint(_2218);
    float _2222 = _2214 * _748;
    bool _2224 = _2181 >= _1124;
    bool _2226 = isnan(_2181);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan(_1124);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = floor(_2222);
    int _2238 = int(_2196) + int(_2220);
    float _2240 = trunc(_2234);
    int _2242 = int(_2240);
    int _2244 = _2163 * _2238;
    int _2246 = _2244 + _2153;
    float _2248 = -_2236;
    float _2250 = _2222 + _2248;
    bool _2252 = uint(_2246) >= uint(_1030);
    float _2254 = _2250 * _1124;
    bool _2256 = !_2252;
    int _2258 = _2256 ? 0 : (-1);
    bool _2260 = _1030 == 0;
    float _2262 = trunc(_2254);
    int _2264 = int(_2262);
    int _2266 = ~_2238;
    int _2268 = _2266 + _2258;
    int _2270 = _2268 + 1;
    int _2272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2274 = _2272 != 0;
    int _2276 = ~_2242;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _1030 * _2270;
    int _2284 = _2282 + _2153;
    bool _2286 = !_2274;
    int _2288 = _2286 ? 0 : 1;
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2292 = _2290 != 0;
    bool _2294 = !_2260;
    int _2296 = _2294 ? _2284 : (-1);
    int _2298 = _1030 + (-1);
    int _2300 = abs(_940);
    int _2302 = _2296 * _2280;
    int _2304 = abs(_2288);
    int _2306 = abs(_948);
    int _2308 = _2242 * _2298;
    int _2310 = _2308 + _2302;
    int _2312 = _2264 * _2304;
    int _2314 = _2312 + _2153;
    int _2316 = abs(_954);
    int _2318 = _2310 * _2300;
    bool _2320 = !_2292;
    int _2322 = _2320 ? 0 : 1;
    int _2324 = _2179 * _2306;
    int _2326 = _2324 + _2318;
    int _2328 = abs(_2322);
    float _2330 = in.m_65.y;
    int _2332 = ~_1030;
    int _2334 = _2332 + 1;
    int _2336 = _2314 * _2316;
    int _2338 = _2336 + _2326;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2342 = _2340 != 0;
    int _2344 = _2264 * _2328;
    int _2346 = _2344 + _2338;
    int _2348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2350 = _2348 != 0;
    float _2352 = in.m_65.x;
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2356 = _2354 != 0;
    float _2358 = float(uint(_2346));
    int _2360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2362 = _2360 != 0;
    int _2364 = ~_1030;
    int _2366 = _2364 + 1;
    float _2368 = as_type<float>(_2185) * _2358;
    int _2370 = ~_1030;
    int _2372 = _2370 + 1;
    float _2374 = trunc(_2368);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    int _2380 = _2280;
    float _2382 = _2330;
    int _2384 = _2185;
    float _2386 = _2352;
    if (_2362)
    {
        float _2388 = -_2352;
        float _2390 = _2388 + 1.0;
        _2380 = as_type<int>(_2390);
    }
    int _2392 = _2380;
    int _2394 = _2372 * int(_2378);
    int _2396 = _2394 + _2346;
    float _2398 = float(uint(_2396));
    float _2400 = as_type<float>(_2185) * _2398;
    float _2402 = in.m_53.w;
    float _2404 = trunc(_2400);
    float _2406 = precise::max(_2404, 0.0);
    uint _2408 = uint(_2406);
    float _2410 = -_2330;
    float _2412 = _2410 + 1.0;
    int _2414 = int(_2378) + int(_2408);
    bool _2416 = _2402 > 0.5;
    float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2420 = _2418 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2422 = float(uint(_2314));
    int _2424 = _2334 * _2414;
    int _2426 = _2424 + _2346;
    int _2428 = _2416 ? as_type<int>(_2412) : as_type<int>(_2330);
    bool _2430 = _742 > 0.5;
    float _2432 = 1.0 / _2420;
    bool _2434 = uint(_2426) >= uint(_1030);
    float _2436 = as_type<float>(_2185) * _2422;
    bool _2438 = _2430;
    if (!_2342)
    {
        _824 = _2352;
    }
    float _2440 = _824;
    bool _2442 = !_2434;
    int _2444 = _2442 ? 0 : (-1);
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2448 = _2446 != 0;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2450;
    int _2454 = ~_2414;
    int _2456 = _2454 + _2444;
    int _2458 = _2456 + 1;
    float _2460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2462 = _2448 ? as_type<float>(_2428) : _2330;
    bool _2464 = _2448;
    float _2466 = _2440;
    if (_2342)
    {
        bool _2468 = _748 > 0.5;
        _2464 = _2468;
    }
    bool _2470 = _2464;
    int _2472 = _1030 * _2458;
    int _2474 = _2472 + _2346;
    if (_2350)
    {
        float _2476 = _2430 ? _2412 : _2330;
        _2382 = _2476;
    }
    float _2478 = _2382;
    float _2480 = _2452 * _2432;
    float _2482 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2484 = _740 + _2482;
    bool _2486 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2488 = isnan(_740);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2494 = _2490 || _2492;
    float _2496 = float(_2494);
    float _2498 = trunc(_2436);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    bool _2504 = !_2260;
    int _2506 = _2504 ? _2474 : (-1);
    float _2508 = fma(_2480, _2484, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_2362)
    {
        bool _2510 = _766 > 0.5;
        _2438 = _2510;
    }
    bool _2512 = _2438;
    float _2514 = -_2496;
    float _2516 = _2514 + 1.0;
    int _2518 = _2506 >> 31;
    float _2520 = _980 * (-0.15915493667125701904296875);
    bool _2522 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2524 = isnan(_740);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2530 = _2526 || _2528;
    float _2532 = float(_2530);
    float _2534 = _2460 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2536 = _2518 & 3;
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2540 = _2532 * _2516;
    int _2542 = _2506 + _2536;
    float _2544 = fma(_2462, _2534, -0.5);
    float _2546 = -_2532;
    float _2548 = _2546 + 1.0;
    float _2550 = _2508 * _2540;
    int _2552 = _2542 >> 2;
    int _2554 = _2366 * int(_2502);
    int _2556 = _2554 + _2314;
    float _2558 = _2520 * 6.283185482025146484375;
    float _2560 = sin(_2558);
    float _2562 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2550);
    int _2564 = _2552 << 4;
    int _2566 = _2564 + 368;
    float _2568 = float(uint(_2556));
    float _2570 = fma(_2496, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2562);
    uint _2572 = uint(int(uint(_2566) >> uint(2)));
    uint _2574 = uint(int(uint(int(_2572)) >> uint(2)));
    int _2576 = int(_2572) & 3;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[int(_2574)][_2576];
    int _2580 = int(_2572) + 1;
    uint _2582 = uint(int(uint(_2580) >> uint(2)));
    int _2584 = _2580 & 3;
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[int(_2582)][_2584];
    float _2588 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2590 = _2520 * 6.283185482025146484375;
    float _2592 = cos(_2590);
    float _2594 = as_type<float>(_2185) * _2568;
    if (_2342)
    {
        float _2596 = -_2352;
        float _2598 = _2596 + 1.0;
        _2384 = as_type<int>(_2598);
    }
    int _2600 = _2384;
    float _2602 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2604 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2478, -0.5);
    float _2606 = trunc(_2594);
    float _2608 = precise::max(_2606, 0.0);
    uint _2610 = uint(_2608);
    int _2612 = _2566 + 8;
    uint _2614 = uint(int(uint(_2612) >> uint(2)));
    uint _2616 = uint(int(uint(int(_2614)) >> uint(2)));
    int _2618 = int(_2614) & 3;
    float _2620 = (*spvDescriptorSet0.vp_c9)._m0[int(_2616)][_2618];
    int _2622 = int(_2614) + 1;
    uint _2624 = uint(int(uint(_2622) >> uint(2)));
    int _2626 = _2622 & 3;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[int(_2624)][_2626];
    if (_2342)
    {
        float _2630 = _2470 ? as_type<float>(_2600) : _2352;
        _2466 = _2630;
    }
    float _2632 = _2466;
    float _2634 = -_912;
    float _2636 = fma(_1130, _2604, _2634);
    if (_2362)
    {
        float _2638 = _2512 ? as_type<float>(_2392) : _2352;
        _2386 = _2638;
    }
    float _2640 = _2386;
    out.m_67.w = _2602;
    int _2642 = _2506 & 3;
    bool _2644 = _2642 != 0;
    float _2646 = fma(_2588, _2640, -0.5);
    bool _2648 = uint(_2642) > 1u;
    int _2650 = ~_1030;
    int _2652 = _2650 + 1;
    float _2654 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2656 = _2506 & 3;
    bool _2658 = _2656 != 0;
    int _2660 = int(_2502) + int(_2610);
    float _2662 = fma(_1110, _2654, _900);
    float _2664 = _2560 * _2544;
    int _2666 = _2658 ? 0 : 1;
    float _2668 = _2592 * _2544;
    bool _2670 = _2642 != 3;
    int _2672 = _2652 * _2660;
    int _2674 = _2672 + _2314;
    int _2676 = ~_2666;
    int _2678 = _2676 + 1;
    int _2680 = _2678 + 1;
    float _2682 = fma(_2560, _2646, _2668);
    int _2684 = _2680;
    if (!_2648)
    {
        int _2686 = ~_2666;
        int _2688 = _2686 + 1;
        _2684 = _2688;
    }
    int _2690 = _2684;
    float _2692 = -_2664;
    float _2694 = fma(_2592, _2646, _2692);
    bool _2696 = uint(_2642) >= 2u;
    float _2698 = _2202 * _2126;
    bool _2700 = !_2644;
    int _2702 = _2700 ? 0 : 1;
    float _2704 = fma(_1066, _2694, _988);
    bool _2706 = _2642 != 3;
    float _2708 = _2137 * _2698;
    int _2710 = abs(_2690);
    float _2712 = -_1134;
    float _2714 = fma(_982, _2682, _2712);
    int _2716 = _2696 ? 0 : 1;
    float _2718 = -_2202;
    float _2720 = _2718 + 1.0;
    bool _2722 = uint(_2674) >= uint(_1030);
    bool _2724 = !_2356;
    int _2726 = _2724 ? 0 : 1;
    float _2728 = _2147 * _2698;
    int _2730 = abs(_2702);
    float _2732 = fma(_2143, _2708, _2131);
    bool _2734 = !_2706;
    int _2736 = _2734 ? 0 : (-1);
    float _2738 = _2662 + 0.5;
    int _2740 = ~_2710;
    int _2742 = _2740 + 1;
    int _2744 = _2742 + 1;
    float _2746 = _2714 + 0.5;
    int _2748 = ~_2716;
    int _2750 = _2748 + 1;
    int _2752 = _2750 + 1;
    float _2754 = fma(_2145, _2708, _2133);
    int _2756 = _2752;
    if (_2670)
    {
        int _2758 = ~_2716;
        int _2760 = _2758 + 1;
        _2756 = _2760;
    }
    int _2762 = _2756;
    int _2764 = _2744 * as_type<int>(_2586);
    int _2766 = abs(_2736);
    float _2768 = fma(_2137, _2728, _2135);
    int _2770 = ~_2730;
    int _2772 = _2770 + 1;
    int _2774 = _2772 + 1;
    int _2776 = abs(_2726);
    int _2778 = abs(_2762);
    int _2780 = _2774 * as_type<int>(_2578);
    int _2782 = _2780 + _2764;
    bool _2784 = !_2722;
    int _2786 = _2784 ? 0 : (-1);
    int _2788 = ~_2778;
    int _2790 = _2788 + 1;
    int _2792 = _2790 + 1;
    int _2794 = ~_2660;
    int _2796 = _2794 + _2786;
    int _2798 = _2796 + 1;
    int _2800 = ~_2766;
    int _2802 = _2800 + 1;
    int _2804 = _2802 + 1;
    int _2806 = _2792 * as_type<int>(_2620);
    int _2808 = _2806 + _2782;
    int _2810 = ~_2776;
    int _2812 = _2810 + 1;
    int _2814 = _2812 + 1;
    int _2816 = _1030 * _2798;
    int _2818 = _2816 + _2314;
    float _2820 = _2636 + 0.5;
    int _2822 = _2804 * as_type<int>(_2628);
    int _2824 = _2822 + _2808;
    float _2826 = _2704 + 0.5;
    bool _2828 = !_2260;
    int _2830 = _2828 ? _2818 : (-1);
    int _2832 = _2824 * _2814;
    bool _2834 = _1808 > 0.0;
    bool _2836 = isnan(_1808);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan(0.0);
    bool _2842 = _2838 || _2840;
    float _2844 = _1808 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _2738;
    out.m_69.y = _2820;
    out.m_69.z = _2826;
    out.m_69.w = _2746;
    int _2846 = _2830 * _2776;
    int _2848 = _2846 + _2832;
    float _2850 = _2183 + _2062;
    float _2852 = _2844 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2854 = float(_2848);
    float _2856 = _2850 * 0.5;
    out.m_49.x = _2852;
    out.m_71.x = _2854;
    out.m_73.z = _2856;
    out.m_73.w = _2062;
    float _2858 = _2137 * _2720;
    out.m_75.x = _2732;
    out.m_75.y = _2754;
    out.m_75.z = _2768;
    out.m_75.w = _2858;
    if (_2842)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2860 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2860;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _738 = false;
    bool _640 = false;
    bool _466 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2929 = as_type<float>(_118);
        out.gl_Position.z = _2929;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = float(_96);
    bool _134 = _100 >= _132;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    if (_138)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _108;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _120 = as_type<int>(_142);
    }
    int _144 = _120;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2984 = as_type<float>(_144);
        out.gl_Position.z = _2984;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _132;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        _194 = _156;
    }
    _196 = false;
    float _198 = _194;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _198 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = 1.0 / _222;
    bool _230 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _232 = isnan(_198);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = 1.0 / _218;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _246 = _198 + _244;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = 1.0 / _226;
    float _252 = _202 * _228;
    bool _254 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _256 = isnan(_198);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = 1.0 / _214;
    float _268 = _246 * _242;
    bool _270 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _272 = isnan(_198);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -_280;
    float _296 = _294 + 1.0;
    float _298 = _206 * _250;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _300;
    bool _304 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_198);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = _264 * _296;
    float _318 = -_264;
    float _320 = _318 + 1.0;
    float _322 = fma(_302, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _328 = _210 * _266;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _334;
    float _338 = _292 * _320;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _344 = fma(_332, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = fma(_336, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = -_292;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = fma(_326, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_342, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = _240 * _350;
    float _362 = -_240;
    float _364 = _362 + 1.0;
    float _366 = fma(_354, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _368 = _314 * _364;
    float _370 = -_314;
    float _372 = _370 + 1.0;
    float _374 = _322 * _368;
    float _376 = _344 * _368;
    float _378 = _346 * _368;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _380;
    float _384 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _374);
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _376);
    float _388 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _378);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_382, _328, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _400 = fma(_356, _360, _384);
    float _402 = fma(_366, _360, _386);
    float _404 = fma(_358, _360, _388);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _414 = fma(_392, _328, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_396, _328, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _422 = fma(_398, _338, _400);
    float _424 = fma(_408, _268, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _426 = fma(_412, _268, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _428 = fma(_420, _268, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _430 = fma(_414, _338, _402);
    float _432 = fma(_416, _338, _404);
    float _434 = fma(_424, _316, _422);
    float _436 = fma(_426, _316, _430);
    float _438 = fma(_428, _316, _432);
    float _440 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[147].x, _434);
    float _442 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[147].y, _436);
    float _444 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[147].z, _438);
    bool _446 = !_248;
    float _464;
    if (!_446)
    {
        float _448 = in.m_53.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        _464 = _156;
    }
    _466 = false;
    float _468 = _464;
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = in.m_55.z;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = _468 + _476;
    bool _480 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _482 = isnan(_468);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _500 = 1.0 / _494;
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _504 = 1.0 / _498;
    float _506 = _442 * _472;
    float _508 = _444 * _474;
    bool _510 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _512 = isnan(_468);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -_490;
    float _524 = _522 + 1.0;
    float _526 = _478 * _500;
    bool _528 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _530 = isnan(_468);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _542 = _468 + _540;
    float _544 = _520 * _524;
    float _546 = -_520;
    float _548 = _546 + 1.0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _558;
    float _562 = _538 * _548;
    float _564 = fma(_552, _526, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _566 = fma(_556, _526, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _568 = fma(_560, _526, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _570 = _542 * _504;
    float _572 = _564 * _562;
    float _574 = _566 * _562;
    float _576 = _568 * _562;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _586 = -_538;
    float _588 = _586 + 1.0;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _594 = fma(_580, _570, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _596 = fma(_584, _570, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].x, _572);
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].y, _574);
    float _602 = fma(_592, _570, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _604 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].z, _576);
    float _606 = fma(_594, _544, _598);
    float _608 = fma(_596, _544, _600);
    float _610 = _440 * _470;
    float _612 = fma(_602, _544, _604);
    float _614 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[109].x, _606);
    float _616 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[109].y, _608);
    float _618 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[109].z, _612);
    bool _620 = !_502;
    float _638;
    if (!_620)
    {
        float _622 = in.m_53.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _156;
    }
    _640 = false;
    float _642 = _638;
    bool _644 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _646 = isnan(_642);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _662 = isnan(_642);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _642 + _676;
    float _680 = -_654;
    float _682 = _680 + 1.0;
    bool _684 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _686 = 1.0 / _658;
    float _688 = _670 * _682;
    float _690 = -_670;
    float _692 = _690 + 1.0;
    float _694 = _674 * _686;
    float _696 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_694, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _702 = _698 * _688;
    float _704 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[115].x, _702);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[116].x, _706);
    float _716 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _718 = !_684;
    float _736;
    if (!_718)
    {
        float _720 = in.m_53.x;
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _724 = _720 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _728 = _726 * _722;
        float _730 = floor(_728);
        float _732 = -_730;
        float _734 = _728 + _732;
        _736 = _734;
        _738 = true;
    }
    else
    {
        _736 = _156;
    }
    _738 = false;
    float _740 = _736;
    float _742 = in.m_53.y;
    float _744 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _746 = log2(_744);
    float _748 = in.m_53.x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = in.m_42.x;
    float _754 = in.m_42.y;
    float _756 = in.m_42.z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _762 = _760 != 0;
    float _764 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _766 = in.m_53.z;
    float _768 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _770 = _742 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _774 = fma(_770, -2.0, _750);
    float _776 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _778 = _742 * 2.0;
    float _780 = _748 * 2.0;
    float _782 = _754 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = -_758;
    float _786 = fma(_776, 2.0, _784);
    float _788 = _754 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _790 = floor(_780);
    float _792 = _754 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _794 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _796 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[5].x, _788);
    float _798 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[6].x, _792);
    float _800 = _748 + _742;
    float _802 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].z, _796);
    float _804 = floor(_778);
    float _806 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _808 = _800 + (-1.0);
    float _810 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _812 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _806);
    float _814 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _816 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _810);
    float _818 = _808;
    float _820 = _756;
    float _822 = _798;
    float _824 = _742;
    if (!_762)
    {
        _818 = _742;
    }
    float _826 = _818;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _830 = _826;
    if (_762)
    {
        _830 = _748;
    }
    float _832 = _830;
    float _834 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _812);
    bool _836 = _790 > 0.0;
    float _838 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _816);
    bool _840 = _790 >= 0.0;
    bool _842 = isnan(_790);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    float _850 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].z, _798);
    bool _852 = _804 > 0.0;
    float _854 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[83].z, _772);
    bool _856 = _804 >= 0.0;
    bool _858 = isnan(_804);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _868 = _832;
    if (!_762)
    {
        _820 = _742;
    }
    float _870 = _820;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _874 = _766 * 2.0;
    float _876 = _870;
    if (_762)
    {
        _876 = _748;
    }
    float _878 = _876;
    float _880 = rsqrt(_838);
    float _882 = _878;
    if (!_762)
    {
        _868 = _766;
    }
    float _884 = _868;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _888 = _884;
    if (!_762)
    {
        _822 = _748;
    }
    float _890 = _822;
    float _892 = _878 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _894 = _890;
    if (_762)
    {
        _894 = _766;
    }
    float _896 = _894;
    float _898 = -_100;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[76].x, _786);
    if (!_762)
    {
        _882 = _884;
    }
    float _902 = _882;
    float _904 = floor(_874);
    float _906 = _902;
    if (_762)
    {
        _906 = _742;
    }
    float _908 = _906;
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[84].z, _886);
    float _912 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _774);
    int _914 = _864 ? 0 : 1;
    float _916 = _908 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _928 = _926 != 0;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_762)
    {
        _888 = _742;
    }
    float _932 = _888;
    float _934 = fma(_916, -2.0, _828);
    float _936 = _748 + _766;
    bool _938 = !_924;
    int _940 = _938 ? 0 : 1;
    float _942 = -_930;
    float _944 = fma(_892, 2.0, _942);
    bool _946 = !_920;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[83].w, _872);
    bool _952 = !_928;
    int _954 = _952 ? 0 : 1;
    float _956 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _958 = int(_956);
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _962 = _960 != 0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _966 = _964 != 0;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _970 = _968 != 0;
    float _972 = _936 + (-1.0);
    int _974 = ~_914;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    float _980 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _910);
    float _982 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _950);
    int _984 = _848 ? 0 : 1;
    float _986 = -_100;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[81].x, _944);
    int _990 = _978;
    if (!_852)
    {
        int _992 = ~_914;
        int _994 = _992 + 1;
        _990 = _994;
    }
    int _996 = _990;
    float _998 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1000 = !_966;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = _742 + _766;
    int _1006 = ~_984;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = _834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _1014 = _1010;
    if (!_836)
    {
        int _1016 = ~_984;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = _1004 + (-1.0);
    int _1024 = abs(_1002);
    float _1026 = _746 * _100;
    float _1028 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1030 = int(_1028);
    float _1032 = float(_1020);
    float _1034 = float(_1024);
    float _1036 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1038 = float(_996);
    float _1040 = float(_958);
    float _1042 = _1034 * _1032;
    float _1044 = exp2(_1026);
    float _1046 = in.m_57.x;
    float _1048 = in.m_57.y;
    float _1050 = in.m_57.z;
    float _1052 = _1042 * (-2.0);
    bool _1054 = !_970;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1060 = 1.0 + _1058;
    float _1062 = 1.0 / _1040;
    int _1064 = abs(_1056);
    float _1066 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _854);
    bool _1068 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1070 = isnan(0.0);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1076 = _1072 || _1074;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1080 = _904 > 0.0;
    bool _1082 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1084 = isnan(1.0);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1090 = _1086 || _1088;
    float _1092 = 1.0 / _1060;
    float _1094 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1078);
    float _1096 = float(_1064);
    bool _1098 = _904 >= 0.0;
    bool _1100 = isnan(_904);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1110 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1094);
    float _1112 = _1062 * _100;
    float _1114 = _1096 * _1038;
    float _1116 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1108);
    float _1118 = -_1044;
    float _1120 = _1118 + 1.0;
    float _1122 = fma(_1052, _1048, _1048);
    float _1124 = float(_1030);
    float _1126 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1128 = _1106 ? 0 : 1;
    float _1130 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1116);
    float _1132 = _1076 ? _1120 : 0.0;
    float _1134 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _934);
    float _1136 = fma(_1036, _1052, _1036);
    float _1138 = _742 + (-0.5);
    float _1140 = _1126 * _1126;
    float _1142 = _1124 * _100;
    int _1144 = ~_1128;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1122);
    float _1152 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    int _1154 = _1148;
    if (_1090)
    {
        float _1156 = _1132 * _1092;
        _110 = _1156;
    }
    float _1158 = _110;
    if (!_1080)
    {
        int _1160 = ~_1128;
        int _1162 = _1160 + 1;
        _1154 = _1162;
    }
    int _1164 = _1154;
    float _1166 = _1114 * (-2.0);
    float _1168 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1170 = fma(_1152, _1152, _1140);
    bool _1172 = !_962;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = fma(_1166, _1050, _1050);
    float _1178 = fma(_998, _1166, _998);
    float _1180 = fma(_1168, _1168, _1170);
    int _1182 = abs(_1174);
    float _1184 = _866 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1186 = _802 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1188 = _766 + (-0.5);
    float _1190 = float(_1164);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1192;
    float _1196 = float(_1182);
    float _1198 = fma(_1136, _1158, _1150);
    float _1200 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1176);
    float _1204 = _850 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1206 = _1196 * _1190;
    float _1208 = 1.0 / _1194;
    float _1210 = in.m_59.x;
    float _1212 = in.m_59.y;
    float _1214 = in.m_59.z;
    float _1216 = fma(_1178, _1158, _1202);
    float _1218 = _1206 * (-2.0);
    float _1220 = _1198 * 0.15915493667125701904296875;
    float _1222 = _1216 * 0.15915493667125701904296875;
    float _1224 = fma(_1218, _1046, _1046);
    float _1226 = _748 + (-0.5);
    float _1228 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1200);
    float _1230 = fma(_814, _1218, _814);
    float _1232 = rsqrt(_1180);
    float _1234 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1224);
    float _1236 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1228);
    float _1238 = fma(_1230, _1158, _1234);
    float _1240 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1242 = _1222 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = _1238 * 0.15915493667125701904296875;
    float _1248 = -_1240;
    float _1250 = _1012 + _1248;
    bool _1252 = _1240 >= _1012;
    bool _1254 = isnan(_1240);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan(_1012);
    bool _1260 = _1256 || _1258;
    float _1262 = abs(_1250);
    float _1264 = precise::max(_1262, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1266 = _1220 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    bool _1270 = !_1260;
    float _1272 = _1270 ? 1.0 : (-1.0);
    float _1274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1214);
    float _1276 = precise::min(_1264, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1278 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1280 = _1126 * _1232;
    float _1282 = _1220 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = _1246 * 6.283185482025146484375;
    float _1288 = sin(_1286);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1292 = _1276 + _1290;
    float _1294 = _1292 * _1208;
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1210);
    float _1298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1212);
    float _1300 = _1246 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1272 * _1294;
    float _1306 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1308 = _1278 * _1296;
    float _1310 = _764 * _1298;
    float _1312 = _768 * _1274;
    float _1314 = _1306 * _1304;
    float _1316 = _1152 * _1232;
    float _1318 = _1222 * 6.283185482025146484375;
    float _1320 = sin(_1318);
    float _1322 = _1244 * _1310;
    float _1324 = _1288 * _1268;
    float _1326 = _1314 * 0.15915493667125701904296875;
    float _1328 = _1168 * _1232;
    float _1330 = _1284 * _1244;
    float _1332 = _1268 * _1244;
    float _1334 = _1302 * _1284;
    float _1336 = _1288 * _1284;
    float _1338 = _1326 * 6.283185482025146484375;
    float _1340 = cos(_1338);
    float _1342 = -_1310;
    float _1344 = _1320 * _1342;
    float _1346 = _1302 * _1268;
    float _1348 = _1302 * _1322;
    float _1350 = fma(_1320, _1334, _1324);
    float _1352 = fma(_1330, _1308, _1344);
    float _1354 = -_1336;
    float _1356 = fma(_1320, _1346, _1354);
    float _1358 = _1288 * _1322;
    float _1360 = fma(_1350, _1308, _1348);
    float _1362 = -_1346;
    float _1364 = fma(_1320, _1336, _1362);
    float _1366 = _1326 * 6.283185482025146484375;
    float _1368 = sin(_1366);
    float _1370 = fma(_1320, _1324, _1334);
    float _1372 = fma(_1356, _1312, _1360);
    float _1374 = fma(_1332, _1312, _1352);
    float _1376 = fma(_1364, _1308, _1358);
    float _1378 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1382 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1384 = fma(_1370, _1312, _1376);
    float _1386 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1378);
    float _1388 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1380);
    float _1390 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1382);
    float _1392 = -_1340;
    float _1394 = _1392 + 1.0;
    float _1396 = _1328 * _1328;
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1388);
    float _1400 = _1316 * _1368;
    float _1402 = _1280 * _1394;
    float _1404 = _1280 * _1368;
    float _1406 = fma(_1394, _1396, _1340);
    float _1408 = _1328 * _1368;
    float _1410 = _1316 * _1394;
    float _1412 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1386);
    float _1414 = fma(_1328, _1402, _1400);
    float _1416 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1418 = -_1408;
    float _1420 = fma(_1280, _1410, _1418);
    float _1422 = -_1404;
    float _1424 = fma(_1328, _1410, _1422);
    float _1426 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1428 = _1416 * _1414;
    float _1430 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1390);
    float _1432 = fma(_1316, _1410, _1340);
    float _1434 = _1416 * _1420;
    float _1436 = fma(_1426, _1424, _1428);
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1440 = fma(_1280, _1402, _1340);
    float _1442 = fma(_1426, _1432, _1434);
    float _1444 = fma(_1328, _1410, _1404);
    float _1446 = fma(_1438, _1406, _1436);
    float _1448 = fma(_1280, _1410, _1408);
    float _1450 = _1416 * _1440;
    float _1452 = fma(_1438, _1444, _1442);
    float _1454 = _1204 + _1446;
    float _1456 = -_1400;
    float _1458 = fma(_1328, _1402, _1456);
    float _1460 = fma(_1426, _1448, _1450);
    float _1462 = _1184 + _1452;
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1466 = _1454 + _1464;
    float _1468 = fma(_1438, _1458, _1460);
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1472 = _1462 + _1470;
    float _1474 = _1466 * _1466;
    float _1476 = _1186 + _1468;
    float _1478 = fma(_1472, _1472, _1474);
    float _1480 = sqrt(_1478);
    bool _1482 = _1480 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1484 = _1458;
    float _1486 = _1328;
    float _1488 = _1448;
    float _1490 = _1480;
    float _1492 = _1462;
    if (!_1482)
    {
        _1484 = _1462;
    }
    float _1494 = _1484;
    float _1496 = _1494;
    if (!_1482)
    {
        _1486 = _1454;
    }
    float _1498 = _1486;
    float _1500 = _1498;
    if (!_1482)
    {
        _1488 = _1476;
    }
    float _1502 = _1488;
    bool _1504 = !_1482;
    float _1506 = _1502;
    if (!_1504)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1512 = _1480 + _1510;
        float _1514 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1516 = rsqrt(_1478);
        float _1518 = _1512 * _1508;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1520 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = _1520 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        float _1530 = _1524 + (-1.0);
        float _1532 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = fma(_1528, _1514, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1536 = fma(_1476, _1524, _1532);
        float _1538 = _1516 * _1534;
        float _1540 = fma(_1472, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1542 = fma(_1466, _1538, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1506 = _1536;
        _1496 = _1540;
        _1500 = _1542;
    }
    float _1544 = _1506;
    float _1546 = _1496;
    float _1548 = _1500;
    float _1550 = -_1186;
    float _1552 = _1550 + _1544;
    float _1554 = -_1184;
    float _1556 = _1554 + _1546;
    float _1558 = -_1204;
    float _1560 = _1558 + _1548;
    float _1562 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1564 = _1552 * _1552;
    float _1566 = fma(_1556, _1556, _1564);
    float _1568 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1562);
    float _1570 = fma(_1560, _1560, _1566);
    float _1572 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1568);
    float _1574 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1576 = sqrt(_1570);
    float _1578 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1580 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1574);
    float _1582 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1580);
    bool _1584 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan(0.5);
    bool _1592 = _1588 || _1590;
    float _1594 = 1.0 / _1578;
    float _1596 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1598 = _1596 + _1578;
    bool _1600 = _1576 > 0.0;
    bool _1602 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan(0.5);
    bool _1610 = _1606 || _1608;
    float _1612 = _1598 * _1594;
    float _1614 = _1612 * 0.5;
    bool _1616 = !_1600;
    float _1618 = _1546;
    float _1620 = _1544;
    float _1622 = _1548;
    float _1624 = _1556;
    if (!_1616)
    {
        float _1626 = _172 * _172;
        float _1628 = rsqrt(_1570);
        float _1630 = fma(_170, _170, _1626);
        float _1632 = fma(_174, _174, _1630);
        float _1634 = sqrt(_1632);
        float _1636 = _1552 * _1628;
        float _1638 = _1560 * _1628;
        bool _1640 = _1634 > 0.0;
        float _1642 = _1556 * _1628;
        bool _1644 = !_1640;
        if (!_1644)
        {
            float _1646 = rsqrt(_1632);
            float _1648 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1650 = _172 * _1646;
            float _1652 = _170 * _1646;
            float _1654 = _1636 * _1650;
            float _1656 = _174 * _1646;
            float _1658 = fma(_1642, _1652, _1654);
            float _1660 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1662 = fma(_1638, _1656, _1658);
            float _1664 = _1662 * _1660;
            float _1666 = fma(_170, _1664, _1546);
            float _1668 = fma(_172, _1664, _1544);
            float _1670 = fma(_174, _1664, _1548);
            _1618 = _1666;
            _1620 = _1668;
            _1622 = _1670;
            _1624 = _1660;
        }
    }
    float _1672 = _1618;
    float _1674 = _1620;
    float _1676 = _1622;
    float _1678 = _1624;
    float _1680 = _1674;
    float _1682 = _1672;
    float _1684 = _1676;
    float _1686 = _1678;
    if (_1610)
    {
        _1490 = 1.0;
    }
    float _1688 = _1490;
    float _1690 = _1688;
    if (!_1592)
    {
        float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1694 = _1186 + _1692;
        float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1698 = _1184 + _1696;
        float _1700 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1702 = -_1184;
        float _1704 = _1702 + _1672;
        float _1706 = _1694 * _1694;
        float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1710 = _1204 + _1708;
        float _1712 = -_1186;
        float _1714 = _1712 + _1674;
        float _1716 = fma(_1698, _1698, _1706);
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1720 = fma(_1710, _1710, _1716);
        float _1722 = sqrt(_1720);
        float _1724 = _1700 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1726 = precise::min(_1722, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1728 = _1726 * _1718;
        float _1730 = _1724 * _1728;
        float _1732 = -_1204;
        float _1734 = _1732 + _1676;
        float _1736 = fma(_1704, _1730, _1184);
        float _1738 = fma(_1714, _1730, _1186);
        float _1740 = fma(_1734, _1730, _1204);
        _1680 = _1738;
        _1682 = _1736;
        _1684 = _1740;
    }
    float _1742 = _1680;
    float _1744 = _1682;
    float _1746 = _1684;
    if (!_1610)
    {
        float _1748 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1752 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1750);
        float _1754 = _1748 * 0.15915493667125701904296875;
        float _1756 = _1754 * 6.283185482025146484375;
        float _1758 = cos(_1756);
        float _1760 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1762 = _1760 * 0.15915493667125701904296875;
        float _1764 = _1754 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = 1.0 / _1758;
        float _1770 = _1762 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = 1.0 / _1752;
        float _1778 = _1772 * _1774;
        float _1780 = _1762 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1786 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1784;
        float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1790 = _1776 * _1788;
        float _1792 = 1.0 / _1778;
        float _1794 = 1.0 / _1786;
        float _1796 = _1782 * _1792;
        float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1800 = fma(_1796, _1790, _1798);
        float _1802 = _1800 * _1794;
        float _1804 = precise::clamp(_1802, 0.0, 1.0);
        _1686 = _1762;
        _1690 = _1804;
    }
    float _1806 = _1686;
    float _1808 = _1690;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1812 = _1742 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1816 = _1744 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1820 = _1746 + _1818;
    float _1822 = _1812 * _1812;
    float _1824 = fma(_1816, _1816, _1822);
    float _1826 = fma(_1820, _1820, _1824);
    float _1828 = rsqrt(_1826);
    float _1830 = sqrt(_1826);
    float _1832 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1834 = _1816 * _1832;
    float _1836 = _1820 * _1832;
    float _1838 = _1834 * _1834;
    float _1840 = _1836 * _1836;
    float _1842 = _1838 + _1840;
    float _1844 = sqrt(_1842);
    bool _1846 = _1844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1850 = _1844 + _1848;
    float _1852 = _1820;
    float _1854 = _1842;
    float _1856 = _1850;
    float _1858 = _1806;
    float _1860 = _1812;
    if (_1846)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1852 = _1862;
    }
    float _1864 = _1852;
    if (_1846)
    {
        float _1866 = rsqrt(_1842);
        _1854 = _1866;
    }
    float _1868 = _1854;
    float _1870 = _1868;
    if (_1846)
    {
        float _1872 = _1850 * _1864;
        _1856 = _1872;
    }
    float _1874 = _1856;
    if (_1846)
    {
        float _1876 = _1874 * 0.15915493667125701904296875;
        _1858 = _1876;
    }
    float _1878 = _1858;
    float _1880 = _1864;
    float _1882 = _1878;
    if (_1846)
    {
        float _1884 = _1878 * 6.283185482025146484375;
        float _1886 = sin(_1884);
        _1880 = _1886;
    }
    float _1888 = _1880;
    float _1890 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1892 = precise::max(0.0, _1890);
    float _1894 = _1822;
    float _1896 = _1892;
    if (_1846)
    {
        float _1898 = _1878 * 6.283185482025146484375;
        float _1900 = cos(_1898);
        _1894 = _1900;
    }
    float _1902 = _1894;
    float _1904 = -_1832;
    float _1906 = -_1892;
    float _1908 = fma(_1812, _1904, _1906);
    if (_1846)
    {
        float _1910 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1910;
    }
    float _1912 = _1896;
    float _1914 = _1888;
    float _1916 = _1912;
    if (_1846)
    {
        float _1918 = fma(_1888, _1912, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1860 = _1918;
    }
    float _1920 = _1860;
    float _1922 = _1920;
    if (!_1846)
    {
        _1914 = _1834;
    }
    float _1924 = _1914;
    float _1926 = _1924;
    float _1928 = _1902;
    if (_1846)
    {
        float _1930 = _1902 + (-1.0);
        _1916 = _1930;
    }
    float _1932 = _1916;
    float _1934 = _1932;
    if (_1846)
    {
        float _1936 = _1868 * _1920;
        _1492 = _1936;
    }
    float _1938 = _1492;
    if (!_1846)
    {
        _1922 = _1908;
    }
    float _1940 = _1922;
    float _1942 = _1940;
    if (_1846)
    {
        float _1944 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1944;
    }
    float _1946 = _1882;
    if (_1846)
    {
        float _1948 = _1834 * _1938;
        _1926 = _1948;
    }
    float _1950 = _1926;
    if (!_1846)
    {
        _1934 = _1836;
    }
    float _1952 = _1934;
    float _1954 = _1952;
    if (_1846)
    {
        float _1956 = _1836 * _1938;
        _1954 = _1956;
    }
    float _1958 = _1954;
    if (!_1846)
    {
        _1870 = _1838;
    }
    float _1960 = _1870;
    float _1962 = _1960;
    if (_1846)
    {
        float _1964 = fma(_1908, _1902, _1946);
        _1942 = _1964;
    }
    float _1966 = _1942;
    if (_1846)
    {
        float _1968 = _1950 * _1950;
        _1962 = _1968;
    }
    float _1970 = _1962;
    if (!_1846)
    {
        _1928 = _1840;
    }
    float _1972 = _1928;
    float _1974 = _1972;
    if (_1846)
    {
        float _1976 = _1958 * _1958;
        _1974 = _1976;
    }
    float _1978 = _1974;
    float _1980 = fma(_1966, _1966, _1970);
    float _1982 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1984 = _1980 + _1978;
    float _1986 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1990 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1988);
    float _1992 = precise::clamp(_1990, 0.0, 1.0);
    float _1994 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1996 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1998 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1986);
    float _2000 = rsqrt(_1984);
    float _2002 = -_1992;
    float _2004 = _2002 + 1.0;
    float _2006 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1994);
    float _2008 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1998);
    float _2010 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2012 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1982);
    float _2014 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2006);
    float _2016 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2018 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2010);
    float _2020 = abs(_2004);
    float _2022 = log2(_2020);
    float _2024 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2026 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2028 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2018);
    float _2030 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2032 = -_2026;
    float _2034 = fma(_2032, _1996, 1.0);
    float _2036 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2038 = _2000 * _1950;
    float _2040 = _2000 * _1966;
    float _2042 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2012);
    float _2044 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2030);
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2048 = _2000 * _1958;
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2052 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2044);
    float _2054 = -_2046;
    float _2056 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2054);
    float _2058 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2060 = log2(_2034);
    float _2062 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2052);
    float _2064 = -_2048;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2056);
    float _2068 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2070 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = fma(_2066, -0.5, 0.5);
    float _2074 = fma(_2066, 0.5, 0.5);
    float _2076 = exp2(_2058);
    float _2078 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2068);
    float _2080 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2082 = _2040 + 1.0;
    float _2084 = fma(_2074, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2086 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2078);
    float _2088 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2080);
    float _2090 = 1.0 / _2062;
    float _2092 = _2060 * 0.693147182464599609375;
    float _2094 = fma(_2074, _2084, -0.212114393711090087890625);
    float _2096 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2098 = fma(_2074, _2094, 1.570728778839111328125);
    float _2100 = sqrt(_2072);
    float _2102 = -_2040;
    float _2104 = fma(_2076, _2082, _2102);
    float _2106 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2108 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2088);
    float _2110 = fma(_2104, 0.5, 0.5);
    float _2112 = _2108 * _2090;
    float _2114 = _2106 * _2090;
    float _2116 = fma(_2114, 0.5, 0.5);
    float _2118 = _2100 * 0.636619746685028076171875;
    float _2120 = fma(_2112, -0.5, 0.5);
    float _2122 = -_2098;
    float _2124 = fma(_2118, _2122, 1.0);
    float3 _6171 = float3(_2116, _2120, _2096);
    float _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).x;
    float3 _6182 = float3(_2116, _2120, _2096);
    float4 _2129 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6182, float3(0.0), isnan(_6182)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6182, float3(0.0), isnan(_6182)), level(0.0)).xyzw;
    float _2131 = _2129.x;
    float _2133 = _2129.y;
    float _2135 = _2129.z;
    float _2137 = _2129.w;
    float2 _6199 = float2(_2124, _2110);
    float3 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6199, float2(0.0), isnan(_6199)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6199, float2(0.0), isnan(_6199)), level(0.0)).xyz;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = float(uint(_1030));
    float _2151 = trunc(_1112);
    int _2153 = int(_2151);
    int _2155 = ~_1030;
    int _2157 = _2155 + 1;
    float _2159 = _1142 * _152;
    int _2161 = ~_1030;
    int _2163 = _2161 + 1;
    float _2165 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2167 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _708;
    out.m_61.y = _710;
    out.m_61.z = _712;
    out.m_61.w = _716;
    float _2169 = 1.0 / _2149;
    float _2171 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2167);
    out.m_63.x = _1744;
    out.m_63.y = _1742;
    out.m_63.z = _1746;
    float _2173 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2171);
    float _2175 = float(uint(_2153));
    float _2177 = trunc(_2159);
    int _2179 = int(_2177);
    float _2181 = float(_2153);
    float _2183 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2173);
    int _2185 = as_type<int>(_2169) + (-2);
    float _2187 = exp2(_2165);
    out.gl_Position.x = _2106;
    out.gl_Position.y = _2108;
    out.gl_Position.z = _2183;
    out.gl_Position.w = _2062;
    float _2189 = as_type<float>(_2185) * _2175;
    float _2191 = trunc(_2189);
    float _2193 = precise::max(_2191, 0.0);
    uint _2196 = uint(_2193);
    float _2198 = -_2187;
    float _2200 = _2198 + 1.0;
    float _2202 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2204 = _2157 * int(_2196);
    int _2206 = _2204 + _2153;
    float _2208 = float(uint(_2206));
    float _2210 = as_type<float>(_2185) * _2208;
    bool _2212 = !_762;
    float _2214 = _2212 ? 7.345489978790283203125 : 1.0;
    float _2216 = trunc(_2210);
    float _2218 = precise::max(_2216, 0.0);
    uint _2220 = uint(_2218);
    float _2222 = _2214 * _748;
    bool _2224 = _2181 >= _1124;
    bool _2226 = isnan(_2181);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan(_1124);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = floor(_2222);
    int _2238 = int(_2196) + int(_2220);
    float _2240 = trunc(_2234);
    int _2242 = int(_2240);
    int _2244 = _2163 * _2238;
    int _2246 = _2244 + _2153;
    float _2248 = -_2236;
    float _2250 = _2222 + _2248;
    bool _2252 = uint(_2246) >= uint(_1030);
    float _2254 = _2250 * _1124;
    bool _2256 = !_2252;
    int _2258 = _2256 ? 0 : (-1);
    bool _2260 = _1030 == 0;
    float _2262 = trunc(_2254);
    int _2264 = int(_2262);
    int _2266 = ~_2238;
    int _2268 = _2266 + _2258;
    int _2270 = _2268 + 1;
    int _2272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2274 = _2272 != 0;
    int _2276 = ~_2242;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _1030 * _2270;
    int _2284 = _2282 + _2153;
    bool _2286 = !_2274;
    int _2288 = _2286 ? 0 : 1;
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2292 = _2290 != 0;
    bool _2294 = !_2260;
    int _2296 = _2294 ? _2284 : (-1);
    int _2298 = _1030 + (-1);
    int _2300 = abs(_940);
    int _2302 = _2296 * _2280;
    int _2304 = abs(_2288);
    int _2306 = abs(_948);
    int _2308 = _2242 * _2298;
    int _2310 = _2308 + _2302;
    int _2312 = _2264 * _2304;
    int _2314 = _2312 + _2153;
    int _2316 = abs(_954);
    int _2318 = _2310 * _2300;
    bool _2320 = !_2292;
    int _2322 = _2320 ? 0 : 1;
    int _2324 = _2179 * _2306;
    int _2326 = _2324 + _2318;
    int _2328 = abs(_2322);
    float _2330 = in.m_65.y;
    int _2332 = ~_1030;
    int _2334 = _2332 + 1;
    int _2336 = _2314 * _2316;
    int _2338 = _2336 + _2326;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2342 = _2340 != 0;
    int _2344 = _2264 * _2328;
    int _2346 = _2344 + _2338;
    int _2348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2350 = _2348 != 0;
    float _2352 = in.m_65.x;
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2356 = _2354 != 0;
    float _2358 = float(uint(_2346));
    int _2360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2362 = _2360 != 0;
    int _2364 = ~_1030;
    int _2366 = _2364 + 1;
    float _2368 = as_type<float>(_2185) * _2358;
    int _2370 = ~_1030;
    int _2372 = _2370 + 1;
    float _2374 = trunc(_2368);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    int _2380 = _2280;
    float _2382 = _2330;
    int _2384 = _2185;
    float _2386 = _2352;
    if (_2362)
    {
        float _2388 = -_2352;
        float _2390 = _2388 + 1.0;
        _2380 = as_type<int>(_2390);
    }
    int _2392 = _2380;
    int _2394 = _2372 * int(_2378);
    int _2396 = _2394 + _2346;
    float _2398 = float(uint(_2396));
    float _2400 = as_type<float>(_2185) * _2398;
    float _2402 = in.m_53.w;
    float _2404 = trunc(_2400);
    float _2406 = precise::max(_2404, 0.0);
    uint _2408 = uint(_2406);
    float _2410 = -_2330;
    float _2412 = _2410 + 1.0;
    int _2414 = int(_2378) + int(_2408);
    bool _2416 = _2402 > 0.5;
    float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2420 = _2418 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2422 = float(uint(_2314));
    int _2424 = _2334 * _2414;
    int _2426 = _2424 + _2346;
    int _2428 = _2416 ? as_type<int>(_2412) : as_type<int>(_2330);
    bool _2430 = _742 > 0.5;
    float _2432 = 1.0 / _2420;
    bool _2434 = uint(_2426) >= uint(_1030);
    float _2436 = as_type<float>(_2185) * _2422;
    bool _2438 = _2430;
    if (!_2342)
    {
        _824 = _2352;
    }
    float _2440 = _824;
    bool _2442 = !_2434;
    int _2444 = _2442 ? 0 : (-1);
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2448 = _2446 != 0;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2450;
    int _2454 = ~_2414;
    int _2456 = _2454 + _2444;
    int _2458 = _2456 + 1;
    float _2460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2462 = _2448 ? as_type<float>(_2428) : _2330;
    bool _2464 = _2448;
    float _2466 = _2440;
    if (_2342)
    {
        bool _2468 = _748 > 0.5;
        _2464 = _2468;
    }
    bool _2470 = _2464;
    int _2472 = _1030 * _2458;
    int _2474 = _2472 + _2346;
    if (_2350)
    {
        float _2476 = _2430 ? _2412 : _2330;
        _2382 = _2476;
    }
    float _2478 = _2382;
    float _2480 = _2452 * _2432;
    float _2482 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2484 = _740 + _2482;
    bool _2486 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2488 = isnan(_740);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2494 = _2490 || _2492;
    float _2496 = float(_2494);
    float _2498 = trunc(_2436);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    bool _2504 = !_2260;
    int _2506 = _2504 ? _2474 : (-1);
    float _2508 = fma(_2480, _2484, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_2362)
    {
        bool _2510 = _766 > 0.5;
        _2438 = _2510;
    }
    bool _2512 = _2438;
    float _2514 = -_2496;
    float _2516 = _2514 + 1.0;
    int _2518 = _2506 >> 31;
    float _2520 = _980 * (-0.15915493667125701904296875);
    bool _2522 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2524 = isnan(_740);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2530 = _2526 || _2528;
    float _2532 = float(_2530);
    float _2534 = _2460 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2536 = _2518 & 3;
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2540 = _2532 * _2516;
    int _2542 = _2506 + _2536;
    float _2544 = fma(_2462, _2534, -0.5);
    float _2546 = -_2532;
    float _2548 = _2546 + 1.0;
    float _2550 = _2508 * _2540;
    int _2552 = _2542 >> 2;
    int _2554 = _2366 * int(_2502);
    int _2556 = _2554 + _2314;
    float _2558 = _2520 * 6.283185482025146484375;
    float _2560 = sin(_2558);
    float _2562 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2550);
    int _2564 = _2552 << 4;
    int _2566 = _2564 + 368;
    float _2568 = float(uint(_2556));
    float _2570 = fma(_2496, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2562);
    uint _2572 = uint(int(uint(_2566) >> uint(2)));
    uint _2574 = uint(int(uint(int(_2572)) >> uint(2)));
    int _2576 = int(_2572) & 3;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[int(_2574)][_2576];
    int _2580 = int(_2572) + 1;
    uint _2582 = uint(int(uint(_2580) >> uint(2)));
    int _2584 = _2580 & 3;
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[int(_2582)][_2584];
    float _2588 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2590 = _2520 * 6.283185482025146484375;
    float _2592 = cos(_2590);
    float _2594 = as_type<float>(_2185) * _2568;
    if (_2342)
    {
        float _2596 = -_2352;
        float _2598 = _2596 + 1.0;
        _2384 = as_type<int>(_2598);
    }
    int _2600 = _2384;
    float _2602 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2604 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2478, -0.5);
    float _2606 = trunc(_2594);
    float _2608 = precise::max(_2606, 0.0);
    uint _2610 = uint(_2608);
    int _2612 = _2566 + 8;
    uint _2614 = uint(int(uint(_2612) >> uint(2)));
    uint _2616 = uint(int(uint(int(_2614)) >> uint(2)));
    int _2618 = int(_2614) & 3;
    float _2620 = (*spvDescriptorSet0.vp_c9)._m0[int(_2616)][_2618];
    int _2622 = int(_2614) + 1;
    uint _2624 = uint(int(uint(_2622) >> uint(2)));
    int _2626 = _2622 & 3;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[int(_2624)][_2626];
    if (_2342)
    {
        float _2630 = _2470 ? as_type<float>(_2600) : _2352;
        _2466 = _2630;
    }
    float _2632 = _2466;
    float _2634 = -_912;
    float _2636 = fma(_1130, _2604, _2634);
    if (_2362)
    {
        float _2638 = _2512 ? as_type<float>(_2392) : _2352;
        _2386 = _2638;
    }
    float _2640 = _2386;
    out.m_67.w = _2602;
    int _2642 = _2506 & 3;
    bool _2644 = _2642 != 0;
    float _2646 = fma(_2588, _2640, -0.5);
    bool _2648 = uint(_2642) > 1u;
    int _2650 = ~_1030;
    int _2652 = _2650 + 1;
    float _2654 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2656 = _2506 & 3;
    bool _2658 = _2656 != 0;
    int _2660 = int(_2502) + int(_2610);
    float _2662 = fma(_1110, _2654, _900);
    float _2664 = _2560 * _2544;
    int _2666 = _2658 ? 0 : 1;
    float _2668 = _2592 * _2544;
    bool _2670 = _2642 != 3;
    int _2672 = _2652 * _2660;
    int _2674 = _2672 + _2314;
    int _2676 = ~_2666;
    int _2678 = _2676 + 1;
    int _2680 = _2678 + 1;
    float _2682 = fma(_2560, _2646, _2668);
    int _2684 = _2680;
    if (!_2648)
    {
        int _2686 = ~_2666;
        int _2688 = _2686 + 1;
        _2684 = _2688;
    }
    int _2690 = _2684;
    float _2692 = -_2664;
    float _2694 = fma(_2592, _2646, _2692);
    bool _2696 = uint(_2642) >= 2u;
    float _2698 = _2202 * _2126;
    bool _2700 = !_2644;
    int _2702 = _2700 ? 0 : 1;
    float _2704 = fma(_1066, _2694, _988);
    bool _2706 = _2642 != 3;
    float _2708 = _2137 * _2698;
    int _2710 = abs(_2690);
    float _2712 = -_1134;
    float _2714 = fma(_982, _2682, _2712);
    int _2716 = _2696 ? 0 : 1;
    float _2718 = -_2202;
    float _2720 = _2718 + 1.0;
    bool _2722 = uint(_2674) >= uint(_1030);
    bool _2724 = !_2356;
    int _2726 = _2724 ? 0 : 1;
    float _2728 = _2147 * _2698;
    int _2730 = abs(_2702);
    float _2732 = fma(_2143, _2708, _2131);
    bool _2734 = !_2706;
    int _2736 = _2734 ? 0 : (-1);
    float _2738 = _2662 + 0.5;
    int _2740 = ~_2710;
    int _2742 = _2740 + 1;
    int _2744 = _2742 + 1;
    float _2746 = _2714 + 0.5;
    int _2748 = ~_2716;
    int _2750 = _2748 + 1;
    int _2752 = _2750 + 1;
    float _2754 = fma(_2145, _2708, _2133);
    int _2756 = _2752;
    if (_2670)
    {
        int _2758 = ~_2716;
        int _2760 = _2758 + 1;
        _2756 = _2760;
    }
    int _2762 = _2756;
    int _2764 = _2744 * as_type<int>(_2586);
    int _2766 = abs(_2736);
    float _2768 = fma(_2137, _2728, _2135);
    int _2770 = ~_2730;
    int _2772 = _2770 + 1;
    int _2774 = _2772 + 1;
    int _2776 = abs(_2726);
    int _2778 = abs(_2762);
    int _2780 = _2774 * as_type<int>(_2578);
    int _2782 = _2780 + _2764;
    bool _2784 = !_2722;
    int _2786 = _2784 ? 0 : (-1);
    int _2788 = ~_2778;
    int _2790 = _2788 + 1;
    int _2792 = _2790 + 1;
    int _2794 = ~_2660;
    int _2796 = _2794 + _2786;
    int _2798 = _2796 + 1;
    int _2800 = ~_2766;
    int _2802 = _2800 + 1;
    int _2804 = _2802 + 1;
    int _2806 = _2792 * as_type<int>(_2620);
    int _2808 = _2806 + _2782;
    int _2810 = ~_2776;
    int _2812 = _2810 + 1;
    int _2814 = _2812 + 1;
    int _2816 = _1030 * _2798;
    int _2818 = _2816 + _2314;
    float _2820 = _2636 + 0.5;
    int _2822 = _2804 * as_type<int>(_2628);
    int _2824 = _2822 + _2808;
    float _2826 = _2704 + 0.5;
    bool _2828 = !_2260;
    int _2830 = _2828 ? _2818 : (-1);
    int _2832 = _2824 * _2814;
    bool _2834 = _1808 > 0.0;
    bool _2836 = isnan(_1808);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan(0.0);
    bool _2842 = _2838 || _2840;
    float _2844 = _1808 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _2738;
    out.m_69.y = _2820;
    out.m_69.z = _2826;
    out.m_69.w = _2746;
    int _2846 = _2830 * _2776;
    int _2848 = _2846 + _2832;
    float _2850 = _2183 + _2062;
    float _2852 = _2844 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2854 = float(_2848);
    float _2856 = _2850 * 0.5;
    out.m_49.x = _2852;
    out.m_71.x = _2854;
    out.m_73.z = _2856;
    out.m_73.w = _2062;
    float _2858 = _2137 * _2720;
    out.m_75.x = _2732;
    out.m_75.y = _2754;
    out.m_75.z = _2768;
    out.m_75.w = _2858;
    if (_2842)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2860 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2860;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

